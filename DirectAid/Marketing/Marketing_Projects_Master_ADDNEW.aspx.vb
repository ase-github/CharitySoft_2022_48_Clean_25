Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing
Imports DevExpress.Web.ASPxCallback
Imports DevExpress.Web

Public Class Marketing_Projects_Master_ADDNEW
    Inherits System.Web.UI.Page

    Dim constr As String = ConfigurationManager.ConnectionStrings("charitysoftConnectionString").ConnectionString
    Dim con As New SqlConnection(constr)
    Dim cmd As New SqlCommand
    Dim ds As New DataSet
    Dim dt As New SqlDataAdapter
    Dim str As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If (Not IsCallback) And Not IsPostBack Then

            cmbCurrency.Value = "3"
            cmbMarketingChannel.Value = "1"

            If Not IsNothing(cmbSection.Value) Then
                FillcmbProjectTypeCombo(cmbSection.SelectedItem.Value)
                cmbProjectType.SelectedIndex = 0
            End If

            If Not IsNothing(cmbSector.Value) Then
                FillcmbCountry(cmbSector.SelectedItem.Value)
                cmbCountry.SelectedIndex = 0
            End If


            hdnProject_ID.Value = Request.QueryString("ProjectID")
            If hdnProject_ID.Value <> "" Then
                'hdnProject_ID.Value = Convert.ToByte(hdnProject_ID.Value)
                LoadProject(hdnProject_ID.Value)
            End If

        End If
    End Sub

    Private Sub LoadProject(ByVal ProjectID As Integer)
        With cmd
            .CommandTimeout = 0
            .Connection = con
        End With
        str = "Select * From VIW_Marketing_Projects_Master Where Project_ID = " & ProjectID & " "
        cmd.CommandText = str
        cmd.Connection = con
        If con.State <> ConnectionState.Open Then
            con.Open()
        End If
        dt.SelectCommand = cmd
        dt.Fill(ds)
        con.Close()

        If ds.Tables(0).Rows.Count > 0 Then

            txtProjectNo.Text = ds.Tables(0).Rows(0)("Project_No").ToString
            txtProject_Name.Text = ds.Tables(0).Rows(0)("Project_Name").ToString
            txtProject_Year.Text = ds.Tables(0).Rows(0)("Project_Year").ToString
            cmbSector.Value = ds.Tables(0).Rows(0)("Sector_ID").ToString
            '====='
            SqlDataSourceCountry.SelectParameters(0).DefaultValue = ds.Tables(0).Rows(0)("Sector_ID").ToString
            SqlDataSourceCountry.DataBind()
            cmbCountry.DataBind()
            '====='
            cmbCountry.Value = ds.Tables(0).Rows(0)("Country_ID").ToString
            '====='
            SqlDataSourceCenter.SelectParameters(0).DefaultValue = ds.Tables(0).Rows(0)("Country_ID").ToString
            SqlDataSourceCenter.DataBind()
            cmbCenter.DataBind()
            '====='
            cmbCenter.Value = ds.Tables(0).Rows(0)("Center_ID").ToString
            cmbExecutingSide.Value = ds.Tables(0).Rows(0)("ExecutingSide_ID").ToString
            txtCity.Text = ds.Tables(0).Rows(0)("City_Desc").ToString
            cmbSection.Value = ds.Tables(0).Rows(0)("Section_ID").ToString
            '====='
            SqlDataSourceProjectsTypes.SelectParameters(0).DefaultValue = ds.Tables(0).Rows(0)("Section_ID").ToString
            SqlDataSourceProjectsTypes.DataBind()
            cmbProjectType.DataBind()
            '====='
            cmbProjectType.Value = ds.Tables(0).Rows(0)("ProjectType_ID").ToString
            cmbCategory.Value = ds.Tables(0).Rows(0)("Projects_Categories").ToString
            txtRequiredCount.Text = ds.Tables(0).Rows(0)("RequiredCount").ToString
            cmbCurrency.Value = ds.Tables(0).Rows(0)("Currency_ID").ToString
            txtUnitCost.Text = ds.Tables(0).Rows(0)("UnitCost").ToString
            txtUnitCostKD.Text = ds.Tables(0).Rows(0)("UnitCostKD").ToString
            cmbStartMonth.Value = ds.Tables(0).Rows(0)("StartMonth").ToString
            txtPeriodByMonths.Text = ds.Tables(0).Rows(0)("PeriodByMonths").ToString
            txtBeneficiariesCount.Text = ds.Tables(0).Rows(0)("BeneficiariesCount").ToString
            txtBenefit_Desc.Text = ds.Tables(0).Rows(0)("Benefit_Desc").ToString
            txtProject_Desc.Text = ds.Tables(0).Rows(0)("Project_Desc").ToString
            cmbProjectConditions.Value = ds.Tables(0).Rows(0)("ProjectConditions_ID").ToString
            txtSeasonsMonths.Text = ds.Tables(0).Rows(0)("SeasonsMonths").ToString
            txtReservedCount.Text = ds.Tables(0).Rows(0)("ReservedCount").ToString
            cmbMarketingChannel.Value = ds.Tables(0).Rows(0)("Marketing_Channel").ToString

            imgFile.ImageUrl = ds.Tables(0).Rows(0)("PhotoPath").ToString
            txtNotes.Text = ds.Tables(0).Rows(0)("Notes").ToString
            ChkIsAvailable.Checked = ds.Tables(0).Rows(0)("IsAvailableShow")
            dtFromDate.Value = ds.Tables(0).Rows(0)("AvailableFrom").ToString
            dtToDate.Text = ds.Tables(0).Rows(0)("AvailableTo").ToString

            txtAddedBy.Text = ds.Tables(0).Rows(0)("AddedBy").ToString
            txtAddedDate.Text = ds.Tables(0).Rows(0)("AddedDate").ToString
            txtEditBy.Text = ds.Tables(0).Rows(0)("UpdatedBy").ToString
            txtEditDate.Text = ds.Tables(0).Rows(0)("UpdatedDate").ToString

            ChkIsOutofPlan.Checked = ds.Tables(0).Rows(0)("IsOutOfPlan")

        End If


    End Sub

    Protected Sub FillcmbProjectTypeCombo(ByVal section As String)
        If String.IsNullOrEmpty(section) Then
            Return
        End If
        SqlDataSourceProjectsTypes.SelectParameters(0).DefaultValue = section
        cmbProjectType.DataBind()
    End Sub
    Protected Sub CmbProjectType_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cmbProjectType.Callback
        FillcmbProjectTypeCombo(e.Parameter)
    End Sub

    Protected Sub FillcmbCountry(ByVal sector As String)
        If String.IsNullOrEmpty(sector) Then
            Return
        End If
        SqlDataSourceCountry.SelectParameters(0).DefaultValue = sector
        cmbCountry.DataBind()
    End Sub
    Protected Sub CmbCountry_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cmbCountry.Callback
        FillcmbCountry(e.Parameter)
    End Sub

    Protected Sub FillcmbCenter(ByVal country As String)
        If String.IsNullOrEmpty(country) Then
            Return
        End If
        SqlDataSourceCenter.SelectParameters(0).DefaultValue = country
        cmbCenter.DataBind()
    End Sub
    Protected Sub CmbCenter_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cmbCountry.Callback, cmbCenter.Callback
        FillcmbCenter(e.Parameter)
    End Sub

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click
        If FileUpload1.HasFile Then


            Directory.CreateDirectory(MapPath("~\MarketingImages\"))
            Dim logicalPath As String = Path.Combine("~\MarketingImages\", FileUpload1.FileName)
            Dim physicalPath As String = MapPath(logicalPath)

            Using original As Image = Image.FromStream(FileUpload1.FileContent)

                original.Save(physicalPath)
                original.Save("\\CHARITY-SQL\MarketingImages\" & FileUpload1.FileName)

            End Using
            imgFile.ImageUrl = logicalPath


            'If hdnProject_ID.Value <> "" Then
            '    txtProjectNo.Text = GetNewProjectNo(txtProject_Year.Text.ToString, cmbSection.SelectedItem.Value.ToString, cmbCountry.SelectedItem.Value.ToString)
            'End If



            ''FileUpload1.SaveAs(MapPath("~/MarketingImages/" + FileUpload1.FileName))
            'FileUpload1.SaveAs(("\\192.168.1.40\crux\CharitySoft\Live\MarketingImages\" + FileUpload1.FileName))
            'imgFile.ImageUrl = "\\192.168.1.40\crux\CharitySoft\Live\MarketingImages\" + FileUpload1.FileName
            ''imgFile.ImageUrl = "~/MarketingImages/" + FileUpload1.FileName
        End If
    End Sub

    Private Function GetCurrencyRate(ByVal CurrencyID As Integer) As Decimal

        If CurrencyID = 0 Then Exit Function
        With cmd
            .CommandTimeout = 0
            .Connection = con
        End With
        str = "Select exch_rate From currency_tab Where currency_code = " & CurrencyID & " "
        cmd.CommandText = str
        cmd.Connection = con
        If con.State <> ConnectionState.Open Then
            con.Open()
        End If

        dt.SelectCommand = cmd
        Dim datatable As New DataTable
        dt.Fill(datatable)
        'con.Close()

        If datatable.Rows.Count > 0 Then
            Return datatable.Rows(0)(0)
        Else
            Return 0
        End If

    End Function
    Protected Sub ASPxCallback_Save_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Save.Callback
        Saving(e)
    End Sub

    Private Sub Saving(e As DevExpress.Web.CallbackEventArgs)

        Try
            Dim Project_ID As Object
            If hdnProject_ID.Value = "" Then
                Project_ID = Nothing
            Else
                Project_ID = hdnProject_ID.Value
            End If
            e.Result = Project_ID

            Dim isNew As Boolean = (Project_ID Is Nothing)
            Dim NewProjectNo As String

            'If isNew Then
            '    NewProjectNo = GetNewProjectNo(txtProject_Year.Text.ToString, cmbCountry.SelectedItem.Value.ToString, cmbSection.SelectedItem.Value.ToString)
            'Else
            '    NewProjectNo = txtProjectNo.Text
            'End If

            NewProjectNo = txtProjectNo.Text

            If NewProjectNo = "0" Then
                e.Result = "لابد من ادخال رقم المشروع المشروع"
                Exit Sub
            End If

            If txtBenefit_Desc.Text = "" Then
                e.Result = "لابد من ادخال الاستفادة من المشروع"
                Exit Sub
            End If

            If txtProject_Desc.Text = "" Then
                e.Result = "لابد من ادخال وصف / مكونات المشروع"
                Exit Sub
            End If

            If imgFile.ImageUrl.ToString = "" Then
                e.Result = "لابد من اختيار صورة للمشروع"
                Exit Sub
            End If

            If Not IsNumeric(txtRequiredCount.Text) Then
                e.Result = "الرجاء ادخال عدد الوحدات المطلوب"
                Exit Sub
            End If

            If Not IsNumeric(txtUnitCost.Text) Then
                e.Result = "الرجاء ادخال تكلفة الوحدة بالعملة "
                Exit Sub
            End If

            Dim CurrencyRate As Decimal = GetCurrencyRate(cmbCurrency.SelectedItem.Value)
            Dim UnitCostKD As Decimal = txtUnitCost.Text * CurrencyRate
            Dim TotalUnitCost As Decimal = UnitCostKD * txtRequiredCount.Text

            If isNew Then
                'Insert
                str = " Insert Into Marketing_Projects_Master (Project_No,Project_Name,Project_Year,Sector_ID,Country_ID,ExecutingSide_ID,Center_ID,City_Desc,Section_ID,Projects_Categories,ProjectType_ID,RequiredCount,Currency_ID,UnitCost,TotalCost,UnitCostKD,TotalUnitCostKD,StartMonth,PeriodByMonths,BeneficiariesCount,Benefit_Desc,Project_Desc,ProjectConditions_ID,SeasonsMonths,PhotoPath,PhotoBinary,Notes,IsAvailableShow,AvailableFrom,AvailableTo,AddedBy,IsOutOfPlan,Marketing_Channel) VALUES (@Project_No,@Project_Name,@Project_Year,@Sector_ID,@Country_ID,@ExecutingSide_ID,@Center_ID,@City_Desc,@Section_ID,@Projects_Categories,@ProjectType_ID,@RequiredCount,@Currency_ID,@UnitCost,@TotalCost,@UnitCostKD,@TotalUnitCostKD,@StartMonth,@PeriodByMonths,@BeneficiariesCount,@Benefit_Desc,@Project_Desc,@ProjectConditions_ID,@SeasonsMonths,@PhotoPath,@PhotoBinary,@Notes,@IsAvailableShow,@AvailableFrom,@AvailableTo,@AddedBy,@IsOutOfPlan,@Marketing_Channel) "
            Else
                'Update
                str = " Update Marketing_Projects_Master Set Project_No=@Project_No, Project_Name=@Project_Name,Project_Year=@Project_Year,Sector_ID=@Sector_ID,Country_ID=@Country_ID,ExecutingSide_ID=@ExecutingSide_ID,Center_ID=@Center_ID,City_Desc=@City_Desc,Section_ID=@Section_ID,Projects_Categories=@Projects_Categories,ProjectType_ID=@ProjectType_ID,RequiredCount=@RequiredCount,Currency_ID=@Currency_ID,UnitCost=@UnitCost,TotalCost=@TotalCost,UnitCostKD=@UnitCostKD,TotalUnitCostKD=@TotalUnitCostKD,StartMonth=@StartMonth,PeriodByMonths=@PeriodByMonths,BeneficiariesCount=@BeneficiariesCount,Benefit_Desc=@Benefit_Desc,Project_Desc=@Project_Desc,ProjectConditions_ID=@ProjectConditions_ID,SeasonsMonths=@SeasonsMonths,PhotoPath=@PhotoPath,PhotoBinary=@PhotoBinary,Notes=@Notes,IsAvailableShow=@IsAvailableShow,AvailableFrom=@AvailableFrom,AvailableTo=@AvailableTo,UpdatedBy=@UpdatedBy,UpdatedDate=@UpdatedDate,IsOutOfPlan=@IsOutOfPlan,Marketing_Channel=@Marketing_Channel Where Project_ID = " & Project_ID & " "
                'Project_No=@Project_No,
            End If

            With cmd
                .CommandTimeout = 0
                .Connection = con
            End With

            Dim qualityLevel As Int64 = 10
            Dim ms As MemoryStream = Imaging.CompressImage(Image.FromFile((MapPath(imgFile.ImageUrl))), qualityLevel)

            If con.State <> ConnectionState.Open Then
                con.Open()
            End If

            cmd.Parameters.Clear()
            'If isNew Then

            'End If
            cmd.Parameters.AddWithValue("@Project_No", NewProjectNo.ToString)
            cmd.Parameters.AddWithValue("@Project_Name", txtProject_Name.Text)
            cmd.Parameters.AddWithValue("@Project_Year", txtProject_Year.Text)
            cmd.Parameters.AddWithValue("@Sector_ID", cmbSector.SelectedItem.Value)
            cmd.Parameters.AddWithValue("@Country_ID", cmbCountry.Value) 'cmbCountry.SelectedItem.Value
            cmd.Parameters.AddWithValue("@ExecutingSide_ID", cmbExecutingSide.SelectedItem.Value)
            cmd.Parameters.AddWithValue("@Center_ID", cmbCenter.Value) 'cmbCenter.SelectedItem.Value
            cmd.Parameters.AddWithValue("@City_Desc", txtCity.Text)
            cmd.Parameters.AddWithValue("@Section_ID", cmbSection.SelectedItem.Value)
            Dim Category As String
            If cmbCategory.SelectedIndex = -1 Then
                Category = ""
            Else
                Category = cmbCategory.SelectedItem.Value.ToString
            End If
            cmd.Parameters.AddWithValue("@Projects_Categories", Category.ToString)
            cmd.Parameters.AddWithValue("@ProjectType_ID", cmbProjectType.Value) 'cmbProjectType.SelectedItem.Value
            cmd.Parameters.AddWithValue("@RequiredCount", txtRequiredCount.Text)
            cmd.Parameters.AddWithValue("@Currency_ID", cmbCurrency.SelectedItem.Value)
            cmd.Parameters.AddWithValue("@UnitCost", txtUnitCost.Text)
            cmd.Parameters.AddWithValue("@TotalCost", (Val(txtRequiredCount.Text) * Val(txtUnitCost.Text)))
            cmd.Parameters.AddWithValue("@UnitCostKD", UnitCostKD)
            cmd.Parameters.AddWithValue("@TotalUnitCostKD", TotalUnitCost)
            cmd.Parameters.AddWithValue("@Marketing_Channel", cmbMarketingChannel.SelectedItem.Value)
            Dim StartMonth As String
            If cmbStartMonth.SelectedIndex = -1 Then
                StartMonth = ""
            Else
                StartMonth = cmbStartMonth.SelectedItem.Value.ToString
            End If
            cmd.Parameters.AddWithValue("@StartMonth", StartMonth.ToString)
            cmd.Parameters.AddWithValue("@PeriodByMonths", txtPeriodByMonths.Text)
            cmd.Parameters.AddWithValue("@BeneficiariesCount", txtBeneficiariesCount.Text)
            cmd.Parameters.AddWithValue("@Benefit_Desc", txtBenefit_Desc.Text)
            cmd.Parameters.AddWithValue("@Project_Desc", txtProject_Desc.Text)
            Dim ProjectConditions As String
            If cmbProjectConditions.SelectedIndex = -1 Then
                ProjectConditions = ""
            Else
                ProjectConditions = cmbProjectConditions.SelectedItem.Value.ToString
            End If
            cmd.Parameters.AddWithValue("@ProjectConditions_ID", ProjectConditions.ToString)
            cmd.Parameters.AddWithValue("@SeasonsMonths", txtSeasonsMonths.Text)
            'cmd.Parameters.AddWithValue("@ReservedCount", txtReservedCount.Text)
            cmd.Parameters.AddWithValue("@PhotoPath", imgFile.ImageUrl.ToString)
            cmd.Parameters.AddWithValue("@PhotoBinary", ms.ToArray)
            cmd.Parameters.AddWithValue("@Notes", txtNotes.Text)
            cmd.Parameters.AddWithValue("@IsAvailableShow", ChkIsAvailable.Checked)

            Dim FromDate As Object
            If dtFromDate.Date.ToString("MM/dd/yyyy") = "01/01/0001" Then
                FromDate = DBNull.Value
            Else
                FromDate = dtFromDate.Date.ToString("MM/dd/yyyy")
            End If
            Dim ToDate As Object
            If dtToDate.Date.ToString("MM/dd/yyyy") = "01/01/0001" Then
                ToDate = DBNull.Value
            Else
                ToDate = dtToDate.Date.ToString("MM/dd/yyyy")
            End If

            cmd.Parameters.AddWithValue("@AvailableFrom", FromDate)
            cmd.Parameters.AddWithValue("@AvailableTo", ToDate)

            If isNew Then
                cmd.Parameters.AddWithValue("@AddedBy", Session("UserName"))
            Else
                cmd.Parameters.AddWithValue("@UpdatedBy", Session("UserName"))
                cmd.Parameters.AddWithValue("@UpdatedDate", Now.Date.ToString("MM/dd/yyyy"))
            End If

            cmd.Parameters.AddWithValue("@IsOutOfPlan", ChkIsOutofPlan.Checked)

            cmd.CommandText = str
            cmd.Connection = con

            cmd.ExecuteNonQuery()
            con.Close()

            e.Result = "Done"
            'e.Result = Project_ID

        Catch ex As Exception

            e.Result = FaultEngine.HandleException(ex).Message

        End Try

    End Sub

    Protected Sub ASPxButton_New_Click(sender As Object, e As EventArgs) Handles ASPxButton_New.Click

        ClearData()

    End Sub

    Private Sub ClearData()
        hdnProject_ID.Value = ""
        txtProjectNo.Text = ""
        txtProject_Name.Text = ""
        txtProject_Year.Text = ""
        cmbSector.SelectedIndex = -1
        cmbCountry.SelectedIndex = -1
        cmbExecutingSide.SelectedIndex = -1
        cmbCenter.SelectedIndex = -1
        txtCity.Text = ""
        cmbSection.SelectedIndex = -1
        cmbCategory.SelectedIndex = -1
        cmbProjectType.SelectedIndex = -1
        txtRequiredCount.Text = 1
        'cmbCurrency.SelectedIndex = -1
        cmbCurrency.Value = "3"
        cmbMarketingChannel.Value = "1"
        txtUnitCost.Text = ""
        txtUnitCostKD.Text = ""
        cmbStartMonth.SelectedIndex = -1
        txtPeriodByMonths.Text = ""
        txtBeneficiariesCount.Text = ""
        txtBenefit_Desc.Text = ""
        txtProject_Desc.Text = ""
        cmbProjectConditions.SelectedIndex = -1
        txtSeasonsMonths.Text = ""
        txtReservedCount.Text = ""
        imgFile.ImageUrl = ""
        txtNotes.Text = ""
        ChkIsAvailable.Checked = False
        dtFromDate.Text = ""
        dtToDate.Text = ""
        txtAddedBy.Text = ""
        txtAddedDate.Text = ""
        txtEditBy.Text = ""
        txtEditDate.Text = ""
        ChkIsOutofPlan.Checked = False
        Session("logicalPath") = ""

    End Sub

    Protected Sub CallBCKGenerateProjectNo_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles CallBCKGenerateProjectNo.Callback

        Dim callbackControl As ASPxCallback = TryCast(source, ASPxCallback)

        Dim rowValueItems As String() = e.Parameter.Split("|")
        If rowValueItems.Length = 1 Then
            'callbackControl.JSProperties("cpgridcmbService") = "ClearData"
            'callbackControl.JSProperties("cpItemPrice") = "ClearData"
            'callbackControl.JSProperties("cpItemTotal") = "ClearData"
            Exit Sub
        Else

            Dim Year As String = rowValueItems(0)
            Dim Country As String = rowValueItems(2)
            Dim Section As String = rowValueItems(1)

            callbackControl.JSProperties("cpNewProjectNo") = GetNewProjectNo(Year, Country, Section)

            'If Year = "" And Section = "" And Country = "" Then Exit Sub

            'str = "SELECT MAX(SUBSTR(Project_No,9)) FROM Marketing_Projects_Master WHERE Project_Year='" & Year & "' AND Section_ID=" & Section & " AND Country_ID=" & Country & " "
            'With cmd
            '    .CommandTimeout = 60
            '    .Connection = con
            '    .CommandType = CommandType.Text
            '    .CommandText = str
            'End With

            'con.Open()
            'Dim MaxSerial As Integer = cmd.ExecuteScalar()
            ''con.Close()


            'str = "SELECT Section_Dimension, ( SELECT Country_Dimension From Marketing_Countries WHERE Country_ID = " & Country & ") AS CountryDimention FROM Marketing_Sections WHERE Section_ID=" & Section & " "
            'With cmd
            '    .CommandTimeout = 60
            '    .Connection = con
            '    .CommandType = CommandType.Text
            '    .CommandText = str
            'End With
            'Dim datatable As New DataTable
            'dt.SelectCommand = cmd
            'dt.Fill(datatable)
            'con.Close()

            'If datatable.Rows.Count = 0 Then Exit Sub
            'Dim NewProjectNo As String
            'MaxSerial += 1
            'NewProjectNo = Year.ToString & datatable.Rows(0)("Section_Dimension").ToString & datatable.Rows(0)("CountryDimention").ToString & MaxSerial.ToString("0000")



        End If

    End Sub

    Private Function GetNewProjectNo(ByVal Year As String, ByVal Country As String, ByVal Section As String)

        If Year = "" And Section = "" And Country = "" Then Return 0

        'str = "SELECT MAX(SUBSTR(Project_No,9)) FROM Marketing_Projects_Master WHERE Project_Year='" & Year & "' AND Section_ID=" & Section & " AND Country_ID=" & Country & " "
        str = "SELECT ISNULL(MAX(CAST(SUBSTRING (Project_No,9,4) AS INT)), 0 ) FROM Marketing_Projects_Master WHERE Project_Year='" & Year & "' AND Section_ID=" & Section & " AND Country_ID=" & Country & " "
        With cmd
            .CommandTimeout = 60
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = str
        End With

        con.Open()
        Dim MaxSerial As Integer = cmd.ExecuteScalar()
        str = "SELECT Section_Dimension, ( SELECT Country_Dimension From Marketing_Countries WHERE Country_ID = " & Country & ") AS CountryDimention FROM Marketing_Sections WHERE Section_ID=" & Section & " "
        With cmd
            .CommandTimeout = 60
            .Connection = con
            .CommandType = CommandType.Text
            .CommandText = str
        End With
        Dim datatable As New DataTable
        dt.SelectCommand = cmd
        dt.Fill(datatable)
        con.Close()

        If datatable.Rows.Count = 0 Then Return 0
        Dim NewProjectNo As String
        MaxSerial += 1
        NewProjectNo = Year.ToString & datatable.Rows(0)("CountryDimention").ToString & datatable.Rows(0)("Section_Dimension").ToString & MaxSerial.ToString("0000")

        Return NewProjectNo

    End Function

End Class