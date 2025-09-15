
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class DonationBySectorReportSearch
    Inherits BaseWebForm

#Region "Methods"

    Private Sub NewSearch()

        reciept_date_From.Value = Nothing
        reciept_date_To.Value = Nothing
        recpt_src.Value = Nothing

    End Sub

    Private Sub Print(e As DevExpress.Web.CallbackEventArgs)

        Try

            '=======================================================================================
            'Declaration
            '---------------------------------------------------------------------------------------
            Dim _StringBuilder As StringBuilder
            '=======================================================================================

            '=======================================================================================
            'Initialization
            '---------------------------------------------------------------------------------------
            _StringBuilder = New StringBuilder
            '---------------------------------------------------------------------------------------
        _StringBuilder.AppendFormat("({0} in ({1}))", "{donations.dimension5}", Request.QueryString(QueryStringKey.DIMENSION5_RANGE))

            If Not reciept_date_From.Value Is Nothing And Not reciept_date_To.Value Is Nothing Then

                _StringBuilder.AppendFormat(" AND ({0} >= date({1}) AND {0} <= date({2})) ", "{dash_details_qrysect.reciept_date}", reciept_date_From.Date.ToString("yyyy,MM,dd"), reciept_date_To.Date.ToString("yyyy,MM,dd"))

            End If

            If Not recpt_src.Value Is Nothing Then

                _StringBuilder.AppendFormat(" AND ({0} = {1})", "{dash_details_qrysect.recpt_src}", recpt_src.Value)

            End If
            '=======================================================================================

            '=======================================================================================
            'Processing
            '---------------------------------------------------------------------------------------
            Session(SessionKey.REPORT_RECORD_SELECTION_FORMULA) = _StringBuilder.ToString()
            Session(SessionKey.REPORT_DATASOURCE) = Nothing
            Session(SessionKey.REPORT_FILENAME) = String.Format(".\Reports\{0}.rpt", ASPxComboBox_ReportType.Value)
            Session(SessionKey.REPORT_FORMULA) = Nothing
            e.Result = "OK"
            '=======================================================================================

        Catch ex As Exception

            e.Result = ex.Message

        End Try

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ASPxButton_New_Click(sender As Object, e As EventArgs) Handles ASPxButton_New.Click

        NewSearch()

    End Sub

    Protected Sub ASPxCallback_Print_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Print.Callback

        Print(e)

    End Sub

#End Region

End Class