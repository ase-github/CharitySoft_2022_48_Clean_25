Public Class UCQuranKnown
    Inherits System.Web.UI.UserControl

#Region "Properties"

    Public Property app_ser() As Int32
        Get
            Return HiddenField_app_ser.Value
        End Get

        Set(value As Int32)
            HiddenField_app_ser.Value = value
        End Set

    End Property

#End Region
    
#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        EntityDataSource1.ConnectionString = New EntityConnectionEx().TheConnectionString

    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting

        If (app_ser <> 0) Then

            e.NewValues("app_ser") = app_ser
            e.NewValues("AddedBy") = Session(SessionKey.USERNAME)
            e.NewValues("AddedDate") = Date.Now
        Else

            Throw New Exception("من فضلك قم بحفظ او استدعاء بيانات اليتيم")

        End If


    End Sub

#End Region

End Class