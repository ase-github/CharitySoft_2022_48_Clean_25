
Partial Public Class UIYearlyProjectCreation
    Inherits System.Web.UI.Page

#Region "Methods"

    Public Function OK() As Boolean

        Dim re As Boolean = False

        Try

            For a = 0 To ASPxGridView_Approval.VisibleRowCount - 1

                Dim project_id As Int32 = ASPxGridView_Approval.GetRowValues(a, "project_id")
                Dim approved As Boolean = DirectCast(ASPxGridView_Approval.FindRowCellTemplateControl(a, ASPxGridView_Approval.Columns("approved"), "approved"), DevExpress.Web.ASPxCheckBox).Value
                Dim over_reason As String = DirectCast(ASPxGridView_Approval.FindRowCellTemplateControl(a, ASPxGridView_Approval.Columns("over_reason"), "over_reason"), DevExpress.Web.ASPxTextBox).Value

                SqlDataSource_OK.UpdateParameters("approved").DefaultValue = Convert.ToString(approved)
                SqlDataSource_OK.UpdateParameters("over_reason").DefaultValue = over_reason
                SqlDataSource_OK.UpdateParameters("project_id").DefaultValue = project_id

                SqlDataSource_OK.Update()

            Next

            SqlDataSource_OK.InsertParameters("aloc_bat").DefaultValue = Session("batch_id")
            SqlDataSource_OK.InsertParameters("current_flag").DefaultValue = Session("current_flag")
            SqlDataSource_OK.Insert()
            re = True

        Catch ex As Exception

            Throw ex

        End Try

        Return re

    End Function

    Public Function Cancel() As Boolean

        Dim re As Boolean = False

        Try

            SqlDataSource_Cancel.Insert()
            re = True

        Catch ex As Exception

            Throw ex

        End Try

        Return re

    End Function

#End Region

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

            SqlDataSource_yearly_waqf_proj_aloc_temp.InsertParameters("current_flag").DefaultValue = Session("current_flag")
            SqlDataSource_yearly_waqf_proj_aloc_temp.InsertParameters("batch_id").DefaultValue = Session("batch_id")
            SqlDataSource_yearly_waqf_proj_aloc_temp.Insert()

        End If

    End Sub

    Protected Sub SqlDataSource_waqf_donor_receipts_create_view_Donor_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource_waqf_accrual_view_1_Donor.Selecting

        If Not IsPostBack Then

            Dim query_Search = "SELECT {0} FROM waqf_accrual_view_1 WHERE ([donors_count] =  1) "

            If Not Session("waqf_accrual_view_1") Is Nothing Then

                query_Search += Session("waqf_accrual_view_1").ToString

            End If

            e.Command.CommandText = String.Format(query_Search, "*")

            '' delete added by ashraf in case of reopen the screen without allocation
            'SqlDataSource_waqf_proj_aloc_search.InsertCommand = "delete from waqf_proj_aloc_search where current_flag = " + String.Format(Session("current_flag")) + "; INSERT INTO waqf_proj_aloc_search (reciept_num, current_flag) " + String.Format(String.Format(query_Search, "'' AS reciept_num, {0}"), Session("current_flag"))

            ''SqlDataSource_waqf_proj_aloc_search.InsertCommand = "INSERT INTO waqf_proj_aloc_search (reciept_num, current_flag) " + String.Format(String.Format(query_Search, "reciept_num, {0}"), Session("current_flag"))
            'SqlDataSource_waqf_proj_aloc_search.Insert()

            'SqlDataSource_yearly_waqf_proj_aloc_temp.InsertParameters("current_flag").DefaultValue = Session("current_flag")
            'SqlDataSource_yearly_waqf_proj_aloc_temp.InsertParameters("batch_id").DefaultValue = Session("batch_id")
            'SqlDataSource_yearly_waqf_proj_aloc_temp.Insert()

            'SqlDataSource_SUM_Donor.SelectCommand = String.Format(query_Search, "SUM(revenue)")

            'Dim dv As DataView = SqlDataSource_SUM_Donor.Select(DataSourceSelectArguments.Empty)

            'If Not dv Is Nothing Then

            '    If dv.Table.Rows.Count > 0 Then

            '        ASPxTextBox_TotalValue.Value = dv.Table.Rows(0)(0)

            '    End If

            'End If

        End If

    End Sub

    Protected Sub SqlDataSource_waqf_donor_receipts_create_view_SharingDonor_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource_waqf_accrual_view_1_SharingDonor.Selecting

        If Not IsPostBack Then

            Dim query_Search = "SELECT {0} FROM waqf_accrual_view_1 WHERE ([donors_count] >  1) "

            If Not Session("waqf_accrual_view_1") Is Nothing Then

                query_Search += Session("waqf_accrual_view_1").ToString

            End If

            e.Command.CommandText = String.Format(query_Search, "*")

            'SqlDataSource_waqf_proj_aloc_search.InsertCommand = "INSERT INTO waqf_proj_aloc_search (reciept_num, current_flag) " + String.Format(String.Format(query_Search, "'' AS reciept_num, {0}"), Session("current_flag"))
            'SqlDataSource_waqf_proj_aloc_search.Insert()

            'SqlDataSource_yearly_waqf_proj_aloc_temp.InsertParameters("current_flag").DefaultValue = Session("current_flag")
            'SqlDataSource_yearly_waqf_proj_aloc_temp.InsertParameters("batch_id").DefaultValue = Session("batch_id")
            'SqlDataSource_yearly_waqf_proj_aloc_temp.Insert()

            'SqlDataSource_SUM_Donor.SelectCommand = String.Format(query_Search, "SUM(revenue)")

            'Dim dv As DataView = SqlDataSource_SUM_Donor.Select(DataSourceSelectArguments.Empty)

            'If Not dv Is Nothing Then

            '    If dv.Table.Rows.Count > 0 Then

            '        ASPxTextBox_TotalValue_Share.Value = dv.Table.Rows(0)(0)

            '    End If

            'End If

        End If

    End Sub

    Protected Sub ASPxCallback_Donor_Callback(ByVal source As Object, ByVal e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Donor.Callback

        SqlDataSource_yearly_waqf_proj_aloc_temp.UpdateParameters("enab_disab").DefaultValue = Convert.ToByte(Convert.ToBoolean(e.Parameter.Split("|")(1)))
        SqlDataSource_yearly_waqf_proj_aloc_temp.UpdateParameters("reciept_num").DefaultValue = ASPxGridView_Donor.GetRowValues(e.Parameter.Split("|")(0), "reciept_num")
        SqlDataSource_yearly_waqf_proj_aloc_temp.Update()

    End Sub

    Protected Sub ASPxCallback_SharingDonor_Callback(ByVal source As Object, ByVal e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_SharingDonor.Callback

        SqlDataSource_yearly_waqf_proj_aloc_temp.UpdateParameters("enab_disab").DefaultValue = Convert.ToByte(Convert.ToBoolean(e.Parameter.Split("|")(1)))
        SqlDataSource_yearly_waqf_proj_aloc_temp.UpdateParameters("reciept_num").DefaultValue = ASPxGridView_SharingDonor.GetRowValues(e.Parameter.Split("|")(0), "reciept_num")
        SqlDataSource_yearly_waqf_proj_aloc_temp.Update()

    End Sub

    Protected Sub SqlDataSource_waqf_create_temp_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles SqlDataSource_project_create_temp.Selecting

        'SqlDataSource_waqf_create_temp.SelectParameters("batch_id").DefaultValue = Session("batch_id")

    End Sub

    'Protected Sub ASPxButton_alocate_project_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ASPxButton_alocate_project.Click

    '    SqlDataSource_yearly_alocate_project.InsertParameters("current_flag").DefaultValue = Session("current_flag")
    '    SqlDataSource_yearly_alocate_project.InsertParameters("aloc_bat").DefaultValue = Session("batch_id")
    '    SqlDataSource_yearly_alocate_project.Insert()
    '    Response.Redirect("UIYearlyProjectCreation.aspx")

    'End Sub

    Protected Sub ASPxCallback_AllocateProject_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_AllocateProject.Callback

        Try

            SqlDataSource_yearly_alocate_project.InsertParameters("current_flag").DefaultValue = Session("current_flag")
            SqlDataSource_yearly_alocate_project.InsertParameters("aloc_bat").DefaultValue = Session("batch_id")
            SqlDataSource_yearly_alocate_project.Insert()
            e.Result = "OK"

        Catch ex As Exception

            e.Result = ex.Message

        End Try


    End Sub

    Protected Sub ASPxCallback_OK_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_OK.Callback

        e.Result = OK()


    End Sub

    Protected Sub ASPxCallback_Cancel_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Cancel.Callback

        e.Result = Cancel()

    End Sub

#End Region

End Class