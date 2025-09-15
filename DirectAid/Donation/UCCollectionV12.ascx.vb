
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web
#End Region

Public Class UCCollectionV12
    Inherits System.Web.UI.UserControl

#Region "Fields"

    Private _ws As New DataAccessLibrary
    Protected myDonationDistDataTable As DataTable
    Protected myDonationDistDataRow As DataRow
    Protected myDonationDistDataColumn As DataColumn
    Protected myPaymentDistDataTable As DataTable
    Protected myPaymentDistDataRow As DataRow
    Protected myPaymentDistDataColumn As DataColumn
    Protected _culture As String

    Enum SearchType
        ID
        CivilID
        Phone
        Mobile
        ArabicName
        EnglishName
        ReceiptID
    End Enum

#End Region

#Region "Properties"

    Public Property IsSaving As Boolean

        Get

            If Session("IsSaving") Is Nothing Then

                Session("IsSaving") = False

            End If

            Return DirectCast(Session("IsSaving"), Boolean)

        End Get

        Set(value As Boolean)

            Session("IsSaving") = value

        End Set

    End Property

#End Region

#Region "Methods"

    ''' <summary>
    ''' WAS FOR TEST AND KEPT FOR FUTURE USAGE BUT NOT USED RIGHT NOW
    ''' </summary>
    ''' <param name="txtDonationValue"></param>
    ''' <param name="txtQtyEdit"></param>
    ''' <param name="txtLineAmountEdit"></param>
    ''' <remarks></remarks>
    Private Sub CalculateLineAmount(ByRef txtDonationValue, ByRef txtQtyEdit, ByRef txtLineAmountEdit)

        Dim donationValueEx As Decimal
        Dim quantityValueEx As Decimal

        If Decimal.TryParse(txtDonationValue.Text, donationValueEx) And Decimal.TryParse(txtQtyEdit.Text, quantityValueEx) Then

            txtLineAmountEdit.Text = Convert.ToString(quantityValueEx * donationValueEx)

        End If

    End Sub

    Private Sub SaveReceiptFile(receiptID As String)

        Dim logicalPath As String = System.IO.Path.Combine(Constant.RECEIPTS_TO_PRINT, Session(SessionKey.USERNAME), receiptID)

        PhysicalIO.CreateFileByLogicalPath(logicalPath)

    End Sub

    Private Sub CalculateTotals()

        Dim totalPayment As Decimal
        Dim totalDonationDist As Decimal
        Dim exchRate As Decimal

        myDonationDistDataTable = ViewState("myDonationDistDataTable")
        myPaymentDistDataTable = ViewState("myPaymentDistDataTable")

        totalDonationDist = GetDonationDistTotalAmount(myDonationDistDataTable)
        totalPayment = GetPaymentTotalAmount(myPaymentDistDataTable)

        lblDiff.Text = (totalDonationDist - totalPayment).ToString("N3")
        lblTotalCur.Text = totalDonationDist.ToString("N3")

        exchRate = txt_ExchRate.Text
        ' lblTot.Text = (totalDonationDist * exchRate).ToString("N3")
        txt_amtKD.Text = (totalDonationDist * exchRate).ToString("N3")

    End Sub

    Private Sub SearchMode()

        'IF True then you are in Search Mode else you are in normal mode
        Dim isSearchMode As Boolean = CheckBox_SearchMode.Checked

        btnSearch.Visible = isSearchMode
        txtArabicName.Enabled = isSearchMode
        txtEnglishName.Enabled = isSearchMode
        txtDonorID.Enabled = isSearchMode
        txtCivilID.Enabled = isSearchMode
        txtPhone.Enabled = isSearchMode
        txtMobile.Enabled = isSearchMode
        btnCreate.Visible = Not isSearchMode
        txtReceiptID.Enabled = isSearchMode
        btnRePrint.Enabled = isSearchMode
        btnVoid.Enabled = isSearchMode

        If isSearchMode Then

            txtArabicName.Focus()

        End If

    End Sub

    Private Sub SaveDonor()

        'Response.Redirect("~/AddDonor.aspx", False)

        Try

            'Validation: Check if the donor Arabic name exist in database
            If (Not String.IsNullOrWhiteSpace(txtArabicName.Text)) Then

                Dim donorWithName As DataSet
                Dim params() As Object = {txtArabicName.Text.Trim()}

                donorWithName = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "CheckDonorArabicName", CommandType.StoredProcedure, params)

                If (donorWithName.Tables(0).Rows.Count > 0) Then
                    'There is a donor with the same Arabic Name
                    ShowAlert(GetLocalResourceObject("ArabicNameWarning").ToString())

                    Exit Sub
                End If

            End If

            'Validation: Check if the donor English name exist in database
            If (Not String.IsNullOrWhiteSpace(txtEnglishName.Text)) Then

                Dim donorWithName As DataSet
                Dim params() As Object = {txtEnglishName.Text.Trim()}

                donorWithName = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "CheckDonorEnglishName", CommandType.StoredProcedure, params)

                If (donorWithName.Tables(0).Rows.Count > 0) Then
                    'There is a donor with the same Arabic Name
                    ShowAlert(GetLocalResourceObject("EnglishNameWarning").ToString())


                    Exit Sub
                End If

            End If

            Dim donorID As Int32
            Dim donorParam() As Object = {txtArabicName.Text,
                                          txtEnglishName.Text,
                                          txtPhone.Text,
                                          txtMobile.Text,
                                          txtCivilID.Text,
                                          Convert.ToByte(ddlDonorType.SelectedValue),
                                         Convert.ToByte(ddlSalute.SelectedValue),
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
                txtDonorID.Text = donorID.ToString()
                txtTotalDonation.Text = 0.ToString("N3")
                txttotintruct.Text = 0.ToString("N3")
                txtTotalWaqf.Text = 0.ToString("N3")
                btnPrint.Enabled = True

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

    Private Function Get_donation_standard_value(ByVal donation_code As Object, ByVal nat_code As Object) As Object

        Dim re As Object = Nothing

        Try

            Dim donationStandardValue As DataSet
            Dim sql As String

            Dim obj As Object = ConfigurationSettings.AppSettings("APPLY_CURRENCY_CONVERSION_TO_DONATION_VALUE")

            Dim APPLY_CURRENCY_CONVERSION_TO_DONATION_VALUE As Boolean = True

            'Dim donation_code_value As Int16 = Nothing
            'Dim nat_code_value As Int16 = Nothing
            'Dim currency_code_value As Int16 = Nothing

            Boolean.TryParse(obj, APPLY_CURRENCY_CONVERSION_TO_DONATION_VALUE)

            'Boolean.TryParse(donation_code, donation_code_value)
            'Boolean.TryParse(nat_code, nat_code_value)
            'Boolean.TryParse(ddlCurrency.SelectedValue, currency_code_value)

            If APPLY_CURRENCY_CONVERSION_TO_DONATION_VALUE Then

                'sql = String.Format("SELECT (donation_standard_value / ISNULL((SELECT ISNULL(exch_rate, 1) FROM dbo.currency_tab WHERE (currency_code= {2})) , 1)) AS donation_standard_value FROM [dbo].[donations_rates] WHERE ([donation_code] = {0}) AND ([nat_code] = {1})", donation_code, nat_code, ddlCurrency.SelectedValue)

                'Using db As New Database

                '    re = db.SP_Get_donation_standard_value(donation_code_value, nat_code_value, currency_code_value)

                'End Using

                donationStandardValue = _ws.ExecSpResultSet("charitysoft", Session(SessionKey.USERNAME), Session(SessionKey.PASSWORD), "SP_Get_donation_standard_value", CommandType.StoredProcedure, donation_code, nat_code, ddlCurrency.SelectedValue)

                If (donationStandardValue.Tables(0).Rows().Count > 0) Then

                    re = CDec(donationStandardValue.Tables(0).Rows(0).Item("donation_standard_value")).ToString("N3")

                End If

            Else

                sql = String.Format("SELECT donation_standard_value FROM [dbo].[donations_rates] WHERE ([donation_code] = {0}) AND ([nat_code] = {1})", donation_code, nat_code)

                donationStandardValue = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql)

                If (donationStandardValue.Tables(0).Rows.Count > 0) Then

                    re = CDec(donationStandardValue.Tables(0).Rows(0).Item("donation_standard_value")).ToString("N3")

                End If

            End If

        Catch ex As Exception

        End Try

        Return re

    End Function

    '-------------------------------------'
    'Ayman
    Private Function Get_donation_BlockDecimalPoint(ByVal donation_code As Object) As Boolean
        Try
            Dim BlockDecimalPointValue As DataSet
            Dim sql As String

            sql = String.Format("SELECT BlockDecimalPoint FROM [dbo].[donations] WHERE ([donation_code] = {0}) ", donation_code)

            BlockDecimalPointValue = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql)

            If (BlockDecimalPointValue.Tables(0).Rows.Count > 0) Then
                If BlockDecimalPointValue.Tables(0).Rows(0)("BlockDecimalPoint") = True Then
                    Return True
                Else
                    Return False
                End If
            End If
        Catch ex As Exception
        End Try
    End Function

    Private Function Get_Currency_ShortCut(ByVal Currency_code As Object) As String
        Try
            Dim ShortCut As DataSet
            Dim sql As String

            sql = String.Format("SELECT ShortCut FROM [dbo].[currency_tab] WHERE ([currency_code] = {0}) ", Currency_code)

            ShortCut = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql)

            If (ShortCut.Tables(0).Rows.Count > 0) Then
                Return ShortCut.Tables(0).Rows(0)("ShortCut").ToString
            Else
                Return "؟؟"
            End If

        Catch ex As Exception
        End Try
    End Function

    '-------------------------------------'


    Private Sub Saving()

        Dim hasPartial As Boolean = False
        Dim receiptID As Int32
        Dim receiptTotalAmount As Decimal
        Dim paymentTotalAmount As Decimal
        Dim receiptParam() As Object
        Dim donationDistParam() As Object
        Dim paymentDistParam() As Object
        Dim instructRefNum As Int32
        Dim instructParam() As Object
        Dim instructDistParam() As Object
        Dim receiptDate As DateTime

        If Not IsSaving Then

            Dim donorID As Int32 = 0
            Int32.TryParse(txtDonorID.Text, donorID)

            If donorID = 0 Then

                ShowAlert("من افضلك اختر متبرع")

                Exit Sub

            End If

            If txtReceiptID.Text.Trim() <> String.Empty Then

                ShowAlert("تم حفظ السند من قبل")

                Exit Sub

            End If

            If grvDonationDist.Rows.Count = 0 Then

                ShowAlert("من فضلك ادخل التبرعات")

                Exit Sub

            End If

            If grvPayments.Rows.Count = 0 Then

                ShowAlert("من فضلك ادخل المدفوعات")

                Exit Sub

            End If

            'Validation: Total Donations must EQUAL Total Payment
            If (ddlCurrency.SelectedValue = 0) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("الرجاء إختيار العملة")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Please Select Currency")

                End If

                ddlCurrency.Focus()
                Exit Sub

            End If

            'If txtMOSALBookNumber.Text.Trim() = String.Empty Then

            '    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

            '        ShowAlert("من فضلك ادخل رقم دفتر الشئون")

            '    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

            '        ShowAlert("من فضلك ادخل رقم دفتر الشئون")

            '    End If

            '    txtMOSALBookNumber.Focus()

            '    Exit Sub

            'End If

            'If txtMOSALReceiptNumber.Text.Trim() = String.Empty Then

            '    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

            '        ShowAlert("من فضلك ادخل رقم سند الشئون")

            '    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

            '        ShowAlert("من فضلك ادخل رقم سند الشئون")

            '    End If

            '    txtMOSALReceiptNumber.Focus()

            '    Exit Sub

            'End If

            myDonationDistDataTable = ViewState("myDonationDistDataTable")
            myPaymentDistDataTable = ViewState("myPaymentDistDataTable")

            receiptTotalAmount = GetDonationDistTotalAmount(myDonationDistDataTable)
            paymentTotalAmount = GetPaymentTotalAmount(myPaymentDistDataTable)

            'Validation: Total Donations must EQUAL Total Payment
            If (paymentTotalAmount <> receiptTotalAmount) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("المبلغ المدفوع لا يساوي مبلغ التبرعات")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Total Donations not equal Total Payments, Please check!")

                End If

                Exit Sub

            End If

            IsSaving = True

            btnConfirmSave.Enabled = False

            btnPrint.Enabled = False

            Dim Con As New System.Data.SqlClient.SqlConnection
            Dim connectionString As String = ConfigurationManager.ConnectionStrings("charitysoft").ConnectionString
            Con = New SqlConnection(connectionString & ";uid=" & Session("username") & ";password=" & Session("password"))
            Con.Open()
            Dim trans As System.Data.SqlClient.SqlTransaction = Con.BeginTransaction()

            Try

                'Testing Transaction
                Dim Cmd1 As New System.Data.SqlClient.SqlCommand
                Dim Cmd2 As New System.Data.SqlClient.SqlCommand
                Dim Cmd3 As New System.Data.SqlClient.SqlCommand
                Dim Cmd4 As New System.Data.SqlClient.SqlCommand

                Cmd1.CommandText = "InsertReceiptV2"
                Cmd1.CommandType = CommandType.StoredProcedure
                Cmd1.Connection = Con
                Cmd1.Transaction = trans

                'Try

                Dim username1 As String
                username1 = Session("username")

                '===========================================================================================================================================================
                'Insert Receipt
                receiptParam = {txtReceiptManaual.Text,
                                  Convert.ToDateTime(txtReceiptDate.Value).Date,
                                  Convert.ToInt16(ddlWaqfColDonation.SelectedValue),
                                  receiptTotalAmount,
                                  Convert.ToInt32(txtDonorID.Text),
                                  Convert.ToInt16(ddlCurrency.SelectedValue),
                                  txtNotes.Text,
                                  Convert.ToInt16(ddlcampaign.SelectedValue),
                                  txtfavourof.Text,
                                  Convert.ToInt16(ddlDontationGroup.SelectedValue),
                                  Session(SessionKey.BRANCH_ID),
                                  txtMOSALBookNumber.Text,
                                  txtMOSALReceiptNumber.Text,
                                  0,
                                DBNull.Value}

                Dim x1 As Short
                Dim CmdBuilder1 = New SqlCommandBuilder
                Dim LstParam As Int32

                CmdBuilder1.DeriveParameters(Cmd1)
                'alternativeDeriveParameters.DeriveParameters(Cmd1, trans)

                For x = 0 To CType(receiptParam.Length - 1, Int16)
                    Cmd1.Parameters(x + 1).Value = receiptParam(x)
                Next

                LstParam = CType(Cmd1.Parameters.Count - 1, Int32)

                receiptID = Cmd1.ExecuteScalar()
                '===========================================================================================================================================================

                '===========================================================================================================================================================
                For Each row As DataRow In myDonationDistDataTable.Rows

                    donationDistParam = {receiptID,
                                         Convert.ToInt16(row.Item("donation_code")),
                                         Convert.ToDecimal(row.Item("donation_value")),
                                         Convert.ToInt16(row.Item("country_code")),
                                         row.Item("distribution_remrks"),
                                         row.Item("standing_inst_num"),
                                         row.Item("partial"),
                                        row.Item("Qty"),
                                        row.Item("line_amount")}

                    '_ws.ExecSp("charitysoft", Session("username"), Session("password"), "InsertDonationDist", CommandType.StoredProcedure, donationDistParam)

                    Cmd2.CommandText = "InsertDonationDist"
                    Cmd2.CommandType = CommandType.StoredProcedure
                    Cmd2.Connection = Con
                    Cmd2.Transaction = trans

                    Dim x2 As Short
                    Dim CmdBuilder2 = New SqlCommandBuilder

                    CmdBuilder2.DeriveParameters(Cmd2)
                    For x = 0 To CType(donationDistParam.Length - 1, Int16)
                        Cmd2.Parameters(x + 1).Value = donationDistParam(x)
                    Next

                    Cmd2.ExecuteNonQuery()
                    '===========================================================================================================================================================

                    '===========================================================================================================================================================
                    'Insert Partial Payment Instruction
                    If (row.Item("partial") = True And row.Item("standing_inst_num") = 0) Then

                        hasPartial = True

                        instructParam = {Convert.ToDateTime(txtReceiptDate.Value).Date,
                                         Convert.ToInt32(txtDonorID.Text),
                                         Convert.ToInt16(ddlcampaign.SelectedValue),
                                         Convert.ToInt16(row.Item("donation_code")),
                                         Convert.ToDecimal(row.Item("line_amount")),
                                         Convert.ToInt16(row.Item("country_code")),
                                         receiptID,
                                         Convert.ToDecimal(row.Item("Qty")),
                                         0}

                        '_ws.ExecSp("charitysoft", Session("username"), Session("password"), "InsertPartialInstruct", CommandType.StoredProcedure, instructParam)

                        Cmd4.CommandText = "InsertPartialInstruct"
                        Cmd4.CommandType = CommandType.StoredProcedure
                        Cmd4.Connection = Con
                        Cmd4.Transaction = trans

                        Dim x4 As Short
                        Dim CmdBuilder4 = New SqlCommandBuilder

                        CmdBuilder4.DeriveParameters(Cmd4)
                        For x = 0 To CType(instructParam.Length - 1, Int16)
                            Cmd4.Parameters(x + 1).Value = instructParam(x)
                        Next

                        Cmd4.ExecuteNonQuery()

                        'Partial Payments
                        'Update the quantity and the value of the Standing Instruction 
                    ElseIf (row.Item("partial") = True And row.Item("standing_inst_num") <> 0) Then

                        hasPartial = True

                        instructParam = {
                                         Convert.ToDecimal(row.Item("line_amount")),
                                         Convert.ToDecimal(row.Item("Qty")),
                                         Convert.ToInt32(row.Item("standing_inst_num")),
                                         Convert.ToInt16(row.Item("donation_code"))
                                         }

                        '_ws.ExecSp("charitysoft", Session("username"), Session("password"), "InsertPartialInstruct", CommandType.StoredProcedure, instructParam)

                        Cmd4.CommandText = "UpdatePartialPaymentDist"
                        Cmd4.CommandType = CommandType.StoredProcedure
                        Cmd4.Connection = Con
                        Cmd4.Transaction = trans

                        Dim x4 As Short
                        Dim CmdBuilder4 = New SqlCommandBuilder

                        CmdBuilder4.DeriveParameters(Cmd4)
                        For x = 0 To CType(instructParam.Length - 1, Int16)
                            Cmd4.Parameters(x + 1).Value = instructParam(x)
                        Next

                        Cmd4.ExecuteNonQuery()

                        'Bank Instruction
                        'Update the quantity and the value of the Standing Instruction
                    ElseIf (row.Item("partial") = False And row.Item("standing_inst_num") <> 0) Then

                        instructParam = {
                                         Convert.ToDecimal(row.Item("line_amount")),
                                         Convert.ToDecimal(row.Item("Qty")),
                                         Convert.ToInt32(row.Item("standing_inst_num")),
                                         Convert.ToInt16(row.Item("donation_code"))
                                         }

                        '_ws.ExecSp("charitysoft", Session("username"), Session("password"), "InsertPartialInstruct", CommandType.StoredProcedure, instructParam)

                        Cmd4.CommandText = "UpdatePartialPaymentDist"
                        Cmd4.CommandType = CommandType.StoredProcedure
                        Cmd4.Connection = Con
                        Cmd4.Transaction = trans

                        Dim x4 As Short
                        Dim CmdBuilder4 = New SqlCommandBuilder

                        CmdBuilder4.DeriveParameters(Cmd4)
                        For x = 0 To CType(instructParam.Length - 1, Int16)
                            Cmd4.Parameters(x + 1).Value = instructParam(x)
                        Next

                        Cmd4.ExecuteNonQuery()

                    End If

                Next
                '===========================================================================================================================================================

                '===========================================================================================================================================================
                'Insert Payments Dist.
                For Each row As DataRow In myPaymentDistDataTable.Rows
                    paymentDistParam = {0,
                                        receiptID,
                                        Convert.ToDecimal(row.Item("pay_amnt")),
                                        row.Item("acc_num"),
                                        row.Item("authorization_code"),
                                        Convert.ToInt16(row.Item("bank_code")),
                                        Convert.ToByte(row.Item("pay_method_id"))}

                    '_ws.ExecSp("charitysoft", Session("username"), Session("password"), "InsertPaymentDist", CommandType.StoredProcedure, paymentDistParam)

                    Cmd3.CommandText = "InsertPaymentDist"
                    Cmd3.CommandType = CommandType.StoredProcedure
                    Cmd3.Connection = Con
                    Cmd3.Transaction = trans

                    Dim x3 As Short
                    Dim CmdBuilder3 = New SqlCommandBuilder

                    CmdBuilder3.DeriveParameters(Cmd3)
                    For x = 0 To CType(paymentDistParam.Length - 1, Int16)
                        Cmd3.Parameters(x + 1).Value = paymentDistParam(x)
                    Next

                    Cmd3.ExecuteNonQuery()
                Next
                '===========================================================================================================================================================

                trans.Commit()

                txtReceiptID.Text = receiptID.ToString()

                btnPrint.Enabled = False

                'SaveReceiptFile(receiptID.ToString())

                'PreparePrint()

                'pnlPrintConfirmation_ModalPopupExtender.Show()

            Catch ex As Exception

                trans.Rollback()

                Response.Write(ex.Message)

                pnlSaveConfirmation_ModalPopupExtender.Hide()

            Finally

                btnConfirmSave.Enabled = True
                Con.Dispose()

                SendSMS()

                RePrint()

            End Try

            'If Not btnPrint.Enabled Then

            '    Response.Redirect("ReportViewer.aspx")

            'End If
        Else

            btnPrint.Enabled = Not IsSaving
            pnlSaveConfirmation_ModalPopupExtender.Hide()
            ShowAlert("تم حفظ السند من قبل برجاء مراجعه السندات المحفوظة")

        End If

    End Sub

    Private Sub SendSMS()

        Try

            If Convert.ToBoolean(ConfigurationSettings.AppSettings("SMS_ENABLED")) Then

                If DatabaseSecurity.IsRoleMember(DatabaseRoles.SMSEnabled) Then

                    If Convert.ToBoolean(ViewState("donor_data.SMSEnabled")) Then

                        Dim CurrencyShortCut As String = Get_Currency_ShortCut(ddlCurrency.SelectedItem.Value)

                        SMSEngine.HttpSendV2(txtPhone.Text, txtMobile.Text, phone_3.Text, lblTotalCur.Text, CurrencyShortCut)

                    End If

                End If

            End If

        Catch ex As Exception


        End Try

    End Sub

    Private Sub Voiding()

        ' Dim Receipt_numb As Int32 = Convert.ToInt32(txtReceiptID.Text.Trim())
        Dim usernm As String
        usernm = Session("username")

        Try
            Dim VoidRcpt As DataSet
            Dim paramVoid() As Object
            If (Not String.IsNullOrWhiteSpace(txtReceiptID.Text)) Then
                paramVoid = {Convert.ToInt32(txtReceiptID.Text),
                             usernm}
                VoidRcpt = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "void_collection", CommandType.StoredProcedure, paramVoid)

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ShowAlert("!الفراغ استلام بنجاح")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ShowAlert("Receipt Void Successfully!")
                End If
                btnVoid.Enabled = False

            End If
        Catch ex As Exception

        End Try

    End Sub

    Private Sub Search_Old()

        ''Handle the search
        'Try
        '    If (Not String.IsNullOrWhiteSpace(txtSearch.Text)) Then

        '        Dim donorDS As New DataSet

        '        Select Case ddlSearchType.SelectedValue

        '            Case SearchType.ID

        '                Dim donerID() As Object = {txtSearch.Text.Trim()}

        '                donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByID", CommandType.StoredProcedure, donerID)

        '                If (donorDS.Tables(0).Rows().Count > 0) Then

        '                    'Pass the data set to Display Donor Information Method
        '                    DisplayDonorInfo(donorDS)

        '                Else
        '                    ClearForm()
        '                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                        ShowAlert("لا يوجد بيانات")
        '                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                        ShowAlert("No Data Found")
        '                    End If
        '                    EnableDonorProfile()
        '                End If

        '            Case SearchType.CivilID

        '                Dim donerCivilID() As Object = {txtSearch.Text.Trim()}

        '                donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByCivilID", Data.CommandType.StoredProcedure, donerCivilID)

        '                If (donorDS.Tables(0).Rows().Count > 0) Then

        '                    'Pass the data set to Display Donor Information Method
        '                    DisplayDonorInfo(donorDS)

        '                Else
        '                    ClearForm()
        '                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                        ShowAlert("لا يوجد بيانات")
        '                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                        ShowAlert("No Data Found")
        '                    End If
        '                    EnableDonorProfile()
        '                End If

        '            Case SearchType.Phone

        '                Dim donorPhoneNumber() As Object = {txtSearch.Text.Trim()}

        '                donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByPhoneNumber", Data.CommandType.StoredProcedure, donorPhoneNumber)

        '                If (donorDS.Tables(0).Rows().Count > 0) Then

        '                    'Pass the data set to Display Donor Information Method
        '                    DisplayDonorInfo(donorDS)

        '                Else
        '                    ClearForm()
        '                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                        ShowAlert("لا يوجد بيانات")
        '                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                        ShowAlert("No Data Found")
        '                    End If
        '                    EnableDonorProfile()
        '                End If

        '            Case SearchType.Mobile

        '                Dim donorMobileNumber() As Object = {txtSearch.Text.Trim()}

        '                donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchDonorByMobileNumber", Data.CommandType.StoredProcedure, donorMobileNumber)

        '                If (donorDS.Tables(0).Rows().Count > 0) Then

        '                    'Pass the data set to Display Donor Information Method
        '                    DisplayDonorInfo(donorDS)

        '                Else
        '                    ClearForm()
        '                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                        ShowAlert("لا يوجد بيانات")
        '                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                        ShowAlert("No Data Found")
        '                    End If
        '                    EnableDonorProfile()
        '                End If

        '            Case SearchType.ArabicName

        '                Dim donorArabicName() As Object = {txtSearch.Text.Trim()}

        '                donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchArName", Data.CommandType.StoredProcedure, donorArabicName)

        '                If (donorDS.Tables(0).Rows().Count > 0) Then

        '                    grvSearchResult.DataSource = donorDS
        '                    grvSearchResult.DataBind()
        '                    pnlSreachResult_ModalPopupExtender.Show()

        '                Else
        '                    ClearForm()
        '                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                        ShowAlert("لا يوجد بيانات")
        '                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                        ShowAlert("No Data Found")
        '                    End If
        '                    EnableDonorProfile()
        '                End If

        '            Case SearchType.EnglishName

        '                Dim donorEnglishName() As Object = {txtSearch.Text.Trim()}

        '                donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchEngName", Data.CommandType.StoredProcedure, donorEnglishName)

        '                If (donorDS.Tables(0).Rows().Count > 0) Then

        '                    grvSearchResult.DataSource = donorDS
        '                    grvSearchResult.DataBind()
        '                    pnlSreachResult_ModalPopupExtender.Show()

        '                Else
        '                    ClearForm()
        '                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                        ShowAlert("لا يوجد بيانات")
        '                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                        ShowAlert("No Data Found")
        '                    End If
        '                    EnableDonorProfile()
        '                End If

        '            Case SearchType.ReceiptID

        '                Dim receiptID() As Object = {txtSearch.Text.Trim()}

        '                donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchReceiptByID", Data.CommandType.StoredProcedure, receiptID)

        '                If (donorDS.Tables(0).Rows().Count > 0) Then

        '                    DisplayReceiptInfo(donorDS)
        '                    DisplayDonorInfo(donorDS)
        '                Else
        '                    ClearForm()
        '                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                        ShowAlert("لا يوجد بيانات")
        '                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                        ShowAlert("No Data Found")
        '                    End If

        '                End If

        '        End Select


        '    End If

        'Catch FormatException As FormatException
        '    'User input incorrect format

        'Catch ex As Exception

        'End Try

    End Sub

    Private Sub Search_New()

        Dim sqlQuery As String = "SELECT * FROM donor_data WHERE (donor_id IS NOT NULL) "

        If txtArabicName.Text.Trim() <> String.Empty Then

            sqlQuery = sqlQuery & String.Format("AND (donor_namear like '%{0}%')", txtArabicName.Text.Trim())

        End If

        If txtEnglishName.Text.Trim() <> String.Empty Then

            sqlQuery = sqlQuery & String.Format("AND (donor_nameen like '%{0}%')", txtEnglishName.Text.Trim())

        End If

        If txtDonorID.Text.Trim() <> String.Empty Then

            sqlQuery = sqlQuery & String.Format("AND (donor_id = {0})", txtDonorID.Text.Trim())

        End If

        If txtCivilID.Text.Trim() <> String.Empty Then

            sqlQuery = sqlQuery & String.Format("AND (donor_civilid = '{0}')", txtCivilID.Text.Trim())

        End If

        If txtPhone.Text.Trim() <> String.Empty Then

            sqlQuery = sqlQuery & String.Format("AND (phone_2 = '{0}' OR phone_3 = '{0}' OR primary_phone = '{0}') ", txtPhone.Text.Trim())

        End If

        If txtMobile.Text.Trim() <> String.Empty Then

            sqlQuery = sqlQuery & String.Format("AND (phone_2 = '{0}' OR phone_3 = '{0}' OR primary_phone = '{0}') ", txtPhone.Text.Trim())

        End If


        Dim donorDS As New DataSet

        donorDS = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sqlQuery)
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
            EnableDonorProfile()
        End If

    End Sub

    Private Sub InitializeDonationDistDataTable()
        'Create DataTable that represents the add_idv Table in the DB Or the Addresses Table
        myDonationDistDataTable = New DataTable("dont_dist")

        'Create DataColumn for every column in the DB table

        'Use these 2 column in inserting
        myDonationDistDataColumn = New DataColumn()
        myDonationDistDataColumn.DataType = System.Type.GetType("System.Int32")
        myDonationDistDataColumn.ColumnName = "reciept_num"
        myDonationDistDataColumn.Caption = "Receipt ID"
        myDonationDistDataTable.Columns.Add(myDonationDistDataColumn)

        myDonationDistDataColumn = New DataColumn()
        myDonationDistDataColumn.DataType = System.Type.GetType("System.Int16")
        myDonationDistDataColumn.ColumnName = "donation_code"
        myDonationDistDataColumn.Caption = "Donation Code"
        myDonationDistDataTable.Columns.Add(myDonationDistDataColumn)

        myDonationDistDataColumn = New DataColumn()
        myDonationDistDataColumn.DataType = System.Type.GetType("System.String")
        myDonationDistDataColumn.ColumnName = "donation_name"
        myDonationDistDataColumn.Caption = "Donation Name"
        myDonationDistDataTable.Columns.Add(myDonationDistDataColumn)

        myDonationDistDataColumn = New DataColumn()
        myDonationDistDataColumn.DataType = System.Type.GetType("System.Decimal")
        myDonationDistDataColumn.ColumnName = "donation_value"
        myDonationDistDataColumn.Caption = "Value"
        myDonationDistDataTable.Columns.Add(myDonationDistDataColumn)

        myDonationDistDataColumn = New DataColumn()
        myDonationDistDataColumn.DataType = System.Type.GetType("System.Int16")
        myDonationDistDataColumn.ColumnName = "country_code"
        myDonationDistDataColumn.Caption = "Country Code"
        myDonationDistDataTable.Columns.Add(myDonationDistDataColumn)

        myDonationDistDataColumn = New DataColumn()
        myDonationDistDataColumn.DataType = System.Type.GetType("System.String")
        myDonationDistDataColumn.ColumnName = "country_name"
        myDonationDistDataColumn.Caption = "Country Name"
        myDonationDistDataTable.Columns.Add(myDonationDistDataColumn)

        myDonationDistDataColumn = New DataColumn()
        myDonationDistDataColumn.DataType = System.Type.GetType("System.String")
        myDonationDistDataColumn.ColumnName = "distribution_remrks"
        myDonationDistDataColumn.Caption = "Remarks"
        myDonationDistDataTable.Columns.Add(myDonationDistDataColumn)

        myDonationDistDataColumn = New DataColumn()
        myDonationDistDataColumn.DataType = System.Type.GetType("System.Int32")
        myDonationDistDataColumn.ColumnName = "standing_inst_num"
        myDonationDistDataColumn.Caption = "standing_inst_num"
        myDonationDistDataTable.Columns.Add(myDonationDistDataColumn)

        myDonationDistDataColumn = New DataColumn()
        myDonationDistDataColumn.DataType = System.Type.GetType("System.Boolean")
        myDonationDistDataColumn.ColumnName = "partial"
        myDonationDistDataColumn.Caption = "Partial"
        myDonationDistDataTable.Columns.Add(myDonationDistDataColumn)

        myDonationDistDataColumn = New DataColumn()
        myDonationDistDataColumn.DataType = System.Type.GetType("System.Decimal")
        myDonationDistDataColumn.ColumnName = "Qty"
        myDonationDistDataColumn.Caption = "Qty"
        myDonationDistDataTable.Columns.Add(myDonationDistDataColumn)

        myDonationDistDataColumn = New DataColumn()
        myDonationDistDataColumn.DataType = System.Type.GetType("System.Decimal")
        myDonationDistDataColumn.ColumnName = "line_amount"
        myDonationDistDataColumn.Caption = "line_amount"
        myDonationDistDataTable.Columns.Add(myDonationDistDataColumn)

        'Add this DataTable to Session field = "myDataTable" to use/store it cross the postbacks
        ViewState("myDonationDistDataTable") = myDonationDistDataTable
        grvDonationDist.DataSource = myDonationDistDataTable
        grvDonationDist.DataBind()

    End Sub

    Private Sub InitializePaymentDistDataTable()
        'Create DataTable that represents the add_idv Table in the DB Or the Addresses Table
        myPaymentDistDataTable = New DataTable("pay_method_dist")

        'Create DataColumn for every column in the DB table

        'Use these 2 column in inserting
        myPaymentDistDataColumn = New DataColumn()
        myPaymentDistDataColumn.DataType = System.Type.GetType("System.Int32")
        myPaymentDistDataColumn.ColumnName = "reciept_ser_det"
        myPaymentDistDataColumn.Caption = "Receipt Serial ID"
        myPaymentDistDataTable.Columns.Add(myPaymentDistDataColumn)

        myPaymentDistDataColumn = New DataColumn()
        myPaymentDistDataColumn.DataType = System.Type.GetType("System.Int32")
        myPaymentDistDataColumn.ColumnName = "reciept_num"
        myPaymentDistDataColumn.Caption = "Receipt ID"
        myPaymentDistDataTable.Columns.Add(myPaymentDistDataColumn)

        myPaymentDistDataColumn = New DataColumn()
        myPaymentDistDataColumn.DataType = System.Type.GetType("System.Decimal")
        myPaymentDistDataColumn.ColumnName = "pay_amnt"
        myPaymentDistDataColumn.Caption = "Payment Amount"
        myPaymentDistDataTable.Columns.Add(myPaymentDistDataColumn)

        myPaymentDistDataColumn = New DataColumn()
        myPaymentDistDataColumn.DataType = System.Type.GetType("System.String")
        myPaymentDistDataColumn.ColumnName = "acc_num"
        myPaymentDistDataColumn.Caption = "Account Number"
        myPaymentDistDataTable.Columns.Add(myPaymentDistDataColumn)

        myPaymentDistDataColumn = New DataColumn()
        myPaymentDistDataColumn.DataType = System.Type.GetType("System.String")
        myPaymentDistDataColumn.ColumnName = "authorization_code"
        myPaymentDistDataColumn.Caption = "Authorization Code"
        myPaymentDistDataTable.Columns.Add(myPaymentDistDataColumn)

        myPaymentDistDataColumn = New DataColumn()
        myPaymentDistDataColumn.DataType = System.Type.GetType("System.Int16")
        myPaymentDistDataColumn.ColumnName = "bank_code"
        myPaymentDistDataColumn.Caption = "Bank Code"
        myPaymentDistDataTable.Columns.Add(myPaymentDistDataColumn)

        myPaymentDistDataColumn = New DataColumn()
        myPaymentDistDataColumn.DataType = System.Type.GetType("System.String")
        myPaymentDistDataColumn.ColumnName = "bank_name"
        myPaymentDistDataColumn.Caption = "Band Name"
        myPaymentDistDataTable.Columns.Add(myPaymentDistDataColumn)

        myPaymentDistDataColumn = New DataColumn()
        myPaymentDistDataColumn.DataType = System.Type.GetType("System.Byte")
        myPaymentDistDataColumn.ColumnName = "pay_method_id"
        myPaymentDistDataColumn.Caption = "Payment Method Id"
        myPaymentDistDataTable.Columns.Add(myPaymentDistDataColumn)

        myPaymentDistDataColumn = New DataColumn()
        myPaymentDistDataColumn.DataType = System.Type.GetType("System.String")
        myPaymentDistDataColumn.ColumnName = "pay_method_name"
        myPaymentDistDataColumn.Caption = "Payment Method Name"
        myPaymentDistDataTable.Columns.Add(myPaymentDistDataColumn)

        'Add this DataTable to Session field = "myDataTable" to use/store it cross the postbacks
        ViewState("myPaymentDistDataTable") = myPaymentDistDataTable
        grvPayments.DataSource = myPaymentDistDataTable
        grvPayments.DataBind()

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
        ddlSalute.Enabled = True
        txtDonorID.Enabled = False
        'txtCivilID.Focus()
        txtArabicName.Focus()

    End Sub

    ''' <summary>
    ''' Displays the receipt info.
    ''' </summary>
    ''' <param name="receipt">The receipt.</param>
    Private Sub DisplayReceiptInfo(ByVal receipt As DataSet)
        Try
            Dim receiptPaymentDist As DataSet
            Dim param() As Object
            Dim receiptDonationDist As DataSet

            txtReceiptID.Text = If(IsDBNull(receipt.Tables(0).Rows(0).Item("reciept_num")), String.Empty, receipt.Tables(0).Rows(0).Item("reciept_num"))
            txtReceiptDate.Value = If(IsDBNull(receipt.Tables(0).Rows(0).Item("reciept_date")), String.Empty, CDate(receipt.Tables(0).Rows(0).Item("reciept_date")).ToString("dd/MM/yyyy"))
            txtNotes.Text = If(IsDBNull(receipt.Tables(0).Rows(0).Item("remarks")), String.Empty, receipt.Tables(0).Rows(0).Item("remarks").ToString())
            ddlCurrency.SelectedValue = If(IsDBNull(receipt.Tables(0).Rows(0).Item("currency_code")), Nothing, receipt.Tables(0).Rows(0).Item("currency_code").ToString())
            txtReceiptManaual.Text = If(IsDBNull(receipt.Tables(0).Rows(0).Item("reciept_num_manual")), String.Empty, receipt.Tables(0).Rows(0).Item("reciept_num_manual").ToString())
            'ddlcampaign.SelectedValue = If(IsDBNull(receipt.Tables(0).Rows(0).Item("campaign_code")), Nothing, receipt.Tables(0).Rows(0).Item("campaign_code").ToString())
            txtfavourof.Text = If(IsDBNull(receipt.Tables(0).Rows(0).Item("col_in_favar_of")), String.Empty, receipt.Tables(0).Rows(0).Item("col_in_favar_of").ToString())

            txtMOSALBookNumber.Text = If(IsDBNull(receipt.Tables(0).Rows(0).Item("MOSALBookNumber")), String.Empty, receipt.Tables(0).Rows(0).Item("MOSALBookNumber").ToString())
            txtMOSALReceiptNumber.Text = If(IsDBNull(receipt.Tables(0).Rows(0).Item("MOSALReceiptNumber")), String.Empty, receipt.Tables(0).Rows(0).Item("MOSALReceiptNumber").ToString())

            param = {receipt.Tables(0).Rows(0).Item("reciept_num"),
                     IIf(CultureInfo.CurrentUICulture.Name.Contains("en"), "English", "Arabic")}

            receiptPaymentDist = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetReceiptPaymentDist", CommandType.StoredProcedure, param)

            If Not receiptPaymentDist Is Nothing Then

                If receiptPaymentDist.Tables.Count > 0 Then

                    myPaymentDistDataTable = receiptPaymentDist.Tables(0)

                    ViewState("myPaymentDistDataTable") = myPaymentDistDataTable

                End If

            End If

            grvPayments.DataSource = receiptPaymentDist
            grvPayments.DataBind()

            receiptDonationDist = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetReceiptDonationDist", CommandType.StoredProcedure, param)

            If Not receiptDonationDist Is Nothing Then

                If receiptDonationDist.Tables.Count > 0 Then

                    myDonationDistDataTable = receiptDonationDist.Tables(0)

                    ViewState("myDonationDistDataTable") = myDonationDistDataTable

                End If

            End If

            DisplayDonation_headcode(receiptDonationDist)

            grvDonationDist.DataSource = receiptDonationDist
            grvDonationDist.DataBind()

            CalculateTotals()

        Catch ex As Exception

        End Try

    End Sub

    Private Sub DisplayDonation_headcode(ByVal RefnumCat As DataSet)
        Try

            ddlWaqfColDonation.SelectedValue = If(IsDBNull(RefnumCat.Tables(0).Rows(0).Item("donation_cat")), Nothing, RefnumCat.Tables(0).Rows(0).Item("donation_cat").ToString())

        Catch ex As Exception

        End Try

    End Sub

    Private Sub ClearForm()
        Try

            IsSaving = False
            datalib.ClearForm(UpdatePanel)
            'txtReceiptDate.Value = DateTime.Now.ToString("dd/MM/yyyy")
            txtReceiptDate.Value = DateTime.Now
            btnPrint.Enabled = False
            txtTotalDonation.Text = 0.ToString("N3")
            txttotintruct.Text = 0.ToString("N3")
            txtTotalWaqf.Text = 0.ToString("N3")
            'txtSearch.Focus()
            ddlcampaign.Enabled = True

            ddlCurrency.SelectedValue = 1

        Catch ex As Exception

        End Try

    End Sub

    ''' <summary>
    ''' Displays the donor info.
    ''' </summary>
    ''' <param name="donor">The donor.</param>
    Private Sub DisplayDonorInfo(ByVal donor As DataSet)

        Try
            DisableDonorProfile()
            txtDonorID.Text = donor.Tables(0).Rows(0).Item("donor_id").ToString()
            txtArabicName.Text = If(IsDBNull(donor.Tables(0).Rows(0).Item("donor_namear")), String.Empty, donor.Tables(0).Rows(0).Item("donor_namear"))
            txtEnglishName.Text = If(IsDBNull(donor.Tables(0).Rows(0).Item("donor_nameen")), String.Empty, donor.Tables(0).Rows(0).Item("donor_nameen"))
            txtCivilID.Text = If(IsDBNull(donor.Tables(0).Rows(0).Item("donor_civilid")), String.Empty, donor.Tables(0).Rows(0).Item("donor_civilid"))
            txtMobile.Text = If(IsDBNull(donor.Tables(0).Rows(0).Item("phone_2")), String.Empty, donor.Tables(0).Rows(0).Item("phone_2"))
            txtPhone.Text = If(IsDBNull(donor.Tables(0).Rows(0).Item("primary_phone")), String.Empty, donor.Tables(0).Rows(0).Item("primary_phone"))
            ddlDonorType.SelectedValue = If(IsDBNull(donor.Tables(0).Rows(0).Item("comp_indv")), -1, donor.Tables(0).Rows(0).Item("comp_indv"))
            ddlSalute.SelectedValue = If(IsDBNull(donor.Tables(0).Rows(0).Item("salut_code")), -1, donor.Tables(0).Rows(0).Item("salut_code"))
            phone_3.Text = If(IsDBNull(donor.Tables(0).Rows(0).Item("phone_3")), String.Empty, donor.Tables(0).Rows(0).Item("phone_3"))
            ViewState("donor_data.SMSEnabled") = donor.Tables(0).Rows(0).Item("SMSEnabled")

            GetDonorTotalDonationValue(donor.Tables(0).Rows(0).Item("donor_id"))
            GetDonorTotalWaqfValue(donor.Tables(0).Rows(0).Item("donor_id"))
            GetDonorTotalInstructionsValue(donor.Tables(0).Rows(0).Item("donor_id"))
            GetDonorTotalDonationsDetails(donor.Tables(0).Rows(0).Item("donor_id"))
            GetDonorTotalWaqfDetails(donor.Tables(0).Rows(0).Item("donor_id"))
            GetDonorPartialPaymentsDetials(donor.Tables(0).Rows(0).Item("donor_id"))
            GetDonorTotalInstructionDetails(donor.Tables(0).Rows(0).Item("donor_id"))

            'Add Donor Id to Open Button in order to open his/her profile
            btnOpen.PostBackUrl = "~/AddDonar.aspx?DonorId=" & donor.Tables(0).Rows(0).Item("donor_id").ToString()
            txtReceiptManaual.Focus()
        Catch ex As Exception

        End Try

    End Sub

    ''' <summary>
    ''' Gets the donor total instructions value.
    ''' </summary>
    ''' <param name="donorId">The donor id.</param>
    Private Sub GetDonorTotalInstructionsValue(ByVal donorId As Int32)

        If donorId > Constant.DONOR_ID_BENEFACTOR_FEMALE Then

            Try
                Dim totalStandingInstructionDS As DataSet
                Dim param As Object()

                param = {donorId}

                totalStandingInstructionDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorTotalStandInstruct", System.Data.CommandType.StoredProcedure, param)
                If (totalStandingInstructionDS.Tables(0).Rows.Count > 0) Then
                    txttotintruct.Text = CDec(totalStandingInstructionDS.Tables(0).Rows(0).Item(0)).ToString("N3")
                End If
            Catch ex As Exception

            End Try


        End If

    End Sub

    ''' <summary>
    ''' Gets the donor total waqf value.
    ''' </summary>
    ''' <param name="donorId">The donor id.</param>
    Private Sub GetDonorTotalWaqfValue(ByVal donorId As Int32)

        If donorId > Constant.DONOR_ID_BENEFACTOR_FEMALE Then

            Try
                Dim param As Object()
                Dim totalWaqfDS As DataSet

                param = {donorId}

                totalWaqfDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorTotalWaqf", System.Data.CommandType.StoredProcedure, param)
                If (totalWaqfDS.Tables(0).Rows.Count > 0) Then
                    txtTotalWaqf.Text = CDec(totalWaqfDS.Tables(0).Rows(0).Item(0)).ToString("N3")
                End If
            Catch ex As Exception

            End Try

        End If

    End Sub

    ''' <summary>
    ''' Gets the donor total donation value.
    ''' </summary>
    ''' <param name="donorId">The donor id.</param>
    Private Sub GetDonorTotalDonationValue(ByVal donorId As Int32)

        If donorId > Constant.DONOR_ID_BENEFACTOR_FEMALE Then

            Try
                Dim totalDonationsDS As DataSet
                Dim param() As Object = {donorId}


                totalDonationsDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorTotalDonation", System.Data.CommandType.StoredProcedure, param)
                If (totalDonationsDS.Tables(0).Rows.Count > 0) Then
                    txtTotalDonation.Text = CDec(totalDonationsDS.Tables(0).Rows(0).Item(0)).ToString("N3")
                End If

            Catch ex As Exception

            End Try

        End If

    End Sub

    ''' <summary>
    ''' Gets the donor total donations details.
    ''' </summary>
    ''' <param name="donorId">The donor id.</param>
    Private Sub GetDonorTotalDonationsDetails(ByVal donorId As Int32)

        If donorId > Constant.DONOR_ID_BENEFACTOR_FEMALE Then

            Try
                Dim donorDontaionsDetails As DataSet
                Dim donorDontaionsDetailsParams As Object()
                Dim languageParam As String


                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    languageParam = "Ara"

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    languageParam = "Eng"

                End If

                donorDontaionsDetailsParams = {donorId,
                                               languageParam}

                donorDontaionsDetails = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorTotalDonationDetail", System.Data.CommandType.StoredProcedure, donorDontaionsDetailsParams)

                If (donorDontaionsDetails.Tables(0).Rows.Count > 0) Then
                    grvTotalDonation.DataSource = donorDontaionsDetails
                    grvTotalDonation.DataBind()
                End If

            Catch ex As Exception

            End Try

        End If

    End Sub

    ''' <summary>
    ''' Gets the donor total waqf details.
    ''' </summary>
    ''' <param name="donorId">The donor id.</param>
    Private Sub GetDonorTotalWaqfDetails(ByVal donorId As Int32)

        If donorId > Constant.DONOR_ID_BENEFACTOR_FEMALE Then

            Try
                Dim donorWaqfDetails As DataSet
                Dim donorWaqfDetailsParams As Object()
                Dim languageParam As String


                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    languageParam = "Ara"

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    languageParam = "Eng"

                End If

                donorWaqfDetailsParams = {donorId,
                                               languageParam}

                donorWaqfDetails = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorTotalWaqfDetail", System.Data.CommandType.StoredProcedure, donorWaqfDetailsParams)

                If (donorWaqfDetails.Tables(0).Rows.Count > 0) Then
                    grvTotalWaqf.DataSource = donorWaqfDetails
                    grvTotalWaqf.DataBind()
                End If

            Catch ex As Exception

            End Try


        End If

    End Sub

    Private Sub GetDonorTotalInstructionDetails(ByVal donorId As Int32)

        If donorId > Constant.DONOR_ID_BENEFACTOR_FEMALE Then

            Try
                Dim _DataSet As DataSet
                Dim donorWaqfDetailsParams As Object()
                Dim languageParam As String


                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    languageParam = "Ara"

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    languageParam = "Eng"

                End If

                donorWaqfDetailsParams = {donorId}

                _DataSet = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetInstrcutionDetail", System.Data.CommandType.StoredProcedure, donorWaqfDetailsParams)

                If (_DataSet.Tables(0).Rows.Count > 0) Then
                    GridView_TotalInstruction.DataSource = _DataSet
                    GridView_TotalInstruction.DataBind()
                End If

            Catch ex As Exception

                ShowAlert(ex.Message)

            End Try


        End If

    End Sub

    ''' <summary>
    ''' Gets the donor partial payments detials.
    ''' </summary>
    ''' <param name="donorId">The donor id.</param>
    Private Sub GetDonorPartialPaymentsDetials(ByVal donorId As Int32)

        If donorId > Constant.DONOR_ID_BENEFACTOR_FEMALE Then

            Try
                Dim donorPartialPaymentsDetails As DataSet
                Dim donorPartialPaymentsDetailsParams As Object()
                Dim languageParam As String


                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    languageParam = "Ara"

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    languageParam = "Eng"

                End If

                donorPartialPaymentsDetailsParams = {donorId,
                                               languageParam}

                donorPartialPaymentsDetails = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorAllPartialPaymentInstructions", System.Data.CommandType.StoredProcedure, donorPartialPaymentsDetailsParams)

                If (donorPartialPaymentsDetails.Tables(0).Rows.Count > 0) Then
                    grvDonorPartialPayments.DataSource = donorPartialPaymentsDetails
                    grvDonorPartialPayments.DataBind()
                End If

            Catch ex As Exception

            End Try


        End If
    End Sub

    Private Sub DisableDonorProfile()

        txtMobile.Enabled = False
        txtEnglishName.Enabled = False
        txtArabicName.Enabled = False
        txtCivilID.Enabled = False
        txtPhone.Enabled = False
        ddlDonorType.Enabled = False
        ddlSalute.Enabled = False
        btnOpen.Enabled = True
        btnCreate.Enabled = False
    End Sub

    Protected Sub lbtnAdd_Click(sender As Object, e As EventArgs)
        'New Add
        'Add Insert Logic here
        Try
            'Dim donationDist As New DonationDist

            Dim txtDonationValueEmpty As TextBox = grvDonationDist.Controls(0).Controls(1).FindControl("txtDonationValueNew")
            Dim txtDonationNotesEmpty As TextBox = grvDonationDist.Controls(0).Controls(1).FindControl("txtDonationNotesFooter")
            Dim ddlCountryEmpty As DropDownList = grvDonationDist.Controls(0).Controls(1).FindControl("ddlCountryNew")
            'Dim ddlPurposeEmpty As DropDownList = grvDonationDist.Controls(0).Controls(1).FindControl("ddlNewDonationPurposeType")
            Dim ddlPurposeEmpty As ASPxComboBox = grvDonationDist.Controls(0).Controls(1).FindControl("donation_code_New")
            Dim chkPartial As CheckBox = grvDonationDist.Controls(0).Controls(1).FindControl("chkPartialNew")
            Dim standInstruct As TextBox = grvDonationDist.Controls(0).Controls(1).FindControl("lblStandInstructNew")
            Dim txtQtyNew As TextBox = grvDonationDist.Controls(0).Controls(1).FindControl("txtQtyNew")
            Dim txtLineAmountNew As TextBox = grvDonationDist.Controls(0).Controls(1).FindControl("txtLineAmountNew")

            '==========================================================================================================================
            'WAS FOR TEST AND KEPT FOR FUTURE USAGE BUT NOT USED RIGHT NOW
            '--------------------------------------------------------------------------------------------------------------------------
            CalculateLineAmount(txtDonationValueEmpty, txtQtyNew, txtLineAmountNew)
            '==========================================================================================================================

            Dim donationValue As Decimal = Convert.ToDecimal(txtDonationValueEmpty.Text)
            'new added lateef
            Dim NewLineAmt = Convert.ToDecimal(txtLineAmountNew.Text)
            'end 
            FillEmptyTextBoxWithValue(txtQtyNew)

            'Validation: User must select donation type
            'If (ddlPurposeEmpty.SelectedValue <= 0) Then
            If (ddlPurposeEmpty.Value Is Nothing) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("الرجاء إختيار غرض التبرع")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Please select donation type")

                End If

                Exit Sub

            End If


            'Validation: Donation Value must be > 0
            'If (donationValue <= 0) Then
            If (NewLineAmt <= 0) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("قيمة التبرع يجب ان تكون أكبر من الصفر")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Donation Value must be greater than 0")

                End If

                Exit Sub

            End If

            'Validation: Number of Bank Instruction must exist in system
            If (Not IsBankInstructionExsit(standInstruct.Text)) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("رقم الأستقطاع البنكي غير موجود")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Bank Instruction number is not exist")

                End If

                Exit Sub
            End If

            'Validation: Number of Bank Instruction must exist in system
            If (Convert.ToDecimal(txtQtyNew.Text) = 0) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("لا يمكن إدخال عدد تبرعات 0")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("You cannot input quantity 0")

                End If

                Exit Sub
            End If


            myDonationDistDataTable = ViewState("myDonationDistDataTable")

            myDonationDistDataRow = myDonationDistDataTable.NewRow()
            myDonationDistDataRow("reciept_num") = 0
            myDonationDistDataRow("donation_code") = Convert.ToInt16(ddlPurposeEmpty.Value) 'Convert.ToInt16(ddlPurposeEmpty.SelectedValue)
            myDonationDistDataRow("donation_name") = ddlPurposeEmpty.Text 'ddlPurposeEmpty.SelectedItem.Text
            myDonationDistDataRow("donation_value") = Convert.ToDecimal(txtDonationValueEmpty.Text)
            myDonationDistDataRow("country_code") = Convert.ToInt16(ddlCountryEmpty.SelectedValue)
            myDonationDistDataRow("country_name") = ddlCountryEmpty.SelectedItem.Text
            myDonationDistDataRow("distribution_remrks") = txtDonationNotesEmpty.Text
            myDonationDistDataRow("partial") = chkPartial.Checked
            myDonationDistDataRow("standing_inst_num") = If(String.IsNullOrEmpty(standInstruct.Text), 0, Convert.ToInt32(standInstruct.Text))
            myDonationDistDataRow("Qty") = If(String.IsNullOrWhiteSpace(txtQtyNew.Text), 1, Convert.ToDecimal(txtQtyNew.Text))
            myDonationDistDataRow("line_amount") = If(String.IsNullOrWhiteSpace(txtLineAmountNew.Text), 0, Convert.ToDecimal(txtLineAmountNew.Text))

            'add the new DataRow to DataTable's Row
            myDonationDistDataTable.Rows.Add(myDonationDistDataRow)

            ViewState("myDonationDistDataTable") = myDonationDistDataTable

            grvDonationDist.DataSource = myDonationDistDataTable
            grvDonationDist.DataBind()

            Dim ddlPurposeFooter As ASPxComboBox = grvDonationDist.FooterRow.FindControl("donation_code_Edit")
            ddlPurposeFooter.Focus()

        Catch ex As Exception

        End Try
    End Sub

    ''' <summary>
    ''' Fills the empty text box with value.
    ''' </summary>
    ''' <param name="textBox">The text box.</param>
    Private Sub FillEmptyTextBoxWithValue(ByVal textBox As TextBox)

        If (String.IsNullOrWhiteSpace(textBox.Text)) Then
            textBox.Text = "0"
        End If
    End Sub

    Protected Sub lbtnAddFromFooter_Click(sender As Object, e As EventArgs)
        'Footer Add
        'Add Insert Logic here
        Try

            Dim txtDonationValueFooter As TextBox = grvDonationDist.FooterRow.FindControl("txtDonationValueFooter")
            Dim txtDonationNotesFooter As TextBox = grvDonationDist.FooterRow.FindControl("txtDonationNotesFooter")
            Dim ddlCountryFooter As DropDownList = grvDonationDist.FooterRow.FindControl("ddlCountryFooter")
            'Dim ddlPurposeFooter As DropDownList = grvDonationDist.FooterRow.FindControl("ddlNewDonationPurposeType")
            Dim ddlPurposeFooter As ASPxComboBox = grvDonationDist.FooterRow.FindControl("donation_code_Edit")
            Dim chkPartial As CheckBox = grvDonationDist.FooterRow.FindControl("chkPartialFooter")
            Dim standInstruct As TextBox = grvDonationDist.FooterRow.FindControl("lblStandInstructFooter")
            Dim txtQtyFooter As TextBox = grvDonationDist.FooterRow.FindControl("txtQtyFooter")
            Dim txtLineAmountFooter As TextBox = grvDonationDist.FooterRow.FindControl("txtLineAmountFooter")

            '==========================================================================================================================
            'WAS FOR TEST AND KEPT FOR FUTURE USAGE BUT NOT USED RIGHT NOW
            '--------------------------------------------------------------------------------------------------------------------------
            CalculateLineAmount(txtDonationValueFooter, txtQtyFooter, txtLineAmountFooter)
            '==========================================================================================================================

            Dim donationValue As Decimal = Convert.ToDecimal(txtDonationValueFooter.Text)
            'aded lateef
            Dim LineAmtFooter = Convert.ToDecimal(txtLineAmountFooter.Text)
            'end
            FillEmptyTextBoxWithValue(txtQtyFooter)

            'Validation: User must select donation type
            If (ddlPurposeFooter.Value Is Nothing) Then
                'If (ddlPurposeFooter.SelectedValue <= 0) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("الرجاء إختيار غرض التبرع")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Please select donation type")

                End If

                Exit Sub

            End If

            'Validation: Donation Value must be > 0
            'If (donationValue <= 0) Then 'commented lateef
            If (LineAmtFooter <= 0) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("قيمة التبرع يجب ان تكون أكبر من الصفر")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Donation Value must be greater than 0")

                End If

                Exit Sub

            End If

            myDonationDistDataTable = ViewState("myDonationDistDataTable")

            'Validation: Only one donation type per Receipt
            For Each row As DataRow In myDonationDistDataTable.Rows

                If (row.Item("donation_code") = ddlPurposeFooter.Value) And (row.Item("country_code") = ddlCountryFooter.SelectedValue) Then

                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                        ShowAlert("لا يمكن تكرار نفس الغرض و الدوله في نفس سند القبض")

                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                        ShowAlert("You cannot add the same Donation Type and country per receipt")

                    End If

                    Exit Sub

                End If

            Next

            'Validation: Number of Bank Instruction must exist in system
            If (Not IsBankInstructionExsit(standInstruct.Text)) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("رقم الأستقطاع البنكي غير موجود")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Bank Instruction number is not exist")

                End If

                Exit Sub
            End If

            'Validation: Donation Quantity must be greater than 0
            If (Convert.ToDecimal(txtQtyFooter.Text) <= 0) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("لا يمكن إدخال عدد تبرعات 0")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("You cannot input quantity 0")

                End If

                Exit Sub
            End If

            myDonationDistDataRow = myDonationDistDataTable.NewRow()
            myDonationDistDataRow("reciept_num") = 0
            myDonationDistDataRow("donation_code") = Convert.ToInt16(ddlPurposeFooter.Value) 'Convert.ToInt16(ddlPurposeFooter.SelectedValue)
            myDonationDistDataRow("donation_name") = ddlPurposeFooter.Text 'ddlPurposeFooter.SelectedItem.Text
            myDonationDistDataRow("donation_value") = Convert.ToDecimal(txtDonationValueFooter.Text)
            myDonationDistDataRow("country_code") = Convert.ToInt16(ddlCountryFooter.SelectedValue)
            myDonationDistDataRow("country_name") = ddlCountryFooter.SelectedItem.Text
            myDonationDistDataRow("distribution_remrks") = txtDonationNotesFooter.Text
            myDonationDistDataRow("partial") = chkPartial.Checked
            myDonationDistDataRow("standing_inst_num") = If(String.IsNullOrWhiteSpace(standInstruct.Text), 0, Convert.ToInt32(standInstruct.Text))
            myDonationDistDataRow("Qty") = If(String.IsNullOrWhiteSpace(txtQtyFooter.Text), 1, Convert.ToDecimal(txtQtyFooter.Text))
            myDonationDistDataRow("line_amount") = If(String.IsNullOrWhiteSpace(txtLineAmountFooter.Text), 0, Convert.ToDecimal(txtLineAmountFooter.Text))

            'add the new DataRow to DataTable's Row
            myDonationDistDataTable.Rows.Add(myDonationDistDataRow)

            ViewState("myDonationDistDataTable") = myDonationDistDataTable

            grvDonationDist.DataSource = myDonationDistDataTable
            grvDonationDist.DataBind()
            ddlPurposeFooter.Focus()

        Catch ex As Exception


        End Try
    End Sub

    ''' <summary>
    ''' Determines whether [is bank instruction exsit] [the specified stand instruct].
    ''' </summary>
    ''' <param name="standInstruct">The stand instruct.</param><returns>
    '''   <c>true</c> if [is bank instruction exsit] [the specified stand instruct]; otherwise, <c>false</c>.
    ''' </returns>
    Private Function IsBankInstructionExsit(ByVal standInstruct As String) As Boolean

        Dim sqlCheckIfInstExist As String
        Dim sqlQueryResult As Int32
        Dim ret As Boolean

        If (Not String.IsNullOrWhiteSpace(standInstruct)) Then

            If (Convert.ToInt32(standInstruct) <> 0) Then

                sqlCheckIfInstExist = "SELECT COUNT(*) FROM standing_instruction WHERE ref_numb = " & standInstruct
                sqlQueryResult = _ws.GetMyScalar("charitysoft", Session("username"), Session("password"), sqlCheckIfInstExist)

                If (sqlQueryResult <= 0) Then

                    ret = False

                Else

                    ret = True

                End If

            Else

                ret = True

            End If

        Else
            ret = True
        End If

        Return ret
    End Function

    Protected Sub lbtnAddPaymentFooter_Click(sender As Object, e As EventArgs)
        Try

            Dim txtPaymentAmountFooter As TextBox = grvPayments.FooterRow.FindControl("txtPaymentAmountFooter")
            Dim txtAccountNumberFooter As TextBox = grvPayments.FooterRow.FindControl("txtAccountNumberFooter")
            Dim txtAuthorizationNumberFooter As TextBox = grvPayments.FooterRow.FindControl("txtAuthorizationNumberFooter")
            Dim ddlPaymentMethodFooter As DropDownList = grvPayments.FooterRow.FindControl("ddlPaymentMethodFooter")
            Dim ddlBankFooter As DropDownList = grvPayments.FooterRow.FindControl("ddlBankFooter")
            Dim paymentValue As Decimal = Convert.ToDecimal(txtPaymentAmountFooter.Text)

            'Validation: Payment Value must be > 0
            If (paymentValue <= 0) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("قيمة الدفع يجب ان تكون أكبر من الصفر")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Payment Value must be greater than 0")

                End If

                Exit Sub

            End If

            'Validation: KNET payment must have Bank
            If (ddlBankFooter.SelectedValue <= 0 And ddlPaymentMethodFooter.SelectedValue = 2) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("الرجاء تحديد البنك")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Please select Bank")

                End If

                Exit Sub
            End If

            'Validation: KNET payment must have Reference Number
            If (txtAuthorizationNumberFooter.Text = "" And ddlBankFooter.SelectedValue <= 0 And ddlPaymentMethodFooter.SelectedValue = 2) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("الرجاء اضافة رقم المرجع")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Please Add Reference Number")

                End If

                Exit Sub
            End If

            'Validation: Cheak payment must have Bank
            If (ddlBankFooter.SelectedValue <= 0 And ddlPaymentMethodFooter.SelectedValue = 3) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("الرجاء تحديد البنك")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Please select Bank")

                End If

                Exit Sub
            End If

            'Validation: User must select payment method
            If (ddlPaymentMethodFooter.SelectedValue <= 0) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("الرجاء تحديد طريقة الدفع")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Please select Payment Method")

                End If

                Exit Sub
            End If

            myPaymentDistDataTable = ViewState("myPaymentDistDataTable")

            myPaymentDistDataRow = myPaymentDistDataTable.NewRow()
            myPaymentDistDataRow("reciept_num") = 0
            myPaymentDistDataRow("reciept_ser_det") = 0
            myPaymentDistDataRow("pay_amnt") = Convert.ToDecimal(txtPaymentAmountFooter.Text)
            myPaymentDistDataRow("acc_num") = txtAccountNumberFooter.Text
            myPaymentDistDataRow("authorization_code") = txtAuthorizationNumberFooter.Text
            myPaymentDistDataRow("bank_code") = Convert.ToInt16(ddlBankFooter.SelectedValue)
            myPaymentDistDataRow("bank_name") = ddlBankFooter.SelectedItem.Text
            myPaymentDistDataRow("pay_method_name") = ddlPaymentMethodFooter.SelectedItem.Text
            myPaymentDistDataRow("pay_method_id") = Convert.ToByte(ddlPaymentMethodFooter.SelectedValue)

            'add the new DataRow to DataTable's Row
            myPaymentDistDataTable.Rows.Add(myPaymentDistDataRow)

            ViewState("myPaymentDistDataTable") = myPaymentDistDataTable

            grvPayments.DataSource = myPaymentDistDataTable
            grvPayments.DataBind()
            grvPayments.Focus()

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub lbtnAddPaymentNew_Click(sender As Object, e As EventArgs)
        Try

            myDonationDistDataTable = ViewState("myDonationDistDataTable")

            If Not myDonationDistDataTable Is Nothing Then

                If myDonationDistDataTable.Rows.Count > 0 Then

                    Dim txtPaymentAmountNew As TextBox = grvPayments.Controls(0).Controls(1).FindControl("txtPaymentAmountNew")
                    Dim txtAccountNumberNew As TextBox = grvPayments.Controls(0).Controls(1).FindControl("txtAccountNumberNew")
                    Dim txtAuthorizationNumberNew As TextBox = grvPayments.Controls(0).Controls(1).FindControl("txtAuthorizationNumberNew")
                    Dim ddlPaymentMethodNew As DropDownList = grvPayments.Controls(0).Controls(1).FindControl("ddlPaymentMethodNew")
                    Dim ddlBankNew As DropDownList = grvPayments.Controls(0).Controls(1).FindControl("ddlBankNew")
                    Dim paymentValue As Decimal = Convert.ToDecimal(txtPaymentAmountNew.Text)

                    'Validation: Payment Value must be > 0
                    If (paymentValue <= 0) Then

                        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                            ShowAlert("قيمة الدفع يجب ان تكون أكبر من الصفر")

                        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                            ShowAlert("Payment Value must be greater than 0")

                        End If

                        Exit Sub

                    End If

                    'Validation: KNET payment must have Bank
                    If (ddlBankNew.SelectedValue <= 0 And ddlPaymentMethodNew.SelectedValue = 2) Then
                        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                            ShowAlert("الرجاء تحديد البنك")

                        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                            ShowAlert("Please select Bank")

                        End If

                        Exit Sub
                    End If

                    'Validation: KNET payment must have Reference Number
                    If (txtAuthorizationNumberNew.Text = "" And ddlBankNew.SelectedValue > 0 And ddlPaymentMethodNew.SelectedValue = 2) Then
                        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                            ShowAlert("الرجاء اضافة رقم المرجع")

                        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                            ShowAlert("Please Add Reference Number")

                        End If

                        Exit Sub
                    End If

                    'Validation: Check payment must have Bank
                    If (ddlBankNew.SelectedValue <= 0 And ddlPaymentMethodNew.SelectedValue = 3) Then
                        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                            ShowAlert("الرجاء تحديد البنك")

                        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                            ShowAlert("Please select Bank")

                        End If

                        Exit Sub
                    End If

                    'Validation: User must select payment method
                    If (ddlPaymentMethodNew.SelectedValue <= 0) Then
                        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                            ShowAlert("الرجاء تحديد طريقة الدفع")

                        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                            ShowAlert("Please select Payment Method")

                        End If

                        Exit Sub
                    End If


                    'Validation: Cash payment must have Reference Number
                    If (txtAuthorizationNumberNew.Text = "" And ddlPaymentMethodNew.SelectedValue = 1) Then
                        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                            ShowAlert("الرجاء اضافة رقم المرجع")

                        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                            ShowAlert("Please Add Reference Number")

                        End If

                        Exit Sub
                    End If

                    myPaymentDistDataTable = ViewState("myPaymentDistDataTable")

                    myPaymentDistDataRow = myPaymentDistDataTable.NewRow()
                    myPaymentDistDataRow("reciept_num") = 0
                    myPaymentDistDataRow("pay_amnt") = Convert.ToDecimal(txtPaymentAmountNew.Text)
                    myPaymentDistDataRow("acc_num") = txtAccountNumberNew.Text
                    myPaymentDistDataRow("authorization_code") = txtAuthorizationNumberNew.Text
                    myPaymentDistDataRow("bank_code") = Convert.ToInt16(ddlBankNew.SelectedValue)
                    myPaymentDistDataRow("bank_name") = ddlBankNew.SelectedItem.Text
                    myPaymentDistDataRow("pay_method_name") = ddlPaymentMethodNew.SelectedItem.Text
                    myPaymentDistDataRow("pay_method_id") = Convert.ToByte(ddlPaymentMethodNew.SelectedValue)

                    'add the new DataRow to DataTable's Row
                    myPaymentDistDataTable.Rows.Add(myPaymentDistDataRow)

                    ViewState("myPaymentDistDataTable") = myPaymentDistDataTable

                    grvPayments.DataSource = myPaymentDistDataTable
                    grvPayments.DataBind()
                    grvPayments.Focus()

                Else

                    ShowAlert("من فضلك قم بإضافه التبرعات اولا")
                    grvDonationDist.Controls(0).Controls(1).FindControl("donation_code_New").Focus()

                End If

            End If

        Catch ex As Exception

        End Try
    End Sub

    Sub ShowAlert(ByVal message As String)
        ScriptManager.RegisterStartupScript(Me.UpdatePanel, UpdatePanel.GetType(), "notificationScript", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
    End Sub

    'Protected Sub chkPartialPayment_CheckedChanged(sender As Object, e As EventArgs) Handles chkPartialPayment.CheckedChanged
    '    'When user make the payment partial system will check if there is any partial payment bank instructions exist
    '    'if there's no partial payment bank instructions system will notify user this will create New partial payment bank instructions

    '    Try
    '        Dim donorPartialPaymentInst As DataSet
    '        Dim param() As Object

    '        If (Not String.IsNullOrWhiteSpace(txtDonorID.Text)) Then
    '            If (chkPartialPayment.Checked) Then

    '                param = {Convert.ToInt32(txtDonorID.Text)}
    '                donorPartialPaymentInst = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorPartialPaymentInstructions", CommandType.StoredProcedure, param)

    '                If (donorPartialPaymentInst.Tables(0).Rows.Count > 0) Then
    '                    'Show user the existing partial Payments

    '                    grvPartialInstructions.DataSource = donorPartialPaymentInst
    '                    grvPartialInstructions.DataBind()

    '                    pnlPartialInstructions_ModalPopupExtender.Show()
    '                Else
    '                    'Alert user
    '                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

    '                        ShowAlert("سيتم إدخال قسط جديد!")

    '                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

    '                        ShowAlert("This will create new standard instruction!")

    '                    End If

    '                    txtPartialPaymentInsturct.Text = "NEW"
    '                End If
    '            Else

    '            End If

    '        End If
    '    Catch ex As Exception

    '    End Try



    'End Sub

    Protected Sub chkPartialNew_CheckedChanged(sender As Object, e As EventArgs)
        Try
            Dim chkPartialNew As CheckBox = CType(sender, CheckBox)
            Dim partialPayment As DataSet
            Dim donationDataRow As GridViewRow = CType(chkPartialNew.NamingContainer, GridViewRow)
            Session("donationRowIndex") = donationDataRow.RowIndex
            Session("donationRowType") = donationDataRow.RowType
            'Dim ddlDonation As DropDownList = donationDataRow.FindControl("ddlNewDonationPurposeType")
            Dim ddlDonation As ASPxComboBox = donationDataRow.FindControl("donation_code_New")
            Dim lblStandInstructNew As TextBox = donationDataRow.FindControl("lblStandInstructNew")
            Dim language As String = If(CultureInfo.CurrentUICulture.Name.Contains("en"), "English", "Arabic")
            Dim param() As Object = {Convert.ToInt32(txtDonorID.Text),
                                     Convert.ToInt16(ddlDonation.Value),
                                     language}

            If (chkPartialNew.Checked) Then
                partialPayment = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorPartialPaymentInstructions", CommandType.StoredProcedure, param)


                If (partialPayment.Tables(0).Rows.Count > 0) Then
                    'Show user the existing partial Payments

                    grvPartialInstructions.DataSource = partialPayment
                    grvPartialInstructions.DataBind()

                    pnlPartialInstructions_ModalPopupExtender.Show()

                Else
                    'Alert user
                    'If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    '    ShowAlert("سيتم إدخال قسط جديد!")

                    'ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    '    ShowAlert("This will create new standard instruction!")

                    'End If

                    'lblStandInstructNew.Text = "NEW"
                End If

            Else

                lblStandInstructNew.Text = String.Empty

            End If

            donationDataRow.FindControl("txtDonationNotesFooter").Focus()

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub chkPartialFooter_CheckedChanged(sender As Object, e As EventArgs)
        Try
            Dim chkPartialNew As CheckBox = CType(sender, CheckBox)
            Dim partialPayment As DataSet
            Dim donationDataRow As GridViewRow = CType(chkPartialNew.NamingContainer, GridViewRow)
            Session("donationRowIndex") = donationDataRow.RowIndex
            Session("donationRowType") = donationDataRow.RowType
            'Dim ddlDonation As DropDownList = donationDataRow.FindControl("ddlNewDonationPurposeType")
            Dim ddlDonation As ASPxComboBox = donationDataRow.FindControl("donation_code_Edit")
            Dim lblStandInstructNew As TextBox = donationDataRow.FindControl("lblStandInstructFooter")
            Dim language As String = If(CultureInfo.CurrentUICulture.Name.Contains("en"), "English", "Arabic")
            Dim param() As Object = {Convert.ToInt32(txtDonorID.Text),
                                     Convert.ToInt16(ddlDonation.Value),
                                     language}

            If (chkPartialNew.Checked) Then
                partialPayment = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorPartialPaymentInstructions", CommandType.StoredProcedure, param)


                If (partialPayment.Tables(0).Rows.Count > 0) Then
                    'Show user the existing partial Payments

                    grvPartialInstructions.DataSource = partialPayment
                    grvPartialInstructions.DataBind()

                    pnlPartialInstructions_ModalPopupExtender.Show()
                Else
                    'Alert user
                    'If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    '    ShowAlert("سيتم إدخال قسط جديد!")

                    'ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    '    ShowAlert("This will create new standard instruction!")

                    'End If

                    'lblStandInstructNew.Text = 0
                End If

            Else

                lblStandInstructNew.Text = String.Empty
            End If

            donationDataRow.FindControl("txtDonationNotesFooter").Focus()

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub chkPartialEdit_CheckedChanged(sender As Object, e As EventArgs)
        Try
            Dim chkPartialNew As CheckBox = CType(sender, CheckBox)
            Dim partialPayment As DataSet
            Dim donationDataRow As GridViewRow = CType(chkPartialNew.NamingContainer, GridViewRow)
            Session("donationRowIndex") = donationDataRow.RowIndex
            Session("donationRowType") = donationDataRow.RowType
            Dim lblDonation As Label = donationDataRow.FindControl("lblDonationCodeEdit")
            Dim lblStandInstructNew As TextBox = donationDataRow.FindControl("lblStandInstructEdit")
            Dim language As String = If(CultureInfo.CurrentUICulture.Name.Contains("en"), "English", "Arabic")
            Dim param() As Object = {Convert.ToInt32(txtDonorID.Text),
                                     Convert.ToInt16(lblDonation.Text),
                                     language}

            If (chkPartialNew.Checked) Then
                partialPayment = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorPartialPaymentInstructions", CommandType.StoredProcedure, param)


                If (partialPayment.Tables(0).Rows.Count > 0) Then
                    'Show user the existing partial Payments

                    grvPartialInstructions.DataSource = partialPayment
                    grvPartialInstructions.DataBind()

                    pnlPartialInstructions_ModalPopupExtender.Show()
                Else
                    'Alert user
                    'If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    '    ShowAlert("سيتم إدخال قسط جديد!")

                    'ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    '    ShowAlert("This will create new standard instruction!")

                    'End If

                    'lblStandInstructNew.Text = 0
                End If
            Else

                lblStandInstructNew.Text = String.Empty
            End If
        Catch ex As Exception

        End Try
    End Sub

    Private Function GetPaymentTotalAmount(ByVal paymentDistDataTable As DataTable) As Decimal
        Dim paymentTotalAmount As Decimal

        If (paymentDistDataTable.Rows.Count > 0) Then

            For Each row As DataRow In paymentDistDataTable.Rows
                paymentTotalAmount += CDec(row.Item("pay_amnt"))
            Next

        Else

            paymentTotalAmount = 0

        End If

        Return paymentTotalAmount
    End Function

    ''' <summary>
    ''' Gets the donation dist total amount.
    ''' </summary>
    ''' <param name="donationDistDataTable">The donation dist data table.</param><returns></returns>
    Private Function GetDonationDistTotalAmount(ByVal donationDistDataTable As DataTable) As Decimal
        Dim donatoinDistTotalAmount As Decimal

        If (donationDistDataTable.Rows.Count > 0) Then

            For Each row As DataRow In donationDistDataTable.Rows
                donatoinDistTotalAmount += CDec(row.Item("line_amount"))
            Next

        Else

            donatoinDistTotalAmount = 0

        End If

        Return donatoinDistTotalAmount
    End Function

    'Protected Sub chkWaqf_CheckedChanged(sender As Object, e As EventArgs) Handles chkWaqf.CheckedChanged
    '    Try
    '        If (chkWaqf.Checked) Then
    '            ddlcampaign.Enabled = False
    '        Else
    '            ddlcampaign.Enabled = True
    '        End If

    '        ddlDontationGroup.Focus()

    '    Catch ex As Exception

    '    End Try
    'End Sub

    Protected Sub ddlDonationPurposeType_DataBinding(sender As Object, e As EventArgs)
        Try
            Dim ddlDonationPurposeType As DropDownList = CType(sender, DropDownList)
            Dim defaultListItem As New ListItem

            defaultListItem.Text = GetLocalResourceObject("ListItemResource14.Text").ToString()
            defaultListItem.Value = GetLocalResourceObject("ListItemResource14.Value").ToString()

            If (ddlDonationPurposeType.Items.Count > 0) Then
                ddlDonationPurposeType.Items.Clear()
                ddlDonationPurposeType.Items.Add(defaultListItem)
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ddlPaymentMethodNew_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim ddlPaymentMethodNew As DropDownList = CType(sender, DropDownList)
            Dim txtAccountNumberNew As TextBox = grvPayments.Controls(0).Controls(1).FindControl("txtAccountNumberNew")
            Dim ddlBankNew As DropDownList = grvPayments.Controls(0).Controls(1).FindControl("ddlBankNew")
            Dim txtPaymentAmountNew As TextBox = grvPayments.Controls(0).Controls(1).FindControl("txtPaymentAmountNew")

            If (ddlPaymentMethodNew.SelectedValue = 1) Then
                txtAccountNumberNew.Enabled = False
                ddlBankNew.Enabled = False
            Else
                txtAccountNumberNew.Enabled = True
                ddlBankNew.Enabled = True
            End If

            txtPaymentAmountNew.Focus()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ddlPaymentMethodFooter_SelectedIndexChanged(sender As Object, e As EventArgs)
        Try
            Dim ddlPaymentMethodFooter As DropDownList = CType(sender, DropDownList)
            Dim txtAccountNumberFooter As TextBox = grvPayments.FooterRow.FindControl("txtAccountNumberFooter")
            Dim ddlBankFooter As DropDownList = grvPayments.FooterRow.FindControl("ddlBankFooter")
            Dim txtPaymentAmountFooter As TextBox = grvPayments.FooterRow.FindControl("txtPaymentAmountFooter")

            If (ddlPaymentMethodFooter.SelectedValue = 1) Then
                txtAccountNumberFooter.Enabled = False
                ddlBankFooter.Enabled = False
            Else
                txtAccountNumberFooter.Enabled = True
                ddlBankFooter.Enabled = True
            End If

            txtPaymentAmountFooter.Focus()
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub lbtnShowInstructionNew_Click(sender As Object, e As EventArgs)
        Try
            Dim lbtnShowInstructionNew As LinkButton = CType(sender, LinkButton)
            Dim partialPayment As DataSet
            Dim donationDataRow As GridViewRow = CType(lbtnShowInstructionNew.NamingContainer, GridViewRow)
            Session("donationRowIndex") = donationDataRow.RowIndex
            Session("donationRowType") = donationDataRow.RowType
            'Dim lblDonation As DropDownList = donationDataRow.FindControl("ddlNewDonationPurposeType")
            Dim lblDonation As ASPxComboBox = donationDataRow.FindControl("donation_code_New")
            Dim lblStandInstructNew As TextBox = donationDataRow.FindControl("lblStandInstructNew")
            Dim language As String = If(CultureInfo.CurrentUICulture.Name.Contains("en"), "English", "Arabic")
            Dim param() As Object

            'User must select donation type first
            If (lblDonation.Value = 0) Then
                ShowAlert(GetLocalResourceObject("SelectDonationWarning").ToString())

                Exit Sub
            End If

            param = {Convert.ToInt32(txtDonorID.Text),
                    Convert.ToInt16(lblDonation.Value),
                    language}

            partialPayment = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorRemainingBankInstructions", CommandType.StoredProcedure, param)


            If (partialPayment.Tables(0).Rows.Count > 0) Then
                'Show user the existing partial Payments

                grvPartialInstructions.DataSource = partialPayment
                grvPartialInstructions.DataBind()

                pnlPartialInstructions_ModalPopupExtender.Show()
            Else
                lblStandInstructNew.Text = String.Empty
            End If

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub lbtnShowInstructionEdit_Click(sender As Object, e As EventArgs)
        Try
            Dim lbtnShowInstructionEdit As LinkButton = CType(sender, LinkButton)
            Dim partialPayment As DataSet
            Dim donationDataRow As GridViewRow = CType(lbtnShowInstructionEdit.NamingContainer, GridViewRow)
            Session("donationRowIndex") = donationDataRow.RowIndex
            Session("donationRowType") = donationDataRow.RowType
            Dim lblDonation As Label = donationDataRow.FindControl("lblDonationCodeEdit")
            Dim lblStandInstructEdit As TextBox = donationDataRow.FindControl("lblStandInstructEdit")
            Dim language As String = If(CultureInfo.CurrentUICulture.Name.Contains("en"), "English", "Arabic")
            Dim param() As Object

            'User must select donation type first
            If (lblDonation.Text = 0) Then
                ShowAlert(GetLocalResourceObject("SelectDonationWarning").ToString())

                Exit Sub
            End If

            param = {Convert.ToInt32(txtDonorID.Text),
                    Convert.ToInt16(lblDonation.Text),
                    language}

            partialPayment = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorRemainingBankInstructions", CommandType.StoredProcedure, param)


            If (partialPayment.Tables(0).Rows.Count > 0) Then
                'Show user the existing partial Payments

                grvPartialInstructions.DataSource = partialPayment
                grvPartialInstructions.DataBind()

                pnlPartialInstructions_ModalPopupExtender.Show()
            Else
                lblStandInstructEdit.Text = String.Empty
            End If

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub lbtnShowInstructionFooter_Click(sender As Object, e As EventArgs)
        Try
            Dim lbtnShowInstructionNew As LinkButton = CType(sender, LinkButton)
            Dim partialPayment As DataSet
            Dim donationDataRow As GridViewRow = CType(lbtnShowInstructionNew.NamingContainer, GridViewRow)
            Session("donationRowIndex") = donationDataRow.RowIndex
            Session("donationRowType") = donationDataRow.RowType
            'Dim lblDonation As DropDownList = donationDataRow.FindControl("ddlNewDonationPurposeType")
            Dim lblDonation As ASPxComboBox = donationDataRow.FindControl("donation_code_Edit")
            Dim lblStandInstructFooter As TextBox = donationDataRow.FindControl("lblStandInstructFooter")
            Dim language As String = If(CultureInfo.CurrentUICulture.Name.Contains("en"), "English", "Arabic")
            Dim param() As Object = {Convert.ToInt32(txtDonorID.Text),
                                     Convert.ToInt16(lblDonation.Value),
                                     language}

            'User must select donation type first
            If (lblDonation.Value = 0) Then
                ShowAlert(GetLocalResourceObject("SelectDonationWarning").ToString())

                Exit Sub
            End If

            param = {Convert.ToInt32(txtDonorID.Text),
                      Convert.ToInt16(lblDonation.Value),
                      language}

            partialPayment = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorRemainingBankInstructions", CommandType.StoredProcedure, param)


            If (partialPayment.Tables(0).Rows.Count > 0) Then
                'Show user the existing partial Payments

                grvPartialInstructions.DataSource = partialPayment
                grvPartialInstructions.DataBind()

                pnlPartialInstructions_ModalPopupExtender.Show()
            Else
                lblStandInstructFooter.Text = String.Empty
            End If

        Catch ex As Exception

        End Try
    End Sub

    Private Sub RePrint()

        Try

            'btnRePrint.PostBackUrl = "~/DirectReceipt.aspx?reciept_num=" & 26

            ' Reprint Receipt
            '            If Session(SessionKey.USERNAME).ToString = "a.sumait" _
            '                Or Session(SessionKey.USERNAME).ToString = "f.essa" _
            '                Or Session(SessionKey.USERNAME).ToString = "Ayman.Tharwat" _
            '                Or Session(SessionKey.USERNAME).ToString = "ayman.tharwat2" _
            '                Or Session(SessionKey.USERNAME).ToString = "h.sayed" _
            '                Or Session(SessionKey.USERNAME).ToString = "m.thijeel" Then

            '                GoTo NextProcess
            '            Else

            '                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
            '                    ShowAlert("! عفوا لايوجد لديك صلاحيات لإعادة طباعة السند ")
            '                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
            '                    ShowAlert(" You do not have permission to reprint receipt again !")
            '                End If

            '                Exit Sub

            '            End If

            'NextProcess:
            If Len(txtReceiptID.Text) > 0 Then
                'Dim ReportDS As New DataSet
                'Dim refID() As Object = {txtReceiptID.Text.Trim()}

                'ReportDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "rcpt_numsprint", CommandType.StoredProcedure, refID)

                'If (ReportDS.Tables(0).Rows.Count > 0) Then

                '    ' Response.Redirect("~/DirectReceipt.aspx?receipt_num=" & ReportDS.Tables(0).Rows(0).Item("reciept_num").ToString)
                '    Response.Redirect("~/CollectionReportViewer.aspx")

                '    'Response.Redirect("~/DiraidRcpt.aspx?receipt_num=" & ReportDS.Tables(0).Rows(0).Item("reciept_num").ToString)

                'End If

                PreparePrint()

                IncreasePrintCount()

                Response.Redirect(ConfigurationSettings.AppSettings("DEFAULT_RECEIPT_REPORT_VIEWER_PAGE"))

            Else
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ShowAlert("الرجاء إدخال Receipt  Number")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ShowAlert("Please Enter Receipt  Number!")
                End If
            End If


        Catch ex As Exception

            ShowAlert(ex.Message)

        End Try

    End Sub

    Private Sub PreparePrint()

        '=======================================================================================
        'Declaration
        '---------------------------------------------------------------------------------------
        Dim _StringBuilder As StringBuilder
        Dim _ConnectionString As String
        Dim _SqlConnection As SqlConnection
        Dim _SqlCommand As SqlCommand
        Dim _SqlDataAdapter As SqlDataAdapter
        Dim _DataTable As DataTable
        '=======================================================================================

        '=======================================================================================
        'Initialization
        '---------------------------------------------------------------------------------------
        _StringBuilder = New StringBuilder

        _ConnectionString = New ConnectionStringEx().TheConnectionString

        _SqlConnection = New SqlConnection(_ConnectionString)

        _DataTable = New DataTable

        '---------------------------------------------------------------------------------------
        _StringBuilder.AppendFormat("SELECT * FROM dbo.Collection_Receipt_View WHERE (reciept_num = {0})", txtReceiptID.Text)

        _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)

        _SqlDataAdapter = New SqlDataAdapter(_SqlCommand)

        _SqlDataAdapter.Fill(_DataTable)
        '=======================================================================================

        '=======================================================================================
        'Processing
        '---------------------------------------------------------------------------------------
        Session(SessionKey.REPORT_DATASOURCE) = _DataTable
        Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing
        Session(SessionKey.REPORT_FILENAME) = ".\Reports\ReceiptVoucherDoubleV2.rpt"
        Session(SessionKey.REPORT_BACK_PATH) = String.Format("Collection.aspx?ReceiptID={0}", txtReceiptID.Text)
        Session(SessionKey.REPORT_FORMULA) = Nothing
        '=======================================================================================

    End Sub

    Private Sub DirectPrint()

        '=======================================================================================
        'Declaration
        '---------------------------------------------------------------------------------------
        Dim _ConnectionString As String
        Dim _SqlConnectionStringBuilder As SqlConnectionStringBuilder

        Dim _PrintDialog As New System.Windows.Forms.PrintDialog
        '=======================================================================================

        '=======================================================================================
        'Initialization
        '---------------------------------------------------------------------------------------
        _ConnectionString = New ConnectionStringEx().TheConnectionString
        _SqlConnectionStringBuilder = New SqlConnectionStringBuilder(_ConnectionString)

        _PrintDialog.AllowSomePages = True
        _PrintDialog.AllowPrintToFile = False
        '=======================================================================================

        '=======================================================================================
        'Processing
        '---------------------------------------------------------------------------------------

        If _PrintDialog.ShowDialog() = System.Windows.Forms.DialogResult.OK Then

            Dim copies As Integer = _PrintDialog.PrinterSettings.Copies
            Dim fromPage As Integer = _PrintDialog.PrinterSettings.FromPage
            Dim toPage As Integer = _PrintDialog.PrinterSettings.ToPage
            Dim collate As Boolean = _PrintDialog.PrinterSettings.Collate

            'CrystalReportSource1.ReportDocument.Load(Server.MapPath(Session(SessionName.REPORT_FILENAME)))
            'CrystalReportSource1.ReportDocument.SetDatabaseLogon(_SqlConnectionStringBuilder.UserID, _SqlConnectionStringBuilder.Password, _SqlConnectionStringBuilder.DataSource, _SqlConnectionStringBuilder.InitialCatalog)
            'CrystalReportSource1.ReportDocument.SetDataSource(DirectCast(Session(SessionName.REPORT_DATASOURCE), DataTable))

            'CrystalReportSource1.ReportDocument.PrintOptions.PrinterName = _PrintDialog.PrinterSettings.PrinterName
            'CrystalReportSource1.ReportDocument.PrintToPrinter(copies, collate, fromPage, toPage)

        End If

        'CrystalReportSource1.ReportDocument.Load(Server.MapPath(Session(SessionName.REPORT_FILENAME)))
        'CrystalReportSource1.ReportDocument.SetDatabaseLogon(_SqlConnectionStringBuilder.UserID, _SqlConnectionStringBuilder.Password, _SqlConnectionStringBuilder.DataSource, _SqlConnectionStringBuilder.InitialCatalog)
        'CrystalReportSource1.ReportDocument.SetDataSource(DirectCast(Session(SessionName.REPORT_DATASOURCE), DataTable))
        'CrystalReportSource1.ReportDocument.PrintToPrinter(1, False, 1, 1)
        '=======================================================================================

    End Sub

    Private Sub IncreasePrintCount()

        Using db As New Database

            Dim reciept_num As Int32 = txtReceiptID.Text

            db.SP_UPDATE_donation_tran_SET_print_count(reciept_num)

        End Using

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        btnVoid.Visible = False

        Try

            If Not IsPostBack Then

                If Request.QueryString.Count = 0 Then

                    CheckBox_SearchMode.Checked = True

                    SearchMode()

                End If

                txtReceiptDate.Enabled = DatabaseSecurity.IsRoleMember(DatabaseRoles.backlog)

                IsSaving = False

            End If

            Dim exc_amt As Decimal
            exc_amt = 1.0

            'Get the Page Culture to pass it to the clien side
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                _culture = "ar"

            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                _culture = "en"

            End If

            'Enable Reprint receipt button only when 
            'there is a receipt loaded from the database
            If (String.IsNullOrWhiteSpace(txtReceiptID.Text)) Then
                'btnRePrint.Enabled = False
            Else
                btnRePrint.Enabled = True
            End If


            'Enable New Donor button only when 
            'there is not donor loaded from the database
            If (String.IsNullOrWhiteSpace(txtDonorID.Text)) Then
                btnEnableDonorProfile.Enabled = True
            Else
                btnEnableDonorProfile.Enabled = False

            End If

            'Disable the search when Form has QueryString
            If (Not String.IsNullOrWhiteSpace(Request.QueryString("DonorId")) Or Not String.IsNullOrWhiteSpace(Request.QueryString("ReceiptId"))) Then
                ' txtSearch.Enabled = False
                'btnSearch.Enabled = False
            Else
                'txtSearch.Enabled = True
                btnSearch.Enabled = True
            End If

            If Not IsPostBack And Not Page.IsCallback Then

                ddlCurrency.SelectedValue = 1

                'changed by lateef
                'For Testing, username and password must be enter from Login Form
                ' Session("username") = "sa"
                ' Session("password") = "pass@word1"
                'Session(SessionKey.BRANCH_ID) = "1"


                'txtReceiptDate.Value = DateTime.Now.ToString("dd/MM/yyyy")
                txtReceiptDate.Value = DateTime.Now
                btnOpen.Enabled = False
                btnCreate.Enabled = False
                btnPrint.Enabled = False
                btnVoid.Enabled = True
                'txt_ExchRate =
                txt_ExchRate.Text = CDec(exc_amt).ToString("N3")
                InitializePaymentDistDataTable()
                InitializeDonationDistDataTable()
                'txtSearch.Focus()

                'Get the Receipt Details if user open Receipt from Donor Profile
                If (Not String.IsNullOrWhiteSpace(Request.QueryString("ReceiptID"))) Then
                    Dim donorDS As New DataSet
                    Dim receiptID() As Object = {Request.QueryString("ReceiptID")}

                    donorDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "SearchReceiptByID", System.Data.CommandType.StoredProcedure, receiptID)

                    If (donorDS.Tables(0).Rows().Count > 0) Then

                        btnPrint.Enabled = False
                        DisplayReceiptInfo(donorDS)
                        DisplayDonorInfo(donorDS)
                    Else
                        ClearForm()
                        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                            ShowAlert("لا يوجد بيانات")
                        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                            ShowAlert("No Data Found")
                        End If

                    End If
                Else

                    'Get the Receipt Details if user open New Receipt from Donor Profile
                    If (Not String.IsNullOrWhiteSpace(Request.QueryString("DonorID"))) Then

                        Dim donorDS As New DataSet
                        Dim donerID() As Object = {Request.QueryString("DonorID")}

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
                    End If

                End If

            End If

            Dim receiptNumber As Int32 = 0
            Int32.TryParse(txtReceiptID.Text, receiptNumber)
            btnPrint.Enabled = (receiptNumber = 0)

            'PreparePrint()

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click

        Search_New()

    End Sub

    Private Sub btnConfirmPrint_Click(sender As Object, e As EventArgs) Handles btnConfirmPrint.Click
        ''txtReceiptID.Text = refnumID.ToString()

        'Try
        '    If Len(txtReceiptID.Text) > 0 Then
        '        Dim ReportDS As New DataSet
        '        Dim refID() As Object = {txtReceiptID.Text.Trim()}

        '        ReportDS = _ws.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "rcpt_numsprint", CommandType.StoredProcedure, refID)
        '        If (ReportDS.Tables(0).Rows.Count > 0) Then
        '            'Response.Redirect("~/DirectReceipt.aspx?receipt_num=" & ReportDS.Tables(0).Rows(0).Item("reciept_num").ToString)
        '            Response.Redirect("~/DiraidRcpt.aspx?receipt_num=" & ReportDS.Tables(0).Rows(0).Item("reciept_num").ToString)
        '        End If
        '        'btnPrint.PostBackUrl = "~/DirectReceipt.aspx?reciept_num=" & 26
        '        ' Response.Redirect("~/DirectReceipt.aspx?receipt_num=")( & ReportDS.Tables(0).Rows(0))
        '    Else
        '        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '            ShowAlert("الرجاء إدخال Receipt  Number")
        '        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '            ShowAlert("Please Enter Receipt  Number!")
        '        End If
        '    End If
        'Catch ex As Exception

        'End Try

        RePrint()

    End Sub

    Private Sub btnRePrintYesConfirmation_Click(sender As Object, e As System.EventArgs) Handles btnRePrintYesConfirmation.Click

        RePrint()

    End Sub

    Protected Sub btnVoid_Click(sender As Object, e As System.EventArgs) Handles btnVoid.Click

        Voiding()

    End Sub

    Private Sub ddlCurrency_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlCurrency.SelectedIndexChanged
        Dim Cur As Integer
        Cur = Convert.ToInt16(ddlCurrency.SelectedValue)

        Dim ExchRate As DataSet
        Dim sql As String
        sql = "SELECT ISNULL(exch_rate,0) AS exchangeRate FROM currency_tab WHERE currency_code = " & ddlCurrency.SelectedValue

        ExchRate = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql)

        If (ExchRate.Tables(0).Rows.Count > 0) Then
            txt_ExchRate.Text = CDec(ExchRate.Tables(0).Rows(0).Item("exchangeRate")).ToString("N3")
            If ((lblDiff.Text) > 0 And (txt_ExchRate.Text) > 0) Then
                txt_amtKD.Text = CDec(txt_ExchRate.Text * lblDiff.Text).ToString("N3")
            Else
                txt_amtKD.Text = 0.0
            End If

            ddlCountryNew_SelectedIndexChanged(Nothing, Nothing)

            ddlCurrency.Focus()
        End If

    End Sub

    Protected Sub btnConfirmSave_Click(sender As Object, e As EventArgs) Handles btnConfirmSave.Click

        Saving()

    End Sub

    'Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
    '    'Enable Reprint receipt button only when 
    '    'there is a receipt loaded from the database
    '    If (String.IsNullOrWhiteSpace(txtReceiptID.Text)) Then
    '        'btnRePrint.Enabled = False
    '    Else
    '        btnRePrint.Enabled = True
    '    End If


    '    'Enable New Donor button only when 
    '    'there is not donor loaded from the database
    '    If (String.IsNullOrWhiteSpace(txtDonorID.Text)) Then
    '        btnEnableDonorProfile.Enabled = True
    '    Else
    '        btnEnableDonorProfile.Enabled = False

    '    End If

    '    'Disable the search when Form has QueryString
    '    If (Not String.IsNullOrWhiteSpace(Request.QueryString("DonorId")) Or Not String.IsNullOrWhiteSpace(Request.QueryString("ReceiptId"))) Then
    '        ' txtSearch.Enabled = False
    '        'btnSearch.Enabled = False
    '    Else
    '        'txtSearch.Enabled = True
    '        btnSearch.Enabled = True
    '    End If

    'End Sub

    Protected Sub DonationDistSqlDataSource_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles DonationDistSqlDataSource.Updating
        Try
            Dim donation As DropDownList = grvDonationDist.Rows(grvDonationDist.EditIndex).FindControl("ddlDonation")
            Dim donationValue As TextBox = grvDonationDist.Rows(grvDonationDist.EditIndex).FindControl("txtDonationValue")
            Dim donationNotes As TextBox = grvDonationDist.Rows(grvDonationDist.EditIndex).FindControl("txtDonationNotes")


            DonationDistSqlDataSource.UpdateParameters.Item("donation_value").DefaultValue = donationValue.Text
            DonationDistSqlDataSource.UpdateParameters.Item("distribution_remrks").DefaultValue = donationNotes.Text
            DonationDistSqlDataSource.UpdateParameters.Item("donation_code").DefaultValue = donation.SelectedValue

        Catch ex As Exception

        End Try


    End Sub

    Protected Sub grvDonationDist_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grvDonationDist.RowDataBound

        Try
            'Prevent user from modifying the Receipt after insert
            'Or when user open an already saved Receipt
            If (Not String.IsNullOrWhiteSpace(txtReceiptID.Text)) Then
                'Hide Footer Row and all the Command Buttons
                grvDonationDist.ShowFooter = False
                e.Row.Cells(0).Visible = False
            Else
                'Show Footer Row and all the Command Buttons
                grvDonationDist.ShowFooter = True
                e.Row.Cells(0).Visible = True
            End If

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub btnReset_Click(sender As Object, e As EventArgs) Handles btnReset.Click

        ClearForm()
        btnOpen.Enabled = False
        btnCreate.Enabled = True
        ViewState("myPaymentDistDataTable") = Nothing
        ViewState("myDonationDistDataTable") = Nothing
        Session("donationRowIndex") = Nothing
        Session("donationRowType") = Nothing
        'btnCloseModal.Visible = False
        InitializeDonationDistDataTable()
        InitializePaymentDistDataTable()
        'Response.Redirect(Request.Url.AbsolutePath)
        'grvPayments.DataBind()
        'grvDonationDist.DataBind()


        myDonationDistDataTable = ViewState("myDonationDistDataTable")
        myPaymentDistDataTable = ViewState("myPaymentDistDataTable")
        myDonationDistDataTable.Clear()
        myPaymentDistDataTable.Clear()
        'myInstructDistDataTable = Nothing
        ViewState("myDonationDistDataTable") = myDonationDistDataTable
        ViewState("myPaymentDistDataTable") = myPaymentDistDataTable
        'Response.RedirectToRoute("Collection.aspx")
        'btnReset.PostBackUrl = "~/Collection.aspx"

        'If Request.QueryString.Count > 0 Then
        Response.Redirect("~/Collection.aspx")
        'End If

    End Sub

    Protected Sub PaymentsSqlDataSource_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles PaymentsSqlDataSource.Updating
        Try
            Dim txtPaymentAmountEdit As TextBox = grvPayments.Rows(grvPayments.EditIndex).FindControl("txtPaymentAmountEdit")
            Dim txtAccountNumberEdit As TextBox = grvPayments.Rows(grvPayments.EditIndex).FindControl("txtAccountNumberEdit")
            Dim txtAuthorizationNumberEdit As TextBox = grvPayments.Rows(grvPayments.EditIndex).FindControl("txtAuthorizationNumberEdit")
            Dim ddlBankEdit As DropDownList = grvPayments.Rows(grvPayments.EditIndex).FindControl("ddlBankEdit")
            Dim txtRecieptSerialEdit As TextBox = grvPayments.Rows(grvDonationDist.EditIndex).FindControl("txtRecieptSerialEdit")

            PaymentsSqlDataSource.InsertParameters.Item("pay_amnt").DefaultValue = txtPaymentAmountEdit.Text
            PaymentsSqlDataSource.InsertParameters.Item("acc_num").DefaultValue = txtAccountNumberEdit.Text
            PaymentsSqlDataSource.InsertParameters.Item("authorization_code").DefaultValue = txtAuthorizationNumberEdit.Text
            PaymentsSqlDataSource.InsertParameters.Item("bank_code").DefaultValue = ddlBankEdit.SelectedValue
            PaymentsSqlDataSource.InsertParameters.Item("reciept_ser_det").DefaultValue = grvPayments.SelectedValue

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnCreate_Click(sender As Object, e As EventArgs) Handles btnCreate.Click

        'SaveDonor()

    End Sub

    Protected Sub btnOpen_Click(sender As Object, e As EventArgs) Handles btnOpen.Click
        'Response.Redirect("~/AddDonor.aspx?DonorID=" & _donor.donor_id, False)
    End Sub

    Protected Sub grvPayments_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles grvPayments.RowDataBound
        Try
            'Dim lblBankCodeEdit As Label
            'Dim ddlBankEdit As DropDownList

            'If (e.Row.RowState And DataControlRowState.Edit) > 0 Then

            '    lblBankCodeEdit = e.Row.FindControl("hfBankCode")

            '    ddlBankEdit.SelectedValue = lblBankCodeEdit.Text

            'End If

            'Prevent user from modifying the Receipt after insert
            'Or when user open an already saved Receipt
            If (Not String.IsNullOrWhiteSpace(txtReceiptID.Text)) Then
                'Hide Footer Row and all the Command Buttons
                grvPayments.ShowFooter = False
                e.Row.Cells(0).Visible = False
            Else
                'Show Footer Row and all the Command Buttons
                grvPayments.ShowFooter = True
                e.Row.Cells(0).Visible = True
            End If
        Catch ex As Exception

        End Try
    End Sub

    'Protected Sub DonationsForInsertSqlDataSource_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles DonationsForInsertSqlDataSource.Selecting
    '    If (ddlNewDonationPurposeType.Items.Count > 0) Then
    '        Dim emptyListItem As New ListItem

    '        emptyListItem.Text = GetLocalResourceObject("ListItemResource13.Text")
    '        emptyListItem.Value = 0

    '        ddlNewDonationPurposeType.Items.Clear()

    '        ddlNewDonationPurposeType.Items.Add(emptyListItem)

    '    End If
    'End Sub

    Protected Sub grvDonationDist_RowDeleting(sender As Object, e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grvDonationDist.RowDeleting
        Try
            myDonationDistDataTable = ViewState("myDonationDistDataTable")
            myDonationDistDataTable.Rows(e.RowIndex).Delete()

            grvDonationDist.DataSource = myDonationDistDataTable
            grvDonationDist.DataBind()

            ViewState("myDonationDistDataTable") = myDonationDistDataTable


        Catch ex As Exception

        End Try
    End Sub

    Protected Sub grvPayments_RowDeleting(sender As Object, e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles grvPayments.RowDeleting
        Try
            myPaymentDistDataTable = ViewState("myPaymentDistDataTable")
            myPaymentDistDataTable.Rows(e.RowIndex).Delete()

            grvPayments.DataSource = myPaymentDistDataTable
            grvPayments.DataBind()

            ViewState("myPaymentDistDataTable") = myPaymentDistDataTable

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub grvDonationDist_RowEditing(sender As Object, e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles grvDonationDist.RowEditing
        Try

            myDonationDistDataTable = ViewState("myDonationDistDataTable")

            grvDonationDist.EditIndex = e.NewEditIndex
            grvDonationDist.DataSource = myDonationDistDataTable
            grvDonationDist.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub grvDonationDist_RowCancelingEdit(sender As Object, e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles grvDonationDist.RowCancelingEdit
        Try

            myDonationDistDataTable = ViewState("myDonationDistDataTable")

            grvDonationDist.EditIndex = -1
            grvDonationDist.DataSource = myDonationDistDataTable
            grvDonationDist.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub grvDonationDist_RowUpdating(sender As Object, e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grvDonationDist.RowUpdating
        Try
            myDonationDistDataTable = ViewState("myDonationDistDataTable")

            Dim donation_code As ASPxComboBox = grvDonationDist.Rows(e.RowIndex).FindControl("donation_code_update")
            Dim txtDonationNotes As TextBox = grvDonationDist.Rows(e.RowIndex).FindControl("txtDonationNotes")
            Dim txtDonationValue As TextBox = grvDonationDist.Rows(e.RowIndex).FindControl("txtDonationValue")
            Dim ddlCountry As DropDownList = grvDonationDist.Rows(e.RowIndex).FindControl("ddlCountryEdit")
            Dim chkPartial As CheckBox = grvDonationDist.Rows(e.RowIndex).FindControl("chkPartial")
            Dim lblStandInstructEdit As TextBox = grvDonationDist.Rows(e.RowIndex).FindControl("lblStandInstructEdit")
            Dim txtQtyEdit As TextBox = grvDonationDist.Rows(e.RowIndex).FindControl("txtQtyEdit")
            Dim txtLineAmountEdit As TextBox = grvDonationDist.Rows(e.RowIndex).FindControl("txtLineAmountEdit")

            '==========================================================================================================================
            'WAS FOR TEST AND KEPT FOR FUTURE USAGE BUT NOT USED RIGHT NOW
            '--------------------------------------------------------------------------------------------------------------------------
            CalculateLineAmount(txtDonationValue, txtQtyEdit, txtLineAmountEdit)
            '==========================================================================================================================

            Dim donationValue As Decimal = Convert.ToDecimal(txtDonationValue.Text)
            'new added lateef
            Dim lineamtValue As Decimal = Convert.ToDecimal(txtLineAmountEdit.Text)
            FillEmptyTextBoxWithValue(txtQtyEdit)

            'Validation: Donation Value must be > 0
            'If (donationValue <= 0) Then
            If (lineamtValue <= 0) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("قيمة التبرع يجب ان تكون أكبر من الصفر")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Donation Value must be greater than Zero")

                End If

                Exit Sub

            End If

            'Validation: Number of Bank Instruction must exist in system
            If (Not IsBankInstructionExsit(lblStandInstructEdit.Text)) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("رقم الأستقطاع البنكي غير موجود")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Bank Instruction number is not exist")

                End If

                Exit Sub
            End If

            'Validation: Number of Bank Instruction must exist in system
            If (Convert.ToDecimal(txtQtyEdit.Text) = 0) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("لا يمكن إدخال عدد تبرعات 0")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("You cannot input quantity 0")

                End If

                Exit Sub
            End If

            myDonationDistDataTable.Rows(e.RowIndex).Item("donation_code") = donation_code.Value
            myDonationDistDataTable.Rows(e.RowIndex).Item("donation_name") = donation_code.Text
            myDonationDistDataTable.Rows(e.RowIndex).Item("donation_value") = donationValue 'Convert.ToDecimal(txtDonationValue.Text)
            myDonationDistDataTable.Rows(e.RowIndex).Item("country_code") = ddlCountry.SelectedValue
            myDonationDistDataTable.Rows(e.RowIndex).Item("country_name") = ddlCountry.SelectedItem.Text
            myDonationDistDataTable.Rows(e.RowIndex).Item("distribution_remrks") = txtDonationNotes.Text
            myDonationDistDataTable.Rows(e.RowIndex).Item("partial") = chkPartial.Checked
            myDonationDistDataTable.Rows(e.RowIndex).Item("standing_inst_num") = If(String.IsNullOrWhiteSpace(lblStandInstructEdit.Text), 0, lblStandInstructEdit.Text)
            myDonationDistDataTable.Rows(e.RowIndex).Item("Qty") = If(String.IsNullOrWhiteSpace(txtQtyEdit.Text), 1, Convert.ToDecimal(txtQtyEdit.Text))
            myDonationDistDataTable.Rows(e.RowIndex).Item("line_amount") = If(String.IsNullOrWhiteSpace(txtLineAmountEdit.Text), 0, Convert.ToDecimal(txtLineAmountEdit.Text))

            grvDonationDist.EditIndex = -1
            grvDonationDist.DataSource = myDonationDistDataTable
            grvDonationDist.DataBind()

            ViewState("myDonationDistDataTable") = myDonationDistDataTable


        Catch ex As Exception

        End Try
    End Sub

    Protected Sub grvPayments_RowUpdating(sender As Object, e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles grvPayments.RowUpdating

        Try
            Dim txtAuthorizationNumberEdit As TextBox = grvPayments.Rows(e.RowIndex).FindControl("txtAuthorizationNumberEdit")
            Dim ddlBankEdit As DropDownList = grvPayments.Rows(e.RowIndex).FindControl("ddlBankEdit")
            Dim txtAccountNumberEdit As TextBox = grvPayments.Rows(e.RowIndex).FindControl("txtAccountNumberEdit")
            Dim txtPaymentAmountEdit As TextBox = grvPayments.Rows(e.RowIndex).FindControl("txtPaymentAmountEdit")
            Dim lblPaymentMethodEdit As Label = grvPayments.Rows(e.RowIndex).FindControl("lblPaymentMethodEdit")
            'Dim hfPaymentMethodEdit As HiddenField = grvPayments.Rows(e.RowIndex).FindControl("hfPaymentMethodEdit")
            Dim paymentValue As Decimal = Convert.ToDecimal(txtPaymentAmountEdit.Text)

            'Validation: Donation Value must be > 0
            If (paymentValue <= 0) Then

                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("قيمة الدفع يجب ان تكون أكبر من الصفر")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Payment Value must be greater than Zero")

                End If

                Exit Sub

            End If

            'Validation: KNET payment must have Bank
            If (ddlBankEdit.SelectedValue <= 0 And lblPaymentMethodEdit.Text.Contains("KNET")) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    ShowAlert("الرجاء تحديد البنك")

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    ShowAlert("Please select Bank")

                End If

                Exit Sub
            End If

            'If (ddlBankEdit.SelectedValue = 1 And lblPaymentMethodEdit.Text.Contains("CASH")) Then
            '    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

            '        ShowAlert("الرجاء إدخال رقم الايداع النقدي")

            '    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

            '        ShowAlert("Please insert deposit number")

            '    End If

            '    Exit Sub
            'End If

            myPaymentDistDataTable = ViewState("myPaymentDistDataTable")

            myPaymentDistDataTable.Rows(e.RowIndex).Item("pay_amnt") = paymentValue 'Convert.ToDecimal(txtPaymentAmountEdit.Text)
            myPaymentDistDataTable.Rows(e.RowIndex).Item("acc_num") = txtAccountNumberEdit.Text
            myPaymentDistDataTable.Rows(e.RowIndex).Item("authorization_code") = txtAuthorizationNumberEdit.Text
            myPaymentDistDataTable.Rows(e.RowIndex).Item("bank_code") = ddlBankEdit.SelectedValue
            myPaymentDistDataTable.Rows(e.RowIndex).Item("bank_name") = ddlBankEdit.SelectedItem.Text

            grvPayments.EditIndex = -1
            grvPayments.DataSource = myPaymentDistDataTable
            grvPayments.DataBind()

            ViewState("myPaymentDistDataTable") = myPaymentDistDataTable
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub grvPayments_RowEditing(sender As Object, e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles grvPayments.RowEditing
        Try

            myPaymentDistDataTable = ViewState("myPaymentDistDataTable")

            grvPayments.EditIndex = e.NewEditIndex
            grvPayments.DataSource = myPaymentDistDataTable
            grvPayments.DataBind()

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub grvPayments_RowCancelingEdit(sender As Object, e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles grvPayments.RowCancelingEdit

        Try
            myPaymentDistDataTable = ViewState("myPaymentDistDataTable")

            grvPayments.EditIndex = -1
            grvPayments.DataSource = myPaymentDistDataTable
            grvPayments.DataBind()
        Catch ex As Exception

        End Try

    End Sub

    Protected Sub grvPartialInstructions_SelectedIndexChanged(sender As Object, e As EventArgs) Handles grvPartialInstructions.SelectedIndexChanged

        Try
            Dim instructRefNum As Label
            Dim selectRow As GridViewRow = grvPartialInstructions.SelectedRow

            instructRefNum = CType(selectRow.FindControl("lblRefNumber"), Label)
            Dim lblStandInstruct As TextBox
            If (Session("donationRowType") = DataControlRowType.DataRow) Then
                lblStandInstruct = grvDonationDist.Rows(Session("donationRowIndex")).FindControl("lblStandInstructEdit")
            ElseIf (Session("donationRowType") = DataControlRowType.Footer) Then
                lblStandInstruct = grvDonationDist.FooterRow.FindControl("lblStandInstructFooter")
            ElseIf (Session("donationRowType") = DataControlRowType.EmptyDataRow) Then
                lblStandInstruct = grvDonationDist.Controls(0).Controls(1).FindControl("lblStandInstructNew")
            End If

            lblStandInstruct.Text = instructRefNum.Text

            pnlPartialInstructions_ModalPopupExtender.Hide()

            grvDonationDist.Focus()

        Catch ex As Exception

        End Try

    End Sub

    Protected Sub grvDonationDist_DataBound(sender As Object, e As EventArgs) Handles grvDonationDist.DataBound
        Try
            'To prevent user from change the donation category (Waqf or Not Waqf)
            'After inserting the first Donation Dist.
            myDonationDistDataTable = ViewState("myDonationDistDataTable")
            myPaymentDistDataTable = ViewState("myPaymentDistDataTable")

            If (myDonationDistDataTable.Rows.Count > 0) Then
                'chkWaqf.Enabled = False

                'Prevent user to save the receipt before at least
                'user insert 1 Donation Dist and 1 Payment Dist                

                If (myPaymentDistDataTable.Rows.Count > 0) Then
                    btnPrint.Enabled = True
                Else
                    btnPrint.Enabled = False
                End If
            Else
                ' chkWaqf.Enabled = True
                btnPrint.Enabled = False
            End If

            CalculateTotals()

            ddlCurrency.Enabled = (myDonationDistDataTable.Rows.Count = 0)

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub grvPayments_DataBound(sender As Object, e As EventArgs) Handles grvPayments.DataBound
        Try
            Dim totalDonationDist As Decimal
            Dim totalPayment As Decimal

            'Prevent user to save the receipt before at least
            'user insert 1 Donation Dist and 1 Payment Dist
            myPaymentDistDataTable = ViewState("myPaymentDistDataTable")
            myDonationDistDataTable = ViewState("myDonationDistDataTable")

            If (myPaymentDistDataTable.Rows.Count > 0 And myDonationDistDataTable.Rows.Count > 0) Then
                btnPrint.Enabled = True
            Else
                btnPrint.Enabled = False
            End If

            totalDonationDist = GetDonationDistTotalAmount(myDonationDistDataTable)
            totalPayment = GetPaymentTotalAmount(myPaymentDistDataTable)

            lblDiff.Text = (totalDonationDist - totalPayment).ToString("N3")

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

    Protected Sub btnEnableDonorProfile_Click(sender As Object, e As EventArgs) Handles btnEnableDonorProfile.Click
        Try
            'EnableDonorProfile()
            Response.Redirect("AddDonar.aspx")
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub CheckBox_SearchMode_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox_SearchMode.CheckedChanged

        SearchMode()

    End Sub

    Protected Sub ddlCountryFooter_SelectedIndexChanged(sender As Object, e As EventArgs)
        'Dim PurposeType As DropDownList = grvDonationDist.FooterRow.FindControl("ddlNewDonationPurposeType")
        'Dim country As DropDownList = grvDonationDist.FooterRow.FindControl("ddlCountryFooter")
        'Dim donationValue As TextBox = grvDonationDist.FooterRow.FindControl("txtDonationValueFooter")

        'donationValue.Text = Get_donation_standard_value(PurposeType.SelectedValue, country.SelectedValue)

        Dim PurposeType As ASPxComboBox = grvDonationDist.FooterRow.FindControl("donation_code_edit")
        Dim country As DropDownList = grvDonationDist.FooterRow.FindControl("ddlCountryFooter")
        Dim donationValue As TextBox = grvDonationDist.FooterRow.FindControl("txtDonationValueFooter")
        Dim quantity As TextBox = grvDonationDist.FooterRow.FindControl("txtQtyFooter")

        donationValue.Text = Get_donation_standard_value(PurposeType.Value, country.SelectedValue)

        quantity.Focus()

    End Sub

    Protected Sub ddlCountryNew_SelectedIndexChanged(sender As Object, e As EventArgs)
        'Dim PurposeType As DropDownList = grvDonationDist.Controls(0).Controls(1).FindControl("ddlNewDonationPurposeType")
        'Dim country As DropDownList = grvDonationDist.Controls(0).Controls(1).FindControl("ddlCountryFooter")
        'Dim donationValue As TextBox = grvDonationDist.Controls(0).Controls(1).FindControl("txtDonationValueNew")

        'donationValue.Text = Get_donation_standard_value(PurposeType.SelectedValue, country.SelectedValue)

        Dim PurposeType As ASPxComboBox = grvDonationDist.Controls(0).Controls(1).FindControl("donation_code_New")
        Dim country As DropDownList = grvDonationDist.Controls(0).Controls(1).FindControl("ddlCountryNew")
        Dim donationValue As TextBox = grvDonationDist.Controls(0).Controls(1).FindControl("txtDonationValueNew")
        Dim quantity As TextBox = grvDonationDist.Controls(0).Controls(1).FindControl("txtQtyNew")

        '---------------------------------------------'
        'Ayman
        Dim BlockDecimalPoint As HiddenField = grvDonationDist.Controls(0).Controls(1).FindControl("BlockDecimalPointNew")
        BlockDecimalPoint.Value = Get_donation_BlockDecimalPoint(PurposeType.Value)
        '---------------------------------------------'


        donationValue.Text = Get_donation_standard_value(PurposeType.Value, country.SelectedValue)

        quantity.Focus()

    End Sub

    Protected Sub ddlNewDonationPurposeType_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim PurposeType As DropDownList = grvDonationDist.FooterRow.FindControl("ddlNewDonationPurposeType")
        Dim country As DropDownList = grvDonationDist.FooterRow.FindControl("ddlCountryFooter")
        Dim donationValue As TextBox = grvDonationDist.FooterRow.FindControl("txtDonationValueFooter")

        donationValue.Text = Get_donation_standard_value(PurposeType.SelectedValue, country.SelectedValue)

    End Sub

    Protected Sub ddlNewDonationPurposeType_SelectedIndexChangedEmpty(sender As Object, e As EventArgs)

        Dim PurposeType As DropDownList = grvDonationDist.Controls(0).Controls(1).FindControl("ddlNewDonationPurposeType")
        Dim country As DropDownList = grvDonationDist.Controls(0).Controls(1).FindControl("ddlCountryFooter")
        Dim donationValue As TextBox = grvDonationDist.Controls(0).Controls(1).FindControl("txtDonationValueNew")

        '---------------------------------------------'
        'Ayman
        Dim BlockDecimalPoint As HiddenField = grvDonationDist.Controls(0).Controls(1).FindControl("BlockDecimalPointNew")
        BlockDecimalPoint.Value = Get_donation_BlockDecimalPoint(PurposeType.SelectedValue)
        '---------------------------------------------'


        donationValue.Text = Get_donation_standard_value(PurposeType.SelectedValue, country.SelectedValue)

    End Sub

    Protected Sub donation_code_New_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim PurposeType As ASPxComboBox = grvDonationDist.Controls(0).Controls(1).FindControl("donation_code_New")
        Dim country As DropDownList = grvDonationDist.Controls(0).Controls(1).FindControl("ddlCountryNew")
        Dim donationValue As TextBox = grvDonationDist.Controls(0).Controls(1).FindControl("txtDonationValueNew")

        '---------------------------------------------'
        'Ayman
        Dim BlockDecimalPoint As HiddenField = grvDonationDist.Controls(0).Controls(1).FindControl("BlockDecimalPointNew")
        BlockDecimalPoint.Value = Get_donation_BlockDecimalPoint(PurposeType.Value)
        '---------------------------------------------'

        donationValue.Text = Get_donation_standard_value(PurposeType.Value, country.SelectedValue)


        country.Focus()

    End Sub

    Protected Sub donation_code_edit_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim PurposeType As ASPxComboBox = grvDonationDist.FooterRow.FindControl("donation_code_edit")
        Dim country As DropDownList = grvDonationDist.FooterRow.FindControl("ddlCountryFooter")
        Dim donationValue As TextBox = grvDonationDist.FooterRow.FindControl("txtDonationValueFooter")

        '---------------------------------------------'
        'Ayman
        Dim BlockDecimalPointFooter As HiddenField = grvDonationDist.FooterRow.FindControl("BlockDecimalPointFooter")
        BlockDecimalPointFooter.Value = Get_donation_BlockDecimalPoint(PurposeType.Value).ToString
        '---------------------------------------------'


        donationValue.Text = Get_donation_standard_value(PurposeType.Value, country.SelectedValue)

        country.Focus()

    End Sub

    Protected Sub donation_code_update_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim PurposeType As ASPxComboBox = grvDonationDist.Rows(grvDonationDist.EditIndex).FindControl("donation_code_update")
        Dim country As DropDownList = grvDonationDist.Rows(grvDonationDist.EditIndex).FindControl("ddlCountryEdit")
        Dim donationValue As TextBox = grvDonationDist.Rows(grvDonationDist.EditIndex).FindControl("txtDonationValue")

        '---------------------------------------------'
        'Ayman
        Dim BlockDecimalPoint As HiddenField = grvDonationDist.Controls(0).Controls(1).FindControl("BlockDecimalPoint")
        BlockDecimalPoint.Value = Get_donation_BlockDecimalPoint(PurposeType.Value)
        '---------------------------------------------'

        donationValue.Text = Get_donation_standard_value(PurposeType.Value, country.SelectedValue)

        country.Focus()

    End Sub

    Protected Sub ddlCountryEdit_SelectedIndexChanged(sender As Object, e As EventArgs)

        Dim PurposeType As ASPxComboBox = grvDonationDist.Rows(grvDonationDist.EditIndex).FindControl("donation_code_update")
        Dim country As DropDownList = grvDonationDist.Rows(grvDonationDist.EditIndex).FindControl("ddlCountryEdit")
        Dim donationValue As TextBox = grvDonationDist.Rows(grvDonationDist.EditIndex).FindControl("txtDonationValue")
        Dim quantity As TextBox = grvDonationDist.Rows(grvDonationDist.EditIndex).FindControl("txtQtyEdit")

        donationValue.Text = Get_donation_standard_value(PurposeType.Value, country.SelectedValue)

        quantity.Focus()

    End Sub

    Protected Sub grvDonationDist_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grvDonationDist.RowCommand

        Dim argument As Object
        argument = e.CommandArgument

        Select Case e.CommandName

            Case "Edit"

            Case "Delete"

            Case "Update"

            Case "Cancel"

        End Select

    End Sub

    Protected Sub ddlWaqfColDonation_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlWaqfColDonation.SelectedIndexChanged
        ddlWaqfColDonation.Focus()
    End Sub

#End Region

End Class