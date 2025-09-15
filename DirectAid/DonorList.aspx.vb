
Imports DevExpress.Data.Filtering

Public Class DonorList
    Inherits BaseWebForm

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LinqServerModeDataSource1_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource1.Selecting

        e.KeyExpression = "donor_id"

        Dim db As New charitysoftEntities

        Select Case ASPxComboBox_ListType.Value

            Case 0

                e.QueryableSource = db.view_donor_list

            Case 1

                e.QueryableSource = db.view_donor_list_unassigned

            Case 2

                e.QueryableSource = db.view_donor_list_not_paying

            Case 3

                e.QueryableSource = db.view_donor_list_anothor_assignment

            Case Else

                e.QueryableSource = db.view_donor_list

        End Select

    End Sub

    Protected Sub ASPxGridView1_ProcessColumnAutoFilter(sender As Object, e As DevExpress.Web.ASPxGridViewAutoFilterEventArgs) Handles ASPxGridView1.ProcessColumnAutoFilter

        If e.Column.FieldName = "donor_namear" Or e.Column.FieldName = "LastNameAr" Then

            If e.Kind = DevExpress.Web.GridViewAutoFilterEventKind.CreateCriteria Then

                e.Criteria = New FunctionOperator(FunctionOperatorType.Contains, New OperandProperty(e.Column.FieldName), New OperandValue(StringEngine.ProcessArabicString(e.Value)))

            Else

                e.Value = StringEngine.ProcessArabicString(e.Value)

            End If

        End If

    End Sub

#End Region

End Class