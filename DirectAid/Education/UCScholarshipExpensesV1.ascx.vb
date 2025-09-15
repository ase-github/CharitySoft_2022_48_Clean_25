Imports System.Globalization
Imports System.Data.SqlClient

Public Class UCScholarshipExpensesV1
    Inherits System.Web.UI.UserControl

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

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim builder As New SqlConnectionStringBuilder(ConfigurationManager.ConnectionStrings("charitysoft").ConnectionString)
            Session("username") = builder.UserID
            Session("password") = builder.Password
            sid = Val(Request.QueryString("sid"))
            Dim sql_str As String = "SELECT * from students_scholarship where scholarship_ser = " & sid

            Dim ds As DataSet
            ds = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
            If ds.Tables(0).Rows.Count > 0 Then
                amount = Val(ds.Tables(0).Rows(0).Item("scholarship_amount"))
                status = Val(ds.Tables(0).Rows(0).Item("application_status"))
            End If
        End If
    End Sub

    Protected Sub ASPxGridView2_InitNewRow(sender As Object, e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs) Handles ASPxGridView2.InitNewRow
        If status <> 1 Then
            ASPxGridView2.CancelEdit()
            'e.Cancel = True
            Throw New Exception("لا يمكن ادخال مصروفات ، حالة الاستمارة لا تسمح ")
        End If
    End Sub

    Protected Sub ASPxGridView2_RowDeleted(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletedEventArgs) Handles ASPxGridView2.RowDeleted

    End Sub

    Protected Sub ASPxGridView2_RowDeleting(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletingEventArgs) Handles ASPxGridView2.RowDeleting
        If status <> 1 Then
            ASPxGridView2.CancelEdit()
            'e.Cancel = True
            Throw New Exception("لا يمكن ادخال مصروفات ، حالة الاستمارة لا تسمح ")
        End If
    End Sub

    Protected Sub ASPxGridView2_RowInserted(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertedEventArgs) Handles ASPxGridView2.RowInserted

    End Sub

    Protected Sub ASPxGridView2_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView2.RowInserting
        Dim trans_amount As Decimal
        If status = 1 Then
            trans_amount = e.NewValues("fee_amount")

            Dim txt_fees_total_payments As Decimal = Val(ASPxGridView2.GetTotalSummaryValue(ASPxGridView2.TotalSummary("fee_amount")))

            If Val(trans_amount) + txt_fees_total_payments > amount Then
                ASPxGridView2.CancelEdit()
                e.Cancel = True

                Throw New Exception("قيمة المصروفات تعدت قيمة المنحة ")
            End If
        Else
            ASPxGridView2.CancelEdit()
            e.Cancel = True
            Throw New Exception("لا يمكن ادخال مصروفات ، حالة الاستمارة لا تسمح ")
        End If
    End Sub

    Protected Sub ASPxGridView2_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ASPxGridView2.RowUpdating

    End Sub

    Protected Sub ASPxGridView2_CustomErrorText(sender As Object, e As DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs) Handles ASPxGridView2.CustomErrorText
        If e.Exception IsNot Nothing And e.ErrorText.ToLower().Contains("Violation of PRIMARY KEY".ToLower()) Then
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                e.ErrorText = "لقد قمت بادخال هذه الحقول مسبقا. برجاء ادخال قيم جديدة"
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                e.ErrorText = "These fields are already inserted. Please insert new values."
            End If
            e.ErrorText = "لقد قمت بادخال هذه الحقول مسبقا. برجاء ادخال قيم جديدة"
        End If
    End Sub

End Class