Imports DevExpress.Web
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView

Public Class UCSchoolsEmployeesV1
    Inherits System.Web.UI.UserControl

    Dim selectAllSP = "Select_school_employees_V2"
    Dim selectByName = "Select_school_employees_byname_V2"
    Dim selectByNameParam = "name"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        DS_Select_employees_V2.ConnectionString = New ConnectionStringEx().TheConnectionString
        nat_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        job_class_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        employment_type_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        job_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        qualifications_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        assessment_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        job_proffession_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        currency_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        'school_name_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        reasons_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString

        If Not IsPostBack Then
            Session("EmployeeQuery") = Nothing
        End If
    End Sub

    Protected Sub hyperLink_details_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/SchoolsEmployeesDetails.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim emp_code As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "emp_code").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        Dim contentUrl As String = String.Format("{0}?sid={1}", urlBase, emp_code)
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openDetails('{0}','{1}'); }}", contentUrl, "width=800,height=300,resizable=no,location=no")
    End Sub

    Protected Sub btn_query_Click(sender As Object, e As EventArgs) Handles btn_query.Click
        If Not txt_queryName.Text.Equals(Nothing) And Not txt_queryName.Text.Equals("") Then
            Session("EmployeeQuery") = 1

            ASPxGridView1.FilterExpression = "[emp_name_ar] LIKE %" + txt_queryName.Text + "% OR [emp_name_eng] LIKE %" + txt_queryName.Text + "%"
            'DS_Select_employees_V2.SelectCommand = selectByName
            'DS_Select_employees_V2.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
            'DS_Select_employees_V2.SelectParameters.Add(selectByNameParam, txt_queryName.Text)
            'ASPxGridView1.DataBind()
        End If
    End Sub

    Protected Sub btn_clear_Click(sender As Object, e As EventArgs) Handles btn_clear.Click
        If Session("EmployeeQuery") = 1 Then
            Session("EmployeeQuery") = Nothing
            'DS_Select_employees_V2.SelectCommand = selectAllSP
            'DS_Select_employees_V2.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
            'DS_Select_employees_V2.SelectParameters.Clear()
            'ASPxGridView1.DataBind()
            ASPxGridView1.FilterExpression = String.Empty
            txt_queryName.Text = ""
        End If
    End Sub

End Class