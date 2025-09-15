
#Region "Imports Directives"

Imports DevExpress.Web.ASPxEditors
Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class UIEvent
    Inherits BaseWebForm

#Region "Methods"

    Private Sub NewMethod()

        Response.Redirect("UIEvent.aspx")

    End Sub

    Private Sub Saving(e As DevExpress.Web.CallbackEventArgs)

        Try

            e.Result = event_id.Value

            Dim isNew As Boolean = (event_id.Value Is Nothing)

            Using db As New Database

                Dim _event_mast As New event_mast

                If Not isNew Then

                    _event_mast = (From o In db.event_mast Where o.event_id = e.Result Select o).FirstOrDefault

                End If

                _event_mast.event_type = event_type.Value

                _event_mast.event_name_ar = event_name_ar.Value
                _event_mast.event_name_en = event_name_en.Value
                _event_mast.event_title = event_title.Value

                _event_mast.event_frm_date = event_frm_date.Value
                _event_mast.event_to_date = event_to_date.Value

                _event_mast.shifts_count = Convert.ToByte(shifts_count.Value)
                _event_mast.event_start_time = event_start_time.Value
                _event_mast.event_end_time = event_end_time.Value
                _event_mast.event_city = event_city.Value
                _event_mast.event_place = event_place.Value
                _event_mast.minimum_participants = Convert.ToInt16(minimum_participants.Value)
                _event_mast.event_cost = Convert.ToDecimal(event_cost.Value)
                _event_mast.close_ceremony_date = close_ceremony_date.Value

                _event_mast.result_date = result_date.Value
                _event_mast.reward_date = reward_date.Value
           
                If isNew Then

                    db.AddToevent_mast(_event_mast)

                End If

                db.SaveChanges()

                e.Result = _event_mast.event_id

            End Using

        Catch ex As Exception

            e.Result = ex.Message

        End Try

    End Sub

    Private Sub Loading()

        Using db As New Database

            Dim _event_mast As New event_mast

            Dim id As Int32 = event_id.Value

            _event_mast = (From o In db.event_mast Where o.event_id = id Select o).FirstOrDefault

            If Not _event_mast Is Nothing Then

                event_type.Value = _event_mast.event_type

                event_name_ar.Value = _event_mast.event_name_ar
                event_name_en.Value = _event_mast.event_name_en
                event_title.Value = _event_mast.event_title

                event_frm_date.Value = _event_mast.event_frm_date
                event_to_date.Value = _event_mast.event_to_date
                shifts_count.Value = _event_mast.shifts_count

                event_start_time.Value = _event_mast.event_start_time
                event_end_time.Value = _event_mast.event_end_time

                event_country.Value = (From o In db.cities Where o.city_id = _event_mast.event_city Select o.nat_city).FirstOrDefault
                event_city.Value = _event_mast.event_city
                event_place.Value = _event_mast.event_place

                minimum_participants.Value = _event_mast.minimum_participants
                event_cost.Value = _event_mast.event_cost

                close_ceremony_date.Value = _event_mast.close_ceremony_date
                result_date.Value = _event_mast.result_date
                reward_date.Value = _event_mast.reward_date

            End If

        End Using

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        EntityDataSource_event_types_codes.ConnectionString = New EntityConnectionEx().TheConnectionString
        EntityDataSource_nat_tab.ConnectionString = New EntityConnectionEx().TheConnectionString
        EntityDataSource_city.ConnectionString = New EntityConnectionEx().TheConnectionString

        If Not IsPostBack And Not IsCallback Then

            event_id.Value = Request.QueryString(QueryStringKey.EVENT_ID)

            Loading()

        End If

    End Sub

    Protected Sub ASPxButton_New_Click(sender As Object, e As EventArgs) Handles ASPxButton_New.Click

        NewMethod()

    End Sub

    Protected Sub ASPxCallback_Save_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Save.Callback

        Saving(e)

    End Sub

#End Region

End Class