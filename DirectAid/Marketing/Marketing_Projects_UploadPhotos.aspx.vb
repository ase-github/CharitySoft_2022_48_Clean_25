Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Web
Imports System.Globalization
Imports System.IO
Imports DevExpress.Web
Imports System.Drawing
Imports Microsoft.VisualBasic
Imports System
Imports System.Web.UI
Imports DevExpress.Web.ASPxUploadControl

Public Class Marketing_Projects_UploadPhotos
    Inherits System.Web.UI.Page

    Dim cn As New OleDbConnection
    Dim cm As New OleDbCommand
    Dim da As New OleDbDataAdapter
    Dim dt As New DataTable
    Dim dr As OleDbDataReader

    Dim constr As String = ConfigurationManager.ConnectionStrings("charitysoftConnectionString").ConnectionString
    Dim con As New SqlConnection(constr)
    Dim cmd As New SqlCommand
    Dim ds As New DataSet
    Dim dtsql As New SqlDataAdapter
    Dim str As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Const UploadDirectory As String = "~/Resources/"
    Dim ErrorLog As String = ""
    Dim ErrorsCount1 As Integer = 0
    Dim ls As New List(Of String)
    Protected Sub ASPxUploadControl1_FilesUploadComplete(sender As Object, e As FilesUploadCompleteEventArgs) Handles ASPxUploadControl1.FilesUploadComplete

        If ASPxUploadControl1.UploadedFiles.Length = 1 Then Exit Sub

        For Each filepath In ASPxUploadControl1.UploadedFiles

            Dim FileExtension As String = Path.GetExtension(filepath.FileName)
            Dim FileName As String = Path.GetFileNameWithoutExtension(filepath.FileName)
            'Dim resultFileName As String = Path.ChangeExtension(Path.GetRandomFileName(), FileExtension)
            'Dim resultFileUrl As String = UploadDirectory & resultFileName
            Dim resultFileUrl As String = UploadDirectory & Path.GetFileName(filepath.FileName)
            Dim resultFilePath As String = MapPath(resultFileUrl)

            If FileExtension.ToUpper.Contains(".JPG") Or FileExtension.ToUpper.Contains(".JPEG") Then
                If con.State <> ConnectionState.Open Then
                    con.Open()
                End If
                If ProjectIsExist(FileName) = False Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & FileName & " غير مسجل على برنامج كركس " & vbCrLf
                    ErrorsCount1 += 1
                Else
                    filepath.SaveAs(resultFilePath)
                    ls.Add(resultFilePath)
                    Session("LS") = ls
                End If

            Else
                ErrorLog = ErrorLog & " الشروع رقم :" & FileName & " امتداد الصورة غير معرف " & vbCrLf
                ErrorsCount1 += 1
            End If
        Next

        con.Close()
        Session("CheckB4Save") = False
        If ErrorsCount1 <> 0 Then
            Session("CheckB4Save") = False
            e.CallbackData = ErrorLog
            For Each Paths In ls
                File.Delete(Paths)
            Next
        Else
            Session("CheckB4Save") = True
            e.CallbackData = "صور المشاريع جاهزة للرفع الرجاء الضغط على زر الحفظ لإتمام عملية الحفظ"

        End If

    End Sub

    Private Function ProjectIsExist(ByVal _ProjectNo As String) As Boolean
        str = " SELECT Project_No FROM Marketing_Projects_Master WHERE CONVERT(nvarchar(50), Project_No)='" & _ProjectNo & "' "

        cmd.CommandText = str
        cmd.Connection = con
        If cmd.ExecuteScalar = Nothing Then
            Return False
        Else
            Return True
        End If
    End Function

    Protected Sub btNew_Click(sender As Object, e As EventArgs) Handles btNew.Click
        txtError.Text = ""
        lblErrorsCount.Text = 0
        ls.Clear()
        Session("CheckB4Save") = False
    End Sub

    'Private Const MarketingImagesDirectory As String = "~\MarketingImages\"
    Protected Sub ASPxButton2_Click(sender As Object, e As EventArgs) Handles ASPxButton2.Click, ASPxButton2.Click
        If Session("CheckB4Save") = False Then
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alert('الرجاء اختيار الصور أولا');", True)
            Exit Sub
        End If

        ls = Session("LS")
        For Each Paths In ls
            Dim FileExtension As String = Path.GetExtension(Paths)
            Dim FileName As String = Path.GetFileNameWithoutExtension(Paths)
            'Dim RandomFileName As String = (Path.GetRandomFileName() & "_" & FileName)
            'Dim resultFileName As String = Path.ChangeExtension(RandomFileName, FileExtension)

            Dim resultFileName As String = (FileName & FileExtension)

            'Dim resultFileUrl As String = MarketingImagesDirectory & resultFileName

            Dim resultFileUrl As String = Path.Combine("~\MarketingImages\", resultFileName)
            Dim resultFilePath As String = MapPath(resultFileUrl)

            If File.Exists(resultFilePath) Then
                File.Delete(resultFilePath)
            End If
            File.Move(Paths, resultFilePath)

            If File.Exists("\\CHARITY-SQL\MarketingImages\" & resultFileName) Then
                File.Delete("\\CHARITY-SQL\MarketingImages\" & resultFileName)
            End If
            File.Copy(resultFilePath, "\\CHARITY-SQL\MarketingImages\" & resultFileName)

            If con.State = ConnectionState.Closed Then
                con.Open()
            End If



            Dim qualityLevel As Int64 = 10
            Dim ms As MemoryStream = Imaging.CompressImage(Image.FromFile(resultFilePath), qualityLevel)
            str = " UPDATE Marketing_Projects_Master SET PhotoPath = @PhotoPath, PhotoBinary = @PhotoBinary WHERE Project_No = @ProjectNo "
            cmd.Parameters.Clear()
            cmd.Parameters.AddWithValue("@ProjectNo", FileName)
            cmd.Parameters.AddWithValue("@PhotoPath", resultFileUrl)
            cmd.Parameters.AddWithValue("@PhotoBinary", ms.ToArray)
            cmd.CommandText = str
            cmd.Connection = con
            cmd.ExecuteNonQuery()

        Next
        ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alert('تم رفع البيانات بنجاح');", True)
        con.Close()
        Session("CheckB4Save") = False
    End Sub


End Class