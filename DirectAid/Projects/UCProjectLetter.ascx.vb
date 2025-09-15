
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView

#End Region

Public Class UCProjectLetter
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ASPxGridView1_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        Using db As New Database

            e.NewValues("letter_id") = (From o In db.project_letters Select o.letter_id).DefaultIfEmpty(0).Max() + 1

        End Using

        e.NewValues("project_id") = Request.QueryString(QueryStringKey.PROJECT_ID)

    End Sub

#End Region

End Class