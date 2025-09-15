
#Region "Imports Directives"

Imports System.Data.SqlClient
Imports System.Exception

#End Region

Public Class ReportViewerSelectionFormula
    Inherits System.Web.UI.Page

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        CrystalReportSource1.EnableCaching = False

        If Not IsPostBack Then

            ViewState(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA)

            Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing

        End If

        ASPxButton_Back.Visible = (Request.QueryString("popup") Is Nothing)

        '=======================================================================================
        'Declaration
        '---------------------------------------------------------------------------------------
        Dim _ConnectionString As String
        Dim _SqlConnectionStringBuilder As SqlConnectionStringBuilder
        '=======================================================================================

        '=======================================================================================
        'Initialization
        '---------------------------------------------------------------------------------------
        _ConnectionString = ConfigurationManager.ConnectionStrings("charitysoft").ConnectionString
        _SqlConnectionStringBuilder = New SqlConnectionStringBuilder(_ConnectionString)
        '=======================================================================================

        '=======================================================================================
        'Processing
        '---------------------------------------------------------------------------------------
        CrystalReportSource1.ReportDocument.Load(Server.MapPath(Session(SessionKey.REPORT_FILENAME)))
        CrystalReportSource1.ReportDocument.SetDatabaseLogon(_SqlConnectionStringBuilder.UserID, _SqlConnectionStringBuilder.Password, _SqlConnectionStringBuilder.DataSource, _SqlConnectionStringBuilder.InitialCatalog)
        CrystalReportSource1.ReportDocument.RecordSelectionFormula = ViewState(SessionKey.REPORT_RECORD_SELECTION_FORMULA)
        '=======================================================================================

    End Sub

    Protected Sub ASPxButton_Back_Click(sender As Object, e As EventArgs) Handles ASPxButton_Back.Click

        Response.Redirect(Session(SessionKey.REPORT_BACK_PATH))

    End Sub

#End Region

End Class