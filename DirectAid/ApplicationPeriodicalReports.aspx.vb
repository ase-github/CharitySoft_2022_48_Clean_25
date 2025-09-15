Public Class ApplicationPeriodicalReports
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        _UCBeneficiarPeriodicalReports1.app_ser = Request.QueryString(QueryStringKey.OrphanID)
        _UCBeneficiarPeriodicalReports1.app_type = Request.QueryString(QueryStringKey.APP_TYPE)

    End Sub

End Class