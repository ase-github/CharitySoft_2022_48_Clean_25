
#Region "Imports Directives"

Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxUploadControl
Imports System.Collections.Specialized
Imports DevExpress.Web.ASPxTabControl
Imports DevExpress.Web.ASPxEditors
Imports System.IO
Imports System.Drawing
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
#End Region

Public Class UCBeneficiaryPeriodicalReports
    Inherits System.Web.UI.UserControl

#Region "Properties"

    Public Property app_ser() As Int32
        Get
            Return ViewState("app_ser")
        End Get

        Set(value As Int32)
            ViewState("app_ser") = value
            HiddenField_app_ser.Value = ViewState("app_ser")
        End Set

    End Property

    Public Property app_type() As Int32
        Get
            Return ViewState("app_type")
        End Get

        Set(value As Int32)
            ViewState("app_type") = value
            HiddenField_app_type.Value = ViewState("app_type")
        End Set

    End Property

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ASPxCallback_Save_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Save.Callback
        e.Result = CreatePeriodicalReport()
    End Sub

#End Region

    Private Function CreatePeriodicalReport() As String
        Try
            Dim appSer As Int32 = HiddenField_app_ser.Value
            Dim apptype As Int32 = HiddenField_app_type.Value

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

            dic.Add(Constant.YEAR, Date.Now.Year)

            Dim rptdoc As New ReportDocument()
            Dim _SqlConnectionStringBuilder As SqlConnectionStringBuilder
            _SqlConnectionStringBuilder = New SqlConnectionStringBuilder(_ConnectionString)

            '---------------------------------------------------------------------------------------

            Select Case app_type

                Case BeneficiaryTypeEnum.Orphan

                    _StringBuilder.AppendFormat("SELECT * FROM dbo.view_report_orphan WHERE (app_ser = {0}) ", app_ser)

                    _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)

                    _SqlDataAdapter = New SqlDataAdapter(_SqlCommand)

                    _SqlDataAdapter.Fill(_DataTable)

                    If (Not _DataTable Is Nothing) Then

                        If (_DataTable.Rows.Count > 0) Then

                            If _DataTable.Rows(0)("donor_id").ToString = "" Then
                                Throw New Exception("عفوا ،،، لايمكن اصدار تقرير لهذا اليتيم حيث انه غير مخصص")
                            End If

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

                    Dim REPORT_FILENAME As String = ".\Reports\orphan_yearly_report.rpt"

                    rptdoc.Load(Server.MapPath(REPORT_FILENAME))
                    rptdoc.SetDatabaseLogon(_SqlConnectionStringBuilder.UserID, _SqlConnectionStringBuilder.Password, _SqlConnectionStringBuilder.DataSource, _SqlConnectionStringBuilder.InitialCatalog)
                    rptdoc.SetDataSource(_DataTable)

                    If dic.Count > 0 Then

                        For a = 0 To rptdoc.DataDefinition.ParameterFields.Count - 1

                            Dim key As String = rptdoc.DataDefinition.ParameterFields(a).Name

                            If dic.ContainsKey(key) Then

                                Dim _ParameterValues As New ParameterValues
                                Dim _ParameterDiscreteValue As New ParameterDiscreteValue

                                _ParameterDiscreteValue.Value = dic(key)

                                _ParameterValues.Add(_ParameterDiscreteValue)

                                rptdoc.DataDefinition.ParameterFields(key).ApplyCurrentValues(_ParameterValues)

                            End If

                        Next

                    End If

                    'Dim fileName As String = Guid.NewGuid().ToString() + ".pdf"
                    Dim fileName As String = _DataTable.Rows(0)("app_ser") & "_" & Path.GetRandomFileName() + ".pdf"
                    Dim logicalPath As String = Path.Combine(Constant.PeriodicalReport_Orphans, fileName)
                    Dim physicalPath As String = MapPath(logicalPath)
                    rptdoc.ExportToDisk(ExportFormatType.PortableDocFormat, physicalPath)

                    _StringBuilder.Clear()
                    _StringBuilder.AppendFormat(" INSERT INTO TBL_BeneficiarPeriodicalReports (BeneficiaryType, ")
                    _StringBuilder.AppendFormat(" BeneficiaryID,DonorID,DescAR,ReportPath,AddedBy,ReportStatus )")
                    _StringBuilder.AppendFormat(" VALUES ( 0 , ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("app_ser") & " , ")
                    _StringBuilder.AppendFormat(" '" & _DataTable.Rows(0)("donor_id") & "' , ")
                    _StringBuilder.AppendFormat(" '" & _DataTable.Rows(0)("grade_name_ar") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("category_name_ar") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("assesment_namear") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("health_descr_ar") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("hobby_descar") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("activity_descar") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("verse_known") & "' , ")
                    _StringBuilder.AppendFormat(" '" & logicalPath & "' , ")
                    _StringBuilder.AppendFormat(" '" & Session(SessionKey.USERNAME) & "' , ")
                    _StringBuilder.AppendFormat(" 0 ) ")
                    _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)
                    _SqlConnection.Open()
                    _SqlCommand.ExecuteNonQuery()
                    _SqlConnection.Close()
                    '-----------------------------------

                Case BeneficiaryTypeEnum.Daaiya

                    _StringBuilder.AppendFormat(" SELECT * FROM dbo.view_Daaya_yearly_report AS mm WHERE (ID IN ")
                    _StringBuilder.AppendFormat(" (SELECT     MAX(ID ) AS Expr1 ")
                    _StringBuilder.AppendFormat(" FROM          dbo.view_Daaya_yearly_report AS mt")
                    _StringBuilder.AppendFormat(" WHERE (app_ser = mm.app_ser) AND (app_ser = {0})))  ", app_ser)
                    _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)
                    _SqlDataAdapter = New SqlDataAdapter(_SqlCommand)
                    _SqlDataAdapter.Fill(_DataTable)

                    Session(SessionKey.REPORT_PARAMETERS) = dic
                    Session(SessionKey.REPORT_DATASOURCE) = _DataTable
                    Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing

                    If (Not _DataTable Is Nothing) Then
                        If (_DataTable.Rows.Count > 0) Then
                            If _DataTable.Rows(0)("donor_id").ToString = "" Then
                                Throw New Exception("عفوا ،،، لايمكن اصدار تقرير لهذا الداعية حيث انه غير مخصص")
                            End If
                        End If
                    End If

                    Dim REPORT_FILENAME As String = ".\Reports\Daaya_yearly_report.rpt"

                    rptdoc.Load(Server.MapPath(REPORT_FILENAME))
                    rptdoc.SetDatabaseLogon(_SqlConnectionStringBuilder.UserID, _SqlConnectionStringBuilder.Password, _SqlConnectionStringBuilder.DataSource, _SqlConnectionStringBuilder.InitialCatalog)
                    rptdoc.SetDataSource(_DataTable)

                    Dim fileName As String = _DataTable.Rows(0)("app_ser") & "_" & Path.GetRandomFileName() + ".pdf"
                    Dim logicalPath As String = Path.Combine(Constant.PeriodicalReport_Da3ya, fileName)
                    Dim physicalPath As String = MapPath(logicalPath)
                    rptdoc.ExportToDisk(ExportFormatType.PortableDocFormat, physicalPath)

                    _StringBuilder.Clear()
                    _StringBuilder.AppendFormat(" INSERT INTO TBL_BeneficiarPeriodicalReports (BeneficiaryType, ")
                    _StringBuilder.AppendFormat(" BeneficiaryID,DonorID,DescAR,ReportPath,AddedBy,ReportStatus )")
                    _StringBuilder.AppendFormat(" VALUES ( 2 , ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("app_ser") & " , ")
                    _StringBuilder.AppendFormat(" '" & _DataTable.Rows(0)("donor_id") & "' , ")
                    _StringBuilder.AppendFormat(" '" & _DataTable.Rows(0)("nat_descrar") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("TheYear") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("VillageVisitsCount") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("LegitimateLessonsCount") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("NewMuslimsCount") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("Breakfasts") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("Sacrifies") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("Pilgrimages") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("PreachingConvoys") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("LegitimateCourses") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("EducationalCamps") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("QuranicContests") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("GuidanceCourses") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("RadioPrograms") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("StudentsActivities") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("WomenForums") & "' , ")
                    _StringBuilder.AppendFormat(" '" & logicalPath & "' , ")
                    _StringBuilder.AppendFormat(" '" & Session(SessionKey.USERNAME) & "' , ")
                    _StringBuilder.AppendFormat(" 0 ) ")
                    _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)
                    _SqlConnection.Open()
                    _SqlCommand.ExecuteNonQuery()
                    _SqlConnection.Close()
                    '-----------------------------------

                Case BeneficiaryTypeEnum.Student

                    _StringBuilder.AppendFormat("SELECT * FROM dbo.VIW_StudentYearlyReport WHERE (app_ser = {0}) ", app_ser)

                    _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)

                    _SqlDataAdapter = New SqlDataAdapter(_SqlCommand)

                    _SqlDataAdapter.Fill(_DataTable)

                    If (Not _DataTable Is Nothing) Then

                        If (_DataTable.Rows.Count > 0) Then

                            If _DataTable.Rows(0)("donor_id").ToString = "" Then
                                Throw New Exception("عفوا ،،، لايمكن اصدار تقرير لهذا الطالب حيث انه غير مخصص")
                            End If

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

                    Dim REPORT_FILENAME As String = ".\Reports\student_yearly_report.rpt"
                    'Dim REPORT_FILENAME As String = ".\Reports\student_yearly_report_V4.rpt"

                    rptdoc.Load(Server.MapPath(REPORT_FILENAME))
                    rptdoc.SetDatabaseLogon(_SqlConnectionStringBuilder.UserID, _SqlConnectionStringBuilder.Password, _SqlConnectionStringBuilder.DataSource, _SqlConnectionStringBuilder.InitialCatalog)
                    rptdoc.SetDataSource(_DataTable)

                    If dic.Count > 0 Then

                        For a = 0 To rptdoc.DataDefinition.ParameterFields.Count - 1

                            Dim key As String = rptdoc.DataDefinition.ParameterFields(a).Name

                            If dic.ContainsKey(key) Then

                                Dim _ParameterValues As New ParameterValues
                                Dim _ParameterDiscreteValue As New ParameterDiscreteValue

                                _ParameterDiscreteValue.Value = dic(key)

                                _ParameterValues.Add(_ParameterDiscreteValue)

                                rptdoc.DataDefinition.ParameterFields(key).ApplyCurrentValues(_ParameterValues)

                            End If

                        Next

                    End If

                    Dim fileName As String = _DataTable.Rows(0)("app_ser") & "_" & Path.GetRandomFileName() + ".pdf"
                    Dim logicalPath As String = Path.Combine(Constant.PeriodicalReport_Students, fileName)
                    Dim physicalPath As String = MapPath(logicalPath)
                    rptdoc.ExportToDisk(ExportFormatType.PortableDocFormat, physicalPath)

                    _StringBuilder.Clear()
                    _StringBuilder.AppendFormat(" INSERT INTO TBL_BeneficiarPeriodicalReports (BeneficiaryType, ")
                    _StringBuilder.AppendFormat(" BeneficiaryID,DonorID,DescAR,ReportPath,AddedBy,ReportStatus )")
                    _StringBuilder.AppendFormat(" VALUES ( 1 , ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("app_ser") & " , ")
                    _StringBuilder.AppendFormat(" '" & _DataTable.Rows(0)("donor_id") & "' , ")
                    _StringBuilder.AppendFormat(" '" & _DataTable.Rows(0)("stud_qual_name_ar") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("school_name_ar") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("stud_prof_name_ar") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("grade_name_ar") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("acad_year_name") & " - ")
                    _StringBuilder.AppendFormat(" " & _DataTable.Rows(0)("Term1_DescAr") & "' , ")
                    _StringBuilder.AppendFormat(" '" & logicalPath & "' , ")
                    _StringBuilder.AppendFormat(" '" & Session(SessionKey.USERNAME) & "' , ")
                    _StringBuilder.AppendFormat(" 0 ) ")
                    _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)
                    _SqlConnection.Open()
                    _SqlCommand.ExecuteNonQuery()
                    _SqlConnection.Close()

                    '------------------------'
            End Select
            '=======================================================================================

            '=======================================================================================
            'Processing
            '---------------------------------------------------------------------------------------
            Session(SessionKey.REPORT_FORMULA) = Nothing

            'Select Case app_type

            '    Case BeneficiaryTypeEnum.Orphan

            '        'Session(SessionKey.REPORT_FILENAME) = ".\Reports\orphan_yearly_report.rpt"

            '    Case BeneficiaryTypeEnum.Daaiya

            '        'Session(SessionKey.REPORT_FILENAME) = ".\Reports\Daaya_yearly_report.rpt"

            '        ' Ayman
            '        '------------------------'
            '    Case BeneficiaryTypeEnum.Student

            '        'Session(SessionKey.REPORT_FILENAME) = ".\Reports\student_yearly_report.rpt"
            '        '------------------------'
            'End Select


            '=======================================================================================


            Return "OK"
        Catch ex As Exception
            Return ex.Message
        End Try
    End Function


End Class