Public Class ApplicationPeriodicalReportsDonor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        _UCApplicationPeriodicalReportsDonor.app_ser = Request.QueryString(QueryStringKey.OrphanID)
        _UCApplicationPeriodicalReportsDonor.app_type = Request.QueryString(QueryStringKey.APP_TYPE)

    End Sub

End Class