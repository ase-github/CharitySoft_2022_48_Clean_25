
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

#End Region

Public Class ReceiptCancellation
    Inherits BaseWebForm

#Region "Fields"

    Protected _culture As String

    Dim WS As New DataAccessLibrary

    Private _ws As New DataAccessLibrary

#End Region

#Region "Methods"

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim receiptID As Int32 = 0
            Dim branchID As Int16 = Session(SessionKey.BRANCH_ID)

            Int32.TryParse(Request.QueryString(QueryStringKey.ReceiptID), receiptID)

            If receiptID <> 0 Then

                ASPxTextBox_reciept_num.Value = receiptID

                Using db As New Database

                    Dim _donation_tran As donation_tran = (From o In db.donation_tran
                                                           Where o.reciept_num = receiptID _
                                                           And o.branch = branchID _
                                                           And Not o.reciept_date Is Nothing _
                                                           And o.reciept_date.Value.Year = DateTime.Now.Year _
                                                           And o.reciept_date.Value.Month = DateTime.Now.Month _
                                                           And o.reciept_date.Value.Day = DateTime.Now.Day _
                                                           Select o).FirstOrDefault

                    If Not _donation_tran Is Nothing Then

                        ASPxTextBox_reciept_num.ReadOnly = True

                        ASPxButton_New.Visible = True
                        Btn_Search.Visible = False

                        reciept_num_manual.Value = _donation_tran.reciept_num_manual
                        reciept_date.Value = _donation_tran.reciept_date.Value.ToString("yyyy-MM-dd")

                        Dim donor_id_Value As Int32 = _donation_tran.donor_id

                        donor_id.Value = (From o In db.view_donor_list Where o.donor_id = donor_id_Value Select o.donor_namear).FirstOrDefault()

                        total_amount.Value = _donation_tran.total_amount.Value.ToString("n3")

                        Dim currency_code_Value As Short? = _donation_tran.currency_code
                        Dim branch_Value As Short? = _donation_tran.branch
                        Dim user_id_Value As String = _donation_tran.user_id

                        currency_code.Value = (From o In db.currency_tab Where o.currency_code = currency_code_Value Select o.currency_descrar).FirstOrDefault()
                        branch.Value = (From o In db.branches Where o.branch_id = branch_Value Select o.branch_descar).FirstOrDefault()
                        user_id.Value = (From o In db.collectors_tab Where o.collect_id = user_id_Value Select o.collect_namear).FirstOrDefault()

                        If _donation_tran.void = 2 Then

                            ASPxButton_Save.Visible = False
                            ASPxLabel_MSG_Success.Visible = True

                        Else

                            'ASPxButton_Save.Visible = True

                            End If

                        End If

                End Using

            End If

        End If

    End Sub

    Protected Sub Btn_Search_Click(sender As Object, e As EventArgs) Handles Btn_Search.Click

        Response.Redirect(String.Format("ReceiptCancellation.aspx?{0}={1}", QueryStringKey.ReceiptID, ASPxTextBox_reciept_num.Value))

    End Sub

    Protected Sub ASPxButton_New_Click(sender As Object, e As EventArgs) Handles ASPxButton_New.Click

        Response.Redirect("ReceiptCancellation.aspx")

    End Sub

    Protected Sub ASPxButton_Save_Click(sender As Object, e As EventArgs) Handles ASPxButton_Save.Click

        'Try

        '    If ASPxTextBox_reciept_num.ReadOnly Then

        '        Using db = New Database

        '            Dim receiptID As Int32 = 0

        '            Int32.TryParse(ASPxTextBox_reciept_num.Value, receiptID)

        '            db.void_collection_SameBranchAndDate(receiptID, Session(SessionKey.USERNAME).ToString())

        '        End Using

        '    End If

        '    Response.Redirect(String.Format("ReceiptCancellation.aspx?{0}={1}", QueryStringKey.ReceiptID, ASPxTextBox_reciept_num.Value))

        'Catch ex As Exception

        '    ASPxLabel_MSG_Failure.Visible = True

        'End Try

    End Sub

#End Region

End Class