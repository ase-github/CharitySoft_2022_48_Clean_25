
#Region "Imports Directives"

Imports DevExpress.Web
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView
Imports System.Data.SqlClient
Imports System.DirectoryServices.AccountManagement

#End Region

Public Class UIUser
    Inherits BaseWebForm

    Private Sub LoadActiveDirectoryUsers()

        Dim groupName As String = "Domain Users"
        Dim domainName As String = "diraid"

        Dim ctx As New PrincipalContext(ContextType.Domain, domainName)
        Dim grp As GroupPrincipal = GroupPrincipal.FindByIdentity(ctx, IdentityType.SamAccountName, groupName)

        If grp IsNot Nothing Then
            For Each p As Principal In grp.GetMembers(False)
                Console.WriteLine(p.SamAccountName + " - " + p.DisplayName)
            Next


            grp.Dispose()
            ctx.Dispose()
            Console.ReadLine()
        Else
            Console.WriteLine(vbLf & "We did not find that group in that domain, perhaps the group resides in a different domain?")
            Console.ReadLine()
        End If

    End Sub

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'LoadActiveDirectoryUsers()

        EntityDataSource_Main.ConnectionString = New EntityConnectionEx().TheConnectionString
        EntityDataSource_Branch.ConnectionString = New EntityConnectionEx().TheConnectionString

    End Sub

    Protected Sub ASPxGridView1_RowDeleting(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletingEventArgs) Handles ASPxGridView1.RowDeleting

        e.Cancel = True

    End Sub

    Protected Sub ASPxGridView1_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles ASPxGridView1.StartRowEditing

        DirectCast(ASPxGridView1.Columns("password"), GridViewDataTextColumn).EditFormSettings.Visible = DevExpress.Utils.DefaultBoolean.False
        DirectCast(ASPxGridView1.Columns("collect_id"), GridViewDataTextColumn).ReadOnly = True

    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        Dim userName As String = e.NewValues("collect_id")
        Dim password As String = e.NewValues("password")
        Dim supervisor As Boolean = e.NewValues("super_visor")
        'Dim enabled As Boolean = e.NewValues("enabled")

        Try

            Using db As New Database

                db.ExecuteStoreCommand(String.Format("EXEC dbo.CreateUser '{0}', '{1}';", userName, password))

                'If enabled Then

                '    db.ExecuteStoreCommand(String.Format("ALTER LOGIN [{0}] ENABLE", userName))

                'Else

                '    db.ExecuteStoreCommand(String.Format("ALTER LOGIN [{0}] DISABLE", userName))

                'End If

                If supervisor Then

                    db.ExecuteStoreCommand(String.Format("ALTER SERVER ROLE [securityadmin] ADD MEMBER [{0}]", userName))

                    db.ExecuteStoreCommand(String.Format("ALTER ROLE [{0}] ADD MEMBER [{1}]", DatabaseRoles.db_owner, userName))

                    db.ExecuteStoreCommand(String.Format("ALTER ROLE [{0}] ADD MEMBER [{1}]", DatabaseRoles.settings_menu, userName))

                End If

                db.ExecuteStoreCommand(String.Format("ALTER ROLE [{0}] ADD MEMBER [{1}]", DatabaseRoles.read_all_tab_views, userName))

            End Using

        Catch ex As Exception

            e.Cancel = True
            Throw ex

        End Try

    End Sub

    Protected Sub ASPxGridView1_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ASPxGridView1.RowUpdating

        Dim userName As String = e.NewValues("collect_id")
        Dim supervisor As Boolean = e.NewValues("super_visor")
        'Dim enabled As Boolean = e.NewValues("enabled")

        Try

            Using db As New Database

                'If enabled Then

                '    db.ExecuteStoreCommand(String.Format("ALTER LOGIN [{0}] ENABLE", userName))

                'Else

                '    db.ExecuteStoreCommand(String.Format("ALTER LOGIN [{0}] DISABLE", userName))

                'End If

                If supervisor Then

                    db.ExecuteStoreCommand(String.Format("ALTER SERVER ROLE [securityadmin] ADD MEMBER [{0}]", userName))
                    db.ExecuteStoreCommand(String.Format("ALTER ROLE [{0}] ADD MEMBER [{1}]", DatabaseRoles.db_owner, userName))
                    db.ExecuteStoreCommand(String.Format("ALTER ROLE [{0}] ADD MEMBER [{1}]", DatabaseRoles.settings_menu, userName))

                Else

                    db.ExecuteStoreCommand(String.Format("ALTER SERVER ROLE [securityadmin] DROP MEMBER [{0}]", userName))
                    db.ExecuteStoreCommand(String.Format("ALTER ROLE [{0}] DROP MEMBER [{1}]", DatabaseRoles.db_owner, userName))
                    db.ExecuteStoreCommand(String.Format("ALTER ROLE [{0}] DROP MEMBER [{1}]", DatabaseRoles.settings_menu, userName))

                End If

            End Using

        Catch ex As Exception

            e.Cancel = True
            Throw ex

        End Try

    End Sub

    Protected Sub ASPxCallback_ResetPassword_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_ResetPassword.Callback

        Try

            Using db As New Database

                Dim userName As String = e.Parameter

                db.ExecuteStoreCommand(String.Format("ALTER LOGIN [{0}] WITH PASSWORD=N'{1}'", userName, ASPxTextBox_NewPassword.Value))

                Dim _collectors_tab As collectors_tab = (From o In db.collectors_tab Where o.collect_id = userName Select o).FirstOrDefault
                _collectors_tab.force_change_password = True

                db.SaveChanges()

            End Using

            e.Result = "OK"

        Catch ex As Exception

            e.Result = FaultEngine.HandleException(ex).Message

        End Try

    End Sub

#End Region

End Class

