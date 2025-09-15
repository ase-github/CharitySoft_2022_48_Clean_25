
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class BeneficiaryScholarshipReportSearch
    Inherits BaseWebForm

#Region "Methods"

    Private Sub TypeChange()

        Dim _BeneficiaryType As Byte = 0

        Byte.TryParse(Request.QueryString(QueryStringKey.APP_TYPE), _BeneficiaryType)

        Select Case _BeneficiaryType

            Case BeneficiaryTypeEnum.Daaiya

            Case Else

        End Select

    End Sub

    Private Sub NewSearch()

        nat_code.Value = Nothing

        StudyingAt.Value = Nothing

        study_level.Value = Nothing

        study_category.Value = Nothing

        faculty.Value = Nothing

        study_prof.Value = Nothing

        scholarship_amountFrom.Value = Nothing
        scholarship_amountTo.Value = Nothing

        scholarship_status1.Value = Nothing

        RegisterDate_From.Value = Nothing
        RegisterDate_To.Value = Nothing

        nominated_site_join_date_from.Value = Nothing
        nominated_site_join_date_to.Value = Nothing

        scholarship_end_date_From.Value = Nothing
        scholarship_end_date_To.Value = Nothing

        scholarship_start_date_from.Value = Nothing
        scholarship_start_date_to.Value = Nothing

    End Sub

    Private Sub Print(e As DevExpress.Web.CallbackEventArgs)

        Try

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

            _StringBuilder.Append("not isnull({VIEW_REPORT_Beneficiary_Scolarship.app_ser}) ")

            If Not nat_code.Value Is Nothing Then

                _StringBuilder.AppendFormat(" AND ({0} = {1})", "{VIEW_REPORT_Beneficiary_Scolarship.nat_code}", nat_code.Value)

            End If

            If Not StudyingAt.Value Is Nothing Then

                _StringBuilder.AppendFormat(" AND ({0} like '*{1}*')", "{VIEW_REPORT_Beneficiary_Scolarship.StudyingAt}", StringEngine.ProcessArabicString(StudyingAt.Value))

            End If

            If Not study_level.Value Is Nothing Then

                _StringBuilder.AppendFormat(" AND ({0} = {1})", "{VIEW_REPORT_Beneficiary_Scolarship.study_level}", study_level.Value)

            End If

            If Not study_category.Value Is Nothing Then

                _StringBuilder.AppendFormat(" AND ({0} = {1})", "{VIEW_REPORT_Beneficiary_Scolarship.study_category}", study_category.Value)

            End If

            If Not faculty.Value Is Nothing Then

                _StringBuilder.AppendFormat(" AND ({0} = {1})", "{VIEW_REPORT_Beneficiary_Scolarship.faculty}", faculty.Value)

            End If

            If Not study_prof.Value Is Nothing Then

                _StringBuilder.AppendFormat(" AND ({0} = {1})", "{VIEW_REPORT_Beneficiary_Scolarship.study_prof}", study_prof.Value)

            End If

            If Not scholarship_amountFrom.Value Is Nothing And Not scholarship_amountTo.Value Is Nothing Then

                If scholarship_amountTo.Value > 0 Then

                    _StringBuilder.AppendFormat(" AND ({0} >= {1} AND {0} <= {2}) ", "{VIEW_REPORT_Beneficiary_Scolarship.scholarship_amount}", scholarship_amountFrom.Value, scholarship_amountTo.Value)

                End If

            End If

            If Not scholarship_status1.Value Is Nothing Then

                _StringBuilder.AppendFormat(" AND ({0} = {1})", "{VIEW_REPORT_Beneficiary_Scolarship.scholarship_status1}", scholarship_status1.Value)

            End If

            If Not RegisterDate_From.Value Is Nothing And Not RegisterDate_To.Value Is Nothing Then


                _StringBuilder.AppendFormat(" AND ({0} >= date({1}) AND {0} <= date({2})) ", "{VIEW_REPORT_Beneficiary_Scolarship.RegisterDate}", RegisterDate_From.Date.ToString("yyyy,MM,dd"), RegisterDate_To.Date.ToString("yyyy,MM,dd"))

            End If

            If Not scholarship_start_date_from.Value Is Nothing And Not scholarship_start_date_to.Value Is Nothing Then

                _StringBuilder.AppendFormat(" AND ({0} >= date({1}) AND {0} <= date({2})) ", "{VIEW_REPORT_Beneficiary_Scolarship.scholarship_start_date}", scholarship_start_date_from.Date.ToString("yyyy,MM,dd"), scholarship_start_date_to.Date.ToString("yyyy,MM,dd"))

            End If

            If Not scholarship_end_date_From.Value Is Nothing And Not scholarship_end_date_To.Value Is Nothing Then

                _StringBuilder.AppendFormat(" AND ({0} >= date({1}) AND {0} <= date({2})) ", "{VIEW_REPORT_Beneficiary_Scolarship.scholarship_end_date}", scholarship_end_date_From.Date.ToString("yyyy,MM,dd"), scholarship_end_date_To.Date.ToString("yyyy,MM,dd"))

            End If

            If Not nominated_site_join_date_from.Value Is Nothing And Not nominated_site_join_date_to.Value Is Nothing Then

                _StringBuilder.AppendFormat(" AND ({0} >= date({1}) AND {0} <= date({2})) ", "{VIEW_REPORT_Beneficiary_Scolarship.nominated_site_join_date}", nominated_site_join_date_from.Date.ToString("yyyy,MM,dd"), nominated_site_join_date_to.Date.ToString("yyyy,MM,dd"))

            End If

            Session(SessionKey.REPORT_DATASOURCE) = Nothing
            Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = _StringBuilder.ToString()
            '=======================================================================================

            '=======================================================================================
            'Processing
            '---------------------------------------------------------------------------------------
            Session(SessionKey.REPORT_FILENAME) = String.Format(".\Reports\{0}.rpt", ASPxComboBox_ReportType.Value)
            Session(SessionKey.REPORT_SORT_TABLE) = "benf_master"
            Session(SessionKey.REPORT_SORT_FIELD) = ASPxComboBox_SortOrder.Value
            Session(SessionKey.REPORT_FORMULA) = Nothing
            e.Result = "OK"
            '=======================================================================================

        Catch ex As Exception

            e.Result = ex.Message

        End Try

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        TypeChange()

    End Sub

    Protected Sub ASPxButton_New_Click(sender As Object, e As EventArgs) Handles ASPxButton_New.Click

        NewSearch()

    End Sub

    Protected Sub ASPxCallback_Print_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Print.Callback

        Print(e)

    End Sub

#End Region

End Class