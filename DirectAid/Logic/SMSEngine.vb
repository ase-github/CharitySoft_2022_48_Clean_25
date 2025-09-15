Imports System.Net
Imports System.IO

Public Class SMSEngine

    Private Shared Function HttpSendCore(mobile As String, message As String) As String

        Try

            '==============================================================================
            'URL: http://www.kwtsms.com/API/send/
            'Parameters:
            '1. username
            '2. password
            '3. sender [alphanumeric only, replace spaces with + sign]
            '4. mobile [ ',' comma separated, no '+' or '00' or '.' or space in numbers]
            '5. lang [1: English 2: Arabic (Windows) 3: Arabic (UTF-8) 4: Unicode]
            '6. message [spaces must be converted to + sign (do not encode)]
            'Sample call:
            'http://www.kwtsms.com/API/send/?username=myuser&password=mypass
            '&sender=KWT-MESSAGE&mobile=96597119440&lang=2&message=+
            'Sample output:
            'OK:f4c841adee210f31307633ceaebff2ec:1:1:180:1242667894
            'RESULT:MSG-ID:NUMBERS:POINTS-CHARGED:BALANCE-AFTER:UNIX-TIMESTAMP
            '==============================================================================

            Dim client As WebClient = New WebClient
            ' Add a user agent header in case the requested URI contains a query.
            'client.Headers.Add("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.0.3705;)")
            client.QueryString.Add("username", ConfigurationSettings.AppSettings("SMS_USER_NAME"))
            client.QueryString.Add("password", ConfigurationSettings.AppSettings("SMS_PASSWORD"))
            client.QueryString.Add("sender", ConfigurationSettings.AppSettings("SMS_SENDER"))
            client.QueryString.Add("mobile", mobile)
            client.QueryString.Add("lang", ConfigurationSettings.AppSettings("SMS_LANG"))
            client.QueryString.Add("message", message.Replace(" ", "+"))
            Dim baseurl As String = ConfigurationSettings.AppSettings("SMS_BASE_URL")
            Dim data As Stream = client.OpenRead(baseurl)
            Dim reader As StreamReader = New StreamReader(data)
            Dim s As String = reader.ReadToEnd()
            data.Close()
            reader.Close()
            Return s

        Catch ex As Exception

            Return ex.Message

        End Try

    End Function

    Public Shared Function HttpSendV1(mobile As String, amount As String, currency As String) As String
        Dim WebSiteLink As String = ConfigurationSettings.AppSettings("SMS_TEXT2") & vbCrLf & ConfigurationSettings.AppSettings("SMS_WebSiteLink")
        Return HttpSendCore(mobile, String.Format("{0} {1:n3} {2} {3}", ConfigurationSettings.AppSettings("SMS_TEXT"), amount, currency, WebSiteLink))

    End Function

    Public Shared Function HttpSendV2(primary_phone As String, phone_2 As String, phone_3 As String, amount As String, currency As String) As String

        Dim mobile As String = String.Empty

        If System.Text.RegularExpressions.Regex.IsMatch(primary_phone, "\b(9|6|5)\d{7}\b") Then

            mobile = Trim(primary_phone)

        ElseIf System.Text.RegularExpressions.Regex.IsMatch(phone_2, "\b(9|6|5)\d{7}\b") Then

            mobile = Trim(phone_2)

        ElseIf System.Text.RegularExpressions.Regex.IsMatch(phone_3, "\b(9|6|5)\d{7}\b") Then

            mobile = Trim(phone_3)

        End If

        If mobile <> String.Empty Then

            mobile = "965" + mobile

            Return HttpSendV1(mobile, amount, currency)

        Else

            Return ""

        End If

    End Function

End Class