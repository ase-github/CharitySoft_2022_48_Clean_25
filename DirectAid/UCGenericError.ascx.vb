
Public Class UCGenericError
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

#If DEBUG Then

        Dim ex As Exception = Server.GetLastError()

        If Not ex Is Nothing Then

            ASPxLabel_Message_Technical.Text = ex.Message
            Server.ClearError()

        End If

#End If

    End Sub

End Class