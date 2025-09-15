' NOTE: You can use the "Rename" command on the context menu to change the class name "DonorServiceV1" in code, svc and config file together.
' NOTE: In order to launch WCF Test Client for testing this service, please select DonorServiceV1.svc or DonorServiceV1.svc.vb at the Solution Explorer and start debugging.
Public Class DonorServiceV1
    Implements IDonorServiceV1

    ''' <summary>
    ''' Check donor existance and return back with his id if exists and with nothing if not exists.
    ''' </summary>
    ''' <param name="phone"></param>
    ''' <param name="eMail"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function DonorExists(phone As String, eMail As String) As Int32? Implements IDonorServiceV1.DonorExists

        Dim re As Int32? = Nothing

        Using db As New Database

            re = db.DonorServiceV1_DonorExists(phone, eMail).FirstOrDefault()

        End Using

        Return re

    End Function

End Class
