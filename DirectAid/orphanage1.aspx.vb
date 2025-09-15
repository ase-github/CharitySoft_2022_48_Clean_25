Imports System
Imports System.Globalization
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

Public Class orphanage1
    Inherits BaseWebForm


    Protected _culture As String

    Dim WS As New DataAccessLibrary


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try




            If Not IsPostBack Then

                'Get the Page Culture to pass it to the clien side
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                    _culture = "ar"

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    _culture = "en"

                End If

                'For Testing, username and password must be enter from Login Form
                'Session("username") = "sa"
                'Session("password") = "pass@word1"

                Session("Toolbar_Flag") = 0
                'Me.Literal1.Text = ""

                'Fill DropdownLists
                Fill_DDL()



                Me.txt_orphanage_code.Attributes.Add("onkeydown", "Search();")

            End If




        Catch ex As Exception

        End Try
    End Sub

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
            Case "TextBox"
                CType(control, TextBox).Text = ""
            Case "DropDownList"
                CType(control, DropDownList).SelectedIndex = 0
            Case "DataGrid"
                CType(control, DataGrid).DataSource = Nothing
                control.DataBind()

            Case Else
        End Select

    End Sub

    Public Sub Fill_DDL()
        Dim DDL_DS As DataSet
        Dim SQL As String


        'Session("username") = "sa"
        'Session("password") = "pass@word1"


        'Fill center_supervisors 
        SQL = "select * from supervisors"

        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_supervisor_name.DataSource = DDL_DS.Tables(0)
        ddl_supervisor_name.DataTextField = "emp_name_ar"
        ddl_supervisor_name.DataValueField = "emp_code"
        ddl_supervisor_name.DataBind()
        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill Center 
        SQL = "select * from center_tab"

        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_center_id.DataSource = DDL_DS.Tables(0)
        ddl_center_id.DataTextField = "center_namear"
        ddl_center_id.DataValueField = "center_code"
        ddl_center_id.DataBind()
        DDL_DS.Clear()
        DDL_DS = Nothing
    End Sub

    Private Sub lnk_new_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_new.ServerClick

        'clear screen
        Clear_Frm(Me)


        Session("Toolbar_Flag") = 0
        'Me.Literal1.Text = ""
        Me.txt_orphanage_code.Enabled = False

    End Sub

    Private Sub lnk_save_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_save.ServerClick
        Dim format1 As New System.Globalization.CultureInfo("fr-FR", True)

        Dim Orphans_Dar As DataSet


        If String.IsNullOrWhiteSpace(Me.txt_Orphanage_name.Text) Then
            ShowAlert("ادخل الاسم المهجع")
            Exit Sub
        End If


        If (Me.ddl_center_id.SelectedValue < 0) Then
            ShowAlert("ادخل الجنسية")
            Exit Sub
        End If

        If (Me.ddl_supervisor_name.SelectedValue < 0) Then
            ShowAlert("ادخل اسم المسؤول")
            Exit Sub
        End If


        If String.IsNullOrWhiteSpace(Me.txt_orphans_count.Text) Then
            ShowAlert("ادخل عدد الايتام")
            Exit Sub
        End If


        Dim orphanParam() As Object = {IIf(String.IsNullOrWhiteSpace(Me.txt_Orphanage_name.Text), "", Me.txt_Orphanage_name.Text),
                                                         Convert.ToInt32(Me.ddl_center_id.SelectedValue),
                                                         IIf(String.IsNullOrWhiteSpace(Me.txt_orphans_count.Text), 0, Me.txt_orphans_count.Text),
                                                          Convert.ToInt32(Me.ddl_supervisor_name.SelectedValue),
                                                         If(String.IsNullOrWhiteSpace(Me.txt_space.Text), 0, Me.txt_space.Text),
                                                     IIf(String.IsNullOrWhiteSpace(Me.txt_capacity.Text), 0, Me.txt_capacity.Text),
                                                          IIf(String.IsNullOrWhiteSpace(Me.txt_beds_count.Text), 0, Me.txt_beds_count.Text),
                                                         Convert.ToInt32(Me.ddl_beds_status.SelectedIndex),
                                                          Convert.ToInt32(Me.ddl_matt_status.SelectedIndex),
                                                         IIf(String.IsNullOrWhiteSpace(Me.txt_nets_count.Text), 0, Me.txt_nets_count.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_cabinets_count.Text), 0, Me.txt_cabinets_count.Text)}





        If Session("Toolbar_Flag") = 0 Then

            'Conditions

            ' save new row   

            Orphans_Dar = WS.ExecSpResultSet("charitysoft", Session(SessionKey.USERNAME), Session(SessionKey.PASSWORD), "usp_orphanage_tabInsert", CommandType.StoredProcedure, orphanParam)
            Me.txt_orphanage_code.Text = Orphans_Dar.Tables(0).Rows(0)(0)

            If Orphans_Dar.Tables(0).Rows.Count <> 0 Then

                ShowAlert("تم الحفظ")
            Else
                ShowAlert("خطأ")
            End If




        ElseIf Session("Toolbar_Flag") = 1 Then
            orphanParam = {IIf(String.IsNullOrWhiteSpace(Me.txt_orphanage_code.Text), "", Me.txt_orphanage_code.Text),
                                                        IIf(String.IsNullOrWhiteSpace(txt_Orphanage_name.Text), "", Me.txt_Orphanage_name.Text),
                                                       Convert.ToInt32(Me.ddl_center_id.SelectedValue),
                                                        IIf(String.IsNullOrWhiteSpace(Me.txt_orphans_count.Text), 0, Me.txt_orphans_count.Text),
                                                          Convert.ToInt32(Me.ddl_supervisor_name.SelectedValue),
                                                        If(String.IsNullOrWhiteSpace(Me.txt_space.Text), 0, Me.txt_space.Text),
                                                     IIf(String.IsNullOrWhiteSpace(Me.txt_capacity.Text), 0, Me.txt_capacity.Text),
                                                          IIf(String.IsNullOrWhiteSpace(Me.txt_beds_count.Text), 0, Me.txt_beds_count.Text),
                                                         Convert.ToInt32(Me.ddl_beds_status.SelectedIndex),
                                                          Convert.ToInt32(Me.ddl_matt_status.SelectedIndex),
                                                         IIf(String.IsNullOrWhiteSpace(Me.txt_nets_count.Text), 0, Me.txt_nets_count.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_cabinets_count.Text), 0, Me.txt_cabinets_count.Text)}




            WS.ExecSp("charitysoft", Session(SessionKey.USERNAME), Session(SessionKey.PASSWORD), "usp_orphanage_tabUpdate", CommandType.StoredProcedure, orphanParam)


            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                ShowAlert("تم الحفظ ")
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                ShowAlert("Saved Successfully")
            End If


        End If



        Try
            ' cmd.ExecuteNonQuery()
        Catch exp As SqlException
        End Try
    End Sub

    Private Sub lnk_search_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search.ServerClick
        'clear screen
        Clear_Frm(Me)
        Me.txt_orphanage_code.Focus()


        Session("Toolbar_Flag") = 1
        Me.txt_orphanage_code.Enabled = True

    End Sub

    Private Sub lnk_search_rtn_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search_rtn.ServerClick

        Dim BenefParam As Object
        Dim BenefMaster_DS As DataSet

        If txt_orphanage_code.Text = "" Or Val(txt_orphanage_code.Text) < 0 Then
            ShowAlert("الرجاء ادخال رقم المهجع")
        End If


        BenefParam = {Me.txt_orphanage_code.Text}

        BenefMaster_DS = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "usp_orphanage_tabSelect", ServiceReference.CommandType.StoredProcedure, BenefParam)


        If BenefMaster_DS.Tables(0).Rows.Count > 0 Then

            Me.txt_orphanage_code.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(0)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(0))
            Me.txt_Orphanage_name.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(1)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(1))
            Me.ddl_center_id.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(2)), Nothing.Empty, BenefMaster_DS.Tables(0).Rows(0)(2))
            Me.txt_orphans_count.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(3)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(3))
            Me.ddl_supervisor_name.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(4)), Nothing.Empty, BenefMaster_DS.Tables(0).Rows(0)(4))
            Me.txt_space.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(5)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(5))
            Me.txt_capacity.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(6)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(6))
            Me.txt_beds_count.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(7)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(7))
            Me.ddl_beds_status.SelectedIndex = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(8)), 0, BenefMaster_DS.Tables(0).Rows(0)(8))
            Me.ddl_matt_status.SelectedIndex = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(9)), 0, BenefMaster_DS.Tables(0).Rows(0)(9))
            Me.txt_nets_count.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(10)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(10))
            Me.txt_cabinets_count.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(11)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(11))

            Session("Toolbar_Flag") = 1
        Else
            Session("Toolbar_Flag") = 0
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                ShowAlert("لا يوجد بيانات مطابقة")
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                ShowAlert("No Data")

            End If



        End If
    End Sub

    Sub ShowAlert(ByVal message As String)
        ScriptManager.RegisterStartupScript(Me.UpdatePanel, UpdatePanel.GetType(), "notificationScript", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
    End Sub

    Protected Sub FillSupervisorTypeCombo(ByVal cmb As ASPxComboBox, ByVal SupervisorType As String)

        If String.IsNullOrEmpty(SupervisorType) Then
            Return
        End If

        Dim Supervisor As Dictionary(Of Int16, String) = GetSupervisors(SupervisorType)

        cmb.Items.Clear()
        For i As Integer = 0 To Supervisor.Keys.Count - 1
            cmb.Items.Add(Supervisor(Supervisor.Keys()(i)), Supervisor.Keys()(i))
        Next i

    End Sub

    Private Function GetSupervisors(ByVal supervisor_type As String) As Dictionary(Of Int16, String)
        Dim list As New Dictionary(Of Int16, String)
        dts_supervisor_combo.SelectParameters(0).DefaultValue = supervisor_type
        Dim view As DataView = CType(dts_supervisor_combo.Select(DataSourceSelectArguments.Empty), DataView)
        For i As Integer = 0 To view.Count - 1
            list.Add(view(i)(0), view(i)(1))
        Next i
        Return list
    End Function

    Private Sub cmbSupervisorCode_OnCallback(ByVal source As Object, ByVal e As CallbackEventArgsBase)
        FillSupervisorTypeCombo(TryCast(source, ASPxComboBox), e.Parameter)
    End Sub

    Private Sub grd_visits_CellEditorInitialize(sender As Object, e As DevExpress.Web.ASPxGridViewEditorEventArgs) Handles grd_visits.CellEditorInitialize
        'If (Not grd_hobby.IsEditing) OrElse e.Column.FieldName <> "hobby_code" Then
        '    Return
        'End If
        'If e.KeyValue Is DBNull.Value OrElse e.KeyValue Is Nothing Then
        '    Return
        'End If
        'Dim val As Object = grd_hobby.GetRowValuesByKeyValue(e.KeyValue, "hobby_type")
        'If val Is DBNull.Value Then
        '    Return
        'End If
        'Dim HType As String = CStr(val)

        'Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)
        'FillHobbyTypeCombo(combo, HType)

        'AddHandler combo.Callback, AddressOf cmbHobbyCode_OnCallback


        Dim supervisor_name As New GridViewDataComboBoxColumn
        supervisor_name = DirectCast(grd_visits.Columns("supervisior_name"), GridViewDataComboBoxColumn)
        supervisor_name.PropertiesComboBox.DataSourceID = "dts_supervisor_combo"

        If (Not grd_visits.IsEditing) OrElse e.Column.FieldName <> "supervisor_type" Then
            Return
        End If
        'If e.KeyValue Is DBNull.Value OrElse e.KeyValue Is Nothing Then
        '    Return
        'End If

        Dim val As Object = grd_visits.GetRowValuesByKeyValue(e.KeyValue, "supervisor_type")
        If val Is DBNull.Value Then
            Return
        End If

        Dim country As String = CStr(val)

        Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)

        FillSupervisorTypeCombo(combo, country)

        AddHandler combo.Callback, AddressOf cmbSupervisorCode_OnCallback
    End Sub

    Private Sub grd_visits_RowUpdated(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatedEventArgs) Handles grd_visits.RowUpdated

        Dim Supervisor_name As New GridViewDataComboBoxColumn
        Supervisor_name = DirectCast(grd_visits.Columns("supervisior_name"), GridViewDataComboBoxColumn)
        Supervisor_name.PropertiesComboBox.DataSourceID = "dts_supervisor"
    End Sub

    Protected Sub grd_visits_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles grd_visits.StartRowEditing

        Dim Supervisor_name As New GridViewDataComboBoxColumn
        Supervisor_name = DirectCast(grd_visits.Columns("supervisior_name"), GridViewDataComboBoxColumn)
        Supervisor_name.PropertiesComboBox.DataSourceID = "dts_supervisor_combo"
    End Sub

End Class

