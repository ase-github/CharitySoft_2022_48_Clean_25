
#Region "Imports Directives"

Imports System.Data.SqlClient
Imports CrystalDecisions.Shared

#End Region

Public Class UCGenericReportViewerV1
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        CrystalReportSource1.EnableCaching = False

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
        CrystalReportSource1.ReportDocument.Load(Server.MapPath(String.Format(".\Reports\{0}.rpt", Request.QueryString(QueryStringKey.REPORT_FILENAME))))

        If Not Request.QueryString(QueryStringKey.SELECTION_FORMULA) Is Nothing Then

            CrystalReportSource1.ReportDocument.RecordSelectionFormula = Request.QueryString(QueryStringKey.SELECTION_FORMULA)

        End If

        CrystalReportSource1.ReportDocument.SetDatabaseLogon(_SqlConnectionStringBuilder.UserID, _SqlConnectionStringBuilder.Password, _SqlConnectionStringBuilder.DataSource, _SqlConnectionStringBuilder.InitialCatalog)
        '=======================================================================================

    End Sub

#End Region

End Class