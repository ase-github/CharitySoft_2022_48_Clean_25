Public Class UCSchoolsEmployeesDetailsV1
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        employees_matrix_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        acad_year_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        grades_setup_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        school_subject_DS.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

    Protected Sub ASPxGridView1_CustomErrorText(sender As Object, e As DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs) Handles ASPxGridView1.CustomErrorText
        If e.ErrorText.ToLower().Contains("Violation of PRIMARY KEY constraint".ToLower()) Then
            e.ErrorText = "لقد قمت بادخال هذه البيانات مسبقا برجاء ادخال قيم جديدة"
        End If
    End Sub

End Class