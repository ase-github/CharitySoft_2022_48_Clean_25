
Public Class UCBeneficiaryYearlyDataV1
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SqlDataSource1.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting
        e.NewValues("app_ser") = Request.QueryString(QueryStringKey.OrphanID)
    End Sub

End Class