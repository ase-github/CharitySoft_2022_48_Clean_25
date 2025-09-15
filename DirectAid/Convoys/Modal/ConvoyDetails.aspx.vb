Public Class ConvoyDetails
    Inherits BaseWebForm

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        job_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_convoy_members.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_convoy_objectives.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_convoy_activities_master.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_convoy_activities.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_convoy_disease.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_convoy_results.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_convoy_medicines_and_supplies.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_convoy_medecines.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_convoy_expenses.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_convoy_advantages.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_convoy_suggestions.ConnectionString = New ConnectionStringEx().TheConnectionString
        currency_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

    Protected Sub grd_ConvoyResults_ParseValue(sender As Object, e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles grd_ConvoyResults.ParseValue
        Try
            If e.FieldName.Equals("female_count") Then
                Dim female_count As Integer
                If e.Value Is Nothing Or Not Integer.TryParse(e.Value.ToString(), female_count) Then
                    Throw New Exception("برجاء ادخال ارقام.")
                End If
            End If
            If e.FieldName.Equals("male_count") Then
                Dim male_count As Integer
                If e.Value Is Nothing Or Not Integer.TryParse(e.Value.ToString(), male_count) Then
                    Throw New Exception("برجاء ادخال ارقام.")
                End If
            End If
        Catch ex As NullReferenceException
            Throw New Exception("برجاء ادخال ارقام.")
        End Try
    End Sub
End Class