
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class UCDonorV3
    Inherits System.Web.UI.UserControl

#Region "Fields"

    Private _ws As New DataAccessLibrary
    Protected _culture As String

#End Region

#Region "Methods"

    Private Function ValidEMail(str As String) As Boolean

        If str.Trim() <> String.Empty Then

            Dim pattern As String = "\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"

            Dim x As Match = Regex.Match(str.Trim(), pattern, RegexOptions.IgnoreCase)

            If x.Success Then

                Return True

            Else

                Return False

            End If

        Else

            Return True

        End If

    End Function

    Private Sub SearchMode()

        Dim isSearchMode As Boolean = CheckBox_DonrSrchMod.Checked

        btnDonrSearch.Visible = isSearchMode
        'txtArabicName.Enabled = isSearchMode
        'txtDon_nameng.Enabled = isSearchMode
        'txtDonor.Enabled = isSearchMode
        'txtCivilid.Enabled = isSearchMode
        'txtphone.Enabled = isSearchMode
        'txtLocphone.Enabled = isSearchMode
        'CmdSave.Visible = Not isSearchMode
        'btnEnableDonorProfile.Enabled = Not isSearchMode

        If isSearchMode Then

            txtArabicName.Focus()

        End If

    End Sub

    Private Sub NewDonor()

        ClearForm()
        If Request.QueryString.Count > 0 Then
            Response.Redirect("~/AddDonar.aspx")
        End If

    End Sub

    Private Sub EnableDonorProfile()

        'btnOpen.Enabled = False
        ' btnCreate.Enabled = True
        txtmob.Enabled = True
        txtDon_nameng.Enabled = True
        txtArabicName.Enabled = True
        txtCivilid.Enabled = True
        txtphone.Enabled = True
        ddlDonorType.Enabled = True
        ddlTitleDonor.Enabled = True
        txtDonor.Enabled = False
        'txtCivilID.Focus()
        txtArabicName.Focus()
    End Sub

    Private Sub Search_New()

        Try


            Dim sqlQuery As String = "SELECT * FROM donor_data WHERE (donor_id IS NOT NULL) "


            If txtArabicName.Text.Trim() <> String.Empty Then

                sqlQuery = sqlQuery & String.Format("AND (donor_namear like '%{0}%')", txtArabicName.Text.Trim())

            End If

            If txtDon_nameng.Text.Trim() <> String.Empty Then

                sqlQuery = sqlQuery & String.Format("AND (donor_nameen like '%{0}%')", txtDon_nameng.Text.Trim())

            End If

            If txtBehaf.Text.Trim() <> String.Empty Then

                sqlQuery = sqlQuery & String.Format("AND (donat_to like '%{0}%')", txtBehaf.Text.Trim())

            End If


            If txtDonor.Text.Trim() <> String.Empty Then

                sqlQuery = sqlQuery & String.Format("AND (donor_id = {0})", txtDonor.Text.Trim())

            End If

            If txtCivilid.Text.Trim() <> String.Empty Then

                sqlQuery = sqlQuery & String.Format("AND (donor_civilid = '{0}')", txtCivilid.Text.Trim())

            End If

            If txtphone.Text.Trim() <> String.Empty Then

                sqlQuery = sqlQuery & String.Format("AND (phone_2 = '{0}' OR phone_3 = '{0}' OR primary_phone = '{0}') ", txtphone.Text.Trim())

            End If

            If txtLocphone.Text.Trim() <> String.Empty Then

                sqlQuery = sqlQuery & String.Format("AND (phone_2 = '{0}' OR phone_3 = '{0}' OR primary_phone = '{0}') ", txtLocphone.Text.Trim())

            End If

            If txtmob.Text.Trim() <> String.Empty Then

                'sqlQuery = sqlQuery & String.Format("AND (phone_2 = {0})", txtmob.Text.Trim())
                sqlQuery = sqlQuery & String.Format("AND (phone_2 = '{0}' OR phone_3 = '{0}' OR primary_phone = '{0}') ", txtmob.Text.Trim())

            End If


            'ShowAlert(sqlQuery)

            Dim donorDS As New DataSet

            donorDS = _ws.GetMyData("charitysoft", Session(SessionKey.USERNAME), Session("password"), sqlQuery)
            If (donorDS.Tables(0).Rows().Count > 0) Then


                grvSearchResult.DataSource = donorDS
                grvSearchResult.DataBind()
                pnlSreachResult_ModalPopupExtender.Show()



            Else
                ' ClearForm()
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ShowAlert("لا يوجد بيانات")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ShowAlert("No Data Found")
                End If
                EnableDonorProfile()
            End If

        Catch ex As Exception

        End Try

    End Sub

    Private Sub ClearForm()
        Try
            datalib.ClearForm(UpdatePanel)

            HiddenFieldSendReport.Value = Nothing

            insert_userid.Value = Nothing
            insert_date.Value = Nothing
            last_update_userid.Value = Nothing
            last_update_date.Value = Nothing

        Catch ex As Exception

        End Try

    End Sub

    Private Sub ApplyStyle()

        Dim HtmlLink As New HtmlLink
        Dim pageHeader As Web.UI.HtmlControls.HtmlHead

        pageHeader = TryCast(Me.Page.Header, Web.UI.HtmlControls.HtmlHead)

        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
            HtmlLink.Href = "~/Content/bootstrap-ar.css"
            HtmlLink.Attributes.Add("rel", "stylesheet")
            HtmlLink.Attributes.Add("type", "text/css")

        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
            HtmlLink.Href = "~/Content/bootstrap.css"
            HtmlLink.Attributes.Add("rel", "stylesheet")
            HtmlLink.Attributes.Add("type", "text/css")

        End If

        If (Not IsNothing(pageHeader)) Then
            'Add the HtmlLink to the Head section of the page.
            pageHeader.Controls.Add(HtmlLink)
        End If
    End Sub

    Sub ShowAlert(ByVal message As String)
        ScriptManager.RegisterStartupScript(Me.UpdatePanel, UpdatePanel.GetType(), "notificationScript", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
    End Sub

    Private Sub print_report(reportFileName As String)

        '=======================================================================================
        'Declaration
        '---------------------------------------------------------------------------------------
        Dim _StringBuilder As StringBuilder
        '=======================================================================================

        '=======================================================================================
        'Initialization
        '---------------------------------------------------------------------------------------
        _StringBuilder = New StringBuilder
        '---------------------------------------------------------------------------------------
        If Not txtDonor.Text Is Nothing Then

            _StringBuilder.Append(" (iif(isnull({donation_tran.void}) , 0 , {donation_tran.void}) <> 2 and {donor_data.donor_id} = " + txtDonor.Text + ")")

        End If
        '=======================================================================================

        '=======================================================================================
        'Processing
        '---------------------------------------------------------------------------------------
        Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = _StringBuilder.ToString()
        Session(SessionKey.REPORT_DATASOURCE) = Nothing
        Session(SessionKey.REPORT_PARAMETERS) = Nothing
        Session(SessionKey.REPORT_FILENAME) = String.Format(".\Reports\{0}.rpt", reportFileName)
        Session(SessionKey.REPORT_BACK_PATH) = "AddDonar.aspx"
        Session(SessionKey.REPORT_FORMULA) = Nothing
        Response.Redirect("ReportViewer.aspx")
        '=======================================================================================

    End Sub

    Private Sub Saving()


        If (cmbMethodsToSendReports.SelectedValue Is Nothing Or cmbMethodsToSendReports.SelectedValue = 101) Then
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                ShowAlert("من فضلك اختر وسيلة ارسال التقرير")
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                ShowAlert("Please choose send report by")
            End If
            cmbMethodsToSendReports.Focus()
            Exit Sub
        End If

        'Select Case cmbMethodsToSendReports.SelectedValue
        '    Case 1 ' By Email
        '        If (txtEmail.Text.Trim() = String.Empty) Then
        '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                ShowAlert("من فضلك ادخل البريد الالكتروني للمتبرع")
        '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                ShowAlert("Please enter donor's Email")
        '            End If
        '            txtEmail.Focus()
        '            Exit Sub
        '        End If
        '    Case 2 ' By Address
        '        If (ddlAreadcd.SelectedValue = 0) Then
        '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                ShowAlert("من فضلك اختار المنطقة ")
        '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                ShowAlert("Please choose Area")
        '            End If
        '            ddlAreadcd.Focus()
        '            Exit Sub
        '        End If
        '        If (txtBlkNo.Text.Trim() = String.Empty) Then
        '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                ShowAlert("من فضلك ادخل رقم القطعة ")
        '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                ShowAlert("Please enter Block Number")
        '            End If
        '            txtBlkNo.Focus()
        '            Exit Sub
        '        End If
        '        If (txtstreet.Text.Trim() = String.Empty) Then
        '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                ShowAlert("من فضلك ادخل اسم الشارع")
        '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                ShowAlert("Please enter Street")
        '            End If
        '            txtstreet.Focus()
        '            Exit Sub
        '        End If
        '        If (txtBuild.Text.Trim() = String.Empty) Then
        '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                ShowAlert("من فضلك ادخل المبنى")
        '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                ShowAlert("Please enter Build Number")
        '            End If
        '            txtBuild.Focus()
        '            Exit Sub
        '        End If
        '        'Case 3 ' Not Want the report
        '    Case 4 ' By Third party
        '        If (txtSendBy.Text.Trim() = String.Empty) Then
        '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                ShowAlert("من فضلك ادخل اسم الشخص المعني بإرسال التقرير")
        '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                ShowAlert("Please enter send by name")
        '            End If
        '            txtSendBy.Focus()
        '            Exit Sub
        '        End If
        '        If (txtLocphone.Text.Trim() = String.Empty) And (txtmob.Text.Trim() <> String.Empty) And (txtphone.Text.Trim() <> String.Empty) Then
        '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                ShowAlert("من فضلك ادخل رقم الهاتف الرئيسي على الأقل")
        '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                ShowAlert("Please enter send by name")
        '            End If
        '            txtLocphone.Focus()
        '            Exit Sub
        '        End If
        '    Case 5 ' By P.O Box 
        '        If (txtPObox.Text.Trim() = String.Empty) Then
        '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                ShowAlert("من فضلك ادخل صندوق البريد")
        '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                ShowAlert("Please enter P.O Box")
        '            End If
        '            txtPObox.Focus()
        '            Exit Sub
        '        End If

        '        If (txtzip.Text.Trim() = String.Empty) Then
        '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                ShowAlert("من فضلك ادخل الرمز البريدي")
        '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                ShowAlert("Please enter Zip code")
        '            End If
        '            txtzip.Focus()
        '            Exit Sub
        '        End If
        '        If (ddlResident.SelectedValue = 0) Then
        '            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '                ShowAlert("من فضلك اختار الدولة ")
        '            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '                ShowAlert("Please choose country")
        '            End If
        '            ddlResident.Focus()
        '            Exit Sub
        '        End If
        'End Select

        If (txtArabicName.Text.Trim() = String.Empty) Then

            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                ShowAlert("من فضلك ادخل اسم المتبرع")
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                ShowAlert("Please enter donor name")
            End If

            txtArabicName.Focus()

            Exit Sub

        End If

        If (ddlGender.SelectedIndex <= 0) Then

            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                ShowAlert("من فضلك اختر النوع")
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                ShowAlert("Please choose gender")
            End If

            ddlGender.Focus()

            Exit Sub

        End If

        If Not ValidEMail(txtEmail.Text) Then

            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                ShowAlert("البريد الالكترونى غير صحيح")
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                ShowAlert("Invalid EMail")
            End If

            txtEmail.Focus()

            Exit Sub

        End If

        txtArabicName.Text = StringEngine.ProcessArabicString(txtArabicName.Text)

        If (String.IsNullOrWhiteSpace(txtDonor.Text)) Then

            DonorSqlDataSource.InsertParameters.Item("donor_namear").DefaultValue = txtArabicName.Text
            DonorSqlDataSource.InsertParameters.Item("donor_nameen").DefaultValue = txtDon_nameng.Text
            DonorSqlDataSource.InsertParameters.Item("donor_civilid").DefaultValue = txtCivilid.Text

            DonorSqlDataSource.InsertParameters.Item("donor_gender").DefaultValue = ddlGender.SelectedValue
            DonorSqlDataSource.InsertParameters.Item("donor_nat").DefaultValue = ddlNat.SelectedValue
            DonorSqlDataSource.InsertParameters.Item("donor_residency").DefaultValue = ddlResident.SelectedValue
            DonorSqlDataSource.InsertParameters.Item("primary_phone").DefaultValue = txtLocphone.Text
            DonorSqlDataSource.InsertParameters.Item("phone_2").DefaultValue = txtmob.Text
            DonorSqlDataSource.InsertParameters.Item("phone_3").DefaultValue = txtphone.Text
            DonorSqlDataSource.InsertParameters.Item("address_text").DefaultValue = txtAdress.Text
            DonorSqlDataSource.InsertParameters.Item("po_box").DefaultValue = txtPObox.Text
            DonorSqlDataSource.InsertParameters.Item("zip_code").DefaultValue = txtzip.Text
            DonorSqlDataSource.InsertParameters.Item("area_code").DefaultValue = ddlAreadcd.SelectedValue
            DonorSqlDataSource.InsertParameters.Item("block_num").DefaultValue = txtBlkNo.Text
            DonorSqlDataSource.InsertParameters.Item("gadda_h").DefaultValue = txtGaddah.Text
            DonorSqlDataSource.InsertParameters.Item("street_name").DefaultValue = txtstreet.Text
            DonorSqlDataSource.InsertParameters.Item("building_num").DefaultValue = txtBuild.Text
            DonorSqlDataSource.InsertParameters.Item("unit_num").DefaultValue = txtUnit.Text
            DonorSqlDataSource.InsertParameters.Item("communication_lang").DefaultValue = ddlLang.SelectedValue
            DonorSqlDataSource.InsertParameters.Item("general_remarks").DefaultValue = txtdescr.Text
            DonorSqlDataSource.InsertParameters.Item("work_place").DefaultValue = ddlWork.SelectedValue
            DonorSqlDataSource.InsertParameters.Item("job_title").DefaultValue = ddlJob.SelectedValue
            DonorSqlDataSource.InsertParameters.Item("donor_prev_id").DefaultValue = txtPrvId.Text
            DonorSqlDataSource.InsertParameters.Item("comp_indv").DefaultValue = ddlDonr_tp.SelectedValue
            DonorSqlDataSource.InsertParameters.Item("donor_email").DefaultValue = txtEmail.Text
            DonorSqlDataSource.InsertParameters.Item("salut_code").DefaultValue = ddlTitleDonor.SelectedValue
            DonorSqlDataSource.InsertParameters.Item("donat_to").DefaultValue = txtBehaf.Text
            DonorSqlDataSource.InsertParameters.Item("DonorImportanceID").DefaultValue = DonorImportanceID.Value
            DonorSqlDataSource.InsertParameters.Item("SMSEnabled").DefaultValue = SMSEnabled.Checked
            DonorSqlDataSource.InsertParameters.Item("MethodsToSendReportID").DefaultValue = cmbMethodsToSendReports.SelectedValue
            DonorSqlDataSource.InsertParameters.Item("SendBy").DefaultValue = txtSendBy.Text

            'If HiddenFieldSendReport.Value <> cmbMethodsToSendReports.SelectedValue Then
            DonorSqlDataSource.InsertParameters.Item("MethodsToSendReportAddedBy").DefaultValue = Session(SessionKey.USERNAME)
            DonorSqlDataSource.InsertParameters.Item("MethodsToSendReportAddedDate").DefaultValue = Date.Now
            'Else
            '    DonorSqlDataSource.InsertParameters.Item("MethodsToSendReportAddedBy").DefaultValue = ""
            '    DonorSqlDataSource.InsertParameters.Item("MethodsToSendReportAddedDate").DefaultValue = ""
            'End If

            If (txtLocphone.Text.Trim() <> String.Empty) Then
                If (DonorSqlDataSource.Insert() > 0) Then
                    If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                        ShowAlert("تم إدخال المتبرع بنجاح")
                    ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                        ShowAlert("Donor Inserted Successfully")
                    End If
                End If
            Else
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ShowAlert("من فضلك ادخل التلفون الرئيسى")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ShowAlert("Please Enter Primary Phone")
                End If
            End If
        Else

            DonorSqlDataSource.UpdateParameters.Item("donor_namear").DefaultValue = txtArabicName.Text
            DonorSqlDataSource.UpdateParameters.Item("donor_nameen").DefaultValue = txtDon_nameng.Text
            DonorSqlDataSource.UpdateParameters.Item("donor_civilid").DefaultValue = txtCivilid.Text
            DonorSqlDataSource.UpdateParameters.Item("donor_gender").DefaultValue = ddlGender.SelectedValue
            DonorSqlDataSource.UpdateParameters.Item("donor_nat").DefaultValue = ddlNat.SelectedValue
            DonorSqlDataSource.UpdateParameters.Item("donor_residency").DefaultValue = ddlResident.SelectedValue
            DonorSqlDataSource.UpdateParameters.Item("primary_phone").DefaultValue = txtLocphone.Text
            DonorSqlDataSource.UpdateParameters.Item("phone_2").DefaultValue = txtmob.Text
            DonorSqlDataSource.UpdateParameters.Item("phone_3").DefaultValue = txtphone.Text
            DonorSqlDataSource.UpdateParameters.Item("address_text").DefaultValue = txtAdress.Text
            DonorSqlDataSource.UpdateParameters.Item("po_box").DefaultValue = txtPObox.Text
            DonorSqlDataSource.UpdateParameters.Item("zip_code").DefaultValue = txtzip.Text
            DonorSqlDataSource.UpdateParameters.Item("area_code").DefaultValue = ddlAreadcd.SelectedValue
            DonorSqlDataSource.UpdateParameters.Item("block_num").DefaultValue = txtBlkNo.Text
            DonorSqlDataSource.UpdateParameters.Item("gadda_h").DefaultValue = txtGaddah.Text
            DonorSqlDataSource.UpdateParameters.Item("street_name").DefaultValue = txtstreet.Text
            DonorSqlDataSource.UpdateParameters.Item("building_num").DefaultValue = txtBuild.Text
            DonorSqlDataSource.UpdateParameters.Item("unit_num").DefaultValue = txtUnit.Text
            DonorSqlDataSource.UpdateParameters.Item("communication_lang").DefaultValue = ddlLang.SelectedValue
            DonorSqlDataSource.UpdateParameters.Item("general_remarks").DefaultValue = txtdescr.Text
            DonorSqlDataSource.UpdateParameters.Item("work_place").DefaultValue = ddlWork.SelectedValue
            DonorSqlDataSource.UpdateParameters.Item("job_title").DefaultValue = ddlJob.SelectedValue
            DonorSqlDataSource.UpdateParameters.Item("donor_prev_id").DefaultValue = txtPrvId.Text
            DonorSqlDataSource.UpdateParameters.Item("comp_indv").DefaultValue = ddlDonr_tp.SelectedValue
            DonorSqlDataSource.UpdateParameters.Item("donor_email").DefaultValue = txtEmail.Text
            DonorSqlDataSource.UpdateParameters.Item("salut_code").DefaultValue = ddlTitleDonor.SelectedValue
            DonorSqlDataSource.UpdateParameters.Item("donor_id").DefaultValue = txtDonor.Text
            DonorSqlDataSource.UpdateParameters.Item("donat_to").DefaultValue = txtBehaf.Text
            DonorSqlDataSource.UpdateParameters.Item("DonorImportanceID").DefaultValue = DonorImportanceID.Value
            DonorSqlDataSource.UpdateParameters.Item("SMSEnabled").DefaultValue = SMSEnabled.Checked
            DonorSqlDataSource.UpdateParameters.Item("MethodsToSendReportID").DefaultValue = cmbMethodsToSendReports.SelectedValue
            DonorSqlDataSource.UpdateParameters.Item("SendBy").DefaultValue = txtSendBy.Text

            If HiddenFieldSendReport.Value <> cmbMethodsToSendReports.SelectedValue Then
                DonorSqlDataSource.UpdateParameters.Item("MethodsToSendReportAddedBy").DefaultValue = Session(SessionKey.USERNAME)
                DonorSqlDataSource.UpdateParameters.Item("MethodsToSendReportAddedDate").DefaultValue = Date.Now
            Else
                DonorSqlDataSource.UpdateParameters.Item("MethodsToSendReportAddedBy").DefaultValue = txtMethodToSendReportByUser.Text
                DonorSqlDataSource.UpdateParameters.Item("MethodsToSendReportAddedDate").DefaultValue = txtMethodToSendReportDate.Text
            End If

            If (DonorSqlDataSource.Update() > 0) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    ShowAlert("تم تحديث المتبرع بنجاح")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    ShowAlert("Donor Updated Successfully")
                End If
            End If

        End If

        'DonorImportance()

    End Sub

    Private Sub DonorImportance()

        If DonorImportanceID.Value = 2 Or DonorImportanceID.Value = 3 Then

            txtArabicName.ForeColor = Drawing.Color.Red

        Else

            txtArabicName.ForeColor = Drawing.Color.Black

        End If

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SqlDataSource_DonorImportance.ConnectionString = New ConnectionStringEx().TheConnectionString

        If Not IsPostBack Then

            DonorImportanceID.Enabled = DatabaseSecurity.IsRoleMember(DatabaseRoles.DonorImportance)

            LoadMethodsType()

            ddlAreadcd.SelectedValue = 0
            cmbMethodsToSendReports.SelectedValue = 101

            If Request.QueryString.Count = 0 Then

                CheckBox_DonrSrchMod.Checked = True

                SearchMode()

            End If

        End If

        DonorSqlDataSource.ConnectionString = New ConnectionStringEx().TheConnectionString

        Try
            'ApplyStyle()

            If (IsPostBack) Then

            Else

                If (Not String.IsNullOrWhiteSpace(Request.QueryString("DonorID"))) Then

                    Dim dv As DataView = DirectCast(DonorSqlDataSource.Select(DataSourceSelectArguments.Empty), DataView)

                    For Each drv As DataRowView In dv

                        txtDonor.Text = drv("donor_id").ToString()
                        txtArabicName.Text = drv("donor_namear").ToString()
                        txtDon_nameng.Text = drv("donor_nameen").ToString()
                        txtBehaf.Text = drv("donat_to").ToString()
                        txtBlkNo.Text = drv("block_num").ToString()
                        txtBuild.Text = drv("building_num").ToString()
                        txtCivilid.Text = drv("donor_civilid").ToString()
                        txtPrvId.Text = drv("donor_prev_id").ToString()
                        txtGaddah.Text = drv("gadda_h").ToString()
                        txtLocphone.Text = drv("primary_phone").ToString()
                        txtmob.Text = drv("phone_2").ToString()
                        txtPObox.Text = drv("po_box").ToString()
                        txtphone.Text = drv("phone_3").ToString()
                        txtUnit.Text = drv("unit_num").ToString()
                        txtdescr.Text = drv("general_remarks").ToString()
                        txtstreet.Text = drv("street_name").ToString()
                        txtzip.Text = drv("zip_code").ToString()
                        txtEmail.Text = drv("donor_email").ToString()
                        txtAdress.Text = drv("address_text").ToString()

                        ddlTitleDonor.SelectedValue = If(IsDBNull(drv("salut_code")), Nothing, drv("salut_code").ToString())
                        ddlDonr_tp.SelectedValue = If(IsDBNull(drv("comp_indv")), Nothing, drv("comp_indv").ToString())
                        ddlGender.SelectedValue = If(IsDBNull(drv("donor_gender")), Nothing, drv("donor_gender").ToString())
                        ddlNat.SelectedValue = If(IsDBNull(drv("donor_nat")), Nothing, drv("donor_nat").ToString())
                        ddlJob.SelectedValue = If(IsDBNull(drv("job_title")), Nothing, drv("job_title").ToString())
                        ddlLang.SelectedValue = If(IsDBNull(drv("communication_lang")), Nothing, drv("communication_lang").ToString())
                        ddlResident.SelectedValue = If(IsDBNull(drv("donor_residency")), Nothing, drv("donor_residency").ToString())
                        ddlWork.SelectedValue = If(IsDBNull(drv("work_place")), Nothing, drv("work_place").ToString())
                        ddlAreadcd.SelectedValue = If(IsDBNull(drv("area_code")), Nothing, drv("area_code").ToString())

                        Dim varSMSEnabled As Boolean = False

                        If Boolean.TryParse(drv("SMSEnabled"), varSMSEnabled) Then

                            SMSEnabled.Checked = varSMSEnabled

                        End If

                        insert_userid.Value = drv("insert_userid")
                        insert_date.Value = drv("insert_date")
                        last_update_userid.Value = drv("last_update_userid")
                        last_update_date.Value = drv("last_update_date")

                        DonorImportanceID.Value = drv("DonorImportanceID")

                        cmbMethodsToSendReports.SelectedValue = If(IsDBNull(drv("MethodsToSendReportID")), Nothing, drv("MethodsToSendReportID"))


                        cmbMethodsToSendReports.SelectedValue = If(IsDBNull(drv("MethodsToSendReportID")), 101, drv("MethodsToSendReportID").ToString())
                        HiddenFieldSendReport.Value = drv("MethodsToSendReportID").ToString()
                        txtSendBy.Text = drv("SendBy").ToString

                        txtMethodToSendReportByUser.Text = drv("MethodsToSendReportAddedBy").ToString
                        txtMethodToSendReportDate.Text = drv("MethodsToSendReportAddedDate").ToString

                    Next

                End If

            End If

            If (String.IsNullOrWhiteSpace(txtDonor.Text)) Then
                'lnkNewReceipt.Visible = False
            Else
                lnkNewReceipt.PostBackUrl = "~/Collection.aspx?DonorID=" & txtDonor.Text
                'lnkNewReceipt.PostBackUrl = "~/Collection.aspx"
                'lnkNewReceipt.Visible = True
            End If

            DonorImportance()

            If txtDonor.Text = 1 Or txtDonor.Text = 2 Then
                CmdSave.Enabled = False
            Else
                CmdSave.Enabled = True
            End If

        Catch ex As Exception

        End Try

    End Sub

    Private Sub LoadMethodsType()
        Try
            Dim constr As String = ConfigurationManager.ConnectionStrings("charitysoftConnectionString").ConnectionString
            Dim con As New SqlConnection(constr)
            Dim dt As New SqlDataAdapter
            Dim cmd As New SqlCommand
            Dim ds As New DataSet
            Dim str As String

            str = " SELECT * FROM MethodsToSendReports "
            ds.Clear()
            With cmd
                .CommandTimeout = 180
                .Connection = con
                .CommandType = CommandType.Text
                .CommandText = str
            End With
            dt.SelectCommand = cmd
            con.Open()
            dt.Fill(ds)
            con.Close()
            If ds.Tables(0).Rows.Count > 0 Then

                Dim newRow As DataRow = ds.Tables(0).NewRow()
                newRow(0) = 101
                newRow(1) = "الرجاء الاختيار"
                ds.Tables(0).Rows.Add(newRow)

                cmbMethodsToSendReports.DataSource = ds.Tables(0)
                cmbMethodsToSendReports.DataValueField = "MethodID"
                cmbMethodsToSendReports.DataTextField = "MethodDesc"
                cmbMethodsToSendReports.DataBind()
                'cmbMethodsToSendReports2.SelectedValue = 101
            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles CmdSave.Click

        Saving()

    End Sub

    Protected Sub SqlDataSource3_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource3.Inserted

        txtDonor.Text = e.Command.Parameters("@donor_id_1").Value.ToString()

    End Sub

    Protected Sub DonorSqlDataSource_Inserted(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles DonorSqlDataSource.Inserted
        txtDonor.Text = e.Command.Parameters("@donor_id").Value.ToString()
    End Sub

    Protected Sub lnkNewReceipt_Click(sender As Object, e As EventArgs) Handles lnkNewReceipt.Click

        If txtDonor.Text.Trim() <> String.Empty Then

            Response.Redirect("~/Collection.aspx?DonorID=" & txtDonor.Text)

        Else

            ShowAlert("من فضلك قم بادخال شخص او بحث عن شخص موجود")

        End If

    End Sub

    Private Sub CheckBox_DonrSrchMod_CheckedChanged(sender As Object, e As System.EventArgs) Handles CheckBox_DonrSrchMod.CheckedChanged

        SearchMode()

    End Sub

    Protected Sub btnEnableDonorProfile_Click(sender As Object, e As EventArgs) Handles btnEnableDonorProfile.Click
        'EnableDonorProfile()
        NewDonor()
    End Sub

    Private Sub btnDonrSearch_Click(sender As Object, e As System.EventArgs) Handles btnDonrSearch.Click
        Search_New()
    End Sub

    Private Sub CmdClear_Click(sender As Object, e As System.EventArgs) Handles CmdClear.Click
        ClearForm()
        'If Request.QueryString.Count > 0 Then
        Response.Redirect("~/AddDonar.aspx")
        'End If
    End Sub

    Private Sub Cmd_Col_History_Click(sender As Object, e As System.EventArgs) Handles Cmd_Col_History.Click
        'pnlDonationSearch_ModalPopupExtender.Show()
    End Sub

    Private Sub Cmd_Collection_Click(sender As Object, e As System.EventArgs) Handles Cmd_Collection.Click
        Response.Redirect("DailyCollectionReport.aspx")
    End Sub

    Protected Sub Button_Deduction_Click(sender As Object, e As EventArgs) Handles Button_Deduction.Click
        'If txtDonor.Text.Trim() <> String.Empty Then

        '    Response.Redirect("~/InstructionFrm.aspx?DonorID=" & txtDonor.Text)

        'Else

        '    ShowAlert("من فضلك قم بادخال شخص او بحث عن شخص موجود")

        'End If

        If txtDonor.Text.Trim() = String.Empty Then

            ShowAlert("من فضلك قم بادخال شخص او بحث عن شخص موجود")
            Exit Sub

        End If

        If txtCivilid.Text.Trim() = String.Empty Then

            ShowAlert("لابد من ادخال الرقم المدني للمتبرع أولا")
            txtCivilid.Focus()
            Exit Sub

        End If

        Response.Redirect("~/InstructionFrm.aspx?DonorID=" & txtDonor.Text)

    End Sub

    Private Sub ASPxButton_Print_Click(sender As Object, e As System.EventArgs) Handles ASPxButton_Print.Click

        print_report("donor_statment")

    End Sub

    Private Sub ASPxButton_PrintStatementSummary_Click(sender As Object, e As System.EventArgs) Handles ASPxButton_PrintStatementSummary.Click

        print_report("donor_statmentgroup")

    End Sub


#End Region

End Class