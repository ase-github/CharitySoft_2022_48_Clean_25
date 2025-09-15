Imports System.Globalization

Public Class UCSchoolBuildingsV1
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        school_building_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        acad_year_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        currency_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        unit_types_codes_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        unit_cond_DS.ConnectionString = New ConnectionStringEx().TheConnectionString

        txt_school_code.Text = Request.QueryString(QueryStringKey.SchoolID)

    End Sub

    Private Sub GRD_school_build_ParseValue(sender As Object, e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles GRD_school_build.ParseValue
        If e.FieldName.Equals("accomd_cost") Then
            Dim amount As Decimal = 0
            If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة تكلفة التجهيزات ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("accomodation cost amount must be an ineteger value.")
                End If

            End If
        End If

        If e.FieldName.Equals("maint_cost") Then
            Dim amount As Decimal = 0
            If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة تكلفة الصيانة ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("Maintenance cost amount must be an ineteger value.")
                End If

            End If
        End If

        If e.FieldName.Equals("construction_cost") Then
            Dim amount As Decimal = 0
            If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة تكلفة الانشاء ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("construction cost amount must be an ineteger value.")
                End If

            End If
        End If

        If e.FieldName.Equals("unit_count") Then
            Dim amount As Decimal = 0
            If e.Value Is Nothing OrElse (Not Decimal.TryParse(e.Value.ToString(), amount)) Then
                If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
                    Throw New Exception("خطأ في ادخال قيمة عدد الوحدات ، يسمح ارقام فقط")
                ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
                    Throw New Exception("unit count amount must be an ineteger value.")
                End If

            End If
        End If
    End Sub

    Private Sub GRD_school_build_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles GRD_school_build.RowValidating
        Dim amount1 As Decimal = 0

        If e.NewValues("accomd_cost") Is Nothing Then
            Decimal.TryParse(String.Empty, amount1)
        Else
            Decimal.TryParse(e.NewValues("accomd_cost").ToString(), amount1)
        End If
        If amount1 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("تكلفة التجهيزات يجب ان يكون اكبر من صفر ")
        End If

        Dim amount2 As Decimal = 0

        If e.NewValues("maint_cost") Is Nothing Then
            Decimal.TryParse(String.Empty, amount2)
        Else
            Decimal.TryParse(e.NewValues("maint_cost").ToString(), amount2)
        End If
        If amount2 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("تكلفة الصيانة يجب ان يكون اكبر من صفر ")
        End If


        Dim amount3 As Decimal = 0

        If e.NewValues("construction_cost") Is Nothing Then
            Decimal.TryParse(String.Empty, amount3)
        Else
            Decimal.TryParse(e.NewValues("construction_cost").ToString(), amount3)
        End If
        If amount3 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("تكلفة الانشاء يجب ان يكون اكبر من صفر ")
        End If

        Dim amount4 As Decimal = 0

        If e.NewValues("unit_count") Is Nothing Then
            Decimal.TryParse(String.Empty, amount4)
        Else
            Decimal.TryParse(e.NewValues("unit_count").ToString(), amount4)
        End If
        If amount4 < 0 Then
            'AddError(e.Errors, ASPxGridView3.Columns("result_desc"), "Age must be greater than or equal Zero")
            Throw New Exception("عدد الوحدات يجب ان يكون اكبر من صفر ")
        End If
    End Sub

End Class