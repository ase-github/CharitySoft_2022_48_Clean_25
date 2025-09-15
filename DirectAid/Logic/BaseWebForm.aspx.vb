
#Region "Imports Directives"

Imports System.Globalization
Imports System.Threading

#End Region

Public Class BaseWebForm
    Inherits System.Web.UI.Page

    'Protected Overrides Sub OnInit(ByVal e As EventArgs)
    '    MyBase.OnInit(e)
    '    If Context.Session IsNot Nothing Then
    '        If Context.Session.IsNewSession Then
    '            Dim szCookieHeader As String = Request.Headers("Cookie")
    '            If szCookieHeader IsNot Nothing And szCookieHeader.IndexOf("ASP.NET_SessionId") >= 0 Then
    '                Response.Redirect("sessionTimeout.htm")
    '            End If
    '        End If
    '    End If
    'End Sub 'OnInit

    Protected Overrides Sub InitializeCulture()

        If (Not IsNothing(Session(SessionKey.CULTURE))) Then
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Session(SessionKey.CULTURE))
            Thread.CurrentThread.CurrentUICulture = CultureInfo.CreateSpecificCulture(Session(SessionKey.CULTURE))
            Session(SessionKey.CULTURE_ISO) = System.Threading.Thread.CurrentThread.CurrentUICulture.TwoLetterISOLanguageName
        End If

    End Sub

    Public Shared Sub LockField(ByVal control As TextBox)

        control.Enabled = False
        control.BackColor = Drawing.Color.LightYellow
        control.ForeColor = Drawing.Color.Navy

    End Sub

    Public Shared Sub UnLockField(ByVal control As TextBox)

        control.Enabled = True
        control.BackColor = Drawing.Color.White

    End Sub

End Class