
Public Class UCBeneficiaryHealthV3
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        EntityDataSource_Main.ConnectionString = New EntityConnectionEx().TheConnectionString

        dts_general_appearance.ConnectionString = New ConnectionStringEx().TheConnectionString
        dts_disease.ConnectionString = New ConnectionStringEx().TheConnectionString
        dts_surgery.ConnectionString = New ConnectionStringEx().TheConnectionString
        dts_psych_state.ConnectionString = New ConnectionStringEx().TheConnectionString
        dts_health_status.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting
        e.NewValues("app_ser") = Request.QueryString(QueryStringKey.OrphanID)
        e.NewValues("AddedBy") = Session(SessionKey.USERNAME)
        e.NewValues("AddedDate") = Date.Now
    End Sub

End Class