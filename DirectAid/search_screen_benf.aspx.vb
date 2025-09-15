Imports System.Globalization
Imports System.Data.SqlClient
Imports DirectAid.datalib
Imports System.Data


Public Class search_screen_benf
    Inherits BaseWebForm
    Protected _culture As String
    Private _ws As New DataAccessLibrary
    Dim car_bar_code As Integer
    Dim Con1 As SqlConnection
    Dim oDS As DataSet
    Dim Con As New SqlConnection()
    Dim con_str As String
    Dim sql_str As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            If Not IsPostBack Then
                'Get the Page Culture to pass it to the clien side
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    _culture = "ar"
                    txt_search_lang.Text = "1"
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    _culture = "en"
                    txt_search_lang.Text = "2"
                End If


                'Me.MultiView1.ActiveViewIndex = 0

                ''For Testing, username and password must be enter from Login Form
                'Session("username") = "sa"
                'Session("password") = "pass@word1"

            End If

            backBut.Attributes.Add("onClick", "go_back();")
            Me.txt_applicant_name_en_1.Attributes.Add("onKeydown", "search_names();")
            Me.txt_applicant_name_en_2.Attributes.Add("onKeydown", "search_names();")
            Me.txt_applicant_name_en_3.Attributes.Add("onKeydown", "search_names();")
            Me.txt_applicant_name_en_4.Attributes.Add("onKeydown", "search_names();")
            Me.txt_applicant_name_en_5.Attributes.Add("onKeydown", "search_names();")
            Me.txt_applicant_name_ar_1.Attributes.Add("onKeydown", "search_names();")
            Me.txt_applicant_name_ar_2.Attributes.Add("onKeydown", "search_names();")
            Me.txt_applicant_name_ar_3.Attributes.Add("onKeydown", "search_names();")
            Me.txt_applicant_name_ar_4.Attributes.Add("onKeydown", "search_names();")
            Me.txt_applicant_name_ar_5.Attributes.Add("onKeydown", "search_names();")
        Catch ex As Exception

        End Try
    End Sub

    Private Sub grd_search_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles grd_search.PageIndexChanging
        grd_search.PageIndex = e.NewPageIndex
        'LinkButton2_Click(sender, e)
        search_data()
    End Sub

    Protected Sub grd_search_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles grd_search.SelectedIndexChanged

        Dim lbl_code As Label

        Try

            Dim str As String
            Dim dgi As GridViewRow = grd_search.SelectedRow
            lbl_code = CType(dgi.FindControl("lbl_app_ser"), Label)
            str = lbl_code.Text
            Session("app_ser_from_srch") = str

        Catch
            'statusbar.Text = "<b>You have no item selected </b><br><b> Item:</b> " + Grd_car_card.SelectedIndex.ToString()
        End Try
    End Sub

    Protected Sub A1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles A1.Click
        search_data()
    End Sub

    Private Sub search_data()

        Dim sql_str As String

        If Val(Request.QueryString("searchFLAG")) = 1 Then
            sql_str = "SELECT app_ser,( cast(applicant_name_ar_1 as varchar(50)) + ' ' + "
            sql_str += "cast(applicant_name_ar_2 as varchar(50))  + cast(applicant_name_ar_3 as varchar(50)) "
            sql_str += "+ ' ' + cast(applicant_name_ar_4 as varchar(50))  "
            sql_str += "+ ' ' + cast(applicant_name_ar_5 as varchar(50))) AS benf_name_ar , "
            sql_str += "( cast(applicant_name_en_1 as varchar(50)) + ' ' +"
            sql_str += "cast(applicant_name_en_2 as varchar(50))  + cast(applicant_name_en_3 as varchar(50))  "
            sql_str += "+ ' ' + cast(applicant_name_en_4 as varchar(50))  "
            sql_str += "+ ' ' + cast(applicant_name_en_5 as varchar(50))) AS benf_name_eng  "
            sql_str += " from benf_master WHERE app_ser is not null "

            If Len(Me.txt_applicant_name_ar_1.Text) > 0 Then
                sql_str += " and (upper(applicant_name_ar_1) Like upper(" & " '%" & Me.txt_applicant_name_ar_1.Text & "%'))"
            End If

            If Len(Me.txt_applicant_name_ar_2.Text) > 0 Then
                sql_str += " and (upper(applicant_name_ar_2) Like upper(" & " '%" & txt_applicant_name_ar_2.Text & "%'))"
            End If

            If Len(Me.txt_applicant_name_ar_3.Text) > 0 Then
                sql_str += " and (upper(applicant_name_ar_3) Like upper(" & " '%" & txt_applicant_name_ar_3.Text & "%'))"
            End If

            If Len(Me.txt_applicant_name_ar_4.Text) > 0 Then
                sql_str += " and (upper(applicant_name_ar_4) Like upper(" & " '%" & txt_applicant_name_ar_4.Text & "%'))"
            End If

            If Len(Me.txt_applicant_name_ar_5.Text) > 0 Then
                sql_str += " and (upper(applicant_name_ar_5) Like upper(" & " '%" & txt_applicant_name_ar_5.Text & "%'))"
            End If

            If Len(Me.txt_applicant_name_en_1.Text) > 0 Then
                sql_str += " and (upper(applicant_name_en_1) Like upper(" & " '%" & Me.txt_applicant_name_en_1.Text & "%'))"
            End If

            If Len(Me.txt_applicant_name_en_2.Text) > 0 Then
                sql_str += " and (upper(applicant_name_en_2) Like upper(" & " '%" & txt_applicant_name_en_2.Text & "%'))"
            End If

            If Len(Me.txt_applicant_name_en_3.Text) > 0 Then
                sql_str += " and (upper(applicant_name_en_3) Like upper(" & " '%" & txt_applicant_name_en_3.Text & "%'))"
            End If

            If Len(Me.txt_applicant_name_en_4.Text) > 0 Then
                sql_str += " and (upper(applicant_name_en_4) Like upper(" & " '%" & txt_applicant_name_en_4.Text & "%'))"
            End If

            If Len(Me.txt_applicant_name_en_5.Text) > 0 Then
                sql_str += " and (upper(applicant_name_en_5) Like upper(" & " '%" & txt_applicant_name_en_5.Text & "%'))"
            End If



        Else
            'sql_str = "SELECT * from benf_master "
            'sql_str += "WHERE app_ser is not null "

            'If Len(Me.txt_eng_name.Text) > 0 Then
            '    sql_str += " and upper(school_name_en) Like upper(" & " '%" & txt_eng_name.Text & "%')"
            'End If

            'If Len(Me.txt_ar_name.Text) > 0 Then
            '    sql_str += " and upper(school_name_ar) Like upper(" & " '%" & txt_ar_name.Text & "%')"
            'End If

            'If Len(Me.txt_eng_fam_name.Text) > 0 Then
            '    sql_str += " and upper(school_name_en) Like upper(" & " '%" & txt_eng_fam_name.Text & "%')"
            'End If

            'If Len(Me.txt_ar_fam_name.Text) > 0 Then
            '    sql_str += " and upper(school_name_ar) Like upper(" & " '%" & txt_ar_fam_name.Text & "%')"
            'End If
        End If


        Dim ds As DataSet
        ds = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)


        grd_search.Visible = True
        grd_search.DataSource = ds
        grd_search.DataMember = ds.Tables(0).TableName
        grd_search.DataBind()
        'If ds.Tables(0).Rows.Count = 0 Then
        '    grd_search.Visible = False
        'End If

    End Sub

    Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MenuEventArgs) Handles Menu1.MenuItemClick
        Select Case e.Item.Value
            Case "New"
                clear_frm(Me)
                txt_applicant_name_en_1.Focus()
                Session("stud_id") = 0 ' added 9-5-2011 to prevent viewing the last selection 
                Me.grd_search.DataSource = Nothing
                Me.grd_search.DataBind()
            Case "Search"
                search_data()
                'Case "Back"
                '    lnkbtn_back_Click(sender, e)
        End Select
    End Sub



    Protected Overrides Sub InitializeCulture()

        Dim ui As String = String.Empty

        If String.IsNullOrWhiteSpace(Request.QueryString("UI")) Then
            'ui = "en-US"
            If Not Session("UI") Is Nothing Then
                ui = Session("UI")
            Else
                ui = "en-US"
            End If
        Else
            ui = Request.QueryString("UI")
        End If

        UICulture = ui
        Culture = ui

        Dim cultureInfo As Globalization.CultureInfo = Globalization.CultureInfo.CreateSpecificCulture(ui)

        Threading.Thread.CurrentThread.CurrentCulture = cultureInfo
        Threading.Thread.CurrentThread.CurrentUICulture = cultureInfo

        MyBase.InitializeCulture()
    End Sub

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

 
End Class