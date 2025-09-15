
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class orphans_transfer1
    Inherits BaseWebForm

#Region "Fields"

    Protected _culture As String

    Dim WS As New DataAccessLibrary

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




        'Fill  ddl  from center
        SQL = "select * from center_tab"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_from_center.DataSource = DDL_DS.Tables(0)
        ddl_from_center.DataTextField = "center_namear"
        ddl_from_center.DataValueField = "center_code"
        ddl_from_center.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill  to Center
        SQL = "select * from center_tab"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_to_center.DataSource = DDL_DS.Tables(0)
        ddl_to_center.DataTextField = "center_namear"
        ddl_to_center.DataValueField = "center_code"
        ddl_to_center.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill  REASONS
        SQL = "select * from reason_tab WHERE reason_cat = 1"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_reasons.DataSource = DDL_DS.Tables(0)
        ddl_reasons.DataTextField = "reason_ar"
        ddl_reasons.DataValueField = "reason_code"
        ddl_reasons.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing


    End Sub

    Sub ShowAlert(ByVal message As String)
        ScriptManager.RegisterStartupScript(Me.UpdatePanel, UpdatePanel.GetType(), "notificationScript", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
    End Sub

    Sub Change_Benf_Type()
        Dim SQL As String
        Dim DDL_DS As DataSet



        If Me.ddl_benf_type.SelectedIndex = 0 Then

            grd_student.Visible = False
            grd_transfer.Visible = True

            'Fill  REASONS
            SQL = "select * from reason_tab WHERE reason_cat = 2"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_reasons.DataSource = DDL_DS.Tables(0)
            ddl_reasons.DataTextField = "reason_ar"
            ddl_reasons.DataValueField = "reason_code"
            ddl_reasons.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing


            Me.lbl_center_to.Visible = True
            Me.lbl_center_from.Visible = True
            Me.ddl_from_center.Visible = True
            Me.ddl_to_center.Visible = True

            Me.lbl_center_from.Text = "من مركز"
            Me.lbl_center_to.Text = " إلى مركز"

            'Fill  ddl  from center
            SQL = "select * from center_tab"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_from_center.DataSource = DDL_DS.Tables(0)
            ddl_from_center.DataTextField = "center_namear"
            ddl_from_center.DataValueField = "center_code"
            ddl_from_center.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing



            'Fill  to Center
            SQL = "select * from center_tab"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_to_center.DataSource = DDL_DS.Tables(0)
            ddl_to_center.DataTextField = "center_namear"
            ddl_to_center.DataValueField = "center_code"
            ddl_to_center.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing

        ElseIf Me.ddl_benf_type.SelectedIndex = 1 Then

            grd_student.Visible = True
            grd_transfer.Visible = False


            'Fill  REASONS
            SQL = "select * from reason_tab WHERE reason_cat = 6"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_reasons.DataSource = DDL_DS.Tables(0)
            ddl_reasons.DataTextField = "reason_ar"
            ddl_reasons.DataValueField = "reason_code"
            ddl_reasons.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing




            Me.lbl_center_to.Visible = True
            Me.lbl_center_from.Visible = True
            Me.ddl_to_center.Visible = True

            Me.lbl_center_from.Text = "من مؤسسة"
            Me.lbl_center_to.Text = "إلى مؤسسة"
            Me.lbl_center_to.Width = 120

            'Fill  ddl  from center

            SQL = "select school_code,school_name_ar,school_name_en from school_master order by school_code"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_from_center.DataSource = DDL_DS.Tables(0)
            ddl_from_center.DataTextField = "school_name_ar"
            ddl_from_center.DataValueField = "school_code"
            ddl_from_center.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing



            'Fill  to Center
            SQL = "select school_code,school_name_ar,school_name_en from school_master order by school_code"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_to_center.DataSource = DDL_DS.Tables(0)
            ddl_to_center.DataTextField = "school_name_ar"
            ddl_to_center.DataValueField = "school_code"
            ddl_to_center.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing

        ElseIf Me.ddl_benf_type.SelectedIndex = 2 Then
            'Fill  REASONS
            SQL = "select * from reason_tab WHERE reason_cat = 7"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_reasons.DataSource = DDL_DS.Tables(0)
            ddl_reasons.DataTextField = "reason_ar"
            ddl_reasons.DataValueField = "reason_code"
            ddl_reasons.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing
        End If
    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ''Try




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
            Me.txt_transfer_date.Text = DateTime.Now.Date

            'Fill DropdownLists
            Fill_DDL()



            Me.txt_app_ser.Attributes.Add("onkeydown", "Search();")
            'Me.txt_name_ar_5.Attributes.Add("OnBlur", "GetFatherName();")


            If Not Session("orphans_app_ser") Is Nothing And Not Session("orphans_app_name") Is Nothing Then
                Me.txt_app_ser.Text = Session("orphans_app_ser")
                Me.txt_orphan_name.Text = Session("orphans_app_name")
                lnk_search_rtn_ServerClick(sender, e)
            End If



            Session("form_flg") = "orphan_trans"



            'Session("orph_type") = 1
            If Session("orph_type") = 0 Or Session("orph_type") = Nothing Then


                Me.ddl_benf_type.SelectedIndex = 0
                Change_Benf_Type()
            Else
                Me.ddl_benf_type.SelectedIndex = 1
                Change_Benf_Type()
            End If



        End If




        'Catch ex As Exception

        'End 'Try
    End Sub

    Private Sub lnk_save_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_save.ServerClick
        'Try


        If Me.ddl_benf_type.SelectedIndex = 0 Then
            If (Me.txt_app_ser.Text = "") Or Val(Me.txt_app_ser.Text) <= 0 Then
                ShowAlert("الرجاء تحديد رقم اليتيم")
                Exit Sub
            End If


            If Not IsDate(Me.txt_transfer_date.Date) Then
                ShowAlert("ادخل التاريخ أولا")
                Exit Sub
            End If



            If (Me.ddl_reasons.SelectedValue = 0) Then
                ShowAlert("ادخل الأسباب")
                Exit Sub
            End If



            If (Me.ddl_from_center.SelectedValue = 0) Then
                ShowAlert("ادخل من مهجع")
                Exit Sub
            End If

            If (Me.ddl_to_center.SelectedValue = 0) Then
                ShowAlert("ادخل إلى مهجع")
                Exit Sub
            End If

        ElseIf Me.ddl_benf_type.SelectedIndex = 1 Then
            If (Me.txt_app_ser.Text = "") Or Val(Me.txt_app_ser.Text) <= 0 Then
                ShowAlert("الرجاء تحديد رقم الطالب")
                Exit Sub
            End If


            If Not IsDate(Me.txt_transfer_date.Date) Then
                ShowAlert("ادخل التاريخ أولا")
                Exit Sub
            End If



            If (Me.ddl_reasons.SelectedValue = 0) Then
                ShowAlert("ادخل الأسباب")
                Exit Sub
            End If



        End If
        'Conditions


        If ddl_benf_type.SelectedIndex = 0 Then
            Dim orphanParam() As Object = {Convert.ToInt16(Me.txt_app_ser.Text),
                                                   Convert.ToInt16(Me.ddl_from_center.SelectedValue),
                                                   Convert.ToInt16(Me.ddl_to_center.SelectedValue),
                                                   Nothing,
                                                  Nothing,
                                                   Convert.ToInt16(Me.ddl_reasons.SelectedValue),
                                                   IIf(String.IsNullOrWhiteSpace(Me.txt_notes.Text), "", Me.txt_notes.Text),
                                                    ASPxComboBox_from_country.Value, ASPxComboBox_to_country.Value}
            WS.ExecSp("charitysoft", Session(SessionKey.USERNAME), Session(SessionKey.PASSWORD), "benf_master_transfer_insert", CommandType.StoredProcedure, orphanParam)
        Else
            Dim orphanParam() As Object = {Convert.ToInt16(Me.txt_app_ser.Text),
                                   Convert.ToInt16(Me.ddl_from_center.SelectedValue),
                                   Convert.ToInt16(Me.ddl_to_center.SelectedValue),
                                   Convert.ToInt16(0),
                                   Convert.ToInt16(0),
                                   Convert.ToInt16(Me.ddl_reasons.SelectedValue),
                                   IIf(String.IsNullOrWhiteSpace(Me.txt_notes.Text), "", Me.txt_notes.Text),
                                          ASPxComboBox_from_country.Value, ASPxComboBox_to_country.Value}
            WS.ExecSp("charitysoft", Session(SessionKey.USERNAME), Session(SessionKey.PASSWORD), "benf_master_transfer_insert", CommandType.StoredProcedure, orphanParam)
        End If




        ' save new row   


        lnk_search_rtn_ServerClick(sender, e)


        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
            ShowAlert("تم الحفظ ")
        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
            ShowAlert("Saved Successfully")
        End If


        '  Catch ex As Exception

        ' End 'Try
    End Sub

    Private Sub lnk_search_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search.ServerClick
        ''Try

        'clear screen
        Clear_Frm(Me)

        If Session("orph_type") = 0 Or Session("orph_type") = Nothing Then
            Me.ddl_benf_type.SelectedIndex = 0
            Change_Benf_Type()
        Else
            Me.ddl_benf_type.SelectedIndex = 1
            Change_Benf_Type()
        End If


        Me.Literal1.Text = ""
        Me.txt_app_ser.Enabled = True
        Me.txt_transfer_date.Date = DateTime.Now.Date

        'Catch ex As Exception

        'End 'Try
    End Sub

    Private Sub lnk_search_rtn_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search_rtn.ServerClick
        ''Try



        If Session("app_ser_from_srch") <> "" Then
            Me.txt_app_ser.Text = Session("app_ser_from_srch")
        End If

        Dim BenefParam As Object
        Dim BenefMaster_DS As DataSet
        Dim OrphanName_Ds As DataSet
        Dim SQL As String

        SQL = "select app_ser,applicant_name_ar_5 + '  ' + applicant_name_ar_4 + '  ' + applicant_name_ar_3 + '  ' + applicant_name_ar_2 + '  ' + applicant_name_ar_1 AS oprhan_name from benf_master where app_ser =" & Val(Me.txt_app_ser.Text)
        OrphanName_Ds = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        If OrphanName_Ds.Tables(0).Rows.Count > 0 Then
            Me.txt_orphan_name.Text = OrphanName_Ds.Tables(0).Rows(0)(1)
        End If

        BenefParam = Me.txt_app_ser.Text

        If Me.ddl_benf_type.SelectedIndex = 0 Then
            BenefMaster_DS = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetOrphansTranfersLog", ServiceReference.CommandType.StoredProcedure, BenefParam)
            Me.grd_transfer.Visible = True
            Me.grd_student.Visible = False

            If BenefMaster_DS.Tables(0).Rows.Count > 0 Then

                Me.ddl_from_center.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(2)), 0, BenefMaster_DS.Tables(0).Rows(0)(2))
                Me.ddl_to_center.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(3)), 0, BenefMaster_DS.Tables(0).Rows(0)(3))
                Dim y As Integer = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(4)), 0, BenefMaster_DS.Tables(0).Rows(0)(4))
                Me.ddl_reasons.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(6)), 0, BenefMaster_DS.Tables(0).Rows(0)(6))
                Me.txt_notes.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(7)), "", BenefMaster_DS.Tables(0).Rows(0)(7))

            End If
        Else
            BenefMaster_DS = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetStudentTranfersLog", ServiceReference.CommandType.StoredProcedure, BenefParam)
            Me.grd_transfer.Visible = False
            Me.grd_student.Visible = True

            If BenefMaster_DS.Tables(0).Rows.Count > 0 Then

                Me.ddl_from_center.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(2)), 0, BenefMaster_DS.Tables(0).Rows(0)(2))
                Me.ddl_to_center.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(3)), 0, BenefMaster_DS.Tables(0).Rows(0)(3))
                Me.ddl_reasons.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(4)), 0, BenefMaster_DS.Tables(0).Rows(0)(4))
                Me.txt_notes.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(5)), "", BenefMaster_DS.Tables(0).Rows(0)(5))

            End If

        End If




        Session("app_ser_from_srch") = ""
        Session("orphans_app_ser") = Me.txt_app_ser.Text
        Session("orphans_app_name") = Me.txt_orphan_name.Text
        If Me.ddl_benf_type.SelectedIndex = 0 Then
            Session("orph_type") = 0
        Else
            Session("orph_type") = 1
        End If

        'Catch ex As Exception

        'End 'Try
    End Sub


    Protected Sub ddl_benf_type_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_benf_type.SelectedIndexChanged
        'Try
        'Clear_Frm(Me)
        Change_Benf_Type()

        '  Catch ex As Exception

        ' End 'Try
    End Sub

#End Region

End Class