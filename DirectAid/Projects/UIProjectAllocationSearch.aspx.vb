
Partial Public Class UIProjectAllocationSearch
    Inherits System.Web.UI.Page

#Region "Methods"

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

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ASPxButton_Allocate.Visible = (donation_type.Value = 2)
        ASPxButton_Allocate_Projects.Visible = (donation_type.Value = 1)

    End Sub

    Protected Sub ASPxButton_Allocate_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ASPxButton_Allocate.Click

        Session("waqf_donor_receipts_create_view") = Nothing

        Dim sb As New StringBuilder

        If donation_type.Value = 1 Then

            sb.AppendFormat("AND ({0} IN ({1}))", "donation_type", "1, 3")

        Else

            sb.AppendFormat("AND ({0} IN ({1}))", "donation_type", donation_type.Value)

        End If

        If dimension5.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", dimension5.ID, GenerateInString(dimension5))

        End If

        If donation_cat.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", donation_cat.ID, GenerateInString(donation_cat))

        End If

        If donor_gender.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", donor_gender.ID, GenerateInString(donor_gender))

        End If

        If nat_group.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", nat_group.ID, GenerateInString(nat_group))

        End If

        If pay_method_id.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", pay_method_id.ID, GenerateInString(pay_method_id))

        End If

        If bank_code.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", bank_code.ID, GenerateInString(bank_code))

        End If

        If country_code.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", country_code.ID, GenerateInString(country_code))

        End If

        If [partial].Checked Then

            sb.AppendFormat("AND ({0} = {1})", [partial].ID, 1)

        End If


        Session("waqf_donor_receipts_create_view") = sb.ToString

        Response.Redirect("UIWaqfCreation.aspx")

    End Sub

    Protected Sub ASPxButton_Allocate_Projects_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ASPxButton_Allocate_Projects.Click

        Session("project_donor_receipts_create_view") = Nothing

        Dim sb As New StringBuilder

        If donation_type.Value = 1 Then

            sb.AppendFormat("AND ({0} IN ({1}))", "donation_type", "1, 3")

        Else

            sb.AppendFormat("AND ({0} IN ({1}))", donation_type.ID, donation_type.Value)

        End If

        If dimension5.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", dimension5.ID, GenerateInString(dimension5))

        End If

        If donation_cat.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", donation_cat.ID, GenerateInString(donation_cat))

        End If

        If donor_gender.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", donor_gender.ID, GenerateInString(donor_gender))

        End If

        If nat_group.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", nat_group.ID, GenerateInString(nat_group))

        End If

        If pay_method_id.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", pay_method_id.ID, GenerateInString(pay_method_id))

        End If

        If bank_code.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", bank_code.ID, GenerateInString(bank_code))

        End If

        If country_code.SelectedIndices.Count > 0 Then

            sb.AppendFormat("AND ({0} IN ({1}))", country_code.ID, GenerateInString(country_code))

        End If

        If [partial].Checked Then

            sb.AppendFormat("AND ({0} = {1})", [partial].ID, 1)

        End If


        Session("project_donor_receipts_create_view") = sb.ToString

        Response.Redirect("UIProjectCreation.aspx")

    End Sub

    Protected Sub SqlDataSource_ProjectType_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource_ProjectType.Selecting

        If donation_type.Value = 2 Then

            e.Command.CommandText = "SELECT [donation_code], [donation_cat], [donation_descrar], [donation_descreng], [dimension5] FROM dbo.donations WHERE (donation_code IN (SELECT DISTINCT donation_cat FROM dbo.waqf_donor_receipts_create_view)) AND (([donation_cat] = @donation_cat) OR ([donation_cat] = @donation_cat_3)) ORDER BY donation_descrar"

        Else

            e.Command.CommandText = "SELECT [donation_code], [donation_cat], [donation_descrar], [donation_descreng], [dimension5] FROM dbo.donations WHERE (donation_code IN (SELECT DISTINCT donation_cat FROM dbo.project_donor_receipts_create_view)) AND (([donation_cat] = @donation_cat) OR ([donation_cat] = @donation_cat_3)) ORDER BY donation_descrar"

        End If

        e.Command.Parameters("@donation_cat").Value = donation_type.Value

        If donation_type.Value = 2 Then

            e.Command.Parameters("@donation_cat_3").Value = 2

        Else

            e.Command.Parameters("@donation_cat_3").Value = 3

        End If

    End Sub

    Protected Sub donation_type_ValueChanged(sender As Object, e As EventArgs) Handles donation_type.ValueChanged

        donation_cat.DataBind()

    End Sub

#End Region

End Class