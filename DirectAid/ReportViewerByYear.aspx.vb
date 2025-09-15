
#Region "Imports Directives"

Imports System.Data.SqlClient
Imports System.Exception
Imports CrystalDecisions.Shared

#End Region

Public Class ReportViewerByYear
    Inherits System.Web.UI.Page

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        CrystalReportSource1.EnableCaching = False

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


        'CrystalReportSource1.ReportDocument.SetParameterValue(0, Request.QueryString("Year"))

        If Not Session(SessionKey.REPORT_PARAMETERS) Is Nothing Then

            Dim dic As New Dictionary(Of String, Object)
            dic = Session(SessionKey.REPORT_PARAMETERS)

            For Each o In dic

                Dim pvs As New ParameterValues
                Dim pdv As New ParameterDiscreteValue
                pdv.Value = o.Value
                pvs.Add(pdv)

                CrystalReportSource1.ReportDocument.DataDefinition.ParameterFields(o.Key).ApplyCurrentValues(pvs)

            Next

        End If

        '=======================================================================================

    End Sub

    Protected Sub ASPxButton_Back_Click(sender As Object, e As EventArgs) Handles ASPxButton_Back.Click

        Response.Redirect(Session(SessionKey.REPORT_BACK_PATH))

    End Sub

#End Region

End Class