Public Class DiseasesMaster
    Inherits BaseWebForm

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        SqlDataSource1.ConnectionString = New ConnectionStringEx().TheConnectionString
    End Sub

End Class