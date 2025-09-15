
Partial Public Class UIWaqfDonorProject
    Inherits System.Web.UI.Page

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Request.QueryString("waqf_no") Is Nothing Then

            ASPxGridView1.AutoFilterByColumn(ASPxGridView1.Columns("waqf_no"), Request.QueryString("waqf_no"))

        End If

    End Sub

#End Region

End Class