
#Region "Imports Directives"

Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxUploadControl
Imports System.Web.UI
Imports System.IO
Imports System.Drawing
Imports System.Data.OleDb
Imports System.Data
Imports System.Data.SqlClient
Imports System.Linq
Imports System.Linq.Expressions
Imports System.Web.Configuration
Imports System.Configuration
Imports DevExpress.Web

#End Region

Public Class UCBankDiskV3
    Inherits System.Web.UI.UserControl

    Dim constr As String = ConfigurationManager.ConnectionStrings("charitysoftConnectionString").ConnectionString
    Dim con As New SqlConnection(constr)
    Dim cmd As New SqlCommand
    Dim ds As New DataSet


#Region "Methods"

    Private Function Execute(ds As DataSet) As String

        Dim re As String = "NO"
        Dim reason As String = ""
        Dim allAreOK As Boolean = True
        Dim ReceiptNumber As Int32 = 0
        Dim PayMethodDist_Serial As Int32 = 0
        Dim reciept_num_manual_value As String = ASPxTextBox_Receipt.Value

        Using db As New Database

            Dim count As Integer = (From o In db.donation_tran Where o.reciept_num_manual = reciept_num_manual_value Select o.reciept_num_manual).Count()

            If count > 0 Then

                re = "هذا الايصال موجود من قبل"

                Return re

            Else

                db.ExecuteStoreCommand("TRUNCATE TABLE BankDiskTemp")

            End If

        End Using

        Try

            Dim cmd As New OleDbCommand()

            Dim oleda As New OleDbDataAdapter()
            Dim dt As New DataTable()

            If Not ds Is Nothing Then

                If ds.Tables.Count > 0 Then

                    dt = ds.Tables(0)

                    Dim rowCount As Int32 = 0

                    If Not dt Is Nothing Then

                        rowCount = dt.Rows.Count

                        If rowCount > 0 Then

                            Using dbError As New Database()

                                Using dbSuccess As New Database

                                    ReceiptNumber = (From o In dbSuccess.donation_tran Select o.reciept_num).DefaultIfEmpty(0).Max()

                                    PayMethodDist_Serial = (From o In dbSuccess.pay_method_dist Select o.reciept_ser_det).DefaultIfEmpty(0).Max()

                                    For a = 0 To rowCount - 1

                                        Dim instruct_date_object As Object = ds.Tables(0).Rows(a)("instruct_date")
                                        Dim account_num_object As Object = ds.Tables(0).Rows(a)("account_num")
                                        Dim ref_numb_object As Object = ds.Tables(0).Rows(a)("ref_numb")
                                        Dim installment_value_object As Object = ds.Tables(0).Rows(a)("installment_value")

                                        If Not instruct_date_object Is Nothing Then

                                            If Not account_num_object Is Nothing Then

                                                If Not ref_numb_object Is Nothing Then

                                                    If Not installment_value_object Is Nothing Then

                                                        If IsDate(instruct_date_object) Then

                                                            If account_num_object.ToString.Trim() <> String.Empty Then

                                                                If IsNumeric(ref_numb_object) Then

                                                                    If IsNumeric(installment_value_object) Then

                                                                        Dim instruct_date As DateTime? = Convert.ToDateTime(instruct_date_object)
                                                                        Dim account_num As String = Convert.ToString(account_num_object)
                                                                        Dim ref_numb As Int32 = Convert.ToInt32(ref_numb_object)
                                                                        Dim installment_value As Decimal? = Convert.ToDecimal(installment_value_object)

                                                                        If installment_value > 0 Then

                                                                            Dim _standing_instruction As standing_instruction = (From o In dbSuccess.standing_instruction Where Math.Round(o.installment_value.Value, 3) = Math.Round(installment_value.Value, 3) And o.ref_numb = ref_numb Select o).FirstOrDefault

                                                                            If Not _standing_instruction Is Nothing Then

                                                                                If allAreOK Then

                                                                                    ReceiptNumber = ReceiptNumber + 1

                                                                                    PayMethodDist_Serial = PayMethodDist_Serial + 1

                                                                                    '===========================================================================================================
                                                                                    Dim _donation_tran As New donation_tran
                                                                                    _donation_tran.reciept_num = ReceiptNumber
                                                                                    _donation_tran.reciept_num_manual = ASPxTextBox_Receipt.Value
                                                                                    _donation_tran.reciept_date = instruct_date
                                                                                    _donation_tran.donation_cat = 4
                                                                                    _donation_tran.total_amount = installment_value
                                                                                    _donation_tran.donor_id = _standing_instruction.donor_id
                                                                                    _donation_tran.currency_code = 1
                                                                                    _donation_tran.user_id = Session(SessionKey.USERNAME)
                                                                                    _donation_tran.remarks = ""
                                                                                    _donation_tran.campaign_code = _standing_instruction.campaign_code
                                                                                    _donation_tran.col_in_favar_of = _standing_instruction.ded_in_favar_of
                                                                                    _donation_tran.group_id = 1
                                                                                    _donation_tran.branch = 1
                                                                                    _donation_tran.act_date = DateTime.Now
                                                                                    _donation_tran.recpt_src = 2
                                                                                    _donation_tran.void = 0
                                                                                    _donation_tran.ExchangeRate = 1
                                                                                    dbSuccess.donation_tran.AddObject(_donation_tran)
                                                                                    '-----------------------------------------------------------------------------------------------------------
                                                                                    Dim _pay_method_dist As New pay_method_dist
                                                                                    _pay_method_dist.reciept_ser_det = PayMethodDist_Serial
                                                                                    _pay_method_dist.reciept_num = _donation_tran.reciept_num
                                                                                    _pay_method_dist.pay_amnt = installment_value
                                                                                    _pay_method_dist.acc_num = account_num
                                                                                    _pay_method_dist.authorization_code = ref_numb
                                                                                    _pay_method_dist.bank_code = Convert.ToInt16(ASPxComboBox_Bank.Value)
                                                                                    _pay_method_dist.pay_method_id = 4
                                                                                    dbSuccess.pay_method_dist.AddObject(_pay_method_dist)
                                                                                    '-----------------------------------------------------------------------------------------------------------
                                                                                    Dim _instruction_dist_List = (From o In dbSuccess.instruction_dist Where o.ref_numb = ref_numb Select o)
                                                                                    For Each _instruction_dist In _instruction_dist_List

                                                                                        Dim _dont_dist As New dont_dist
                                                                                        _dont_dist.reciept_num = _donation_tran.reciept_num
                                                                                        _dont_dist.donation_code = _instruction_dist.donation_code
                                                                                        _dont_dist.donation_value = _instruction_dist.instruct_value
                                                                                        _dont_dist.country_code = _instruction_dist.nat_code
                                                                                        _dont_dist.distribution_remrks = ""
                                                                                        _dont_dist.standing_inst_num = ref_numb
                                                                                        _dont_dist.qty = _instruction_dist.quantity
                                                                                        _dont_dist.line_amount = (_instruction_dist.instruct_value * _instruction_dist.quantity)
                                                                                        dbSuccess.dont_dist.AddObject(_dont_dist)

                                                                                    Next

                                                                                    '-----------------------------------------------------------------------------------------------------------
                                                                                    _standing_instruction.standing_status = Convert.ToByte(DeductionStatusEnum.Active)
                                                                                    '===========================================================================================================

                                                                                End If

                                                                            Else

                                                                                reason = "رقم الاستقطاع غير صحيح"
                                                                                allAreOK = False
                                                                                AddTo_BankDiskTable(dbError, instruct_date_object, account_num_object, ref_numb_object, installment_value_object, reason)
                                                                                'Exit For

                                                                            End If

                                                                        Else

                                                                            reason = "المبلغ المسدد أقل من أو يساوي الصفر"
                                                                            allAreOK = False
                                                                            AddTo_BankDiskTable(dbError, instruct_date_object, account_num_object, ref_numb_object, installment_value_object, reason)
                                                                            'Exit For

                                                                        End If

                                                                    Else

                                                                        reason = "قم بمراجعه المبلغ المسدد"
                                                                        allAreOK = False
                                                                        AddTo_BankDiskTable(dbError, instruct_date_object, account_num_object, ref_numb_object, installment_value_object, reason)
                                                                        'Exit For

                                                                    End If

                                                                Else

                                                                    reason = "قم بمراجعه رقم الاستقطاع"
                                                                    allAreOK = False
                                                                    AddTo_BankDiskTable(dbError, instruct_date_object, account_num_object, ref_numb_object, installment_value_object, reason)
                                                                    'Exit For

                                                                End If

                                                            Else

                                                                reason = "قم بمراجعه رقم الحساب"
                                                                allAreOK = False
                                                                AddTo_BankDiskTable(dbError, instruct_date_object, account_num_object, ref_numb_object, installment_value_object, reason)
                                                                'Exit For

                                                            End If

                                                        Else

                                                            reason = "قم بمراجعه التاريخ"
                                                            allAreOK = False
                                                            AddTo_BankDiskTable(dbError, instruct_date_object, account_num_object, ref_numb_object, installment_value_object, reason)
                                                            'Exit For

                                                        End If

                                                    Else

                                                        reason = "قم بمراجعه المبلغ المسدد"
                                                        allAreOK = False
                                                        AddTo_BankDiskTable(dbError, instruct_date_object, account_num_object, ref_numb_object, installment_value_object, reason)
                                                        'Exit For

                                                    End If

                                                Else

                                                    reason = "قم بمراجعه رقم الاستقطاع"
                                                    allAreOK = False
                                                    AddTo_BankDiskTable(dbError, instruct_date_object, account_num_object, ref_numb_object, installment_value_object, reason)
                                                    'Exit For

                                                End If

                                            Else

                                                reason = "قم بمراجعه رقم الحساب"
                                                allAreOK = False
                                                AddTo_BankDiskTable(dbError, instruct_date_object, account_num_object, ref_numb_object, installment_value_object, reason)
                                                'Exit For

                                            End If

                                        Else

                                            reason = "قم بمراجعه التاريخ"
                                            allAreOK = False
                                            AddTo_BankDiskTable(dbError, instruct_date_object, account_num_object, ref_numb_object, installment_value_object, reason)
                                            'Exit For

                                        End If

                                    Next

                                    If allAreOK Then

                                        dbSuccess.SaveChanges()
                                        'Delete Table
                                        DropTable(ASPxTextBox_Receipt.Text)
                                        re = "OK"

                                    Else

                                        dbError.SaveChanges()

                                    End If

                                End Using

                            End Using

                        Else

                            re = "Data table has no rows."

                        End If

                    Else

                        re = "Data table is nothing."

                    End If

                Else

                    re = "Data Set has no tables."

                End If

            Else

                re = "Data Set is nothing."

            End If

        Catch ex As Exception

            re = FaultEngine.HandleException(ex).Message

        Finally


        End Try

        Return re

    End Function

    Private Function ReadFromExcel(fileName As String) As String

        Dim re As String = "NO"

        Dim oledbConn As New OleDbConnection

        Try

            Dim sheetName As String = String.Empty

            Dim path As String = System.IO.Path.GetFullPath(Server.MapPath(fileName))

            If System.IO.Path.GetExtension(path).ToLower() = ".xls" Then

                oledbConn = New OleDbConnection(String.Format("Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Extended Properties=""Excel 8.0;HDR=No;IMEX=2""", path))

            ElseIf System.IO.Path.GetExtension(path).ToLower() = ".xlsx" Then

                oledbConn = New OleDbConnection(String.Format("Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties='Excel 12.0;HDR=No;IMEX=1;';", path))

            End If

            oledbConn.Open()
            Dim cmd As New OleDbCommand()

            Dim oleda As New OleDbDataAdapter()
            Dim ds As New DataSet()

            cmd.Connection = oledbConn
            cmd.CommandType = CommandType.Text

            Dim dtSheets As DataTable = oledbConn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing)

            If Not dtSheets Is Nothing Then

                If dtSheets.Rows.Count > 0 Then

                    sheetName = dtSheets.Rows(0)("TABLE_NAME")

                    cmd.CommandText = String.Format("SELECT F1 AS instruct_date, F2 AS account_num, F3 AS ref_numb, F4, F5 AS installment_value FROM [{0}]", sheetName)
                    oleda = New OleDbDataAdapter(cmd)
                    oleda.Fill(ds, sheetName)

                    re = Execute(ds)

                Else

                    re = "No Sheets available."

                End If

            Else

                re = "No Sheets available."

            End If

        Catch ex As Exception

            re = FaultEngine.HandleException(ex).Message

        Finally

            oledbConn.Close()

        End Try

        Return re

    End Function

    Private Function ReadFromView(viewName As String) As String

        Dim re As String = "NO"

        Dim _Connection As New SqlConnection

        Try

            _Connection = New SqlConnection(New ConnectionStringEx().TheConnectionString)

            _Connection.Open()
            Dim _Command As New SqlCommand()

            Dim _DataAdapter As New SqlDataAdapter()
            Dim _DataSet As New DataSet()

            _Command.Connection = _Connection
            _Command.CommandType = CommandType.Text

            _Command.CommandText = String.Format("SELECT DATE AS instruct_date, ACCOUNT_NUMBER AS account_num, REFERENCE_NUMBER AS ref_numb, BLANK, AMOUNT AS installment_value FROM [{0}]", viewName)
            _DataAdapter = New SqlDataAdapter(_Command)
            _DataAdapter.Fill(_DataSet)

            re = Execute(_DataSet)

        Catch ex As Exception

            re = FaultEngine.HandleException(ex).Message

        Finally

            _Connection.Close()

        End Try

        Return re

    End Function

    Private Sub AddTo_BankDiskTable(ByRef db As Database, instruct_date As Object, account_num As Object, ref_numb As Object, installment_value As Object, reason As String)

        Dim _BankDiskTemp As New BankDiskTemp
        _BankDiskTemp.instruct_date = IIf(instruct_date Is Nothing, instruct_date, instruct_date.ToString())
        _BankDiskTemp.account_num = IIf(account_num Is Nothing, account_num, account_num.ToString())
        _BankDiskTemp.ref_numb = IIf(ref_numb Is Nothing, ref_numb, ref_numb.ToString())
        _BankDiskTemp.installment_value = IIf(installment_value Is Nothing, installment_value, installment_value.ToString())
        _BankDiskTemp.reason = IIf(reason Is Nothing, reason, reason.ToString())
        db.BankDiskTemps.AddObject(_BankDiskTemp)

    End Sub

    Public Function ExecutionTimeout() As TimeSpan

        Dim re As TimeSpan

        Dim config As Configuration = WebConfigurationManager.OpenWebConfiguration(Nothing)

        Dim section As New HttpRuntimeSection
        section = config.GetSection("system.web/httpRuntime")

        re = section.ExecutionTimeout

        Return re

    End Function

#End Region

#Region "Events"

    Protected Sub DropTable(ByVal tableName As String)
        Dim query As String = "IF OBJECT_ID('dbo." & tableName & "', 'U') IS NOT NULL "
        query += "BEGIN "
        query += "DROP TABLE dbo." & tableName & " "
        query += "END"

        cmd.CommandText = query
        cmd.Connection = con

        If con.State = ConnectionState.Closed Then con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            ASPxTextBox_Year.Value = DateTime.Now.Year
            ASPxComboBox_Month.Value = DateTime.Now.Month

            EntityDataSource1.ConnectionString = New EntityConnectionEx().TheConnectionString

            'ASPxGridView1.SettingsText.Title = String.Format("Execution Timeout = {0}", ExecutionTimeout())

            ASPxGridView1.Caption = "البيانات الغير صحيحه تظهر هنا ..."

            Using db As New Database

                db.ExecuteStoreCommand("TRUNCATE TABLE BankDiskTemp")

            End Using

        End If

        'ASPxTextBox_Receipt.Value = ASPxComboBox_Bank.Text & ASPxComboBox_Month.Text & Mid(ASPxTextBox_Year.Value, 3)

        ASPxTextBox_Receipt.Value = ASPxComboBox_Bank.Text & ASPxComboBox_Month.Text & ASPxTextBox_Year.Value
    End Sub

    Protected Sub uplImage_FileUploadComplete(ByVal sender As Object, ByVal e As FileUploadCompleteEventArgs)

        Try

            e.CallbackData = Constant.BANK_DISK_FILES & e.UploadedFile.FileName

            e.UploadedFile.SaveAs(MapPath(e.CallbackData))

            e.IsValid = True

        Catch ex As Exception

            e.IsValid = False
            e.CallbackData = ex.Message

        End Try

    End Sub

    Protected Sub ASPxCallback_Upload_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Upload.Callback

        If ASPxCheckBox_AsView.Value Then

            e.Result = ReadFromView(ASPxTextBox_Receipt.Value)

        Else

            e.Result = ReadFromExcel(e.Parameter)

        End If

    End Sub

#End Region

End Class