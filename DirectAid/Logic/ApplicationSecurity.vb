
Public Class ApplicationSecurity

    Public Shared Sub OpenWebForm(ByVal canOpen)

        If Not canOpen Then

            HttpContext.Current.Response.Redirect("Default.aspx")

        End If

    End Sub

End Class
