
Imports System.Threading
Imports System.Globalization

Public Class Collection
    Inherits BaseWebForm

    Protected Overrides Sub InitializeCulture()
        If (Not IsNothing(Session("Culture"))) Then
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Session("Culture"))
            Thread.CurrentThread.CurrentUICulture = CultureInfo.CreateSpecificCulture(Session("Culture"))
        End If

        'base.InitializeCulture()
    End Sub

    Private Sub Collectionaspx_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        'Define an HtmlLink control.
        'Dim HtmlLink As New HtmlLink

        'If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '    HtmlLink.Href = "~/Content/bootstrap-ar.css"
        '    HtmlLink.Attributes.Add("rel", "stylesheet")
        '    HtmlLink.Attributes.Add("type", "text/css")

        'ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '    HtmlLink.Href = "~/Content/bootstrap.css"
        '    HtmlLink.Attributes.Add("rel", "stylesheet")
        '    HtmlLink.Attributes.Add("type", "text/css")

        'End If


        'Add the HtmlLink to the Head section of the page.
        'Me.header.Controls.Add(HtmlLink)
    End Sub

End Class