
#Region "Imports Directives"

Imports System.Globalization
Imports System.Linq
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxClasses
Imports Microsoft.VisualBasic
Imports System.Configuration
Imports System.Collections
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxCallbackPanel
Imports DevExpress.Web

#End Region

Public Class SearchRecpt
    Inherits BaseWebForm

#Region "Fields"

    Private _ws As New DataAccessLibrary

    Protected _culture As String

    Dim WS As New DataAccessLibrary

#End Region

#Region "Methods"

    Sub Clear_Frm(ByVal container As Control)

        Dim control As Control

        For Each control In container.Controls

            ClearControl(control)

            If control.HasControls() Then
                Clear_Frm(control)
            End If
        Next
    End Sub

    Sub ClearControl(ByRef control As Control)
        'other types can obviously be put in if necessary
        Select Case control.GetType.Name
            Case "ASPxTextBox"
                CType(control, ASPxTextBox).Text = ""
            Case "ASPxComboBox"
                CType(control, ASPxComboBox).SelectedIndex = -1
                ' Case "DataGrid"
                ' CType(control, DataGrid).DataSource = Nothing
                ' control.DataBind()

            Case Else
        End Select

    End Sub

    Private Sub LoadReceipt()

        Dim receiptID As Int32 = 0

        Int32.TryParse(Request.QueryString(QueryStringKey.ReceiptID), receiptID)

        If receiptID <> 0 Then

            ASPxTextBox_reciept_num.Value = receiptID

            Using db As New Database

                Dim _donation_tran As donation_tran = (From o In db.donation_tran Where o.reciept_num = receiptID Select o).FirstOrDefault

                If Not _donation_tran Is Nothing Then

                    ASPxTextBox_reciept_num.ReadOnly = True
                    ASPxButton_New.Visible = True
                    Btn_Search.Visible = False

                    If _donation_tran.void = 2 Then

                        ASPxButton_Save.Visible = False

                    Else
                        If Session(SessionKey.USERNAME).ToString = "a.sumait" Or Session(SessionKey.USERNAME).ToString = "f.essa" Or Session(SessionKey.USERNAME).ToString = "Ayman.Tharwat" Or Session(SessionKey.USERNAME).ToString = "ayman.tharwat2" Then
                            ASPxButton_Save.Visible = True
                        End If
                    End If

                    Dim _collectors_tab As collectors_tab = (From o In db.collectors_tab Where o.collect_id = _donation_tran.user_id Select o).FirstOrDefault

                    txtAddedDate.Text = _donation_tran.act_date
                    txtAddedBy.Text = _collectors_tab.collect_namear

                End If

            End Using

            Grd_DonorDetail.DataBind()
            Grd_DOnations.DataBind()
            Grd_PayMethods.DataBind()




        End If

    End Sub

    Private Sub NewReceipt()

        ASPxTextBox_reciept_num.ReadOnly = False
        ASPxButton_New.Visible = False
        Btn_Search.Visible = True
        ASPxButton_Save.Visible = False
        ASPxTextBox_reciept_num.Value = Nothing

        'txtAddedDate.Value = Nothing
        'txtAddedBy.Value = Nothing

        Clear_Frm(Me)

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            LoadReceipt()

        End If

    End Sub

    Protected Sub Btn_Search_Click(sender As Object, e As EventArgs) Handles Btn_Search.Click

        Response.Redirect(String.Format("SearchRecpt.aspx?{0}={1}", QueryStringKey.ReceiptID, ASPxTextBox_reciept_num.Value))

    End Sub

    Protected Sub ASPxButton_New_Click(sender As Object, e As EventArgs) Handles ASPxButton_New.Click

        Response.Redirect("SearchRecpt.aspx")

    End Sub

    Protected Sub ASPxButton_Save_Click(sender As Object, e As EventArgs) Handles ASPxButton_Save.Click

        Try

            If ASPxTextBox_reciept_num.ReadOnly Then

                Using db = New Database

                    Dim receiptID As Int32 = 0

                    Int32.TryParse(ASPxTextBox_reciept_num.Value, receiptID)

                    db.void_collection(receiptID, Session(SessionKey.USERNAME).ToString())

                End Using

            End If

            Response.Redirect(String.Format("SearchRecpt.aspx?{0}={1}", QueryStringKey.ReceiptID, ASPxTextBox_reciept_num.Value))

        Catch ex As Exception

            'ASPxLabel_MSG_Failure.Visible = True

        End Try

    End Sub

#End Region

End Class