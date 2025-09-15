Public Class UCBeneficiaryLanguageV2
    Inherits System.Web.UI.UserControl

#Region "Properties"

    Public Property app_ser() As String
        Get
            Return HiddenField_app_ser.Value
        End Get

        Set(value As String)
            HiddenField_app_ser.Value = value
        End Set

    End Property

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        dts_languages.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles grd_language.RowInserting

        If (app_ser <> 0) Then

            e.NewValues("app_ser") = app_ser
            e.NewValues("AddedBy") = Session(SessionKey.USERNAME)
        Else

            Throw New Exception("من فضلك قم بحفظ او استدعاء بيانات اليتيم")

        End If


    End Sub

#End Region

End Class