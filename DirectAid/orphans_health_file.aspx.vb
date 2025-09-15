Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading


Public Class orphans_health_file
    Inherits BaseWebForm



    Protected _culture As String
    Dim WS As New DataAccessLibrary

    Sub Clear_Frm(ByVal container As Control)
        Try
            Dim control As Control

            For Each control In container.Controls

                ClearControl(control)

                If control.HasControls() Then
                    Clear_Frm(control)
                End If
            Next

        Catch ex As Exception

        End Try
    End Sub

    Sub ClearControl(ByRef control As Control)
        Try

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

        Catch ex As Exception

        End Try
    End Sub

    Public Sub Fill_DDL()

        Try


  
        Dim DDL_DS As DataSet
        Dim SQL As String


            'Session("username") = "sa"
            'Session("password") = "pass@word1"





        ''Fill  ddl center  type
        'SQL = "select * from organization_type"
        'DDL_DS = New DataSet
        'DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        'Me.ddl_center_type.DataSource = DDL_DS.Tables(0)
        'ddl_center_type.DataTextField = "org_type_ar"
        'ddl_center_type.DataValueField = "org_type_code"
        'ddl_center_type.DataBind()

        'DDL_DS.Clear()
        'DDL_DS = Nothing


        ' If Me.ddl_center_type.SelectedValue = 1 Then


        Me.ddl_DirAid_center.Enabled = True

        'Fill  Center_names
        SQL = "select * from health_center_tab"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_DirAid_center.DataSource = DDL_DS.Tables(0)
        ddl_DirAid_center.DataTextField = "center_name_ar"
        ddl_DirAid_center.DataValueField = "health_center_code"
        ddl_DirAid_center.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing


        'Else
        'Me.ddl_DirAid_center.Enabled = False
        'Me.txt_center_name.Enabled = True
        'End If




        'Fill  psych_state
        SQL = "select * from psych_state_tab "
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_psych_status.DataSource = DDL_DS.Tables(0)
        ddl_psych_status.DataTextField = "psych_stat_namear"
        ddl_psych_status.DataValueField = "psych_stat_code"
        ddl_psych_status.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill  general_appearance
        SQL = "select * from general_appearance_tab "
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_general_status.DataSource = DDL_DS.Tables(0)
        ddl_general_status.DataTextField = "descr_ar"
        ddl_general_status.DataValueField = "status_code"
        ddl_general_status.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill  surgery
        SQL = "select * from surgery_tab "
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_surger_status.DataSource = DDL_DS.Tables(0)
        ddl_surger_status.DataTextField = "surgery_name_ar"
        ddl_surger_status.DataValueField = "surgery_code"
        ddl_surger_status.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing

        'Fill  Diseases
        SQL = "select * from disease_tab "
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_current_disease.DataSource = DDL_DS.Tables(0)
        ddl_current_disease.DataTextField = "disease_descr_ar"
        ddl_current_disease.DataValueField = "disease_code"
        ddl_current_disease.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill  ddl_health_status
        SQL = "select * from health_status"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_health_status.DataSource = DDL_DS.Tables(0)
        ddl_health_status.DataTextField = "health_descr_ar"
        ddl_health_status.DataValueField = "health_code"
        ddl_health_status.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing


        'Fill  ddl_hearing_status
        SQL = "select * from health_status"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_hearing_status.DataSource = DDL_DS.Tables(0)
        ddl_hearing_status.DataTextField = "health_descr_ar"
        ddl_hearing_status.DataValueField = "health_code"
        ddl_hearing_status.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill  ddl_eye_status
        SQL = "select * from health_status"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_eye_status.DataSource = DDL_DS.Tables(0)
        ddl_eye_status.DataTextField = "health_descr_ar"
        ddl_eye_status.DataValueField = "health_code"
        ddl_eye_status.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing


       Catch ex As Exception

        End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '  Try


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
            ' DateTime.Now.ToString("dd/MM/yyyy")

            'Fill DropdownLists
            Fill_DDL()



            Me.txt_app_ser.Attributes.Add("onkeydown", "Search();")
            'Me.txt_name_ar_5.Attributes.Add("OnBlur", "GetFatherName();")



            If Not Session("orphans_app_ser") Is Nothing And Not Session("orphans_app_name") Is Nothing Then
                Me.txt_app_ser.Text = Session("orphans_app_ser")
                Me.txt_orphan_name.Text = Session("orphans_app_name")
                lnk_search_rtn_ServerClick(sender, e)
            End If
        End If



        Session("form_flg") = "orphan_health"
        Session("orph_type") = 0
        'Catch ex As Exception

        'End Try
    End Sub

    'Private Sub lnk_new_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_new.ServerClick
    '    'clear screen
    '    Clear_Frm(Me)


    '    Session("Toolbar_Flag") = 0
    '    Me.Literal1.Text = ""
    '    Me.chk_card_available.Checked = False
    'End Sub

    Private Sub lnk_save_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_save.ServerClick
        Try

            Dim report_date As Date = txt_report_date.Date  'datalib.FormatDate(txt_report_date.Date)
            Dim vacc_card As Integer

            If Me.chk_card_available.Checked = True Then
                vacc_card = 1
            Else
                vacc_card = 0
            End If


            If Me.txt_app_ser.Text = "" And Me.txt_orphan_name.Text = "" Then
                ShowAlert("ادخل رقم اليتيم أولا")
                Exit Sub
            End If

            If ddl_health_status.SelectedValue = 0 Then
                ShowAlert("ادخل الحالة الصحية أولا")
                Exit Sub
            End If

            If ddl_hearing_status.SelectedValue = 0 Then
                ShowAlert("ادخل حالة السمع أولا")
                Exit Sub
            End If

            If ddl_eye_status.SelectedValue = 0 Then
                ShowAlert("ادخل حالة النظر أولا")
                Exit Sub
            End If

            If ddl_psych_status.SelectedValue = 0 Then
                ShowAlert("ادخل الحالة النفسيه أولا")
                Exit Sub
            End If

            If ddl_general_status.SelectedValue = 0 Then
                ShowAlert("ادخل حالة المظهر  العام أولا")
                Exit Sub
            End If

            If ddl_center_type.SelectedIndex = 0 Then
                ShowAlert("ادخل نوع المركز  أولا")
                Exit Sub
            End If

            If ddl_center_type.SelectedIndex = 0 Then
                ShowAlert("ادخل نوع المركز  أولا")
                Exit Sub
            End If

            If Me.ddl_center_type.SelectedIndex = 1 And Me.ddl_DirAid_center.SelectedIndex = -1 Then

                If ddl_center_type.SelectedIndex = 0 Then
                    ShowAlert("ادخل المركز التابع للهيئة أولا")
                    Exit Sub
                End If

            ElseIf Me.ddl_center_type.SelectedIndex = 2 And Me.txt_center_name.Text = "" Then

                If ddl_center_type.SelectedIndex = 0 Then
                    ShowAlert("ادخل اسم المركز الصحي أولا")
                    Exit Sub
                End If
            End If
            'Conditions


            Dim orphanParam() As Object = {Convert.ToInt16(Me.txt_app_ser.Text),
                                                            Convert.ToInt16(Me.ddl_health_status.SelectedValue),
                                                            Convert.ToInt16(Me.ddl_hearing_status.SelectedValue),
                                                            Convert.ToInt16(Me.ddl_eye_status.SelectedValue),
                                                            Convert.ToInt16(Me.ddl_psych_status.SelectedValue),
                                                            Convert.ToInt16(Me.ddl_general_status.SelectedValue),
                                                            Convert.ToInt16(ddl_surger_status.SelectedValue),
                                                            IIf(String.IsNullOrWhiteSpace(Me.txt_diseases_descr.Text), "", Me.txt_diseases_descr.Text),
                                                            Convert.ToInt16(Me.ddl_center_type.SelectedIndex),
                                                            IIf(String.IsNullOrWhiteSpace(Me.txt_center_name.Text), "", Me.txt_center_name.Text),
                                                            Convert.ToInt16(Me.ddl_DirAid_center.SelectedValue),
                                                            vacc_card,
                                                            Convert.ToInt16(ddl_current_disease.SelectedValue),
                                                            Me.txt_report_date.Date}


            ' save new row   

            WS.ExecSp("charitysoft", Session(SessionKey.USERNAME), Session(SessionKey.PASSWORD), "benf_master_health_Update", CommandType.StoredProcedure, orphanParam)



            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                ShowAlert("تم الحفظ بنجاح")
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                ShowAlert("Saved Successfully")
            End If


        Catch ex As Exception

        End Try
    End Sub

    Private Sub lnk_search_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search.ServerClick
        Try


            'clear screen
            Clear_Frm(Me)


            Session("orph_education_flg") = 1
            Me.Literal1.Text = ""
            Me.txt_app_ser.Enabled = True
            Me.chk_card_available.Checked = False
            Me.txt_app_ser.Focus()

        Catch ex As Exception

        End Try
    End Sub

    Private Sub lnk_search_rtn_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search_rtn.ServerClick
        Try


            If Session("app_ser_from_srch") <> "" Then
                Me.txt_app_ser.Text = Session("app_ser_from_srch")
            End If


            Dim ds As New DataSet
            Dim BenefParam As Object

            BenefParam = {Me.txt_app_ser.Text}

            ds = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "Get_orph_name", ServiceReference.CommandType.StoredProcedure, BenefParam)

            If ds.Tables(0).Rows.Count > 0 Then

                Me.txt_orphan_name.Text = If(IsDBNull(ds.Tables(0).Rows(0)(0)), String.Empty, ds.Tables(0).Rows(0)(0))
            End If
            ds.Clear()
            ds = Nothing


            BenefParam = ""
            BenefParam = {Me.txt_app_ser.Text}

            ds = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "Get_benf_master_health", ServiceReference.CommandType.StoredProcedure, BenefParam)

            If ds.Tables(0).Rows.Count > 0 Then

                Me.ddl_health_status.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)(0)), 0, ds.Tables(0).Rows(0)(0))
                Me.ddl_hearing_status.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)(1)), 0, ds.Tables(0).Rows(0)(1))
                Me.ddl_eye_status.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)(2)), 0, ds.Tables(0).Rows(0)(2))
                Me.ddl_psych_status.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)(3)), 0, ds.Tables(0).Rows(0)(3))
                Me.ddl_general_status.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)(4)), 0, ds.Tables(0).Rows(0)(4))
                Me.ddl_surger_status.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)(5)), 0, ds.Tables(0).Rows(0)(5))
                Me.txt_diseases_descr.Text = If(IsDBNull(ds.Tables(0).Rows(0)(6)), String.Empty, ds.Tables(0).Rows(0)(6))
                Me.ddl_center_type.SelectedIndex = If(IsDBNull(ds.Tables(0).Rows(0)(7)), 0, ds.Tables(0).Rows(0)(7))
                If Me.ddl_center_type.SelectedIndex = 1 Then
                    Dim SQl As String
                    Dim Ddl_Ds As DataSet

                    Me.ddl_DirAid_center.Enabled = True

                    'Fill  Center_names
                    SQl = "select * from health_center_tab"
                    Ddl_Ds = New DataSet
                    Ddl_Ds = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQl)
                    Me.ddl_DirAid_center.DataSource = Ddl_Ds.Tables(0)
                    ddl_DirAid_center.DataTextField = "center_name_ar"
                    ddl_DirAid_center.DataValueField = "health_center_code"
                    ddl_DirAid_center.DataBind()

                    Ddl_Ds.Clear()
                    Ddl_Ds = Nothing

                    Me.ddl_DirAid_center.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)(9)), 0, ds.Tables(0).Rows(0)(9))
                Else
                    Me.txt_center_name.Text = If(IsDBNull(ds.Tables(0).Rows(0)(8)), String.Empty, ds.Tables(0).Rows(0)(8))
                    Me.ddl_DirAid_center.Enabled = False
                    Me.txt_center_name.Enabled = True
                End If

                Me.chk_card_available.Checked = If(IsDBNull(ds.Tables(0).Rows(0)(10)), 0, ds.Tables(0).Rows(0)(10))
                Me.ddl_current_disease.SelectedValue = If(IsDBNull(ds.Tables(0).Rows(0)(11)), 0, ds.Tables(0).Rows(0)(11))
            End If
            ds.Clear()
            ds = Nothing
            Me.txt_app_ser.Focus()

            Session("app_ser_from_srch") = ""
            Session("orphans_app_ser") = Me.txt_app_ser.Text
            Session("orphans_app_name") = Me.txt_orphan_name.Text
        Catch ex As Exception

        End Try
    End Sub
  

    Sub ShowAlert(ByVal message As String)
        ScriptManager.RegisterStartupScript(Me.UpdatePanel, UpdatePanel.GetType(), "notificationScript", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
    End Sub

    Private Sub ddl_center_type_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddl_center_type.SelectedIndexChanged
        Try

            Dim SQL As String
            Dim DDL_DS As New DataSet


            If ddl_center_type.SelectedIndex = 1 Then

                'Fill  Center_names
                SQL = "select * from health_center_tab"
                DDL_DS = New DataSet
                DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
                Me.ddl_DirAid_center.DataSource = DDL_DS.Tables(0)
                ddl_DirAid_center.DataTextField = "center_name_ar"
                ddl_DirAid_center.DataValueField = "health_center_code"
                ddl_DirAid_center.DataBind()

                DDL_DS.Clear()
                DDL_DS = Nothing
                Me.txt_center_name.Enabled = False
                ddl_DirAid_center.Enabled = True
                Me.txt_center_name.Text = ""
            Else
                Me.ddl_DirAid_center.SelectedValue = 0
                Me.txt_center_name.Enabled = True
                ddl_DirAid_center.Enabled = False
            End If


        Catch ex As Exception

        End Try
    End Sub



End Class