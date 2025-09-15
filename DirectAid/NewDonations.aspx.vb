
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

Public Class NewDonations
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
        Dim SQL As String


        If Session("app_ser_from_srch") <> "" Then
            Me.txtdonCode.Text = Session("app_ser_from_srch")
        End If




        DonCod = Me.txtdonCode.Text
        DOnation_DS = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonations", CommandType.StoredProcedure, DonCod)





        If DOnation_DS.Tables(0).Rows.Count > 0 Then

            Me.txtDonArabicName.Text = If(IsDBNull(DOnation_DS.Tables(0).Rows(0)(0)), String.Empty, DOnation_DS.Tables(0).Rows(0)(0))
            Me.TxtDOnEngName.Text = If(IsDBNull(DOnation_DS.Tables(0).Rows(0)(1)), String.Empty, DOnation_DS.Tables(0).Rows(0)(1))
            Dim s As Decimal = If(IsDBNull(DOnation_DS.Tables(0).Rows(0)(2)), 0, DOnation_DS.Tables(0).Rows(0)(2))
            Me.txtBasicVal.Text = If(IsDBNull(DOnation_DS.Tables(0).Rows(0)(2)), 0, DOnation_DS.Tables(0).Rows(0)(2))
            Me.cmbAccNum.Text = If(IsDBNull(DOnation_DS.Tables(0).Rows(0)(3)), String.Empty, DOnation_DS.Tables(0).Rows(0)(3))
            Me.cmbDim1.Text = If(IsDBNull(DOnation_DS.Tables(0).Rows(0)(4)), String.Empty, DOnation_DS.Tables(0).Rows(0)(4))
            Me.cmbDim2.Text = If(IsDBNull(DOnation_DS.Tables(0).Rows(0)(5)), String.Empty, DOnation_DS.Tables(0).Rows(0)(5))
            Me.cmbDim4.Text = If(IsDBNull(DOnation_DS.Tables(0).Rows(0)(6)), String.Empty, DOnation_DS.Tables(0).Rows(0)(6))
            Me.cmbDIm5.Text = If(IsDBNull(DOnation_DS.Tables(0).Rows(0)(7)), String.Empty, DOnation_DS.Tables(0).Rows(0)(7))
            Me.cmbDonType.SelectedIndex = If(IsDBNull(DOnation_DS.Tables(0).Rows(0)(8)), String.Empty, DOnation_DS.Tables(0).Rows(0)(8))

        End If


        Session("app_ser_from_srch") = ""
        Session("orphans_app_ser") = Me.txtdonCode.Text

    End Sub

    Sub UpdateSourceTargetGrids()
        LinqServerModeDataSource_source.DataBind()
        ASPxGridView_Source.DataBind()
        LinqServerModeDataSource_target.DataBind()
        ASPxGridView_Target.DataBind()
    End Sub


    Public Sub Fill_DDL()
        Dim DDL_DS As DataSet
        Dim SQL As String
        Dim SQL1 As String
        Dim sql2 As String
        Dim sql3 As String
        'Session("username") = "sa"
        'Session("password") = "pass@word1"

        SQL1 = " select Mainaccount.MainAccountId from DynamicsAX..Mainaccount  inner Join "
        sql2 = " DynamicsAX..MAINACCOUNTcATEGORY  ON DynamicsAX..Mainaccount.ACCOUNTCATEGORYREF=DynamicsAX..MAINACCOUNTcATEGORY.ACCOUNTCATEGORYREF "
        sql3 = " WHERE DynamicsAX..Mainaccount.ACCOUNTCATEGORYREF IN(15,16,4)"
        ',"11,12)"
        SQL = SQL1 + sql2 + sql3
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.cmbAccNum.DataSource = DDL_DS.Tables(0)
        'cmbAccNum.DataTextField = "accountnum"
        ' cmbAccNum.DataValueField = "MainAccountId"
        cmbAccNum.ValueField = "MainAccountId"
        cmbAccNum.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        dontCateg.ConnectionString = New ConnectionStringEx().TheConnectionString
        DsAccountNum.ConnectionString = New ConnectionStringEx().TheConnectionString
        Dsdim1.ConnectionString = New ConnectionStringEx().TheConnectionString
        Dsdim2.ConnectionString = New ConnectionStringEx().TheConnectionString
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

    Protected Sub LinqServerModeDataSource_target_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource_target.Selecting
        e.KeyExpression = "nat_code"
        Dim donID = -5000
        If txtdonCode.Text <> "" Then
            donID = Val(txtdonCode.Text)
        End If
        Dim db As New Database
        Dim countries As New List(Of Short)
        ' Dim userName As String = ASPxComboBox_user_name.Value

        countries = (From o In db.donations_rates Where o.donation_code = donID Select o.nat_code).ToList()
        e.QueryableSource = (From o In db.nat_tab Where countries.Contains(o.nat_code) Select o)



    End Sub

    Protected Sub LinqServerModeDataSource_source_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource_source.Selecting
        e.KeyExpression = "nat_code"
        Dim donID = -5000
        If txtdonCode.Text <> "" Then
            donID = Val(txtdonCode.Text)
        End If

        Dim db As New Database
        Dim countries As New List(Of Short)
        ' Dim userName As String = ASPxComboBox_user_name.Value

        countries = (From o In db.donations_rates Where o.donation_code = donID Select o.nat_code).ToList()
        e.QueryableSource = (From o In db.nat_tab Where Not countries.Contains(o.nat_code) Select o)


    End Sub

    'Protected Sub ASPxComboBox_ListType_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ASPxComboBox_user_name.SelectedIndexChanged

    '    ASPxGridView_Source.DataBind()
    '    ' ASPxGridView_Target.DataBind()

    '    ASPxGridView_Source.Selection.UnselectAll()
    '    ' ASPxGridView_Target.Selection.UnselectAll()

    'End Sub

    Protected Sub ASPxCallback_Add_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Add.Callback


        If (txtdonCode.Text <> "") Then
            Try
                Dim selectionList As List(Of Object) = ASPxGridView_Source.GetSelectedFieldValues("nat_code")

                If selectionList.Count > 0 Then

                    Using db As New Database

                        For a = 0 To selectionList.Count - 1

                            Dim _donation_rates As New donations_rates
                            ' _user_country_relationship.user_name = ASPxComboBox_user_name.Value
                            _donation_rates.nat_code = selectionList(a)
                            _donation_rates.donation_code = Val(txtdonCode.Text)
                            _donation_rates.donation_standard_value = Val(txtBasicVal.Text)
                            _donation_rates.target_quantity = Val(txttargetVal.Text)
                            'TODO: Other fields
                            db.donations_rates.AddObject(_donation_rates)

                        Next

                        db.SaveChanges()

                    End Using

                End If

                e.Result = "OK"

            Catch ex As Exception

                e.Result = ex.Message

            End Try
        End If


    End Sub

    Protected Sub ASPxCallback_Remove_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Remove.Callback
        If (txtdonCode.Text <> "") Then
            Try

                Dim selectionList As List(Of Object) = ASPxGridView_Target.GetSelectedFieldValues("nat_code")
                ' Dim userName As String = ASPxComboBox_user_name.Value

                If selectionList.Count > 0 Then

                    Using db As New Database

                        For a = 0 To selectionList.Count - 1
                            Dim DonID = Val(txtdonCode.Text)
                            Dim nat_code As Short = selectionList(a)
                            Dim _donation_rates As donations_rates = (From o In db.donations_rates Where o.nat_code = nat_code And o.donation_code = DonID Select o).FirstOrDefault()

                            If Not _donation_rates Is Nothing Then

                                db.donations_rates.DeleteObject(_donation_rates)

                            End If

                        Next

                        db.SaveChanges()

                    End Using

                End If

                e.Result = "OK"

            Catch ex As Exception

                e.Result = ex.Message

            End Try
        End If


    End Sub

    Protected Sub txttarget_TextChanged(sender As Object, e As EventArgs) Handles txtBasicVal.TextChanged

    End Sub

    Protected Sub ASPxButton_Add_Click(sender As Object, e As EventArgs) Handles ASPxButton_Add.Click

    End Sub

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

        If Not IsNumeric(txtBasicVal.Text) Then

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('Please Enter Standard Value')", True)

            Exit Sub
        End If

        If cmbAccNum.SelectedIndex = -1 Then

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('Please Select Account Number')", True)

            Exit Sub
        End If

        If cmbDim1.SelectedIndex = -1 Then

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('Please Select DImension1')", True)

            Exit Sub
        End If

        If cmbDim2.SelectedIndex = -1 Then

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('Please Select DImension2')", True)

            Exit Sub
        End If
        If txtdonCode.Text = "" Then


            Using db As New Database
                Dim _newDonation As donation = New donation()
                _newDonation.donation_cat = Convert.ToInt16(cmbDonType.SelectedIndex)
                _newDonation.donation_descrar = txtDonArabicName.Text
                _newDonation.donation_descreng = TxtDOnEngName.Text
                _newDonation.donation_standard_value = Decimal.Parse(txtBasicVal.Text)
                _newDonation.account_num = cmbAccNum.Text
                _newDonation.dimension1 = cmbDim1.Text
                _newDonation.dimension2 = cmbDim2.Text
                _newDonation.dimension3 = ""
                _newDonation.dimension4 = cmbDim4.Text
                _newDonation.dimension5 = cmbDIm5.Text
                'Dim _newdoncode = db.donations.Max(Function(o) o.donation_code) + 1
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
                    _newDonation.donation_cat = Convert.ToInt16(cmbDonType.SelectedIndex)
                    _newDonation.donation_descrar = txtDonArabicName.Text
                    _newDonation.donation_descreng = TxtDOnEngName.Text
                    _newDonation.donation_standard_value = Decimal.Parse(txtBasicVal.Text)
                    _newDonation.account_num = cmbAccNum.Text
                    _newDonation.dimension1 = cmbDim1.Text
                    _newDonation.dimension2 = cmbDim2.Text
                    _newDonation.dimension3 = ""
                    _newDonation.dimension4 = cmbDim4.Text
                    _newDonation.dimension5 = cmbDIm5.Text

                    db.SaveChanges()
                    Page.ClientScript.RegisterStartupScript(Me.GetType(), "show_alert", "alert('تم الحفض بنجاح')", True)
                End If
            End Using
        End If
        UpdateSourceTargetGrids()
    End Sub

#End Region

End Class