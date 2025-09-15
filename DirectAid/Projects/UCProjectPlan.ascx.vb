
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView
Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxUploadControl
Imports System.Web.UI
Imports System.IO
Imports System.Drawing

#End Region

Public Class UCProjectPlan
    Inherits System.Web.UI.UserControl

#Region "Methods"

    Private Sub ValidateEntries(id As Int32, NewValues As System.Collections.Specialized.OrderedDictionary)

        For a = 0 To ASPxGridView1.VisibleRowCount - 1

            Dim key As Int32 = ASPxGridView1.GetRowValues(a, "id")

            If key <> id Then

                Dim plan_year As Int32 = ASPxGridView1.GetRowValues(a, "plan_year")
                Dim project_type_id As Int32 = ASPxGridView1.GetRowValues(a, "project_type_id")
                Dim nat_code As Int16 = ASPxGridView1.GetRowValues(a, "nat_code")
                Dim priority As Int16 = ASPxGridView1.GetRowValues(a, "priority")
                Dim cost As Decimal = ASPxGridView1.GetRowValues(a, "cost")

                Dim new_plan_year As Int32 = NewValues("plan_year")
                Dim new_project_type_id As Int32 = NewValues("project_type_id")
                Dim new_nat_code As Int16 = NewValues("nat_code")
                Dim new_priority As Int16 = NewValues("priority")
                Dim new_cost As Decimal = NewValues("cost")

                Dim equal_plan_year As Boolean = (plan_year = new_plan_year)
                Dim equal_project_type_id As Boolean = (project_type_id = new_project_type_id)
                Dim equal_nat_code As Boolean = (nat_code = new_nat_code)
                Dim equal_priority As Boolean = (priority = new_priority)
                Dim equal_cost As Boolean = (cost = new_cost)

                If equal_plan_year And equal_project_type_id And equal_nat_code Then

                    If equal_cost Then

                        Throw New Exception("تم ادخال هذه التكلفه من قبل")
                        Exit For

                    ElseIf equal_priority Then

                        Throw New Exception("تم ادخال هذه الاولويه من قبل")
                        Exit For

                    End If

                End If

            End If

        Next

    End Sub

    ''' <summary>
    ''' DEPRICATED
    ''' </summary>
    ''' <param name="id"></param>
    ''' <param name="isStopped"></param>
    ''' <param name="remarks"></param>
    ''' <remarks></remarks>
    Private Sub WriteLog(id As Int32, isStopped As Boolean, remarks As String)

        'Using db As New Database

        '    Dim _action_track As New action_track

        '    _action_track.user_name = Session(SessionKey.USERNAME)
        '    _action_track.system_unit_id = Constant.SYSTEM_UNIT_ID_PROJECT_PLAN
        '    _action_track.action = IIf(isStopped, Constant.ACTION_TRACK_ACTION_STOP, Constant.ACTION_TRACK_ACTION_START)
        '    _action_track.entity_id = Constant.ACTION_TRACK_ENTITY_ID_PROJECT_PLAN
        '    _action_track.primary_key_value = id
        '    _action_track.action_date = DateTime.Now
        '    _action_track.Remarks = remarks

        '    db.action_track.AddObject(_action_track)

        '    db.SaveChanges()

        'End Using

    End Sub

#End Region

#Region "Events"

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        ValidateEntries(0, e.NewValues)

    End Sub

    Protected Sub ASPxGridView1_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ASPxGridView1.RowUpdating

        ValidateEntries(e.Keys(0), e.NewValues)

    End Sub

    Protected Sub ASPxGridView1_RowInserted(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertedEventArgs) Handles ASPxGridView1.RowInserted

        WriteLog(e.NewValues("id"), e.NewValues("IsStopped"), e.NewValues("Remarks"))

    End Sub

    Protected Sub ASPxGridView1_RowUpdated(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatedEventArgs) Handles ASPxGridView1.RowUpdated

        WriteLog(e.OldValues("id"), e.NewValues("IsStopped"), e.NewValues("Remarks"))

    End Sub

#End Region

End Class