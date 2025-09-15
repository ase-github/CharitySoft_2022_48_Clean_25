
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView

#End Region

Public Class UCProjectResponsible
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ASPxGridView1_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        Dim dv As DataView = SqlDataSource_GetNextID.Select(DataSourceSelectArguments.Empty)

        If Not dv Is Nothing Then

            If dv.Table.Rows.Count > 0 Then

                e.NewValues("responsible_id") = dv.Table.Rows(0)("id")

            End If

        End If

    End Sub

#End Region

End Class