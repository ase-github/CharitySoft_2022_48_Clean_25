
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

Public Class UCBeneficiaryAttachV2
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

#End Region

#Region "Methods"

    Sub Save_Attach(ByVal uploadedFile As ASPxUploadControl)

        If (uploadedFile.IsValid) Then

            Dim fileName As String = Guid.NewGuid.ToString() & uploadedFile.FileName
            Dim logicalPath As String = Path.Combine(Constant.Orphans_Images, fileName)
            Dim physicalPath As String = MapPath(logicalPath)

            'Using original As Image = Image.FromStream(uploadedFile.FileContent)

            '    original.Save(physicalPath)

            'End Using

            uploadedFile.SaveAs(physicalPath)

            Session(SessionKey.LOGICALPATH) = logicalPath

        End If
    End Sub

    Private Function SaveBinaryImage() As String

        Try

            Using db As New Database

                Dim appSer As Int32 = HiddenField_app_ser.Value

                Dim bf As BeneficiaryPhoto = (From o In db.BeneficiaryPhotoes Where o.app_ser = appSer Select o).FirstOrDefault()

                Dim _TheFileName As String = (From o In db.application_attach Where o.app_ser = appSer And o.attach_code = 1 Order By o.attach_ser Descending Select o.attachment_image).FirstOrDefault()

                If Not _TheFileName Is Nothing Then

                    _TheFileName = _TheFileName.Replace(Constant.Orphans_Images, "")

                    Dim logicalPath As String = Path.Combine(Constant.Orphans_Images, _TheFileName)
                    Dim physicalPath As String = MapPath(logicalPath)

                    Dim qualityLevel As Int64 = (From o In db.DefaultSettings Select o.ImageCompressionQualityLevel).DefaultIfEmpty(10).FirstOrDefault()

                    Dim ms As MemoryStream = Imaging.CompressImage(Image.FromFile(physicalPath), qualityLevel)

                    If bf Is Nothing Then

                        bf = New BeneficiaryPhoto()
                        bf.app_ser = appSer
                        bf.TheFileName = _TheFileName
                        bf.Photo = ms.ToArray()

                        db.BeneficiaryPhotoes.AddObject(bf)

                    Else

                        bf.TheFileName = _TheFileName
                        bf.Photo = ms.ToArray()

                    End If

                    ms.Close()

                Else

                    If Not bf Is Nothing Then

                        db.BeneficiaryPhotoes.DeleteObject(bf)

                    End If

                End If

                db.SaveChanges()

                Return "OK"

            End Using

        Catch ex As Exception

            Return ex.Message

        End Try

    End Function

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        EntityDataSource1.ConnectionString = New EntityConnectionEx().TheConnectionString

    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        If (app_ser <> 0) Then

            If Not Session(SessionKey.LOGICALPATH) Is Nothing Then

                e.NewValues("attachment_image") = Session(SessionKey.LOGICALPATH)

            End If

            e.NewValues("app_ser") = app_ser

        Else

            Throw New Exception("من فضلك قم بحفظ او استدعاء بيانات اليتيم")

        End If


    End Sub

    Protected Sub ASPxUploadControl1_FileUploadComplete(ByVal sender As Object, ByVal e As FileUploadCompleteEventArgs)

        Save_Attach(TryCast(sender, ASPxUploadControl))

    End Sub

    Protected Sub ASPxGridView1_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ASPxGridView1.RowUpdating

        If Not Session(SessionKey.LOGICALPATH) Is Nothing Then

            e.NewValues("attachment_image") = Session(SessionKey.LOGICALPATH)

        End If

    End Sub

    Protected Sub ASPxGridView1_InitNewRow(sender As Object, e As DevExpress.Web.Data.ASPxDataInitNewRowEventArgs) Handles ASPxGridView1.InitNewRow

        Session(SessionKey.LOGICALPATH) = Nothing

    End Sub

    Protected Sub ASPxGridView1_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles ASPxGridView1.StartRowEditing

        Session(SessionKey.LOGICALPATH) = Nothing

    End Sub

    Protected Sub ASPxGridView1_RowInserted(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertedEventArgs) Handles ASPxGridView1.RowInserted
        SaveBinaryImage()
    End Sub

    Protected Sub ASPxGridView1_RowUpdated(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatedEventArgs) Handles ASPxGridView1.RowUpdated
        SaveBinaryImage()
    End Sub

    Protected Sub ASPxGridView1_RowDeleted(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletedEventArgs) Handles ASPxGridView1.RowDeleted
        SaveBinaryImage()
    End Sub

    Protected Sub ASPxCallback_Save_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Save.Callback
        e.Result = SaveBinaryImage()
    End Sub

#End Region

End Class