
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView
Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxUploadControl
Imports System.Web.UI
Imports System.IO
Imports System.Drawing
Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class Orphans1
    Inherits BaseWebForm

#Region "Fields"

    Protected _culture As String
    Dim WS As New DataAccessLibrary

#End Region

#Region "Methods"

    Sub ShowAlert(ByVal message As String)
        ScriptManager.RegisterStartupScript(Me.UpdatePanel, UpdatePanel.GetType(), "notificationScript", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
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
                CType(control, DropDownList).SelectedIndex = -1
            Case "DataGrid"
                CType(control, DataGrid).DataSource = Nothing
                control.DataBind()

            Case Else
        End Select

        Session("orphans_app_ser") = ""
        Session("orphans_app_name") = ""
    End Sub

    Public Sub Fill_DDL()
        Dim DDL_DS As DataSet
        Dim SQL As String


        'Session("username") = "sa"
        'Session("password") = "pass@word1"



        'Fill Nat 
        SQL = "select * from nat_tab"

        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_nat.DataSource = DDL_DS.Tables(0)
        ddl_nat.DataTextField = "nat_descrar"
        ddl_nat.DataValueField = "nat_code"
        ddl_nat.DataBind()
        '  ddl_nat.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing




        'Fill country_of_birth 
        SQL = "select * from nat_tab"

        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        ddl_country.DataSource = DDL_DS.Tables(0)
        ddl_country.DataTextField = "nat_descrar"
        ddl_country.DataValueField = "nat_code"
        ddl_country.DataBind()
        '  ddl_nat.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing


        'Fill City Table
        SQL = "select * from city_tab where country_code=" & ddl_country.SelectedValue
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_city.DataSource = DDL_DS.Tables(0)
        ddl_city.DataTextField = "city_name"
        ddl_city.DataValueField = "city_code"
        ddl_city.DataBind()
        ' ddl_city.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill Religion 
        SQL = "select * from religion_tab"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_religion.DataSource = DDL_DS.Tables(0)
        ddl_religion.DataTextField = "religion_namear"
        ddl_religion.DataValueField = "religion_code"
        ddl_religion.DataBind()
        'ddl_religion.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing







        ''Fill Clan
        'SQL = "select * from clan_tab"
        'DDL_DS = New DataSet
        'DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        'Me.ddl_clan.DataSource = DDL_DS.Tables(0)
        'ddl_clan.DataTextField = "clan_namear"
        'ddl_clan.DataValueField = "clan_code"
        'ddl_clan.DataBind()
        '' ddl_clan.Items.Insert(0, "")
        'DDL_DS.Clear()
        'DDL_DS = Nothing



        'Fill Residence Country
        SQL = "select * from nat_tab"

        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_residence_country.DataSource = DDL_DS.Tables(0)
        ddl_residence_country.DataTextField = "nat_descrar"
        ddl_residence_country.DataValueField = "nat_code"
        ddl_residence_country.DataBind()
        ' ddl_residence_country.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing


        'Fill Residence place
        SQL = "select * from orphans_residence_place where place_code=1"

        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_residence_place.DataSource = DDL_DS.Tables(0)
        ddl_residence_place.DataTextField = "place_descr_ar"
        ddl_residence_place.DataValueField = "place_code"
        ddl_residence_place.DataBind()
        DDL_DS.Clear()
        DDL_DS = Nothing


        'Fill currency
        Dim curr_id As Integer
        SQL = "select * from nat_tab where nat_code=" & Me.ddl_residence_country.SelectedValue

        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        curr_id = DDL_DS.Tables(0).Rows(0)(0)
        DDL_DS.Clear()
        DDL_DS = Nothing

        SQL = "select * from currency_tab where currency_code=" & curr_id
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_currency.DataSource = DDL_DS.Tables(0)
        ddl_currency.DataTextField = "currency_descrar"
        ddl_currency.DataValueField = "currency_code"
        ddl_currency.DataBind()
        '  ddl_nat.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing




        ''Fill Donor
        'SQL = "select donor_id,donor_namear  from donor_data"

        'DDL_DS = New DataSet
        'DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        'Me.ddl_donor_name_1.DataSource = DDL_DS.Tables(0)
        'ddl_donor_name_1.DataTextField = "donor_namear"
        'ddl_donor_name_1.DataValueField = "donor_id"
        'ddl_donor_name_1.DataBind()
        '' ddl_donor_name.Items.Insert(0, "")
        'DDL_DS.Clear()
        'DDL_DS = Nothing




        'Fill Mother Job
        SQL = "select job_code,job_descar  from job_tab"

        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_mother_job.DataSource = DDL_DS.Tables(0)
        ddl_mother_job.DataTextField = "job_descar"
        ddl_mother_job.DataValueField = "job_code"
        ddl_mother_job.DataBind()
        ' ddl_mother_job.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill Mother religion
        SQL = "select * from religion_tab"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_mother_religion.DataSource = DDL_DS.Tables(0)
        ddl_mother_religion.DataTextField = "religion_namear"
        ddl_mother_religion.DataValueField = "religion_code"
        ddl_mother_religion.DataBind()
        'ddl_mother_religion.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing



        ''Fill Application Status
        'SQL = "select * from app_status_tab"
        'DDL_DS = New DataSet
        'DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        'Me.ddl_status.DataSource = DDL_DS.Tables(0)
        'ddl_status.DataTextField = "status_ar"
        'ddl_status.DataValueField = "status_code"
        'ddl_status.DataBind()
        '' ddl_status.Items.Insert(0, "")
        'DDL_DS.Clear()
        'DDL_DS = Nothing







        'Fill Rejected By
        SQL = "select * from organization_tab"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_rejected_by.DataSource = DDL_DS.Tables(0)
        ddl_rejected_by.DataTextField = "org_namear"
        ddl_rejected_by.DataValueField = "org_code"
        ddl_rejected_by.DataBind()
        ' ddl_rejected_by.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing




        'Fill Reasons
        SQL = "select * from reason_tab" 'where  reason_cat= 1
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_reasons.DataSource = DDL_DS.Tables(0)
        ddl_reasons.DataTextField = "reason_ar"
        ddl_reasons.DataValueField = "reason_code"
        ddl_reasons.DataBind()
        ' ddl_reasons.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill guarantor job
        SQL = "select job_code,job_descar  from job_tab"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_guarantor_job.DataSource = DDL_DS.Tables(0)
        ddl_guarantor_job.DataTextField = "job_descar"
        ddl_guarantor_job.DataValueField = "job_code"
        ddl_guarantor_job.DataBind()
        '  ddl_guarantor_job.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill guarantor religion
        SQL = "select * from religion_tab"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_guarantor_religion.DataSource = DDL_DS.Tables(0)
        ddl_guarantor_religion.DataTextField = "religion_namear"
        ddl_guarantor_religion.DataValueField = "religion_code"
        ddl_guarantor_religion.DataBind()
        '  ddl_guarantor_religion.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing




        'Fill nominated by
        SQL = "select * from organization_tab"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_nominated_by.DataSource = DDL_DS.Tables(0)
        ddl_nominated_by.DataTextField = "org_namear"
        ddl_nominated_by.DataValueField = "org_code"
        ddl_nominated_by.DataBind()
        '  ddl_nominated_by.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing





    End Sub

#End Region

#Region "Events"

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
                Me.Literal1.Text = ""
                Me.txt_reg_date.Text = DateTime.Now.ToString("dd/MM/yyyy")

                'Fill DropdownLists
                Fill_DDL()



                Me.txt_app_ser.Attributes.Add("onkeydown", "Search();")
                Me.txt_name_ar_5.Attributes.Add("OnBlur", "GetFatherName();")
                Me.lnk_Accepted.Attributes.Add("OnServerClick", "GetFatherName();")
                'Me.Button1.Attributes.Add("OnClick", "getFile();")

                If (Not String.IsNullOrWhiteSpace(Request.QueryString(QueryStringKey.OrphanID))) Then
                    txt_app_ser.Text = Request.QueryString(QueryStringKey.OrphanID)
                    lnk_search_rtn_ServerClick(sender, e)
                Else

                    If Session("form_flg") = "orphan_edu" Or Session("form_flg") = "orphan_health" Or Session("form_flg") = "allocate_doner" Or Session("form_flg") = "orphan_trans" Then
                        If Session("orphans_app_ser") <> "" Then
                            Me.txt_app_ser.Text = Session("orphans_app_ser")
                            lnk_search_rtn_ServerClick(sender, e)
                        End If
                    Else
                        Session("orphans_app_ser") = ""
                        Session("orphans_app_name") = ""
                    End If

                End If


                Session("form_flg") = "orphan"
                'نوع المستفيد 1 يتيم 2 طالب

                Session("orph_type") = 0
                'If Session("app_ser_from_srch") <> "" Then
                '    Me.txt_app_ser.Text = Session("app_ser_from_srch")
                '    'lnk_search_rtn_ServerClick(sender, e)
                'End If

            End If

        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ddl_residence_country_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_residence_country.SelectedIndexChanged
        Dim SQL As String
        Dim Ds As New DataSet
        Dim curr_id As Integer


        'Fill currency
        SQL = "select * from nat_tab where nat_code=" & Me.ddl_residence_country.SelectedValue

        Ds = New DataSet
        Ds = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        curr_id = Ds.Tables(0).Rows(0)(0)
        Ds.Clear()
        Ds = Nothing



        SQL = "select * from currency_tab where currency_code=" & curr_id
        Ds = New DataSet
        Ds = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_currency.DataSource = Ds.Tables(0)
        ddl_currency.DataTextField = "currency_descrar"
        ddl_currency.DataValueField = "currency_code"
        ddl_currency.DataBind()
        '  ddl_nat.Items.Insert(0, "")
        Ds.Clear()
        Ds = Nothing
    End Sub

    Private Sub lnk_new_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_new.ServerClick

        'clear screen
        Clear_Frm(Me)


        Session("Toolbar_Flag") = 0
        Me.Literal1.Text = ""
        Me.txt_reg_date.Text = DateTime.Now.ToString("dd/MM/yyyy")
        Me.txt_app_ser.Enabled = False
        Me.ddl_reasons.Enabled = False
        Me.ddl_rejected_by.Enabled = False

        Me.txt_birth_date.Value = Nothing
        Me.ddl_rel_type.Enabled = False
        Me.ddl_guarantor_job.Enabled = False
        Me.ddl_guarantor_religion.Enabled = False
        Me.txt_guarantor_name.Enabled = False
        Me.txt_guarantor_address.Enabled = False
        Me.ddl_status.Text = "انتظار"

        Session("orphans_app_ser") = ""
        Session("orphans_app_name") = ""
    End Sub

    Private Sub lnk_save_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_save.ServerClick
        Dim format1 As New System.Globalization.CultureInfo("fr-FR", True)

        Dim isNew As Boolean = IIf(txt_app_ser.Text = "", True, False)

        Dim app_id As Int32
        Dim app_reg_date As Date = datalib.FormatDate(txt_reg_date)
        Dim app_birth_date As Date = Me.txt_birth_date.Date 'datalib.FormatDate(Me.txt_birth_date)
        Dim father_death_date As Date = txt_father_death_date.Date ' datalib.FormatDate(Me.txt_father_death_date)
        Dim mother_salary As Double = Val(Me.txt_mother_salary.Text)
        Dim allocate_date As String = datalib.FormatDate(txt_allocation_date)
        Dim orphans_ds As New DataSet


        Session("orphans_app_ser") = ""
        Session("orphans_app_name") = ""




        If String.IsNullOrWhiteSpace(Me.txt_name_ar_1.Text) Or String.IsNullOrWhiteSpace(Me.txt_name_ar_2.Text) Or String.IsNullOrWhiteSpace(Me.txt_name_ar_3.Text) Or String.IsNullOrWhiteSpace(Me.txt_name_ar_4.Text) Or String.IsNullOrWhiteSpace(Me.txt_name_ar_5.Text) Then
            ShowAlert("ادخل بيانات الاسم كاملة")
            Exit Sub
        End If


        If (Me.ddl_nat.SelectedValue < 0) Then
            ShowAlert("ادخل الجنسية")
            Exit Sub
        End If



        If Not IsDate(txt_birth_date.Date) Then
            ShowAlert("ادخل تاريخ الميلاد")
            Exit Sub
        End If


        Dim age As Int32 = DateDiff(DateInterval.Year, txt_birth_date.Date.Date, DateTime.Now)

        If age > 10 And isNew Then
            ShowAlert("لايمكن الحفظ عمر اليتيم اكبر من 10 سنوات")
            Exit Sub
        End If

        If Me.opt_gender.SelectedIndex = -1 Then
            ShowAlert("ادخل جنس اليتيم")
            Exit Sub
        End If


        If Val(Me.txt_guaranteed_brothers.Text) > Val(Me.txt_brothers_count.Text) Then
            ShowAlert("عدد الأخوة المكفولين أكبر من عدد الأخوة")
            Exit Sub
        End If

        If Session("stat") = 2 Then
            If Val(Me.ddl_reasons.SelectedValue <= 0) Or Val(Me.ddl_rejected_by.SelectedValue <= 0) Then
                ShowAlert("ادخل سبب الرفض ، ومرفوض من خلال")
                Exit Sub
            End If
        End If


        Dim orphanParam() As Object = {
                                                      app_reg_date,
                                                      0,
                                                     Convert.ToInt16(Me.ddl_residence_country.SelectedValue),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_name_ar_1.Text), "", Me.txt_name_ar_1.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_name_ar_2.Text), "", Me.txt_name_ar_2.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_name_ar_3.Text), "", Me.txt_name_ar_3.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_name_ar_4.Text), "", Me.txt_name_ar_4.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_name_ar_5.Text), "", Me.txt_name_ar_5.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_name_en_1.Text), "", Me.txt_name_en_1.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_name_en_2.Text), "", Me.txt_name_en_2.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_name_en_3.Text), "", Me.txt_name_en_3.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_name_en_4.Text), "", Me.txt_name_en_4.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_name_en_5.Text), "", Me.txt_name_en_5.Text),
                                                      Me.opt_gender.SelectedIndex,
                                                      Convert.ToInt16(Me.ddl_nat.SelectedValue),
                                                      Convert.ToDateTime(app_birth_date),
                                                      Convert.ToInt16(Me.ddl_city.SelectedValue),
                                                      txt_village.Text,
                                                      Convert.ToInt16(Me.ddl_religion.SelectedValue),
                                                      Convert.ToInt16(ddl_app_type.SelectedIndex),
                                                      Convert.ToInt16(Me.ddl_orp_type.SelectedIndex),
                                                      Convert.ToInt16(Me.ddl_nominated_by.SelectedValue),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_nominated_by_name.Text), "", Me.txt_nominated_by_name.Text),
                                                      "",
                                                      Convert.ToInt16(Session("stat")),
                                                      DateTime.Today.Date,
                                                      Convert.ToInt16(Me.ddl_reasons.SelectedValue),
                                                      Convert.ToInt16(Me.ddl_rejected_by.SelectedValue),
                                                      IIf(String.IsNullOrWhiteSpace(txt_general_notes.Text), "", txt_general_notes.Text),
                                                     IIf(String.IsNullOrWhiteSpace(Me.ddl_clan.Text), "", Me.ddl_clan.Text), ASPxComboBox_orphanage_code.Value}






        'If Session("Toolbar_Flag") = 0 Then

        'Conditions

        ' save new row   


        If isNew Then


            orphans_ds = WS.ExecSpResultSet("charitysoft", Session(SessionKey.USERNAME), Session(SessionKey.PASSWORD), "benf_master_Insert", CommandType.StoredProcedure, orphanParam)



            If orphans_ds.Tables(0).Rows.Count <> 0 Then
                If orphans_ds.Tables(0).Rows(0)(0) > 0 Then
                    Me.txt_app_ser.Text = orphans_ds.Tables(0).Rows(0)(0)
                    ShowAlert("تم الحفظ")

                Else
                    Me.txt_app_ser.Text = ""
                    ShowAlert("خطأ في الحفظ")
                End If
            End If

            orphans_ds.Clear()
            orphans_ds = Nothing

            Dim x As Integer = Val(Me.txt_app_ser.Text)
            Dim orphanParam1() As Object = {x,
                                                            IIf(String.IsNullOrWhiteSpace(Me.txt_mother_name_1.Text), "", Me.txt_mother_name_1.Text),
                                                            IIf(String.IsNullOrWhiteSpace(Me.txt_mother_name_2.Text), "", Me.txt_mother_name_2.Text),
                                                            IIf(String.IsNullOrWhiteSpace(Me.txt_mother_name_3.Text), "", Me.txt_mother_name_3.Text),
                                                            IIf(String.IsNullOrWhiteSpace(Me.txt_mother_name_4.Text), "", Me.txt_mother_name_4.Text),
                                                            Convert.ToInt16(Me.ddl_mother_job.SelectedValue),
                                                            mother_salary,
                                                            Convert.ToInt16(Me.ddl_currency.SelectedValue),
                                                            Convert.ToInt16(Me.ddl_mother_religion.SelectedValue),
                                                            Convert.ToInt16(ddl_parents_status.SelectedIndex),
                                                            Convert.ToDateTime(father_death_date),
                                                            Val(txt_brothers_count.Text),
                                                            Val(txt_guaranteed_brothers.Text),
                                                            Convert.ToInt16(Me.ddl_residence_place.SelectedValue),
                                                            Convert.ToInt16(ddl_rel_type.SelectedIndex),
                                                            IIf(String.IsNullOrWhiteSpace(txt_guarantor_name.Text), "", txt_guarantor_name.Text),
                                                            Convert.ToInt16(ddl_guarantor_job.SelectedValue),
                                                            Convert.ToInt16(ddl_guarantor_religion.SelectedValue),
                                                            IIf(String.IsNullOrWhiteSpace(txt_guarantor_address.Text), "", txt_guarantor_address.Text)}





            orphans_ds = WS.ExecSpResultSet("charitysoft", Session(SessionKey.USERNAME), Session(SessionKey.PASSWORD), "benf_mast_det1_Insert", CommandType.StoredProcedure, orphanParam1)



            Session("Toolbar_Flag") = 1



            'ElseIf Session("Toolbar_Flag") = 1 Then

        ElseIf Not isNew Then


            If Session("stat") = 2 Then
                If Val(Me.ddl_reasons.SelectedValue <= 0) Or Val(Me.ddl_rejected_by.SelectedValue <= 0) Then
                    ShowAlert("ادخل سبب الرفض ، ومرفوض من خلال")
                    Exit Sub
                End If
            End If



            Dim orphanParam2() As Object = {Val(Me.txt_app_ser.Text),
                                                        Convert.ToDateTime(app_reg_date),
                                                       IIf(String.IsNullOrWhiteSpace(Me.txt_name_ar_1.Text), "", Me.txt_name_ar_1.Text),
                                                       IIf(String.IsNullOrWhiteSpace(Me.txt_name_ar_2.Text), "", Me.txt_name_ar_2.Text),
                                                       IIf(String.IsNullOrWhiteSpace(Me.txt_name_ar_3.Text), "", Me.txt_name_ar_3.Text),
                                                       IIf(String.IsNullOrWhiteSpace(Me.txt_name_ar_4.Text), "", Me.txt_name_ar_4.Text),
                                                       IIf(String.IsNullOrWhiteSpace(Me.txt_name_ar_5.Text), "", Me.txt_name_ar_5.Text),
                                                       IIf(String.IsNullOrWhiteSpace(Me.txt_name_en_1.Text), "", Me.txt_name_en_1.Text),
                                                       IIf(String.IsNullOrWhiteSpace(Me.txt_name_en_2.Text), "", Me.txt_name_en_2.Text),
                                                       IIf(String.IsNullOrWhiteSpace(Me.txt_name_en_3.Text), "", Me.txt_name_en_3.Text),
                                                       IIf(String.IsNullOrWhiteSpace(Me.txt_name_en_4.Text), "", Me.txt_name_en_4.Text),
                                                       IIf(String.IsNullOrWhiteSpace(Me.txt_name_en_5.Text), "", Me.txt_name_en_5.Text),
                                                       Me.opt_gender.SelectedIndex,
                                                        Convert.ToInt16(Me.ddl_nat.SelectedValue),
                                                       Convert.ToDateTime(app_birth_date),
                                                       Convert.ToInt16(Me.ddl_city.SelectedValue),
                                                       txt_village.Text,
                                                       Convert.ToInt16(Me.ddl_religion.SelectedValue),
                                                       Convert.ToInt16(ddl_app_type.SelectedIndex),
                                                       Convert.ToInt16(Me.ddl_orp_type.SelectedIndex),
                                                      Convert.ToInt16(Me.ddl_nominated_by.SelectedValue),
                                                       IIf(String.IsNullOrWhiteSpace(Me.txt_nominated_by_name.Text), "", Me.txt_nominated_by_name.Text),
                                                       Convert.ToInt16(Session("stat")),
                                                       DateTime.Today.Date,
                                                       Convert.ToInt16(Me.ddl_reasons.SelectedValue),
                                                       Convert.ToInt16(Me.ddl_rejected_by.SelectedValue),
                                                       IIf(String.IsNullOrWhiteSpace(txt_general_notes.Text), "", txt_general_notes.Text),
                                                        IIf(String.IsNullOrWhiteSpace(Me.ddl_clan.Text), "", Me.ddl_clan.Text),
                                                       Convert.ToInt16(Me.ddl_residence_country.SelectedValue), ASPxComboBox_orphanage_code.Value}

            app_id = WS.ExecSp("charitysoft", Session(SessionKey.USERNAME), Session(SessionKey.PASSWORD), "benf_master_Update", CommandType.StoredProcedure, orphanParam2)

            Dim orphanParam3() As Object = {Val(Me.txt_app_ser.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_mother_name_1.Text), "", Me.txt_mother_name_1.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_mother_name_2.Text), "", Me.txt_mother_name_2.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_mother_name_3.Text), "", Me.txt_mother_name_3.Text),
                                                      IIf(String.IsNullOrWhiteSpace(Me.txt_mother_name_4.Text), "", Me.txt_mother_name_4.Text),
                                                       Convert.ToInt16(Me.ddl_mother_job.SelectedValue),
                                                       mother_salary,
                                                       Convert.ToInt16(Me.ddl_currency.SelectedValue),
                                                       Convert.ToInt16(Me.ddl_mother_religion.SelectedValue),
                                                      Convert.ToInt16(ddl_parents_status.SelectedIndex),
                                                       Convert.ToDateTime(father_death_date),
                                                      Val(txt_brothers_count.Text),
                                                      Val(txt_guaranteed_brothers.Text),
                                                      Convert.ToInt16(Me.ddl_residence_place.SelectedValue),
                                                       Convert.ToInt16(ddl_rel_type.SelectedIndex),
                                                      IIf(String.IsNullOrWhiteSpace(txt_guarantor_name.Text), "", txt_guarantor_name.Text),
                                                       Convert.ToInt16(ddl_guarantor_job.SelectedValue),
                                                       Convert.ToInt16(ddl_guarantor_religion.SelectedValue),
                                                      IIf(String.IsNullOrWhiteSpace(txt_guarantor_address.Text), "", txt_guarantor_address.Text)}


            app_id = WS.ExecSp("charitysoft", Session(SessionKey.USERNAME), Session(SessionKey.PASSWORD), "benf_mast_det1_Update", CommandType.StoredProcedure, orphanParam3)


            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                ShowAlert("تم الحفظ")

            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                ShowAlert("Updated Successfully")
            End If
        End If

        Session("Toolbar_Flag") = 1


        Session("orphans_app_ser") = Me.txt_app_ser.Text
        Session("orphans_app_name") = Me.txt_name_ar_1.Text & Me.txt_name_ar_2.Text & Me.txt_name_ar_3.Text & Me.txt_name_ar_4.Text & Me.txt_name_ar_5.Text


        Try


        Catch exp As SqlException
        End Try
    End Sub

    Private Sub lnk_search_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search.ServerClick
        'clear screen
        Clear_Frm(Me)
        Me.txt_app_ser.Focus()


        Session("Toolbar_Flag") = 1
        Me.txt_app_ser.Enabled = True
        Me.ddl_reasons.Enabled = False
        Me.ddl_rejected_by.Enabled = False

        Me.ddl_rel_type.Enabled = False
        Me.ddl_guarantor_job.Enabled = False
        Me.ddl_guarantor_religion.Enabled = False
        Me.txt_guarantor_name.Enabled = False
        Me.txt_guarantor_address.Enabled = False


        Session("orphans_app_ser") = ""
        Session("orphans_app_name") = ""
    End Sub

    Private Sub lnk_search_rtn_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search_rtn.ServerClick
        Dim format1 As New System.Globalization.CultureInfo("fr-FR", True)
        Dim BenefParam As Object
        Dim BenefMaster_DS As DataSet
        Dim BenefMast_Det1_DS As DataSet
        Dim SQL As String

        If (Not String.IsNullOrWhiteSpace(Request.QueryString(QueryStringKey.OrphanID))) Then
            txt_app_ser.Text = Request.QueryString(QueryStringKey.OrphanID)
        End If

        If Session("app_ser_from_srch") <> "" Then
            Me.txt_app_ser.Text = Session("app_ser_from_srch")
        End If

        BenefParam = Me.txt_app_ser.Text

        BenefMaster_DS = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetBenefMaster", ServiceReference.CommandType.StoredProcedure, BenefParam)


        If BenefMaster_DS.Tables(0).Rows.Count > 0 Then

            Me.txt_app_ser.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(0)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(0))

            If Not IsDate(BenefMaster_DS.Tables(0).Rows(0)(1).ToString()) Then
                If IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(1).ToString()) Then
                    txt_reg_date.Text = ""
                End If
            Else
                If BenefMaster_DS.Tables(0).Rows(0)(1).ToString() = "1/1/1900 12:00:00 AM" Then
                    txt_reg_date.Text = ""
                Else
                    txt_reg_date.Text = CDate(BenefMaster_DS.Tables(0).Rows(0)(1)).ToString("dd/MM/yyyy")
                End If
            End If

            ' Me.txt_reg_date.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(1).ToString()), String.Empty, CDate(BenefMaster_DS.Tables(0).Rows(0)(1)).ToString("dd/MM/yyyy"))


            Me.ddl_residence_country.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(3)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(3))

            Me.txt_name_ar_1.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(4)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(4))
            Me.txt_name_ar_2.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(5)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(5))
            Me.txt_name_ar_3.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(6)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(6))
            Me.txt_name_ar_4.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(7)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(7))
            Me.txt_name_ar_5.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(8)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(8))

            Me.txt_name_en_1.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(9)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(9))
            Me.txt_name_en_2.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(10)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(10))
            Me.txt_name_en_3.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(11)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(11))
            Me.txt_name_en_4.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(12)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(12))
            Me.txt_name_en_5.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(13)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(13))

            Me.opt_gender.SelectedIndex = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(14)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(14))



            Me.ddl_nat.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(15)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(15))
            Me.txt_birth_date.Date = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(16)), String.Empty, CDate(BenefMaster_DS.Tables(0).Rows(0)(16)))
            Dim cit As Integer = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(17)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(17))




            Dim City_DS As DataSet
            Dim City_DS1 As DataSet


            'Fill City Table
            SQL = "select country_code from city_tab where city_code =" & cit
            City_DS1 = New DataSet
            City_DS1 = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_country.SelectedValue = City_DS1.Tables(0).Rows(0)(0)
            City_DS1.Clear()
            City_DS1 = Nothing

            SQL = "select * from city_tab where country_code=" & ddl_country.SelectedValue
            City_DS = New DataSet
            City_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_city.DataSource = City_DS.Tables(0)
            ddl_city.DataTextField = "city_name"
            ddl_city.DataValueField = "city_code"
            ddl_city.DataBind()
            ' ddl_city.Items.Insert(0, "")
            City_DS.Clear()
            City_DS = Nothing


            Me.ddl_city.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(17)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(17))
            Me.ddl_religion.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(18)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(18))
            Me.txt_village.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(19)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(19))


            Me.ddl_app_type.SelectedIndex = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(20)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(20))
            Me.ddl_orp_type.SelectedIndex = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(21)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(21))


            Me.ddl_nominated_by.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(22)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(22))
            Me.txt_nominated_by_name.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(23)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(23))

            Session("stat") = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(24)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(24))
            If Session("stat") = 0 Then
                Me.ddl_status.Text = "انتظار"
            ElseIf Session("stat") = 1 Then
                Me.ddl_status.Text = "مقبول"
            Else
                Me.ddl_status.Text = "مرفوض"
            End If
            Me.ddl_reasons.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(25)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(25))
            Me.ddl_rejected_by.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(26)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(26))
            Me.txt_general_notes.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(27)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(27))

            'Dim x As String = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(20)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(20))
            Me.ddl_clan.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(28)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(28))

            Me.txt_donor_name.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(29)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(29))
            ' Me.txt_allocation_date.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(48)), String.Empty, CDate(BenefMaster_DS.Tables(0).Rows(0)(48)).ToString("dd/MM/yyyy"))

            If Not IsDate(BenefMaster_DS.Tables(0).Rows(0)(30).ToString()) Then
                If IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(30)) Then
                    txt_allocation_date.Text = ""
                End If
            Else
                txt_allocation_date.Text = BenefMaster_DS.Tables(0).Rows(0)(30).ToString()
                If BenefMaster_DS.Tables(0).Rows(0)(30).ToString() = "1/1/1900 12:00:00 AM" Then
                    txt_allocation_date.Text = ""
                Else
                    txt_allocation_date.Text = CDate(BenefMaster_DS.Tables(0).Rows(0)(30)).ToString("dd/MM/yyyy")
                End If
            End If

            ASPxComboBox_Center_id.Value = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)("Center_id")), Nothing, BenefMaster_DS.Tables(0).Rows(0)("Center_id"))
            ASPxComboBox_orphanage_code.Value = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)("orphanage_code")), Nothing, BenefMaster_DS.Tables(0).Rows(0)("orphanage_code"))

        End If




        BenefMast_Det1_DS = New DataSet
        BenefMast_Det1_DS = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetBenefMasterDet1", ServiceReference.CommandType.StoredProcedure, BenefParam)
        If BenefMast_Det1_DS.Tables(0).Rows.Count > 0 Then


            Me.txt_mother_name_1.Text = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(0)), String.Empty, BenefMast_Det1_DS.Tables(0).Rows(0)(0))
            Me.txt_mother_name_2.Text = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(1)), String.Empty, BenefMast_Det1_DS.Tables(0).Rows(0)(1))
            Me.txt_mother_name_3.Text = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(2)), String.Empty, BenefMast_Det1_DS.Tables(0).Rows(0)(2))
            Me.txt_mother_name_4.Text = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(3)), String.Empty, BenefMast_Det1_DS.Tables(0).Rows(0)(3))

            Me.ddl_mother_job.SelectedValue = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(4)), Nothing, BenefMast_Det1_DS.Tables(0).Rows(0)(4))
            Me.txt_mother_salary.Text = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(5)), String.Empty, BenefMast_Det1_DS.Tables(0).Rows(0)(5))

            If Me.ddl_residence_country.SelectedValue <> 0 Then

                'Fill currency

                Dim Cur_DS As New DataSet
                Dim curr_id As Integer
                SQL = "select * from nat_tab where nat_code=" & Convert.ToInt16(Me.ddl_residence_country.SelectedValue)

                Cur_DS = New DataSet
                Cur_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
                curr_id = Cur_DS.Tables(0).Rows(0)(0)
                Cur_DS.Clear()
                Cur_DS = Nothing


                SQL = "select * from currency_tab where currency_code=" & curr_id
                Cur_DS = New DataSet
                Cur_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
                Me.ddl_currency.DataSource = Cur_DS.Tables(0)
                ddl_currency.DataTextField = "currency_descrar"
                ddl_currency.DataValueField = "currency_code"
                ddl_currency.DataBind()
                '  ddl_nat.Items.Insert(0, "")
                Cur_DS.Clear()
                Cur_DS = Nothing



                Me.ddl_currency.SelectedValue = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(6)), Nothing, BenefMast_Det1_DS.Tables(0).Rows(0)(6))

            End If

            Me.ddl_mother_religion.SelectedValue = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(7)), Nothing, BenefMast_Det1_DS.Tables(0).Rows(0)(7))

            Me.ddl_parents_status.SelectedIndex = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(8)), Nothing, BenefMast_Det1_DS.Tables(0).Rows(0)(8))

            If Not IsDate(BenefMast_Det1_DS.Tables(0).Rows(0)(9).ToString()) Then
                If IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(9)) Then
                    txt_father_death_date.Text = ""
                End If
            Else
                txt_father_death_date.Text = BenefMast_Det1_DS.Tables(0).Rows(0)(9).ToString()
                If BenefMast_Det1_DS.Tables(0).Rows(0)(9).ToString() = "1/1/1900 12:00:00 AM" Then
                    txt_father_death_date.Text = ""
                Else
                    txt_father_death_date.Text = CDate(BenefMast_Det1_DS.Tables(0).Rows(0)(9)).ToString("dd/MM/yyyy")
                End If
            End If

            '  Me.txt_father_death_date.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(32)), String.Empty, CDate(BenefMaster_DS.Tables(0).Rows(0)(32)).ToString("dd/MM/yyyy"))
            Me.txt_brothers_count.Text = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(10)), String.Empty, BenefMast_Det1_DS.Tables(0).Rows(0)(10))
            Me.txt_guaranteed_brothers.Text = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(11)), String.Empty, BenefMast_Det1_DS.Tables(0).Rows(0)(11))

            Dim RDs As New DataSet
            If Me.ddl_orp_type.SelectedIndex = 0 Then


                'Fill Residence place
                SQL = "select * from orphans_residence_place where place_code=1"

                RDs = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
                Me.ddl_residence_place.DataSource = RDs.Tables(0)
                ddl_residence_place.DataTextField = "place_descr_ar"
                ddl_residence_place.DataValueField = "place_code"
                ddl_residence_place.DataBind()
                RDs.Clear()
                RDs = Nothing


                Me.ddl_rel_type.Enabled = False
                Me.ddl_guarantor_job.Enabled = False
                Me.ddl_guarantor_religion.Enabled = False
                Me.txt_guarantor_name.Enabled = False
                Me.txt_guarantor_address.Enabled = False
            Else


                'Fill Residence place
                SQL = "select * from orphans_residence_place where place_code >1"

                RDs = New DataSet
                RDs = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
                Me.ddl_residence_place.DataSource = RDs.Tables(0)
                ddl_residence_place.DataTextField = "place_descr_ar"
                ddl_residence_place.DataValueField = "place_code"
                ddl_residence_place.DataBind()
                RDs.Clear()
                RDs = Nothing


                Me.ddl_rel_type.Enabled = True
                Me.ddl_guarantor_job.Enabled = True
                Me.ddl_guarantor_religion.Enabled = True
                Me.txt_guarantor_name.Enabled = True
                Me.txt_guarantor_address.Enabled = True
                Me.ddl_residence_place.SelectedValue = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(12)), Nothing, BenefMast_Det1_DS.Tables(0).Rows(0)(12))
                Me.ddl_rel_type.SelectedIndex = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(13)), Nothing, BenefMast_Det1_DS.Tables(0).Rows(0)(13))
                Me.txt_guarantor_name.Text = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(14)), String.Empty, BenefMast_Det1_DS.Tables(0).Rows(0)(14))
                Me.ddl_guarantor_job.SelectedValue = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(15)), Nothing, BenefMast_Det1_DS.Tables(0).Rows(0)(15))
                Me.ddl_guarantor_religion.SelectedValue = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(16)), Nothing, BenefMast_Det1_DS.Tables(0).Rows(0)(16))
                Me.txt_guarantor_address.Text = If(IsDBNull(BenefMast_Det1_DS.Tables(0).Rows(0)(17)), String.Empty, BenefMast_Det1_DS.Tables(0).Rows(0)(17))
            End If



        End If


        Me.txt_app_ser.Enabled = False
        Me.txt_father_name_1.Text = Me.txt_name_ar_2.Text
        Me.txt_father_name_2.Text = Me.txt_name_ar_3.Text
        Me.txt_father_name_3.Text = Me.txt_name_ar_4.Text
        Me.txt_father_name_4.Text = Me.txt_name_ar_5.Text

        Session("app_ser_from_srch") = ""



        Session("orphans_app_ser") = Me.txt_app_ser.Text
        Session("orphans_app_name") = Me.txt_name_ar_1.Text & Me.txt_name_ar_2.Text & Me.txt_name_ar_3.Text & Me.txt_name_ar_4.Text & Me.txt_name_ar_5.Text
    End Sub

    Private Sub lnk_Get_Father_name_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_Get_Father_name.ServerClick

        Me.txt_father_name_1.Text = Me.txt_name_ar_2.Text
        Me.txt_father_name_2.Text = Me.txt_name_ar_3.Text
        Me.txt_father_name_3.Text = Me.txt_name_ar_4.Text
        Me.txt_father_name_4.Text = Me.txt_name_ar_5.Text
        Me.txt_name_en_1.Focus()
    End Sub

    Private Sub lnk_Accepted_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_Accepted.ServerClick
        Me.ddl_status.text = "مقبول"
        Session("stat") = 1
        Me.ddl_reasons.Enabled = False
        Me.ddl_rejected_by.Enabled = False
    End Sub

    Private Sub lnk_rejected_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_rejected.ServerClick
        Me.ddl_status.text = "مرفوض"
        Session("stat") = 2
        Me.ddl_reasons.Enabled = True
        Me.ddl_rejected_by.Enabled = True
    End Sub

    Protected Sub ddl_orp_type_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_orp_type.SelectedIndexChanged
        Dim SQL As String
        Dim DS As New DataSet
        SQL = ""


        If Me.ddl_orp_type.SelectedIndex = 0 Then


            'Fill Residence place
            Sql = "select * from orphans_residence_place where place_code=1"

            DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), Sql)
            Me.ddl_residence_place.DataSource = DS.Tables(0)
            ddl_residence_place.DataTextField = "place_descr_ar"
            ddl_residence_place.DataValueField = "place_code"
            ddl_residence_place.DataBind()
            DS.Clear()
            DS = Nothing


            Me.ddl_rel_type.Enabled = False
            Me.ddl_guarantor_job.Enabled = False
            Me.ddl_guarantor_religion.Enabled = False
            Me.txt_guarantor_name.Enabled = False
            Me.txt_guarantor_address.Enabled = False
        Else


            'Fill Residence place
            SQL = "select * from orphans_residence_place where place_code >1"

            DS = New DataSet
            DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_residence_place.DataSource = DS.Tables(0)
            ddl_residence_place.DataTextField = "place_descr_ar"
            ddl_residence_place.DataValueField = "place_code"
            ddl_residence_place.DataBind()
            DS.Clear()
            DS = Nothing


            Me.ddl_rel_type.Enabled = True
            Me.ddl_guarantor_job.Enabled = True
            Me.ddl_guarantor_religion.Enabled = True
            Me.txt_guarantor_name.Enabled = True
            Me.txt_guarantor_address.Enabled = True

        End If
        Me.ddl_orp_type.Focus()
    End Sub

    Private Sub lnk_pending_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_pending.ServerClick
        Me.ddl_status.text = "انتظار"
        Session("stat") = 0
        Me.ddl_reasons.Enabled = False
        Me.ddl_rejected_by.Enabled = False
    End Sub

    Private Sub ddl_country_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddl_country.SelectedIndexChanged
        Dim SQL As String
        Dim DDL_DS As DataSet

        'Fill City Table
        SQL = "select * from city_tab where country_code=" & ddl_country.SelectedValue
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_city.DataSource = DDL_DS.Tables(0)
        ddl_city.DataTextField = "city_name"
        ddl_city.DataValueField = "city_code"
        ddl_city.DataBind()
        ' ddl_city.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing

        Me.ddl_country.Focus()

    End Sub

    Private Sub Link_Allocate_ServerClick(sender As Object, e As System.EventArgs) Handles Link_Allocate.ServerClick
        Response.Redirect("allocate_donor.aspx")
    End Sub

    Private Sub Link_Edu_ServerClick(sender As Object, e As System.EventArgs) Handles Link_Edu.ServerClick
        Response.Redirect("orphans_education.aspx")
    End Sub

    Private Sub Link_Health_ServerClick(sender As Object, e As System.EventArgs) Handles Link_Health.ServerClick
        Response.Redirect("orphans_health_file.aspx")
    End Sub

    Private Sub Link_Pic_ServerClick(sender As Object, e As System.EventArgs) Handles Link_Pic.ServerClick
        Response.Redirect("Orphan_images.aspx")
    End Sub

    Private Sub Link_transfer_ServerClick(sender As Object, e As System.EventArgs) Handles Link_transfer.ServerClick
        Response.Redirect("orphans_transfer1.aspx")
    End Sub

#End Region

End Class