
#Region "Imports Directives"

Imports DevExpress.Web.ASPxEditors
Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports DevExpress.Data.Filtering

#End Region

Public Class UCBeneficiaryListV1
    Inherits System.Web.UI.UserControl

#Region "Methods"

    Private Sub Print(e As DevExpress.Web.CallbackEventArgs)

        Try

            '=======================================================================================
            'Validation
            '---------------------------------------------------------------------------------------
            If ASPxGridView1.Selection.Count = 0 Then
                e.Result = "من فضلك قم باختيار البيانات"
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
            Dim selectionList As List(Of Object)
            Dim inString As String
            Dim dic As New Dictionary(Of String, Object)
            '=======================================================================================

            '=======================================================================================
            'Initialization
            '---------------------------------------------------------------------------------------
            _StringBuilder = New StringBuilder

            _ConnectionString = New ConnectionStringEx().TheConnectionString

            _SqlConnection = New SqlConnection(_ConnectionString)

            _DataTable = New DataTable

            selectionList = ASPxGridView1.GetSelectedFieldValues("app_ser")

            inString = ""

            dic.Add(Constant.YEAR, ASPxButton_Print.Value)
            '---------------------------------------------------------------------------------------
            Using db As New charitysoftEntities

                For a = 0 To selectionList.Count - 1

                    Dim _benf_report_print_log As New benf_report_print_log
                    _benf_report_print_log.app_ser = selectionList(a)
                    _benf_report_print_log.print_date = DateTime.Now
                    _benf_report_print_log.print_by = Session(SessionKey.USERNAME)
                    _benf_report_print_log.report_id = Convert.ToByte(e.Parameter)
                    db.benf_report_print_log.AddObject(_benf_report_print_log)

                    If a = 0 Then

                        inString = selectionList(a).ToString()

                    Else

                        inString = inString & "," & selectionList(a).ToString()

                    End If

                Next

                db.SaveChanges()

            End Using

            Select Case Convert.ToByte(e.Parameter)
                Case 11
                    _StringBuilder.AppendFormat("SELECT * FROM dbo.view_report_orphan WHERE (app_ser IN ({0})) ", inString)
                    Session(SessionKey.REPORT_FILENAME) = ".\Reports\orphan_yearly_report.rpt"
                Case 12
                    _StringBuilder.AppendFormat("SELECT * FROM dbo.view_orphan_assign_letter WHERE (app_ser IN ({0})) ", inString)
                    Session(SessionKey.REPORT_FILENAME) = ".\Reports\allocate_letter.rpt"
                Case Else

            End Select


            _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)

            _SqlDataAdapter = New SqlDataAdapter(_SqlCommand)

            _SqlDataAdapter.Fill(_DataTable)

            If (Not _DataTable Is Nothing) Then

                If (_DataTable.Rows.Count > 0) Then

                    For a = 0 To selectionList.Count - 1

                        Dim obj As Object = _DataTable.Rows(a)("personal_photo_path")

                        If Not obj Is Nothing Then

                            Dim physicalFileName As String = Server.MapPath(obj.ToString())

                            If System.IO.File.Exists(physicalFileName) Then

                                Dim img = System.Drawing.Image.FromFile(physicalFileName)
                                Dim ms = New System.IO.MemoryStream()
                                img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg)
                                Dim bytes = ms.ToArray()
                                ms.Close()
                                _DataTable.Rows(a)("photo") = bytes

                            End If

                        End If

                    Next

                End If

            End If
            '=======================================================================================

            '=======================================================================================
            'Processing
            '---------------------------------------------------------------------------------------
            Session(SessionKey.REPORT_PARAMETERS) = dic
            Session(SessionKey.REPORT_DATASOURCE) = _DataTable
            Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing
            Session(SessionKey.REPORT_FORMULA) = Nothing
            Session(SessionKey.REPORT_BACK_PATH) = "Deafult.aspx"
            e.Result = "OK"
            '=======================================================================================

        Catch ex As Exception

            e.Result = ex.Message

        End Try

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ASPxGridView1.EnableRowsCache = False

        If Not IsPostBack Then

            ASPxComboBox_ListType.Value = Convert.ToByte(BeneficiaryRequestStatusEnum.Accepted)
            ASPxButton_Print.Value = DateTime.Now.Year

        End If

        ASPxButton_Print.Visible = (Convert.ToByte(Request.QueryString(QueryStringKey.APP_TYPE)) = 0)

        ASPxGridView1.Columns(String.Format("applicant_name_{0}", Session(SessionKey.CULTURE_ISO))).Visible = True
        ASPxGridView1.Columns(String.Format("donor_name{0}", Session(SessionKey.CULTURE_ISO))).Visible = True

    End Sub

    Protected Sub LinqServerModeDataSource1_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource1.Selecting

        e.KeyExpression = "app_ser_string"

        Dim db As New Database
        Dim countries As New List(Of Short?)
        Dim userName As String = Session(SessionKey.USERNAME)
        Dim app_type As Byte = Convert.ToByte(Request.QueryString(QueryStringKey.APP_TYPE))
        countries = (From o In db.user_country_relationship Where o.user_name = userName Select o.nat_code).ToList()
        Dim application_status_stud_orp As Byte = ASPxComboBox_ListType.Value

        Dim allocation As Byte = ASPxComboBox_Allocation.Value

        Select Case allocation

            Case 1

                e.QueryableSource = (From o In db.view_beneficiary_list Where countries.Contains(o.country) And (Not o.donor_id Is Nothing) And o.app_type = app_type And o.application_status_stud_orp = application_status_stud_orp Select o)

            Case 2

                e.QueryableSource = (From o In db.view_beneficiary_list Where countries.Contains(o.country) And (o.donor_id Is Nothing) And o.app_type = app_type And o.application_status_stud_orp = application_status_stud_orp Select o)

            Case Else

                e.QueryableSource = (From o In db.view_beneficiary_list Where countries.Contains(o.country) And o.app_type = app_type And o.application_status_stud_orp = application_status_stud_orp Select o)

        End Select

    End Sub

    Protected Sub ASPxComboBox_ListType_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ASPxComboBox_ListType.SelectedIndexChanged

        ASPxGridView1.DataBind()

    End Sub

    Protected Sub ASPxCallback_Print_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Print.Callback

        Print(e)

    End Sub

    Protected Sub ASPxComboBox_Allocation_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ASPxComboBox_Allocation.SelectedIndexChanged

        ASPxGridView1.DataBind()

    End Sub

    Protected Sub ASPxGridView1_ProcessColumnAutoFilter(sender As Object, e As DevExpress.Web.ASPxGridViewAutoFilterEventArgs) Handles ASPxGridView1.ProcessColumnAutoFilter

        If e.Column.FieldName = String.Format("applicant_name_{0}", Session(SessionKey.CULTURE_ISO)) Or e.Column.FieldName = String.Format("donor_name{0}", Session(SessionKey.CULTURE_ISO)) Then

            If e.Kind = DevExpress.Web.GridViewAutoFilterEventKind.CreateCriteria Then

                e.Criteria = New FunctionOperator(FunctionOperatorType.Contains, New OperandProperty(e.Column.FieldName), New OperandValue(StringEngine.ProcessArabicString(e.Value)))

            Else

                e.Value = StringEngine.ProcessArabicString(e.Value)

            End If

        End If

    End Sub

#End Region

End Class