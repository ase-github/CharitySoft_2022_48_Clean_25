
#Region "Imports Directives"

Imports DevExpress.Web.ASPxEditors
Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports System.Linq

#End Region

Public Class ReceiptList
    Inherits BaseWebForm

#Region "Methods"

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ASPxGridView1.Columns(String.Format("donor_name{0}", Session(SessionKey.CULTURE_ISO))).Visible = True

    End Sub

    Protected Sub LinqServerModeDataSource1_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource1.Selecting

        e.KeyExpression = "reciept_num"

        Dim db As New Database

        Dim user_id As String = Session(SessionKey.USERNAME)

        e.QueryableSource = (From o In db.view_receipt_list Where o.user_id = user_id Select o)

    End Sub

#End Region

End Class