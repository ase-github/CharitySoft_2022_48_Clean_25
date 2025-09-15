Imports System.IO
Imports System.ComponentModel
Imports System.Data.SqlClient
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web

<DataObject()>
Public Class UCReportsData
    Inherits System.Web.UI.UserControl

    Dim constr As String = ConfigurationManager.ConnectionStrings("charitysoftConnectionString").ConnectionString
    Dim con As New SqlConnection(constr)
    Dim cmd As New SqlCommand
    Dim ds As New DataSet
    Dim dt As New SqlDataAdapter
    Dim str As String

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim ProjectNo As String = Request.QueryString("project_id").ToString
        Dim ProjectType As String

        '========================='
        If Not IsPostBack Then

            str = " SELECT * FROM Reports_Projects_Master WHERE Project_No ='" & ProjectNo.ToString & "' "
            With cmd
                .CommandTimeout = 0
                .Connection = con
            End With

            If con.State <> ConnectionState.Open Then
                con.Open()
            End If

            cmd.CommandText = str
            cmd.Connection = con

            dt.SelectCommand = cmd
            Dim datatable As New DataTable
            dt.Fill(datatable)
            con.Close()


            If datatable.Rows.Count > 0 Then
                If datatable.Rows(0)("Project_ID").ToString <> "" Then
                    cmbProjectType.Value = datatable.Rows(0)("Project_ID").ToString
                    ProjectType = cmbProjectType.Value
                Else
                    ProjectType = 0
                End If
            Else
                ProjectType = 0
            End If

            SetDefaultValueForSQLDataSource(ProjectType)

            If datatable.Rows.Count > 0 Then

                cmbProjectFloors.Value = datatable.Rows(0)("Floor_ID").ToString
                cmbProjectRoofs.Value = datatable.Rows(0)("Roof_ID").ToString
                cmbProjectTiles.Value = datatable.Rows(0)("Tiles_ID").ToString

                Dim FurnitureItems As String = datatable.Rows(0)("Furniture_IDs").ToString
                For Each item As ListEditItem In chklstFurniture.Items
                    If FurnitureItems.Contains(item.Value.ToString()) Then
                        item.Selected = True
                    End If
                Next item

                Dim OutbuildingItems As String = datatable.Rows(0)("Outbuilding_IDs").ToString
                For Each item As ListEditItem In chklstOutbuilding.Items
                    If OutbuildingItems.Contains(item.Value.ToString()) Then
                        item.Selected = True
                    End If
                Next item

                cmbProjectDeeps.Value = datatable.Rows(0)("Deep_ID").ToString
                cmbProjectBeneficiariesCount.Value = datatable.Rows(0)("Beneficiaries_Count_ID").ToString

                txtPriority.Text = datatable.Rows(0)("Priority_Desc").ToString
                txtNotes.Text = datatable.Rows(0)("Notes").ToString

                TextBox1.Text = datatable.Rows(0)("PhotoPath1").ToString
                TextBox2.Text = datatable.Rows(0)("PhotoPath2").ToString
                TextBox3.Text = datatable.Rows(0)("PhotoPath3").ToString
                TextBox4.Text = datatable.Rows(0)("PhotoPath4").ToString
                TextBox5.Text = datatable.Rows(0)("PhotoPath5").ToString
                TextBox6.Text = datatable.Rows(0)("PhotoPath6").ToString
                TextBox7.Text = datatable.Rows(0)("PhotoPath7").ToString

            End If
        Else
            If cmbProjectType.SelectedIndex = -1 Then
                ProjectType = 0
            Else
                ProjectType = cmbProjectType.SelectedItem.Value
            End If

            SetDefaultValueForSQLDataSource(ProjectType)

        End If

        '========================='

        If cmbProjectFloors.Items.Count > 0 Then
            Building.Visible = True 'Show the div.
            'Building.Style.Add("display", "block")
        Else
            Building.Visible = False 'Hide the div.
            'Building.Style.Add("display", "none")
        End If

        If chklstOutbuilding.Items.Count > 0 Then
            Outbuilding.Visible = True 'Show the div.
            'Outbuilding.Style.Add("display", "block")
        Else
            Outbuilding.Visible = False 'Hide the div.
            'Outbuilding.Style.Add("display", "none")
        End If

        If cmbProjectDeeps.Items.Count > 0 Then
            Water.Visible = True 'Show the div.
            'Water.Style.Add("display", "block")
        Else
            Water.Visible = False 'Hide the div.
            'Water.Style.Add("display", "none")
        End If

    End Sub

#End Region

    Private Sub SetDefaultValueForSQLDataSource(ByVal ProjectType As String)

        SqlDataSourceReports_Floors.SelectParameters("Project_ID").DefaultValue = ProjectType
        cmbProjectFloors.DataBind()

        SqlDataSourceReports_Roofs.SelectParameters("Project_ID").DefaultValue = ProjectType
        cmbProjectRoofs.DataBind()

        SqlDataSourceReports_Tiles.SelectParameters("Project_ID").DefaultValue = ProjectType
        cmbProjectTiles.DataBind()

        SqlDataSourceReports_Project_Furniture.SelectParameters("Project_ID").DefaultValue = ProjectType
        chklstFurniture.DataBind()

        SqlDataSourceReports_Project_Outbuilding.SelectParameters("Project_ID").DefaultValue = ProjectType
        chklstOutbuilding.DataBind()

        SqlDataSourceReports_Deeps.SelectParameters("Project_ID").DefaultValue = ProjectType
        cmbProjectDeeps.DataBind()

        SqlDataSourceReports_Project_BeneficiariesCount.SelectParameters("Project_ID").DefaultValue = ProjectType
        cmbProjectBeneficiariesCount.DataBind()

    End Sub

    'Private Sub GetReportData(ByVal Project_No As String)

    '    str = " SELECT * FROM Reports_Projects_Master WHERE Project_No ='" & Project_No.ToString & "' "
    '    With cmd
    '        .CommandTimeout = 0
    '        .Connection = con
    '    End With

    '    If con.State <> ConnectionState.Open Then
    '        con.Open()
    '    End If

    '    cmd.CommandText = str
    '    cmd.Connection = con

    '    dt.SelectCommand = cmd
    '    Dim datatable As New DataTable
    '    dt.Fill(datatable)
    '    con.Close()
    '    If datatable.Rows.Count > 0 Then
    '        cmbProjectType.Value = datatable.Rows(0)("Project_ID")
    '        cmbProjectFloors.Value = ""
    '        cmbProjectRoofs.Value = ""
    '        cmbProjectTiles.Value = ""

    '        Dim rowValueItems As String = datatable.Rows(0)("Furniture_IDs")

    '        'Dim rowValueItemsAsList As List(Of String) = New List(Of String)()
    '        'rowValueItemsAsList.AddRange(rowValueItems)

    '        For Each item As ListEditItem In chklstFurniture.Items
    '            If rowValueItems.Contains(item.Value.ToString()) Then
    '                item.Selected = True
    '            End If
    '        Next item


    '        'chklstFurniture.SelectedValues = ""
    '        'chklstOutbuilding.SelectedValues = ""

    '        cmbProjectDeeps.Value = ""
    '        cmbProjectBeneficiariesCount.Value = ""

    '        txtPriority.Text = ""
    '        txtNotes.Text = ""

    '        TextBox1.Text = ""
    '        TextBox2.Text = ""
    '        TextBox3.Text = ""
    '        TextBox4.Text = ""
    '        TextBox5.Text = ""
    '        TextBox6.Text = ""
    '        TextBox7.Text = ""

    '    End If

    'End Sub

    Private Function IsExistProject(ByVal Project_No As String) As Boolean
        str = " SELECT Project_No FROM Reports_Projects_Master WHERE Project_No ='" & Project_No.ToString & "' "
        With cmd
            .CommandTimeout = 0
            .Connection = con
        End With

        If con.State <> ConnectionState.Open Then
            con.Open()
        End If

        cmd.CommandText = str
        cmd.Connection = con

        dt.SelectCommand = cmd
        Dim datatable As New DataTable
        dt.Fill(datatable)
        con.Close()
        If datatable.Rows.Count > 0 Then
            Return True
        Else
            Return False
        End If

    End Function

    Private Sub Saving()
        Try

            Dim isNew As Boolean = Not IsExistProject(Request.QueryString("project_id").ToString)

            'If NewProjectNo = "0" Then
            '    ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alert('لابد من اختيار العميل أولا');", True)
            '    Exit Sub
            'End If

            If isNew Then
                'Insert
                str = " Insert Into Reports_Projects_Master (Project_ID,Project_No,Floor_ID,Roof_ID,Furniture_IDs,Furniture_Text,Outbuilding_IDs,Outbuilding_Text,Tiles_ID,Deep_ID,Beneficiaries_Count_ID,Notes,Priority_Desc,PhotoPath1,PhotoPath2,PhotoPath3,PhotoPath4,PhotoPath5,PhotoPath6,PhotoPath7,AddedBy) VALUES (@Project_ID,@Project_No,@Floor_ID,@Roof_ID,@Furniture_IDs,@Furniture_Text,@Outbuilding_IDs,@Outbuilding_Text,@Tiles_ID,@Deep_ID,@Beneficiaries_Count_ID,@Notes,@Priority_Desc,@PhotoPath1,@PhotoPath2,@PhotoPath3,@PhotoPath4,@PhotoPath5,@PhotoPath6,@PhotoPath7,@AddedBy) "
                'str = " Insert Into Reports_Projects_Master (Project_ID,Project_No,Floor_ID,Roof_ID) VALUES ('" & cmbProjectType.Value & "','" & Request.QueryString("project_id").ToString & "','" & cmbProjectFloors.Value & "','" & cmbProjectRoofs.Value & "') "
            Else
                'Update
                str = " Update Reports_Projects_Master SET Project_ID=@Project_ID,Floor_ID=@Floor_ID,Roof_ID=@Roof_ID,Furniture_IDs=@Furniture_IDs,Furniture_Text=@Furniture_Text,Outbuilding_IDs=@Outbuilding_IDs,Outbuilding_Text=@Outbuilding_Text,Tiles_ID=@Tiles_ID,Deep_ID=@Deep_ID,Beneficiaries_Count_ID=@Beneficiaries_Count_ID,Notes=@Notes,Priority_Desc=@Priority_Desc,PhotoPath1=@PhotoPath1,PhotoPath2=@PhotoPath2,PhotoPath3=@PhotoPath3,PhotoPath4=@PhotoPath4,PhotoPath5=@PhotoPath5,PhotoPath6=@PhotoPath6,PhotoPath7=@PhotoPath7 Where Project_No = '" & Request.QueryString("project_id").ToString & "' "
            End If

            With cmd
                .CommandTimeout = 0
                .Connection = con
            End With

            If con.State <> ConnectionState.Open Then
                con.Open()
            End If

            cmd.Parameters.Clear()

            cmd.Parameters.AddWithValue("@Project_ID", IIf(cmbProjectType.Value = Nothing, DBNull.Value, cmbProjectType.Value))

            If isNew Then
                cmd.Parameters.AddWithValue("@Project_No", Request.QueryString("project_id").ToString)
            End If
            'cmd.Parameters.AddWithValue("@Floor_ID", cmbProjectFloors.Value)
            'cmd.Parameters.AddWithValue("@Roof_ID", cmbProjectRoofs.Value)
            cmd.Parameters.AddWithValue("@Floor_ID", IIf(cmbProjectFloors.Value = Nothing, DBNull.Value, cmbProjectFloors.Value))
            cmd.Parameters.AddWithValue("@Roof_ID", IIf(cmbProjectRoofs.Value = Nothing, DBNull.Value, cmbProjectRoofs.Value))

            Dim Furniture_IDs As String = ""
            Dim Furniture_Text As String = ""
            For i = 0 To chklstFurniture.Items.Count - 1
                If (chklstFurniture.Items(i).Selected) Then
                    Furniture_IDs = Furniture_IDs + chklstFurniture.Items(i).Value + ","
                    Furniture_Text = Furniture_Text + chklstFurniture.Items(i).Text + "،"
                End If
            Next
            'cmd.Parameters.AddWithValue("@Furniture_IDs", Furniture_IDs.ToString)
            cmd.Parameters.AddWithValue("@Furniture_IDs", IIf(Furniture_IDs.ToString = Nothing, DBNull.Value, Furniture_IDs.ToString))
            cmd.Parameters.AddWithValue("@Furniture_Text", IIf(Furniture_Text.ToString = Nothing, DBNull.Value, Furniture_Text.ToString))


            Dim Outbuilding_IDs As String = ""
            Dim Outbuilding_Text As String = ""
            For i = 0 To chklstOutbuilding.Items.Count - 1
                If (chklstOutbuilding.Items(i).Selected) Then
                    Outbuilding_IDs = Outbuilding_IDs + chklstOutbuilding.Items(i).Value + ","
                    Outbuilding_Text = Outbuilding_Text + chklstOutbuilding.Items(i).Text + ","
                End If
            Next
            'cmd.Parameters.AddWithValue("@Outbuilding_IDs", Outbuilding_IDs.ToString)
            cmd.Parameters.AddWithValue("@Outbuilding_IDs", IIf(Outbuilding_IDs.ToString = Nothing, DBNull.Value, Outbuilding_IDs.ToString))
            cmd.Parameters.AddWithValue("@Outbuilding_Text", IIf(Outbuilding_Text.ToString = Nothing, DBNull.Value, Outbuilding_Text.ToString))

            'cmd.Parameters.AddWithValue("@Tiles_ID", cmbProjectTiles.Value)
            cmd.Parameters.AddWithValue("@Tiles_ID", IIf(cmbProjectTiles.Value = Nothing, DBNull.Value, cmbProjectTiles.Value))

            'cmd.Parameters.AddWithValue("@Deep_ID", cmbProjectDeeps.Value)
            cmd.Parameters.AddWithValue("@Deep_ID", IIf(cmbProjectDeeps.Value = Nothing, DBNull.Value, cmbProjectDeeps.Value))

            'cmd.Parameters.AddWithValue("@Beneficiaries_Count_ID", cmbProjectBeneficiariesCount.Value)
            cmd.Parameters.AddWithValue("@Beneficiaries_Count_ID", IIf(cmbProjectBeneficiariesCount.Value = Nothing, DBNull.Value, cmbProjectBeneficiariesCount.Value))

            'cmd.Parameters.AddWithValue("@Notes", txtNotes.Text)
            cmd.Parameters.AddWithValue("@Notes", IIf(txtNotes.Text = Nothing, DBNull.Value, txtNotes.Text))

            'cmd.Parameters.AddWithValue("@Priority_Desc", txtPriority.Text)
            cmd.Parameters.AddWithValue("@Priority_Desc", IIf(txtPriority.Text = Nothing, DBNull.Value, txtPriority.Text))

            Dim logicalPath As String = TextBox1.Text
            If FileUpload1.HasFile Then
                Dim resultFileName As String = Path.ChangeExtension(Path.GetRandomFileName(), Path.GetExtension(FileUpload1.FileName))
                logicalPath = Path.Combine("~\ReportsData\", resultFileName)
                Dim physicalPath As String = MapPath(logicalPath)
                FileUpload1.SaveAs(physicalPath)
                TextBox1.Text = logicalPath
            End If
            cmd.Parameters.AddWithValue("@PhotoPath1", IIf(logicalPath = "", DBNull.Value, logicalPath))

            Dim logicalPath2 As String = TextBox2.Text
            If FileUpload2.HasFile Then
                Dim resultFileName As String = Path.ChangeExtension(Path.GetRandomFileName(), Path.GetExtension(FileUpload2.FileName))
                logicalPath2 = Path.Combine("~\ReportsData\", resultFileName)
                Dim physicalPath As String = MapPath(logicalPath2)
                FileUpload2.SaveAs(physicalPath)
                TextBox2.Text = logicalPath2
            End If
            cmd.Parameters.AddWithValue("@PhotoPath2", IIf(logicalPath2 = "", DBNull.Value, logicalPath2))

            Dim logicalPath3 As String = TextBox3.Text
            If FileUpload3.HasFile Then
                Dim resultFileName As String = Path.ChangeExtension(Path.GetRandomFileName(), Path.GetExtension(FileUpload3.FileName))
                logicalPath3 = Path.Combine("~\ReportsData\", resultFileName)
                Dim physicalPath As String = MapPath(logicalPath3)
                FileUpload3.SaveAs(physicalPath)
                TextBox3.Text = logicalPath3
            End If
            cmd.Parameters.AddWithValue("@PhotoPath3", IIf(logicalPath3 = "", DBNull.Value, logicalPath3))

            Dim logicalPath4 As String = TextBox4.Text
            If FileUpload4.HasFile Then
                Dim resultFileName As String = Path.ChangeExtension(Path.GetRandomFileName(), Path.GetExtension(FileUpload4.FileName))
                logicalPath4 = Path.Combine("~\ReportsData\", resultFileName)
                Dim physicalPath As String = MapPath(logicalPath4)
                FileUpload4.SaveAs(physicalPath)
                TextBox4.Text = logicalPath4
            End If
            cmd.Parameters.AddWithValue("@PhotoPath4", IIf(logicalPath4 = "", DBNull.Value, logicalPath4))

            Dim logicalPath5 As String = TextBox5.Text
            If FileUpload5.HasFile Then
                Dim resultFileName As String = Path.ChangeExtension(Path.GetRandomFileName(), Path.GetExtension(FileUpload5.FileName))
                logicalPath5 = Path.Combine("~\ReportsData\", resultFileName)
                Dim physicalPath As String = MapPath(logicalPath5)
                FileUpload5.SaveAs(physicalPath)
                TextBox5.Text = logicalPath5
            End If
            cmd.Parameters.AddWithValue("@PhotoPath5", IIf(logicalPath5 = "", DBNull.Value, logicalPath5))

            Dim logicalPath6 As String = TextBox6.Text
            If FileUpload6.HasFile Then
                Dim resultFileName As String = Path.ChangeExtension(Path.GetRandomFileName(), Path.GetExtension(FileUpload6.FileName))
                logicalPath6 = Path.Combine("~\ReportsData\", resultFileName)
                Dim physicalPath As String = MapPath(logicalPath6)
                FileUpload6.SaveAs(physicalPath)
                TextBox6.Text = logicalPath6
            End If
            cmd.Parameters.AddWithValue("@PhotoPath6", IIf(logicalPath6 = "", DBNull.Value, logicalPath6))

            Dim logicalPath7 As String = TextBox7.Text
            If FileUpload7.HasFile Then
                Dim resultFileName As String = Path.ChangeExtension(Path.GetRandomFileName(), Path.GetExtension(FileUpload7.FileName))
                logicalPath7 = Path.Combine("~\ReportsData\", resultFileName)
                Dim physicalPath As String = MapPath(logicalPath7)
                FileUpload7.SaveAs(physicalPath)
                TextBox7.Text = logicalPath7
            End If
            cmd.Parameters.AddWithValue("@PhotoPath7", IIf(logicalPath7 = Nothing, DBNull.Value, logicalPath7))

            If isNew Then
                cmd.Parameters.AddWithValue("@AddedBy", Session("UserName"))
            End If

            cmd.CommandText = str
            cmd.Connection = con

            cmd.ExecuteNonQuery()
            con.Close()

        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alert('" & FaultEngine.HandleException(ex).Message & "');", True)
        End Try

    End Sub

    Protected Sub btSave_Click(sender As Object, e As EventArgs) Handles btSave.Click
        Saving()
    End Sub


End Class