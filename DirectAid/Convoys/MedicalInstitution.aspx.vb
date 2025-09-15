Imports DevExpress.Web
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView

Public Class MedicalInstitution
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub hyperLink_HR_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Convoys/Modal/MeInstituteEmps.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim inst_ID As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "inst_ID").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?app_ser={1}&t={2}", urlBase, inst_ID, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub

    Protected Sub hyperLink_components_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Convoys/Modal/MedInstituteComponents.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim inst_ID As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "inst_ID").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?app_ser={1}&t={2}", urlBase, inst_ID, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub

    Protected Sub hyperLink_attach_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/EducationAttachments.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim convoy_id As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "inst_ID").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?app_ser={1}&mod=22&t={2}", urlBase, convoy_id, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub

    Protected Sub hyperLink_infrastructure_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Convoys/Modal/MedInfrastructure.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim inst_ID As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "inst_ID").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?app_ser={1}&t={2}", urlBase, inst_ID, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub
End Class