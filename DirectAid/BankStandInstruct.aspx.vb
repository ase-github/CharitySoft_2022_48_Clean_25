Imports System.Web.Services.Description
Imports DirectAid.datalib
Imports System.Globalization
Imports System.Data
Imports System.Threading
Public Class BankStandInstruct
    Inherits BaseWebForm
    'Private _charitysoftEntities As New charitysoftEntities
    'Private _StandInstruct As standing_instruction
    'Private _instructDet As instruction_dist
    'Private _donor As Donor
    'Private _donors As List(Of Donor)
    'Private _receipt As DonationTranaction
    'Private _Donations As IList(Of Donation)
    'Private _DonationsDist As IList(Of DonationDist)
    'Private _PaymentMethodDist As IList(Of PaymentMethodDist)
    Private _totalDonation As Decimal
    Private _totalPayment As Decimal
    Private _totalDonations As Decimal
    Private _totalWaqf As Decimal
    Private _ws As New DataAccessLibrary
    Protected myInstructDistDataTable As DataTable
    Protected myInstructDistributionTable As DataTable
    Protected myInstructDistDataRow As DataRow
    Protected myInstructDistDataColumn As DataColumn
    Protected _culture As String

    Private Sub InitializeInstructDistDataTable()
        'Create DataTable that represents the add_idv Table in the DB Or the Addresses Table
        myInstructDistDataTable = New DataTable("instruction_dist")

        'Create DataColumn for every column in the DB table

        'Use these 2 column in inserting
        myInstructDistDataColumn = New DataColumn()
        myInstructDistDataColumn.DataType = System.Type.GetType("System.Int32")
        myInstructDistDataColumn.ColumnName = "ref_numb"
        myInstructDistDataColumn.Caption = "Ref No"
        myInstructDistDataTable.Columns.Add(myInstructDistDataColumn)

        myInstructDistDataColumn = New DataColumn()
        myInstructDistDataColumn.DataType = System.Type.GetType("System.Int16")
        myInstructDistDataColumn.ColumnName = "donation_code"
        myInstructDistDataColumn.Caption = "Donation Code"
        myInstructDistDataTable.Columns.Add(myInstructDistDataColumn)

        myInstructDistDataColumn = New DataColumn()
        myInstructDistDataColumn.DataType = System.Type.GetType("System.String")
        myInstructDistDataColumn.ColumnName = "donation_descrar"
        myInstructDistDataColumn.Caption = "Donation Name"
        myInstructDistDataTable.Columns.Add(myInstructDistDataColumn)

        myInstructDistDataColumn = New DataColumn()
        myInstructDistDataColumn.DataType = System.Type.GetType("System.Decimal")
        myInstructDistDataColumn.ColumnName = "instruct_value"
        myInstructDistDataColumn.Caption = "Value"
        myInstructDistDataTable.Columns.Add(myInstructDistDataColumn)

        myInstructDistDataColumn = New DataColumn()
        myInstructDistDataColumn.DataType = System.Type.GetType("System.Decimal")
        myInstructDistDataColumn.ColumnName = "quantity"
        myInstructDistDataColumn.Caption = "Qty"
        myInstructDistDataTable.Columns.Add(myInstructDistDataColumn)

        myInstructDistDataColumn = New DataColumn()
        myInstructDistDataColumn.DataType = System.Type.GetType("System.Decimal")
        myInstructDistDataColumn.ColumnName = "totAmnt"
        myInstructDistDataColumn.Caption = "Total"
        myInstructDistDataTable.Columns.Add(myInstructDistDataColumn)


        myInstructDistDataColumn = New DataColumn()
        myInstructDistDataColumn.DataType = System.Type.GetType("System.Int16")
        myInstructDistDataColumn.ColumnName = "nat_code"
        myInstructDistDataColumn.Caption = "Country"
        myInstructDistDataTable.Columns.Add(myInstructDistDataColumn)

        myInstructDistDataColumn = New DataColumn()
        myInstructDistDataColumn.DataType = System.Type.GetType("System.String")
        myInstructDistDataColumn.ColumnName = "nat_descrar"
        myInstructDistDataColumn.Caption = "lblCountry "
        myInstructDistDataTable.Columns.Add(myInstructDistDataColumn)



        'Add this DataTable to Session field = "myDataTable" to use/store it cross the postbacks
        Session("myInstructDistDataTable") = myInstructDistDataTable
        grvInstruction.DataSource = myInstructDistDataTable
        grvInstruction.DataBind()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            'Get the Page Culture
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                _culture = "ar"

            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                _culture = "en"

            End If




            Panel2.Visible = False
            pnlinstructDetail.Visible = False
            If (IsPostBack) Then
                Panel2.Visible = False
                pnlinstructDetail.Visible = False

                If (Not String.IsNullOrWhiteSpace(Request.QueryString("DonorID"))) Then

                    Dim donorDS As New DataSet
                    Dim donerID() As Object = {Request.QueryString("DonorID")}

                    donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByID", CommandType.StoredProcedure, donerID)

                    If (donorDS.Tables(0).Rows().Count > 0) Then

                        'Pass the data set to Display Donor Information Method
                        DisplayDonorInfo(donorDS)

                    Else


                    End If
                End If
                If (Not IsNothing(Session("donor"))) Then
                    '_donor = Session("donor")
                End If
            Else

                'For Testing, username and password must be enter from Login Form
                Session("user_id") = Session(SessionKey.USERNAME)
                Session("UsrID") = Session(SessionKey.USERNAME)

                ' fill_donations()
                txtReceiptDate.Text = DateTime.Now.ToString("dd/MM/yyyy")
                ddlcampaign.Enabled = True
                btnOpen.Enabled = False
                btnCreate.Enabled = True

                ddlstandStat.SelectedIndex = 1
                'pnlSearchByNameResults.Visible = False
                InitializeInstructDistDataTable()
                grvInstruction.DataBind()
                'comment
                'grvPayments.DataBind()
                'grvDonationDist.DataBind()
                'InitializePaymentDistDataTable()
                'InitializeDonationDistDataTable()
                'end
                'Get the Receipt Details if user open Receipt from Donor Profile
                If (Not String.IsNullOrWhiteSpace(Request.QueryString("ReceiptID"))) Then



                Else



                End If

                'Get the Receipt Details if user open Receipt from Donor Profile
                If (Not String.IsNullOrWhiteSpace(Request.QueryString("DonorID"))) Then

                    Dim donorDS As New DataSet
                    Dim donerID() As Object = {txtSearch.Text.Trim()}

                    donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByID", CommandType.StoredProcedure, donerID)

                    If (donorDS.Tables(0).Rows().Count > 0) Then

                        'Pass the data set to Display Donor Information Method
                        DisplayDonorInfo(donorDS)

                    Else



                    End If

                End If

            End If



        Catch ex As Exception

        End Try

    End Sub

    Enum SearchType
        ID
        CivilID
        Phone
        Mobile
        ArabicName
        EnglishName
        RefNum
    End Enum

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click

        Try
            If (Not String.IsNullOrWhiteSpace(txtSearch.Text)) Then

                Dim donorDS As New DataSet

                Select Case ddlSearchType.SelectedValue

                    Case SearchType.ID

                        Dim donerID() As Object = {txtSearch.Text.Trim()}

                        donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByID", CommandType.StoredProcedure, donerID)

                        If (donorDS.Tables(0).Rows().Count > 0) Then

                            'Pass the data set to Display Donor Information Method
                            DisplayDonorInfo(donorDS)

                        Else
                            ClearForm()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("لا يوجد بيانات")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("No Data Found")
                            End If
                            EnableDonorProfile()
                        End If

                    Case SearchType.CivilID

                        Dim donerCivilID() As Object = {txtSearch.Text.Trim()}

                        donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByCivilID", Data.CommandType.StoredProcedure, donerCivilID)

                        If (donorDS.Tables(0).Rows().Count > 0) Then

                            'Pass the data set to Display Donor Information Method
                            DisplayDonorInfo(donorDS)

                        Else
                            ClearForm()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("لا يوجد بيانات")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("No Data Found")
                            End If
                            EnableDonorProfile()
                        End If

                    Case SearchType.Phone

                        Dim donorPhoneNumber() As Object = {txtSearch.Text.Trim()}

                        donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByPhoneNumber", Data.CommandType.StoredProcedure, donorPhoneNumber)

                        If (donorDS.Tables(0).Rows().Count > 0) Then

                            'Pass the data set to Display Donor Information Method
                            DisplayDonorInfo(donorDS)

                        Else
                            ClearForm()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("لا يوجد بيانات")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("No Data Found")
                            End If
                            EnableDonorProfile()
                        End If

                    Case SearchType.Mobile

                        Dim donorMobileNumber() As Object = {txtSearch.Text.Trim()}

                        donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByMobileNumber", Data.CommandType.StoredProcedure, donorMobileNumber)

                        If (donorDS.Tables(0).Rows().Count > 0) Then

                            'Pass the data set to Display Donor Information Method
                            DisplayDonorInfo(donorDS)

                        Else
                            ClearForm()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("لا يوجد بيانات")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("No Data Found")
                            End If
                            EnableDonorProfile()
                        End If

                    Case SearchType.ArabicName

                        Dim donorArabicName() As Object = {txtSearch.Text.Trim()}

                        donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchArName", Data.CommandType.StoredProcedure, donorArabicName)

                        If (donorDS.Tables(0).Rows().Count > 0) Then
                            Panel2.Visible = True

                            '.Visible = True
                            'Pass the data set to Display Donor Information Method
                            ' DisplayDonorInfo(donorDS)
                            ' pnlSearchByNameResults.Visible = True
                        Else
                            ClearForm()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("لا يوجد بيانات")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("No Data Found")
                            End If
                            EnableDonorProfile()
                        End If


                    Case SearchType.EnglishName

                        Dim donorEnglishName() As Object = {txtSearch.Text.Trim()}

                        donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchEngName", Data.CommandType.StoredProcedure, donorEnglishName)

                        If (donorDS.Tables(0).Rows().Count > 0) Then

                            'Pass the data set to Display Donor Information Method
                            'pnlSearchByNameResults_ModalPopupExtender.Show()
                            'pnlSearchByNameResults.Visible = True
                            'DisplayDonorInfo(donorDS)
                            ' Panel2.Visible = True
                            'pnlSearchByNameResults.Visible = True
                        Else
                            ClearForm()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("لا يوجد بيانات")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("No Data Found")
                            End If
                            EnableDonorProfile()
                        End If

                        'Using (_charitysoftEntities)

                        '    Dim donorEnglishName() As String = txtSearch.Text.Trim()

                        '    _donors = GetDonorsByEnglishName(donorEnglishName)

                        '    ' _donor = New Donor()
                        '    ' pnlSearchByNameResults.Visible = True

                        'End Using




                    Case SearchType.RefNum

                        Dim Refnum() As Object = {txtSearch.Text.Trim()}

                        donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchRefNumByID", Data.CommandType.StoredProcedure, Refnum)

                        If (donorDS.Tables(0).Rows().Count > 0) Then

                            DisplayDonationInfo(donorDS)
                            DisplayDonorInfo(donorDS)
                        Else
                            ClearForm()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("لا يوجد بيانات")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("No Data Found")
                            End If

                        End If

                End Select
            Else
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ShowAlert("لا يوجد بيانات")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ShowAlert("No Data Found")
                End If
            End If

        Catch FormatException As FormatException
            'User input incorrect format

        Catch ex As Exception

        End Try
    End Sub
    Private Sub DisplayDonationInfo(ByVal Refnum As DataSet)
        Try
            Dim standInstruct As DataSet
            Dim param() As Object
            Dim refditribution As DataSet
            Dim tmpbrncode As Integer
            Dim tmpMonth As Integer

            txtReceiptID.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("ref_numb")), String.Empty, Refnum.Tables(0).Rows(0).Item("ref_numb"))
            txtReceiptDate.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("instruct_date")), String.Empty, CDate(Refnum.Tables(0).Rows(0).Item("instruct_date")).ToString("dd/MM/yyyy"))
            txtNotes.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("remarks")), String.Empty, Refnum.Tables(0).Rows(0).Item("remarks").ToString())
            ddlCurrency.SelectedValue = If(IsDBNull(refnum.Tables(0).Rows(0).Item("currency_code")), Nothing, refnum.Tables(0).Rows(0).Item("currency_code").ToString())
            ddlcampaign.SelectedValue = If(IsDBNull(refnum.Tables(0).Rows(0).Item("campaign_code")), Nothing, refnum.Tables(0).Rows(0).Item("campaign_code").ToString())
            txtfavourof.Text = If(IsDBNull(refnum.Tables(0).Rows(0).Item("ded_in_favar_of")), String.Empty, refnum.Tables(0).Rows(0).Item("ded_in_favar_of").ToString())
            ddlstandStat.SelectedValue = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("standing_status")), Nothing, Refnum.Tables(0).Rows(0).Item("standing_status").ToString())
            ddlstatReasn.SelectedValue = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("status_reason")), Nothing, Refnum.Tables(0).Rows(0).Item("status_reason").ToString())
            ddlinstrcutSrc.SelectedValue = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("instruct_src")), Nothing, Refnum.Tables(0).Rows(0).Item("instruct_src").ToString())
            txtAccountNum.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("account_num")), String.Empty, Refnum.Tables(0).Rows(0).Item("account_num").ToString())
            txtBnkRefNo.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("bank_ref_num")), String.Empty, Refnum.Tables(0).Rows(0).Item("bank_ref_num").ToString())
            ddlBnk.SelectedValue = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("bank_code")), Nothing, Refnum.Tables(0).Rows(0).Item("bank_code").ToString())
            'ddlnewBrn.SelectedValue = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("brn_code")), Nothing, Refnum.Tables(0).Rows(0).Item("brn_code").ToString())
            tmpbrncode = IsDBNull(Refnum.Tables(0).Rows(0).Item("brn_code"))
            If tmpbrncode >= 0 Then

            End If
            txtStartDt.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("start_date")), String.Empty, CDate(Refnum.Tables(0).Rows(0).Item("start_date")).ToString("dd/MM/yyyy"))
            txtEndDate.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("end_date")), String.Empty, CDate(Refnum.Tables(0).Rows(0).Item("end_date")).ToString("dd/MM/yyyy"))
            txtTotalDeduct.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("total_deduct_value")), String.Empty, Refnum.Tables(0).Rows(0).Item("total_deduct_value").ToString())
            txtinstAmt.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("installment_value")), String.Empty, Refnum.Tables(0).Rows(0).Item("installment_value").ToString())
            'tmpMonth = DateDiff(CDate(txtEndDate.Text), CDate(txtStartDt.Text), "M")

            param = {Refnum.Tables(0).Rows(0).Item("ref_numb")}
            '' IIf(CultureInfo.CurrentUICulture.Name.Contains("en"), "English", "Arabic")}

            refditribution = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetinstructDist", CommandType.StoredProcedure, param)

            grvInstruction.DataSource = refditribution
            grvInstruction.DataBind()



        Catch ex As Exception

        End Try

    End Sub

    Private Sub DisplayDonorInfo(ByVal donor As DataSet)

        Try
            DisableDonorProfile()
            txtDonrIDn.Text = donor.Tables(0).Rows(0).Item("donor_id").ToString()
            txtArabicName.Text = If(IsDBNull(donor.Tables(0).Rows(0).Item("donor_namear")), String.Empty, donor.Tables(0).Rows(0).Item("donor_namear"))
            txtEnglishName.Text = If(IsDBNull(donor.Tables(0).Rows(0).Item("donor_nameen")), String.Empty, donor.Tables(0).Rows(0).Item("donor_nameen"))
            txtCivilID.Text = If(IsDBNull(donor.Tables(0).Rows(0).Item("donor_civilid")), String.Empty, donor.Tables(0).Rows(0).Item("donor_civilid"))
            txtMobile.Text = If(IsDBNull(donor.Tables(0).Rows(0).Item("phone_2")), String.Empty, donor.Tables(0).Rows(0).Item("phone_2"))
            txtPhone.Text = If(IsDBNull(donor.Tables(0).Rows(0).Item("primary_phone")), String.Empty, donor.Tables(0).Rows(0).Item("primary_phone"))
            ddlDonorType.SelectedValue = If(IsDBNull(donor.Tables(0).Rows(0).Item("comp_indv")), -1, donor.Tables(0).Rows(0).Item("comp_indv"))


            'Get the total donation for the donor
            Dim totalDonationsDS As DataSet
            Dim param() As Object = {donor.Tables(0).Rows(0).Item("donor_id")}
            totalDonationsDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorTotalDonation", Data.CommandType.StoredProcedure, param)
            If (totalDonationsDS.Tables(0).Rows.Count > 0) Then
                txtTotalDonation.Text = CDec(totalDonationsDS.Tables(0).Rows(0).Item(0)).ToString("N3")
            Else
            End If

            'Get the total donation for the donor
            Dim totalWaqfDS As DataSet

            totalWaqfDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorTotalWaqf", Data.CommandType.StoredProcedure, param)
            If (totalWaqfDS.Tables(0).Rows.Count > 0) Then
                txtTotalWaqf.Text = CDec(totalWaqfDS.Tables(0).Rows(0).Item(0)).ToString("N3")
            Else
            End If
            'IIf(IsDBNull(totalWaqfDS.Tables(0).Rows.Count), CDec(0).ToString("N3"), CDec(totalWaqfDS.Tables(0).Rows(0).Item(0)).ToString("N3"))

            Dim totinstructDS As DataSet
            totinstructDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorTotalStandInstruct", Data.CommandType.StoredProcedure, param)
            If (totinstructDS.Tables(0).Rows.Count > 0) Then
                txttotintruct.Text = CDec(totinstructDS.Tables(0).Rows(0).Item(0)).ToString("N3")
            Else
            End If


            'Add Donor Id to Open Button in order to open his/her profile
            btnOpen.PostBackUrl = "~/AddDonar.aspx?DonorId=" & donor.Tables(0).Rows(0).Item("donor_id").ToString()
            'instruct.PostBackUrl = "~/StandReport.aspx?DonorId=" & donor.donor_id
        Catch ex As Exception

        End Try

    End Sub

    Private Sub DisableDonorProfile()

        txtMobile.Enabled = False
        txtEnglishName.Enabled = False
        txtArabicName.Enabled = False
        txtCivilID.Enabled = False
        txtPhone.Enabled = False
        ddlDonorType.Enabled = False
        btnOpen.Enabled = True
        btnCreate.Enabled = False
    End Sub


    Sub ShowAlert(ByVal message As String)
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "notificationScript", "<script> alert('" & message & "'); </script>", False)
    End Sub
    Private Sub EnableDonorProfile()

        btnOpen.Enabled = False
        btnCreate.Enabled = True
        txtMobile.Enabled = True
        txtEnglishName.Enabled = True
        txtArabicName.Enabled = True
        txtCivilID.Enabled = True
        txtPhone.Enabled = True
        ddlDonorType.Enabled = True
    End Sub

    Protected Sub ddlDonationddlDonationNew_SelectedIndexChanged(sender As Object, e As EventArgs)


        Try
            Dim donationStandardValue As DataSet
            Dim ddlDonation As DropDownList = grvInstruction.Controls(0).Controls(1).FindControl("ddlDonationNew")
            Dim txtDistValue As TextBox = grvInstruction.Controls(0).Controls(1).FindControl("txtDistValue")
            Dim sql As String

            sql = "SELECT ISNULL(donation_standard_value,0) AS donation_standard_value FROM donations WHERE donation_code = " & ddlDonation.SelectedValue

            donationStandardValue = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql)

            If (donationStandardValue.Tables(0).Rows.Count > 0) Then
                txtDistValue.Text = CDec(donationStandardValue.Tables(0).Rows(0).Item("donation_standard_value")).ToString("N3")
                ddlDonation.Focus()
            End If


        Catch ex As Exception

        End Try


    End Sub

    Protected Sub lbtnAddDistFooter_Click(sender As Object, e As EventArgs)
        Try

            Dim ddldonationAra As DropDownList = grvInstruction.FooterRow.FindControl("ddldonationAra")
            Dim txtdistvaluefooter As TextBox = grvInstruction.FooterRow.FindControl("txtDistvaluefooter")
            Dim txtrefnum As TextBox = grvInstruction.FooterRow.FindControl("txtrefnum")
            Dim txtquantfooter As TextBox = grvInstruction.FooterRow.FindControl("txtquantfooter")
            Dim txtTotalfooter As TextBox = grvInstruction.FooterRow.FindControl("txtTotalfooter")
            Dim ddlcountryfooter As DropDownList = grvInstruction.FooterRow.FindControl("ddlcountryfooter")
            Dim ttamt As Decimal

            ''*************************
            myInstructDistDataTable = Session("myInstructDistDataTable")

            'Validation: Only one donation type per Receipt
            For Each row As DataRow In myInstructDistDataTable.Rows
                If (ddldonationAra.SelectedValue > 0) Then
                    If (row.Item("donation_code") = ddldonationAra.SelectedValue) Then

                        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                            ShowAlert("لا يمكن تكرار الغرض في نفس سند القبض")

                        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                            ShowAlert("You cannot add more than on Donation Type per receipt")

                        End If

                        Exit Sub
                    End If
                Else
                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                        ShowAlert("الرجاء تحديد نوع التبرع")

                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                        ShowAlert("Please Select Donation Type")

                    End If
                    Exit Sub
                End If
            Next

            ''****************************************




            myInstructDistDataRow = myInstructDistDataTable.NewRow()
            myInstructDistDataRow("ref_numb") = 0
            myInstructDistDataRow("donation_code") = Convert.ToInt16(ddldonationAra.SelectedValue)
            myInstructDistDataRow("donation_descrar") = ddldonationAra.SelectedItem.Text
            myInstructDistDataRow("instruct_value") = Convert.ToDecimal(txtdistvaluefooter.Text)
            myInstructDistDataRow("quantity") = Convert.ToDecimal(txtquantfooter.Text)
            If Val(txtdistvaluefooter.Text) > 0 And Val(txtquantfooter.Text) > 0 Then
                ttamt = Val(txtdistvaluefooter.Text) * Val(txtquantfooter.Text)
            Else
                ttamt = 0
            End If
            myInstructDistDataRow("totAmnt") = Convert.ToDecimal(ttamt)
            myInstructDistDataRow("nat_code") = Convert.ToInt16(ddlcountryfooter.SelectedValue)
            myInstructDistDataRow("nat_descrar") = ddlcountryfooter.SelectedItem.Text



            'add the new DataRow to DataTable's Row
            myInstructDistDataTable.Rows.Add(myInstructDistDataRow)


            Session("myInstructDistDataTable") = myInstructDistDataTable

            grvInstruction.DataSource = myInstructDistDataTable
            grvInstruction.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub lbtnAddDist_Click(sender As Object, e As EventArgs)
        Try

            Dim ddlDonationNew As DropDownList = grvInstruction.Controls(0).Controls(1).FindControl("ddlDonationNew")
            Dim txtDistvalue As TextBox = grvInstruction.Controls(0).Controls(1).FindControl("txtDistvalue")
            Dim txtquant As TextBox = grvInstruction.Controls(0).Controls(1).FindControl("txtquant")
            Dim txtTotal As TextBox = grvInstruction.Controls(0).Controls(1).FindControl("txtTotal")
            Dim ddlcountry As DropDownList = grvInstruction.Controls(0).Controls(1).FindControl("ddlcountry")


            myInstructDistDataTable = Session("myInstructDistDataTable")


            'Validation: Only one donation type per Receipt
            ' For Each row As DataRow In myInstructDistDataTable.Rows
            If (ddlDonationNew.SelectedValue > 0) Then

            Else
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("الرجاء تحديد نوع التبرع")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Please Select Donation Type")

                End If
                Exit Sub
            End If
            ' Next

            ''****************************************

            myInstructDistDataRow = myInstructDistDataTable.NewRow()
            myInstructDistDataRow("ref_numb") = 0
            myInstructDistDataRow("donation_code") = Convert.ToInt16(ddlDonationNew.SelectedValue)
            myInstructDistDataRow("donation_descrar") = ddlDonationNew.SelectedItem.Text
            myInstructDistDataRow("instruct_value") = Convert.ToDecimal(txtDistvalue.Text)
            myInstructDistDataRow("quantity") = Convert.ToDecimal(txtquant.Text)
            myInstructDistDataRow("totAmnt") = Convert.ToDecimal(txtTotal.Text)
            myInstructDistDataRow("nat_code") = Convert.ToInt16(ddlcountry.SelectedValue)
            myInstructDistDataRow("nat_descrar") = ddlcountry.SelectedItem.Text
            'add the new DataRow to DataTable's Row
            If (myInstructDistDataRow("donation_code") > 0) Then
                myInstructDistDataTable.Rows.Add(myInstructDistDataRow)

                Session("myInstructDistDataTable") = myInstructDistDataTable

                grvInstruction.DataSource = myInstructDistDataTable
                grvInstruction.DataBind()
            Else
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("الرجاء تحديد نوع التبرع")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Please Select Donation Type")

                End If
                Exit Sub
            End If

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListFooterAr_SelectedIndexChanged(sender As Object, e As EventArgs)
        'footer


        Try
            Dim donationStandardValue As DataSet
            Dim ddlDonation As DropDownList = grvInstruction.FooterRow.FindControl("ddlDonationAra")
            Dim txtDistValuefooter As TextBox = grvInstruction.FooterRow.FindControl("txtDistValuefooter")
            Dim sql As String

            sql = "SELECT ISNULL(donation_standard_value,0) AS donation_standard_value FROM donations WHERE donation_code = " & ddlDonation.SelectedValue

            donationStandardValue = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql)

            If (donationStandardValue.Tables(0).Rows.Count > 0) Then
                txtDistValuefooter.Text = CDec(donationStandardValue.Tables(0).Rows(0).Item("donation_standard_value")).ToString("N3")
                ddlDonation.Focus()
            End If


        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownListFooterEng_SelectedIndexChanged(sender As Object, e As EventArgs)
        'footer



        Try
            Dim donationValue As DataSet
            Dim ddlDonation As DropDownList = grvInstruction.FooterRow.FindControl("ddlDonationEng")
            Dim txtDistValuefooter As TextBox = grvInstruction.FooterRow.FindControl("txtDistValuefooter")
            Dim sql As String

            sql = "SELECT ISNULL(donation_standard_value,0) AS donation_standard_value FROM donations WHERE donation_code = " & ddlDonation.SelectedValue

            donationValue = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql)

            If (donationValue.Tables(0).Rows.Count > 0) Then
                txtDistValuefooter.Text = CDec(donationValue.Tables(0).Rows(0).Item("donation_standard_value")).ToString("N3")
                ddlDonation.Focus()
            End If


        Catch ex As Exception

        End Try

    End Sub



    Protected Sub btnCreate_Click(sender As Object, e As EventArgs) Handles btnCreate.Click
        Try
            Dim donorID As Int32
            Dim donorParam() As Object = {txtArabicName.Text,
                                          txtEnglishName.Text,
                                          txtPhone.Text,
                                          txtMobile.Text,
                                          txtCivilID.Text,
                                          Convert.ToByte(ddlDonorType.SelectedValue),
                                          0}

            donorID = _ws.ExecSp("charitysoft", Session("username"), Session("password"), "InsertDonorInstatnt", CommandType.StoredProcedure, donorParam)

            If (donorID > 0) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("تم حفظ ملف المتبرع بنجاح")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Donor Profile Saved Successfully")

                End If

                DisableDonorProfile()
                'Display New Donor ID
                txtDonrIDn.Text = donorID.ToString()
                'Add Donor Id to Open Button in order to open his/her profile
                btnOpen.PostBackUrl = "~/AddDonar.aspx?DonorId=" & donorID.ToString()

            Else

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("لم يتم حفظ ملف المتبرع")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Donor Profile Saved Fail")

                End If

            End If

        Catch ex As Exception

        End Try
    End Sub


    Protected Sub btnReset_Click(sender As Object, e As EventArgs) Handles btnReset.Click
        ClearForm()
        btnOpen.Enabled = False
        btnCreate.Enabled = True
        ddlcampaign.Enabled = True
        ddlstandStat.SelectedIndex = 1
        Session("receipt") = Nothing
        Session("donor") = Nothing
    End Sub
    Private Sub ClearForm()
        Try
            datalib.ClearForm(form1)
            txtReceiptDate.Text = DateTime.Now.ToString("dd/MM/yyyy")
        Catch ex As Exception

        End Try

    End Sub


    Protected Sub btnsaveInstruct_Click(sender As Object, e As EventArgs) Handles btnsaveInstruct.Click

        If Len(txtDonrIDn.Text) > 0 And ddlBnk.SelectedIndex <> -1 And IsDate(txtStartDt.Text) And IsNumeric(txtTotalDeduct.Text) Then
            Try

                Dim refnumID As Int32
                Dim receiptTotalAmount As Decimal
                Dim paymentTotalAmount As Decimal
                Dim refParam() As Object
                Dim InstructDistParam() As Object


                'Get the Donation and Payments Distribution from session to use them in insert
                myInstructDistDataTable = Session("myInstructDistDataTable")

                paymentTotalAmount = GetPaymentTotalAmount(myInstructDistDataTable)

                'Calculate the Total Donation Amount
                'For Each row As DataRow In myInstructDistDataTable.Rows
                '    receiptTotalAmount += CDec(row.Item("donation_value"))
                'Next

                ''Calculate the Total Payments Amount
                'For Each row As DataRow In myPaymentDistDataTable.Rows
                '    paymentTotalAmount += CDec(row.Item("pay_amnt"))
                'Next

                'If (paymentTotalAmount <> receiptTotalAmount) Then

                '    ShowAlert("Total Donations not equal Total Payments, Please check!")

                'End If

                'Insert Receipt
                If (paymentTotalAmount <> Convert.ToDecimal(txtinstAmt.Text)) Then

                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                        ShowAlert("المبلغ المدفوع لا يساوي مبلغ التبرعات")

                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                        ShowAlert("Total Donations not equal Total Payments, Please check!")

                    End If

                    Exit Sub

                End If


                refParam = {Convert.ToDateTime(txtReceiptDate.Text),
                                   Convert.ToInt32(txtDonrIDn.Text),
                                   Convert.ToInt16(ddlBnk.SelectedValue),
                                   Convert.ToInt16(ddlnewBrn.SelectedValue),
                                   txtBnkRefNo.Text,
                                   txtAccountNum.Text,
                                   Convert.ToInt16(ddlCurrency.SelectedValue),
                                   txtNotes.Text,
                                   Convert.ToInt16(ddlcampaign.SelectedValue),
                                   Convert.ToDateTime(txtStartDt.Text),
                                   If(String.IsNullOrWhiteSpace(txtEndDate.Text), DBNull.Value, Convert.ToDateTime(txtEndDate.Text)),
                                   Convert.ToDecimal(txtTotalDeduct.Text),
                                   Convert.ToDecimal(txtinstAmt.Text),
                                   Convert.ToByte(ddlstandStat.SelectedValue),
                txtfavourof.Text,
                Convert.ToByte(ddlstatReasn.SelectedValue),
                 Convert.ToByte(ddlinstrcutSrc.SelectedValue),
                 0
                                    }


                refnumID = _ws.ExecSp("charitysoft", Session("username"), Session("password"), "InsertStandingInstruct", CommandType.StoredProcedure, refParam)

                If (refnumID > 0) Then
                    'Insert Instruction Dist.
                    For Each row As DataRow In myInstructDistDataTable.Rows
                        InstructDistParam = {Convert.ToInt32(refnumID),
                                             Convert.ToInt16(row.Item("donation_code")),
                                             Convert.ToDecimal(row.Item("instruct_value")),
                                             Convert.ToDecimal(row.Item("quantity")),
                                             Convert.ToInt16(row.Item("nat_code"))}

                        _ws.ExecSp("charitysoft", Session("username"), Session("password"), "InsertInstructDet", CommandType.StoredProcedure, InstructDistParam)
                    Next




                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                        ShowAlert("تم حفظ سند القبض بنجاح")

                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                        ShowAlert("Receipt Saved Successfully")


                    End If

                    'btnPrint.Enabled = False

                    txtReceiptID.Text = refnumID.ToString()
                    btnBnkRep.PostBackUrl = "~/BankInstructionRep.aspx?ref_numb=" & txtReceiptID.Text
                End If

            Catch ex As Exception
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ShowAlert("الرجاء إدخال المعلومات المطلوبة")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ShowAlert("Please Enter Required Information!")
                End If
            End Try
        Else
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                ShowAlert("الرجاء إدخال المعلومات المطلوبة")
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                ShowAlert("Please Enter Required Information!")
            End If
        End If
    End Sub

    Private Function GetPaymentTotalAmount(ByVal myInstructDistDataTable As DataTable) As Decimal
        Dim paymentTotalAmount As Decimal

        If (myInstructDistDataTable.Rows.Count > 0) Then

            For Each row As DataRow In myInstructDistDataTable.Rows
                paymentTotalAmount += CDec(row.Item("instruct_value")) * CDec(row.Item("quantity"))
            Next

        Else

            paymentTotalAmount = 0

        End If

        Return paymentTotalAmount
    End Function

    Protected Sub btnBnkRep_Click(sender As Object, e As EventArgs) Handles btnBnkRep.Click
        Try
            If Len(txtReceiptID.Text) > 0 Then
                Dim ReportDS As New DataSet
                Dim refID() As Object = {txtReceiptID.Text.Trim()}

                ReportDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "stand_inst_report", CommandType.StoredProcedure, refID)
                If (ReportDS.Tables(0).Rows.Count > 0) Then
                    btnBnkRep.PostBackUrl = "~/BankStndReport.aspx?ref_numb=" & ReportDS.Tables(0).Rows(0).Item("ref_numb").ToString
                End If
            Else
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ShowAlert("الرجاء إدخال الأستقطاع البنكي")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ShowAlert("Please Enter Bank Intruction Number!")
                End If
            End If
        Catch ex As Exception

        End Try


    End Sub


    'Protected Sub ddlbnk_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlBnk.SelectedIndexChanged

    '    Dim sql_01 As String
    '    Dim ds1 As New DataSet
    '    Dim ds2 As New DataSet
    '    Dim b_code As Integer

    '    If ddlBnk.SelectedValue <> -1 Then
    '        b_code = ddlBnk.SelectedValue
    '        ' Me.ddlnewBrn.Items.Clear()
    '        If Val(b_code) > 0 Then
    '            sql_01 = "select brn_code,brn_namear from bnk_brnchtab where bnk_code =" & Val(b_code)


    '            Try
    '                ds2 = _ws.GetMyData("charitysoft", Session("user_id"), Session("password"), sql_01)

    '            Catch ex As Exception

    '            End Try
    '        End If
    '        If ds2.Tables(0).Rows.Count > 0 Then
    '            Me.ddlnewBrn.DataSource = ds2.Tables(0).DefaultView
    '            ddlnewBrn.DataTextField = ds2.Tables(0).Columns(1).ToString
    '            ddlnewBrn.DataValueField = ds2.Tables(0).Columns(0).ToString
    '            ddlnewBrn.DataBind()
    '        End If



    '        ds2.Dispose()

    '    End If

    'End Sub


    Protected Sub LnkChange_Click(sender As Object, e As EventArgs) Handles LnkChange.Click
        Try
            Dim InstructID_numb As Int32 = Convert.ToInt32(txtReceiptID.Text.Trim())
            Dim i As Integer
            Dim reason As Integer
            Dim sql_01 As String
            Session("refer_id") = InstructID_numb
            'Dim refno As standing_instruction = (From c In _charitysoftEntities.standing_instruction
            '                                     Where c.ref_numb = InstructID_numb
            '                                     Select c).First()
            'refno.standing_status = 4
            'refno.status_reason = 3
            '_charitysoftEntities.SaveChanges()
            'ddlstandStat.SelectedIndex = 4
            'ddlstatReasn.SelectedIndex = 3
            ddlstandStat.Enabled = True
            ddlstatReasn.Enabled = True
            If ddlstatReasn.SelectedIndex <> -1 Then
                reason = ddlstatReasn.SelectedIndex
            Else
                reason = 3

            End If
            sql_01 = "update standing_instruction set standing_status= 4 ,status_reason = " & Val(reason) _
                      & " where ref_numb=" & Val(InstructID_numb)

            i = _ws.ExecuteNonQuery("charitysoft", Session("UsrID"), Session("password"), sql_01)

            If i = -1 Then      ' check code 0 is a valid result also

                Throw New Exception("Exception in Saving ")
            Else

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ShowAlert("تم حفظ !!")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ShowAlert("Activated Successfully !!")
                End If

                ddlstandStat.SelectedIndex = 4
                'ddlstatReasn.SelectedIndex = 3

            End If
            ddlstandStat.Enabled = False
            'ddlstatReasn.Enabled = False
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub LnkCancelled_Click(sender As Object, e As EventArgs) Handles LnkCancelled.Click
        Try
            Dim InstructID_numb As Int32 = Convert.ToInt32(txtReceiptID.Text.Trim())
            Dim i As Integer
            Dim reason As Integer
            Dim sql_02 As String

            Session("refer_id") = InstructID_numb
            'Dim refno As standing_instruction = (From c In _charitysoftEntities.standing_instruction
            '                                     Where c.ref_numb = InstructID_numb
            '                                     Select c).First()
            'refno.standing_status = 5
            'refno.status_reason = 2
            '_charitysoftEntities.SaveChanges()
            ddlstandStat.Enabled = True
            ddlstatReasn.Enabled = True

            If ddlstatReasn.SelectedIndex <> -1 Then
                reason = ddlstatReasn.SelectedIndex
            Else
                reason = 2

            End If
            sql_02 = "update standing_instruction set standing_status= 5 ,status_reason = " & Val(reason) _
            & " where ref_numb = " & Val(InstructID_numb)

            i = _ws.ExecuteNonQuery("charitysoft", Session("UsrID"), Session("password"), sql_02)

            If i = -1 Then      ' check code 0 is a valid result also

                Throw New Exception("Exception in Saving ")
            Else
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ShowAlert("تم حفظ !!")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ShowAlert("Cancelled Successfully !!!!")
                End If

                ddlstandStat.SelectedIndex = 5
                'ddlstatReasn.SelectedIndex = 2

            End If
            ddlstandStat.Enabled = False
            'ddlstatReasn.Enabled = False

        Catch ex As Exception

        End Try
    End Sub




    Private Sub grvInstruction_RowCancelingEdit(sender As Object, e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles grvInstruction.RowCancelingEdit
        Try

            myInstructDistDataTable = Session("myInstructDistDataTable")

            grvInstruction.EditIndex = -1
            grvInstruction.DataSource = myInstructDistDataTable
            grvInstruction.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub grvInstruction_RowDeleting(sender As Object, e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grvInstruction.RowDeleting
        Try
            myInstructDistDataTable = Session("myInstructDistDataTable")
            myInstructDistDataTable.Rows(e.RowIndex).Delete()

            grvInstruction.DataSource = myInstructDistDataTable
            grvInstruction.DataBind()

            Session("myInstructDistDataTable") = myInstructDistDataTable

        Catch ex As Exception

        End Try
    End Sub

    Private Sub grvInstruction_RowEditing(sender As Object, e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles grvInstruction.RowEditing
        Try

            myInstructDistDataTable = Session("myInstructDistDataTable")

            grvInstruction.EditIndex = e.NewEditIndex
            grvInstruction.DataSource = myInstructDistDataTable
            grvInstruction.DataBind()

        Catch ex As Exception

        End Try
    End Sub
    Protected Sub lnk_hide_panel_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnk_hide_panel.ServerClick
        Panel2.Visible = False
    End Sub

    Private Sub grvInstruction_RowUpdating(sender As Object, e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grvInstruction.RowUpdating
        Try
            myInstructDistDataTable = Session("myInstructDistDataTable")

            Dim txtrefnumedit As TextBox = grvInstruction.Rows(e.RowIndex).FindControl("txtrefnumedit")
            Dim txtDistValueEdit As TextBox = grvInstruction.Rows(e.RowIndex).FindControl("txtDistValueEdit")
            Dim txtquantEdit As TextBox = grvInstruction.Rows(e.RowIndex).FindControl("txtquantEdit")
            Dim ddlCountry As DropDownList = grvInstruction.Rows(e.RowIndex).FindControl("ddl_nat")
            Dim txtTotalEdit As TextBox = grvInstruction.Rows(e.RowIndex).FindControl("txtTotalEdit")

            myInstructDistDataTable.Rows(e.RowIndex).Item("instruct_value") = Convert.ToDecimal(txtDistValueEdit.Text)
            myInstructDistDataTable.Rows(e.RowIndex).Item("nat_code") = ddlCountry.SelectedValue
            myInstructDistDataTable.Rows(e.RowIndex).Item("nat_descrar") = ddlCountry.SelectedItem.Text
            myInstructDistDataTable.Rows(e.RowIndex).Item("quantity") = Convert.ToDecimal(txtquantEdit.Text)
            myInstructDistDataTable.Rows(e.RowIndex).Item("totAmnt") = Convert.ToDecimal(txtDistValueEdit.Text) * Convert.ToDecimal(txtquantEdit.Text)


            grvInstruction.EditIndex = -1
            grvInstruction.DataSource = myInstructDistDataTable
            grvInstruction.DataBind()

            Session("myInstructDistDataTable") = myInstructDistDataTable


        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnPrntReport_Click(sender As Object, e As EventArgs) Handles btnPrntReport.Click

        If (Not String.IsNullOrWhiteSpace(txtDonrIDn.Text)) Then

            Dim donorDSNew As New DataSet
            Try
                Dim DonorNumber() As Object = {txtDonrIDn.Text.Trim()}

                donorDSNew = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetInstrcutionDetail", Data.CommandType.StoredProcedure, DonorNumber)

                If (donorDSNew.Tables(0).Rows().Count > 0) Then

                    'Pass the data set to Display Donor Information Method
                    'pnlSearchByNameResults_ModalPopupExtender.Show()
                    'pnlSearchByNameResults.Visible = True
                    'DisplayDonorInfo(donorDS)
                    pnlinstructDetail.Visible = True
                    'pnlSearchByNameResults.Visible = True
                Else
                    ClearForm()
                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                        ShowAlert("لا يوجد بيانات")
                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                        ShowAlert("No Data Found")
                    End If
                    EnableDonorProfile()
                End If
            Catch ex As Exception

            End Try
        End If


    End Sub


    Protected Sub chkWaqf_CheckedChanged(sender As Object, e As EventArgs) Handles chkWaqf.CheckedChanged
        Try
            If chkWaqf.Checked = True Then
                ddlDontationCat.SelectedIndex = 2
                ddlcampaign.SelectedIndex = 0
                ddlcampaign.Enabled = False
            Else
                ddlDontationCat.SelectedIndex = 1
                ddlcampaign.Enabled = True
            End If
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub ddlDontationCat_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlDontationCat.SelectedIndexChanged
        Try
            If ddlDontationCat.SelectedIndex = 2 Then
                chkWaqf.Checked = True
                ddlcampaign.SelectedIndex = 0
                ddlcampaign.Enabled = False
            Else
                chkWaqf.Checked = False
                ddlcampaign.Enabled = True
            End If
        Catch ex As Exception
        End Try

    End Sub


    Protected Sub Linkbutton3_Click(sender As Object, e As EventArgs)
        Try
            If (Not String.IsNullOrWhiteSpace(Request.QueryString("DonorID"))) Then

                Dim donorDS As New DataSet
                Dim donerID() As Object = {txtSearch.Text.Trim()}

                donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByID", CommandType.StoredProcedure, donerID)

                If (donorDS.Tables(0).Rows().Count > 0) Then

                    'Pass the data set to Display Donor Information Method
                    DisplayDonorInfo(donorDS)

                Else


                End If
            End If
        Catch ex As Exception
        End Try
    End Sub


    Protected Sub lbtnCulture_Click(sender As Object, e As EventArgs) Handles lbtnCulture.Click
        Try
            If (lbtnCulture.Text = "عربي") Then
                Session("Culture") = "ar-kw"
            ElseIf (lbtnCulture.Text = "English") Then
                Session("Culture") = "en-us"
            End If

            Response.Redirect(Request.Url.OriginalString)
        Catch ex As Exception

        End Try
    End Sub


    Protected Overrides Sub InitializeCulture()
        If (Not IsNothing(Session("Culture"))) Then
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Session("Culture"))
            Thread.CurrentThread.CurrentUICulture = CultureInfo.CreateSpecificCulture(Session("Culture"))
        End If

        'base.InitializeCulture()
    End Sub
    Protected Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click
        ClearForm()
        EnableDonorProfile()
    End Sub

    Protected Sub btnchngLang_Click(sender As Object, e As EventArgs) Handles btnchngLang.Click
        Try
            If ddlLang.SelectedIndex = 0 Then
                Session("Culture") = "ar-kw"
            ElseIf ddlLang.SelectedIndex = 1 Then
                Session("Culture") = "en-us"
            End If
            Response.Redirect(Request.Url.OriginalString)
        Catch ex As Exception

        End Try
    End Sub


    Protected Sub instruct_Click(sender As Object, e As EventArgs) Handles instruct.Click
        Try
            Dim ReportDS As New DataSet
            'Dim refID() As Object = {txtReceiptID.Text.Trim()}

            'ReportDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "stand_inst_report", CommandType.StoredProcedure, refID)
            'If (ReportDS.Tables(0).Rows.Count > 0) Then
            '    btnBnkRep.PostBackUrl = "~/BankInstructionRep.aspx?ref_numb=" & ReportDS.Tables(0).Rows(0).Item("ref_numb").ToString
            'End If
            ' ReportDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password")
            instruct.PostBackUrl = "~/StandReport.aspx"
        Catch ex As Exception

        End Try
    End Sub

    Private Sub lnk_hide_panel2_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_hide_panel2.ServerClick
        pnlinstructDetail.Visible = False
    End Sub

    Private Sub GrdInstructDet_PageIndexChanged(sender As Object, e As System.EventArgs) Handles GrdInstructDet.PageIndexChanged
        'GrdInstructDet.SelectedIndex = -1
        'GrdInstructDet.PageIndex = e.NewPageIndex
    End Sub

    Private Sub GrdInstructDet_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GrdInstructDet.PageIndexChanging

        GrdInstructDet.SelectedIndex = -1
        pnlinstructDetail.Visible = True
        GrdInstructDet.PageIndex = e.NewPageIndex
        GrdInstructDet.DataBind()

    End Sub

    Private Sub deals_grid_PageIndexChanged(source As Object, e As System.Web.UI.WebControls.DataGridPageChangedEventArgs) Handles deals_grid.PageIndexChanged
        deals_grid.SelectedIndex = -1

        deals_grid.CurrentPageIndex = e.NewPageIndex
        deals_grid.DataBind()
        deals_grid.Visible = True
    End Sub


    Private Sub deals_grid_Unload(sender As Object, e As System.EventArgs) Handles deals_grid.Unload

    End Sub


    Protected Sub txtmonthNo_TextChanged(sender As Object, e As EventArgs) Handles txtmonthNo.TextChanged
        If IsNumeric(txtmonthNo.Text) Then
            Try

            Catch ex As Exception

            End Try
        End If
    End Sub

    Protected Sub lbtnCalNoOfMonth_Click(sender As Object, e As EventArgs) Handles lbtnCalNoOfMonth.Click
        Try
            Dim startDate As DateTime = DateTime.ParseExact(txtStartDt.Text, "dd/MM/yyyy", Nothing)
            If (Not String.IsNullOrWhiteSpace(txtmonthNo.Text)) Then
                txtEndDate.Text = startDate.AddMonths(Convert.ToInt32(txtmonthNo.Text)).ToString("dd/MM/yyyy")
            End If

        Catch ex As Exception

        End Try
    End Sub

    
    Protected Sub deals_grid_SelectedIndexChanged(sender As Object, e As EventArgs) Handles deals_grid.SelectedIndexChanged

    End Sub
End Class