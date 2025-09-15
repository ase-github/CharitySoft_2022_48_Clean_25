
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports DevExpress.Web.ASPxEditors
Imports System.Linq
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web

#End Region

Public Class UCManualProjectAllocation
    Inherits System.Web.UI.UserControl

#Region "Fields"

#End Region

#Region "Methods"

    Private Sub Saving(e As DevExpress.Web.CallbackEventArgs)

        Try

            'SqlDataSourceMain.Insert()

        Catch ex As Exception

            e.Result = ex.Message

        End Try

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'SqlDataSourceMain.ConnectionString = New ConnectionStringEx().TheConnectionString
        'SqlDataSource1.ConnectionString = New ConnectionStringEx().TheConnectionString
        'SqlDataSource_RelatedProject.ConnectionString = New ConnectionStringEx().TheConnectionString
        'SqlDataSource_view_project_donor_receipts.ConnectionString = New ConnectionStringEx().TheConnectionString

        'grd_donor_allocate.Columns(String.Format("donor_name{0}", Session(SessionName.CULTURE_ISO))).Visible = True

        If Not IsPostBack And Not Page.IsCallback Then

            Dim project_id_Value As Object = Request.QueryString(QueryStringKey.PROJECT_ID)

            If Not project_id_Value Is Nothing Then

                project_id.Value = Convert.ToInt32(project_id_Value)
                project_id.Enabled = False

            End If

        End If

    End Sub

    Protected Sub ASPxCallback_Save_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Save.Callback

        Saving(e)

    End Sub

    Protected Sub LinqServerModeDataSource1_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource1.Selecting

        e.KeyExpression = "id"

        Dim db As New Database(Constant.CHARITYSOFT)

        If Not project_id.Value Is Nothing Then

            Dim projectCode As Int32 = project_id.Value
            Dim donationCode As Int16?
            Dim countryCode As Int16?

            Dim countries As New List(Of Short?)
            countries.Add(countryCode)
            countries.Add(0) 'None
            countries.Add(1) 'General
            countries.Add(2) 'Kuwait

            Dim theProject As project = (From o In db.projects Where o.project_id = projectCode Select o).FirstOrDefault
            donationCode = IIf(theProject.donation_cat Is Nothing, Nothing, Convert.ToInt16(theProject.donation_cat))
            countryCode = theProject.nat_code

            'e.QueryableSource = (From o In db.view_project_donor_source Where o.donation_code = donationCode And countries.Contains(o.nat_code) Select o)

            e.QueryableSource = (From o In db.view_project_donor_source Where o.donation_code = donationCode And (o.nat_code = countryCode Or o.nat_code = 0 Or o.nat_code = 1 Or o.nat_code = 2) Select o)


        Else

            e.QueryableSource = (From o In db.view_project_donor_source Where o.donor_id = -1)


        End If

    End Sub

    Protected Sub project_id_SelectedIndexChanged(sender As Object, e As EventArgs) Handles project_id.SelectedIndexChanged
        ASPxGridView_Source.DataBind()
    End Sub

    Protected Sub LinqServerModeDataSource1_Deleting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceEditEventArgs) Handles LinqServerModeDataSource1.Deleting

        e.Handled = True

        Using db As New Database(Constant.CHARITYSOFT)

            Dim projectID As Int32 = project_id.Value
            Dim donorID As Int32 = e.OldValues("donor_id_string")
            Dim receiptID As Int32 = e.OldValues("src_num_string")
            Dim amount As Decimal = e.OldValues("src_value")

            Dim _project_donors As project_donors

            _project_donors = (From o In db.project_donors Where o.project_id = projectID And o.donor_id = donorID).FirstOrDefault

            If _project_donors Is Nothing Then

                _project_donors = New project_donors
                _project_donors.project_id = projectID
                _project_donors.donor_id = donorID
                db.project_donors.AddObject(_project_donors)

            Else

                _project_donors.amount = _project_donors.amount + amount

            End If

            Dim _project_donor_receipts As New project_donor_receipts
            _project_donor_receipts.project_id = projectID
            _project_donor_receipts.donor_id = donorID
            _project_donor_receipts.receipt_id = receiptID
            _project_donor_receipts.amount = amount
            _project_donor_receipts.allocation_date = DateTime.Now
            db.project_donor_receipts.AddObject(_project_donor_receipts)

            db.SaveChanges()

        End Using

    End Sub

    Protected Sub ASPxGridView_Target_RowDeleting(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletingEventArgs) Handles ASPxGridView_Target.RowDeleting

        Using db As New Database(Constant.CHARITYSOFT)

            Dim projectID As Int32 = project_id.Value
            Dim donorID As Int32 = e.Values("donor_id")
            Dim receiptID As Int32 = e.Values("receipt_id")
            Dim amount As Decimal = e.Values("amount")

            Dim _project_donor_receipts As New project_donor_receipts
            _project_donor_receipts = (From o In db.project_donor_receipts Where o.project_id = projectID And o.donor_id = donorID And o.receipt_id = receiptID).FirstOrDefault
            db.project_donor_receipts.DeleteObject(_project_donor_receipts)

            Dim _project_donors As project_donors

            _project_donors = (From o In db.project_donors Where o.project_id = projectID And o.donor_id = donorID).FirstOrDefault

            _project_donors.amount = _project_donors.amount - amount

            db.SaveChanges()

        End Using

    End Sub

    Protected Sub SqlDataSource_view_project_donor_receipts_Deleting(sender As Object, e As SqlDataSourceCommandEventArgs) Handles SqlDataSource_view_project_donor_receipts.Deleting

        e.Cancel = True

    End Sub

    Protected Sub ASPxGridView_Source_AfterPerformCallback(sender As Object, e As DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs) Handles ASPxGridView_Source.AfterPerformCallback

        Dim gv As ASPxGridView = DirectCast(sender, ASPxGridView)
        gv.JSProperties.Add("cpIsDELETEROW", Nothing)
        gv.JSProperties("cpIsDELETEROW") = (e.CallbackName = "DELETEROW")

    End Sub

    Protected Sub ASPxGridView_Target_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles ASPxGridView_Target.AfterPerformCallback

        Dim gv As ASPxGridView = DirectCast(sender, ASPxGridView)
        gv.JSProperties.Add("cpIsDELETEROW", Nothing)
        gv.JSProperties("cpIsDELETEROW") = (e.CallbackName = "DELETEROW")

    End Sub

#End Region

End Class