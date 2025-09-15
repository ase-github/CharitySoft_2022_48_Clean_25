Public Class ApplicationPeriodicalReportsDonorLog
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        _UCApplicationPeriodicalReportsDonorLog.app_ser = Request.QueryString(QueryStringKey.OrphanID)
        _UCApplicationPeriodicalReportsDonorLog.app_type = Request.QueryString(QueryStringKey.APP_TYPE)

    End Sub

End Class