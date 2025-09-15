Imports System.Globalization
Imports System.Data.SqlClient

Public Class UCBeneficiaryFeesV1
    Inherits System.Web.UI.UserControl


#Region "Memebers"
    Private _ws As New DataAccessLibrary
    Protected _culture As String
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

    Sub SearchByCode(ByVal code)
        Try
            Dim sql_str As String
            sql_str = ""

            sql_str = "SELECT * from benf_master where app_ser = " & code

            Dim ds As DataSet
            ds = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
            'Try

            If ds.Tables(0).Rows.Count > 0 Then

                Me.txt_applicant_name_ar.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_1")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_1").ToString()) & " " & _
                If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_2")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_2").ToString()) & " " & _
                If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_3")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_3").ToString()) & " " & _
                If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_4")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_4").ToString()) & " " & _
                If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_ar_5")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_ar_5").ToString())

                Me.txt_applicant_name_en.Text = If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_1")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_1").ToString()) & " " & _
                If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_2")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_2").ToString()) & " " & _
                If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_3")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_3").ToString()) & " " & _
                If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_4")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_4").ToString()) & " " & _
                If(IsDBNull(ds.Tables(0).Rows(0).Item("applicant_name_en_5")), String.Empty, ds.Tables(0).Rows(0).Item("applicant_name_en_5").ToString())

                txt_app_ser.Text = ds.Tables(0).Rows(0).Item("app_ser")

                Session("opr_flag") = 2 'update
                LockField(txt_app_ser)
            Else
                ShowAlert("لا يوجد بيانات ")
            End If


        Catch ex As Exception
            ShowAlert("حدث خطأ")
        End Try
    End Sub

#End Region


#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            students_fees_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
            acad_year_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
            fees_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
            currency_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
            DS_Select_students.ConnectionString = New ConnectionStringEx().TheConnectionString


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

                A5_ServerClick(sender, e)

                Me.txt_app_ser.Attributes.Add("onKeydown", "srch_rtn();")
            End If
            'Passing the query string to txt_app_ser
            txt_app_ser.Text = Request.QueryString(QueryStringKey.OrphanID)


        Catch ex As Exception

        End Try
    End Sub

    Private Sub lnk_new_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnk_new.ServerClick
        Session("opr_flag") = 1
        LockField(Me.txt_app_ser)
        clear_frm(Me)
        'Me.txt_applicant_name_ar_1.Focus()
    End Sub

    Private Sub A5_ServerClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles A5.ServerClick
        clear_frm(Me)
        Session("opr_flag") = 3
        UnLockField(Me.txt_app_ser)
        Me.txt_app_ser.Focus()
    End Sub

    Private Sub A_search_Click(ByVal sender As Object, ByVal e As EventArgs) Handles A_search.Click
        If Session("opr_flag") = 3 Then
            SearchByCode(Val(Me.txt_app_ser.Text))
        Else
        End If

    End Sub


    Protected Sub A2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles A2.Click
        Me.txt_app_ser.Text = Val(Session("app_ser_from_srch"))
        A_search_Click(sender, e)

    End Sub

    Private Sub ASPxGridView1_ParseValue(sender As Object, e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles ASPxGridView1.ParseValue
        If e.FieldName.Equals("fee_value") Then
            Dim amount As Decimal = 0
            If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة الرسوم ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("Fees amount must be an ineteger value.")
                End If

            End If
        End If
    End Sub

    Private Sub ASPxGridView1_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles ASPxGridView1.RowValidating
        Dim amount1 As Decimal = 0

        If e.NewValues("fee_value") Is Nothing Then
            Decimal.TryParse(String.Empty, amount1)
        Else
            Decimal.TryParse(e.NewValues("fee_value").ToString(), amount1)
        End If
        If amount1 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("قيمة الرسوم يجب ان يكون اكبر من صفر ")
        End If
    End Sub

    Protected Sub ASPxGridView1_RowCommand(sender As Object, e As DevExpress.Web.ASPxGridViewRowCommandEventArgs) Handles ASPxGridView1.RowCommand
        If e.CommandArgs.CommandName.ToLower().Equals("stud") Then
            Dim code As Double
            code = Val(e.CommandArgs.CommandArgument)
            SearchByCode(code)
        End If

    End Sub

    Protected Sub LinqDS_Schools_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqDS_Schools.Selecting

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


        e.KeyExpression = "app_ser"
    End Sub

#End Region

End Class