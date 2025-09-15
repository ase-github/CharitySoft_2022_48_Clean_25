
#Region "Imports Directives"

Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxEditors

#End Region

Public Class UCProjectConstructionV1
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

                    Dim object_donation_cat As Object = dv.Table.Rows(0)("donation_cat")

                    If Not object_donation_cat Is Nothing And Not IsDBNull(object_donation_cat) Then

                        Dim donationCode As Int16 = object_donation_cat

                        Using db As New Database()

                            cboClass.Value = (From o In db.donations Where o.donation_code = donationCode Select o.dimension5).FirstOrDefault()

                        End Using

                        donation_cat.DataBind()

                        donation_cat.Value = Convert.ToInt16(dv.Table.Rows(0)("donation_cat"))

                    End If

                    cboState.Value = dv.Table.Rows(0)("project_state_id")
                    cboRelated.Value = dv.Table.Rows(0)("related_project_id")
                    cboRequest.Value = dv.Table.Rows(0)("request_org_org_id")
                    cboBenefit.Value = dv.Table.Rows(0)("org_id")
                    cboTarget.Value = dv.Table.Rows(0)("target_id")

                    txtCost.Value = dv.Table.Rows(0)("cost")
                    txtFurnishCost.Value = dv.Table.Rows(0)("furnish_cost")
                    txtArea.Value = dv.Table.Rows(0)("area")
                    txtDepth.Value = dv.Table.Rows(0)("depth")
                    txtCapacity.Value = dv.Table.Rows(0)("capacity")

                    ASPxComboBox_water_avail.Value = dv.Table.Rows(0)("water_avail")
                    ASPxComboBox_water_source.Value = dv.Table.Rows(0)("water_source")
                    ASPxComboBox_project_road.Value = dv.Table.Rows(0)("project_road")
                    ASPxComboBox_electricity.Value = dv.Table.Rows(0)("electricity")

                    cboCurrency.Value = dv.Table.Rows(0)("currency_code")

                    txtSpecs.Value = dv.Table.Rows(0)("project_specs")

                    nat_code.Value = dv.Table.Rows(0)("nat_code")
                    cboGovernorate.DataBind()
                    cboGovernorate.Value = dv.Table.Rows(0)("governrate_id")
                    cboCity.DataBind()
                    cboCity.Value = dv.Table.Rows(0)("city_id")

                    cboCenter.Value = dv.Table.Rows(0)("center_id")
                    txtVillageName.Value = dv.Table.Rows(0)("villag_name")

                    maintenance_start_date.Value = dv.Table.Rows(0)("maintenance_start_date")
                    maintenance_duration.Value = dv.Table.Rows(0)("maintenance_duration")

                    geo_coordinates.Value = dv.Table.Rows(0)("geo_coordinates")

                    over_plan.Value = dv.Table.Rows(0)("over_plan")
                    OverPlanReasonID.Value = dv.Table.Rows(0)("OverPlanReasonID")

                    ASPxComboBox_Area_Unit.Value = dv.Table.Rows(0)("area_unit")
                    ASPxComboBox_Depth_Unit.Value = dv.Table.Rows(0)("depth_unit")
                    ASPxComboBox_Capacity_Unit.Value = dv.Table.Rows(0)("capacity_unit")

                    ax_dimension.Value = dv.Table.Rows(0)("ax_dimension")

                    beneficiary_count.Value = dv.Table.Rows(0)("beneficiary_count")

                    ElectricitySourceID.Value = dv.Table.Rows(0)("ElectricitySourceID")

                    ConstructionCost.Value = dv.Table.Rows(0)("ConstructionCost")

                    insert_userid.Value = dv.Table.Rows(0)("insert_userid")
                    insert_date.Value = dv.Table.Rows(0)("insert_date")
                    last_update_userid.Value = dv.Table.Rows(0)("last_update_userid")
                    last_update_date.Value = dv.Table.Rows(0)("last_update_date")

                    donation_value.Value = dv.Table.Rows(0)("donation_value")
                    allocated_donation_value.Value = dv.Table.Rows(0)("allocated_donation_value")
                    remaining_donation_value.Value = dv.Table.Rows(0)("remaining_donation_value")

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
                    Response.Redirect(String.Format("UIProjectConstruction.aspx?project_id={0}", txtNum.Value))

                End If

            End If

        End If

    End Sub

    Private Sub IDChanged()

        Session(SessionKey.PROJECT_ID) = txtNum.Value

        Dim showButtons As Boolean = Not txtNum.Value Is Nothing

        btnPhases.Visible = (showButtons)
        btnRemarks.Visible = (showButtons)
        'btnResponsibles.Visible = (showButtons)

        btnLetters.Visible = (showButtons)
        btnDonors.Visible = (showButtons)
        btnRevenue.Visible = (showButtons)
        'btnTransfers.Visible = (showButtons)
        'btnPayments.Visible = (showButtons)
        btnCosts.Visible = (showButtons)
        btnFacility.Visible = (showButtons)
        ASPxButton_RelatedProjects.Visible = (showButtons)

        btnManualProjectAllocation.Visible = (showButtons)
        btnDonorReport.Visible = (showButtons)

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

    Protected Sub btnNew_Click(sender As Object, e As EventArgs) Handles btnNew.Click

        Response.Redirect("UIProjectConstruction.aspx")

    End Sub

#End Region

End Class