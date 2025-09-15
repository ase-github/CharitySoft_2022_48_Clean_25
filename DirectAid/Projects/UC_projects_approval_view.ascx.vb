
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView

#End Region

Public Class UC_projects_approval_view
    Inherits System.Web.UI.UserControl

#Region "Fields"

    Private _UseAsComponent As Boolean = False

#End Region

#Region "Properties"

    Public Property UseAsComponent As Boolean

        Get

            Return _UseAsComponent

        End Get

        Set(value As Boolean)

            _UseAsComponent = value

        End Set

    End Property

#End Region

#Region "Methods"

    Private Sub Loading()


    End Sub

    Public Function OK() As Boolean

        Dim re As Boolean = False

        Try

            For a = 0 To ASPxGridView1.VisibleRowCount - 1

                Dim approved As Boolean = DirectCast(ASPxGridView1.FindRowCellTemplateControl(a, ASPxGridView1.Columns("approved"), "approved"), DevExpress.Web.ASPxCheckBox).Value
                Dim over_reason As String = DirectCast(ASPxGridView1.FindRowCellTemplateControl(a, ASPxGridView1.Columns("over_reason"), "over_reason"), DevExpress.Web.ASPxTextBox).Value

                SqlDataSource_OK.UpdateParameters("approved").DefaultValue = Convert.ToString(approved)
                SqlDataSource_OK.UpdateParameters("over_reason").DefaultValue = over_reason

                SqlDataSource_OK.Update()

            Next

            SqlDataSource_OK.InsertParameters("aloc_bat").DefaultValue = Session("batch_id")
            SqlDataSource_OK.InsertParameters("current_flag").DefaultValue = Session("current_flag")
            SqlDataSource_OK.Insert()
            re = True

        Catch ex As Exception

            Throw ex

        End Try

        Return re

    End Function

    Public Function Cancel() As Boolean

        Dim re As Boolean = False

        Try

            SqlDataSource_Cancel.Insert()
            re = True

        Catch ex As Exception

            Throw ex

        End Try

        Return re

    End Function

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ASPxButton_OK_Click(sender As Object, e As EventArgs)

        If OK() Then

            Response.Write("<script type='text/javascript'> window.close(); </script>")

        End If

    End Sub

    Protected Sub ASPxButton_Cancel_Click(sender As Object, e As EventArgs)

        If Cancel() Then

            Response.Write("<script type='text/javascript'> window.close(); </script>")

        End If

    End Sub

    Protected Sub ASPxCallback_OK_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_OK.Callback

        e.Result = OK()


    End Sub

    Protected Sub ASPxCallback_Cancel_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Cancel.Callback

        e.Result = Cancel().ToString()

    End Sub

#End Region

End Class