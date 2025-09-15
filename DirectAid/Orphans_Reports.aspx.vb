
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class Orphans_Reports
    Inherits BaseWebForm

#Region "Methods"

    Private Sub Print(ByVal reportType As Int16)

        '=======================================================================================
        'Declaration
        '---------------------------------------------------------------------------------------
        Dim _StringBuilder As StringBuilder
        Dim dic As New Dictionary(Of String, Object)
        '=======================================================================================

        '=======================================================================================
        'Initialization
        '---------------------------------------------------------------------------------------
        _StringBuilder = New StringBuilder
        '---------------------------------------------------------------------------------------

        '=======================================================================================

        '=======================================================================================
        'Processing
        '---------------------------------------------------------------------------------------
        Session(SessionKey.REPORT_BACK_PATH) = "Orphans_Reports.aspx"

        Select Case reportType

            Case 1
                dic.Add("Year", ASPxTextBox_Year.Value)
                Session(SessionKey.REPORT_FILENAME) = String.Format(".\Reports\{0}.rpt", "OrphanTransByYear")

            Case 2
                dic.Add("Year", ASPxTextBox_Year_2.Value)
                dic.Add("@year", ASPxTextBox_Year_2.Value)
                Session(SessionKey.REPORT_FILENAME) = String.Format(".\Reports\{0}.rpt", "orp_stat_2")

        End Select

        Session(SessionKey.REPORT_DATASOURCE) = Nothing
        Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = Nothing
        Session(SessionKey.REPORT_PARAMETERS) = dic
        Session(SessionKey.REPORT_FORMULA) = Nothing
        Response.Redirect("ReportViewer.aspx")
        '=======================================================================================

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            ASPxTextBox_Year.Value = DateTime.Now.Year
            ASPxTextBox_Year_2.Value = DateTime.Now.Year

        End If
    End Sub

    Protected Sub ASPxButton_Print_Click(sender As Object, e As EventArgs) Handles ASPxButton_Print.Click

        Print(1)

    End Sub

    Protected Sub ASPxButton_Print_2_Click(sender As Object, e As EventArgs) Handles ASPxButton_Print_2.Click

        Print(2)

    End Sub

#End Region

End Class