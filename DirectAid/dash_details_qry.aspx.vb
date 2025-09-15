
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class dash_details_qry
    Inherits BaseWebForm

#Region "Methods"

    Private Sub NewSearch()

        ASPxDateEdit_From.Value = Nothing
        ASPxDateEdit_To.Value = Nothing
        ASPxComboBox_Gender.Value = Nothing
        ASPxComboBox_Source.Value = Nothing
        ASPxComboBox_Purpose.Value = Nothing
        ASPxComboBox_Donation.Value = Nothing
        ASPxComboBox_Country.Value = Nothing
        ASPxComboBox_Branch.Value = Nothing

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

            _StringBuilder.AppendFormat("({0} >= date({1}) AND {0} <= date({2})) ", "{dash_details_qry.reciept_date}", ASPxDateEdit_From.Date.ToString("yyyy,MM,dd"), ASPxDateEdit_To.Date.ToString("yyyy,MM,dd"))

        End If

        If Not ASPxComboBox_Gender.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{dash_details_qry.donor_gender}", ASPxComboBox_Gender.Value)

        End If

        If Not ASPxComboBox_Source.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{dash_details_qry.recpt_src}", ASPxComboBox_Source.Value)

        End If

        If Not ASPxComboBox_Branch.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{branch.branch_id}", ASPxComboBox_Branch.Value)

        End If

        If Not ASPxComboBox_Country.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{dash_details_qry.nat_code}", ASPxComboBox_Country.Value)

        End If

        If Not ASPxComboBox_Donation.Value Is Nothing Then

            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{dash_details_qry.donation_code}", ASPxComboBox_Donation.Value)

        End If

        '_StringBuilder.AppendFormat(" AND ({0} = {1})", "{dash_details_qry.void}", void.Value)
        '=======================================================================================

        '=======================================================================================
        'Processing
        '---------------------------------------------------------------------------------------
        Session(SessionKey.REPORT_DATASOURCE) = Nothing
        Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing
        Session(SessionKey.REPORT_PARAMETERS) = Nothing

        If ASPxComboBox_ReportType.Value = Constant.NEW_DONORS_PERIODICAL Then

            Dim dic As New Dictionary(Of String, Object)
            dic.Add(Constant.FROMDATE, ASPxDateEdit_From.Value)
            dic.Add(Constant.TODATE, ASPxDateEdit_To.Value)
            Session(SessionKey.REPORT_PARAMETERS) = dic

        Else

            Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = _StringBuilder.ToString()

        End If

        If ASPxComboBox_ReportType.Value = "dash_collect1" Or ASPxComboBox_ReportType.Value = "dash_collect2" _
        Or ASPxComboBox_ReportType.Value = "dash_collect3" Or ASPxComboBox_ReportType.Value = "dash_collect4" _
        Or ASPxComboBox_ReportType.Value = "dash_collect5" Or ASPxComboBox_ReportType.Value = "dash_collect6" _
        Or ASPxComboBox_ReportType.Value = "dash_collect7" Or ASPxComboBox_ReportType.Value = "dash_collect8" _
            Then
            Dim dic As New Dictionary(Of String, Object)
            dic.Add("FROMDATE", ASPxDateEdit_From.Value)
            dic.Add("TODATE", ASPxDateEdit_To.Value)
            Session(SessionKey.REPORT_PARAMETERS) = dic
        Else
            Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = _StringBuilder.ToString()
        End If

        Session(SessionKey.REPORT_DATASOURCE) = Nothing
        Session(SessionKey.REPORT_FILENAME) = String.Format(".\Reports\{0}.rpt", ASPxComboBox_ReportType.Value)
        Session(SessionKey.REPORT_BACK_PATH) = "dash_details_qry.aspx"
        Session(SessionKey.REPORT_FORMULA) = Nothing
        Response.Redirect("ReportViewer.aspx")
        '=======================================================================================

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            ASPxDateEdit_From.Value = DateTime.Now
            ASPxDateEdit_To.Value = DateTime.Now

        End If

    End Sub

    Protected Sub ASPxButton_New_Click(sender As Object, e As EventArgs) Handles ASPxButton_New.Click

        NewSearch()

    End Sub

    Protected Sub ASPxButton_Print_Click(sender As Object, e As EventArgs) Handles ASPxButton_Print.Click

        Print()

    End Sub

#End Region

End Class