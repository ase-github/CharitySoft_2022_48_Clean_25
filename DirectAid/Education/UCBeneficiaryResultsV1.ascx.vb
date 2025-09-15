Imports System.Globalization
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic
Imports System
Imports System.Data
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
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxClasses
Imports DevExpress.Web

Public Class UCBeneficiaryResultsV1
    Inherits System.Web.UI.UserControl


#Region "Memebers"
    Private _ws As New DataAccessLibrary
    Protected _culture As String
#End Region

#Region "Methods"
    Public Shared Function FormatDate(ByVal textbox As TextBox) As String

        Dim DateForm As New System.Globalization.CultureInfo("ar-KW", True)

        Try
            If String.IsNullOrWhiteSpace(textbox.Text) Then
                Return Format(DateTime.Parse("1900/01/01 12:00 PM", DateForm), "yyyy/MM/dd hh:mm tt")
            Else
                Return Format(DateTime.Parse(textbox.Text, DateForm), "yyyy/MM/dd")
            End If
        Catch ex As Exception

        End Try

    End Function

    Public Shared Sub clear_frm(ByVal container As Control)
        Dim control As Control
        For Each control In container.Controls
            If (control.ID <> "txt_user_id") Or (control.ID <> "ddlLanguage") Then
                clearcontrol(control)
                If control.HasControls() Then
                    clear_frm(control)
                End If
            End If
        Next
    End Sub

    Public Shared Sub clearcontrol(ByRef control As Control)
        Select Case control.GetType.Name
            Case "TextBox"
                CType(control, TextBox).Text = ""
            Case "DropDownList"

                If CType(control, DropDownList).SelectedIndex = -1 Then
                    CType(control, DropDownList).SelectedIndex = -1
                Else
                    CType(control, DropDownList).SelectedIndex = 0
                End If

            Case "CheckBox"
                If CType(control, CheckBox).Checked Then
                    CType(control, CheckBox).Checked = False

                End If
            Case "GridView"
                CType(control, GridView).DataSource = Nothing
                CType(control, GridView).DataBind()
        End Select
    End Sub

    Sub ShowAlert(ByVal message As String)
        'ScriptManager.RegisterStartupScript(Me.UpdatePanel3, UpdatePanel3.GetType(), "notificationScript", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "notificationScript111", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
    End Sub

    Private Function GetOrgType(ByVal org_type As String) As Dictionary(Of Int16, String)
        Dim list As New Dictionary(Of Int16, String)
        SqlDataSource_OrgName.SelectParameters(0).DefaultValue = org_type
        Dim view As DataView = CType(SqlDataSource_OrgName.Select(DataSourceSelectArguments.Empty), DataView)
        For i As Integer = 0 To view.Count - 1
            list.Add(view(i)(0), view(i)(1))
        Next i
        Return list
    End Function

    Private Sub cmbCity_OnCallback(ByVal source As Object, ByVal e As CallbackEventArgsBase)
        FillCityCombo(TryCast(source, ASPxComboBox), e.Parameter)
    End Sub

    Protected Sub FillCityCombo(ByVal combo As ASPxComboBox, ByVal code As String)
        If code <> -1 Then
            SqlDataSource_OrgName_All.SelectParameters("type").DefaultValue = code
            combo.DataBind()
        End If
        'If String.IsNullOrEmpty(country) Then
        '    Return
        'End If

        'Dim cities As Dictionary(Of Int16, String) = GetOrgType(country)

        'cmb.Items.Clear()
        'For i As Integer = 0 To cities.Keys.Count - 1
        '    cmb.Items.Add(cities(cities.Keys()(i)), cities.Keys()(i))
        'Next i
    End Sub

    Sub SearchByCode(ByVal code)
        Try
            Dim sql_str As String
            sql_str = ""

            sql_str = "SELECT * from benf_master where app_ser = " & code

            Dim ds As DataSet
            ds = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
            'Try

            If ds.Tables(0).Rows.Count > 0 Then

                'Me.txt_applicant_name_ar_1.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_1")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_1").ToString())
                'Me.txt_applicant_name_ar_2.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_2")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_2").ToString())
                'Me.txt_applicant_name_ar_3.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_3")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_3").ToString())
                'Me.txt_applicant_name_ar_4.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_4")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_4").ToString())
                'Me.txt_applicant_name_ar_5.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_5")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_5").ToString())
                'Me.txt_applicant_name_en_1.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_1")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_1").ToString())
                'Me.txt_applicant_name_en_2.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_2")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_2").ToString())
                'Me.txt_applicant_name_en_3.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_3")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_3").ToString())
                'Me.txt_applicant_name_en_4.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_4")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_4").ToString())
                'Me.txt_applicant_name_en_5.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_5")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_5").ToString())

                Me.txt_applicant_name_ar.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_1")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_1").ToString()) & " " &
              If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_2")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_2").ToString()) & " " &
              If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_3")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_3").ToString()) & " " &
              If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_4")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_4").ToString()) & " " &
              If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_5")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_5").ToString())

                Me.txt_applicant_name_en.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_1")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_1").ToString()) & " " &
                If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_2")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_2").ToString()) & " " &
                If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_3")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_3").ToString()) & " " &
                If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_4")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_4").ToString()) & " " &
                If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_5")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_5").ToString())

                txt_app_ser.Text = ds.Tables(0).Rows(0).Item("app_ser")

                Session("opr_flag") = 2 'update
                'LockField(txt_app_ser)
            Else
                ShowAlert("لا يوجد بيانات ")
            End If


        Catch ex As Exception
            ShowAlert("حدث خطأ")
        End Try
    End Sub
#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        students_results_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        acad_year_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        stud_prof_types_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_study_level.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_study_category.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_study_branch.ConnectionString = New ConnectionStringEx().TheConnectionString
        SqlDataSource_OrgType.ConnectionString = New ConnectionStringEx().TheConnectionString
        SqlDataSource_OrgName.ConnectionString = New ConnectionStringEx().TheConnectionString
        SqlDataSource_OrgName_All.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_Select_students.ConnectionString = New ConnectionStringEx().TheConnectionString

        Try

            If Not IsPostBack And Not Page.IsCallback Then

                ASPxHiddenField1.Set("value", 0)

            End If


            If Not IsPostBack Then
                'Get the Page Culture to pass it to the clien side
                CultureInfo.CurrentUICulture.Name.Contains("ar")
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    _culture = "ar"
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    _culture = "en"
                End If

                'Dim builder As New SqlConnectionStringBuilder(ConfigurationManager.ConnectionStrings("charitysoft").ConnectionString)
                'Session("username") = builder.UserID
                'Session("password") = builder.Password

                A5_ServerClick(sender, e)

                Me.txt_app_ser.Attributes.Add("onKeydown", "srch_rtn();")
            End If
            txt_app_ser.Text = Request.QueryString(QueryStringKey.OrphanID)


        Catch ex As Exception

        End Try
    End Sub

    Private Sub lnk_new_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnk_new.ServerClick
        Session("opr_flag") = 1
        'LockField(Me.txt_app_ser)
        clear_frm(Me)
        Me.txt_applicant_name_ar.Focus()
    End Sub

    Private Sub A5_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles A5.ServerClick
        clear_frm(Me)
        Session("opr_flag") = 3
        'UnLockField(Me.txt_app_ser)
        Me.txt_app_ser.Focus()
    End Sub

    Private Sub A_search_Click(ByVal sender As Object, ByVal e As EventArgs) Handles A_search.Click
        If Session("opr_flag") = 3 Then

            SearchByCode(Val(Me.txt_app_ser.Text))


        Else
        End If

    End Sub


    Protected Sub A2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles A2.Click
        Me.txt_app_ser.Text = Val(Session("app_ser_from_srch"))
        A_search_Click(sender, e)

    End Sub

    Private Sub grid_ParseValue(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles grid.ParseValue
        If Val(txt_app_ser.Text) > 0 Then
            If e.FieldName.Equals("result_score") Then
                If (e.Value <> Nothing And e.Value <> "") Then
                    Dim age As Decimal = 0
                    If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), age)) Then
                        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                            Throw New Exception("خطأ في ادخال حقل النتيجة ، يسمح ارقام فقط")
                        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                            Throw New Exception("Result must be an ineteger value.")
                        End If

                    End If
                End If
            End If
            'If e.FieldName.Equals("terms_result") Then
            '    Dim term_result As Integer = 0
            '    If e.Value Is Nothing OrElse (Not Integer.TryParse(e.Value.ToString(), term_result)) Then
            '        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
            '            Throw New Exception("خطأ في ادخال حقل نتيجة الفصل ، يسمح ارقام فقط")
            '        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
            '            Throw New Exception("terms result must be an ineteger value.")
            '        End If

            '    End If
            'End If
        End If
    End Sub
    Private Sub grid_RowValidating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles grid.RowValidating
        Dim result As Decimal = 0
        Dim term_result As Decimal = 0
        If e.NewValues("result_score") Is Nothing Then
            Decimal.TryParse(String.Empty, result)
        Else
            Decimal.TryParse(e.NewValues("result_score").ToString(), result)
        End If
        If result < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("Result must be greater than or equal Zero")
        End If

        'If e.NewValues("terms_result") Is Nothing Then
        '    Integer.TryParse(String.Empty, term_result)
        'Else
        '    Integer.TryParse(e.NewValues("terms_result").ToString(), term_result)
        'End If
        'If term_result < 0 Then
        '    'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
        '    Throw New Exception("term_result must be greater than or equal Zero")
        'End If

    End Sub
    Protected Sub grid_CellEditorInitialize(ByVal sender As Object, ByVal e As ASPxGridViewEditorEventArgs) Handles grid.CellEditorInitialize
        If (Not grid.IsEditing) Then
            Return
        End If
        If e.Column.FieldName.Equals("org_name") Then
            Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)
            AddHandler combo.Callback, AddressOf cmbCity_OnCallback

            Dim grid = e.Column.Grid
            If (Not combo.IsCallback) Then
                Dim val = -1
                If (Not grid.IsNewRowEditing) Then
                    Try
                        val = CInt(Fix(grid.GetRowValues(e.VisibleIndex, "org_type")))
                    Catch ex As ArgumentException
                        'TODO: handling exception
                    End Try
                End If
                FillCityCombo(combo, val)
            End If
        End If

        'insert values into comboBox ProductLine on edit mode:
        'If grid.IsEditing AndAlso Not grid.IsNewRowEditing AndAlso e.Column.FieldName = "org_name" Then
        '    If e.KeyValue Is DBNull.Value OrElse e.KeyValue Is Nothing Then
        '        Return
        '    End If
        '    Dim val As Object = grid.GetRowValuesByKeyValue(e.KeyValue, "org_type")
        '    If val Is DBNull.Value Then
        '        Return
        '    End If
        '    Dim orgType As String = val.ToString()
        '    Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)
        '    FillCityCombo(combo, orgType)
        '    AddHandler combo.Callback, AddressOf cmbCity_OnCallback

        'End If

        ''insert values into comboBox ProductLine on NEW ROW mode:
        'If grid.IsNewRowEditing AndAlso e.Column.FieldName = "org_name" Then

        '    Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)
        '    AddHandler combo.Callback, AddressOf cmbCity_OnCallback
        '    Dim val As Object = grid.GetRowValuesByKeyValue(e.KeyValue, "org_type")
        '    Dim orgType As String = If((val Is DBNull.Value OrElse val Is Nothing), "", val.ToString())
        '    FillCityCombo(combo, orgType)

        'End If


        'Dim org_name As GridViewDataComboBoxColumn = DirectCast(grid.Columns("org_name"), GridViewDataComboBoxColumn)
        'org_name.PropertiesComboBox.DataSourceID = "SqlDataSource_OrgName"

        ''If (Not grid.IsEditing) OrElse e.Column.FieldName <> "org_name" Then
        ''    Return
        ''End If

        'If e.Column.FieldName <> "org_name" Then
        '    Return
        'End If

        'If e.KeyValue Is DBNull.Value OrElse e.KeyValue Is Nothing Then
        '    Return
        'End If

        'Dim val As Object = grid.GetRowValuesByKeyValue(e.KeyValue, "org_type")
        'If val Is DBNull.Value Then
        '    Return
        'End If

        'Dim country As String = CStr(val)

        'Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)

        'FillCityCombo(combo, country)

        'AddHandler combo.Callback, AddressOf cmbCity_OnCallback


    End Sub

    Protected Sub grid_RowUpdated(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatedEventArgs) Handles grid.RowUpdated
        'Dim org_name As New GridViewDataComboBoxColumn
        'org_name = DirectCast(grid.Columns("org_name"), GridViewDataComboBoxColumn)
        'org_name.PropertiesComboBox.DataSourceID = "SqlDataSource_OrgName_All"
    End Sub

    Protected Sub grid_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles grid.StartRowEditing

        'Dim org_name As New GridViewDataComboBoxColumn
        'org_name = DirectCast(grid.Columns("org_name"), GridViewDataComboBoxColumn)
        'org_name.PropertiesComboBox.DataSourceID = "SqlDataSource_OrgName"

        'ASPxHiddenField1.Set("value", grid.GetRowValuesByKeyValue(e.EditingKeyValue, "org_type"))
        'Dim cbo As ASPxComboBox = DirectCast(grid.FindEditRowCellTemplateControl(Nothing, "ASPxComboBox_org_type"), ASPxComboBox)
        'cbo.Value = ASPxHiddenField1.Get("value")

    End Sub

    Protected Sub grid_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles grid.RowInserting

        'e.NewValues.Remove("org_type")

        'Dim x As Integer = 1
        ''e.NewValues("org_name") = grid.getro
        'Dim y As Integer = e.NewValues("academic_year")

        'Dim x1 As New DevExpress.Web.GridViewDataComboBoxColumn
        'x1 = grid.Columns("org_name")
        'x1 = DirectCast(grid.Columns("org_name"), DevExpress.Web.GridViewDataComboBoxColumn)

    End Sub

    Protected Sub grid_RowInserted(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertedEventArgs) Handles grid.RowInserted

    End Sub

    Protected Sub SqlDataSource_OrgName_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource_OrgName.Selecting

        'e.Command.Parameters(0).Value = ASPxHiddenField1.Get("value")

    End Sub

    Protected Sub grid_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles grid.RowUpdating

        'e.NewValues.Remove("org_type")

    End Sub

    Protected Sub ASPxGridView1_RowCommand(sender As Object, e As DevExpress.Web.ASPxGridViewRowCommandEventArgs) Handles ASPxGridView2.RowCommand
        If e.CommandArgs.CommandName.ToLower().Equals("stud") Then
            Dim code As Double
            code = Val(e.CommandArgs.CommandArgument)
            SearchByCode(code)
        End If

    End Sub

    Protected Sub LinqDS_Schools_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqDS_Schools.Selecting

        Dim context = CharityEFDBContext.CurrentContext()
        Dim dataEnum = (From stud In context.benf_master
                        Where stud.app_type = 1 And stud.application_status_stud_orp = 2
                        Select stud).AsEnumerable()
        e.QueryableSource = (From stud In dataEnum
                             Select name_en = String.Format("{0} {1} {2} {3} {4}", stud.applicant_name_en_1,
                                                            stud.applicant_name_en_2, stud.applicant_name_en_3,
                                                            stud.applicant_name_en_4, stud.applicant_name_en_5),
                                     name_ar = String.Format("{0} {1} {2} {3} {4}", stud.applicant_name_ar_1,
                                                            stud.applicant_name_ar_2, stud.applicant_name_ar_3,
                                                            stud.applicant_name_ar_4, stud.applicant_name_ar_5),
                                     app_ser = stud.app_ser).AsQueryable()


        e.KeyExpression = "app_ser"
    End Sub

#End Region


End Class