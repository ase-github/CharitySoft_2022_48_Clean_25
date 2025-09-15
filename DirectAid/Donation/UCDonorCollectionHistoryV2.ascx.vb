
Public Class UCDonorCollectionHistoryV2
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        GrdDs.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

End Class