
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView

#End Region

Public Class UCProjectInstallmentTableV1
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SqlDataSource1.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

#End Region

End Class