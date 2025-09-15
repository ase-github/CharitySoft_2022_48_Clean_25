
Imports System.ComponentModel
Imports System.Data.SqlClient

<DataObject()>
Public Class UCProjectConstructionListV1
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


    End Sub

    Protected Sub LinqServerModeDataSource1_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource1.Selecting

        e.KeyExpression = "project_id"

        Dim db As New Database

        e.QueryableSource = (From o In db.view_project_list Where o.project_class <> 5 Select o)

    End Sub


#End Region

End Class