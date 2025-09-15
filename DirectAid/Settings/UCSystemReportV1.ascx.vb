
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
Imports DevExpress.Web

#End Region

Public Class UCSystemReportV1
    Inherits System.Web.UI.UserControl

#Region "Methods"

    Sub Save_Attach(ByVal uploadedFile As ASPxUploadControl)

        If (uploadedFile.IsValid) Then

            Dim fileName As String = uploadedFile.FileName
            Dim logicalPath As String = Path.Combine(Constant.REPORTS_FOLDER, fileName)
            Dim physicalPath As String = MapPath(logicalPath)

            'Using original As Image = Image.FromStream(uploadedFile.FileContent)

            '    original.Save(physicalPath)

            'End Using

            uploadedFile.SaveAs(physicalPath)

            Session(SessionKey.LOGICALPATH) = fileName.Replace(".rpt", "")

        End If
    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'EntityDataSource_system_report.ConnectionString = New EntityConnectionEx().TheConnectionString

    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        If Not Session(SessionKey.LOGICALPATH) Is Nothing Then

            e.NewValues("report_file_name") = Session(SessionKey.LOGICALPATH)

        End If

    End Sub

    Protected Sub ASPxUploadControl1_FileUploadComplete(ByVal sender As Object, ByVal e As FileUploadCompleteEventArgs)

        Save_Attach(TryCast(sender, ASPxUploadControl))

    End Sub

    Protected Sub ASPxGridView1_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ASPxGridView1.RowUpdating

        If Not Session(SessionKey.LOGICALPATH) Is Nothing Then

            e.NewValues("report_file_name") = Session(SessionKey.LOGICALPATH)

        End If

    End Sub

    Protected Sub ASPxGridView1_InitNewRow(sender As Object, e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs) Handles ASPxGridView1.InitNewRow

        Session(SessionKey.LOGICALPATH) = Nothing

    End Sub

    Protected Sub ASPxGridView1_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles ASPxGridView1.StartRowEditing

        Session(SessionKey.LOGICALPATH) = Nothing

    End Sub

#End Region

End Class