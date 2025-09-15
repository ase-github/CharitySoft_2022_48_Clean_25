
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class AwqafReport
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

    Private Sub Print(e As DevExpress.Web.CallbackEventArgs)

        Try

            Print()

            e.Result = "OK"

        Catch ex As Exception

            e.Result = ex.Message

        End Try

    End Sub

    Private Sub Print()

        '=======================================================================================
        'Declaration
        '---------------------------------------------------------------------------------------
        Dim _StringBuilder As StringBuilder
        Dim dicFormulaFields As New Dictionary(Of String, Object)
        '=======================================================================================

        '=======================================================================================
        'Initialization
        '---------------------------------------------------------------------------------------
        _StringBuilder = New StringBuilder
        '---------------------------------------------------------------------------------------

        If Not ASPxDateEdit_From.Value Is Nothing And Not ASPxDateEdit_To.Value Is Nothing Then

            If void.Value = 0 Then

                _StringBuilder.AppendFormat("({0} >= date({1}) AND {0} <= date({2})) ", "{donation_tran.reciept_date}", ASPxDateEdit_From.Date.ToString("yyyy,MM,dd"), ASPxDateEdit_To.Date.ToString("yyyy,MM,dd"))

            Else

                _StringBuilder.AppendFormat("({0} >= date({1}) AND {0} <= date({2})) ", "{donation_tran.void_date}", ASPxDateEdit_From.Date.ToString("yyyy,MM,dd"), ASPxDateEdit_To.Date.ToString("yyyy,MM,dd"))

            End If

            dicFormulaFields.Add("datefrm", ASPxDateEdit_From.Date.ToString("yyyy-MM-dd"))
            dicFormulaFields.Add("dateto", ASPxDateEdit_To.Date.ToString("yyyy-MM-dd"))

        End If

        If Not ASPxTextBox_donor_name.Value Is Nothing Then

            If ASPxTextBox_donor_name.Value <> String.Empty Then

                _StringBuilder.AppendFormat(" AND ({0} LIKE '*{1}*')", "{donor_data.donor_namear}", ASPxTextBox_donor_name.Value)

            End If

        End If

        Dim donor_id_value As Int32 = 0

        If Int32.TryParse(donor_id.Value, donor_id_value) Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{donor_data.donor_id}", donor_id_value)

        End If

        If Not ASPxComboBox_Country.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{nat_tab.nat_code}", ASPxComboBox_Country.Value)

            dicFormulaFields.Add("cntry", ASPxComboBox_Country.Text)

        End If

        If Not ASPxComboBox_Donation.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{donations.donation_code}", ASPxComboBox_Donation.Value)

            'dicFormulaFields.Add("doncat", ASPxComboBox_Purpose.Text)
            dicFormulaFields.Add("dontationdescr", ASPxComboBox_Donation.Text)

        End If

        If Not ASPxComboBox_Purpose.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{donations.donation_cat}", ASPxComboBox_Purpose.Value)

            dicFormulaFields.Add("doncat", ASPxComboBox_Purpose.Text)

        End If

        If Not pay_method_id.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{pay_method_dist.pay_method_id}", pay_method_id.Value)

            dicFormulaFields.Add("paymthd", pay_method_id.Text)

        End If

        If Not applicant_gender.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{donor_data.donor_gender}", applicant_gender.Value)

            dicFormulaFields.Add("sexfrm", applicant_gender.Text)

        End If

        If Not ASPxComboBox_Branch.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{collectors_tab.branch_id}", ASPxComboBox_Branch.Value)

            dicFormulaFields.Add("brnch", ASPxComboBox_Branch.Text)

        End If


        If Not txtAmount.Value Is Nothing Then

            If txtAmount.Value <> String.Empty Then

                _StringBuilder.AppendFormat(" AND ({0} = {1})", "{dont_dist.line_amount}", txtAmount.Value)

            End If
        End If

        If Not txtAmountKD.Value Is Nothing Then

            If txtAmountKD.Value <> String.Empty Then

                _StringBuilder.AppendFormat(" AND ({0} * {1} = {2})", "{dont_dist.line_amount}", "{donation_tran.ExchangeRate}", txtAmountKD.Value)

            End If
        End If

        If Not ASPxComboBox_Currency.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{donation_tran.currency_code}", ASPxComboBox_Currency.Value)

            dicFormulaFields.Add("currfrm", ASPxComboBox_Currency.Text)

        End If

        If Not recpt_src.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{donation_tran.recpt_src}", recpt_src.Value)

            dicFormulaFields.Add("srcfrm", recpt_src.Text)

        End If

        If Not bank_code.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{pay_method_dist.bank_code}", bank_code.Value)

            dicFormulaFields.Add("bnkfrm", bank_code.Text)

        End If

        If void.Value = 0 Then

            _StringBuilder.AppendFormat(" AND ({0} <> {1})", "{donation_tran.void}", 2)

            dicFormulaFields.Add("statfrm", "فعال")

        Else

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{donation_tran.void}", 2)

            dicFormulaFields.Add("statfrm", "ملغى")

        End If

        If Not DatabaseSecurity.IsRoleMember(DatabaseRoles.recp_supervisor) Then

            If Not DatabaseSecurity.IsRoleMember(DatabaseRoles.branch_supervisor) Then

                _StringBuilder.AppendFormat(" AND ({0} = '{1}')", "{donation_tran.user_id}", Session(SessionKey.USERNAME))

            Else

                _StringBuilder.AppendFormat(" AND ({0} = {1})", "{donation_tran.branch}", Session(SessionKey.BRANCH_ID))

            End If

        End If
        '=======================================================================================

        '=======================================================================================
        'Processing
        '---------------------------------------------------------------------------------------
        Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = _StringBuilder.ToString()
        Session(SessionKey.REPORT_DATASOURCE) = Nothing
        Session(SessionKey.REPORT_FORMULA) = dicFormulaFields
        Session(SessionKey.REPORT_FILENAME) = String.Format(".\Reports\{0}.rpt", "Waqf_collec_repbasicvalidation")
        Session(SessionKey.REPORT_BACK_PATH) = "AwqafReport.aspx"
        'Response.Redirect("ReportViewer.aspx")
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

        If Not IsPostBack Then

            ASPxDateEdit_From.Value = DateTime.Now
            ASPxDateEdit_To.Value = DateTime.Now

        End If

    End Sub

    Private Sub cmdClear_Click(sender As Object, e As System.EventArgs) Handles ASPxButton_New.Click
        ClearForm()
    End Sub

    Protected Sub CmdPrint_Click(sender As Object, e As EventArgs) Handles ASPxButton_Print.Click

        'Print()

    End Sub

    Protected Sub ASPxCallback_Print_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Print.Callback

        Print(e)

    End Sub

#End Region

End Class