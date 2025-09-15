
#Region "Imports Directives"

Imports System.Data.SqlClient
Imports System.Exception
Imports CrystalDecisions.Shared

#End Region

Public Class UCXtraReportViewerV1
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'If ViewState("PrintToPrinter") Is Nothing Then

        '    Panel1.Width = CrystalReportViewer1.Width

        '    CrystalReportSource1.EnableCaching = False

        '    If Not IsPostBack Then

        '        ViewState(SessionKey.REPORT_FILENAME) = Session(SessionKey.REPORT_FILENAME)
        '        ViewState(SessionKey.REPORT_DATASOURCE) = Session(SessionKey.REPORT_DATASOURCE)
        '        ViewState(SessionKey.REPORT_PARAMETERS) = Session(SessionKey.REPORT_PARAMETERS)
        '        ViewState(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA)

        '        'COMMENTED BECAUSE OF PDF EXPORTING BUTTON WHEN BACK IS PRESSED
        '        '--------------------------------------------------------------
        '        'Session(SessionKey.REPORT_FILENAME) = Nothing
        '        'Session(SessionKey.REPORT_DATASOURCE) = Nothing
        '        'Session(SessionKey.REPORT_PARAMETERS) = Nothing
        '        'Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing

        '    End If

        '    '=======================================================================================
        '    'Declaration
        '    '---------------------------------------------------------------------------------------
        '    Dim _ConnectionString As String
        '    Dim _SqlConnectionStringBuilder As SqlConnectionStringBuilder
        '    '=======================================================================================

        '    '=======================================================================================
        '    'Initialization
        '    '---------------------------------------------------------------------------------------
        '    _ConnectionString = New ConnectionStringEx().TheConnectionString
        '    _SqlConnectionStringBuilder = New SqlConnectionStringBuilder(_ConnectionString)
        '    '=======================================================================================

        '    '=======================================================================================
        '    'Processing
        '    '---------------------------------------------------------------------------------------
        '    CrystalReportSource1.ReportDocument.Load(Server.MapPath(ViewState(SessionKey.REPORT_FILENAME)))

        '    CrystalReportSource1.ReportDocument.SetDatabaseLogon(_SqlConnectionStringBuilder.UserID, _SqlConnectionStringBuilder.Password, _SqlConnectionStringBuilder.DataSource, _SqlConnectionStringBuilder.InitialCatalog)

        '    If Not ViewState(SessionKey.REPORT_DATASOURCE) Is Nothing Then

        '        CrystalReportSource1.ReportDocument.SetDataSource(DirectCast(ViewState(SessionKey.REPORT_DATASOURCE), DataTable))

        '    End If

        '    If Not ViewState(SessionKey.REPORT_PARAMETERS) Is Nothing Then

        '        Dim dic As New Dictionary(Of String, Object)
        '        dic = ViewState(SessionKey.REPORT_PARAMETERS)

        '        If Not dic Is Nothing Then

        '            If dic.Count > 0 Then

        '                For a = 0 To CrystalReportSource1.ReportDocument.DataDefinition.ParameterFields.Count - 1

        '                    Dim key As String = CrystalReportSource1.ReportDocument.DataDefinition.ParameterFields(a).Name

        '                    If dic.ContainsKey(key) Then

        '                        Dim _ParameterValues As New ParameterValues
        '                        Dim _ParameterDiscreteValue As New ParameterDiscreteValue

        '                        _ParameterDiscreteValue.Value = dic(key)

        '                        _ParameterValues.Add(_ParameterDiscreteValue)

        '                        CrystalReportSource1.ReportDocument.DataDefinition.ParameterFields(key).ApplyCurrentValues(_ParameterValues)

        '                    End If

        '                Next

        '            End If

        '        End If

        '    End If

        '    If Not ViewState(SessionKey.REPORT_RECORD_SELECTION_FORMULA) Is Nothing Then

        '        CrystalReportSource1.ReportDocument.RecordSelectionFormula = ViewState(SessionKey.REPORT_RECORD_SELECTION_FORMULA)

        '    End If

        '    'If ViewState(SessionKey.REPORT_FILENAME).ToString().Contains("ReceiptVoucherDoubleV2") Then

        '    '    CrystalReportSource1.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, "")

        '    'End If
        '    '=======================================================================================
        'Else

        '    ViewState("PrintToPrinter") = Nothing

        'End If

    End Sub


#End Region

End Class