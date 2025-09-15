Imports DevExpress.Data
Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web


Public Class UCScholarshipTransfersV1
    Inherits System.Web.UI.UserControl

    Dim totalSum As Decimal
    Private _ws As New DataAccessLibrary
    Private Property sid() As Integer
        Get
            Return Val(Session("sid"))
        End Get
        Set(value As Integer)
            Session("sid") = value
        End Set
    End Property
    Private Property status() As Integer
        Get
            Return Val(Session("status"))
        End Get
        Set(value As Integer)
            Session("status") = value
        End Set
    End Property
    Private Property amount() As Decimal
        Get
            Return Val(Session("amount"))
        End Get
        Set(value As Decimal)
            Session("amount") = value
        End Set
    End Property
    Private Property Totalamount() As Decimal
        Get
            Return Val(Session("Totalamount"))
        End Get
        Set(value As Decimal)
            Session("Totalamount") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        stud_schlrshp_paymnt_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        pay_method_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        bank_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString

        If Not IsPostBack Then
            'Dim builder As New SqlConnectionStringBuilder(ConfigurationManager.ConnectionStrings("charitysoft").ConnectionString)
            'Session("username") = builder.UserID
            'Session("password") = builder.Password

            sid = Val(Request.QueryString("sid"))
            Dim sql_str As String = "SELECT * from students_scholarship where scholarship_ser = " & sid

            Dim ds As DataSet
            ds = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
            If ds.Tables(0).Rows.Count > 0 Then
                If Not IsNothing(ds.Tables(0).Rows(0).Item("scholarship_amount")) And Not IsDBNull(ds.Tables(0).Rows(0).Item("scholarship_amount")) Then
                    amount = Val(ds.Tables(0).Rows(0).Item("scholarship_amount"))
                    Dim startDate As Date = CDate(ds.Tables(0).Rows(0).Item("scholarship_start_date"))
                    Dim endDate As Date = CDate(ds.Tables(0).Rows(0).Item("scholarship_end_date"))
                    Dim coveredPeriod = Math.Truncate((endDate - startDate).TotalDays / 365)
                    Totalamount = amount * coveredPeriod
                Else
                    amount = Nothing
                End If

                If Not IsNothing(ds.Tables(0).Rows(0).Item("application_status")) And Not IsDBNull(ds.Tables(0).Rows(0).Item("application_status")) Then
                    status = Val(ds.Tables(0).Rows(0).Item("application_status"))

                Else
                    status = Nothing
                End If
            End If
        End If
    End Sub

    Protected Sub ASPxGridView3_InitNewRow(sender As Object, e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs) Handles ASPxGridView3.InitNewRow
        If status <> 1 Then
            ASPxGridView3.CancelEdit()
            'e.Cancel = True
            Throw New Exception("لا يمكن ادخال دفعات ، حالة الاستمارة لا تسمح ")
        End If
    End Sub

    Protected Sub ASPxGridView3_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView3.RowInserting
        Dim trans_amount As Decimal
        If Not IsNothing(status) And status = 1 And Not IsNothing(amount) Then
            trans_amount = e.NewValues("transfer_amount")

            Dim txt_fees_total_payments As Decimal = Val(ASPxGridView3.GetTotalSummaryValue(ASPxGridView3.TotalSummary("transfer_amount")))

            If Val(trans_amount) + txt_fees_total_payments > Totalamount Then
                ASPxGridView3.CancelEdit()
                e.Cancel = True

                Throw New Exception("قيمة الدفعات تعدت قيمة المنحة ")
            End If
        Else
            ASPxGridView3.CancelEdit()
            e.Cancel = True
            Throw New Exception("لا يمكن ادخال دفعات ، حالة الاستمارة لا تسمح او لا توجد قيمة للمنحة ")
        End If
    End Sub

    Protected Sub ASPxGridView3_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles ASPxGridView3.StartRowEditing
        If Not IsNothing(status) And status = 1 And Not IsNothing(amount) Then
            Dim x As DevExpress.Web.GridViewDataTextColumn
            x = ASPxGridView3.Columns("transfer_amount")
            x = DirectCast(ASPxGridView3.Columns("transfer_amount"), DevExpress.Web.GridViewDataTextColumn)
            x.ReadOnly = True
        Else
            ASPxGridView3.CancelEdit()
            e.Cancel = True

            Throw New Exception("لا يمكن ادخال دفعات ، حالة الاستمارة لا تسمح او لا توجد قيمة للمنحة ")
        End If
    End Sub

    Protected Sub ASPxGridView3_RowDeleted(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletedEventArgs) Handles ASPxGridView3.RowDeleted

    End Sub

    Protected Sub ASPxGridView3_RowDeleting(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletingEventArgs) Handles ASPxGridView3.RowDeleting
        If Not IsNothing(status) And status <> 1 Then
            ASPxGridView3.CancelEdit()
            'e.Cancel = True
            Throw New Exception("لا يمكن ادخال دفعات ، حالة الاستمارة لا تسمح ")
        End If
    End Sub

    Protected Sub ASPxGridView3_RowInserted(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertedEventArgs) Handles ASPxGridView3.RowInserted

    End Sub

    Protected Sub ASPxGridView3_RowUpdated(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatedEventArgs) Handles ASPxGridView3.RowUpdated

    End Sub

    Protected Sub ASPxGridView3_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ASPxGridView3.RowUpdating
        Dim trans_amount As Decimal
        If Not IsNothing(status) And status = 1 And Not IsNothing(amount) Then
            If e.NewValues("transfer_amount") <> e.OldValues("transfer_amount") Then
                Dim status As Integer = Val(e.NewValues("transfer_status"))
                If status = 2 Then
                    trans_amount = e.NewValues("transfer_amount")

                    Dim txt_fees_total_payments As Decimal = Val(ASPxGridView3.GetTotalSummaryValue(ASPxGridView3.TotalSummary("transfer_amount")))

                    If Val(trans_amount) + txt_fees_total_payments > Totalamount Then
                        ASPxGridView3.CancelEdit()
                        e.Cancel = True

                        Throw New Exception("قيمة الدفعات تعدت قيمة المنحة ")
                    End If
                End If
            End If
        Else
            ASPxGridView3.CancelEdit()
            e.Cancel = True
            Throw New Exception("لا يمكن ادخال دفعات ، حالة الاستمارة لا تسمح او لا توجد قيمة للمنحة ")
        End If

    End Sub

    Protected Sub ASPxGridView3_CustomSummaryCalculate(sender As Object, e As CustomSummaryEventArgs) Handles ASPxGridView3.CustomSummaryCalculate
        ' Initialization.
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            totalSum = 0
        End If
        ' Calculation.
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then
            If Val(e.GetValue("transfer_status")) = 2 Then
                totalSum = totalSum + Convert.ToDecimal(e.FieldValue)
            End If
        End If
        ' Finalization.
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            e.TotalValue = totalSum
        End If
        'e.TotalValue = 100
    End Sub

    Protected Sub ASPxGridView3_SummaryDisplayText(sender As Object, e As DevExpress.Web.ASPxGridViewSummaryDisplayTextEventArgs) Handles ASPxGridView3.SummaryDisplayText

        'e.Text = "10000"

    End Sub


    Protected Sub btn_Send_To_Finance_Command(sender As Object, e As CommandEventArgs)
        If e.CommandName.ToLower().Equals("transferid") Then
            Dim btn As ASPxButton = sender
            Dim id As Integer = Val(e.CommandArgument)
            Dim db As charitysoftEntities = New charitysoftEntities()
            Dim transfer_obj As students_scholarship_payments = db.students_scholarship_payments.Where(Function(o) o.transfer_ser = id).FirstOrDefault()
            If Not transfer_obj Is Nothing Then
                transfer_obj.transfer_status = 2
                db.SaveChanges()
                btn.Enabled = False
                btn.Text = "تم الارسال الي المالية"
                ASPxGridView3.DataBind()
            End If
        End If
    End Sub
End Class