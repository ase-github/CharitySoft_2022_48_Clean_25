Public Class ApplicationPeriodicalReportsStatus
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        _UCBeneficiarPeriodicalReportsStatus.app_ser = Request.QueryString(QueryStringKey.OrphanID)
        _UCBeneficiarPeriodicalReportsStatus.app_type = Request.QueryString(QueryStringKey.APP_TYPE)

    End Sub

End Class