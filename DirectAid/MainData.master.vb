
Public Class MainData
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ASPxButton_ExportXLSX_Click(sender As Object, e As EventArgs) Handles ASPxButton_ExportXLSX.Click
        ASPxGridViewExporter1.WriteXlsxToResponse()
    End Sub

End Class