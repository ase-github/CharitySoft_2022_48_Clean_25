
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxCallbackPanel
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxClasses

#End Region

Public Class UCBeneficiaryHobbyActivityV2
    Inherits System.Web.UI.UserControl


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SqlDataSource1.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        If (Request.QueryString("OrphanID") <> 0) Then

            e.NewValues("app_ser") = Request.QueryString("OrphanID")
            e.NewValues("AddedBy") = Session(SessionKey.USERNAME)
        Else

            Throw New Exception("من فضلك قم بحفظ او استدعاء بيانات اليتيم")

        End If


    End Sub

End Class