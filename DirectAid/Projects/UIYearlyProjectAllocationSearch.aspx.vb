
Partial Public Class UIYearlyProjectAllocationSearch
    Inherits System.Web.UI.Page

#Region "Events"

    Private Function GenerateInString(ByVal list As DevExpress.Web.ASPxCheckBoxList)

        Dim re As String = ""

        If list.SelectedIndices.Count > 0 Then

            re = list.SelectedValues(0)

            For a As Integer = 1 To list.SelectedIndices.Count - 1

                re = re & "," & list.SelectedValues(a).ToString

            Next

        End If

        Return re

    End Function

    Protected Sub ASPxButton_Allocate_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ASPxButton_Allocate.Click

        Session("waqf_accrual_view_1") = Nothing

        Dim sb As New StringBuilder

        Select Case donors_count.Value

            Case 1
                sb.AppendFormat("AND ({0} = {1})", donors_count.ID, 1)

            Case 2
                sb.AppendFormat("AND ({0} > {1})", donors_count.ID, 1)

        End Select

        If Not create_date_from.Value Is Nothing And Not create_date_to.Value Is Nothing Then

            sb.AppendFormat("AND ({0} BETWEEN {1} AND {2})", "create_date", create_date_from.Value, create_date_to.Value)

        End If

        Select Case waqf_amount_operator.Value

            Case 1
                sb.AppendFormat("AND ({0} > {1})", waqf_amount.ID, waqf_amount.Value)

            Case 2
                sb.AppendFormat("AND ({0} < {1})", waqf_amount.ID, waqf_amount.Value)

            Case 3
                sb.AppendFormat("AND ({0} = {1})", waqf_amount.ID, waqf_amount.Value)

        End Select

            If donor_gender.SelectedIndices.Count > 0 Then

                sb.AppendFormat("AND ({0} IN ({1}))", donor_gender.ID, GenerateInString(donor_gender))

            End If

            'If nat_group.SelectedIndices.Count > 0 Then

            '    sb.AppendFormat("AND ({0} IN ({1}))", nat_group.ID, GenerateInString(nat_group))

            'End If

            'If pay_method_id.SelectedIndices.Count > 0 Then

            '    sb.AppendFormat("AND ({0} IN ({1}))", pay_method_id.ID, GenerateInString(pay_method_id))

            'End If

            'If bank_code.SelectedIndices.Count > 0 Then

            '    sb.AppendFormat("AND ({0} IN ({1}))", bank_code.ID, GenerateInString(bank_code))

            'End If

            'If zone_code.SelectedIndices.Count > 0 Then

            '    sb.AppendFormat("AND ({0} IN ({1}))", zone_code.ID, GenerateInString(zone_code))

            'End If

            'If country_code.SelectedIndices.Count > 0 Then

            '    sb.AppendFormat("AND ({0} IN ({1}))", country_code.ID, GenerateInString(country_code))

            'End If

            'If [partial].Checked Then

            '    sb.AppendFormat("AND ({0} = {1})", [partial].ID, 1)

            'End If


            Session("waqf_accrual_view_1") = sb.ToString

            Response.Redirect("UIYearlyProjectCreation.aspx")

    End Sub

    Protected Sub SqlDataSource_ProjectType_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource_ProjectType.Selecting

        e.Command.CommandText = "SELECT [donation_code], [donation_cat], [donation_descrar], [donation_descreng], [dimension5] FROM dbo.donations WHERE ( donation_code IN ( SELECT DISTINCT donation_cat FROM   dbo.waqf_accrual_view_1 ) ) ORDER BY donation_descrar"

    End Sub

#End Region

End Class