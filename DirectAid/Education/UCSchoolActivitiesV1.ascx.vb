Imports System.Globalization
Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web

Public Class UCSchoolActivitiesV1
    Inherits System.Web.UI.UserControl

#Region "Memebers"
    Private _ws As New DataAccessLibrary
    Protected _culture As String
    'fill dataset
    Dim fill_DDL_DS As DataSet
    Dim Param() As Object = {0}
    Dim sql_str As String
    Dim form_load As Boolean
    Protected _selectedacadyearcode As String
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

    Public Shared Sub LockField(ByVal control As TextBox)

        control.Enabled = False
        control.BackColor = Drawing.Color.LightYellow
        control.ForeColor = Drawing.Color.Navy

    End Sub

    Public Shared Sub UnLockField(ByVal control As TextBox)

        control.Enabled = True
        control.BackColor = Drawing.Color.White

    End Sub

    Sub ShowAlert(ByVal message As String)
        'ScriptManager.RegisterStartupScript(Me.UpdatePanel3, UpdatePanel3.GetType(), "notificationScript", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "notificationScript111", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
    End Sub


#End Region


#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            school_activities_DS3.ConnectionString = New ConnectionStringEx().TheConnectionString
            school_activities_DS4.ConnectionString = New ConnectionStringEx().TheConnectionString
            school_activities_DS5.ConnectionString = New ConnectionStringEx().TheConnectionString
            school_activity_DS6.ConnectionString = New ConnectionStringEx().TheConnectionString
            school_activities_DS7.ConnectionString = New ConnectionStringEx().TheConnectionString
            school_activities_DS2.ConnectionString = New ConnectionStringEx().TheConnectionString
            school_activities_DS1.ConnectionString = New ConnectionStringEx().TheConnectionString
            acad_year_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
            grades_setup_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
            class_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
            school_tools_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
            school_activity_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
            course_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
            reasons_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
            SqlDataSource1.ConnectionString = New ConnectionStringEx().TheConnectionString
            currency_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString

            If Not IsPostBack Then
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


                'ddl_school_name.Focus()
                Me.txt_school_name_ar.Focus()



            End If

            Me.txt_school_code.Attributes.Add("onKeydown", "srch_rtn();")
            txt_school_code.Text = Request.QueryString(QueryStringKey.SchoolID)

        Catch ex As Exception

        End Try
    End Sub



    Protected Sub txt_school_code_TextChanged(sender As Object, e As EventArgs) Handles txt_school_code.TextChanged

    End Sub

    Private Sub ASPxGridView4_ParseValue(sender As Object, e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles ASPxGridView4.ParseValue
        If e.FieldName.Equals("cost_1") Then
            Dim amount As Decimal = 0
            If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة التكلفة ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("cost amount must be an ineteger value.")
                End If

            End If
        End If

        If e.FieldName.Equals("days_num") Then
            Dim amount As Integer = 0
            If e.Value Is Nothing OrElse (Not Integer.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة عدد الايام ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("days number amount must be an ineteger value.")
                End If

            End If
        End If

        If e.FieldName.Equals("count_1") Then
            Dim amount As Integer = 0
            If e.Value Is Nothing OrElse (Not Integer.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة عدد الحاضرين ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("number of attendees amount must be an ineteger value.")
                End If

            End If
        End If
    End Sub

    Private Sub ASPxGridView4_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles ASPxGridView4.RowValidating
        Dim amount As Decimal = 0

        If e.NewValues("cost_1") Is Nothing Then
            Decimal.TryParse(String.Empty, amount)
        Else
            Decimal.TryParse(e.NewValues("cost_1").ToString(), amount)
        End If
        If amount < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("تكلفة الدورة يجب ان يكون اكبر من صفر")
        End If


        Dim amount1 As Integer = 0

        If e.NewValues("days_num") Is Nothing Then
            Integer.TryParse(String.Empty, amount1)
        Else
            Integer.TryParse(e.NewValues("days_num").ToString(), amount1)
        End If
        If amount1 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("عدد الايام يجب ان يكون اكبر من صفر")
        End If


        Dim amount2 As Integer = 0

        If e.NewValues("count_1") Is Nothing Then
            Integer.TryParse(String.Empty, amount2)
        Else
            Integer.TryParse(e.NewValues("count_1").ToString(), amount2)
        End If
        If amount2 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("عدد الحاضرين يجب ان يكون اكبر من صفر ")
        End If
        '


    End Sub

    Private Sub ASPxGridView1_ParseValue(sender As Object, e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles ASPxGridView1.ParseValue
        'If e.FieldName.Equals("cost_1") Then
        '    Dim amount As Integer = 0
        '    If e.Value Is Nothing OrElse (Not Integer.TryParse(e.Value.ToString(), amount)) Then
        '        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
        '            Throw New Exception("خطأ في ادخال قيمة التكلفة ، يسمح ارقام فقط")
        '        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
        '            Throw New Exception("cost amount must be an ineteger value.")
        '        End If

        '    End If


        'End If

        If e.FieldName.Equals("cost_1") Then
            Dim amount As Decimal = 0
            If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة التكلفة ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("cost amount must be an ineteger value.")
                End If

            End If
        End If

    End Sub

    Private Sub ASPxGridView1_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles ASPxGridView1.RowValidating
        Dim amount1 As Decimal = 0

        If e.NewValues("cost_1") Is Nothing Then
            Decimal.TryParse(String.Empty, amount1)
        Else
            Decimal.TryParse(e.NewValues("cost_1").ToString(), amount1)
        End If
        If amount1 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("عدد الحاضرين يجب ان يكون اكبر من صفر ")
        End If
    End Sub

    Private Sub GRD_school_activity_2_ParseValue(sender As Object, e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles GRD_school_activity_2.ParseValue
        If e.FieldName.Equals("cost_1") Then
            Dim amount As Decimal = 0
            If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة التكلفة ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("cost amount must be an ineteger value.")
                End If

            End If
        End If

        If e.FieldName.Equals("count_1") Then
            Dim amount As Integer = 0
            If e.Value Is Nothing OrElse (Not Integer.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة عدد الحاضرين ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("number of attendees amount must be an ineteger value.")
                End If

            End If
        End If
    End Sub

    Private Sub GRD_school_activity_2_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles GRD_school_activity_2.RowValidating
        Dim amount1 As Decimal = 0

        If e.NewValues("cost_1") Is Nothing Then
            Decimal.TryParse(String.Empty, amount1)
        Else
            Decimal.TryParse(e.NewValues("cost_1").ToString(), amount1)
        End If
        If amount1 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("عدد الحاضرين يجب ان يكون اكبر من صفر ")
        End If

        Dim amount2 As Integer = 0

        If e.NewValues("count_1") Is Nothing Then
            Integer.TryParse(String.Empty, amount2)
        Else
            Integer.TryParse(e.NewValues("count_1").ToString(), amount2)
        End If
        If amount2 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("عدد الحاضرين يجب ان يكون اكبر من صفر ")
        End If
    End Sub



    Private Sub ASPxGridView2_ParseValue(sender As Object, e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles ASPxGridView2.ParseValue
        If e.FieldName.Equals("cost_1") Then
            Dim amount As Decimal = 0
            If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة التكلفة ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("cost amount must be an ineteger value.")
                End If

            End If
        End If

        If e.FieldName.Equals("count_1") Then
            Dim amount As Integer = 0
            If e.Value Is Nothing OrElse (Not Integer.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة عدد الحاضرين ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("number of attendees amount must be an ineteger value.")
                End If

            End If
        End If


    End Sub

    Private Sub ASPxGridView2_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles ASPxGridView2.RowValidating
        Dim amount1 As Decimal = 0

        If e.NewValues("cost_1") Is Nothing Then
            Decimal.TryParse(String.Empty, amount1)
        Else
            Decimal.TryParse(e.NewValues("cost_1").ToString(), amount1)
        End If
        If amount1 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("عدد الحاضرين يجب ان يكون اكبر من صفر ")
        End If

        Dim amount2 As Integer = 0

        If e.NewValues("count_1") Is Nothing Then
            Integer.TryParse(String.Empty, amount2)
        Else
            Integer.TryParse(e.NewValues("count_1").ToString(), amount2)
        End If
        If amount2 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("عدد الحاضرين يجب ان يكون اكبر من صفر ")
        End If
    End Sub

    Private Sub GRD_school_activity_4_ParseValue(sender As Object, e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles GRD_school_activity_4.ParseValue
        If e.FieldName.Equals("cost_1") Then
            Dim amount As Decimal = 0
            If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة التكلفة ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("cost amount must be an ineteger value.")
                End If

            End If
        End If


    End Sub

    Private Sub GRD_school_activity_4_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles GRD_school_activity_4.RowValidating
        Dim amount1 As Decimal = 0

        If e.NewValues("cost_1") Is Nothing Then
            Decimal.TryParse(String.Empty, amount1)
        Else
            Decimal.TryParse(e.NewValues("cost_1").ToString(), amount1)
        End If
        If amount1 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("عدد الحاضرين يجب ان يكون اكبر من صفر ")
        End If


    End Sub

    Private Sub ASPxGridView3_ParseValue(sender As Object, e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles ASPxGridView3.ParseValue
        If e.FieldName.Equals("cost_1") Then
            Dim amount As Decimal = 0
            If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة التكلفة ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("cost amount must be an ineteger value.")
                End If

            End If
        End If

        If e.FieldName.Equals("count_1") Then
            Dim amount As Integer = 0
            If e.Value Is Nothing OrElse (Not Integer.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة عدد الحاضرين ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("number of attendees amount must be an ineteger value.")
                End If

            End If
        End If


    End Sub

    Private Sub ASPxGridView3_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles ASPxGridView3.RowValidating
        Dim amount1 As Decimal = 0

        If e.NewValues("cost_1") Is Nothing Then
            Decimal.TryParse(String.Empty, amount1)
        Else
            Decimal.TryParse(e.NewValues("cost_1").ToString(), amount1)
        End If
        If amount1 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("التكلفة يجب ان يكون اكبر من صفر ")
        End If

        Dim amount2 As Integer = 0

        If e.NewValues("count_1") Is Nothing Then
            Integer.TryParse(String.Empty, amount2)
        Else
            Integer.TryParse(e.NewValues("count_1").ToString(), amount2)
        End If
        If amount2 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("عدد الحاضرين يجب ان يكون اكبر من صفر ")
        End If
    End Sub

    Protected Sub txt_school_name_ar_TextChanged(sender As Object, e As EventArgs) Handles txt_school_name_ar.TextChanged

    End Sub

    Protected Sub ASPxPageControl1_ActiveTabChanged(source As Object, e As DevExpress.Web.TabControlEventArgs) Handles ASPxPageControl1.ActiveTabChanged

    End Sub

    Protected Sub ASPxGridView1_RowCommand(sender As Object, e As DevExpress.Web.ASPxGridViewRowCommandEventArgs) Handles ASPxGridView1.RowCommand
        If e.CommandArgs.CommandName.ToLower().Equals("name") Then
            Dim code As Double
            code = Val(e.CommandArgs.CommandArgument)

        End If

    End Sub



#End Region


    Protected Sub hyperLink_books_Init(sender As Object, e As EventArgs)

    End Sub

    Protected Sub hyperLink_attendees_Init(sender As Object, e As EventArgs)

    End Sub

    Protected Sub hyperLink_trainees_Init(sender As Object, e As EventArgs)

    End Sub

    Protected Sub hyperLink_attach_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/EducationAttachments.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim activity_ser As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "activity_ser").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?app_ser={1}&mod=121&t={2}", urlBase, activity_ser, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub

    Protected Sub hyperLink_attach_2_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/EducationAttachments.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim activity_ser As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "activity_ser").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?app_ser={1}&mod=122&t={2}", urlBase, activity_ser, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub

    Protected Sub hyperLink_attach_3_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/EducationAttachments.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim activity_ser As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "activity_ser").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?app_ser={1}&mod=123&t={2}", urlBase, activity_ser, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub

    Protected Sub hyperLink_attach_4_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/EducationAttachments.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim activity_ser As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "activity_ser").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?app_ser={1}&mod=124&t={2}", urlBase, activity_ser, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub

    Protected Sub hyperLink_attach_5_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/EducationAttachments.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim activity_ser As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "activity_ser").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?app_ser={1}&mod=125&t={2}", urlBase, activity_ser, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub

    Protected Sub hyperLink_attach_6_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/EducationAttachments.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim activity_ser As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "activity_ser").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?app_ser={1}&mod=126&t={2}", urlBase, activity_ser, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub

    Protected Sub hyperLink_attach_7_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/EducationAttachments.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim activity_ser As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "activity_ser").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?app_ser={1}&mod=127&t={2}", urlBase, activity_ser, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub
End Class