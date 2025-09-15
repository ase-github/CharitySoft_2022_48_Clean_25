
#Region "Imports Directives"

Imports System.Globalization
Imports System.Threading

#End Region

Public Class AddDonor
    Inherits BaseWebForm

    Protected Overrides Sub InitializeCulture()
        If (Not IsNothing(Session("Culture"))) Then
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Session("Culture"))
            Thread.CurrentThread.CurrentUICulture = CultureInfo.CreateSpecificCulture(Session("Culture"))
        End If

        'base.InitializeCulture()
    End Sub

End Class