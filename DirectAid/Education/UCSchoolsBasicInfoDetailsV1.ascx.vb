Imports System.Globalization
Imports System.Data.SqlClient

Public Class UCSchoolsBasicInfoDetailsV1
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        school_grades_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        school_holidays_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        currency_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        acad_year_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        grades_setup_DS.ConnectionString = New ConnectionStringEx().TheConnectionString

        txt_school_code.Text = Request.QueryString(QueryStringKey.SchoolID)
    End Sub

    Protected Sub school_grades_GRD_CustomErrorText(sender As Object, e As DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs) Handles school_grades_GRD.CustomErrorText
        If e.Exception IsNot Nothing Then
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                e.ErrorText = "لقد قمت بادخال هذه الحقول مسبقا. برجاء ادخال قيم جديدة"
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                e.ErrorText = "These fields are already inserted. Please insert new values."
            End If
            ''e.ErrorText = "لقد قمت بادخال هذه الحقول مسبقا. برجاء ادخال قيم جديدة"
        End If
    End Sub

    Private Sub school_grades_GRD_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles school_grades_GRD.StartRowEditing
        Dim x As New DevExpress.Web.GridViewDataComboBoxColumn

        x = school_grades_GRD.Columns("academic_year")
        x = DirectCast(school_grades_GRD.Columns("academic_year"), DevExpress.Web.GridViewDataComboBoxColumn)

        x.ReadOnly = True

        '
        x = school_grades_GRD.Columns("grade_code")
        x = DirectCast(school_grades_GRD.Columns("grade_code"), DevExpress.Web.GridViewDataComboBoxColumn)

        x.ReadOnly = True

        'Dim fCtrl As System.Web.UI.Control = Nothing
        'fCtrl = school_grades_GRD.FindEditRowCellTemplateControl(school_grades_GRD.Columns("Field1"), "academic_year")

        'If Not IsNothing(fCtrl) Then CType(fCtrl, DevExpress.Web.ASPxComboBox).ReadOnly = True


    End Sub

    Private Sub ASPxGridView2_CellEditorInitialize(sender As Object, e As DevExpress.Web.ASPxGridViewEditorEventArgs) Handles ASPxGridView2.CellEditorInitialize
        'holiday_days_num

    End Sub

    Protected Sub ASPxGridView2_CustomErrorText(sender As Object, e As DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs) Handles ASPxGridView2.CustomErrorText
        If e.Exception IsNot Nothing Then
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                e.ErrorText = "لقد قمت بادخال هذه الحقول مسبقا. برجاء ادخال قيم جديدة"
            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                e.ErrorText = "These fields are already inserted. Please insert new values."
            End If
            ''e.ErrorText = "لقد قمت بادخال هذه الحقول مسبقا. برجاء ادخال قيم جديدة"
        End If
    End Sub

    Private Sub ASPxGridView2_ParseValue(sender As Object, e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles ASPxGridView2.ParseValue

    End Sub '

    Private Sub ASPxGridView2_RowInserting(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView2.RowInserting
        'e.NewValues("school_code") = Val(txt_school_code.Text)
        'Dim holiday_ser_val As Integer
        'sql_str = "SELECT ISNULL(max(holiday_ser),0) as holiday_ser from school_holidays "

        'Dim ds As DataSet
        'ds = _ws.GetMyData("charitysoft", Session("username"), Session("password"), sql_str)
        'holiday_ser_val = If(IsDBNull(ds.Tables(0).Rows(0).Item("holiday_ser")), 0, ds.Tables(0).Rows(0).Item("holiday_ser"))

        'e.NewValues("holiday_ser") = Val(holiday_ser_val + 1)

        'Dim column As GridViewDataColumn = TryCast(grid.Columns("Notes"), GridViewDataColumn)


    End Sub

    Private Sub ASPxGridView2_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles ASPxGridView2.RowValidating

        Dim amount1 As Decimal = 0

        If e.NewValues("holiday_days_num") Is Nothing Then
            Decimal.TryParse(String.Empty, amount1)
        Else
            Decimal.TryParse(e.NewValues("holiday_days_num").ToString(), amount1)
        End If
        If amount1 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("عدد الايام يجب ان يكون اكبر من صفر ")
        End If
    End Sub

    Private Sub ASPxGridView2_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles ASPxGridView2.StartRowEditing
        Dim x As New DevExpress.Web.GridViewDataComboBoxColumn
        x = ASPxGridView2.Columns("acad_year_code")
        x = DirectCast(ASPxGridView2.Columns("acad_year_code"), DevExpress.Web.GridViewDataComboBoxColumn)
        x.ReadOnly = True

        '
        Dim y As New DevExpress.Web.GridViewDataDateColumn
        y = ASPxGridView2.Columns("holiday_start_date")
        y = DirectCast(ASPxGridView2.Columns("holiday_start_date"), DevExpress.Web.GridViewDataDateColumn)
        y.ReadOnly = True

    End Sub

End Class