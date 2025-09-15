
#Region "Imports Directives"

Imports DevExpress.Web
Imports DevExpress.Web.ASPxGridView

#End Region

Public Class UC_VIEW_WaqfProjectsNamesList
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ASPxGridView1_BeforePerformDataSelect(sender As Object, e As EventArgs) Handles ASPxGridView1.BeforePerformDataSelect
        Session("waqfNo") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

#End Region

End Class