Public Class QuranKnownMasterFree
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        UCQuranKnown1.app_ser = Request.QueryString(QueryStringKey.OrphanID)

    End Sub

End Class