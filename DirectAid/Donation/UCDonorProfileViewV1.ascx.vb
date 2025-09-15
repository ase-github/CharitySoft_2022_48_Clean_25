
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class UCDonorProfileViewV1
    Inherits System.Web.UI.UserControl

#Region "Fields"

#End Region

#Region "Methods"

    Private Sub LoadLastThreeYears()

        Dim donorID As Int32 = Request.QueryString(QueryStringKey.DonorID)

        Dim currentYear As Int32 = DateTime.Now.Year
        Dim pastOneYear As Int32 = currentYear - 1
        Dim pastTwoYears As Int32 = currentYear - 2

        Dim currentYearTotal As Decimal = 0
        Dim pastOneYearTotal As Decimal = 0
        Dim pastTwoYearsTotal As Decimal = 0

        WebChartControl2.Series(0).Points.Clear()
        WebChartControl2.Series(1).Points.Clear()
        WebChartControl2.Series(2).Points.Clear()

        Using db As New Database

            Dim x = (From o In db.view_donor_donations_periodical Where o.donor_id = donorID And o.the_year >= pastTwoYears Select o.the_year, o.the_month_name, o.amount)

            For Each o In x

                If (o.the_year = currentYear) Then

                    currentYearTotal = currentYearTotal + o.amount

                    WebChartControl2.Series(0).Points.Add(New DevExpress.XtraCharts.SeriesPoint(o.the_month_name, o.amount))

                ElseIf (o.the_year = pastOneYear) Then

                    pastOneYearTotal = pastOneYearTotal + o.amount

                    WebChartControl2.Series(1).Points.Add(New DevExpress.XtraCharts.SeriesPoint(o.the_month_name, o.amount))

                ElseIf (o.the_year = pastTwoYears) Then

                    pastTwoYearsTotal = pastTwoYearsTotal + o.amount

                    WebChartControl2.Series(2).Points.Add(New DevExpress.XtraCharts.SeriesPoint(o.the_month_name, o.amount))

                End If

            Next

        End Using

        DirectCast(WebChartControl2.Series(0).View, DevExpress.XtraCharts.PieSeriesView).Titles(0).Text = String.Format("اجمالى عام {0} = {1}", currentYear, currentYearTotal)
        DirectCast(WebChartControl2.Series(1).View, DevExpress.XtraCharts.PieSeriesView).Titles(0).Text = String.Format("اجمالى عام {0} = {1}", pastOneYear, pastOneYearTotal)
        DirectCast(WebChartControl2.Series(2).View, DevExpress.XtraCharts.PieSeriesView).Titles(0).Text = String.Format("اجمالى عام {0} = {1}", pastTwoYears, pastTwoYearsTotal)

    End Sub

    Private Sub ActionTrack()

        Using db As New Database

            Dim _action_track As New action_track

            _action_track.user_name = Session(SessionKey.USERNAME)
            _action_track.system_unit_id = Constant.SYSTEM_UNIT_ID_DONOR_PROFILE_VIEW
            _action_track.action = Constant.ACTION_TRACK_ACTION_VIEW
            _action_track.entity_id = Constant.ACTION_TRACK_ENTITY_ID_DONOR
            _action_track.primary_key_value = Request.QueryString(QueryStringKey.DonorID)
            _action_track.action_date = DateTime.Now

            db.action_track.AddObject(_action_track)

            db.SaveChanges()

        End Using

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        EntityDataSource1.ConnectionString = New EntityConnectionEx().TheConnectionString
        EntityDataSource2.ConnectionString = New EntityConnectionEx().TheConnectionString

        SqlDataSource_view_donor_currrent_orphans.ConnectionString = New ConnectionStringEx().TheConnectionString
        SqlDataSource_view_donor_previous_orphans.ConnectionString = New ConnectionStringEx().TheConnectionString

        SqlDataSource_view_donor_currrent_sudents.ConnectionString = New ConnectionStringEx().TheConnectionString
        SqlDataSource_view_donor_previous_sudents.ConnectionString = New ConnectionStringEx().TheConnectionString

        SqlDataSource_view_donor_currrent_daaya.ConnectionString = New ConnectionStringEx().TheConnectionString
        SqlDataSource_view_donor_previous_daaya.ConnectionString = New ConnectionStringEx().TheConnectionString

        SqlDataSource_view_donor_project_list.ConnectionString = New ConnectionStringEx().TheConnectionString

        If Not IsPostBack Then

            ActionTrack()

            LoadLastThreeYears()

        End If

    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView_donor_currrent_orphans.RowDataBound, GridView_donor_currrent_sudents.RowDataBound, GridView_donor_currrent_daaya.RowDataBound, GridView_donor_previous_orphans.RowDataBound, GridView_donor_previous_sudents.RowDataBound, GridView_donor_previous_daaya.RowDataBound, GridView_donor_project_list.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then

            Dim beneficiaryCount As Int32 = 0
            Dim donorID As Int32 = Convert.ToInt32(Request.QueryString(QueryStringKey.DonorID))

            Using db As New Database

                Select Case DirectCast(sender, GridView).ID

                    Case "GridView_donor_currrent_orphans"

                        beneficiaryCount = (From o In db.view_donor_current_beneficiaries Where o.app_type = 0 And o.donor_id = donorID Select o.app_ser).Count

                    Case "GridView_donor_currrent_sudents"

                        beneficiaryCount = (From o In db.view_donor_current_beneficiaries Where o.app_type = 1 And o.donor_id = donorID Select o.app_ser).Count

                    Case "GridView_donor_currrent_daaya"

                        beneficiaryCount = (From o In db.view_donor_current_beneficiaries Where o.app_type = 2 And o.donor_id = donorID Select o.app_ser).Count

                    Case "GridView_donor_previous_orphans"

                        beneficiaryCount = (From o In db.view_donor_previous_beneficiaries Where o.app_type = 0 And o.donor_id = donorID Select o.app_ser).Count

                    Case "GridView_donor_previous_sudents"

                        beneficiaryCount = (From o In db.view_donor_previous_beneficiaries Where o.app_type = 1 And o.donor_id = donorID Select o.app_ser).Count

                    Case "GridView_donor_previous_daaya"

                        beneficiaryCount = (From o In db.view_donor_previous_beneficiaries Where o.app_type = 2 And o.donor_id = donorID Select o.app_ser).Count

                    Case "GridView_donor_project_list"

                        beneficiaryCount = (From o In db.project_donors Where o.donor_id = donorID Select o.project_id).Count

                    Case Else

                        beneficiaryCount = 0

                End Select

            End Using

            e.Row.Cells(0).Text = beneficiaryCount.ToString

        End If
    End Sub

#End Region

End Class