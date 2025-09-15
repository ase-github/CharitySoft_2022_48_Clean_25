Imports System.Data.SqlClient
Imports System.Globalization
Imports DevExpress.Web
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView

Public Class UCBeneficiaryScholarshipsV2
    Inherits System.Web.UI.UserControl

#Region "Members"
    Private _ws As New DataAccessLibrary
    Protected _culture As String
    Dim save_ds As New DataSet

    Dim fill_DDL_DS As DataSet
    Dim fill_DDL_DS1 As DataSet
    Dim Param() As Object = {0}
    Dim sql_str As String

#End Region

#Region "Private Methods"
    Sub SearchByCode(ByVal code)

        Try
            Dim sql_str As String
            sql_str = ""

            sql_str = "SELECT * from benf_master where app_ser = " & code


            Dim ds As DataSet
            ds = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
            'Try

            If ds.Tables(0).Rows.Count > 0 Then

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

                Me.txt_app_ser.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("app_ser")), String.Empty, ds.Tables(0).Rows(0).Item("app_ser").ToString())


                ' ''country_code_value = Get_country(If(IsDBNull(ds.Tables(0).Rows(0)("city_dob")), 0, ds.Tables(0).Rows(0)("city_dob")))
                ' ''Me.ddl_nominated_site_country.SelectedValue = country_code_value
                ' ''ddl_nominated_site_country_SelectedIndexChanged(sender, e)
                ' ''Me.ddl_nominated_site_city.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)("city_dob")), Nothing, ds.Tables(0).Rows(0)("city_dob"))

                'fill_scholarship()

                'get_total_fees()
                Session("opr_flag") = 1 'update
                'LockField(txt_app_ser)
                'Me.txt_scholarship_amount.Focus()
            Else
                ShowAlert("لا يوجد بيانات ")
            End If

        Catch ex As Exception
            ShowAlert("حدث خطأ")
        End Try
    End Sub
    Sub ShowAlert(ByVal message As String)
        'ScriptManager.RegisterStartupScript(Me.UpdatePanel1, UpdatePanel1.GetType(), "notificationScript", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "notificationScript111", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
    End Sub
    Sub Fill_status_reason(ByRef combo As ASPxComboBox, ByVal code As Integer)
        'Add code param instead of the hard coded value
        reasons_tab_DS.SelectParameters("reason_cate").DefaultValue = 3
        combo.DataBind()
    End Sub
    Sub Fill_Schools(ByRef combo_schools As ASPxComboBox, ByVal site_type_code As Integer, ByVal school_code As Integer?)
        'To handle the datatype of the combo box
        '-------------------------------------
        combo_schools.ValueType = GetType(Integer)
        '-------------------------------------
        If site_type_code <> -1 Then

            DS_GetSchoolsByType.SelectParameters("type").DefaultValue = site_type_code
            combo_schools.DataBind()

            '--------------------------------
            combo_schools.Value = school_code
            '--------------------------------

        End If

    End Sub
#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        reasons_tab_DS4.ConnectionString = New ConnectionStringEx().TheConnectionString
        reasons_tab_DS5.ConnectionString = New ConnectionStringEx().TheConnectionString
        reasons_tab_DS6.ConnectionString = New ConnectionStringEx().TheConnectionString
        students_scholarship_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        city_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        reasons_tab_DS7.ConnectionString = New ConnectionStringEx().TheConnectionString
        reasons_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        currency_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        pay_method_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        acad_year_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        org_type_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        stud_qualif_type_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        stud_qualif_level_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        stud_prof_types_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        org_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        reasons_tab_DS8.ConnectionString = New ConnectionStringEx().TheConnectionString
        reasons_tab_DS9.ConnectionString = New ConnectionStringEx().TheConnectionString
        reasons_tab_DS10.ConnectionString = New ConnectionStringEx().TheConnectionString
        reasons_tab_DS11.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_GetSchoolsByType.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_Select_students.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_Scholarship_status.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_Scholarship_patterns.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_Scholarship_types.ConnectionString = New ConnectionStringEx().TheConnectionString

        If Not IsPostBack Then
            'Get the Page Culture to pass it to the clien side
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                _culture = "ar"
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                _culture = "en"
            End If

            'Dim builder As New SqlConnectionStringBuilder(ConfigurationManager.ConnectionStrings("charitysoft").ConnectionString)
            'Session("username") = builder.UserID
            'Session("password") = builder.Password
        End If

        txt_app_ser.Text = Request.QueryString(QueryStringKey.OrphanID)

    End Sub



    Protected Sub ASPxGridView4_RowCommand(sender As Object, e As DevExpress.Web.ASPxGridViewRowCommandEventArgs) Handles ASPxGridView4.RowCommand
        If e.CommandArgs.CommandName.ToLower().Equals("stud") Then
            Dim code As Double
            code = Val(e.CommandArgs.CommandArgument)
            SearchByCode(code)
        End If

    End Sub

    Protected Sub LinqDS_Schools_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqDS_Schools.Selecting

        e.KeyExpression = "app_ser"
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


        'Using db As New charitysoftEntities1

        '    e.QueryableSource = (From stud In db.benf_master.AsEnumerable()
        '                  Select name_en = String.Format("{0} {1} {2} {3} {4}", stud.applicant_name_en_1,
        '                                                 stud.applicant_name_en_2, stud.applicant_name_en_3,
        '                                                 stud.applicant_name_en_4, stud.applicant_name_en_5),
        '                          name_ar = String.Format("{0} {1} {2} {3} {4}", stud.applicant_name_ar_1,
        '                                                 stud.applicant_name_ar_2, stud.applicant_name_ar_3,
        '                                                 stud.applicant_name_ar_4, stud.applicant_name_ar_5),
        '                          app_ser = stud.app_ser).AsQueryable()

        'End Using

    End Sub

    Protected Sub ASPxGridView1_CellEditorInitialize(sender As Object, e As DevExpress.Web.ASPxGridViewEditorEventArgs) Handles ASPxGridView1.CellEditorInitialize
        If (Not ASPxGridView1.IsEditing) Then
            Return
        End If
        If e.Column.FieldName.Equals("status_reason") Then
            Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)
            AddHandler combo.Callback, AddressOf cmb_status_reason_CallBack

            Dim grid = e.Column.Grid
            If (Not combo.IsCallback) Then
                Dim val = -1
                If (Not grid.IsNewRowEditing) Then
                    Try
                        val = CInt(Fix(grid.GetRowValues(e.VisibleIndex, "application_status")))
                    Catch ex As ArgumentException
                        'TODO: handling exception
                    End Try
                End If
                Fill_status_reason(combo, val)
            End If
        ElseIf e.Column.FieldName.Equals("nominated_site") Then
            Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)
            combo.ValueType = GetType(Integer)
            AddHandler combo.Callback, AddressOf cmb_nominated_site_CallBack

            Dim grid = e.Column.Grid
            If (Not combo.IsCallback) Then
                Dim val = -1
                Dim school_code As Int32?
                If (Not grid.IsNewRowEditing) Then
                    Try
                        val = CInt(Fix(grid.GetRowValues(e.VisibleIndex, "nominated_site_type")))
                        school_code = CInt(Fix(grid.GetRowValues(e.VisibleIndex, "nominated_site")))
                    Catch ex As ArgumentException
                        'TODO: handling exception
                    End Try
                End If
                Fill_Schools(combo, val, school_code)
            End If
        End If
        If Not ASPxGridView1.IsNewRowEditing And e.Column.FieldName.Equals("scholarship_start_date") Then
            'e.Editor.ReadOnly = Not e.Column.ReadOnly
        End If
        If Not ASPxGridView1.IsNewRowEditing Then
            Dim grid = e.Column.Grid
            Try
                Dim scholarship_start_date As Date = CDate(grid.GetRowValues(e.VisibleIndex, "scholarship_start_date"))
                Dim scholarship_end_date As Date = CDate(grid.GetRowValues(e.VisibleIndex, "scholarship_end_date"))
                Dim scholarship_amount As Decimal = Val(grid.GetRowValues(e.VisibleIndex, "scholarship_amount"))

                Dim Daysperiod = scholarship_end_date.Subtract(scholarship_start_date).TotalDays
                Dim yearsPeriod = Math.Truncate(Daysperiod / 365)

                'Dim row As DataRow = grid.GetRow(e.VisibleIndex)
                'row.Item("transfer_covered_period") = yearsPeriod
                'Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "updatePeriodScript", "alert('" + yearsPeriod.ToString() + "');", True)
                'expectedPeriod.setText('" + yearsPeriod.ToString() + " سنوات');
                'ltrl_updatePeriod.Text = "<script type='text/javascript'></script>"
                'row("transfer_covered_period") = yearsPeriod
                'row("transfer_covered_period")
            Catch ex As Exception

            End Try
        End If
    End Sub

    Private Sub cmb_status_reason_CallBack(sender As Object, e As DevExpress.Web.CallbackEventArgsBase)
        Fill_status_reason(TryCast(sender, ASPxComboBox), e.Parameter)
    End Sub
    Private Sub cmb_nominated_site_CallBack(sender As Object, e As DevExpress.Web.CallbackEventArgsBase)
        Fill_Schools(TryCast(sender, ASPxComboBox), e.Parameter, Nothing)
    End Sub

    Protected Sub hyperLink_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/ScholarshipTransfers.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim scholarship_ser As Double = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_ser").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?sid={1}&t={2}", urlBase, scholarship_ser, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=900,height=400,resizable=no,location=no")
    End Sub

    Protected Sub hyperLink_expenses_Init(sender As Object, e As EventArgs)
        'Dim urlBase = "/Education/ScholarshipExpenses.aspx"
        'Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        'Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        'Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        'Dim scholarship_ser As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_ser").ToString()
        ''Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        ''scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        ''Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        'Dim contentUrl As String = String.Format("{0}?sid={1}&a={2}&t={3}", urlBase, scholarship_ser, scholarship_amount, Guid.NewGuid().ToString())
        'link.NavigateUrl = "javascript:void(0);"
        'link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=700,height=400,resizable=no,location=no")
    End Sub

    Protected Sub ASPxGridView1_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles ASPxGridView1.StartRowEditing

    End Sub

    Protected Sub ASPxGridView1_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles ASPxGridView1.RowValidating

    End Sub

    Protected Sub hyperLink_results_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/DA_Students_Results.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim scholarship_ser As Double = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_ser").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?sid={1}&OrphanID={2}&t={3}", urlBase, scholarship_ser, Request("OrphanID"), Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=900,height=400,resizable=no,location=no")
    End Sub

    Protected Sub hyperLink_Fees_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/ScholarshipExpenses.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim scholarship_ser As Double = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_ser").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?sid={1}&OrphanID={2}&t={3}", urlBase, scholarship_ser, Request("OrphanID"), Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=900,height=400,resizable=no,location=no")
    End Sub


End Class