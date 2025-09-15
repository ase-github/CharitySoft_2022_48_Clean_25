
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView

#End Region

Public Class UCProjectFamily
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SqlDataSource_project_responsible.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

    Protected Sub ASPxGridView1_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        e.NewValues("project_id") = Request.QueryString(QueryStringKey.PROJECT_ID)

    End Sub

#End Region

End Class