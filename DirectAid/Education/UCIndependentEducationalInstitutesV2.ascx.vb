Public Class UCIndependentEducationalInstitutesV2
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    'Protected Sub EntityDataSource1_Inserting(sender As Object, e As EntityDataSourceChangingEventArgs) Handles EntityDataSource1.Inserting
    '    Dim db As charitysoftEntities = New charitysoftEntities()
    '    Dim code As Integer = db.school_master.Max(Function(o) o.school_code) + 1
    '    Dim obj As school_master = e.Entity
    '    obj.school_related_to_da = 0
    '    obj.school_code = code
    'End Sub

    Protected Sub ASPxGridView1_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles ASPxGridView1.RowValidating

    End Sub
End Class