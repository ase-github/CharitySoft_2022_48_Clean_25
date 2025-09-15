
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class UCBeneficiaryHeaderV1
    Inherits System.Web.UI.UserControl

#Region "Methods"

    Private Sub Print(e As DevExpress.Web.CallbackEventArgs)

        Try

            Dim app_ser_value As Int32? = Request.QueryString(QueryStringKey.APP_SER)
            Dim app_type_value As Byte? = 0

            Using db As New Database

                app_type_value = (From o In db.benf_master Where o.app_ser = app_ser_value Select o.app_type).FirstOrDefault()

            End Using

            '=======================================================================================
            'Validation
            '---------------------------------------------------------------------------------------
            If app_ser_value Is Nothing Then
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
                _benf_report_print_log.app_ser = app_ser_value
                _benf_report_print_log.print_date = DateTime.Now
                _benf_report_print_log.print_by = Session(SessionKey.USERNAME)
                _benf_report_print_log.report_id = 1
                db.benf_report_print_log.AddObject(_benf_report_print_log)
                db.SaveChanges()

            End Using

            Select Case app_type_value

                Case BeneficiaryTypeEnum.Orphan

                    _StringBuilder.AppendFormat("SELECT * FROM dbo.view_report_orphan WHERE (app_ser = {0}) ", app_ser_value)

                Case BeneficiaryTypeEnum.Daaiya

                    _StringBuilder.AppendFormat("SELECT * FROM dbo.view_Daaya_yearly_report WHERE (app_ser = {0}) ", app_ser_value)

            End Select

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
            '=======================================================================================

            '=======================================================================================
            'Processing
            '---------------------------------------------------------------------------------------
            Session(SessionKey.REPORT_PARAMETERS) = dic
            Session(SessionKey.REPORT_DATASOURCE) = _DataTable
            Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing
            Session(SessionKey.REPORT_FORMULA) = Nothing

            Select Case app_type_value

                Case BeneficiaryTypeEnum.Orphan

                    Session(SessionKey.REPORT_FILENAME) = ".\Reports\orphan_yearly_report.rpt"

                Case BeneficiaryTypeEnum.Daaiya

                    Session(SessionKey.REPORT_FILENAME) = ".\Reports\Daaya_yearly_report.rpt"

            End Select

            Session(SessionKey.REPORT_BACK_PATH) = "Default.aspx"
            e.Result = "OK"
            '=======================================================================================

        Catch ex As Exception

            e.Result = FaultEngine.HandleException(ex).Message

        End Try

    End Sub

#End Region
    
#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            ASPxButton_Print.Value = DateTime.Now.Year

        End If

        EntityDataSource3.ConnectionString = New EntityConnectionEx().TheConnectionString

    End Sub

    Protected Sub ASPxCallback_Print_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Print.Callback

        Print(e)

    End Sub

#End Region

End Class