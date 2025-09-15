Imports System.Linq

Public Class UI_user_country_relationship
    Inherits BaseWebForm

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LinqServerModeDataSource_target_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource_target.Selecting
        e.KeyExpression = "nat_code"

        Dim db As New Database
        Dim countries As New List(Of Short?)
        Dim userName As String = ASPxComboBox_user_name.Value
        countries = (From o In db.user_country_relationship Where o.user_name = userName Select o.nat_code).ToList()
        e.QueryableSource = (From o In db.nat_tab Where countries.Contains(o.nat_code) Select o)
    End Sub

    Protected Sub LinqServerModeDataSource_source_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource_source.Selecting
        e.KeyExpression = "nat_code"

        Dim db As New Database
        Dim countries As New List(Of Short?)
        Dim userName As String = ASPxComboBox_user_name.Value
        countries = (From o In db.user_country_relationship Where o.user_name = userName Select o.nat_code).ToList()
        e.QueryableSource = (From o In db.nat_tab Where Not countries.Contains(o.nat_code) Select o)

    End Sub

    Protected Sub ASPxCallback_Add_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Add.Callback

        Try

            Dim selectionList As List(Of Object) = ASPxGridView_Source.GetSelectedFieldValues("nat_code")

            If selectionList.Count > 0 Then

                Using db As New Database

                    For a = 0 To selectionList.Count - 1

                        Dim _user_country_relationship As New user_country_relationship
                        _user_country_relationship.user_name = ASPxComboBox_user_name.Value
                        _user_country_relationship.nat_code = selectionList(a)
                        db.user_country_relationship.AddObject(_user_country_relationship)

                    Next

                    db.SaveChanges()

                End Using

            End If

            e.Result = "OK"

        Catch ex As Exception

            e.Result = ex.Message

        End Try

    End Sub

    Protected Sub ASPxCallback_Remove_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Remove.Callback

        Try

            Dim selectionList As List(Of Object) = ASPxGridView_Target.GetSelectedFieldValues("nat_code")
            Dim userName As String = ASPxComboBox_user_name.Value

            If selectionList.Count > 0 Then

                Using db As New Database

                    For a = 0 To selectionList.Count - 1

                        Dim nat_code As Short = selectionList(a)
                        Dim _user_country_relationship As user_country_relationship = (From o In db.user_country_relationship Where o.user_name = userName And o.nat_code = nat_code Select o).FirstOrDefault()

                        If Not _user_country_relationship Is Nothing Then

                            db.user_country_relationship.DeleteObject(_user_country_relationship)

                        End If

                    Next

                    db.SaveChanges()

                End Using

            End If

            e.Result = "OK"

        Catch ex As Exception

            e.Result = ex.Message

        End Try

    End Sub

    Protected Sub ASPxComboBox_user_name_ButtonClick(source As Object, e As DevExpress.Web.ButtonEditClickEventArgs) Handles ASPxComboBox_user_name.ButtonClick

        If Not ASPxComboBox_user_name.Value Is Nothing Then

            ASPxGridView_Source.DataBind()
            ASPxGridView_Target.DataBind()

            ASPxGridView_Source.Selection.UnselectAll()
            ASPxGridView_Target.Selection.UnselectAll()

        End If

    End Sub

#End Region

End Class