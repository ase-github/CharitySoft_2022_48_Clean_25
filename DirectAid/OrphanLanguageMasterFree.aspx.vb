Public Class OrphanLanguageMasterFree
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        _UCBeneficiaryLanguage.app_ser = Request.QueryString(QueryStringKey.OrphanID)

    End Sub

End Class