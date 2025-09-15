Imports System.Globalization

Public Class UCSchoolsStudentsCountAndFeesV1
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        school_statistics_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        school_fees_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        currency_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        acad_year_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        grades_setup_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        stud_category_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        class_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        gender_DS.ConnectionString = New ConnectionStringEx().TheConnectionString

        txt_school_code.Text = Request.QueryString(QueryStringKey.SchoolID)
    End Sub

    Protected Sub GRD_school_statistics_CustomErrorText(sender As Object, e As DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs) Handles GRD_school_statistics.CustomErrorText
        If e.Exception IsNot Nothing Then
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                e.ErrorText = "لقد قمت بادخال هذه الحقول مسبقا. برجاء ادخال قيم جديدة"
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                e.ErrorText = "These fields are already inserted. Please insert new values."
            End If
            ''e.ErrorText = "لقد قمت بادخال هذه الحقول مسبقا. برجاء ادخال قيم جديدة"
        End If
    End Sub

    Private Sub GRD_school_statistics_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles GRD_school_statistics.StartRowEditing
        Dim x As New DevExpress.Web.GridViewDataComboBoxColumn
        x = GRD_school_statistics.Columns("acad_year_code")
        x = DirectCast(GRD_school_statistics.Columns("acad_year_code"), DevExpress.Web.GridViewDataComboBoxColumn)
        x.ReadOnly = True

        Dim x1 As New DevExpress.Web.GridViewDataComboBoxColumn
        x1 = GRD_school_statistics.Columns("grade_code")
        x1 = DirectCast(GRD_school_statistics.Columns("grade_code"), DevExpress.Web.GridViewDataComboBoxColumn)
        x1.ReadOnly = True

        Dim x2 As New DevExpress.Web.GridViewDataComboBoxColumn
        x2 = GRD_school_statistics.Columns("class_code")
        x2 = DirectCast(GRD_school_statistics.Columns("class_code"), DevExpress.Web.GridViewDataComboBoxColumn)
        x2.ReadOnly = True

        Dim x3 As New DevExpress.Web.GridViewDataComboBoxColumn
        x3 = GRD_school_statistics.Columns("stud_gender")
        x3 = DirectCast(GRD_school_statistics.Columns("stud_gender"), DevExpress.Web.GridViewDataComboBoxColumn)
        x3.ReadOnly = True

        Dim x4 As New DevExpress.Web.GridViewDataComboBoxColumn
        x4 = GRD_school_statistics.Columns("stud_category")
        x4 = DirectCast(GRD_school_statistics.Columns("stud_category"), DevExpress.Web.GridViewDataComboBoxColumn)
        x4.ReadOnly = True


    End Sub

    Protected Sub GRD_school_fee_CustomErrorText(sender As Object, e As DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs) Handles GRD_school_fee.CustomErrorText
        If e.Exception IsNot Nothing Then
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                e.ErrorText = "لقد قمت بادخال هذه الحقول مسبقا. برجاء ادخال قيم جديدة"
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                e.ErrorText = "These fields are already inserted. Please insert new values."
            End If
            ''e.ErrorText = "لقد قمت بادخال هذه الحقول مسبقا. برجاء ادخال قيم جديدة"
        End If
    End Sub

    Private Sub GRD_school_fee_ParseValue(sender As Object, e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles GRD_school_fee.ParseValue
        If e.FieldName.Equals("fees_amount") Then
            Dim amount As Decimal = 0
            If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة التكلفة ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("خطأ في ادخال قيمة التكلفة ، يسمح ارقام فقط") 'cost amount must be an ineteger value.
                End If

            End If
        End If
    End Sub

    Private Sub GRD_school_fee_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles GRD_school_fee.RowValidating
        Dim amount1 As Decimal = 0

        If e.NewValues("fees_amount") Is Nothing Then
            Decimal.TryParse(String.Empty, amount1)
        Else
            Decimal.TryParse(e.NewValues("fees_amount").ToString(), amount1)
        End If
        If amount1 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("التكلفة يجب ان يكون اكبر من صفر ")
        End If
    End Sub

    Private Sub GRD_school_fee_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles GRD_school_fee.StartRowEditing
        Dim x As New DevExpress.Web.GridViewDataComboBoxColumn
        x = GRD_school_fee.Columns("acad_year_code")
        x = DirectCast(GRD_school_fee.Columns("acad_year_code"), DevExpress.Web.GridViewDataComboBoxColumn)
        x.ReadOnly = True

        Dim x1 As New DevExpress.Web.GridViewDataComboBoxColumn
        x1 = GRD_school_fee.Columns("grade_code")
        x1 = DirectCast(GRD_school_fee.Columns("grade_code"), DevExpress.Web.GridViewDataComboBoxColumn)
        x1.ReadOnly = True

        Dim x2 As New DevExpress.Web.GridViewDataComboBoxColumn
        x2 = GRD_school_fee.Columns("stud_category")
        x2 = DirectCast(GRD_school_fee.Columns("stud_category"), DevExpress.Web.GridViewDataComboBoxColumn)
        x2.ReadOnly = True

        Dim x3 As New DevExpress.Web.GridViewDataComboBoxColumn
        x3 = GRD_school_fee.Columns("class_num")
        x3 = DirectCast(GRD_school_fee.Columns("class_num"), DevExpress.Web.GridViewDataComboBoxColumn)
        x3.ReadOnly = True
    End Sub


End Class