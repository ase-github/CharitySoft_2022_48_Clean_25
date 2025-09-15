
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView

#End Region

Public Class UCDeductionDistributionV1
    Inherits System.Web.UI.UserControl

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SqlDataSource1.ConnectionString = New ConnectionStringEx().TheConnectionString
        SqlDataSource_nat_tab.ConnectionString = New ConnectionStringEx().TheConnectionString
        SqlDataSource_donations.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

#End Region

End Class