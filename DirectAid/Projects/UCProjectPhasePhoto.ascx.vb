
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView
Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxUploadControl
Imports System.Web.UI
Imports System.IO
Imports System.Drawing
Imports DevExpress.Web

#End Region

Public Class UCProjectPhasePhoto
    Inherits System.Web.UI.UserControl

#Region "Methods"

    Private Sub SavePhoto(ByVal uploadedFile As UploadedFile)

        If (uploadedFile.IsValid) Then

            Directory.CreateDirectory(Path.Combine(MapPath(Constant.ProjectPhasePhoto), Session(SessionKey.PROJECT_ID)))
            Directory.CreateDirectory(Path.Combine(MapPath(Constant.ProjectPhasePhoto), Session(SessionKey.PROJECT_ID), Session(SessionKey.PROJECTPHASE_ID)))

            Dim logicalPath As String = Path.Combine(Constant.ProjectPhasePhoto, Session(SessionKey.PROJECT_ID), Session(SessionKey.PROJECTPHASE_ID), uploadedFile.FileName)
            Dim physicalPath As String = MapPath(logicalPath)

            Using original As Image = Image.FromStream(uploadedFile.FileContent)

                original.Save(physicalPath)

            End Using

            Dim dv As DataView = SqlDataSource_GetNextID.Select(DataSourceSelectArguments.Empty)

            If Not dv Is Nothing Then

                If dv.Table.Rows.Count > 0 Then

                    SqlDataSource_project_photos.InsertParameters("photo_id").DefaultValue = dv.Table.Rows(0)("id")

                End If

            End If
            Dim ms As MemoryStream = Imaging.CompressImage(Image.FromFile(physicalPath), 10)
            Session("ms") = ms
            SqlDataSource_project_photos.InsertParameters("photo_notes").DefaultValue = "  "
            SqlDataSource_project_photos.InsertParameters("photo_path").DefaultValue = logicalPath
            SqlDataSource_project_photos.Insert()

        End If

    End Sub



#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ASPxGridView1_BeforePerformDataSelect(ByVal sender As Object, ByVal e As EventArgs) Handles ASPxGridView1.BeforePerformDataSelect
        Session(SessionKey.PROJECTPHASE_ID) = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub ASPxUploadControl1_FileUploadComplete(ByVal sender As Object, ByVal e As DevExpress.Web.FileUploadCompleteEventArgs) Handles ASPxUploadControl1.FileUploadComplete

        SavePhoto(e.UploadedFile)

    End Sub

#End Region

    Private Sub SqlDataSource_project_photos_Inserting(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSource_project_photos.Inserting
        e.Command.Parameters("@Photo").Value = Session("ms")
    End Sub

End Class