Imports System.Web.UI

Public Class BasePageSessionExpire
    Inherits Page

    Protected Overrides Sub OnInit(ByVal e As EventArgs)
        MyBase.OnInit(e)
        If Context.Session IsNot Nothing Then
            If Context.Session.IsNewSession Then
                Dim szCookieHeader As String = Request.Headers("Cookie")
                If szCookieHeader IsNot Nothing And szCookieHeader.IndexOf("ASP.NET_SessionId") >= 0 Then
                    Response.Redirect("sessionTimeout.htm")
                End If
            End If
        End If
    End Sub 'OnInit


End Class
