
#Region "Imports Directives"

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

#End Region

Public Class orphans_education
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
                CType(control, DropDownList).SelectedIndex = -1
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



        'Fill  Academic year
        SQL = "select * from academic_year_codes order by acad_year_code"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_academic_year.DataSource = DDL_DS.Tables(0)
        ddl_academic_year.DataTextField = "acad_year_name"
        ddl_academic_year.DataValueField = "acad_year_code"
        ddl_academic_year.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill  Organizations_type
        SQL = "select * from organization_type order by org_type_code"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_organization_type.DataSource = DDL_DS.Tables(0)
        ddl_organization_type.DataTextField = "org_type_ar"
        ddl_organization_type.DataValueField = "org_type_code"
        ddl_organization_type.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill  Organizations_names
        SQL = "select * from organization_tab where org_type =" & ddl_organization_type.SelectedValue & " order by org_code"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_organizations.DataSource = DDL_DS.Tables(0)
        ddl_organizations.DataTextField = "org_namear"
        ddl_organizations.DataValueField = "org_code"
        ddl_organizations.DataBind()



        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill School Name
        SQL = "select school_code,school_name_ar,school_related_to_da,managed_by from school_master order by school_code"

        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_school_name.DataSource = DDL_DS.Tables(0)
        ddl_school_name.DataTextField = "school_name_ar"
        ddl_school_name.DataValueField = "school_code"
        ddl_school_name.DataBind()

        ddl_organizations.DataValueField = "managed_by"
        ddl_organization_type.DataValueField = "school_related_to_da"
        DDL_DS.Clear()
        DDL_DS = Nothing




        'Fill learning cat
        SQL = "select * from school_category order by category_code"

        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_learning_cat.DataSource = DDL_DS.Tables(0)
        ddl_learning_cat.DataTextField = "category_name_ar"
        ddl_learning_cat.DataValueField = "category_code"
        ddl_learning_cat.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill classes
        SQL = "select * from classes_tab where grade_code =" & ddl_learning_cat.SelectedValue & " order by class_code"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_class.DataSource = DDL_DS.Tables(0)
        ddl_class.DataTextField = "class_name_ar"
        ddl_class.DataValueField = "class_code"
        ddl_class.DataBind()
        DDL_DS.Clear()
        DDL_DS = Nothing




        'Fill Assesment
        SQL = "select * from general_assesment_tab order by assesment_code"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_general_evaluation.DataSource = DDL_DS.Tables(0)
        ddl_general_evaluation.DataTextField = "assesment_namear"
        ddl_general_evaluation.DataValueField = "assesment_code"
        ddl_general_evaluation.DataBind()
        DDL_DS.Clear()
        DDL_DS = Nothing





    End Sub

    Sub ShowAlert(ByVal message As String)
        ScriptManager.RegisterStartupScript(Me.UpdatePanel, UpdatePanel.GetType(), "notificationScript", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Try

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
            Me.txt_school_reg_date.Text = DateTime.Now.ToString("dd/MM/yyyy")

            'Fill DropdownLists
            Fill_DDL()



            Me.txt_app_ser.Attributes.Add("onkeydown", "Search();")
            'Me.txt_name_ar_5.Attributes.Add("OnBlur", "GetFatherName();")


            If Session("orphans_app_ser") <> Nothing And Session("orphans_app_name") <> Nothing Then
                Me.txt_app_ser.Text = Session("orphans_app_ser")
                Me.txt_orphan_name.Text = Session("orphans_app_name")
                lnk_search_rtn_ServerClick(sender, e)
            End If

            Session("form_flg") = "orphan_edu"
            Session("orph_type") = 0
        End If
        'Catch ex As Exception

        'End Try
    End Sub

    Private Sub lnk_search_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search.ServerClick
        'clear screen
        Clear_Frm(Me)


        Session("orph_education_flg") = 1
        Me.Literal1.Text = ""
        Me.txt_school_reg_date.Value = Nothing
        'Me.txt_school_reg_date.Text = DateTime.Now.ToString("dd/MM/yyyy")
        Me.txt_app_ser.Enabled = True
        Me.chk_participate_in_activity.Checked = False
        Me.txt_app_ser.Focus()
    End Sub

    Private Sub lnk_search_rtn_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search_rtn.ServerClick
        Dim BenefParam As Object
        Dim BenefMaster_DS As DataSet
        Dim School_det_DS As DataSet
        Dim SQL As String


        If Session("app_ser_from_srch") <> "" Then
            Me.txt_app_ser.Text = Session("app_ser_from_srch")
        End If




        BenefParam = Me.txt_app_ser.Text
        BenefMaster_DS = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetBenfMasterEducation", ServiceReference.CommandType.StoredProcedure, BenefParam)





        If BenefMaster_DS.Tables(0).Rows.Count > 0 Then

            Me.txt_app_ser.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(0)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(0))
            Me.txt_orphan_name.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(1)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(1))
            Dim s As Integer = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(2)), 0, BenefMaster_DS.Tables(0).Rows(0)(2))
            Me.ddl_school_name.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(2)), 0, BenefMaster_DS.Tables(0).Rows(0)(2))

            'Fill  Organizations_type
            SQL = "select school_code,school_name_ar,school_related_to_da,managed_by from school_master  where school_code=  " & If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(2)), 0, BenefMaster_DS.Tables(0).Rows(0)(2))
            School_det_DS = New DataSet
            School_det_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            If School_det_DS.Tables(0).Rows.Count > 0 Then
                ddl_organization_type.DataValueField = School_det_DS.Tables(0).Rows(0)(2)
                ddl_organizations.DataValueField = School_det_DS.Tables(0).Rows(0)(3)
            End If


            School_det_DS.Clear()
            School_det_DS = Nothing


            Me.txt_school_reg_date.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(3)), String.Empty, CDate(BenefMaster_DS.Tables(0).Rows(0)(3)).ToString("dd/MM/yyyy"))
            Me.ddl_academic_year.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(4)), 0, BenefMaster_DS.Tables(0).Rows(0)(4))
            Me.ddl_learning_cat.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(6)), 0, BenefMaster_DS.Tables(0).Rows(0)(6))

            'Fill classes
            Dim CLS_SQL As String
            Dim CLS_DS As New DataSet

            CLS_SQL = "select * from classes_tab where grade_code =" & ddl_learning_cat.SelectedValue & " order by class_code"
            CLS_DS = New DataSet
            CLS_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), CLS_SQL)
            Me.ddl_class.DataSource = CLS_DS.Tables(0)
            ddl_class.DataTextField = "class_name_ar"
            ddl_class.DataValueField = "class_code"
            ddl_class.DataBind()
            CLS_DS.Clear()
            CLS_DS = Nothing

            Dim x As Integer = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(5)), 0, BenefMaster_DS.Tables(0).Rows(0)(5))
            Me.ddl_class.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(5)), 0, BenefMaster_DS.Tables(0).Rows(0)(5))

            'Me.ddl_organization_type.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(7)), 0, BenefMaster_DS.Tables(0).Rows(0)(7))

            ''Fill  Organizations_names
            'Dim ORG_SQL As String
            'Dim ORG_DS As New DataSet
            'ORG_SQL = "select * from organization_tab where org_type =" & ddl_organization_type.SelectedValue & " order by org_code"
            'ORG_DS = New DataSet
            'ORG_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), ORG_SQL)
            'Me.ddl_organizations.DataSource = ORG_DS.Tables(0)
            'ddl_organizations.DataTextField = "org_namear"
            'ddl_organizations.DataValueField = "org_code"
            'ddl_organizations.DataBind()

            'ORG_DS.Clear()
            'ORG_DS = Nothing


            'Me.ddl_organizations.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(8)), 0, BenefMaster_DS.Tables(0).Rows(0)(8))

            Me.ddl_general_evaluation.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(8)), 0, BenefMaster_DS.Tables(0).Rows(0)(8))

            If IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(10)) Then
                Me.chk_participate_in_activity.Checked = False
            Else
                If BenefMaster_DS.Tables(0).Rows(0)(10) = 0 Then
                    Me.chk_participate_in_activity.Checked = False
                Else
                    Me.chk_participate_in_activity.Checked = True
                End If
            End If

            Me.ddl_academic_situation.SelectedIndex = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(10)), Nothing, BenefMaster_DS.Tables(0).Rows(0)(10))

        End If


        Session("app_ser_from_srch") = ""
        Session("orphans_app_ser") = Me.txt_app_ser.Text
        Session("orphans_app_name") = Me.txt_orphan_name.Text
    End Sub

    Private Sub lnk_save_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_save.ServerClick


        Dim School_reg_date As Date = txt_school_reg_date.Date 'datalib.FormatDate(Me.txt_school_reg_date)

        Dim actvivity As Integer

        If Me.chk_participate_in_activity.Checked = True Then
            actvivity = 1
        Else
            actvivity = 0
        End If

        If Me.txt_app_ser.Text = "" And Me.txt_orphan_name.Text = "" Then
            ShowAlert("ادخل رقم اليتيم أولا")
            Exit Sub
        End If

        If Not IsDate(Me.txt_school_reg_date.Text) Then
            ShowAlert(" التاريخ غير صحيح")
            Exit Sub
        End If


        If Me.ddl_organization_type.SelectedValue = 0 Then
            ShowAlert(" ادخل جهة الدراسة")
            Exit Sub
        End If



        If Me.ddl_organizations.SelectedValue = 0 Then
            ShowAlert(" ادخل اسم الجهة")
            Exit Sub
        End If



        If Me.ddl_school_name.SelectedValue = 0 Then
            ShowAlert(" ادخل اسم المدرسة")
            Exit Sub
        End If



        If Me.ddl_academic_situation.SelectedIndex = 0 Then
            ShowAlert(" ادخل الوضع الدراسي")
            Exit Sub
        End If


        If Me.ddl_learning_cat.SelectedValue = 0 Then
            ShowAlert(" ادخل المرحلة التعليمية")
            Exit Sub
        End If


        If Me.ddl_academic_year.SelectedValue = 0 Then
            ShowAlert(" ادخل السنة الدراسية")
            Exit Sub
        End If


        If Me.ddl_class.SelectedValue = 0 Then
            ShowAlert(" ادخل الصف")
            Exit Sub
        End If



        If Me.ddl_general_evaluation.SelectedValue = 0 Then
            ShowAlert(" ادخل التقدير العام")
            Exit Sub
        End If


        Dim orphanParam() As Object = {Convert.ToInt16(Me.txt_app_ser.Text),
                                                        Convert.ToInt16(Me.ddl_school_name.SelectedValue),
                                                        Convert.ToDateTime(School_reg_date),
                                                        Convert.ToInt16(Me.ddl_academic_year.SelectedValue),
                                                        Convert.ToInt16(Me.ddl_learning_cat.SelectedValue),
                                                        Convert.ToInt16(Me.ddl_class.SelectedValue),
                                                        Convert.ToInt16(Me.ddl_general_evaluation.SelectedValue),
                                                        actvivity,
                                                        Convert.ToInt16(Me.ddl_academic_situation.SelectedIndex)}


        'Convert.ToInt16(Me.chk_participate_in_activity.Checked),

        'Conditions

        ' save new row   

        WS.ExecSp("charitysoft", Session(SessionKey.USERNAME), Session(SessionKey.PASSWORD), "benf_master_education_Update", CommandType.StoredProcedure, orphanParam)



        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
            ShowAlert("تم الحفظ بنجاح")
        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
            ShowAlert("Saved Successfully")
        End If


    End Sub

    Private Sub ddl_organization_type_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddl_organization_type.SelectedIndexChanged
        Dim SQl As String
        Dim DDL_DS As DataSet


        'Fill  Organizations_names
        SQl = "select * from organization_tab where org_type =" & ddl_organization_type.SelectedValue
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQl)

        Me.ddl_organizations.DataSource = DDL_DS.Tables(0)
        ddl_organizations.DataTextField = "org_namear"
        ddl_organizations.DataValueField = "org_code"
        ddl_organizations.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing

        ddl_organization_type.Focus()
    End Sub

    Private Sub ddl_learning_cat_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddl_learning_cat.SelectedIndexChanged
        Dim SQl As String
        Dim DDL_DS As DataSet

        'Fill classes
        SQl = "select * from classes_tab where grade_code =" & ddl_learning_cat.SelectedValue
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQl)
        Me.ddl_class.DataSource = DDL_DS.Tables(0)
        ddl_class.DataTextField = "class_name_ar"
        ddl_class.DataValueField = "class_code"
        ddl_class.DataBind()
        DDL_DS.Clear()
        DDL_DS = Nothing

        Me.ddl_learning_cat.Focus()
    End Sub



#End Region

End Class