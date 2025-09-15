
#Region "Imports Directives"

Imports DevExpress.Web.ASPxEditors
Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class UIEventList
    Inherits BaseWebForm

#Region "Methods"


#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub LinqServerModeDataSource1_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource1.Selecting

        e.KeyExpression = "event_id"

        Dim db As New Database

        e.QueryableSource = (From o In db.event_mast Select o)


    End Sub

#End Region

End Class