
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

Public Class NewDonationsMaster
    Inherits BaseWebForm

#Region "Fields"

    Protected _culture As String

    Dim WS As New DataAccessLibrary

    Private _ws As New DataAccessLibrary

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
    Sub SearchDonation(ByVal code As Integer)
        Dim DonCod As Object
        Dim DOnation_DS As DataSet

        If Session("app_ser_from_srch") <> "" Then
            Me.txtdonCode.Text = Session("app_ser_from_srch")
        End If


        DonCod = Me.txtdonCode.Text
        DOnation_DS = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonations", CommandType.StoredProcedure, DonCod)


        If DOnation_DS.Tables(0).Rows.Count > 0 Then

            Me.txtDonArabicName.Value = DOnation_DS.Tables(0).Rows(0)("donation_descrar")
            Me.TxtDOnEngName.Value = DOnation_DS.Tables(0).Rows(0)("donation_descreng")
            Me.cmbAccNum.Value = DOnation_DS.Tables(0).Rows(0)("account_num")
            Me.cmbDim1.Value = DOnation_DS.Tables(0).Rows(0)("dimension1")
            Me.cmbDim2.Value = DOnation_DS.Tables(0).Rows(0)("dimension2")
            Me.cmbDim4.Value = DOnation_DS.Tables(0).Rows(0)("dimension3")
            Me.cmbDIm5.Value = DOnation_DS.Tables(0).Rows(0)("dimension4")
            Me.cmbDonType.Value = DOnation_DS.Tables(0).Rows(0)("donation_cat")
            ASPxCheckBox_ApplyCurrencyConversion.Value = DOnation_DS.Tables(0).Rows(0)("ApplyCurrencyConversion")
            ASPxCheckBox_Active.Value = DOnation_DS.Tables(0).Rows(0)("Active")

        End If

        Session("app_ser_from_srch") = ""
        Session("orphans_app_ser") = Me.txtdonCode.Text

    End Sub

    Sub UpdateSourceTargetGrids()

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        dontCateg.ConnectionString = New ConnectionStringEx().TheConnectionString
        'DsAccountNum.ConnectionString = New ConnectionStringEx().TheConnectionString
        'Dsdim1.ConnectionString = New ConnectionStringEx().TheConnectionString
        'Dsdim2.ConnectionString = New ConnectionStringEx().TheConnectionString
        DsSearchID.ConnectionString = New ConnectionStringEx().TheConnectionString

        If Not IsPostBack Then
            Try
                'for testing 
                'Session("username") = "sa"
                'Session("password") = "pass@word1"

                'If (IsPostBack) Then

                'Else

                'End If
                'Fill_DDL()
            Catch ex As Exception

            End Try
        End If
    End Sub

    'Protected Sub ASPxComboBox_ListType_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ASPxComboBox_user_name.SelectedIndexChanged

    '    ASPxGridView_Source.DataBind()
    '    ' ASPxGridView_Target.DataBind()

    '    ASPxGridView_Source.Selection.UnselectAll()
    '    ' ASPxGridView_Target.Selection.UnselectAll()

    'End Sub


    Protected Sub txtdonCode_TextChanged(sender As Object, e As EventArgs) Handles txtdonCode.TextChanged
        UpdateSourceTargetGrids()
    End Sub

    Protected Sub txtdonCode_ValueChanged(sender As Object, e As EventArgs) Handles txtdonCode.ValueChanged

    End Sub

    Protected Sub Btn_Search_Click(sender As Object, e As EventArgs) Handles Btn_Search.Click
        If CmbSearchId.SelectedIndex <> -1 Then
            Me.txtdonCode.Text = CmbSearchId.SelectedItem.Value
            SearchDonation(Me.txtdonCode.Text)
            UpdateSourceTargetGrids()
        End If
    End Sub

    Protected Sub ASPxButton_New_Click(sender As Object, e As EventArgs) Handles ASPxButton_New.Click
        Clear_Frm(Me)
        UpdateSourceTargetGrids()
    End Sub

    Protected Sub ASPxButton_Save_Click(sender As Object, e As EventArgs) Handles ASPxButton_Save.Click
        If Me.txtDonArabicName.Text = "" Then

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('Please Enter Donation Arabic Name')", True)

            Exit Sub
        End If

        If Me.TxtDOnEngName.Text = "" Then

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('Please Enter Donation English Name')", True)

            Exit Sub
        End If

        'If Not IsNumeric(txtBasicVal.Text) Then

        '    Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('Please Enter Standard Value')", True)

        '    Exit Sub
        'End If

        If cmbAccNum.SelectedIndex = -1 Then

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('Please Select Account Number')", True)

            Exit Sub
        End If

        If cmbDim1.SelectedIndex = -1 Then

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('Please Select Dimension1')", True)

            Exit Sub
        End If

        If cmbDim2.SelectedIndex = -1 Then

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('Please Select Dimension2')", True)

            Exit Sub
        End If
        If txtdonCode.Text = "" Then


            Using db As New Database
                Dim _newDonation As donation = New donation()
                _newDonation.donation_cat = cmbDonType.Value
                _newDonation.donation_descrar = txtDonArabicName.Value
                _newDonation.donation_descreng = TxtDOnEngName.Value
                '_newDonation.donation_standard_value = Decimal.Parse(txtBasicVal.Text)
                _newDonation.account_num = cmbAccNum.Value
                _newDonation.dimension1 = cmbDim1.Value
                _newDonation.dimension2 = cmbDim2.Value
                _newDonation.dimension3 = Nothing
                _newDonation.dimension4 = cmbDim4.Value
                _newDonation.dimension5 = cmbDIm5.Value
                _newDonation.donation_code = (From o In db.donations Select o.donation_code).DefaultIfEmpty(0).Max() + 1
                _newDonation.ApplyCurrencyConversion = ASPxCheckBox_ApplyCurrencyConversion.Value
                _newDonation.Active = ASPxCheckBox_Active.Value
                db.donations.AddObject(_newDonation)
                db.SaveChanges()
                txtdonCode.Text = _newDonation.donation_code
            End Using

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('تم الحفظ بنجاح')", True)


        Else
            Using db As New Database
                Dim doncode = Val(txtdonCode.Text)
                Dim _newDonation As donation = (From don In db.donations
                                                Where don.donation_code = doncode).FirstOrDefault()
                If Not _newDonation Is Nothing Then
                    _newDonation.donation_cat = cmbDonType.Value
                    _newDonation.donation_descrar = txtDonArabicName.Value
                    _newDonation.donation_descreng = TxtDOnEngName.Value
                    '_newDonation.donation_standard_value = Decimal.Parse(txtBasicVal.Text)
                    _newDonation.account_num = cmbAccNum.Value
                    _newDonation.dimension1 = cmbDim1.Value
                    _newDonation.dimension2 = cmbDim2.Value
                    _newDonation.dimension3 = Nothing
                    _newDonation.dimension4 = cmbDim4.Value
                    _newDonation.dimension5 = cmbDIm5.Value
                    _newDonation.ApplyCurrencyConversion = ASPxCheckBox_ApplyCurrencyConversion.Value
                    _newDonation.Active = ASPxCheckBox_Active.Value

                    db.SaveChanges()
                    Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('تم الحفظ بنجاح')", True)
                End If
            End Using
        End If
        UpdateSourceTargetGrids()
    End Sub

#End Region

End Class