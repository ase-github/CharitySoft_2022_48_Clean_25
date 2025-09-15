
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

' Added By Ayman On 27/06/2016

Public Class UCApplicationPeriodicalReportsDonorLog
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

    Private Sub ASPxGridView1_InitNewRow(sender As Object, e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs) Handles ASPxGridView1.InitNewRow

        e.NewValues("AddedBy") = Session(SessionKey.USERNAME)
        e.NewValues("AddedDate") = Date.Now
    End Sub


    Private Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting
        e.NewValues("ReportID") = Request.QueryString("ReportID")
    End Sub
End Class