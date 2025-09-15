
#Region "Imports Directives"

Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxEditors

#End Region

Public Class UCProjectDevelopmentV1
    Inherits System.Web.UI.UserControl

#Region "Fields"

    Public IsSearchMode As Boolean = False

#End Region

#Region "Methods"

    Private Sub Loading()

        btnSave.Visible = Not IsSearchMode
        txtNum.ReadOnly = Not IsSearchMode

        If Not IsPostBack Then

            Dim dv As DataView = SqlDataSource_Project.Select(DataSourceSelectArguments.Empty)

            If Not dv Is Nothing Then

                If dv.Table.Rows.Count > 0 Then

                    txtNum.Value = dv.Table.Rows(0)("project_id")
                    txtRefNum.Value = dv.Table.Rows(0)("refrence_no")

                    txtNameAR.Value = dv.Table.Rows(0)("project_name_ar")
                    txtNameEN.Value = dv.Table.Rows(0)("project_name_EN")

                    deApproveDate.Value = dv.Table.Rows(0)("approve_date")
                    deStartDate.Value = dv.Table.Rows(0)("start_date")
                    deFinishDate.Value = dv.Table.Rows(0)("finish_date")

                    donation_cat.Value = Convert.ToInt16(dv.Table.Rows(0)("donation_cat"))

                    cboState.Value = dv.Table.Rows(0)("project_state_id")
                    cboNature.Value = dv.Table.Rows(0)("project_nature")

                    cboFundSource.Value = dv.Table.Rows(0)("fund_source")

                    cboBenefit.Value = dv.Table.Rows(0)("org_id")

                    txtSpecs.Value = dv.Table.Rows(0)("project_specs")

                    nat_code.Value = dv.Table.Rows(0)("nat_code")
                    cboGovernorate.DataBind()
                    cboGovernorate.Value = dv.Table.Rows(0)("governrate_id")
                    cboCity.DataBind()
                    cboCity.Value = dv.Table.Rows(0)("city_id")

                    cboCenter.Value = dv.Table.Rows(0)("center_id")
                    txtVillageName.Value = dv.Table.Rows(0)("villag_name")


                    geo_coordinates.Value = dv.Table.Rows(0)("geo_coordinates")


                    over_plan.Value = dv.Table.Rows(0)("over_plan")

                    Cancelled.Value = dv.Table.Rows(0)("Cancelled")


                    ax_dimension.Value = dv.Table.Rows(0)("ax_dimension")

                    loan_date.Value = dv.Table.Rows(0)("loan_date")
                    loan_pay_period.Value = dv.Table.Rows(0)("loan_pay_period")
                    loan_pay_start_date.Value = dv.Table.Rows(0)("loan_pay_start_date")
                    beneficiary_count.Value = dv.Table.Rows(0)("beneficiary_count")

                    RegisterDate.Value = dv.Table.Rows(0)("RegisterDate")
                    Goals.Value = dv.Table.Rows(0)("Goals")
                    AccreditedBy.Value = dv.Table.Rows(0)("AccreditedBy")
                    BeneficiaryFamilyCount.Value = dv.Table.Rows(0)("BeneficiaryFamilyCount")

                    insert_userid.Value = dv.Table.Rows(0)("insert_userid")
                    insert_date.Value = dv.Table.Rows(0)("insert_date")
                    last_update_userid.Value = dv.Table.Rows(0)("last_update_userid")
                    last_update_date.Value = dv.Table.Rows(0)("last_update_date")

                    cboCurrency.Value = dv.Table.Rows(0)("currency_code")

                    ReceivedAmount.Value = dv.Table.Rows(0)("ReceivedAmount")

                    PaidAmount.Value = dv.Table.Rows(0)("PaidAmount")

                    RemainingAmount.Value = dv.Table.Rows(0)("RemainingAmount")

                    ReceiveDate.Value = dv.Table.Rows(0)("ReceiveDate")
                    Results.Value = dv.Table.Rows(0)("Results")
                    Guarantees.Value = dv.Table.Rows(0)("Guarantees")

                    IDChanged()

                End If

            End If

        End If

    End Sub

    Private Sub Saving()

        If Not txtNum.Value Is Nothing Then

            SqlDataSource_Project.Update()

        Else

            Dim dv As DataView = SqlDataSource_GetNextID.Select(DataSourceSelectArguments.Empty)

            If Not dv Is Nothing Then

                If dv.Table.Rows.Count > 0 Then

                    txtNum.Value = dv.Table.Rows(0)("project_id")
                    SqlDataSource_Project.Insert()
                    Response.Redirect(String.Format("UIProjectDevelopment.aspx?project_id={0}", txtNum.Value))

                End If

            End If

        End If

    End Sub

    Private Sub IDChanged()

        Session(SessionKey.PROJECT_ID) = txtNum.Value

        Dim showButtons As Boolean = Not txtNum.Value Is Nothing

        btnPhases.Visible = (showButtons)
        btnRemarks.Visible = (showButtons)
        btnResponsibles.Visible = (showButtons)
        btnLetters.Visible = (showButtons)
        btnDonors.Visible = (showButtons)
        ASPxButton1.Visible = (showButtons)
        ASPxButton2.Visible = (showButtons)
        ASPxButton3.Visible = (showButtons)
        ASPxButton4.Visible = (showButtons)
        ASPxButton5.Visible = (showButtons)
        ASPxButton_InstallmentTable.Visible = (showButtons)
        ASPxButton_Families.Visible = (showButtons)

        btnManualProjectAllocation.Visible = (showButtons)

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SqlDataSource_Project.ConnectionString = New ConnectionStringEx().TheConnectionString

        Loading()

    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnSave.Click

        Saving()

    End Sub

    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnNew.Click

        Response.Redirect("UIProjectDevelopment.aspx")

    End Sub

#End Region

End Class