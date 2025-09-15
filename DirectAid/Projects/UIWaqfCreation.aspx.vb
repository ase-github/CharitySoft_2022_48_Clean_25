
Partial Public Class UIWaqfCreation
    Inherits System.Web.UI.Page

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim dv As DataView = SqlDataSource_current_flag.Select(DataSourceSelectArguments.Empty)

            If Not dv Is Nothing Then

                If dv.Table.Rows.Count > 0 And Session("current_flag") = Nothing Then
                    ' session current_flag condition added by ashraf to maintain the same current_flag

                    Session("current_flag") = dv.Table.Rows(0)("current_flag")
                    Session("batch_id") = DateTime.Now.ToString("ddMMyyyy").ToString & "-" & Session("current_flag").ToString
                    Session("allocated") = False

                End If

            End If

        End If

    End Sub

    Protected Sub SqlDataSource_waqf_donor_receipts_create_view_Donor_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource_waqf_donor_receipts_create_view_Donor.Selecting

        If Not IsPostBack Then

            Dim query_Search = "SELECT {0} FROM waqf_donor_receipts_create_view WHERE (donation_value >=  ISNULL(donation_standard_value, 0)) "

            If Not Session("waqf_donor_receipts_create_view") Is Nothing Then

                query_Search += Session("waqf_donor_receipts_create_view").ToString

            End If

            e.Command.CommandText = String.Format(query_Search, "*")

            ' delete added by ashraf in case of reopen the screen without allocation
            SqlDataSource_waqf_proj_aloc_search.InsertCommand = "delete from waqf_proj_aloc_search where current_flag = " + String.Format(Session("current_flag")) + "; INSERT INTO waqf_proj_aloc_search (reciept_num, current_flag) " + String.Format(String.Format(query_Search, "reciept_num, {0}"), Session("current_flag"))

            'SqlDataSource_waqf_proj_aloc_search.InsertCommand = "INSERT INTO waqf_proj_aloc_search (reciept_num, current_flag) " + String.Format(String.Format(query_Search, "reciept_num, {0}"), Session("current_flag"))
            SqlDataSource_waqf_proj_aloc_search.Insert()
            SqlDataSource_waqf_proj_aloc_search.Insert()

            SqlDataSource_waqf_proj_aloc_temp.InsertParameters("current_flag").DefaultValue = Session("current_flag")
            SqlDataSource_waqf_proj_aloc_temp.InsertParameters("batch_id").DefaultValue = Session("batch_id")
            SqlDataSource_waqf_proj_aloc_temp.Insert()

            'SqlDataSource_SUM_Donor.SelectCommand = String.Format(query_Search, "SUM(donation_value)")

            'Dim dv As DataView = SqlDataSource_SUM_Donor.Select(DataSourceSelectArguments.Empty)

            'If Not dv Is Nothing Then

            '    If dv.Table.Rows.Count > 0 Then

            '        ASPxTextBox_TotalValue.Value = dv.Table.Rows(0)(0)

            '    End If

            'End If

        End If

    End Sub

    Protected Sub SqlDataSource_waqf_donor_receipts_create_view_SharingDonor_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource_waqf_donor_receipts_create_view_SharingDonor.Selecting

        If Not IsPostBack Then

            Dim query_Search = "SELECT {0} FROM waqf_donor_receipts_create_view WHERE (donation_value <  ISNULL(donation_standard_value, 0)) "

            If Not Session("waqf_donor_receipts_create_view") Is Nothing Then

                query_Search += Session("waqf_donor_receipts_create_view").ToString

            End If

            e.Command.CommandText = String.Format(query_Search, "*")

            SqlDataSource_waqf_proj_aloc_search.InsertCommand = "INSERT INTO waqf_proj_aloc_search (reciept_num, current_flag) " + String.Format(String.Format(query_Search, "reciept_num, {0}"), Session("current_flag"))
            SqlDataSource_waqf_proj_aloc_search.Insert()

            SqlDataSource_waqf_proj_aloc_temp.InsertParameters("current_flag").DefaultValue = Session("current_flag")
            SqlDataSource_waqf_proj_aloc_temp.InsertParameters("batch_id").DefaultValue = Session("batch_id")
            SqlDataSource_waqf_proj_aloc_temp.Insert()

            'SqlDataSource_SUM_Donor.SelectCommand = String.Format(query_Search, "SUM(donation_value)")

            'Dim dv As DataView = SqlDataSource_SUM_Donor.Select(DataSourceSelectArguments.Empty)

            'If Not dv Is Nothing Then

            '    If dv.Table.Rows.Count > 0 Then

            '        ASPxTextBox_TotalValue_Share.Value = dv.Table.Rows(0)(0)

            '    End If

            'End If

        End If

    End Sub

    Protected Sub ASPxCallback_Donor_Callback(ByVal source As Object, ByVal e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Donor.Callback

        SqlDataSource_waqf_proj_aloc_temp.UpdateParameters("enab_disab").DefaultValue = Convert.ToByte(Convert.ToBoolean(e.Parameter.Split("|")(1)))
        SqlDataSource_waqf_proj_aloc_temp.UpdateParameters("reciept_num").DefaultValue = ASPxGridView_Donor.GetRowValues(e.Parameter.Split("|")(0), "reciept_num")
        SqlDataSource_waqf_proj_aloc_temp.Update()

    End Sub

    Protected Sub ASPxCallback_SharingDonor_Callback(ByVal source As Object, ByVal e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_SharingDonor.Callback

        SqlDataSource_waqf_proj_aloc_temp.UpdateParameters("enab_disab").DefaultValue = Convert.ToByte(Convert.ToBoolean(e.Parameter.Split("|")(1)))
        SqlDataSource_waqf_proj_aloc_temp.UpdateParameters("reciept_num").DefaultValue = ASPxGridView_SharingDonor.GetRowValues(e.Parameter.Split("|")(0), "reciept_num")
        SqlDataSource_waqf_proj_aloc_temp.Update()

    End Sub

    Protected Sub SqlDataSource_waqf_create_temp_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource_waqf_create_temp.Selecting

        'SqlDataSource_waqf_create_temp.SelectParameters("batch_id").DefaultValue = Session("batch_id")

    End Sub

    Protected Sub ASPxButton_alocate_waqf_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ASPxButton_alocate_waqf.Click

        SqlDataSource_alocate_waqf.InsertParameters("current_flag").DefaultValue = Session("current_flag")
        SqlDataSource_alocate_waqf.InsertParameters("aloc_bat").DefaultValue = Session("batch_id")
        SqlDataSource_alocate_waqf.Insert()
        Response.Redirect("UIWaqfCreation.aspx")

    End Sub

#End Region

End Class