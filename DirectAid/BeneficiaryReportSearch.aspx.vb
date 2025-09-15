
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class BeneficiaryReportSearch
    Inherits BaseWebForm

#Region "Methods"

    Private Sub TypeChange()

        Dim _BeneficiaryType As Byte = 0

        Byte.TryParse(Request.QueryString(QueryStringKey.APP_TYPE), _BeneficiaryType)

        Select Case _BeneficiaryType

            Case BeneficiaryTypeEnum.Daaiya

                ASPxLabel_orphanage_code.Visible = False
                orphanage_code.Visible = False

            Case Else

                stud_qualif_type.Visible = False
                ASPxLabel_stud_qualif_type.Visible = False

                school_reg_date_from.Visible = False
                ASPxLabel_school_reg_date_from.Visible = False

                school_reg_date_to.Visible = False
                ASPxLabel_school_reg_date_to.Visible = False

                section_opinion.Visible = False
                ASPxLabel_section_opinion.Visible = False

        End Select

    End Sub

    Private Sub NewSearch()

        status_date_From.Value = Nothing
        status_date_To.Value = Nothing
        applicant_gender.Value = Nothing
        donor.Value = Nothing
        ASPxComboBox_Country.Value = Nothing
        ASPxTextBox_OutboxNumber.Value = Nothing
        app_ser.Value = Nothing
        ASPxTextBox_AllocationFrom.Value = 1
        ASPxTextBox_AllocationTo.Value = 1

    End Sub

    Private Sub Print(e As DevExpress.Web.CallbackEventArgs)

        Try

        '=======================================================================================
            'Declaration
            '---------------------------------------------------------------------------------------
            Dim _StringBuilder As StringBuilder
            Dim _ConnectionString As String
            Dim _SqlConnection As SqlConnection
            Dim _SqlCommand As SqlCommand
            Dim _SqlDataAdapter As SqlDataAdapter
            Dim _DataTable As DataTable
            Dim dic As New Dictionary(Of String, Object)
            '=======================================================================================

            '=======================================================================================
            'Initialization
            '---------------------------------------------------------------------------------------
            _StringBuilder = New StringBuilder

            _ConnectionString = ConfigurationManager.ConnectionStrings("charitysoft").ConnectionString

            _SqlConnection = New SqlConnection(_ConnectionString)

            _DataTable = New DataTable
            '---------------------------------------------------------------------------------------
            If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                _StringBuilder.AppendFormat("SELECT *, row_number()over(order by app_ser) as rn FROM dbo.view_orphan_assign_letter WHERE ({0} = {1}) ", "app_type", Request.QueryString(QueryStringKey.APP_TYPE))

            Else

                _StringBuilder.AppendFormat("({0} = {1})", "{benf_master.app_type}", Request.QueryString(QueryStringKey.APP_TYPE))

            End If


            If Not application_status_stud_orp.Value Is Nothing Then


                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "application_status_stud_orp", application_status_stud_orp.Value)

                Else

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "{benf_master.application_status_stud_orp}", application_status_stud_orp.Value)

                End If

            End If

            If Not status_date_From.Value Is Nothing And Not status_date_To.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} BETWEEN '{1}  00:00:00' AND '{2} 23:23:59') ", "status_date", status_date_From.Date.ToString("yyyy.MM.dd"), status_date_To.Date.ToString("yyyy.MM.dd"))

                Else

                    _StringBuilder.AppendFormat(" AND ({0} >= date({1}) AND {0} <= date({2})) ", "{benf_master.status_date}", status_date_From.Date.ToString("yyyy,MM,dd"), status_date_To.Date.ToString("yyyy,MM,dd"))

                End If

            End If

            If Not school_reg_date_from.Value Is Nothing And Not school_reg_date_to.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} BETWEEN '{1}  00:00:00' AND '{2} 23:23:59') ", "school_reg_date", school_reg_date_from.Date.ToString("yyyy.MM.dd"), school_reg_date_to.Date.ToString("yyyy.MM.dd"))

                Else

                    _StringBuilder.AppendFormat(" AND ({0} >= date({1}) AND {0} <= date({2})) ", "{benf_master.school_reg_date}", school_reg_date_from.Date.ToString("yyyy,MM,dd"), school_reg_date_to.Date.ToString("yyyy,MM,dd"))

                End If

            End If

            If Not allocation_date_from.Value Is Nothing And Not allocation_date_to.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} BETWEEN '{1}  00:00:00' AND '{2} 23:23:59') ", "allocation_date", allocation_date_from.Date.ToString("yyyy.MM.dd"), allocation_date_to.Date.ToString("yyyy.MM.dd"))

                Else

                    _StringBuilder.AppendFormat(" AND ({0} >= date({1}) AND {0} <= date({2})) ", "{benf_master.allocation_date}", allocation_date_from.Date.ToString("yyyy,MM,dd"), allocation_date_to.Date.ToString("yyyy,MM,dd"))

                End If

            End If

            If Not DeAllocationDate_From.Value Is Nothing And Not DeAllocationDate_To.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} BETWEEN '{1}  00:00:00' AND '{2} 23:23:59') ", "DeAllocationDate", DeAllocationDate_From.Date.ToString("yyyy.MM.dd"), DeAllocationDate_To.Date.ToString("yyyy.MM.dd"))

                Else

                    _StringBuilder.AppendFormat(" AND ({0} >= date({1}) AND {0} <= date({2})) ", "{benf_master.DeAllocationDate}", DeAllocationDate_From.Date.ToString("yyyy,MM,dd"), DeAllocationDate_To.Date.ToString("yyyy,MM,dd"))

                End If

            End If

            If Not applicant_dob_from.Value Is Nothing And Not applicant_dob_to.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} BETWEEN '{1}  00:00:00' AND '{2} 23:23:59') ", "applicant_dob", applicant_dob_from.Date.ToString("yyyy.MM.dd"), applicant_dob_to.Date.ToString("yyyy.MM.dd"))

                Else

                    _StringBuilder.AppendFormat(" AND ({0} >= date({1}) AND {0} <= date({2})) ", "{benf_master.applicant_dob}", applicant_dob_from.Date.ToString("yyyy,MM,dd"), applicant_dob_to.Date.ToString("yyyy,MM,dd"))

                End If

            End If

            If Not overall_last_update_date_from.Value Is Nothing And Not overall_last_update_date_to.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} BETWEEN '{1}  00:00:00' AND '{2} 23:23:59') ", "overall_last_update_date", overall_last_update_date_from.Date.ToString("yyyy.MM.dd"), overall_last_update_date_to.Date.ToString("yyyy.MM.dd"))

                Else

                    _StringBuilder.AppendFormat(" AND ({0} >= date({1}) AND {0} <= date({2})) ", "{benf_master.overall_last_update_date}", overall_last_update_date_from.Date.ToString("yyyy,MM,dd"), overall_last_update_date_to.Date.ToString("yyyy,MM,dd"))

                End If

            End If

            If Not applicant_gender.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "applicant_gender", applicant_gender.Value)

                Else

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "{benf_master.applicant_gender}", applicant_gender.Value)

                End If

            End If

            If Not stud_qualif_type.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "stud_qualif_type", stud_qualif_type.Value)

                Else

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "{benf_master.stud_qualif_type}", stud_qualif_type.Value)

                End If

            End If

            If Not donor.Value Is Nothing Then

                If donor.Value = 1 Then

                    If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                        _StringBuilder.Append(" AND (donor_id IS NOT NULL)")

                    Else

                        _StringBuilder.Append(" AND (ISNULL({benf_master.donor_id}) = false)")

                    End If

                End If

                If donor.Value = 2 Then

                    If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                        _StringBuilder.Append(" AND (donor_id IS NULL)")

                    Else

                        _StringBuilder.Append(" AND (ISNULL({benf_master.donor_id}) = true)")

                    End If

                End If

            End If

            If Not applicant_nat.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "applicant_nat", applicant_nat.Value)

                Else

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "{benf_master.applicant_nat}", applicant_nat.Value)

                End If

            End If

            If Not ASPxComboBox_Country.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "app_country", ASPxComboBox_Country.Value)

                Else

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "{benf_master.app_country}", ASPxComboBox_Country.Value)

                End If

            End If

            If Not center_tab.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "center_code", center_tab.Value)

                Else

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "{benf_master.center_code}", center_tab.Value)

                End If

            End If

            If Not app_ser.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "app_ser", app_ser.Value)

                Else

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "{benf_master.app_ser}", app_ser.Value)

                End If

            End If

            If Not donor_id.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "donor_id", donor_id.Value)

                Else

                    _StringBuilder.AppendFormat(" AND ({0} = {1})", "{benf_master.donor_id}", donor_id.Value)

                End If

            End If

            If Not donor_namear.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} like '%{1}%')", "donor_namear", StringEngine.ProcessArabicString(donor_namear.Value))

                Else

                    _StringBuilder.AppendFormat(" AND ({0} like '*{1}*')", "{donor_data.donor_namear}", StringEngine.ProcessArabicString(donor_namear.Value))

                End If

            End If

            If Not section_opinion.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    _StringBuilder.AppendFormat(" AND ({0} = '{1}')", "section_opinion", section_opinion.Value)

                Else

                    _StringBuilder.AppendFormat(" AND ({0} = '{1}')", "{benf_master.section_opinion}", section_opinion.Value)

                End If

            End If

            If Not orphanage_code.Value Is Nothing Then

                If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                    Select Case orphanage_code.Value

                        Case 1 'Internal

                            _StringBuilder.AppendFormat(" AND ({0} = {1})", "ISNULL(orphanage_code, 0)", Convert.ToInt32(OrphanageCodeEnum.CommitteeCenter))

                        Case 2 'External

                            _StringBuilder.AppendFormat(" AND ({0} IN ({1}, {2}))", "ISNULL(orphanage_code, 0)", Convert.ToInt32(OrphanageCodeEnum.OrphanHome), Convert.ToInt32(OrphanageCodeEnum.IntermediateSide))

                        Case 3 'Else

                            _StringBuilder.AppendFormat(" AND ({0} = {1})", "ISNULL(orphanage_code, 0)", 0)

                    End Select

                Else

                    Select Case orphanage_code.Value

                        Case 1 'Internal

                            _StringBuilder.AppendFormat(" AND ({0} = {1})", "{benf_master.orphanage_code}", Convert.ToInt32(OrphanageCodeEnum.CommitteeCenter))

                        Case 2 'External

                            _StringBuilder.AppendFormat(" AND ({0} in {1} to {2})", "{benf_master.orphanage_code}", Convert.ToInt32(OrphanageCodeEnum.OrphanHome), Convert.ToInt32(OrphanageCodeEnum.IntermediateSide))

                        Case 3 'Else

                            _StringBuilder.Append(" AND (ISNULL({benf_master.orphanage_code}) = true)")

                    End Select

                End If

            End If

            If ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_ORPHAN Or ASPxComboBox_ReportType.Value = Constant.ALLOCATE_LETTER_DAAYA Then

                Dim sqlQuery As String = String.Format("SELECT * FROM ({0}) AS T WHERE (rn between {1} and {2}) ", _StringBuilder.ToString(), ASPxTextBox_AllocationFrom.Value, ASPxTextBox_AllocationTo.Value)
                _SqlCommand = New SqlCommand(sqlQuery, _SqlConnection)

                _SqlDataAdapter = New SqlDataAdapter(_SqlCommand)

                _SqlDataAdapter.Fill(_DataTable)

                If (Not _DataTable Is Nothing) Then

                    If (_DataTable.Rows.Count > 0) Then

                        For a = 0 To _DataTable.Rows.Count - 1

                            Dim obj As Object = _DataTable.Rows(a)("personal_photo_path")

                            If Not obj Is Nothing Then

                                Dim physicalFileName As String = Server.MapPath(obj.ToString())

                                If System.IO.File.Exists(physicalFileName) Then

                                    Dim img = System.Drawing.Image.FromFile(physicalFileName)

                                    Dim ms = New System.IO.MemoryStream()
                                    img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)

                                    img.Dispose()

                                    Dim bytes = ms.ToArray()

                                    ms.Close()

                                    _DataTable.Rows(a)("photo") = bytes

                                    bytes = Nothing

                                End If

                            End If

                        Next

                    End If

                End If

                Session(SessionKey.REPORT_DATASOURCE) = _DataTable
                Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing

                _DataTable.Dispose()

                GC.Collect()

            Else

                Session(SessionKey.REPORT_DATASOURCE) = Nothing
                Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = _StringBuilder.ToString()

            End If

            dic.Add(Constant.OUTBOXNUMBER, IIf(ASPxTextBox_OutboxNumber.Value Is Nothing, "", ASPxTextBox_OutboxNumber.Value))
            '=======================================================================================

            '=======================================================================================
            'Processing
            '---------------------------------------------------------------------------------------
            Session(SessionKey.REPORT_FILENAME) = String.Format(".\Reports\{0}.rpt", ASPxComboBox_ReportType.Value)
            Session(SessionKey.REPORT_PARAMETERS) = dic
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