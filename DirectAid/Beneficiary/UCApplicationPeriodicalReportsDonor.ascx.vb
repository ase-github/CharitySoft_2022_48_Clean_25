
#Region "Imports Directives"

Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxUploadControl
Imports System.Collections.Specialized
Imports DevExpress.Web.ASPxTabControl
Imports DevExpress.Web.ASPxEditors
Imports System.IO
Imports System.Drawing
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
#End Region

' Added By Ayman On 21/06/2016

Public Class UCApplicationPeriodicalReportsDonor
    Inherits System.Web.UI.UserControl

#Region "Properties"

    Public Property app_ser() As Int32
        Get
            Return ViewState("app_ser")
        End Get

        Set(value As Int32)
            ViewState("app_ser") = value
            HiddenField_app_ser.Value = ViewState("app_ser")
        End Set

    End Property

    Public Property app_type() As Int32
        Get
            Return ViewState("app_type")
        End Get

        Set(value As Int32)
            ViewState("app_type") = value
            HiddenField_app_type.Value = ViewState("app_type")
        End Set

    End Property

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

#End Region


End Class