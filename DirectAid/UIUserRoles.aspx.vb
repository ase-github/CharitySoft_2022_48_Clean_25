Imports System.Linq

Public Class UIUserRoles
    Inherits BaseWebForm

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LinqServerModeDataSource_target_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource_target.Selecting
        e.KeyExpression = "id"

        Dim db As New Database
        Dim roles As New List(Of String)
        Dim userName As String = ASPxComboBox_user_name.Value
        roles = (From o In db.view_user_roles Where o.user_name = userName Select o.id).ToList()
        e.QueryableSource = (From o In db.role_data Where roles.Contains(o.id) Select o)

    End Sub

    Protected Sub LinqServerModeDataSource_source_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource_source.Selecting
        e.KeyExpression = "id"

        Dim db As New Database
        Dim roles As New List(Of String)
        Dim userName As String = ASPxComboBox_user_name.Value
        roles = (From o In db.view_user_roles Where o.user_name = userName Select o.id).ToList()
        e.QueryableSource = (From o In db.role_data Where Not roles.Contains(o.id) Select o)

    End Sub

    Protected Sub ASPxCallback_Add_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Add.Callback

        Try

            Dim selectionList As List(Of Object) = ASPxGridView_Source.GetSelectedFieldValues("id")
            Dim userName As String = ASPxComboBox_user_name.Value

            If selectionList.Count > 0 And Not ASPxComboBox_user_name.Value Is Nothing Then

                Using db As New Database

                    For a = 0 To selectionList.Count - 1

                        Dim role As String = selectionList(a)

                        db.ExecuteStoreCommand(String.Format("ALTER ROLE [{0}] ADD MEMBER [{1}]", role, userName))

                    Next

                End Using

            End If

            e.Result = "OK"

        Catch ex As Exception

            e.Result = ex.Message

        End Try

    End Sub

    Protected Sub ASPxCallback_Remove_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Remove.Callback

        Try

            Dim selectionList As List(Of Object) = ASPxGridView_Target.GetSelectedFieldValues("id")
            Dim userName As String = ASPxComboBox_user_name.Value

            If selectionList.Count > 0 And Not ASPxComboBox_user_name.Value Is Nothing Then

                Using db As New Database

                    For a = 0 To selectionList.Count - 1

                        Dim role As String = selectionList(a)
                        db.ExecuteStoreCommand(String.Format("ALTER ROLE [{0}] DROP MEMBER [{1}]", role, userName))

                    Next

                End Using

            End If

            e.Result = "OK"

        Catch ex As Exception

            e.Result = ex.Message

        End Try

    End Sub

    Protected Sub ASPxComboBox_user_name_ButtonClick(source As Object, e As DevExpress.Web.ButtonEditClickEventArgs) Handles ASPxComboBox_user_name.ButtonClick

        ASPxGridView_Source.DataBind()
        ASPxGridView_Target.DataBind()

        ASPxGridView_Source.Selection.UnselectAll()
        ASPxGridView_Target.Selection.UnselectAll()

    End Sub

#End Region

End Class