#Region "Imports Directives"

Imports System.Web.Services.Description
Imports DirectAid.datalib
Imports System.Globalization
Imports System.Data
Imports System.Threading

#End Region

Public Class Standing_Plan
    Inherits BaseWebForm
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

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            ViewState("PreviousPage") = Request.UrlReferrer

        End If


        Try
            'Get the Page Culture to pass it to the clien side
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                _culture = "ar"

            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                _culture = "en"

            End If



            If (IsPostBack) Then

            Else

                Session("username") = Session(SessionKey.USERNAME)
                Session("user_id") = Session(SessionKey.USERNAME)
                Session("UsrID") = Session(SessionKey.USERNAME)
                InitializeInstructDistDataTable()
                ' Session("password") = "pass@word1"
                'Dim donorDS As New DataSet
                Dim abc As Integer
                'Dim donerID() As Object = {Request.QueryString("refnumb")}
                abc = 10
                txtrefnum.Text = Request.QueryString("refnumb")
                ' grvpln.DataBind()

                If (Not String.IsNullOrWhiteSpace(Request.QueryString("refnumb"))) Then
                    Dim donorDS As New DataSet
                    Dim RefDS As New DataSet
                    Dim tmpInsert As New DataSet
                    Dim receiptID() As Object = {Request.QueryString("refnumb")}
                    Dim RefId() As Object = {Request.QueryString("refnumb")}
                    Dim RefInsert() As Object = {Request.QueryString("refnumb")}
                    RefDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchRefNumByID", Data.CommandType.StoredProcedure, RefId)
                    DisplayDonorInfo(RefDS)

                    donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchplanbyRef", Data.CommandType.StoredProcedure, receiptID)

                    If (donorDS.Tables(0).Rows().Count > 0) Then

                        DisplayReceiptInfo(donorDS)

                    Else
                        '    ClearForm()
                        '    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                        '        ShowAlert("لا يوجد بيانات")
                        '    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                        '        ShowAlert("No Data Found")
                        '    End If

                    End If
                    'added New
                    'tmpInsert = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "Standing_Plan_tmpInsert", Data.CommandType.StoredProcedure, RefInsert)
                    'If (tmpInsert.Tables(0).Rows().Count > 0) Then
                    '    Grd_DOnations.DataBind()
                    'End If
                End If

            End If



        Catch ex As Exception

        End Try

    End Sub
    Private Sub DisplayDonorInfo(ByVal donor As DataSet)

        Try

            txtDonrIDn.Text = donor.Tables(0).Rows(0).Item("donor_id").ToString()
            txtArabicName.Text = If(IsDBNull(donor.Tables(0).Rows(0).Item("donor_namear")), String.Empty, donor.Tables(0).Rows(0).Item("donor_namear"))
            
        Catch ex As Exception

        End Try
    End Sub
    Private Sub DisplayReceiptInfo(ByVal receipt As DataSet)
        Try
            'Dim receiptPaymentDist As DataSet
            Dim param() As Object
            Dim receiptDonationDist As DataSet



            param = {receipt.Tables(0).Rows(0).Item("ref_numb"),
                     IIf(CultureInfo.CurrentUICulture.Name.Contains("en"), "English", "Arabic")}


            receiptDonationDist = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetPlanDonationDist", CommandType.StoredProcedure, param)

            grvpln.DataSource = receiptDonationDist
            grvpln.DataBind()

        Catch ex As Exception

        End Try

    End Sub
    Private Sub ClearForm()
        Try
            datalib.ClearForm(UpdatePanel)

            'txtrefnum.Text = 0.ToString("N3")


        Catch ex As Exception

        End Try

    End Sub
    Private Sub InitializeInstructDistDataTable()
        'Create DataTable that represents the add_idv Table in the DB Or the Addresses Table
        myInstructDistDataTable = New DataTable("plan_dist")

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
        grvpln.DataSource = myInstructDistDataTable
        grvpln.DataBind()

    End Sub
    Protected Sub ddlcountry_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim PurposeType As DropDownList = grvpln.Controls(0).Controls(1).FindControl("ddlDonationNew")
        Dim country As DropDownList = grvpln.Controls(0).Controls(1).FindControl("ddlcountry")
        Dim donationValue As TextBox = grvpln.Controls(0).Controls(1).FindControl("txtDistValue")

    End Sub
    Protected Sub DropDownListFooterAr_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim PurposeType As DropDownList = grvpln.FooterRow.FindControl("ddlDonationAra")
        Dim country As DropDownList = grvpln.FooterRow.FindControl("ddlCountryFooter")
        Dim donationValue As TextBox = grvpln.FooterRow.FindControl("txtDistValuefooter")


    End Sub
    Protected Sub ddlCountryFooter_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim PurposeType As DropDownList = grvpln.FooterRow.FindControl("ddlDonationAra")
        Dim country As DropDownList = grvpln.FooterRow.FindControl("ddlCountryFooter")
        Dim donationValue As TextBox = grvpln.FooterRow.FindControl("txtDistValuefooter")



    End Sub
    Protected Sub ddlDonationddlDonationNew_SelectedIndexChanged(sender As Object, e As EventArgs)


        Dim PurposeType As DropDownList = grvpln.Controls(0).Controls(1).FindControl("ddlDonationNew")
        Dim country As DropDownList = grvpln.Controls(0).Controls(1).FindControl("ddlcountry")
        Dim donationValue As TextBox = grvpln.Controls(0).Controls(1).FindControl("txtDistValue")




    End Sub
    Sub ShowAlert(ByVal message As String)
        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "notificationScript", "<script> alert('" & message & "'); </script>", False)
    End Sub
    Protected Sub lbtnAddDistFooter_Click(sender As Object, e As EventArgs)
        Try

            Dim ddldonationAra As DropDownList = grvpln.FooterRow.FindControl("ddldonationAra")
            Dim txtdistvaluefooter As TextBox = grvpln.FooterRow.FindControl("txtDistvaluefooter")
            Dim txtrefnum As TextBox = grvpln.FooterRow.FindControl("txtrefnum")
            Dim txtTotalfooter As TextBox = grvpln.FooterRow.FindControl("txtTotalfooter")
            Dim ddlcountryfooter As DropDownList = grvpln.FooterRow.FindControl("ddlcountryfooter")
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
            ' myInstructDistDataRow("donation_standard_value") = Convert.ToDecimal(txtdistvaluefooter.Text)

            'If Val(txtdistvaluefooter.Text) > 0 And Val(txtquantfooter.Text) > 0 Then
            '    ttamt = Val(txtdistvaluefooter.Text) * Val(txtquantfooter.Text)
            'Else
            '    ttamt = 0
            'End If

           
            ttamt = Val(txtTotalfooter.Text)


            myInstructDistDataRow("totAmnt") = Convert.ToDecimal(ttamt)
            myInstructDistDataRow("nat_code") = Convert.ToInt16(ddlcountryfooter.SelectedValue)
            myInstructDistDataRow("nat_descrar") = ddlcountryfooter.SelectedItem.Text


            'add the new DataRow to DataTable's Row
            myInstructDistDataTable.Rows.Add(myInstructDistDataRow)


            Session("InstructPlanTable") = myInstructDistDataTable

            grvpln.DataSource = myInstructDistDataTable
            grvpln.DataBind()

        Catch ex As Exception

        End Try
    End Sub
    Protected Sub lbtnAddDist_Click(sender As Object, e As EventArgs)
        Try

            Dim ddlDonationNew As DropDownList = grvpln.Controls(0).Controls(1).FindControl("ddlDonationNew")
            Dim txtTotal As TextBox = grvpln.Controls(0).Controls(1).FindControl("txtTotal")
            Dim ddlcountry As DropDownList = grvpln.Controls(0).Controls(1).FindControl("ddlcountry")


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

            myInstructDistDataRow("totAmnt") = Convert.ToDecimal(txtTotal.Text)
            myInstructDistDataRow("nat_code") = Convert.ToInt16(ddlcountry.SelectedValue)
            myInstructDistDataRow("nat_descrar") = ddlcountry.SelectedItem.Text
            'add the new DataRow to DataTable's Row
            If (myInstructDistDataRow("donation_code") > 0) Then
                myInstructDistDataTable.Rows.Add(myInstructDistDataRow)

                Session("myInstructDistDataTable") = myInstructDistDataTable

                grvpln.DataSource = myInstructDistDataTable
                grvpln.DataBind()
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
    Protected Sub btnSavePlan_Click(sender As Object, e As EventArgs) Handles btnSavePlan.Click

        If Len(txtrefnum.Text) > 0 Then
            Try


                Dim InstructDistParam() As Object


                'Get the Donation and Payments Distribution from session to use them in insert
                myInstructDistDataTable = Session("myInstructDistDataTable")


                'Insert Record
               

                If (txtrefnum.Text > 0) Then
                    deletebeforesave()
                    'Insert Instruction Dist.
                    For Each row As DataRow In myInstructDistDataTable.Rows

                        InstructDistParam = {Convert.ToInt32(txtrefnum.Text),
                                             Convert.ToInt16(row.Item("donation_code")),
                                             Convert.ToInt16(row.Item("nat_code")),
                                             Convert.ToDecimal(row.Item("totAmnt"))}


                        _ws.ExecSp("charitysoft", Session("username"), Session("password"), "InsertStandingPlan", CommandType.StoredProcedure, InstructDistParam)
                    Next




                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                        ShowAlert("تم حفظ الاستقطاع بنجاح")

                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                        ShowAlert("Instruction Plan Successfully")


                    End If

                    'btnPrint.Enabled = False


                End If

            Catch ex As Exception
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ShowAlert("الرجاء إدخال المعلومات المطلوبة على الشاشه باللون الاحمر")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ShowAlert("Please Enter Required Information in red color!")
                End If
            End Try
        Else
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                ShowAlert("الرجاء إدخال المعلومات المطلوبة على الشاشه باللون الاحمر")
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                ShowAlert("Please Enter Required Information in red color!")
            End If
        End If
    End Sub
    Protected Sub btnReset_Click(sender As Object, e As EventArgs) Handles btnReset.Click

        'ClearForm()

        
        'Session("myInstructDistDataTable") = Nothing
        myInstructDistDataTable = Session("myInstructDistDataTable")
        myInstructDistDataTable.Clear()
        'myInstructDistDataTable = Nothing
        Session("myInstructDistDataTable") = myInstructDistDataTable

        'Response.Redirect("~/InstructionFrm.aspx")

        If Not ViewState("PreviousPage") Is Nothing Then

            Response.Redirect(ViewState("PreviousPage"))

        End If

    End Sub

    Private Sub grvpln_RowCancelingEdit(sender As Object, e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles grvpln.RowCancelingEdit
        Try

            myInstructDistDataTable = Session("myInstructDistDataTable")

            grvpln.EditIndex = -1
            grvpln.DataSource = myInstructDistDataTable
            grvpln.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub grvpln_RowDeleting(sender As Object, e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grvpln.RowDeleting


        Try
            myInstructDistDataTable = Session("myInstructDistDataTable")
            myInstructDistDataTable.Rows(e.RowIndex).Delete()

            grvpln.DataSource = myInstructDistDataTable
            grvpln.DataBind()

            Session("myInstructDistDataTable") = myInstructDistDataTable

        Catch ex As Exception

        
        End Try
    End Sub
    Protected Sub btnDelete_Click(sender As Object, e As System.EventArgs) Handles btnDelete.Click

        Deleting()

    End Sub
    Private Sub Deleting()
        Dim usernm As String
        usernm = Session("username")

        Try
            Dim VoidRcpt As DataSet
            Dim Delcheck As DataSet
            Dim paramVoid() As Object
            If (Not String.IsNullOrWhiteSpace(txtrefnum.Text)) Then
                paramVoid = {Convert.ToInt32(txtrefnum.Text),
                             usernm}

                Delcheck = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "planDeleteCheck", CommandType.StoredProcedure, paramVoid)
                If (Delcheck.Tables(0).Rows().Count > 0) Then
                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                        ShowAlert("!لا يمكن حذف خطة، جمع المبلغ")
                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                        ShowAlert("Can not Delete Plan,Amount Collected!")
                    End If

                Else

                    VoidRcpt = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "delete_donation_plan", CommandType.StoredProcedure, paramVoid)

                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                        ShowAlert("!الفراغ  بنجاح")
                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                        ShowAlert("Deleted the Plan Successfully!")
                    End If
                    grvpln.DataBind()
                End If
            End If

        Catch ex As Exception

        End Try

    End Sub
    Private Sub deletebeforesave()
        Dim usernm As String
        usernm = Session("username")

        Try
            Dim VoidRcpt As DataSet
            'Dim Delcheck As DataSet
            Dim paramVoid() As Object
            If (Not String.IsNullOrWhiteSpace(txtrefnum.Text)) Then
                paramVoid = {Convert.ToInt32(txtrefnum.Text),
                             usernm}

                'Delcheck = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "planDeleteCheck", CommandType.StoredProcedure, paramVoid)
                'If (Delcheck.Tables(0).Rows().Count > 0) Then
                '    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                '        ShowAlert("!لا يمكن حذف خطة، جمع المبلغ")
                '    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                '        ShowAlert("Can not Modify Plan,Amount Collected!")
                '    End If



                VoidRcpt = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "delete_donation_plan", CommandType.StoredProcedure, paramVoid)
                ' grvpln.DataBind()
            Else
            End If
        Catch ex As Exception

        End Try

    End Sub
    Private Sub grvpln_RowEditing(sender As Object, e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles grvpln.RowEditing
        Try

            myInstructDistDataTable = Session("myInstructDistDataTable")

            grvpln.EditIndex = e.NewEditIndex
            grvpln.DataSource = myInstructDistDataTable
            grvpln.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub grvpln_RowUpdating(sender As Object, e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grvpln.RowUpdating
        Try
            myInstructDistDataTable = Session("myInstructDistDataTable")

            Dim txtrefnumedit As TextBox = grvpln.Rows(e.RowIndex).FindControl("txtrefnumedit")
            Dim txtDistValueEdit As TextBox = grvpln.Rows(e.RowIndex).FindControl("txtDistValueEdit")
            Dim txtquantEdit As TextBox = grvpln.Rows(e.RowIndex).FindControl("txtquantEdit")
            Dim ddlCountry As DropDownList = grvpln.Rows(e.RowIndex).FindControl("ddl_nat")
            Dim txtTotalEdit As TextBox = grvpln.Rows(e.RowIndex).FindControl("txtTotalEdit")



            'myInstructDistDataTable.Rows(e.RowIndex).Item("donation_standard_value") = Convert.ToDecimal(txtDistValueEdit.Text)
            myInstructDistDataTable.Rows(e.RowIndex).Item("nat_code") = ddlCountry.SelectedValue
            myInstructDistDataTable.Rows(e.RowIndex).Item("nat_descrar") = ddlCountry.SelectedItem.Text

            myInstructDistDataTable.Rows(e.RowIndex).Item("totAmnt") = Convert.ToDecimal(txtTotalEdit.Text)
            

            grvpln.EditIndex = -1
            grvpln.DataSource = myInstructDistDataTable
            grvpln.DataBind()

            Session("myInstructDistDataTable") = myInstructDistDataTable


        Catch ex As Exception

        End Try
    End Sub
End Class