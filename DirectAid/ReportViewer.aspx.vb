

Public Class ReportViewer
    Inherits BaseWebForm

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ASPxButton_Back.Visible = (Request.QueryString("popup") Is Nothing)

    End Sub
    Protected Sub ASPxButton_Back_Click(sender As Object, e As EventArgs) Handles ASPxButton_Back.Click

        Response.Redirect(Session(SessionKey.REPORT_BACK_PATH))

    End Sub

End Class