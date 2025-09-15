
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView
Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxUploadControl
Imports System.Web.UI
Imports System.IO
Imports System.Drawing
Imports DevExpress.Web

#End Region

Public Class UCProjectPhaseNeed
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ASPxGridView1_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs) Handles ASPxGridView1.BeforePerformDataSelect
        Session(SessionKey.PROJECTPHASE_ID) = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub ASPxGridView1_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        Dim dv As DataView = SqlDataSource_GetNextID.Select(DataSourceSelectArguments.Empty)

        If Not dv Is Nothing Then

            If dv.Table.Rows.Count > 0 Then

                e.NewValues("need_id") = dv.Table.Rows(0)("id")

            End If

        End If

    End Sub

#End Region

End Class