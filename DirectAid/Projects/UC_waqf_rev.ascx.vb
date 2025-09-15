
#Region "Imports Directives"

Imports DevExpress.Web
Imports DevExpress.Web.ASPxGridView

#End Region

Public Class UC_waqf_rev
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ASPxGridView1_BeforePerformDataSelect(sender As Object, e As EventArgs) Handles ASPxGridView1.BeforePerformDataSelect
        Session("waqfNo") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub ASPxGridView1_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        Dim dv As DataView = SqlDataSource_GetNextID.Select(DataSourceSelectArguments.Empty)

        If Not dv Is Nothing Then

            If dv.Table.Rows.Count > 0 Then

                e.NewValues("rev_id") = dv.Table.Rows(0)("id")

            End If

        End If

    End Sub

#End Region

End Class