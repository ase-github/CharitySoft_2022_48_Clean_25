Public Class FaultEngine

    Public Shared Function HandleException(ByVal ex As Exception) As Exception

        Dim re As Exception = ex

        If ex.Message.Contains("See the inner exception for details") Then

            re = New Exception(ex.InnerException.Message)

        End If

        If re.Message.Contains("permission was denied on the object") Then

            re = New Exception("لا توجد لديك الصلاحيات")

        End If

        Return re

    End Function

End Class