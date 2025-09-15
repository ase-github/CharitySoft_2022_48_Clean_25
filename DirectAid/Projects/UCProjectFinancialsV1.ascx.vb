
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView

#End Region

Public Class UCProjectFinancialsV1
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SqlDataSource1.ConnectionString = New ConnectionStringEx().TheConnectionString

        Select Case Convert.ToByte(Request.QueryString("TheType"))

            Case 1
                ASPxGridView1.Caption = "المصروفات التأسيسيه المتوقعه"
                ASPxGridView1.Columns("LocalOrImported").Visible = False
                ASPxGridView1.Columns("UnitType").Visible = False

            Case 2
                ASPxGridView1.Caption = "المصروفات التشغيليه المتوقعه"

            Case 3
                ASPxGridView1.Caption = "المصروفات الاداريه المتوقعه"
                ASPxGridView1.Columns("LocalOrImported").Visible = False
                ASPxGridView1.Columns("UnitType").Visible = False

            Case 4
                ASPxGridView1.Caption = "الايرادات المتوقعه"
                ASPxGridView1.Columns("LocalOrImported").Visible = False

            Case 5
                ASPxGridView1.Caption = "المصروفات التأسيسيه الفعليه"
                ASPxGridView1.Columns("LocalOrImported").Visible = False
                ASPxGridView1.Columns("UnitType").Visible = False

            Case 6
                ASPxGridView1.Caption = "المصروفات التشغيليه الفعليه"

            Case 7
                ASPxGridView1.Caption = "المصروفات الاداريه"
                ASPxGridView1.Columns("LocalOrImported").Visible = False
                ASPxGridView1.Columns("UnitType").Visible = False

            Case 8
                ASPxGridView1.Caption = "الايرادات الفعليه"
                ASPxGridView1.Columns("LocalOrImported").Visible = False

        End Select

    End Sub

#End Region

End Class