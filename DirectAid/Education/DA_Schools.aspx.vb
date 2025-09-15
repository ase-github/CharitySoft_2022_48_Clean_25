Imports System.Globalization
Imports System.Data.SqlClient
Imports CruxLibrary
Imports DevExpress.Web.ASPxEditors



Public Class DA_Schools
    Inherits BaseWebForm

#Region "Private Members"
    Private _ws As New DataAccessLibrary
    Protected _culture As String
    'fill dataset
    Dim fill_DDL_DS As DataSet
    Dim Param() As Object = {0}
    Dim sql_str As String
    Dim form_load As Boolean
    Protected _selectedacadyearcode As String

#End Region


#Region "Public and Private Methods"
    Sub SearchByCode(ByVal school_code As Double)
        Dim country_code_value As Integer
        Try
            Dim sql_str As String
            sql_str = ""

            sql_str = "SELECT * from school_master where school_code = " & school_code

            Dim ds As DataSet
            ds = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
            'Try

            If ds.Tables(0).Rows.Count > 0 Then
                Me.txt_school_code.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("school_code")), String.Empty, ds.Tables(0).Rows(0).Item("school_code"))
                Me.txt_school_name_ar.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("school_name_ar")), String.Empty, ds.Tables(0).Rows(0).Item("school_name_ar").ToString())
                Me.txt_school_name_en.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("school_name_en")), String.Empty, ds.Tables(0).Rows(0).Item("school_name_en"))
                country_code_value = Get_country(If(IsDBNull(ds.Tables(0).Rows(0)("country_city")), 0, ds.Tables(0).Rows(0)("country_city")))

                ddl_country_name.SelectedValue = country_code_value
                'ddl_country_name_SelectedIndexChanged(sender, e)


                ddl_country_city.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)("country_city")), Nothing, ds.Tables(0).Rows(0)("country_city"))
                If Val(Me.ddl_country_city.SelectedValue) > 0 Then

                    Get_district(Me.ddl_country_city.SelectedValue)
                Else
                    Me.txt_district.Text = "لا يوجد"
                End If

                'ddl_country_district.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)("country_district")), Nothing, ds.Tables(0).Rows(0)("country_district"))
                txt_country_village.Text = If(IsDBNull(ds.Tables(0).Rows(0)("country_village")), String.Empty, ds.Tables(0).Rows(0)("country_village"))
                ddl_school_center.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)("school_center")), Nothing, ds.Tables(0).Rows(0)("school_center"))
                ddl_school_category.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)("school_category")), Nothing, ds.Tables(0).Rows(0)("school_category"))

                txt_est_year.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("est_year")), String.Empty, ds.Tables(0).Rows(0).Item("est_year").ToString())
                'txt_opening_date.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("opening_date")), String.Empty, CDate(ds.Tables(0).Rows(0).Item("opening_date")).ToString("yyyy/MM/dd"))

                'If Not IsDate(ds.Tables(0).Rows(0).Item("opening_date")) Then
                '    If IsDBNull(ds.Tables(0).Rows(0).Item("opening_date")) Then
                '        txt_opening_date100.Text = ""
                '    End If
                'Else
                '    If ds.Tables(0).Rows(0).Item("opening_date") = "1900/01/01 12:00 PM" Then
                '        txt_opening_date100.Text = ""
                '    Else
                '        txt_opening_date100.Text = Format(ds.Tables(0).Rows(0).Item("opening_date"), "dd/MM/yyyy")
                '    End If
                'End If
                If (Not IsDBNull(ds.Tables(0).Rows(0).Item("opening_date"))) Then
                    If (ds.Tables(0).Rows(0).Item("opening_date") <> "01/01/1900") Then
                        txt_opening_date.Value = ds.Tables(0).Rows(0).Item("opening_date")
                    End If
                Else
                    ds.Tables(0).Rows(0).Item("opening_date") = "01/01/1900"
                End If
                'txt_opening_date.Value = IIf(ds.Tables(0).Rows(0).Item("opening_date") = "01/01/1900", String.Empty, ds.Tables(0).Rows(0).Item("opening_date"))

                txt_school_proj_num.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("school_proj_num")), String.Empty, ds.Tables(0).Rows(0).Item("school_proj_num").ToString())
                DDL_school_language.Text = If(IsDBNull(ds.Tables(0).Rows(0)("school_language")), Nothing, ds.Tables(0).Rows(0)("school_language"))
                txt_years_num.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("years_num")), String.Empty, ds.Tables(0).Rows(0).Item("years_num").ToString())
                txt_school_tel.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("school_tel")), String.Empty, ds.Tables(0).Rows(0).Item("school_tel").ToString())

                txt_school_mobile.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("school_mobile")), String.Empty, ds.Tables(0).Rows(0).Item("school_mobile").ToString())
                txt_school_fax.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("school_fax")), String.Empty, ds.Tables(0).Rows(0).Item("school_fax").ToString())
                txt_school_email.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("school_email")), String.Empty, ds.Tables(0).Rows(0).Item("school_email").ToString())
                ddl_managed_by.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)("managed_by")), Nothing, ds.Tables(0).Rows(0)("managed_by"))
                txt_site_name.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("site_name")), String.Empty, ds.Tables(0).Rows(0).Item("site_name").ToString())

                rdo_ownership_1.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0).Item("ownership_1")), 0, ds.Tables(0).Rows(0).Item("ownership_1"))
                rdo_registered_1.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0).Item("registered_1")), 0, ds.Tables(0).Rows(0).Item("registered_1"))
                rdo_certifictae_1.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0).Item("certifictae_1")), 0, ds.Tables(0).Rows(0).Item("certifictae_1"))

                ddl_acad_year_start.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)("acad_year_start")), Nothing, ds.Tables(0).Rows(0)("acad_year_start"))
                ddl_acad_year_end.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)("acad_year_end")), Nothing, ds.Tables(0).Rows(0)("acad_year_end"))
                Try
                    ddl_terms_num.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)("terms_num")), Nothing, ds.Tables(0).Rows(0)("terms_num"))
                Catch ex As Exception

                End Try


                Me.txt_school_website.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("school_website")), String.Empty, ds.Tables(0).Rows(0).Item("school_website").ToString())
                Me.txt_notes_1.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("notes_1")), String.Empty, ds.Tables(0).Rows(0).Item("notes_1").ToString())
                ddl_site_type.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)("site_type")), Nothing, ds.Tables(0).Rows(0)("site_type"))

                If Val(IIf(IsDBNull(ds.Tables(0).Rows(0).Item("school_related_to_da")), 0, ds.Tables(0).Rows(0).Item("school_related_to_da"))) > 0 Then
                    Me.chk_school_related_to_da.Checked = IIf((ds.Tables(0).Rows(0).Item("school_related_to_da") = 1), True, False)
                Else
                    chk_school_related_to_da.Checked = False
                End If


                LockField(Me.txt_school_code)
                Session("opr_flag") = 2 'update
                txt_school_name_ar.Focus()
            Else
                ShowAlert("لا يوجد بيانات")
            End If


        Catch ex As Exception
            ShowAlert("حدث خطأ")
        End Try
    End Sub

    Sub Get_district(ByVal city_nm As String)
        Dim sql_str As String
        sql_str = ""


        sql_str = "SELECT governrate_name_ar,governrate_name_en from city"
        sql_str += " inner join governrate on  city.governrte = governrate.governrate_id"
        sql_str += " where city.city_id = " & Val(city_nm)

        Dim ds As DataSet
        ds = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
        'Try

        If ds.Tables(0).Rows.Count > 0 Then
            If Culture = "Arabic (Kuwait)" Then
                Me.txt_district.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("governrate_name_ar")), String.Empty, ds.Tables(0).Rows(0).Item("governrate_name_ar").ToString())
                'Me.ddl_country_name.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)("nat_code")), Nothing, ds.Tables(0).Rows(0)("nat_code"))
            ElseIf Culture = "English (United States)" Then
                Me.txt_district.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("governrate_name_en")), String.Empty, ds.Tables(0).Rows(0).Item("governrate_name_en").ToString())
                'Me.ddl_country_name.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)("nat_code")), Nothing, ds.Tables(0).Rows(0)("nat_code"))
            End If
            'Session("opr_flag") = 2 'update
        End If

    End Sub

    Function Get_country(ByVal city_nm As String) As Integer
        Dim sql_str As String
        sql_str = ""
        Dim cntry_code_val As Integer
        cntry_code_val = 0
        If Val(city_nm) > 0 Then
            'dd.Items.Clear()
            ddl_country_city.Items.Clear()

            sql_str = "SELECT city_name_ar, city_name_en, governrte, nat_city from city "
            sql_str += " where city_id = " & Val(city_nm)


            fill_DDL_DS = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
            If fill_DDL_DS.Tables(0).Rows.Count > 0 Then
                cntry_code_val = If(IsDBNull(fill_DDL_DS.Tables(0).Rows(0)("nat_city")), 0, fill_DDL_DS.Tables(0).Rows(0)("nat_city"))
            End If
        End If
        Return cntry_code_val

    End Function

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

    Public Shared Sub LockField(ByVal control As TextBox)

        control.Enabled = False
        control.BackColor = Drawing.Color.LightYellow
        control.ForeColor = Drawing.Color.Navy

    End Sub

    Public Shared Sub UnLockField(ByVal control As TextBox)

        control.Enabled = True
        control.BackColor = Drawing.Color.White

    End Sub

    ''' <summary>
    ''' This method is change the mode of the page for creating a new record
    ''' </summary>
    ''' <remarks>
    ''' orp_flag is changed to new ====> 1
    ''' Form is cleared
    ''' Focus is switched to school name
    ''' </remarks>
    Private Sub CreateNew()
        Session("opr_flag") = 1
        ddl_country_city.Items.Clear()
        clear_frm(Me)



        txt_school_code.Enabled = False
        txt_school_code.BackColor = Drawing.Color.LightYellow
        txt_school_code.ForeColor = Drawing.Color.Navy
        Me.txt_opening_date.Value = Nothing
        txt_school_name_ar.Focus()
    End Sub
#End Region


#Region "Events"

    ''' <summary>
    ''' Event called when page is loaded and doing the following
    ''' if the page is not post back:
    ''' 1-checking the culture
    ''' 2-setting session username and password
    ''' 3-setting focus on school name control
    ''' 4-calling CreateNew sub
    ''' 5-Attaching attribute onkeydown to the search control
    ''' </summary>
    ''' <param name="sender"></param>
    ''' <param name="e"></param>
    ''' <remarks></remarks>
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
        
            If Not IsPostBack Then
                txt_school_name_ar.Focus()

                CreateNew()

                If Request.QueryString("code") <> "" Then
                    SearchByCode(Val(Request.QueryString("code")))
                    'Session("opr_flag") = 3
                End If
                'Get the Page Culture to pass it to the clien side
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    _culture = "ar"

                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                    _culture = "en"

                End If


                'Me.MultiView1.ActiveViewIndex = 0

                ''For Testing, username and password must be enter from Login Form
                'Dim builder As New SqlConnectionStringBuilder(ConfigurationManager.ConnectionStrings("charitysoft").ConnectionString)
                'Session("username") = builder.UserID
                'Session("password") = builder.Password

                'txt_system_date.Text = DateTime.Now.ToString("dd/MM/yyyy")

                ''Changed from calling the event directly to call a sub doing the same job under the event

                ''lnk_new_ServerClick(sender, e)
                'initialize_DDL()
                Me.txt_school_code.Attributes.Add("onKeydown", "srch_rtn();")
            End If






        Catch ex As Exception

        End Try
    End Sub

    'Sub initialize_DDL()
    '    'fill country 
    '    'fill_DDL_DS = New DataSet
    '    form_load = False
    '    Try


    '    sql_str = "select nat_code,nat_descrar,nat_desceng from nat_tab "
    '    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '        sql_str += "order by nat_descrar "
    '    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '        sql_str += "order by nat_desceng "
    '    End If
    '    fill_DDL_DS = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
    '    If (fill_DDL_DS.Tables(0).Rows().Count > 0) Then
    '        'Pass the data set to Display Donor Information Method
    '        ddl_country_name.DataSource = fill_DDL_DS.Tables(0)
    '        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '            ddl_country_name.DataTextField = "nat_descrar"
    '        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '            ddl_country_name.DataTextField = "nat_desceng"
    '        End If

    '        ddl_country_name.DataValueField = "nat_code"
    '        ddl_country_name.DataBind()
    '        ddl_country_name.Items.Insert(0, "select")
    '    End If


    '        'ddl_country_city.Items.Clear()
    '        'ddl_country_district.Items.Clear()
    '        'txt_country_village.Text = """"
    '    Catch ex As Exception
    '        MsgBox("Error!" & vbCrLf & ex.Message, MsgBoxStyle.Exclamation, "")

    '    Finally
    '        fill_DDL_DS.Dispose()
    '    End Try


    '    'FILL SCHOOL CATEGORY
    '    'fill_DDL_DS = New DataSet
    '    Try
    '        sql_str = "SELECT category_code,category_name_ar,category_name_eng FROM school_category "

    '        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '            sql_str += "order by category_name_ar "
    '        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '            sql_str += "order by category_name_eng "
    '        End If
    '        fill_DDL_DS = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
    '        If (fill_DDL_DS.Tables(0).Rows().Count > 0) Then
    '            'Pass the data set to Display Donor Information Method
    '            ddl_school_category.DataSource = fill_DDL_DS.Tables(0)
    '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '                ddl_school_category.DataTextField = "category_name_ar"
    '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '                ddl_school_category.DataTextField = "category_name_eng"
    '            End If

    '            ddl_school_category.DataValueField = "category_code"
    '            ddl_school_category.DataBind()
    '            ddl_school_category.Items.Insert(0, "select")
    '        End If

    '    Catch ex As Exception
    '        MsgBox("Error!" & vbCrLf & ex.Message, MsgBoxStyle.Exclamation, "")

    '    Finally
    '        fill_DDL_DS.Dispose()
    '    End Try


    '    'FILL LANGUAGES
    '    'fill_DDL_DS = New DataSet
    '    Try
    '        sql_str = "SELECT lang_code,lang_descrar,lang_desceng FROM languages_tab "

    '        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '            sql_str += "order by lang_descrar "
    '        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '            sql_str += "order by lang_desceng "
    '        End If
    '        fill_DDL_DS = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
    '        If (fill_DDL_DS.Tables(0).Rows().Count > 0) Then
    '            'Pass the data set to Display Donor Information Method
    '            DDL_school_language.DataSource = fill_DDL_DS.Tables(0)
    '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '                DDL_school_language.DataTextField = "lang_descrar"
    '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '                DDL_school_language.DataTextField = "lang_desceng"
    '            End If

    '            DDL_school_language.DataValueField = "lang_code"
    '            DDL_school_language.DataBind()
    '            DDL_school_language.Items.Insert(0, "select")
    '        End If

    '    Catch ex As Exception
    '        MsgBox("Error!" & vbCrLf & ex.Message, MsgBoxStyle.Exclamation, "")

    '    Finally
    '        fill_DDL_DS.Dispose()
    '    End Try

    '    'fill centers
    '    'fill_DDL_DS = New DataSet
    '    sql_str = "SELECT lang_code,lang_descrar,lang_desceng FROM languages_tab "

    '    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '        sql_str += "order by lang_descrar "
    '    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '        sql_str += "order by lang_desceng "
    '    End If
    '    fill_DDL_DS = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
    '    If (fill_DDL_DS.Tables(0).Rows().Count > 0) Then
    '        'Pass the data set to Display Donor Information Method
    '        ddl_school_center.DataSource = fill_DDL_DS.Tables(0)
    '        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '            ddl_school_center.DataTextField = "lang_descrar"
    '        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '            ddl_school_center.DataTextField = "lang_desceng"
    '        End If

    '        ddl_school_center.DataValueField = "lang_code"
    '        ddl_school_center.DataBind()
    '        ddl_school_center.Items.Insert(0, "select")
    '    End If



    '    'fill managed by
    '    'fill_DDL_DS = New DataSet
    '    sql_str = "SELECT org_code,org_namear,org_nameen FROM organization_tab "

    '    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '        sql_str += "order by org_namear "
    '    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '        sql_str += "order by org_nameen "
    '    End If
    '    fill_DDL_DS = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
    '    If (fill_DDL_DS.Tables(0).Rows().Count > 0) Then
    '        'Pass the data set to Display Donor Information Method
    '        ddl_managed_by.DataSource = fill_DDL_DS.Tables(0)
    '        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '            ddl_managed_by.DataTextField = "org_namear"
    '        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '            ddl_managed_by.DataTextField = "org_nameen"
    '        End If

    '        ddl_managed_by.DataValueField = "org_code"
    '        ddl_managed_by.DataBind()
    '        ddl_managed_by.Items.Insert(0, "select")
    '    End If





    '    'fill start/end month
    '    'fill_DDL_DS = New DataSet
    '    sql_str = "SELECT month_code,month_name_ar,month_name_en FROM month_codes "

    '    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '        sql_str += "order by month_name_ar "
    '    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '        sql_str += "order by month_name_en "
    '    End If

    '    fill_DDL_DS = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
    '    If (fill_DDL_DS.Tables(0).Rows().Count > 0) Then
    '        'Pass the data set to Display Donor Information Method
    '        ddl_acad_year_start.DataSource = fill_DDL_DS.Tables(0)
    '        ddl_acad_year_end.DataSource = fill_DDL_DS.Tables(0)
    '        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '            ddl_acad_year_start.DataTextField = "month_name_ar"
    '            ddl_acad_year_end.DataTextField = "month_name_ar"
    '        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '            ddl_acad_year_start.DataTextField = "month_name_en"
    '            ddl_acad_year_end.DataTextField = "month_name_ar"
    '        End If

    '        ddl_acad_year_start.DataValueField = "month_code"
    '        ddl_acad_year_end.DataValueField = "month_code"
    '        ddl_acad_year_start.DataBind()
    '        ddl_acad_year_end.DataBind()
    '        ddl_acad_year_start.Items.Insert(0, "select")
    '        ddl_acad_year_end.Items.Insert(0, "select")
    '    End If



    '    'fill terms
    '    'fill_DDL_DS = New DataSet
    '    sql_str = "select term_code,term_name_ar,term_name_eng from terms_codes "
    '    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '        sql_str += "order by term_name_ar "
    '    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '        sql_str += "order by term_name_eng "
    '    End If
    '    fill_DDL_DS = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
    '    If (fill_DDL_DS.Tables(0).Rows().Count > 0) Then
    '        'Pass the data set to Display Donor Information Method
    '        ddl_terms_num.DataSource = fill_DDL_DS.Tables(0)
    '        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
    '            ddl_terms_num.DataTextField = "term_name_ar"
    '        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
    '            ddl_terms_num.DataTextField = "term_name_eng"
    '        End If

    '        ddl_terms_num.DataValueField = "term_code"
    '        ddl_terms_num.DataBind()
    '        ddl_terms_num.Items.Insert(0, "select")
    '    End If

    '    form_load = True
    'End Sub
    'Protected Sub Button2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles Button2.Click
    'Me.MultiView1.ActiveViewIndex = 0
    'End Sub

    Sub ddl_country_name_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles ddl_country_name.SelectedIndexChanged
        If Val(ddl_country_name.SelectedValue) > 0 Then
            ddl_country_city.Items.Clear()
            'fill country 
            'fill_DDL_DS = New DataSet
            sql_str = "select city_ser,city_name_ar,city_name_en from cities_tab where nat_code = " & Val(Me.ddl_country_name.SelectedValue)
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                sql_str += " order by city_name_ar  "
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                sql_str += " order by city_name_en "
            End If
            fill_DDL_DS = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
            If (fill_DDL_DS.Tables(0).Rows().Count > 0) Then
                'Pass the data set to Display Donor Information Method
                ddl_country_city.DataSource = fill_DDL_DS.Tables(0)
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ddl_country_city.DataTextField = "city_name_ar"
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ddl_country_city.DataTextField = "city_name_en"
                End If
                ddl_country_city.DataValueField = "city_ser"
                ddl_country_city.DataBind()

                ddl_country_name.Focus()
                If Val(Me.ddl_country_city.SelectedValue) > 0 Then
                    Get_district(Me.ddl_country_city.SelectedValue)
                Else
                    Me.txt_district.Text = "لا يوجد"
                End If
            End If
        End If
    End Sub

    Private Sub lnk_save_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnk_save.ServerClick

        Dim school_id As Int32
        'Dim app_openning_date As String = FormatDate(Me.txt_opening_date100)
        ' Convert.ToDateTime(app_openning_date),
        If Val(ddl_acad_year_start.SelectedValue) <> Val(ddl_acad_year_end.SelectedValue) Then
            'If IsDate(app_openning_date) Then

            If Val(Session("opr_flag") = 1) Then
                If Len(Me.txt_school_name_ar.Text) > 0 Then
                    If Val(ddl_country_name.SelectedValue) > 0 Then
                        If Val(ddl_country_city.SelectedValue) > 0 Then
                            Dim school_cat = IIf(String.IsNullOrWhiteSpace(Me.ddl_school_category.SelectedValue), 0, Me.ddl_school_category.SelectedValue)
                            Dim terms_num = IIf(String.IsNullOrWhiteSpace(Me.ddl_terms_num.SelectedValue), 0, Me.ddl_terms_num.SelectedValue)
                            Dim country_city = IIf(String.IsNullOrWhiteSpace(Me.ddl_country_city.SelectedValue), 0, Me.ddl_country_city.SelectedValue)
                            Dim schoolParam() As Object = {IIf(String.IsNullOrWhiteSpace(Me.txt_school_name_ar.Text), " ", txt_school_name_ar.Text),
                                                IIf(String.IsNullOrWhiteSpace(Me.txt_school_name_en.Text), " ", txt_school_name_en.Text),
                                                Convert.ToInt16(country_city),
                                                IIf(String.IsNullOrWhiteSpace(Me.txt_country_village.Text), " ", txt_country_village.Text),
                                                Convert.ToInt16(Me.ddl_school_center.SelectedValue),
                                                Convert.ToInt16(school_cat),
                                                Convert.ToInt16(IIf(String.IsNullOrWhiteSpace(Me.txt_est_year.Text), 0, Me.txt_est_year.Text)),
                                                IIf((txt_opening_date.Value = Nothing), "01/01/1900", Convert.ToDateTime(txt_opening_date.Value)),
                                                IIf(String.IsNullOrWhiteSpace(Me.txt_school_proj_num.Text), " ", txt_school_proj_num.Text),
                                                Convert.ToInt16(Me.DDL_school_language.SelectedValue),
                                                Convert.ToInt16(IIf(String.IsNullOrWhiteSpace(Me.txt_years_num.Text), 0, Me.txt_years_num.Text)),
                                                IIf(String.IsNullOrWhiteSpace(Me.txt_school_tel.Text), " ", txt_school_tel.Text),
                                                IIf(String.IsNullOrWhiteSpace(Me.txt_school_mobile.Text), " ", txt_school_mobile.Text),
                                                IIf(String.IsNullOrWhiteSpace(Me.txt_school_fax.Text), " ", txt_school_fax.Text),
                                                IIf(String.IsNullOrWhiteSpace(Me.txt_school_email.Text), " ", txt_school_email.Text),
                                                Convert.ToInt16(Me.ddl_managed_by.SelectedValue),
                                                IIf(String.IsNullOrWhiteSpace(Me.txt_site_name.Text), " ", txt_site_name.Text),
                                                Convert.ToByte(rdo_ownership_1.SelectedValue),
                                                Convert.ToByte(rdo_registered_1.SelectedValue),
                                                Convert.ToByte(rdo_certifictae_1.SelectedValue),
                                                Convert.ToInt16(Me.ddl_acad_year_start.SelectedValue),
                                                Convert.ToInt16(Me.ddl_acad_year_end.SelectedValue),
                                                Convert.ToInt16(terms_num),
                                                 IIf(String.IsNullOrWhiteSpace(Me.txt_school_website.Text), " ", txt_school_website.Text),
                                                 IIf(String.IsNullOrWhiteSpace(Me.txt_notes_1.Text), " ", txt_notes_1.Text),
                                                Convert.ToInt16(Me.ddl_site_type.SelectedValue),
                                                Convert.ToByte(Me.chk_school_related_to_da.Checked), 0}

                            school_id = _ws.ExecSp("charitysoft", Session("username"), Session("password"), "Insert_school_master", CommandType.StoredProcedure, schoolParam)
                            Me.txt_school_code.Text = IIf(school_id = 0, String.Empty, school_id.ToString())

                            If (school_id > 0) Then
                                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                                    ShowAlert("تم حفظ ملف المؤسسة التعليمية بنجاح")
                                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                                    ShowAlert("تم حفظ ملف المؤسسة التعليمية بنجاح")
                                End If
                            End If
                            Session("opr_flag") = 2 'update
                            txt_school_name_ar.Focus()

                        Else
                            ShowAlert("حدد اسم المدينة")
                        End If
                    Else
                        ShowAlert("حدد اسم البلد")
                    End If
                Else
                    ShowAlert("حدد اسم المؤسسة التعليمية")
                End If
            ElseIf Val(Session("opr_flag") = 2) Then 'update
                If Val(Me.txt_school_code.Text) > 0 Then
                    Dim school_cat = IIf(String.IsNullOrWhiteSpace(Me.ddl_school_category.SelectedValue), 0, Me.ddl_school_category.SelectedValue)
                    Dim terms_num = IIf(String.IsNullOrWhiteSpace(Me.ddl_terms_num.SelectedValue), 0, Me.ddl_terms_num.SelectedValue)
                    Dim country_city = IIf(String.IsNullOrWhiteSpace(Me.ddl_country_city.SelectedValue), 0, Me.ddl_country_city.SelectedValue)
                    Dim schoolParam() As Object = {IIf(String.IsNullOrWhiteSpace(Me.txt_school_name_ar.Text), " ", txt_school_name_ar.Text),
                                        IIf(String.IsNullOrWhiteSpace(Me.txt_school_name_en.Text), " ", txt_school_name_en.Text),
                                        Convert.ToInt16(country_city),
                                        IIf(String.IsNullOrWhiteSpace(Me.txt_country_village.Text), " ", txt_country_village.Text),
                                        Convert.ToInt16(Me.ddl_school_center.SelectedValue),
                                        Convert.ToInt16(school_cat),
                                        Convert.ToInt16(IIf(String.IsNullOrWhiteSpace(Me.txt_est_year.Text), 0, Me.txt_est_year.Text)),
                                        IIf((txt_opening_date.Value = Nothing), "01/01/1900", Convert.ToDateTime(txt_opening_date.Value)),
                                        IIf(String.IsNullOrWhiteSpace(Me.txt_school_proj_num.Text), " ", txt_school_proj_num.Text),
                                        Convert.ToInt16(Me.DDL_school_language.SelectedValue),
                                        IIf(String.IsNullOrWhiteSpace(Me.txt_years_num.Text), 0, txt_years_num.Text),
                                        IIf(String.IsNullOrWhiteSpace(Me.txt_school_tel.Text), " ", txt_school_tel.Text),
                                        IIf(String.IsNullOrWhiteSpace(Me.txt_school_mobile.Text), " ", txt_school_mobile.Text),
                                        IIf(String.IsNullOrWhiteSpace(Me.txt_school_fax.Text), " ", txt_school_fax.Text),
                                        IIf(IsDBNull(Me.txt_school_email.Text), "", txt_school_email.Text),
                                        Convert.ToInt16(Me.ddl_managed_by.SelectedValue),
                                        IIf(String.IsNullOrWhiteSpace(Me.txt_site_name.Text), " ", txt_site_name.Text),
                                        Convert.ToByte(rdo_ownership_1.SelectedValue),
                                        Convert.ToByte(rdo_registered_1.SelectedValue),
                                        Convert.ToByte(rdo_certifictae_1.SelectedValue),
                                        Convert.ToInt16(Me.ddl_acad_year_start.SelectedValue),
                                        Convert.ToInt16(Me.ddl_acad_year_end.SelectedValue),
                                        Convert.ToInt16(terms_num),
                                        Convert.ToInt16(Me.txt_school_code.Text),
                                        IIf(String.IsNullOrWhiteSpace(Me.txt_school_website.Text), " ", txt_school_website.Text),
                                        IIf(String.IsNullOrWhiteSpace(Me.txt_notes_1.Text), " ", txt_notes_1.Text),
                                        Convert.ToInt16(Me.ddl_site_type.SelectedValue), Convert.ToByte(Me.chk_school_related_to_da.Checked)
                                        }
                    '
                    _ws.ExecSp("charitysoft", Session("username"), Session("password"), "Update_school_master", CommandType.StoredProcedure, schoolParam)

                    ShowAlert("تم التعديل")
                    LockField(Me.txt_school_code)
                    Session("opr_flag") = 2 'update
                    txt_school_name_ar.Focus()
                Else
                    ShowAlert("حدد اسم المؤسسة التعليمية")
                End If
            Else
                ShowAlert("لا يمكن الحفظ او التعديل ")
            End If
            'Else
            '    ShowAlert("خطأ في ادخال تاريخ الافتتاح  ")
            'End If
        Else
            ShowAlert("راجع بداية و مهاية السنة الاكاديمية  ")
        End If


    End Sub



    Private Sub A5_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles A5.ServerClick
        clear_frm(Me)
        Session("opr_flag") = 3
        txt_school_code.Enabled = True
        txt_school_code.BackColor = Drawing.Color.White
        Me.txt_opening_date.Value = Nothing
        txt_school_code.Focus()
    End Sub

    Private Sub lnk_new_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnk_new.ServerClick
        CreateNew()
        'txt_system_date.Text = DateTime.Now.ToString("dd/MM/yyyy")
    End Sub

    Private Sub A_search_Click(ByVal sender As Object, ByVal e As EventArgs) Handles A_search.Click

        If Session("opr_flag") = 3 Then
            SearchByCode(Val(Me.txt_school_code.Text))
        Else
        End If

    End Sub


    Protected Sub terms_DS_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles terms_DS.Selecting

    End Sub

    Protected Sub txt_school_code_TextChanged(ByVal sender As Object, ByVal e As EventArgs) Handles txt_school_code.TextChanged

    End Sub

    Protected Sub txt_school_tel_TextChanged(sender As Object, e As EventArgs) Handles txt_school_tel.TextChanged

    End Sub

    Protected Sub A2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles A2.Click

        Me.txt_school_code.Text = Val(Session("school_id_from_srch"))
        A_search_Click(sender, e)
    End Sub

    Protected Sub txt_school_mobile_TextChanged(ByVal sender As Object, ByVal e As EventArgs) Handles txt_school_mobile.TextChanged

    End Sub

    Protected Sub txt_school_website_TextChanged(ByVal sender As Object, ByVal e As EventArgs) Handles txt_school_website.TextChanged

    End Sub

    Sub ShowAlert(ByVal message As String)
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "notificationScript111", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
        'ScriptManager.RegisterStartupScript(Me.UpdatePanel3, UpdatePanel3.GetType(), "notificationScript", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
    End Sub

    Protected Sub ddl_country_city_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles ddl_country_city.SelectedIndexChanged
        If Val(Me.ddl_country_city.SelectedValue) > 0 Then
            Get_district(Me.ddl_country_city.SelectedValue)

        Else
            Me.txt_district.Text = "لا يوجد"
        End If
        ddl_country_city.Focus()
    End Sub

   

    Protected Sub txt_district_TextChanged(sender As Object, e As EventArgs) Handles txt_district.TextChanged

    End Sub


#End Region

    'Protected Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles ASPxButton1.Click
    '    'Page.ClientScript.RegisterStartupScript(Me.GetType(), "KEEEE", "alert('');", True)
    '    'txt_school_name_ar.Text = "from server"
    'End Sub

    Protected Sub ASPxGridView1_RowCommand(sender As Object, e As DevExpress.Web.ASPxGridViewRowCommandEventArgs) Handles ASPxGridView1.RowCommand
        If e.CommandArgs.CommandName.ToLower().Equals("name") Then
            Dim code As Double
            code = Val(e.CommandArgs.CommandArgument)
            SearchByCode(code)
        End If

    End Sub

End Class