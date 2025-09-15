Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Web
Imports System.Data.SqlClient
Imports System.IO
Imports System.Exception
Imports CrystalDecisions.Shared
Imports DirectAid.CrystalReportsHelper
Imports System.Drawing

Public Class ConstructionPageReportWaterWebSite
    Inherits System.Web.UI.Page

    Dim constr As String = ConfigurationManager.ConnectionStrings("charitysoftConnectionString").ConnectionString
    Dim con As New SqlConnection(constr)
    Dim dt As New SqlDataAdapter
    Dim cmd As New SqlCommand
    Dim ds As New DSNewImplementation_Ayman
    Dim rpt As New ReportDocument()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim str As String = " SELECT TOP 1 * FROM VIW_ProjectsDonorsReports WHERE Maxproject_progress_id=(SELECT MAX(project_progress_id) FROM project_progress WHERE project_id ='" & Request.QueryString("project_id") & "') "
        'AND donor_id ='" & Request.QueryString("DonorID") & "' 
        With cmd
            .CommandTimeout = 60
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = str
        End With
        dt.SelectCommand = cmd
        Try
            con.Open()
            dt.Fill(ds.Tables("VIW_ProjectsDonorsReports"))
            con.Close()
            If (Not ds.Tables("VIW_ProjectsDonorsReports") Is Nothing) Then

                If (ds.Tables("VIW_ProjectsDonorsReports").Rows.Count > 0) Then

                    Dim obj As Object = ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("PhotoPath1")
                    If Not obj Is Nothing Then
                        Dim physicalFileName As String = Server.MapPath(obj.ToString())
                        If System.IO.File.Exists(physicalFileName) Then
                            Dim img = System.Drawing.Image.FromFile(physicalFileName)
                            Dim ms = New System.IO.MemoryStream()
                            img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)
                            Dim bytes = ms.ToArray()
                            ms.Close()

                            ''Dim imageBytes As Byte() = DirectCast(bytes, Byte())
                            'Dim ms2 As New MemoryStream(bytes)
                            'Dim b As New Bitmap(ms2)
                            'ms2.Close()

                            ''Buffer to a white square
                            ''Dim squareB As Bitmap = BufferBitmapToRatio(b, (2), 1032, Color.White)
                            'Dim squareB As Bitmap = BufferBitmapToRatio(b, (3), 1032, Color.White)
                            'b.Dispose()

                            ''Write back to a byte[]
                            'ms = New MemoryStream()
                            'squareB.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)

                            'ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo1") = ms.GetBuffer()
                            'ms.Close()
                            'squareB.Dispose()
                            ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo1") = bytes
                        End If
                    End If

                    Dim obj2 As Object = ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("PhotoPath2")
                    If Not obj2 Is Nothing Then
                        Dim physicalFileName As String = Server.MapPath(obj2.ToString())
                        If System.IO.File.Exists(physicalFileName) Then
                            Dim img = System.Drawing.Image.FromFile(physicalFileName)
                            Dim ms = New System.IO.MemoryStream()
                            img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)
                            Dim bytes = ms.ToArray()
                            ms.Close()

                            ''Dim imageBytes As Byte() = DirectCast(bytes, Byte())
                            'Dim ms2 As New MemoryStream(bytes)
                            'Dim b As New Bitmap(ms2)
                            'ms2.Close()

                            ''Buffer to a white square
                            ''Dim squareB As Bitmap = BufferBitmapToRatio(b, (2), 1032, Color.White)
                            'Dim squareB As Bitmap = BufferBitmapToRatio(b, (1.5), 1032, Color.White)
                            'b.Dispose()

                            ''Write back to a byte[]
                            'ms = New MemoryStream()
                            'squareB.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)

                            'ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo2") = ms.GetBuffer()
                            'ms.Close()
                            'squareB.Dispose()
                            ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo2") = bytes
                        End If
                    End If

                    Dim obj3 As Object = ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("PhotoPath3")
                    If Not obj3 Is Nothing Then
                        Dim physicalFileName As String = Server.MapPath(obj3.ToString())
                        If System.IO.File.Exists(physicalFileName) Then
                            Dim img = System.Drawing.Image.FromFile(physicalFileName)
                            Dim ms = New System.IO.MemoryStream()
                            img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)
                            Dim bytes = ms.ToArray()
                            ms.Close()

                            ''Dim imageBytes As Byte() = DirectCast(bytes, Byte())
                            'Dim ms2 As New MemoryStream(bytes)
                            'Dim b As New Bitmap(ms2)
                            'ms2.Close()

                            ''Buffer to a white square
                            ''Dim squareB As Bitmap = BufferBitmapToRatio(b, (2), 1032, Color.White)
                            'Dim squareB As Bitmap = BufferBitmapToRatio(b, (1.5), 1032, Color.White)
                            'b.Dispose()

                            ''Write back to a byte[]
                            'ms = New MemoryStream()
                            'squareB.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)

                            'ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo3") = ms.GetBuffer()
                            'ms.Close()
                            'squareB.Dispose()
                            ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo3") = bytes
                        End If
                    End If

                    Dim obj4 As Object = ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("PhotoPath4")
                    If Not obj4 Is Nothing Then
                        Dim physicalFileName As String = Server.MapPath(obj4.ToString())
                        If System.IO.File.Exists(physicalFileName) Then
                            Dim img = System.Drawing.Image.FromFile(physicalFileName)
                            Dim ms = New System.IO.MemoryStream()
                            img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)
                            Dim bytes = ms.ToArray()
                            ms.Close()

                            ''Dim imageBytes As Byte() = DirectCast(bytes, Byte())
                            'Dim ms2 As New MemoryStream(bytes)
                            'Dim b As New Bitmap(ms2)
                            'ms2.Close()

                            ''Buffer to a white square
                            ''Dim squareB As Bitmap = BufferBitmapToRatio(b, (2), 1032, Color.White)
                            'Dim squareB As Bitmap = BufferBitmapToRatio(b, (1.5), 1032, Color.White)
                            'b.Dispose()

                            ''Write back to a byte[]
                            'ms = New MemoryStream()
                            'squareB.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)

                            'ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo4") = ms.GetBuffer()
                            'ms.Close()
                            'squareB.Dispose()
                            ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo4") = bytes
                        End If
                    End If

                    Dim obj5 As Object = ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("PhotoPath5")
                    If Not obj5 Is Nothing Then
                        Dim physicalFileName As String = Server.MapPath(obj5.ToString())
                        If System.IO.File.Exists(physicalFileName) Then
                            Dim img = System.Drawing.Image.FromFile(physicalFileName)
                            Dim ms = New System.IO.MemoryStream()
                            img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)
                            Dim bytes = ms.ToArray()
                            ms.Close()

                            ''Dim imageBytes As Byte() = DirectCast(bytes, Byte())
                            'Dim ms2 As New MemoryStream(bytes)
                            'Dim b As New Bitmap(ms2)
                            'ms2.Close()

                            ''Buffer to a white square
                            ''Dim squareB As Bitmap = BufferBitmapToRatio(b, (2), 1032, Color.White)
                            'Dim squareB As Bitmap = BufferBitmapToRatio(b, (1.5), 1032, Color.White)
                            'b.Dispose()

                            ''Write back to a byte[]
                            'ms = New MemoryStream()
                            'squareB.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)

                            'ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo5") = ms.GetBuffer()
                            'ms.Close()
                            'squareB.Dispose()
                            ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo5") = bytes
                        End If
                    End If

                    Dim obj6 As Object = ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("PhotoPath6")
                    If Not obj6 Is Nothing Then
                        Dim physicalFileName As String = Server.MapPath(obj6.ToString())
                        If System.IO.File.Exists(physicalFileName) Then
                            Dim img = System.Drawing.Image.FromFile(physicalFileName)
                            Dim ms = New System.IO.MemoryStream()
                            img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)
                            Dim bytes = ms.ToArray()
                            ms.Close()

                            ''Dim imageBytes As Byte() = DirectCast(bytes, Byte())
                            'Dim ms2 As New MemoryStream(bytes)
                            'Dim b As New Bitmap(ms2)
                            'ms2.Close()

                            ''Buffer to a white square
                            ''Dim squareB As Bitmap = BufferBitmapToRatio(b, (2), 1032, Color.White)
                            'Dim squareB As Bitmap = BufferBitmapToRatio(b, (1.5), 1032, Color.White)
                            'b.Dispose()

                            ''Write back to a byte[]
                            'ms = New MemoryStream()
                            'squareB.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)

                            'ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo6") = ms.GetBuffer()
                            'ms.Close()
                            'squareB.Dispose()
                            ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo6") = bytes
                        End If
                    End If

                    Dim obj7 As Object = ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("PhotoPath7")
                    If Not obj7 Is Nothing Then
                        Dim physicalFileName As String = Server.MapPath(obj7.ToString())
                        If System.IO.File.Exists(physicalFileName) Then
                            Dim img = System.Drawing.Image.FromFile(physicalFileName)
                            Dim ms = New System.IO.MemoryStream()
                            img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)
                            Dim bytes = ms.ToArray()
                            ms.Close()

                            ''Dim imageBytes As Byte() = DirectCast(bytes, Byte())
                            'Dim ms2 As New MemoryStream(bytes)
                            'Dim b As New Bitmap(ms2)
                            'ms2.Close()

                            ''Buffer to a white square
                            ''Dim squareB As Bitmap = BufferBitmapToRatio(b, (2), 1032, Color.White)
                            'Dim squareB As Bitmap = BufferBitmapToRatio(b, (1.5), 1032, Color.White)
                            'b.Dispose()

                            ''Write back to a byte[]
                            'ms = New MemoryStream()
                            'squareB.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)

                            'ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo7") = ms.GetBuffer()
                            'ms.Close()
                            'squareB.Dispose()
                             ds.Tables("VIW_ProjectsDonorsReports").Rows(0)("Photo7") = bytes
                        End If
                    End If

                End If

            End If
            'End If

            Dim ReportPath = ".\ConstructionReportWaterWebSite.rpt"
            rpt.Load(Server.MapPath(ReportPath))
            rpt.SetDataSource(ds.Tables("VIW_ProjectsDonorsReports"))
            CrystalReportViewer1.RefreshReport()
            CrystalReportViewer1.ReportSource = rpt

            CrystalReportViewer1.ToolPanelView = ToolPanelViewType.None

        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alert('" & ex.Message & "');", True)
        End Try
    End Sub

    Protected Sub ASPxButton_PDF_Click(sender As Object, e As EventArgs) Handles ASPxButton_PDF.Click
        rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, "")
    End Sub

End Class