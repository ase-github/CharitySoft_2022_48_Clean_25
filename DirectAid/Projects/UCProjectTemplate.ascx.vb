
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

Public Class UCProjectTemplate
    Inherits System.Web.UI.UserControl

#Region "Methods"

    Private Sub SavePhoto(ByVal uploadedFile As UploadedFile)

        If (uploadedFile.IsValid) Then

            Directory.CreateDirectory(MapPath(Constant.ProjectTemplate))

            Dim logicalPath As String = Path.Combine(Constant.ProjectTemplate, uploadedFile.FileName)
            Dim physicalPath As String = MapPath(logicalPath)

            Using original As Image = Image.FromStream(uploadedFile.FileContent)

                original.Save(physicalPath)

            End Using

            Dim dv As DataView = SqlDataSource_GetNextID.Select(DataSourceSelectArguments.Empty)

            If Not dv Is Nothing Then

                If dv.Table.Rows.Count > 0 Then

                    SqlDataSource_project_template.InsertParameters("temp_id").DefaultValue = dv.Table.Rows(0)("id")

                End If

            End If

            SqlDataSource_project_template.InsertParameters("temp_name_ar").DefaultValue = "اسم النموذج باللغه العربيه"
            SqlDataSource_project_template.InsertParameters("temp_name_en").DefaultValue = "اسم النموذج باللغه الانجليزيه"
            SqlDataSource_project_template.InsertParameters("country_id").DefaultValue = 1
            SqlDataSource_project_template.InsertParameters("project_type").DefaultValue = 1

            SqlDataSource_project_template.InsertParameters("temp_site").DefaultValue = ""
            SqlDataSource_project_template.InsertParameters("importance").DefaultValue = ""

            SqlDataSource_project_template.InsertParameters("template_photo").DefaultValue = logicalPath
            SqlDataSource_project_template.Insert()

        End If

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Request.QueryString(QueryStringKey.PROJECT_TEMPLATE_ID) Is Nothing Then

            ASPxGridView1.AutoFilterByColumn(ASPxGridView1.Columns("temp_id"), Request.QueryString(QueryStringKey.PROJECT_TEMPLATE_ID))

        End If

    End Sub

    Protected Sub ASPxUploadControl1_FileUploadComplete(ByVal sender As Object, ByVal e As DevExpress.Web.FileUploadCompleteEventArgs) Handles ASPxUploadControl1.FileUploadComplete

        SavePhoto(e.UploadedFile)

    End Sub

#End Region

End Class