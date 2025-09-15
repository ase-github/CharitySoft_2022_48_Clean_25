Imports CrystalDecisions.CrystalReports.Engine
Imports System.Data.SqlClient
Imports CrystalDecisions.Web

Public Class UIConstructionTranferReportViewer
    Inherits System.Web.UI.Page

    'Dim constr As String = ConfigurationManager.ConnectionStrings("charitysoftConnectionString").ConnectionString
    'Dim con As New SqlConnection(constr)
    'Dim dt As New SqlDataAdapter
    'Dim cmd As New SqlCommand
    'Dim ds As New DSNewImplementation_Ayman
    'Dim rpt As New ConstructionTranferReport

    'Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    '    Try
    '        Dim ProjectID = SelectProjectIDByTranID(Request.QueryString("ID"))
    '        Dim str As String = "Select *,(Select Sum(trans_amount) From VIW_ProjectTransfer WHERE project_id=" & ProjectID & " ) As TotalTransfer From VIW_ProjectTransfer Where trans_id=" & Request.QueryString("ID") & " "

    '        With cmd
    '            .CommandTimeout = 60
    '            .Connection = con
    '            .CommandType = CommandType.Text
    '            .CommandText = str
    '        End With
    '        dt.SelectCommand = cmd
    '        Try
    '            con.Open()
    '            dt.Fill(ds, "VIW_ProjectTransfer")
    '            con.Close()
    '        Catch ex As Exception

    '        End Try
    '        rpt.SetDataSource(ds.Tables("VIW_ProjectTransfer"))
    '        CrystalReportViewer1.RefreshReport()
    '        CrystalReportViewer1.ReportSource = rpt

    '        'lblError.Text = str
    '        CrystalReportViewer1.ToolPanelView = ToolPanelViewType.None
    '    Catch ex As Exception
    '        'lblError.Text = "Error #########"
    '    End Try
    'End Sub

    'Private Function SelectProjectIDByTranID(ByVal TranID As Integer)
    '    Dim str As String = "Select project_id From VIW_ProjectTransfer Where trans_id=" & Request.QueryString("ID") & " "

    '    With cmd
    '        .CommandTimeout = 60
    '        .Connection = con
    '        .CommandType = CommandType.Text
    '        .CommandText = str
    '    End With
    '    dt.SelectCommand = cmd

    '    con.Open()
    '    Dim ProjectID As Integer = cmd.ExecuteScalar()
    '    con.Close()

    '    Return ProjectID

    'End Function

End Class