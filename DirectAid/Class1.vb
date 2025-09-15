Imports CrystalDecisions.Shared
Imports CrystalDecisions.CrystalReports.Engine


Imports System.IO
Imports System.Drawing

Public Class CrystalReportsHelper
    Shared ReadOnly _IMAGE_TYPES As New List(Of String)()
    Shared Sub New()

        _IMAGE_TYPES.AddRange(New String() {".JPEG", ".JPG", ".GIF", ".TIF", ".TIFF", ".BMP"})
    End Sub

    Public Shared Sub SetData(reportData As DataSet, report As ReportDocument)
        For Each tbl As Table In report.Database.Tables
            tbl.SetDataSource(reportData.Tables(tbl.Name))
        Next
        If report.IsSubreport Then
            Return
        End If
        For Each subReport As ReportDocument In report.Subreports
            SetData(reportData, subReport)
        Next
    End Sub

    Public Shared Sub BufferImagesToRatio(attachmentTable As DataTable, attachmentColumn As String, extensionColumn As String, widthHeightRatio As Double, maxDimension As Integer)
        If Not attachmentTable.Columns.Contains(attachmentColumn) OrElse Not attachmentTable.Columns.Contains(extensionColumn) Then
            Throw New ArgumentException("Attachment table does not contain the specified columns.")
        End If

        BufferImagesToRatio(attachmentTable, attachmentTable.Columns(attachmentColumn), attachmentTable.Columns(extensionColumn), widthHeightRatio, maxDimension)
    End Sub
    Public Shared Sub BufferImagesToRatio(attachmentTable As DataTable, attachmentColumn As DataColumn, extensionColumn As DataColumn, widthHeightRatio As Double, maxDimension As Integer)
        'If attachmentColumn.Table <> attachmentTable OrElse extensionColumn.Table <> attachmentTable Then
        '    Throw New ArgumentException("One of the columns does not belong to the assosciated table.")
        'End If

        If attachmentColumn.DataType <> GetType(Byte()) OrElse extensionColumn.DataType <> GetType(String) Then
            Throw New ArgumentException("Column type mismatch are the wrong type.")
        End If


        For Each row As DataRow In attachmentTable.Rows
            If row.IsNull(attachmentColumn) Then
                Continue For
            End If
            If row.IsNull(extensionColumn) Then
                Continue For
            End If

            Dim extension As String = DirectCast(row.ItemArray(extensionColumn.Ordinal), String)
            Dim ext As String = extension.Substring(extension.Length - 4)
            If Not _IMAGE_TYPES.Contains(ext.ToUpper()) Then
                Continue For
            End If

            'Get as a bitmap
            Dim imageBytes As Byte() = DirectCast(row.ItemArray(attachmentColumn.Ordinal), Byte())
            Dim ms As New MemoryStream(imageBytes)
            Dim b As New Bitmap(ms)
            ms.Close()

            'Buffer to a white square
            Dim squareB As Bitmap = BufferBitmapToRatio(b, widthHeightRatio, maxDimension, Color.White)
            b.Dispose()

            'Write back to a byte[]
            ms = New MemoryStream()
            squareB.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)

            'Save back to dataset
            row.BeginEdit()
            Dim rowArray As Object() = row.ItemArray
            rowArray(attachmentColumn.Ordinal) = ms.GetBuffer()
            'rowArray(extensionColumn.Ordinal) = ".jpg"
            row.ItemArray = rowArray
            row.EndEdit()

            ms.Close()
            squareB.Dispose()
        Next
    End Sub

    Public Shared Function BufferBitmapToRatio(b As Bitmap, widthHeightRatio As Double, maxDimension__1 As Integer, fillColor As Color) As Bitmap
        Dim dispose As Boolean = False
        Dim scaledBitmap As Bitmap = b
        Try
            If MaxDimension(b) > maxDimension__1 Then
                scaledBitmap = ScaleBitmap(b, maxDimension__1)
                dispose = True
            End If

            Dim newSize As Size
            If MaxDimension(scaledBitmap) = scaledBitmap.Height Then
                newSize = New Size(CInt(widthHeightRatio) * MaxDimension(scaledBitmap), CInt(MaxDimension(scaledBitmap)))
            Else
                newSize = New Size(CInt(MaxDimension(scaledBitmap)), CInt(MaxDimension(scaledBitmap) / widthHeightRatio))
            End If

            Dim result As New Bitmap(newSize.Width, newSize.Height, System.Drawing.Imaging.PixelFormat.Format24bppRgb)
            Using g As Graphics = Graphics.FromImage(DirectCast(result, Image))
                g.Clear(fillColor)
                g.DrawImageUnscaled(b, 0, 0)
            End Using
            Return result
        Finally
            If dispose Then
                scaledBitmap.Dispose()
            End If
        End Try
    End Function

    Public Shared Function ScaleBitmap(b As Bitmap, maxSize As Integer) As Bitmap
        Dim width As Double = b.Width
        Dim height As Double = b.Height
        Dim max As Double = maxSize
        Dim scaleRatio As Double = max / MaxDimension(b)
        Dim newSize As New Size(CInt(b.Width * scaleRatio), CInt(b.Height * scaleRatio))

        Return New Bitmap(b, newSize)
    End Function
    Private Shared Function MaxDimension(b As Bitmap) As Integer
        Return If(b.Width > b.Height, b.Width, b.Height)
    End Function
End Class

