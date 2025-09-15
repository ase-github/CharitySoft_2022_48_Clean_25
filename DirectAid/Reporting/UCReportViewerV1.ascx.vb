
#Region "Imports Directives"

Imports System.Data.SqlClient
Imports System.Exception
Imports CrystalDecisions.Shared
Imports CrystalDecisions.CrystalReports.Engine

#End Region

Public Class UCReportViewerV1
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If ViewState("PrintToPrinter") Is Nothing Then

            Panel1.Width = CrystalReportViewer1.Width

            CrystalReportSource1.EnableCaching = False

            If Not IsPostBack Then

                ViewState(SessionKey.REPORT_FILENAME) = Session(SessionKey.REPORT_FILENAME)
                ViewState(SessionKey.REPORT_DATASOURCE) = Session(SessionKey.REPORT_DATASOURCE)
                ViewState(SessionKey.REPORT_PARAMETERS) = Session(SessionKey.REPORT_PARAMETERS)
                ViewState(SessionKey.REPORT_FORMULA) = Session(SessionKey.REPORT_FORMULA)
                ViewState(SessionKey.REPORT_SORT_TABLE) = Session(SessionKey.REPORT_SORT_TABLE)
                ViewState(SessionKey.REPORT_SORT_FIELD) = Session(SessionKey.REPORT_SORT_FIELD)
                ViewState(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA)

                'COMMENTED BECAUSE OF PDF EXPORTING BUTTON WHEN BACK IS PRESSED
                '--------------------------------------------------------------
                'Session(SessionKey.REPORT_FILENAME) = Nothing
                'Session(SessionKey.REPORT_DATASOURCE) = Nothing
                'Session(SessionKey.REPORT_PARAMETERS) = Nothing
                'Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing

            End If

            '=======================================================================================
            'Declaration
            '---------------------------------------------------------------------------------------
            Dim _ConnectionString As String
            Dim _SqlConnectionStringBuilder As SqlConnectionStringBuilder
            '=======================================================================================

            '=======================================================================================
            'Initialization
            '---------------------------------------------------------------------------------------
            _ConnectionString = New ConnectionStringEx().TheConnectionString
            _SqlConnectionStringBuilder = New SqlConnectionStringBuilder(_ConnectionString)
            '=======================================================================================

            '=======================================================================================
            'Processing
            '---------------------------------------------------------------------------------------
            CrystalReportSource1.ReportDocument.Load(Server.MapPath(ViewState(SessionKey.REPORT_FILENAME)))

            CrystalReportSource1.ReportDocument.SetDatabaseLogon(_SqlConnectionStringBuilder.UserID, _SqlConnectionStringBuilder.Password, _SqlConnectionStringBuilder.DataSource, _SqlConnectionStringBuilder.InitialCatalog)

            Dim logoninfo As New TableLogOnInfo()
            Dim conninfo As New ConnectionInfo()
            With conninfo
                .Type = ConnectionInfoType.CRQE
                .ServerName = _SqlConnectionStringBuilder.DataSource
                .DatabaseName = _SqlConnectionStringBuilder.InitialCatalog
                .UserID = _SqlConnectionStringBuilder.UserID
                .Password = _SqlConnectionStringBuilder.Password
            End With
            CrystalReportSource1.ReportDocument.DataSourceConnections.Clear()

            For Each RTable As Table In CrystalReportSource1.ReportDocument.Database.Tables
                RTable.LogOnInfo.ConnectionInfo = conninfo
                logoninfo = RTable.LogOnInfo
                logoninfo.ReportName = ViewState(SessionKey.REPORT_FILENAME)
                logoninfo.TableName = RTable.Name
                RTable.ApplyLogOnInfo(logoninfo)
            Next

            If Not ViewState(SessionKey.REPORT_DATASOURCE) Is Nothing Then

                CrystalReportSource1.ReportDocument.SetDataSource(DirectCast(ViewState(SessionKey.REPORT_DATASOURCE), DataTable))

            End If

            If Not ViewState(SessionKey.REPORT_SORT_FIELD) Is Nothing Then

                Dim sortfield As CrystalDecisions.CrystalReports.Engine.FieldDefinition

                sortfield = CrystalReportSource1.ReportDocument.Database.Tables(ViewState(SessionKey.REPORT_SORT_TABLE)).Fields(ViewState(SessionKey.REPORT_SORT_FIELD))

                CrystalReportSource1.ReportDocument.DataDefinition.SortFields(0).Field = sortfield

                CrystalReportSource1.ReportDocument.DataDefinition.SortFields(0).SortDirection = CrystalDecisions.Shared.SortDirection.AscendingOrder

            End If

            If Not ViewState(SessionKey.REPORT_PARAMETERS) Is Nothing Then

                Dim dic As New Dictionary(Of String, Object)
                dic = ViewState(SessionKey.REPORT_PARAMETERS)

                If Not dic Is Nothing Then

                    If dic.Count > 0 Then

                        For a = 0 To CrystalReportSource1.ReportDocument.DataDefinition.ParameterFields.Count - 1

                            Dim key As String = CrystalReportSource1.ReportDocument.DataDefinition.ParameterFields(a).Name

                            If dic.ContainsKey(key) Then

                                Dim _ParameterValues As New ParameterValues
                                Dim _ParameterDiscreteValue As New ParameterDiscreteValue

                                _ParameterDiscreteValue.Value = dic(key)

                                _ParameterValues.Add(_ParameterDiscreteValue)

                                CrystalReportSource1.ReportDocument.DataDefinition.ParameterFields(key).ApplyCurrentValues(_ParameterValues)

                            End If

                        Next

                    End If

                End If

            End If

            If Not ViewState(SessionKey.REPORT_FORMULA) Is Nothing Then

                Dim dic As New Dictionary(Of String, Object)
                dic = ViewState(SessionKey.REPORT_FORMULA)

                If Not dic Is Nothing Then

                    If dic.Count > 0 Then

                        For a = 0 To CrystalReportSource1.ReportDocument.DataDefinition.FormulaFields.Count - 1

                            Dim key As String = CrystalReportSource1.ReportDocument.DataDefinition.FormulaFields(a).Name

                            If dic.ContainsKey(key) Then

                                CrystalReportSource1.ReportDocument.DataDefinition.FormulaFields(key).Text = String.Format("'{0}'", dic(key))

                            End If

                        Next

                    End If

                End If

            End If

            If Not ViewState(SessionKey.REPORT_RECORD_SELECTION_FORMULA) Is Nothing Then

                CrystalReportSource1.ReportDocument.RecordSelectionFormula = ViewState(SessionKey.REPORT_RECORD_SELECTION_FORMULA)

            End If

            'If ViewState(SessionKey.REPORT_FILENAME).ToString().Contains("ReceiptVoucherDoubleV2") Then

            '    CrystalReportSource1.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, "")

            'End If
            '=======================================================================================
        Else

            ViewState("PrintToPrinter") = Nothing

        End If

    End Sub

    Protected Sub ASPxButton_Print_Click(sender As Object, e As EventArgs) Handles ASPxButton_Print.Click

        ViewState("PrintToPrinter") = ""
        CrystalReportSource1.ReportDocument.PrintToPrinter(1, False, 0, 0)

    End Sub

    Protected Sub ASPxButton_PDF_Click(sender As Object, e As EventArgs) Handles ASPxButton_PDF.Click

        CrystalReportSource1.ReportDocument.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, False, "")

    End Sub

#End Region

End Class