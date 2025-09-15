
#Region "Imports Directives"

Imports System.Web.Services.Description
Imports DirectAid.datalib
Imports System.Globalization
Imports System.Data
Imports System.Threading

#End Region

Public Class UCDeductionV1
    Inherits System.Web.UI.UserControl

#Region "Fields"

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

    Enum SearchType
        ID
        CivilID
        Phone
        Mobile
        ArabicName
        EnglishName
        RefNum
        AccountNum
    End Enum

#End Region

#Region "Methods"

    Private Sub LoadByRefNum()

        Dim refNum As Int32 = 0

        Int32.TryParse(Request.QueryString(QueryStringKey.RefNum), refNum)

        If refNum <> 0 Then

            txtSearch.Text = Request.QueryString(QueryStringKey.RefNum)
            ddlSearchType.SelectedValue = SearchType.RefNum
            btnSearch_Click(Nothing, Nothing)

        End If

    End Sub

    Private Sub Saving()

        btnsaveInstruct.Enabled = False

        Dim ref_num As Int32 = 0

        Int32.TryParse(txtReceiptID.Text, ref_num)

        Dim isNew As Boolean = (ref_num = 0)

        'Dim hasPayment As Boolean = False

        'If Not isNew Then

        '    Using db As New Database()

        '        hasPayment = ((From o In db.dont_dist Where o.standing_inst_num = ref_num Select o.standing_inst_num).Count() > 0)

        '    End Using

        '    If hasPayment Then

        '        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

        '            ShowAlert("عذرا لا يمكنك التعديل - يوجد سداد لهذا الاستقطاع")

        '        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

        '            ShowAlert("Sorry, you can not modify - found payment for this deduction.")

        '        End If

        '        Exit Sub

        '    End If

        'End If

        If Len(txtDonrIDn.Text) > 0 And ddlBnk.SelectedIndex <> -1 And IsDate(txtStartDt.Text) And IsNumeric(txtinstAmt.Text) Then
            Try

                Dim refnumID As Int32
                Dim receiptTotalAmount As Decimal
                Dim paymentTotalAmount As Decimal
                Dim refParam() As Object
                Dim InstructDistParam() As Object

                refnumID = ref_num

                'Get the Donation and Payments Distribution from session to use them in insert
                myInstructDistDataTable = Session("myInstructDistDataTable")

                'Check Eaqual payment amount and TotInstallment same?
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

                    btnsaveInstruct.Enabled = True

                    Exit Sub

                End If

                Dim startDate As DateTime = Convert.ToDateTime(txtStartDt.Text)
                Dim endDate As DateTime '= Convert.ToDateTime(txtEndDate.Text)
                If Not (String.IsNullOrWhiteSpace(txtEndDate.Text)) Then
                    endDate = Convert.ToDateTime(txtEndDate.Text)
                Else

                End If
                Dim _total As Decimal

                If Val(txtTotalDeduct.Text) > 0 Then

                    _total = txtTotalDeduct.Text
                Else

                    _total = 0

                End If

                ' Convert.ToInt16(ddlcampaign.SelectedValue)
                refParam = {Convert.ToDateTime(txtReceiptDate.Text),
                                   Convert.ToInt32(txtDonrIDn.Text),
                                   Convert.ToInt16(ddlBnk.SelectedValue),
                                   Convert.ToInt16(ddlnewBrn.SelectedValue),
                                   txtBnkRefNo.Text,
                                   txtAccountNum.Text,
                                   Convert.ToInt16(ddlCurrency.SelectedValue),
                                   txtnotes.Text,
                                  DBNull.Value,
                                   startDate,
                                   If(String.IsNullOrWhiteSpace(txtEndDate.Text), DBNull.Value, endDate),
                                   _total,
                                   Convert.ToDecimal(txtinstAmt.Text),
                                   Convert.ToByte(ddlstandStat.SelectedValue),
                                    txtfavourof.Text,
                                    Convert.ToByte(ddlstatReasn.SelectedValue),
                                     Convert.ToByte(ddlinstrcutSrc.SelectedValue),
                                     refnumID}

                If isNew Then
                    refnumID = _ws.ExecSp("charitysoft", Session("username"), Session("password"), "InsertStandingInstruct", CommandType.StoredProcedure, refParam)
                Else
                    'Delete details
                    refnumID = _ws.ExecSp("charitysoft", Session("username"), Session("password"), "UpdateStandingInstruct", CommandType.StoredProcedure, refParam)
                End If


                If (refnumID > 0) Then
                    'Insert Instruction Dist.

                    If Not isNew Then

                        Using db As New Database

                            db.ExecuteStoreCommand(String.Format("DELETE FROM instruction_dist WHERE (ref_numb = {0})", refnumID))

                        End Using

                    End If

                    For Each row As DataRow In myInstructDistDataTable.Rows
                        If (Convert.ToDecimal(row.Item("donation_standard_value")) <> 0) Then
                            InstructDistParam = {Convert.ToInt32(refnumID),
                                                 Convert.ToInt16(row.Item("donation_code")),
                                                 Convert.ToDecimal(row.Item("donation_standard_value")),
                                                 Convert.ToDecimal(row.Item("quantity")),
                                                 Convert.ToInt16(row.Item("nat_code"))}
                        Else
                            InstructDistParam = {Convert.ToInt32(refnumID),
                                                 Convert.ToInt16(row.Item("donation_code")),
                                                 Convert.ToDecimal(row.Item("totAmnt")),
                                                 Convert.ToDecimal(row.Item("quantity")),
                                                 Convert.ToInt16(row.Item("nat_code"))}
                        End If

                        _ws.ExecSp("charitysoft", Session("username"), Session("password"), "InsertInstructDet", CommandType.StoredProcedure, InstructDistParam)

                    Next

                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                        ShowAlert("تم حفظ الاستقطاع بنجاح")

                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                        ShowAlert("Instruction Saved Successfully")


                    End If

                    'btnPrint.Enabled = False

                    txtReceiptID.Text = refnumID.ToString()
                    'btnBnkRep.PostBackUrl = "~/BankStndReport.aspx?ref_numb=" & txtReceiptID.Text

                End If

            Catch ex As Exception
                btnsaveInstruct.Enabled = True
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ShowAlert("حدث خطأ" & Environment.NewLine & ex.Message)
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ShowAlert("Error" & Environment.NewLine & ex.Message)
                End If
        End Try
        Else
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                ShowAlert("الرجاء إدخال المعلومات المطلوبة على الشاشه باللون الاحمر")
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                ShowAlert("Please Enter Required Information in red color!")
            End If
        End If
        LastInstruction()
        btnsaveInstruct.Enabled = True
    End Sub

    Private Function DonationAndCountryHasPayments(ByVal rowIndex) As Boolean

        Dim re As Boolean = False

        Dim ref_num As Int32 = 0

        Int32.TryParse(txtReceiptID.Text, ref_num)

        If ref_num <> 0 Then

            Using db As New Database

                Dim donation_code_value As Int16 = 0
                Dim country_code_value As Int16 = 0

                myInstructDistDataTable = Session("myInstructDistDataTable")

                Int16.TryParse(myInstructDistDataTable.Rows(rowIndex)("donation_code"), donation_code_value)
                Int16.TryParse(myInstructDistDataTable.Rows(rowIndex)("nat_code"), country_code_value)

                re = ((From o In db.dont_dist Where o.standing_inst_num = ref_num And o.donation_code = donation_code_value And o.country_code = country_code_value Select o.standing_inst_num).Count() > 0)

            End Using

        End If

        Return re

    End Function

    Private Function Get_donation_standard_value(ByVal donation_code As Object, ByVal nat_code As Object) As Object

        Dim re As Object = Nothing

        Dim donationStandardValue As DataSet
        Dim sql As String

        If Not (donation_code) = "" Then
            sql = String.Format("SELECT [donation_standard_value] FROM [dbo].[donations_rates] WHERE ([donation_code] = {0}) AND ([nat_code] = {1})", donation_code, nat_code)

            donationStandardValue = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql)


            If (donationStandardValue.Tables(0).Rows.Count > 0) Then
                re = CDec(donationStandardValue.Tables(0).Rows(0).Item("donation_standard_value")).ToString("N3")
            End If

        Else
            'sql = String.Format("SELECT [donation_standard_value] FROM [dbo].[donations_rates] WHERE  ([nat_code] = {1})", nat_code)
        End If

        Return re

    End Function

    Private Sub DisplayDonationInfo(ByVal Refnum As DataSet)
        Try
            Dim standInstruct As DataSet
            Dim param() As Object
            Dim refditribution As DataSet
            Dim tmpbrncode As Integer
            Dim tmpMonth As Integer

            txtReceiptID.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("ref_numb")), String.Empty, Refnum.Tables(0).Rows(0).Item("ref_numb"))
            txtReceiptDate.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("instruct_date")), String.Empty, CDate(Refnum.Tables(0).Rows(0).Item("instruct_date")).ToString("dd/MM/yyyy"))
            txtnotes.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("remarks")), String.Empty, Refnum.Tables(0).Rows(0).Item("remarks").ToString())
            ddlCurrency.SelectedValue = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("currency_code")), Nothing, Refnum.Tables(0).Rows(0).Item("currency_code").ToString())
            ddlcampaign.SelectedValue = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("campaign_code")), Nothing, Refnum.Tables(0).Rows(0).Item("campaign_code").ToString())
            txtfavourof.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("ded_in_favar_of")), String.Empty, Refnum.Tables(0).Rows(0).Item("ded_in_favar_of").ToString())
            Dim status = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("standing_status")), Nothing, Refnum.Tables(0).Rows(0).Item("standing_status").ToString())
            If (Not status Is Nothing And status = 5) Then
                tr_header.Attributes("class") = "deleted"
                tr_standingInstructions.Attributes("class") = "deleted"
                tr_moreinfo.Attributes("class") = "deleted"
            Else
                tr_header.Attributes("class") = "header-label"
                tr_standingInstructions.Attributes("class") = "header-label"
                tr_moreinfo.Attributes("class") = "header-label"
            End If

            ddlstandStat.SelectedValue = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("standing_status")), Nothing, Refnum.Tables(0).Rows(0).Item("standing_status").ToString())
            ddlstatReasn.SelectedValue = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("status_reason")), Nothing, Refnum.Tables(0).Rows(0).Item("status_reason").ToString())
            ddlinstrcutSrc.SelectedValue = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("instruct_src")), Nothing, Refnum.Tables(0).Rows(0).Item("instruct_src").ToString())
            txtAccountNum.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("account_num")), String.Empty, Refnum.Tables(0).Rows(0).Item("account_num").ToString())
            txtBnkRefNo.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("bank_ref_num")), String.Empty, Refnum.Tables(0).Rows(0).Item("bank_ref_num").ToString())
            ddlBnk.SelectedValue = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("bank_code")), Nothing, Refnum.Tables(0).Rows(0).Item("bank_code").ToString())
            ddlnewBrn.DataBind()
            ddlnewBrn.SelectedValue = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("brn_code")), Nothing, Refnum.Tables(0).Rows(0).Item("brn_code").ToString())
            'tmpbrncode = IsDBNull(Refnum.Tables(0).Rows(0).Item("brn_code"))
            'If tmpbrncode >= 0 Then

            'End If
            txtStartDt.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("start_date")), String.Empty, CDate(Refnum.Tables(0).Rows(0).Item("start_date")).ToString("dd/MM/yyyy"))
            txtEndDate.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("end_date")), String.Empty, CDate(Refnum.Tables(0).Rows(0).Item("end_date")).ToString("dd/MM/yyyy"))
            txtTotalDeduct.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("total_deduct_value")), String.Empty, Refnum.Tables(0).Rows(0).Item("total_deduct_value").ToString())
            txtinstAmt.Text = If(IsDBNull(Refnum.Tables(0).Rows(0).Item("installment_value")), String.Empty, Refnum.Tables(0).Rows(0).Item("installment_value").ToString())
            'tmpMonth = DateDiff(CDate(txtEndDate.Text), CDate(txtStartDt.Text), "M")
            If (txtTotalDeduct.Text) > 0 And (txtinstAmt.Text) > 0 Then
                txtmonthNo.Text = Val(txtTotalDeduct.Text) / Val(txtinstAmt.Text)
            Else
                txtmonthNo.Text = ""
            End If
            'txtmonthNo.Text = Val(tmpMonth)
            LastInstruction_Amount()
            param = {Refnum.Tables(0).Rows(0).Item("ref_numb")}
            '' IIf(CultureInfo.CurrentUICulture.Name.Contains("en"), "English", "Arabic")}

            refditribution = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetinstructDist", CommandType.StoredProcedure, param)
            DisplayDonationheadcode(refditribution)
            If Not refditribution Is Nothing Then

                If refditribution.Tables.Count > 0 Then

                    myInstructDistDataTable = refditribution.Tables(0)
                    Session("myInstructDistDataTable") = myInstructDistDataTable

                End If
            End If
            grvInstruction.DataSource = myInstructDistDataTable
            grvInstruction.DataBind()

            'Select Case ddlstandStat.SelectedValue
            '    Case 3
            '        btnsaveInstruct.Enabled = False
            '    Case 4
            '        btnsaveInstruct.Enabled = False
            '    Case Else
            '        btnsaveInstruct.Enabled = True
            'End Select

            Dim isNew As Boolean = (txtReceiptID.Text = "")

            'btnsaveInstruct.Enabled = (btnsaveInstruct.Enabled And isNew)

            'btnsaveInstruct.Enabled = isNew

        Catch ex As Exception

            ShowAlert(ex.Message)

        End Try

    End Sub

    Private Sub DisplayDonationheadcode(ByVal RefnumCat As DataSet)
        Try

            ddlWaqfDonation.SelectedValue = If(IsDBNull(RefnumCat.Tables(0).Rows(0).Item("donation_cat")), Nothing, RefnumCat.Tables(0).Rows(0).Item("donation_cat").ToString())

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
        'btnCreate.Enabled = False
    End Sub

    Sub ShowAlert(ByVal message As String)
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "notificationScript", "<script> alert('" & message & "'); </script>", False)
    End Sub

    Private Sub EnableDonorProfile()

        btnOpen.Enabled = False
        'btnCreate.Enabled = True
        txtMobile.Enabled = True
        txtEnglishName.Enabled = True
        txtArabicName.Enabled = True
        txtCivilID.Enabled = True
        txtPhone.Enabled = True
        ddlDonorType.Enabled = True
    End Sub

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
        myInstructDistDataColumn.ColumnName = "donation_standard_value"
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

    Private Sub ClearForm()
        Try
            datalib.ClearForm(UpdatePanel1)
            txtReceiptDate.Text = DateTime.Now.ToString("dd/MM/yyyy")
            ddlCurrency.SelectedIndex = 1
            txtmonthNo.Text = "0"

        Catch ex As Exception

        End Try

        LastInstruction()

    End Sub

    Private Function GetPaymentTotalAmount(ByVal myInstructDistDataTable As DataTable) As Decimal
        Dim paymentTotalAmount As Decimal

        If (myInstructDistDataTable.Rows.Count > 0) Then
            'added new
            For Each row As DataRow In myInstructDistDataTable.Rows
                If (CDec(row.Item("donation_standard_value")) <> 0) Then
                    'paymentTotalAmount += CDec(row.Item("donation_standard_value")) * CDec(row.Item("quantity"))
                    paymentTotalAmount += CDec(row.Item("totAmnt"))
                Else
                    paymentTotalAmount += CDec(row.Item("totAmnt")) * 1
                End If

            Next

        Else

            paymentTotalAmount = 0

        End If

        Return paymentTotalAmount
    End Function

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'ApplicationSecurity.OpenWebForm(DatabaseSecurity.IsRoleMember(DatabaseRoles.ded_sub_men))

        Try
            'Get the Page Culture to pass it to the clien side
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                _culture = "ar"

            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                _culture = "en"

            End If

            If Not IsPostBack Then

                ddlCurrency.SelectedValue = 1
                'For Testing, username and password must be enter from Login Form
                'Session("username") = "sa"
                Session("user_id") = Session(SessionKey.USERNAME)
                Session("UsrID") = Session(SessionKey.USERNAME)

                ' Session("password") = "pass@word1"

                ' fill_donations()
                txtReceiptDate.Text = DateTime.Now.ToString("dd/MM/yyyy")
                ddlcampaign.Enabled = True
                btnOpen.Enabled = False
                'btnCreate.Enabled = True

                ddlstandStat.SelectedIndex = 1
                'pnlSearchByNameResults.Visible = False
                InitializeInstructDistDataTable()
                LastInstruction()
                txtSearch.Focus()
                grvInstruction.DataBind()

                'Get the DOnor Details if user open New Receipt from Donor Profile
                If (Not String.IsNullOrWhiteSpace(Request.QueryString("DonorID"))) Then

                    Dim donorDS As New DataSet
                    Dim donerID() As Object = {Request.QueryString("DonorID")}

                    donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByID", CommandType.StoredProcedure, donerID)

                    If (donorDS.Tables(0).Rows().Count > 0) Then

                        'Pass the data set to Display Donor Information Method
                        DisplayDonorInfo(donorDS)
                        ddlWaqfDonation.Focus()
                    Else
                        ClearForm()
                        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                            ShowAlert("لا يوجد بيانات")
                        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                            ShowAlert("No Data Found")
                        End If
                        EnableDonorProfile()
                    End If

                Else

                    LoadByRefNum()

                End If


            End If

            Dim isNew As Boolean = (txtReceiptID.Text.Trim() = "")
            ddlstatReasn.Enabled = Not isNew


        Catch ex As Exception

        End Try

    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click

        Try
            If (Not String.IsNullOrWhiteSpace(txtSearch.Text)) Then

                Dim donorDS As New DataSet

                Select Case ddlSearchType.SelectedValue

                    Case SearchType.ID
                        If IsNumeric(txtSearch.Text) And Len(txtSearch.Text) < 8 Then
                            Dim donerID() As Object = {txtSearch.Text.Trim()}

                            donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByID", CommandType.StoredProcedure, donerID)

                            If (donorDS.Tables(0).Rows().Count > 0) Then

                                'Pass the data set to Display Donor Information Method
                                'DisplayDonorInfo(donorDS)
                                Response.Redirect(String.Format("~/InstructionFrm.aspx?DonorId={0}", donerID))

                            Else
                                ClearForm()

                                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                    ShowAlert("لا يوجد بيانات")
                                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                    ShowAlert("No Data Found")
                                End If
                                'EnableDonorProfile()

                            End If
                        Else
                            ClearForm()
                            grvInstruction.DataBind()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("الرقم غير صحيح")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("Number Not Correct")
                            End If
                            'EnableDonorProfile()

                        End If
                    Case SearchType.CivilID

                        Dim donerCivilID() As Object = {txtSearch.Text.Trim()}

                        If IsNumeric(txtSearch.Text) And Len(txtSearch.Text) <= 12 Then
                            donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByCivilID", Data.CommandType.StoredProcedure, donerCivilID)

                            If (donorDS.Tables(0).Rows().Count > 0) Then

                                'Pass the data set to Display Donor Information Method
                                'DisplayDonorInfo(donorDS)
                                Response.Redirect(String.Format("~/InstructionFrm.aspx?DonorId={0}", donorDS.Tables(0).Rows(0)("donor_id")))

                            Else
                                ClearForm()
                                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                    ShowAlert("لا يوجد بيانات")
                                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                    ShowAlert("No Data Found")
                                End If
                                'EnableDonorProfile()
                            End If
                        Else
                            ClearForm()
                            grvInstruction.DataBind()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("رقم المدنية غير صحيح")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("Civil ID Number Invalid")
                            End If
                            ' EnableDonorProfile()
                        End If



                    Case SearchType.Phone

                        Dim donorPhoneNumber() As Object = {txtSearch.Text.Trim()}
                        If IsNumeric(txtSearch.Text) Then

                            donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByPhoneNumber", Data.CommandType.StoredProcedure, donorPhoneNumber)

                            If (donorDS.Tables(0).Rows().Count > 0) Then

                                'Pass the data set to Display Donor Information Method
                                'DisplayDonorInfo(donorDS)
                                Response.Redirect(String.Format("~/InstructionFrm.aspx?DonorId={0}", donorDS.Tables(0).Rows(0)("donor_id")))

                            Else
                                ClearForm()
                                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                    ShowAlert("لا يوجد بيانات")
                                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                    ShowAlert("No Data Found")
                                End If
                                ' EnableDonorProfile()
                            End If
                        Else
                            ClearForm()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("رقم غير صحيح")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("Number Not Correct")
                            End If
                            'EnableDonorProfile()
                        End If

                    Case SearchType.Mobile

                        Dim donorMobileNumber() As Object = {txtSearch.Text.Trim()}
                        If IsNumeric(txtSearch.Text) Then
                            donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByMobileNumber", Data.CommandType.StoredProcedure, donorMobileNumber)

                            If (donorDS.Tables(0).Rows().Count > 0) Then

                                'Pass the data set to Display Donor Information Method
                                'DisplayDonorInfo(donorDS)
                                Response.Redirect(String.Format("~/InstructionFrm.aspx?DonorId={0}", donorDS.Tables(0).Rows(0)("donor_id")))

                            Else
                                ClearForm()
                                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                    ShowAlert("لا يوجد بيانات")
                                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                    ShowAlert("No Data Found")
                                End If
                                'EnableDonorProfile()
                            End If
                        Else
                            ClearForm()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("رقم غير صحيح")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("Number Not Correct")
                            End If
                            'EnableDonorProfile()
                        End If

                    Case SearchType.ArabicName

                        Dim donorArabicName() As Object = {txtSearch.Text.Trim()}

                        donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchArName", Data.CommandType.StoredProcedure, donorArabicName)

                        If (donorDS.Tables(0).Rows().Count > 0) Then

                            grvSearchResult.DataSource = donorDS
                            grvSearchResult.DataBind()
                            pnlSreachResult_ModalPopupExtender.Show()

                        Else
                            ClearForm()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("لا يوجد بيانات")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("No Data Found")
                            End If
                            'EnableDonorProfile()
                        End If

                    Case SearchType.EnglishName

                        Dim donorEnglishName() As Object = {txtSearch.Text.Trim()}

                        donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchEngName", Data.CommandType.StoredProcedure, donorEnglishName)

                        If (donorDS.Tables(0).Rows().Count > 0) Then

                            grvSearchResult.DataSource = donorDS
                            grvSearchResult.DataBind()
                            pnlSreachResult_ModalPopupExtender.Show()
                        Else
                            ClearForm()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("لا يوجد بيانات")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("No Data Found")
                            End If
                            'EnableDonorProfile()
                        End If



                    Case SearchType.RefNum

                        Dim Refnum() As Object = {txtSearch.Text.Trim()}
                        If IsNumeric(txtSearch.Text) Then
                            donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchRefNumByID", Data.CommandType.StoredProcedure, Refnum)

                            If (donorDS.Tables(0).Rows().Count > 0) Then

                                DisplayDonationInfo(donorDS)
                                DisplayDonorInfo(donorDS)

                                'Response.Redirect(String.Format("~/InstructionFrm.aspx?DonorId={0}", donorDS.Tables(0).Rows(0)("donor_id")))

                            Else
                                ClearForm()
                                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                    ShowAlert("لا يوجد بيانات")
                                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                    ShowAlert("No Data Found")
                                End If

                            End If
                        Else
                            ClearForm()
                            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                ShowAlert("رقم غير صحيحة")
                            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                ShowAlert("Ref Number Not Correct")
                            End If
                            ' EnableDonorProfile()
                        End If

                    Case SearchType.AccountNum
                        Dim AccNum() As Object = {txtSearch.Text.Trim()}

                        donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchAccNumByID", Data.CommandType.StoredProcedure, AccNum)

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

            Dim isNew As Boolean = (txtReceiptID.Text.Trim() = "")
            ddlstatReasn.Enabled = Not isNew

        Catch FormatException As FormatException
            'User input incorrect format

        Catch ex As Exception
            ShowAlert(ex.Message)
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
            myInstructDistDataRow("donation_standard_value") = Convert.ToDecimal(txtdistvaluefooter.Text)
            myInstructDistDataRow("quantity") = Convert.ToDecimal(txtquantfooter.Text)
            'If Val(txtdistvaluefooter.Text) > 0 And Val(txtquantfooter.Text) > 0 Then
            '    ttamt = Val(txtdistvaluefooter.Text) * Val(txtquantfooter.Text)
            'Else
            '    ttamt = 0
            'End If

            If Val(txtquantfooter.Text) = 1 Then
                ttamt = Val(txtTotalfooter.Text)

            Else
                ttamt = Val(txtdistvaluefooter.Text) * Val(txtquantfooter.Text)
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
            myInstructDistDataRow("donation_standard_value") = Convert.ToDecimal(txtDistvalue.Text)
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

    'Protected Sub btnCreate_Click(sender As Object, e As EventArgs) Handles btnCreate.Click
    '    Try
    '        Dim donorID As Int32
    '        Dim donorParam() As Object = {txtArabicName.Text,
    '                                      txtEnglishName.Text,
    '                                      txtPhone.Text,
    '                                      txtMobile.Text,
    '                                      txtCivilID.Text,
    '                                      Convert.ToByte(ddlDonorType.SelectedValue),
    '                                      0}

    '        donorID = _ws.ExecSp("charitysoft", Session("username"), Session("password"), "InsertDonorInstatnt", CommandType.StoredProcedure, donorParam)

    '        If (donorID > 0) Then

    '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

    '                ShowAlert("تم حفظ ملف المتبرع بنجاح")

    '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

    '                ShowAlert("Donor Profile Saved Successfully")

    '            End If

    '            DisableDonorProfile()
    '            'Display New Donor ID
    '            txtDonrIDn.Text = donorID.ToString()
    '            'Add Donor Id to Open Button in order to open his/her profile
    '            btnOpen.PostBackUrl = "~/AddDonar.aspx?DonorId=" & donorID.ToString()

    '        Else

    '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

    '                ShowAlert("لم يتم حفظ ملف المتبرع")

    '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

    '                ShowAlert("Donor Profile Saved Fail")

    '            End If

    '        End If

    '    Catch ex As Exception

    '    End Try
    'End Sub

    Protected Sub btnReset_Click(sender As Object, e As EventArgs) Handles btnReset.Click

        'ClearForm()

        btnOpen.Enabled = False
        'btnCreate.Enabled = True
        ddlcampaign.Enabled = True
        ddlstandStat.SelectedIndex = 1
        Session("receipt") = Nothing
        Session("donor") = Nothing
        'Session("myInstructDistDataTable") = Nothing
        myInstructDistDataTable = Session("myInstructDistDataTable")
        myInstructDistDataTable.Clear()
        'myInstructDistDataTable = Nothing
        Session("myInstructDistDataTable") = myInstructDistDataTable

        Response.Redirect("~/InstructionFrm.aspx")

    End Sub

    Protected Sub btnsaveInstruct_Click(sender As Object, e As EventArgs) Handles btnsaveInstruct.Click

        Saving()

    End Sub

    'Protected Sub btnBnkRep_Click(sender As Object, e As EventArgs) Handles btnBnkRep.Click
    '    'Try
    '    '    If Len(txtReceiptID.Text) > 0 Then
    '    '        Dim ReportDS As New DataSet
    '    '        Dim refID() As Object = {txtReceiptID.Text.Trim()}

    '    '        ReportDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "stand_inst_report", CommandType.StoredProcedure, refID)
    '    '        If (ReportDS.Tables(0).Rows.Count > 0) Then
    '    '            btnBnkRep.PostBackUrl = "~/BankStndReport.aspx?ref_numb=" & ReportDS.Tables(0).Rows(0).Item("ref_numb").ToString
    '    '        End If
    '    '    Else
    '    '        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '    '            ShowAlert("الرجاء إدخال الأستقطاع البنكي")
    '    '        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '    '            ShowAlert("Please Enter Bank Intruction Number!")
    '    '        End If
    '    '    End If
    '    'Catch ex As Exception

    '    'End Try

    '    'LastInstruction()
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
        LastInstruction()
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
            'ddlstatReasn.Enabled = True

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

            'Consider this back door : edit the row > change the country > then it can deleted.
            If DonationAndCountryHasPayments(e.RowIndex) Then

                ShowAlert("لا يمكن حذف هذا التبرع لانه تم السداد عليه")

            Else

                'myInstructDistDataTable.Rows(e.RowIndex).Delete()
                myInstructDistDataTable.Rows.RemoveAt(e.RowIndex)

                grvInstruction.DataSource = myInstructDistDataTable
                grvInstruction.DataBind()

                Session("myInstructDistDataTable") = myInstructDistDataTable

            End If

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

    Private Sub grvInstruction_RowUpdating(sender As Object, e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grvInstruction.RowUpdating
        Try
            myInstructDistDataTable = Session("myInstructDistDataTable")

            Dim txtrefnumedit As TextBox = grvInstruction.Rows(e.RowIndex).FindControl("txtrefnumedit")
            Dim txtDistValueEdit As TextBox = grvInstruction.Rows(e.RowIndex).FindControl("txtDistValueEdit")
            Dim txtquantEdit As TextBox = grvInstruction.Rows(e.RowIndex).FindControl("txtquantEdit")
            Dim ddlCountry As DropDownList = grvInstruction.Rows(e.RowIndex).FindControl("ddl_nat")
            Dim txtTotalEdit As TextBox = grvInstruction.Rows(e.RowIndex).FindControl("txtTotalEdit")


            If (myInstructDistDataTable.Rows(e.RowIndex).Item("donation_standard_value") = 0) Then
                'myInstructDistDataTable.Rows(e.RowIndex).Item("donation_standard_value") = Convert.ToDecimal(txtDistValueEdit.Text)
                myInstructDistDataTable.Rows(e.RowIndex).Item("nat_code") = ddlCountry.SelectedValue
                myInstructDistDataTable.Rows(e.RowIndex).Item("nat_descrar") = ddlCountry.SelectedItem.Text
                myInstructDistDataTable.Rows(e.RowIndex).Item("quantity") = Convert.ToDecimal(txtquantEdit.Text)
                myInstructDistDataTable.Rows(e.RowIndex).Item("totAmnt") = Convert.ToDecimal(txtDistValueEdit.Text) * 1
            Else
                myInstructDistDataTable.Rows(e.RowIndex).Item("donation_standard_value") = Convert.ToDecimal(txtDistValueEdit.Text)
                myInstructDistDataTable.Rows(e.RowIndex).Item("nat_code") = ddlCountry.SelectedValue
                myInstructDistDataTable.Rows(e.RowIndex).Item("nat_descrar") = ddlCountry.SelectedItem.Text
                myInstructDistDataTable.Rows(e.RowIndex).Item("quantity") = Convert.ToDecimal(txtquantEdit.Text)
                myInstructDistDataTable.Rows(e.RowIndex).Item("totAmnt") = Convert.ToDecimal(txtDistValueEdit.Text) * Convert.ToDecimal(txtquantEdit.Text)
            End If

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
                    '***pnlinstructDetail.Visible = True
                    'pnlSearchByNameResults.Visible = True

                    grdReport.DataSource = donorDSNew
                    grdReport.DataBind()
                    pnlreport_ModalPopupExtender.Show()
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
    Private Sub LastInstruction()

        Dim LastInst As DataSet
        Dim sql As String
        sql = "SELECT Max(dbo.standing_instruction.ref_numb) Numb from dbo.standing_instruction"

        LastInst = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql)

        If (LastInst.Tables(0).Rows.Count > 0) Then
            lblLastInstructValue.Text = LastInst.Tables(0).Rows(0).Item("Numb")

        Else
            lblLastInstructValue.Text = ""
        End If


    End Sub
    Private Sub LastInstruction_Amount()
        Dim InstructDs As New DataSet
        Dim refNumId() As Object = {txtReceiptID.Text.Trim()}

        InstructDs = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GEt_LastInstructPaymnet", CommandType.StoredProcedure, refNumId)
        If (InstructDs.Tables(0).Rows.Count > 0) Then
            lblLastInstructAmountValue.Text = InstructDs.Tables(0).Rows(0).Item("reciept_date")
        Else
            lblLastInstructAmountValue.Text = ""
        End If
    End Sub
    'Protected Sub chkWaqf_CheckedChanged(sender As Object, e As EventArgs) Handles chkWaqf.CheckedChanged
    '    Try
    '        If chkWaqf.Checked = True Then
    '            ddlDontationCat.SelectedIndex = 2
    '            ddlcampaign.SelectedIndex = 0
    '            ddlcampaign.Enabled = False
    '        Else
    '            ddlDontationCat.SelectedIndex = 1
    '            ddlcampaign.Enabled = True
    '        End If
    '    Catch ex As Exception
    '    End Try
    'End Sub
    'removed for type
    'Protected Sub ddlDontationCat_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlDontationCat.SelectedIndexChanged
    '    Try
    '        If ddlDontationCat.SelectedIndex = 2 Then
    '            ddlcampaign.SelectedIndex = 0
    '            ddlcampaign.Enabled = False
    '            ddlWaqfDonation.SelectedIndex = 2
    '            ddlcampaign.SelectedIndex = 0
    '            ddlcampaign.Enabled = False
    '        Else
    '            ddlDontationCat.SelectedIndex = 1
    '            ddlcampaign.Enabled = True
    '            ddlWaqfDonation.SelectedIndex = 0
    '            ddlcampaign.Enabled = True
    '        End If
    '    Catch ex As Exception
    '    End Try

    'End Sub
    'Protected Sub ddlWaqfDonation_SelectedIndexChanged(sender As Object, e As EventArgs)
    '    Try
    '        If ddlWaqfDonation.SelectedIndex = 2 Then
    '            'ddlDontationCat.SelectedIndex = 2
    '        Else
    '            'ddlDontationCat.SelectedIndex = 0
    '        End If

    '    Catch ex As Exception

    '    End Try
    'End Sub

    Protected Sub Linkbutton3_Click(sender As Object, e As EventArgs)
        Try
            If (Not String.IsNullOrWhiteSpace(Request.QueryString("DonorID"))) Then

                Dim donorDS As New DataSet
                Dim donerID() As Object = {txtSearch.Text.Trim()}
                ' Dim donerID() As Object = {deals_grid.Columns.}

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


    'Protected Sub btnPrint_Click(sender As Object, e As EventArgs) Handles btnPrint.Click
    ' ClearForm()
    ' EnableDonorProfile()
    '  End Sub

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

    Protected Sub lbtnCalNoOfMonth_Click(sender As Object, e As EventArgs) Handles lbtnCalNoOfMonth.Click
        Try
            Dim startDate As DateTime = DateTime.ParseExact(txtStartDt.Text, "dd/MM/yyyy", Nothing)
            If (Not String.IsNullOrWhiteSpace(txtmonthNo.Text)) Then
                txtEndDate.Text = startDate.AddMonths(Convert.ToInt32(txtmonthNo.Text)).ToString("dd/MM/yyyy")
                txtinstAmt.Focus()
            End If

        Catch ex As Exception

        End Try
    End Sub

    'Protected Sub txtmonthNo_TextChanged(sender As Object, e As EventArgs) Handles txtmonthNo.TextChanged
    '    If IsNumeric(txtmonthNo.Text) Then
    '        Try

    '        Catch ex As Exception

    '        End Try
    '    End If
    'End Sub

    'Private Sub deals_grid_PageIndexChanged(source As Object, e As System.Web.UI.WebControls.DataGridPageChangedEventArgs) Handles deals_grid.PageIndexChanged
    '    deals_grid.SelectedIndex = -1

    '    deals_grid.CurrentPageIndex = e.NewPageIndex
    '    deals_grid.DataBind()
    '    deals_grid.Visible = True
    'End Sub
    'Protected Sub lnk_hide_panel_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnk_hide_panel.ServerClick
    '    Panel2.Visible = False
    'End Sub

    Private Sub chkcont_CheckedChanged(sender As Object, e As System.EventArgs) Handles chkcont.CheckedChanged
        Try
            If chkcont.Checked = True Then
                txtTotalDeduct.Enabled = False
                txtTotalDeduct.Text = 0
                txtinstAmt.Enabled = True
                txtmonthNo.Text = 0
                txtEndDate.Text = ""
            Else
                txtTotalDeduct.Enabled = True
                txtinstAmt.Enabled = True
                'txtTotalDeduct.Text = 0

            End If
        Catch ex As Exception
        End Try
    End Sub

    Protected Sub btnDetail_Click(sender As Object, e As EventArgs) Handles btnDetail.Click
        If (Not String.IsNullOrWhiteSpace(txtReceiptID.Text)) Then

            Dim RefDetail As New DataSet
            Try
                Dim RefNumber() As Object = {txtReceiptID.Text.Trim()}

                RefDetail = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDetailCollect", Data.CommandType.StoredProcedure, RefNumber)

                If (RefDetail.Tables(0).Rows().Count > 0) Then

                    'Pass the data set to Display Donor Information Method
                    'pnlSearchByNameResults_ModalPopupExtender.Show()
                    'pnlSearchByNameResults.Visible = True
                    'DisplayDonorInfo(donorDS)
                    '***pnlinstructDetail.Visible = True
                    'pnlSearchByNameResults.Visible = True

                    'Remove Comment
                    grdDetails.DataSource = RefDetail
                    grdDetails.DataBind()
                    pnldetail_ModalPopupExtender.Show()
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

    Protected Sub ddlcountry_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim PurposeType As DropDownList = grvInstruction.Controls(0).Controls(1).FindControl("ddlDonationNew")
        Dim country As DropDownList = grvInstruction.Controls(0).Controls(1).FindControl("ddlcountry")
        Dim donationValue As TextBox = grvInstruction.Controls(0).Controls(1).FindControl("txtDistValue")

        If Not PurposeType Is Nothing And Not country Is Nothing And Not donationValue Is Nothing Then

            donationValue.Text = Get_donation_standard_value(PurposeType.SelectedValue, country.SelectedValue)

        End If

    End Sub

    Protected Sub ddlDonationddlDonationNew_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlWaqfDonation.SelectedIndexChanged


        Dim PurposeType As DropDownList = grvInstruction.Controls(0).Controls(1).FindControl("ddlDonationNew")
        Dim country As DropDownList = grvInstruction.Controls(0).Controls(1).FindControl("ddlcountry")
        Dim donationValue As TextBox = grvInstruction.Controls(0).Controls(1).FindControl("txtDistValue")

        If Not PurposeType Is Nothing And Not country Is Nothing And Not donationValue Is Nothing Then

            donationValue.Text = Get_donation_standard_value(PurposeType.SelectedValue, country.SelectedValue)

        End If

    End Sub

    Protected Sub DropDownListFooterAr_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim PurposeType As DropDownList = grvInstruction.FooterRow.FindControl("ddlDonationAra")
        Dim country As DropDownList = grvInstruction.FooterRow.FindControl("ddlCountryFooter")
        Dim donationValue As TextBox = grvInstruction.FooterRow.FindControl("txtDistValuefooter")

        If Not PurposeType Is Nothing And Not country Is Nothing And Not donationValue Is Nothing Then

            donationValue.Text = Get_donation_standard_value(PurposeType.SelectedValue, country.SelectedValue)

        End If

    End Sub

    Protected Sub ddlCountryFooter_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim PurposeType As DropDownList = grvInstruction.FooterRow.FindControl("ddlDonationAra")
        Dim country As DropDownList = grvInstruction.FooterRow.FindControl("ddlCountryFooter")
        Dim donationValue As TextBox = grvInstruction.FooterRow.FindControl("txtDistValuefooter")

        If Not PurposeType Is Nothing And Not country Is Nothing And Not donationValue Is Nothing Then

            donationValue.Text = Get_donation_standard_value(PurposeType.SelectedValue, country.SelectedValue)

        End If

    End Sub

    Protected Sub Cmd_Standing_Plan_Click(sender As Object, e As EventArgs) Handles Cmd_Standing_Plan.Click

    End Sub

#End Region

End Class