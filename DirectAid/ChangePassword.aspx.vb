
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class ChangePassword
    Inherits BaseWebForm

#Region "Methods"

    Private Sub CheckForceChangePassword()

        ASPxLabel_MSG.Text = String.Empty

        If Session(SessionKey.FORCE_CHANGE_PASSWORD) Then

            ASPxLabel_MSG.Text = "من فضلك قم بتغيير كلمة المرور لتتمكن من استئناف العمل على النظام"

        End If

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        CheckForceChangePassword()

    End Sub

    Protected Sub ASPxCallback_ChangePassword_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_ChangePassword.Callback

        Dim INVALID_CURRENT_PASSWORD As String = "INVALID_CURRENT_PASSWORD"
        Dim INVALID_CONFIRM_NEW_PASSWORD As String = "INVALID_CONFIRM_NEW_PASSWORD"
        Dim OK As String = "OK"

        If (ASPxTextBox_NewPassword.Value <> ASPxTextBox_ConfirmNewPassword.Value) Then

            e.Result = INVALID_CONFIRM_NEW_PASSWORD
            Exit Sub

        End If

        '=======================================================================================
        'Declaration
        '---------------------------------------------------------------------------------------
        Dim _StringBuilder As StringBuilder
        Dim _ConnectionString As String
        Dim _SqlConnection As SqlConnection
        Dim _SqlCommand As SqlCommand
        Dim _DataTable As DataTable
        Dim _SqlConnectionStringBuilder As SqlConnectionStringBuilder
        '=======================================================================================

        '=======================================================================================
        'Initialization
        '---------------------------------------------------------------------------------------
        _StringBuilder = New StringBuilder

        _ConnectionString = ConfigurationManager.ConnectionStrings("charitysoft").ConnectionString

        _SqlConnectionStringBuilder = New SqlConnectionStringBuilder(_ConnectionString)
        _SqlConnectionStringBuilder.IntegratedSecurity = False
        _SqlConnectionStringBuilder.UserID = Session(SessionKey.USERNAME)
        _SqlConnectionStringBuilder.Password = ASPxTextBox_CurrentPassword.Value
        _SqlConnection = New SqlConnection(_SqlConnectionStringBuilder.ConnectionString)

        _DataTable = New DataTable
        '---------------------------------------------------------------------------------------
        _StringBuilder.AppendFormat("EXEC sp_password '{0}', '{1}', '{2}'", ASPxTextBox_CurrentPassword.Value, ASPxTextBox_NewPassword.Value, Session(SessionKey.USERNAME))

        _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)
        '=======================================================================================

        '=======================================================================================
        'Processing
        '---------------------------------------------------------------------------------------
        Try

            _SqlConnection.Open()

        Catch ex As Exception

            _SqlConnection.Dispose()
            e.Result = INVALID_CURRENT_PASSWORD
            Exit Sub

        End Try

        Try

            _SqlCommand.ExecuteNonQuery()

            Session(SessionKey.PASSWORD) = ASPxTextBox_NewPassword.Value

            Using db As New Database

                Dim userName As String = Session(SessionKey.USERNAME)

                Session(SessionKey.FORCE_CHANGE_PASSWORD) = False

                Dim _collectors_tab As collectors_tab = (From o In db.collectors_tab Where o.collect_id = userName Select o).FirstOrDefault
                _collectors_tab.force_change_password = False

                db.SaveChanges()

            End Using

            e.Result = OK

        Catch ex As Exception

            _SqlConnection.Dispose()
            e.Result = ex.Message

        End Try
        '=======================================================================================

    End Sub

#End Region

End Class