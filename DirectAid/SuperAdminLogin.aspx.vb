Imports System
Imports System.Data.SqlClient
Imports System.Web.Security
Imports System.Configuration

Imports System.Exception

Imports System.Net
Imports System.ServiceModel.Channels
Imports System.Web




'Namespace DirectAid
Partial Public Class SuperAdminLogin
        Inherits BaseWebForm

        Private Property ASPxLabel_Message As Object

        Protected Sub btnSuperAdminLogin_Click(sender As Object, e As EventArgs)
            Try
                ' ✅ Check SQL Server availability
                Dim connStr As String = ConfigurationManager.ConnectionStrings("Con_1").ConnectionString
                Using conn As New SqlConnection(connStr)
                    conn.Open()
                End Using

                ' ✅ Super admin session values
                Session(SessionKey.USERNAME) = "superadmin"
                Session(SessionKey.PASSWORD) = "bypass"
                Session(SessionKey.BRANCH_ID) = 1
                Session(SessionKey.CULTURE) = Constant.CULTURE_AR_KW
                Session(SessionKey.FORCE_CHANGE_PASSWORD) = False

                ' ✅ Forms Authentication redirect
                FormsAuthentication.RedirectFromLoginPage("superadmin", False)
                Response.Redirect(FormsAuthentication.DefaultUrl)

            Catch ex As Exception
                ' ✅ Fallback: display error if DB is unreachable
                ASPxLabel_Message.Text = "You are connected from a mobile device."

            End Try
        End Sub
    End Class
'End Namespace
