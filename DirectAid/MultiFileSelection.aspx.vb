
#Region "Imports Directives"

Imports Microsoft.VisualBasic
Imports System
Imports System.Linq
Imports System.Web.UI
Imports DevExpress.Web.ASPxUploadControl

Imports System.Collections.Generic
Imports System.IO
Imports System.Web
Imports System.Web.Caching
Imports DevExpress.Web.Internal
Imports DirectAid
Imports DevExpress.Web

#End Region

Partial Public Class MultipleFileSelection
    Inherits BaseWebForm

    Protected Sub UploadControl_FileUploadComplete(ByVal sender As Object, ByVal e As FileUploadCompleteEventArgs)

        Try

            Using db As New charitysoftEntities()

                Dim app_ser As String = e.UploadedFile.FileName.Substring(0, e.UploadedFile.FileName.IndexOf("."))

                If IsNumeric(app_ser) Then

                    If (From o In db.benf_master Where o.app_ser = app_ser Select o).Count() > 0 Then

                        Dim resultFilePath As String = Constant.Orphans_Images & e.UploadedFile.FileName
                        e.UploadedFile.SaveAs(MapPath(resultFilePath))

                        Dim _application_attach As New application_attach
                        _application_attach.app_ser = app_ser
                        _application_attach.attach_code = 1
                        _application_attach.attach_date = DateTime.Now
                        _application_attach.attachment_image = resultFilePath
                        db.application_attach.AddObject(_application_attach)

                        db.SaveChanges()

                        UploadingUtils.RemoveFileWithDelay(e.UploadedFile.FileName, MapPath(resultFilePath), 5)

                        Dim file As String = String.Format("{0} {1} KB", e.UploadedFile.FileName, e.UploadedFile.ContentLength / 1024)
                        Dim url As String = ResolveClientUrl(resultFilePath)
                        e.CallbackData = file & "|" & url

                    Else

                        e.CallbackData = String.Format("لا يوجد يتيم بهذا الرقم : {0}", app_ser)

                    End If
                Else

                    e.CallbackData = String.Format("اسم الملف : {0} ليس رقم", app_ser)

                End If

            End Using


        Catch ex As Exception

            e.CallbackData = ex.Message

        End Try

    End Sub

End Class

Public NotInheritable Class UploadingUtils
    Private Sub New()
    End Sub

    Public Shared Sub RemoveFileWithDelay(ByVal key As String, ByVal fullPath As String, ByVal delay As Integer)
        If HttpUtils.GetCache()(key) Is Nothing Then
            Dim absoluteExpiration As DateTime = DateTime.Now.Add(New TimeSpan(0, delay, 0))
            HttpUtils.GetCache().Insert(key, fullPath, Nothing, absoluteExpiration, Cache.NoSlidingExpiration, CacheItemPriority.NotRemovable, New CacheItemRemovedCallback(AddressOf RemovedCallback))
        End If
    End Sub

    Public Shared Sub RemovedCallback(ByVal key As String, ByVal value As Object, ByVal reason As CacheItemRemovedReason)
        If File.Exists(value.ToString()) Then
            File.Delete(value.ToString())
        End If
    End Sub

End Class
