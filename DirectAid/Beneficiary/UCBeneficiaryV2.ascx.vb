
#Region "Imports Directives"

Imports DevExpress.Web.ASPxEditors
Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class UCBeneficiaryV2
    Inherits System.Web.UI.UserControl

#Region "Methods"

    Private Sub NewMethod()

        Response.Redirect(String.Format("Beneficiary.aspx?app_type={0}", app_type.Value))

    End Sub

    Private Sub Saving(e As DevExpress.Web.CallbackEventArgs)

        Try

            e.Result = app_ser.Value

            Dim isNew As Boolean = (app_ser.Value Is Nothing)
            Dim hasDetails As Boolean = False

            Dim age As Int32 = DateDiff(DateInterval.Year, applicant_dob.Date, DateTime.Now)

            If age > 10 And isNew And (Not applicant_dob.Value Is Nothing) And app_type.Value = BeneficiaryTypeEnum.Orphan Then
                e.Result = "لايمكن الحفظ عمر اليتيم اكبر من 10 سنوات"
                Exit Sub
            End If

            Using db As New Database

                Dim benfMaster As New benf_master
                Dim benfMasterDetail As New benf_mast_det1

                If Not isNew Then

                    benfMaster = (From o In db.benf_master Where o.app_ser = e.Result Select o).FirstOrDefault
                    benfMasterDetail = (From o In db.benf_mast_det1 Where o.app_ser = e.Result Select o).FirstOrDefault

                End If

                If benfMasterDetail Is Nothing Then

                    benfMasterDetail = New benf_mast_det1

                Else

                    hasDetails = True

                End If

                benfMaster.app_type = app_type.Value

                benfMaster.app_date = app_date.Value

                benfMaster.applicant_name_ar_1 = StringEngine.ProcessArabicString(applicant_name_ar_1.Value)

                'benfMaster.applicant_name_ar_1 = applicant_name_ar_1.Value

                benfMaster.applicant_name_en_1 = applicant_name_en_1.Value

                benfMaster.applicant_gender = applicant_gender.Value
                benfMaster.applicant_dob = applicant_dob.Value
                benfMaster.applicant_nat = applicant_nat.Value

                benfMaster.city_dob = city_dob.Value
                benfMaster.benf_religion = benf_religion.Value
                benfMaster.village_dob = village_dob.Value
                benfMaster.applicant_clan = applicant_clan.Value
                benfMaster.app_country = app_country.Value
                benfMaster.benf_type_orp_stud = benf_type_orp_stud.Value
                benfMaster.center_code = center_code.Value
                benfMaster.orphanage_code = orphanage_code.Value

                If isNew Then

                    benfMaster.application_status_stud_orp = BeneficiaryRequestStatusEnum.Waiting
                    benfMaster.status_date = DateTime.Now

                End If

                'benfMaster.application_status_stud_orp = application_status_stud_orp.Value
                'benfMaster.status_date = DateTime.Now
                benfMaster.status_reason = status_reason.Value
                benfMaster.status_by = status_by.Value
                benfMaster.general_notes = general_notes.Value

                benfMaster.benf_int_ext = benf_int_ext.Value

                benfMaster.nominated_by = nominated_by.Value
                benfMaster.nomination_entity_ar = nomination_entity_ar.Value
                benfMaster.nomination_entity_en = nomination_entity_en.Value
                benfMaster.entity_address = entity_address.Value

                benfMaster.bank_code = bank_code.Value
                benfMaster.branch_of_the_bank = branch_of_the_bank.Value
                benfMaster.account_num = account_num.Value
                benfMaster.dayaa_sal = Convert.ToDecimal(dayaa_sal.Value)
                benfMaster.sal_curr = sal_curr.Value
                benfMaster.school_reg_date = school_reg_date.Value
                benfMaster.section_opinion = section_opinion.Value
                benfMaster.stud_qualif_type = stud_qualif_type.Value

                benfMaster.marital_status_stud_daw = marital_status_stud_daw.Value

                If isNew Then

                    db.AddTobenf_master(benfMaster)

                End If

                db.SaveChanges()

                benfMasterDetail.app_ser = benfMaster.app_ser
                benfMasterDetail.mother_name_ar_orp_stud_1 = mother_name_ar_orp_stud_1.Value
                benfMasterDetail.mother_job_code = mother_job_code.Value
                benfMasterDetail.mother_salary = Convert.ToDecimal(mother_salary.Value)
                benfMasterDetail.mother_salary_curr = mother_salary_curr.Value
                benfMasterDetail.mother_religion = mother_religion.Value

                benfMasterDetail.parents_status_stud_orp = parents_status_stud_orp.Value
                benfMasterDetail.living_with_opr_stud = living_with_opr_stud.Value
                benfMasterDetail.living_with_rel_type = living_with_rel_type.Value
                benfMasterDetail.name_of_living_with = name_of_living_with.Value
                benfMasterDetail.job_of_living_with = job_of_living_with.Value
                benfMasterDetail.living_with_religion = living_with_religion.Value
                benfMasterDetail.living_with_address = living_with_address.Value
                benfMasterDetail.father_dod = father_dod.Value
                benfMasterDetail.orp_brothers_count = Convert.ToByte(orp_brothers_count.Value)
                benfMasterDetail.orp_brothers_guaranteed = Convert.ToByte(orp_brothers_guaranteed.Value)

                If isNew Or Not hasDetails Then

                    db.AddTobenf_mast_det1(benfMasterDetail)

                End If

                db.SaveChanges()

                e.Result = benfMaster.app_ser

                Session("orphans_app_name") = benfMaster.applicant_name_ar_1

                Session("orphans_app_ser") = e.Result

            End Using

        Catch ex As Exception

            e.Result = FaultEngine.HandleException(ex).Message

        End Try

    End Sub

    Private Sub Accept(e As DevExpress.Web.CallbackEventArgs)

        Try

            e.Result = app_ser.Value

            Using db As New Database

                db.SP_UPDATE_benf_master_Accept(Convert.ToInt32(app_ser.Value))

            End Using

        Catch ex As Exception

            e.Result = FaultEngine.HandleException(ex).Message

        End Try

    End Sub

    Private Sub Reject(e As DevExpress.Web.CallbackEventArgs)

        Try

            e.Result = app_ser.Value

            Using db As New Database

                db.SP_UPDATE_benf_master_Reject(Convert.ToInt32(app_ser.Value), reasons.Value, notes.Value)

            End Using

        Catch ex As Exception

            e.Result = FaultEngine.HandleException(ex).Message

        End Try

    End Sub

    Private Sub Cancel(e As DevExpress.Web.CallbackEventArgs)

        Try

            e.Result = app_ser.Value

            Using db As New Database

                db.SP_UPDATE_benf_master_Cancel(Convert.ToInt32(app_ser.Value), reasons.Value, notes.Value)

            End Using

        Catch ex As Exception

            e.Result = FaultEngine.HandleException(ex).Message

        End Try

    End Sub

    Private Sub UnAssign(e As DevExpress.Web.CallbackEventArgs)

        Try

            e.Result = app_ser.Value

            Using db As New Database

                db.SP_UPDATE_benf_master_UnAssign(Convert.ToInt32(app_ser.Value), reasons.Value, notes.Value)

            End Using

        Catch ex As Exception

            e.Result = FaultEngine.HandleException(ex).Message

        End Try

    End Sub

    Private Sub Print(e As DevExpress.Web.CallbackEventArgs)

        Try

            '=======================================================================================
            'Validation
            '---------------------------------------------------------------------------------------
            If app_ser.Value Is Nothing Then
                e.Result = "من فضلك قم بحفظ او استدعاء البيانات"
                Exit Sub
            End If
            '=======================================================================================

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

            _ConnectionString = New ConnectionStringEx().TheConnectionString

            _SqlConnection = New SqlConnection(_ConnectionString)

            _DataTable = New DataTable

            dic.Add(Constant.YEAR, ASPxButton_Print.Value)
            '---------------------------------------------------------------------------------------
            Using db As New Database

                Dim _benf_report_print_log As New benf_report_print_log
                _benf_report_print_log.app_ser = app_ser.Value
                _benf_report_print_log.print_date = DateTime.Now
                _benf_report_print_log.print_by = Session(SessionKey.USERNAME)
                _benf_report_print_log.report_id = 1
                db.benf_report_print_log.AddObject(_benf_report_print_log)
                db.SaveChanges()

            End Using

            Select Case app_type.Value

                Case BeneficiaryTypeEnum.Orphan

                    _StringBuilder.AppendFormat("SELECT * FROM dbo.view_report_orphan WHERE (app_ser = {0}) ", app_ser.Value)

                    _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)

                    _SqlDataAdapter = New SqlDataAdapter(_SqlCommand)

                    _SqlDataAdapter.Fill(_DataTable)

                    If (Not _DataTable Is Nothing) Then

                        If (_DataTable.Rows.Count > 0) Then

                            Dim obj As Object = _DataTable.Rows(0)("personal_photo_path")

                            If Not obj Is Nothing Then

                                Dim physicalFileName As String = Server.MapPath(obj.ToString())

                                If System.IO.File.Exists(physicalFileName) Then

                                    Dim img = System.Drawing.Image.FromFile(physicalFileName)
                                    Dim ms = New System.IO.MemoryStream()
                                    img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)
                                    Dim bytes = ms.ToArray()
                                    ms.Close()
                                    _DataTable.Rows(0)("photo") = bytes

                                End If

                            End If

                        End If

                    End If

                    Session(SessionKey.REPORT_PARAMETERS) = dic
                    Session(SessionKey.REPORT_DATASOURCE) = _DataTable
                    Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing

                Case BeneficiaryTypeEnum.Daaiya

                    ' Ayman
                    '------------------------'
                    _StringBuilder.AppendFormat(" SELECT * FROM dbo.view_Daaya_yearly_report AS mm WHERE (ID IN ")
                    _StringBuilder.AppendFormat(" (SELECT     MAX(ID ) AS Expr1 ")
                    _StringBuilder.AppendFormat(" FROM          dbo.view_Daaya_yearly_report AS mt")
                    _StringBuilder.AppendFormat(" WHERE (app_ser = mm.app_ser) AND (app_ser = {0})))  ", app_ser.Value)
                    _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)
                    _SqlDataAdapter = New SqlDataAdapter(_SqlCommand)
                    _SqlDataAdapter.Fill(_DataTable)

                    Session(SessionKey.REPORT_PARAMETERS) = dic
                    Session(SessionKey.REPORT_DATASOURCE) = _DataTable
                    Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing

                    '------------------------'

                    'Session(SessionKey.REPORT_PARAMETERS) = Nothing
                    'Session(SessionKey.REPORT_DATASOURCE) = Nothing
                    'Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = String.Format("{0} = {1}", "{view_Daaya_yearly_report.app_ser}", app_ser.Value)

                    ' Ayman
                    '------------------------'
                Case BeneficiaryTypeEnum.Student

                    _StringBuilder.AppendFormat("SELECT * FROM dbo.VIW_StudentYearlyReport WHERE (app_ser = {0}) ", app_ser.Value)

                    _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)

                    _SqlDataAdapter = New SqlDataAdapter(_SqlCommand)

                    _SqlDataAdapter.Fill(_DataTable)

                    If (Not _DataTable Is Nothing) Then

                        If (_DataTable.Rows.Count > 0) Then

                            Dim obj As Object = _DataTable.Rows(0)("personal_photo_path")

                            If Not obj Is Nothing Then

                                Dim physicalFileName As String = Server.MapPath(obj.ToString())

                                If System.IO.File.Exists(physicalFileName) Then

                                    Dim img = System.Drawing.Image.FromFile(physicalFileName)
                                    Dim ms = New System.IO.MemoryStream()
                                    img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)
                                    Dim bytes = ms.ToArray()
                                    ms.Close()
                                    _DataTable.Rows(0)("photo") = bytes

                                End If

                            End If

                        End If

                    End If

                    Session(SessionKey.REPORT_PARAMETERS) = dic
                    Session(SessionKey.REPORT_DATASOURCE) = _DataTable
                    Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing
                    '------------------------'
            End Select
            '=======================================================================================

            '=======================================================================================
            'Processing
            '---------------------------------------------------------------------------------------
            Session(SessionKey.REPORT_FORMULA) = Nothing

            Select Case app_type.Value

                Case BeneficiaryTypeEnum.Orphan

                    Session(SessionKey.REPORT_FILENAME) = ".\Reports\orphan_yearly_report.rpt"

                Case BeneficiaryTypeEnum.Daaiya

                    Session(SessionKey.REPORT_FILENAME) = ".\Reports\Daaya_yearly_report.rpt"

                    ' Ayman
                    '------------------------'
                Case BeneficiaryTypeEnum.Student

                    Session(SessionKey.REPORT_FILENAME) = ".\Reports\student_yearly_report.rpt"
                    '------------------------'
            End Select

            Session(SessionKey.REPORT_BACK_PATH) = "Default.aspx"
            e.Result = "OK"
            '=======================================================================================

        Catch ex As Exception

            e.Result = FaultEngine.HandleException(ex).Message

        End Try

    End Sub

    Private Sub Loading()

        Using db As New Database

            Dim benfMaster As New benf_master
            Dim benfMasterDetail As New benf_mast_det1

            Dim appSerial As Int32 = app_ser.Value

            benfMaster = (From o In db.benf_master Where o.app_ser = appSerial Select o).FirstOrDefault
            benfMasterDetail = (From o In db.benf_mast_det1 Where o.app_ser = appSerial Select o).FirstOrDefault

            If Not benfMaster Is Nothing Then

                ASPxButton_FindByKey.Value = appSerial

                Session("orphans_app_ser") = appSerial

                Session("orphans_app_name") = benfMaster.applicant_name_ar_1

                app_type.Value = benfMaster.app_type

                app_date.Value = benfMaster.app_date

                applicant_name_ar_1.Value = benfMaster.applicant_name_ar_1

                applicant_name_en_1.Value = benfMaster.applicant_name_en_1

                applicant_gender.Value = benfMaster.applicant_gender
                applicant_dob.Value = benfMaster.applicant_dob
                applicant_nat.Value = benfMaster.applicant_nat

                ASPxComboBox_Country.Value = (From o In db.cities Where o.city_id = benfMaster.city_dob Select o.nat_city).FirstOrDefault
                city_dob.Value = benfMaster.city_dob
                benf_religion.Value = benfMaster.benf_religion
                village_dob.Value = benfMaster.village_dob
                applicant_clan.Value = benfMaster.applicant_clan
                app_country.Value = benfMaster.app_country
                benf_type_orp_stud.Value = benfMaster.benf_type_orp_stud
                center_code.Value = benfMaster.center_code
                orphanage_code.Value = benfMaster.orphanage_code
                allocation_date.Value = benfMaster.allocation_date
                donor_id.Value = benfMaster.donor_id
                donor_NAME.Value = (From o In db.view_donor_list Where o.donor_id = benfMaster.donor_id Select o.donor_namear).FirstOrDefault

                application_status_stud_orp.Value = benfMaster.application_status_stud_orp
                status_date.Value = benfMaster.status_date

                'ASPxButton_Accept.Visible = (benfMaster.application_status_stud_orp <> BeneficiaryRequestStatusEnum.Accepted)
                'ASPxButton_Reject.Visible = (benfMaster.application_status_stud_orp <> BeneficiaryRequestStatusEnum.Rejected)

                status_reason.Value = benfMaster.status_reason
                status_by.Value = benfMaster.status_by
                general_notes.Value = benfMaster.general_notes

                benf_int_ext.Value = benfMaster.benf_int_ext
                legacy_num.Value = benfMaster.legacy_num

                nominated_by.Value = benfMaster.nominated_by
                nomination_entity_ar.Value = benfMaster.nomination_entity_ar
                nomination_entity_en.Value = benfMaster.nomination_entity_en
                entity_address.Value = benfMaster.entity_address

                bank_code.Value = benfMaster.bank_code
                branch_of_the_bank.Value = benfMaster.branch_of_the_bank
                account_num.Value = benfMaster.account_num
                dayaa_sal.Value = benfMaster.dayaa_sal
                sal_curr.Value = benfMaster.sal_curr
                school_reg_date.Value = benfMaster.school_reg_date
                section_opinion.Value = benfMaster.section_opinion
                stud_qualif_type.Value = benfMaster.stud_qualif_type

                marital_status_stud_daw.Value = benfMaster.marital_status_stud_daw

                If benfMaster.IsPreviousOrphan Is Nothing OrElse IsDBNull(benfMaster.IsPreviousOrphan) Then
                    chxIsPreviousOrphan.Checked = False
                Else
                    chxIsPreviousOrphan.Checked = benfMaster.IsPreviousOrphan

                End If

            End If

            If Not benfMasterDetail Is Nothing Then

                mother_name_ar_orp_stud_1.Value = benfMasterDetail.mother_name_ar_orp_stud_1
                mother_job_code.Value = benfMasterDetail.mother_job_code
                mother_salary.Value = benfMasterDetail.mother_salary
                mother_salary_curr.Value = benfMasterDetail.mother_salary_curr
                mother_religion.Value = benfMasterDetail.mother_religion

                parents_status_stud_orp.Value = benfMasterDetail.parents_status_stud_orp
                living_with_opr_stud.Value = benfMasterDetail.living_with_opr_stud
                living_with_rel_type.Value = benfMasterDetail.living_with_rel_type
                name_of_living_with.Value = benfMasterDetail.name_of_living_with
                job_of_living_with.Value = benfMasterDetail.job_of_living_with
                living_with_religion.Value = benfMasterDetail.living_with_religion
                living_with_address.Value = benfMasterDetail.living_with_address
                father_dod.Value = benfMasterDetail.father_dod
                orp_brothers_count.Value = benfMasterDetail.orp_brothers_count
                orp_brothers_guaranteed.Value = benfMasterDetail.orp_brothers_guaranteed

                insert_userid.Value = benfMaster.insert_userid
                insert_date.Value = benfMaster.insert_date
                last_update_userid.Value = benfMaster.overall_last_update_userid
                last_update_date.Value = benfMaster.overall_last_update_date

            End If

        End Using

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SqlDataSource_bank_code.ConnectionString = New ConnectionStringEx().TheConnectionString
        EntityDataSource_nat_tab.ConnectionString = New EntityConnectionEx().TheConnectionString
        EntityDataSource_religion_tab.ConnectionString = New EntityConnectionEx().TheConnectionString
        EntityDataSource_center_tab.ConnectionString = New EntityConnectionEx().TheConnectionString
        EntityDataSource_orphans_residence_place.ConnectionString = New EntityConnectionEx().TheConnectionString
        EntityDataSource_jobs_tab.ConnectionString = New EntityConnectionEx().TheConnectionString
        EntityDataSource_reason_tab.ConnectionString = New EntityConnectionEx().TheConnectionString
        EntityDataSource_organization_tab.ConnectionString = New EntityConnectionEx().TheConnectionString
        EntityDataSource_currency_tab.ConnectionString = New EntityConnectionEx().TheConnectionString

        'ASPxButton_Accept.Visible = False
        'ASPxButton_Reject.Visible = False

        If Not IsPostBack And Not Page.IsCallback Then

            app_date.Value = DateTime.Now
            app_ser.Value = Request.QueryString(QueryStringKey.APP_SER)
            app_type.Value = Request.QueryString(QueryStringKey.APP_TYPE)

            If Not app_type.Value Is Nothing Then

                app_type.Value = Convert.ToByte(app_type.Value)

            End If

            Loading()

            ASPxButton_Print.Value = DateTime.Now.Year

        End If

        'UCQuranKnown1.app_ser = app_ser.Value
        'UCApplicationAttach1.app_ser = app_ser.Value

    End Sub

    Protected Sub ASPxButton_New_Click(sender As Object, e As EventArgs) Handles ASPxButton_New.Click

        NewMethod()

    End Sub

    Protected Sub ASPxCallback_Save_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Save.Callback

        Saving(e)

    End Sub

    Protected Sub ASPxCallback_Print_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Print.Callback

        Print(e)

    End Sub

    Protected Sub ASPxCallback_Accept_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Accept.Callback
        Accept(e)
    End Sub

    Protected Sub ASPxCallback_Reject_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Reject.Callback
        Reject(e)
    End Sub

    Protected Sub ASPxCallback_Cancel_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Cancel.Callback
        Cancel(e)
    End Sub

    Protected Sub ASPxCallback_UnAssign_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_UnAssign.Callback
        UnAssign(e)
    End Sub

    Protected Sub EntityDataSource_reasons_Selecting(sender As Object, e As EntityDataSourceSelectingEventArgs) Handles EntityDataSource_reasons.Selecting

        Select Case app_type.Value

            Case BeneficiaryTypeEnum.Orphan

                e.DataSource.WhereParameters("reason_cat").DefaultValue = Convert.ToByte(ReasonCategoryEnum.Orphan)

            Case BeneficiaryTypeEnum.Daaiya

                e.DataSource.WhereParameters("reason_cat").DefaultValue = Convert.ToByte(ReasonCategoryEnum.Daaiya)

                '    ' Ayman
                '    '------------------------'
                'Case BeneficiaryTypeEnum.Student

                '    e.DataSource.WhereParameters("reason_cat").DefaultValue = Convert.ToByte(ReasonCategoryEnum.Daaiya)
                '    '------------------------'
        End Select

    End Sub

#End Region

End Class