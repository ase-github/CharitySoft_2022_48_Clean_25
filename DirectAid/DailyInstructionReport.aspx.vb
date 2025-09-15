
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class DailyInstructionReport
    Inherits BaseWebForm

#Region "Fields"

    Private _ws As New DataAccessLibrary
    Protected _culture As String

#End Region

#Region "Methods"

    Private Sub ClearForm()
        Try
            'ddlWaqfColDonation.SelectedIndex = 0
            'ddlNewDonationPurposeType.Items.Clear()

            datalib.ClearForm(form1)
            'txtReceiptDate.Text = DateTime.Now.ToString("dd/MM/yyyy")
            'btnPrint.Enabled = False
            'txtTotalDonation.Text = 0.ToString("N3")
            'txttotintruct.Text = 0.ToString("N3")
            'txtTotalWaqf.Text = 0.ToString("N3")
            'txtSearch.Focus()
            'ddlcampaign.Enabled = True
        Catch ex As Exception

        End Try

    End Sub

    Private Sub Print()

        '=======================================================================================
        'Declaration
        '---------------------------------------------------------------------------------------
        Dim _StringBuilder As StringBuilder
        '=======================================================================================

        '=======================================================================================
        'Initialization
        '---------------------------------------------------------------------------------------
        _StringBuilder = New StringBuilder
        '---------------------------------------------------------------------------------------
        If Not ASPxDateEdit_From.Value Is Nothing And Not ASPxDateEdit_To.Value Is Nothing Then

            _StringBuilder.AppendFormat("({0} >= date({1}) AND {0} <= date({2})) ", "{standing_instruction.instruct_date}", ASPxDateEdit_From.Date.ToString("yyyy,MM,dd"), ASPxDateEdit_To.Date.ToString("yyyy,MM,dd"))

        End If

        If Not ASPxTextBox_donor_name.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} LIKE '*{1}*')", "{donor_data.donor_namear}", ASPxTextBox_donor_name.Value)

        End If

        If Not ASPxComboBox_Country.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{nat_tab.nat_code}", ASPxComboBox_Country.Value)

        End If

        If ddlstandStat.SelectedIndex > 0 Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{standing_instruction.standing_status}", ddlstandStat.SelectedValue)

        End If

        ' If Not ASPxComboBox_Donation.Value Is Nothing Then

        '_StringBuilder.AppendFormat(" AND ({0} = {1})", "{donations.donation_code}", ASPxComboBox_Donation.Value)

        'End If

        'Dim isMember As Boolean = False

        'Dim dv As DataView = SqlDataSource_IS_MEMBER.Select(DataSourceSelectArguments.Empty)

        'If Not dv Is Nothing Then

        '    If dv.Table.Rows.Count > 0 Then

        '        isMember = Convert.ToBoolean(dv.Table.Rows(0)(0))

        '    End If

        'End If

        'If Not isMember Then

        '    _StringBuilder.AppendFormat(" AND ({0} = '{1}')", "{standing_instruction.user_id}", Session(SessionName.USERNAME))

        'End If
        '=======================================================================================

        '=======================================================================================
        'Processing
        '---------------------------------------------------------------------------------------
        Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = _StringBuilder.ToString()
        Session(SessionKey.REPORT_FILENAME) = String.Format(".\Reports\{0}.rpt", ASPxComboBox_ReportType.Value)
        Session(SessionKey.REPORT_BACK_PATH) = "DailyInstructionReport.aspx"
        Session(SessionKey.REPORT_FORMULA) = Nothing
        Response.Redirect("ReportViewerSelectionFormula.aspx")
        '=======================================================================================

    End Sub

#End Region

#Region "Events"

    Protected Overrides Sub InitializeCulture()
        If (Not IsNothing(Session("Culture"))) Then
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Session("Culture"))
            Thread.CurrentThread.CurrentUICulture = CultureInfo.CreateSpecificCulture(Session("Culture"))
        End If

        'base.InitializeCulture()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ApplicationSecurity.OpenWebForm(DatabaseSecurity.IsRoleMember(DatabaseRoles.ded_sub_men))

        SqlDataSource_IS_MEMBER.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

    Private Sub cmdClear_Click(sender As Object, e As System.EventArgs) Handles ASPxButton_New.Click
        ClearForm()
    End Sub

    Protected Sub CmdPrint_Click(sender As Object, e As EventArgs) Handles ASPxButton_Print.Click

        Print()

    End Sub

#End Region

End Class