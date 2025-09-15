Public Class UCSchoolsMasterIndependentV1
    Inherits System.Web.UI.UserControl

#Region "Private Methods"
    Sub CreateNew()
        ASPxButton_FindByKey.Value = Nothing
        txt_hdn_scode.Text = ""
        txt_school_name_ar.Text = ""
        txt_school_name_en.Text = ""
        ddl_site_type.SelectedItem = Nothing
        'txt_opening_date.Value = Date.Today()
        'txt_est_year.Text = ""
        'txt_school_proj_num.Text = ""
        ddl_country_name.SelectedItem = Nothing
        ddl_country_city.SelectedItem = Nothing
        'txt_district.Text = ""
        txt_country_village.Text = ""
        ddl_school_center.SelectedItem = Nothing
        DDL_school_language.SelectedItem = Nothing
        'txt_years_num.Text = ""
        ddl_school_category.SelectedItem = Nothing
        txt_school_tel.Text = ""
        txt_school_mobile.Text = ""
        txt_school_fax.Text = ""
        txt_school_website.Text = ""
        txt_school_email.Text = ""
        txt_notes_1.Text = "" 'عنوان المؤسسة التعليمية
        ddl_acad_year_start.SelectedItem = Nothing
        ddl_acad_year_end.SelectedItem = Nothing
        'ddl_managed_by.SelectedItem = Nothing
        'txt_site_name.Text = ""
        'rdo_ownership_1.SelectedValue = Nothing
        'rdo_certifictae_1.SelectedValue = Nothing
        'rdo_registered_1.SelectedValue = Nothing
        'ddl_terms_num.SelectedItem = Nothing
    End Sub
    Sub SaveNew(ByRef db As Database)
        Dim school_new As school_master = New school_master()
        Dim newID = db.school_master.Max(Function(o) o.school_code) + 1
        school_new.school_code = newID

        school_new.school_name_ar = txt_school_name_ar.Text
        school_new.school_name_en = txt_school_name_en.Text
        If (Not ddl_site_type.Value Is Nothing) Then
            school_new.site_type = Byte.Parse(ddl_site_type.Value)
        End If

        'school_new.opening_date = txt_opening_date.Value
        'If (txt_est_year.Text <> "" And Not txt_est_year.Text Is Nothing) Then
        '    school_new.est_year = Short.Parse(txt_est_year.Text)
        'End If

        'school_new.school_proj_num = txt_school_proj_num.Text
        If (Not ddl_country_city.Value Is Nothing) Then
            school_new.country_city = Short.Parse(ddl_country_city.Value)
        End If
        'txt_district.Text = ""
        school_new.country_village = txt_country_village.Text
        If (Not ddl_school_center.Value Is Nothing) Then
            school_new.school_center = Short.Parse(ddl_school_center.Value)
        End If
        If (Not DDL_school_language.Value Is Nothing) Then
            school_new.school_language = Short.Parse(DDL_school_language.Value)
        End If
        'If Not (txt_years_num.Text = "" Or txt_years_num.Text = Nothing) Then
        '    school_new.years_num = Short.Parse(txt_years_num.Text)
        'End If
        If (Not ddl_school_category.Value Is Nothing) Then
            school_new.school_category = Short.Parse(ddl_school_category.Value)
        End If
        school_new.school_tel = txt_school_tel.Text
        school_new.school_mobile = txt_school_mobile.Text
        school_new.school_fax = txt_school_fax.Text
        school_new.school_website = txt_school_website.Text
        school_new.school_email = txt_school_email.Text
        school_new.notes_1 = txt_notes_1.Text 'عنوان المؤسسة التعليمية

        If Not ddl_acad_year_start.Value Is Nothing Then
            school_new.acad_year_start = Short.Parse(ddl_acad_year_start.Value)
        End If
        If Not ddl_acad_year_end.Value Is Nothing Then
            school_new.acad_year_end = Short.Parse(ddl_acad_year_end.Value)
        End If
        'If (Not ddl_managed_by.Value Is Nothing) Then
        '    school_new.managed_by = Short.Parse(ddl_managed_by.Value)
        'End If
        'school_new.site_name = txt_site_name.Text
        'If (rdo_ownership_1.SelectedValue <> "" And Not rdo_ownership_1.SelectedValue Is Nothing) Then
        '    school_new.ownership_1 = rdo_ownership_1.SelectedValue
        'End If
        'If (rdo_certifictae_1.SelectedValue <> "" And Not rdo_certifictae_1.SelectedValue Is Nothing) Then
        '    school_new.certifictae_1 = rdo_certifictae_1.SelectedValue
        'End If
        'If (rdo_registered_1.SelectedValue <> "" And Not rdo_registered_1.SelectedValue Is Nothing) Then
        '    school_new.registered_1 = rdo_registered_1.SelectedValue
        'End If
        'If (Not ddl_terms_num.Value Is Nothing) Then
        '    school_new.terms_num = Byte.Parse(ddl_terms_num.Value)
        'End If
        school_new.school_related_to_da = 0
        db.school_master.AddObject(school_new)
        db.SaveChanges()
        DevExpress.Web.ASPxWebControl.RedirectOnCallback("IndependentSchoolsMaster.aspx?scode=" + school_new.school_code.ToString())
    End Sub
    Sub SaveUpdate(ByRef db As Database)
        Dim ID = Integer.Parse(txt_hdn_scode.Text)
        Dim school_new As school_master = db.school_master.Where(Function(o) o.school_code = ID).FirstOrDefault()
        If Not school_new Is Nothing Then
            school_new.school_name_ar = txt_school_name_ar.Text
            school_new.school_name_en = txt_school_name_en.Text
            If (Not ddl_site_type.Value Is Nothing) Then
                school_new.site_type = Byte.Parse(ddl_site_type.Value)
            End If

            'school_new.opening_date = txt_opening_date.Value
            'If (txt_est_year.Text <> "" And Not txt_est_year.Text Is Nothing) Then
            '    school_new.est_year = Short.Parse(txt_est_year.Text)
            'End If

            'school_new.school_proj_num = txt_school_proj_num.Text
            If (Not ddl_country_city.Value Is Nothing) Then
                school_new.country_city = Short.Parse(ddl_country_city.Value)
            End If
            'txt_district.Text = ""
            school_new.country_village = txt_country_village.Text
            If (Not ddl_school_center.Value Is Nothing) Then
                school_new.school_center = Short.Parse(ddl_school_center.Value)
            End If
            If (Not DDL_school_language.Value Is Nothing) Then
                school_new.school_language = Short.Parse(DDL_school_language.Value)
            End If
            'If Not (txt_years_num.Text = "" Or txt_years_num.Text = Nothing) Then
            '    school_new.years_num = Short.Parse(txt_years_num.Text)
            'End If
            If (Not ddl_school_category.Value Is Nothing) Then
                school_new.school_category = Short.Parse(ddl_school_category.Value)
            End If
            school_new.school_tel = txt_school_tel.Text
            school_new.school_mobile = txt_school_mobile.Text
            school_new.school_fax = txt_school_fax.Text
            school_new.school_website = txt_school_website.Text
            school_new.school_email = txt_school_email.Text
            school_new.notes_1 = txt_notes_1.Text 'عنوان المؤسسة التعليمية

            If Not ddl_acad_year_start.Value Is Nothing Then
                school_new.acad_year_start = Short.Parse(ddl_acad_year_start.Value)
            End If
            If Not ddl_acad_year_end.Value Is Nothing Then
                school_new.acad_year_end = Short.Parse(ddl_acad_year_end.Value)
            End If
            'If (Not ddl_managed_by.Value Is Nothing) Then
            '    school_new.managed_by = Short.Parse(ddl_managed_by.Value)
            'End If
            'school_new.site_name = txt_site_name.Text
            'If (rdo_ownership_1.SelectedValue <> "" And Not rdo_ownership_1.SelectedValue Is Nothing) Then
            '    school_new.ownership_1 = rdo_ownership_1.SelectedValue
            'End If
            'If (rdo_certifictae_1.SelectedValue <> "" And Not rdo_certifictae_1.SelectedValue Is Nothing) Then
            '    school_new.certifictae_1 = rdo_certifictae_1.SelectedValue
            'End If
            'If (rdo_registered_1.SelectedValue <> "" And Not rdo_registered_1.SelectedValue Is Nothing) Then
            '    school_new.registered_1 = rdo_registered_1.SelectedValue
            'End If
            'If (Not ddl_terms_num.Value Is Nothing) Then
            '    school_new.terms_num = Byte.Parse(ddl_terms_num.Value)
            'End If

            'db.school_master.AddObject(school_new)
            db.SaveChanges()
        End If

    End Sub
    Sub UpdateUIWithData(ByRef db As Database)
        Dim ID = Integer.Parse(txt_hdn_scode.Text)
        Dim school_new As school_master = db.school_master.Where(Function(o) o.school_code = ID And o.school_related_to_da = 0).FirstOrDefault()
        If Not school_new Is Nothing Then
            txt_school_name_ar.Text = school_new.school_name_ar
            txt_school_name_en.Text = school_new.school_name_en
            ddl_site_type.Value = school_new.site_type
            'txt_opening_date.Value = school_new.opening_date
            'txt_est_year.Text = IIf(Not IsDBNull(school_new.est_year), school_new.est_year, "")
            'txt_school_proj_num.Text = IIf(Not IsDBNull(school_new.school_proj_num), school_new.school_proj_num, "")
            'TODO:set country first
            Dim countryID = db.cities.Where(Function(o) o.city_id = school_new.country_city).FirstOrDefault()
            If (Not countryID Is Nothing) Then
                ddl_country_name.Value = countryID.nat_city.Value
                ddl_country_city.Value = school_new.country_city
            End If

            'txt_district.Text = ""
            txt_country_village.Text = IIf(Not IsDBNull(school_new.country_village), school_new.country_village, "")
            ddl_school_center.Value = school_new.school_center
            DDL_school_language.Value = school_new.school_language
            'txt_years_num.Text = IIf(Not IsDBNull(school_new.years_num), school_new.years_num, "")
            ddl_school_category.Value = school_new.school_category
            txt_school_tel.Text = IIf(Not IsDBNull(school_new.school_tel), school_new.school_tel, "")
            txt_school_mobile.Text = IIf(Not IsDBNull(school_new.school_mobile), school_new.school_mobile, "")
            txt_school_fax.Text = IIf(Not IsDBNull(school_new.school_fax), school_new.school_fax, "")
            txt_school_website.Text = IIf(Not IsDBNull(school_new.school_website), school_new.school_website, "")
            txt_school_email.Text = IIf(Not IsDBNull(school_new.school_email), school_new.school_email, "")
            txt_notes_1.Text = IIf(Not IsDBNull(school_new.notes_1), school_new.notes_1, "") 'عنوان المؤسسة التعليمية
            ddl_acad_year_start.Value = school_new.acad_year_start
            ddl_acad_year_end.Value = school_new.acad_year_end
            'ddl_managed_by.Value = school_new.managed_by
            'txt_site_name.Text = IIf(Not IsDBNull(school_new.site_name), school_new.site_name, "")
            'rdo_ownership_1.SelectedValue = IIf(Not IsDBNull(school_new.ownership_1), school_new.ownership_1, 0)
            'rdo_certifictae_1.SelectedValue = IIf(Not IsDBNull(school_new.certifictae_1), school_new.certifictae_1, 0)
            'rdo_registered_1.SelectedValue = IIf(Not IsDBNull(school_new.registered_1), school_new.registered_1, 0)
            'ddl_terms_num.Value = school_new.terms_num

        Else
            'Throw New Exception("لا توجد معلومات")
            Page.ClientScript.RegisterStartupScript(Type.GetType("DirectAid.UCSchoolsMasterIndependentV1"), "alertKey", "alert('لا توجد بيانات')", True)
        End If

    End Sub
    Function ValidateOnSave() As String
        Dim message As String = ""
        If txt_school_name_ar.Text = "" Then
            message += "برجاء ادخال حقل اسم المؤسسة التعليمية - ع ." + Environment.NewLine
        End If
        If txt_school_name_en.Text = "" Then
            message += "برجاء ادخال حقل اسم المؤسسة التعليمية - E ." + Environment.NewLine
        End If
        If ddl_site_type.Value Is Nothing Then
            message += "برجاء ادخال نوع المؤسسة التعليمية." + Environment.NewLine
        End If
        If ddl_acad_year_start.Value Is Nothing Or ddl_acad_year_end.Value Is Nothing Or ddl_acad_year_start.Value = ddl_acad_year_end.Value Then
            message += "راجع بداية و نهاية العام الدراسي" + Environment.NewLine
        End If

        Return message
    End Function

#End Region

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim id = Request.QueryString("scode")
        If Not id Is Nothing Then
            ASPxButton_FindByKey.Value = Integer.Parse(id)
            txt_hdn_scode.Text = id.ToString()
        Else
            ASPxButton_FindByKey.Value = Nothing
            txt_hdn_scode.Text = ""
        End If

        If Not IsPostBack Then
            If txt_hdn_scode.Text <> "" Then
                Dim db As Database = New Database()
                UpdateUIWithData(db)
            End If
        End If
    End Sub


    Protected Sub ASPxButton_New_Click(sender As Object, e As EventArgs) Handles ASPxButton_New.Click
        Response.Redirect("IndependentSchoolsMaster.aspx")
    End Sub

    Protected Sub ASPxButton_Save_Click(sender As Object, e As EventArgs) Handles ASPxButton_Save.Click

    End Sub

    Protected Sub ASPxCallback_Save_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim msg = ValidateOnSave()
        If msg = "" Then
            If txt_hdn_scode.Text <> "" Then
                SaveUpdate(New Database())
            Else
                SaveNew(New Database())
            End If
        Else
            Throw New Exception(msg)
        End If


    End Sub
End Class