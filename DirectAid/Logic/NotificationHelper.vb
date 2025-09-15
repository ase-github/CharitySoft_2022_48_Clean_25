Imports System.Runtime.CompilerServices

''' <summary>
''' To Shows the notification.
''' </summary>
Public Module NotificationHelper

    'TODO to make this string is the jQuery script
    Dim jQueryScript As String

    ''' <summary>
    ''' Shows the notification.
    ''' </summary>
    ''' <param name="page">The page.</param>
    ''' <param name="message">The message.</param>
    <Extension()>
    Public Sub ShowSuccessfulNotification(ByVal page As System.Web.UI.Page, ByVal message As String)

        'page.ClientScript.RegisterStartupScript(GetType(Page), "notificationScript", "<script type='text/javascript'>  $(document).ready(function () { $.jnotify('" & message & "',true); });</script>")
        ScriptManager.RegisterStartupScript(page, page.GetType(), "notificationScript", "<script type='text/javascript'> $(document).ready(function () { $.jnotify('" & message & "',true); });</script>", False)

    End Sub

    ''' <summary>
    ''' Shows the warning notification.
    ''' </summary>
    ''' <param name="page">The page.</param>
    ''' <param name="message">The message.</param>
    <Extension()>
    Public Sub ShowWarningNotification(ByVal page As System.Web.UI.Page, ByVal message As String)

        'page.ClientScript.RegisterStartupScript(GetType(Page), "notificationScript", "<script type='text/javascript'> $(document).ready(function () { $.jnotify('" & message & "', 'warning',true); });</script>")
        ScriptManager.RegisterStartupScript(page, page.GetType(), "notificationScript", "<script type='text/javascript'> $(document).ready(function () { $.jnotify('" & message & "', 'warning',true); });</script>", False)

    End Sub

    ''' <summary>
    ''' Shows the error notification.
    ''' </summary>
    ''' <param name="page">The page.</param>
    ''' <param name="message">The message.</param>
    <Extension()>
    Public Sub ShowErrorNotification(ByVal page As System.Web.UI.Page, ByVal message As String)

        'page.ClientScript.RegisterStartupScript(GetType(Page), "notificationScript", "<script type='text/javascript'> $(document).ready(function () { $.jnotify('" & message & "', 'error', true); });</script>")
        ScriptManager.RegisterStartupScript(page, page.GetType(), "notificationScript", "<script type='text/javascript'> $(document).ready(function () { $.jnotify('" & message & "', 'error',true); });</script>", False)
    End Sub

    ''' <summary>
    ''' Shows the successful delayed notification.
    ''' </summary>
    ''' <param name="page">The page.</param>
    ''' <param name="message">The message.</param>
    <Extension()>
    Public Sub ShowSuccessfulDelayedNotification(ByVal page As System.Web.UI.Page, ByVal message As String)

        'page.ClientScript.RegisterStartupScript(GetType(Page), "notificationScript", "<script type='text/javascript'> $(document).ready(function () { $.jnotify('" & message & "', true); });</script>")
        ScriptManager.RegisterStartupScript(page, page.GetType(), "notificationScript", "<script type='text/javascript'> $(document).ready(function () { $.jnotify('" & message & "',true); });</script>", False)
    End Sub

    ''' <summary>
    ''' Shows the warning delayed notification.
    ''' </summary>
    ''' <param name="page">The page.</param>
    ''' <param name="message">The message.</param>
    <Extension()>
    Public Sub ShowWarningDelayedNotification(ByVal page As System.Web.UI.Page, ByVal message As String)

        'page.ClientScript.RegisterStartupScript(GetType(Page), "notificationScript", "<script type='text/javascript'> $(document).ready(function () { $.jnotify('" & message & "', 'warning', true); });</script>")
        ScriptManager.RegisterStartupScript(page, page.GetType(), "notificationScript", "<script type='text/javascript'> $(document).ready(function () { $.jnotify('" & message & "', 'warning',true); });</script>", False)
    End Sub

    ''' <summary>
    ''' Shows the error delayed notification.
    ''' </summary>
    ''' <param name="page">The page.</param>
    ''' <param name="message">The message.</param>
    <Extension()>
    Public Sub ShowErrorDelayedNotification(ByVal page As System.Web.UI.Page, ByVal message As String)

        'page.ClientScript.RegisterStartupScript(GetType(Page), "notificationScript", "<script type='text/javascript'> $(document).ready(function () { $.jnotify('" & message & "', 'error', true); });</script>")
        ScriptManager.RegisterStartupScript(page, page.GetType(), "notificationScript", "<script type='text/javascript'> $(document).ready(function () { $.jnotify('" & message & "', 'error',true); });</script>", False)
    End Sub

End Module
