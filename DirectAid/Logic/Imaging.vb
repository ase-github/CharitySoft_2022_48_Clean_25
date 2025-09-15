Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Data
Imports System.Drawing
Imports System.Linq
Imports System.Threading.Tasks
Imports System.Drawing.Imaging

Public Class Imaging

    Public Shared Function CompressImage(img As Image, qualityLevel As Int64) As System.IO.MemoryStream
        Try
            Dim myImageCodecInfo As ImageCodecInfo
            Dim myEncoder As Encoder
            Dim myEncoderParameter As EncoderParameter
            Dim myEncoderParameters As EncoderParameters

            myImageCodecInfo = GetEncoderInfo("image/jpeg")

            myEncoder = Encoder.Quality

            ' Create an EncoderParameters object. 

            ' An EncoderParameters object has an array of EncoderParameter 

            ' objects. In this case, there is only one 

            ' EncoderParameter object in the array.
            myEncoderParameters = New EncoderParameters(1)

            ' Save the bitmap as a JPEG file with quality level X.
            myEncoderParameter = New EncoderParameter(myEncoder, qualityLevel)
            myEncoderParameters.Param(0) = myEncoderParameter

            Dim ms As New System.IO.MemoryStream()

            img.Save(ms, myImageCodecInfo, myEncoderParameters)

            Return ms
        Catch
            Return Nothing
        End Try
    End Function

    Public Shared Function CompressImage(img As Image) As System.IO.MemoryStream

        CompressImage(img, 25)

    End Function

    Private Shared Function GetEncoderInfo(mimeType As [String]) As ImageCodecInfo
        Dim j As Integer
        Dim encoders As ImageCodecInfo()
        encoders = ImageCodecInfo.GetImageEncoders()
        For j = 0 To encoders.Length - 1
            If encoders(j).MimeType = mimeType Then
                Return encoders(j)
            End If
        Next
        Return Nothing
    End Function
End Class