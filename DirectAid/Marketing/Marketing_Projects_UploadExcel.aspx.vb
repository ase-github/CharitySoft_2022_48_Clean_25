Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Web
Imports System.Globalization
Imports System.IO
Imports System.IO.Path

Public Class Marketing_Projects_UploadExcel
    Inherits System.Web.UI.Page

    Dim cn As New OleDbConnection
    Dim cm As New OleDbCommand
    Dim da As New OleDbDataAdapter
    Dim dt As New DataTable
    Dim dr As OleDbDataReader

    Dim constr As String = ConfigurationManager.ConnectionStrings("charitysoftConnectionString").ConnectionString
    Dim con As New SqlConnection(constr)
    Dim cmd As New SqlCommand
    Dim ds As New DataSet
    Dim dtsql As New SqlDataAdapter
    Dim str As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btSave_Click(sender As Object, e As EventArgs) Handles btSave.Click

        With cmd
            .CommandTimeout = 0
            .Connection = con

        End With
        con.Open()
        str = "SELECT * FROM VIW_Marketing_Temp_UploadExcel WHERE UserName='" & Session("UserName") & "'"
        cmd.CommandText = str
        cmd.Connection = con
        dtsql.SelectCommand = cmd
        If con.State <> ConnectionState.Open Then
            con.Open()
        End If
        dtsql.Fill(dt)


        If dt.Rows.Count > 0 Then
            str = ""
            For i As Integer = 0 To dt.Rows.Count - 1

                str = str & " INSERT INTO Marketing_Projects_Master (Project_No,Project_Year,Sector_ID,Country_ID,ExecutingSide_ID,Center_ID,City_Desc,Section_ID,Projects_Categories,ProjectType_ID,RequiredCount,Currency_ID,UnitCost,TotalCost,UnitCostKD,TotalUnitCostKD,StartMonth,PeriodByMonths,BeneficiariesCount,Benefit_Desc,Project_Desc,ProjectConditions_ID,SeasonsMonths,Notes,AddedBy) " & _
                    " VALUES ('" & dt.Rows(i)("ProjectNo") & "',NULLIF('" & dt.Rows(i)("Project_Year") & "', ''),NULLIF('" & dt.Rows(i)("Sector_ID") & "', ''),NULLIF('" & dt.Rows(i)("Country_ID") & "', ''),NULLIF('" & dt.Rows(i)("ExecutingSide_ID") & "', ''),NULLIF('" & dt.Rows(i)("Center_ID") & "', ''),NULLIF('" & dt.Rows(i)("City") & "',''),NULLIF('" & dt.Rows(i)("Section_ID") & "',''),NULLIF('" & dt.Rows(i)("Category_ID") & "', ''),NULLIF('" & dt.Rows(i)("ProjectType_ID") & "',''),NULLIF('" & dt.Rows(i)("RequiredProjects") & "',''),NULLIF('" & dt.Rows(i)("Currency_ID") & "',''),NULLIF('" & dt.Rows(i)("UnitCost") & "',''),NULLIF('" & dt.Rows(i)("TotalUnitsCost") & "',''),NULLIF('" & dt.Rows(i)("UnitCostKD") & "',''),NULLIF('" & dt.Rows(i)("TotalUnitCostKD") & "',''),NULLIF('" & dt.Rows(i)("Month_ID") & "',''),NULLIF('" & dt.Rows(i)("PeriodByMonths") & "',''),NULLIF('" & dt.Rows(i)("BeneficiariesCount") & "',''),NULLIF('" & dt.Rows(i)("BenefitDesc") & "',''),NULLIF('" & dt.Rows(i)("ProjectDesc") & "',''),NULLIF('" & dt.Rows(i)("ProjectCondition_ID") & "',''),NULLIF('" & dt.Rows(i)("SeasonsMonths") & "',''),NULLIF('" & dt.Rows(i)("Notes") & "',''),NULLIF('" & dt.Rows(i)("UserName") & "','') ); "

                str = str & " DELETE FROM Marketing_Temp_UploadExcel WHERE ProjectNo='" & dt.Rows(i)("ProjectNo") & "' AND UserName = '" & Session("UserName") & "' ; "

            Next
            cmd.CommandText = str
            cmd.Connection = con
            cmd.ExecuteNonQuery()

            btNew_Click(sender, e)
            lblErrorsCount.Text = "تم رفع البيانات بنجاح"
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alert('تم رفع البيانات بنجاح');", True)
        Else
            If txtError.Text = "" Then
                lblErrorsCount.Text = "الرجاء اختيار ملف البيانات أولا"
                ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alert('الرجاء اختيار ملف البيانات أولا');", True)
            End If
            lblErrorsCount.Text = "الرجاء تعديل البيانات الخاطئة أولا"
            ScriptManager.RegisterStartupScript(Me, Page.GetType, "Script", "alert('الرجاء تعديل البيانات الخاطئة أولا');", True)
        End If
        con.Close()
    End Sub

    Private Sub CopyDataFromExcel_TO_TempOrphansData()
        Try

            With cmd
                .CommandTimeout = 0
                .Connection = con

            End With
            con.Open()

            str = "DELETE FROM Marketing_Temp_UploadExcel WHERE UserName='" & Session("UserName") & "'"
            cmd.CommandText = str
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            'Dim conn As New OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & FileUpload1.PostedFile.FileName & ";Extended Properties=""Excel 12.0 Xml;HDR=YES"";")
            'Dim da As New OleDbDataAdapter("SELECT * FROM [موازنة البرامج والمشاريع$]", conn)
            'Dim dt As New DataTable
            'da.Fill(dt)
           
            'Dim path As String = Server.MapPath("~/Marketing/UploadExcelFiles/" + FileUpload1.PostedFile.FileName)
            'FileUpload1.SaveAs(path)
            Dim path As String = FileUpload1.PostedFile.FileName.ToString
            cn.ConnectionString = "provider=Microsoft.ACE.OLEDB.12.0; Data Source=" & path & ";Extended Properties=Excel 8.0;"


            cm.Connection = cn
            cm.CommandType = CommandType.Text
            cm.CommandText = "SELECT * FROM [موازنة البرامج والمشاريع$]"
            cn.Open()

            dr = cm.ExecuteReader()
            Dim ErrorLog As String = ""
            Dim rowNumber1 As Integer = 0
            Dim ErrorsCount1 As Integer = 0
            While dr.Read
                'rowNumber1 = rowNumber1 + 1

                'If rowNumber1 = 1 Then

                'End If

                'If rowNumber1 > 1 Then

                If dr(1).ToString = "" Then Exit While

                If ProjectIsExist(dr(1).ToString) = True Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & "  مسجل من قبل على برنامج كركس " & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckCountry = CheckCountry(dr(2).ToString)
                If _CheckCountry <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckCountry & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckSector = CheckSector(dr(3).ToString)
                If _CheckSector <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckSector & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckExecutingSide = CheckExecutingSide(dr(4).ToString)
                If _CheckExecutingSide <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckExecutingSide & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckCenter = CheckCenter(dr(5).ToString)
                If _CheckCenter <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckCenter & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckSection = CheckSection(dr(7).ToString)
                If _CheckSection <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckSection & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckProjectType = CheckProjectType(dr(8).ToString)
                If _CheckProjectType <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckProjectType & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckProjectCategory = CheckProjectCategory(dr(9).ToString)
                If _CheckProjectCategory <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckProjectCategory & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckRequiredProjects = CheckRequiredProjects(dr(10).ToString)
                If _CheckRequiredProjects <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckRequiredProjects & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckUnitCost = CheckUnitCost(dr(11).ToString)
                If _CheckUnitCost <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckUnitCost & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckTotalUnitCost = CheckTotalUnitCost(dr(12).ToString)
                If _CheckTotalUnitCost <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckTotalUnitCost & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckStartMonth = CheckStartMonth(dr(13).ToString)
                If _CheckStartMonth <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckStartMonth & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckBeneficiariesCount = CheckBeneficiariesCount(dr(15).ToString)
                If _CheckBeneficiariesCount <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckBeneficiariesCount & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckProjectConditions = CheckProjectConditions(dr(16).ToString)
                If _CheckProjectConditions <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckProjectConditions & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckBenefit_Desc = CheckBenefit_Desc(dr(19).ToString)
                If _CheckBenefit_Desc <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckBenefit_Desc & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckProject_Desc = CheckProject_Desc(dr(20).ToString)
                If _CheckProject_Desc <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckProject_Desc & vbCrLf
                    ErrorsCount1 += 1
                End If

                Dim _CheckYear = CheckYear(dr(21).ToString)
                If _CheckYear <> "Pass" Then
                    ErrorLog = ErrorLog & " المشروع رقم :" & dr(1) & _CheckYear & vbCrLf
                    ErrorsCount1 += 1
                End If



                'If ProjectIsExist(dr(1).ToString) = True And _CheckCountry = "Pass" _
                If ProjectIsExist(dr(1).ToString) = False And _CheckCountry = "Pass" _
                    And _CheckSector = "Pass" And _CheckExecutingSide = "Pass" _
                    And _CheckCenter = "Pass" And _CheckSection = "Pass" _
                    And _CheckProjectType = "Pass" And _CheckProjectCategory = "Pass" _
                    And _CheckRequiredProjects = "Pass" And _CheckUnitCost = "Pass" _
                    And _CheckTotalUnitCost = "Pass" And _CheckStartMonth = "Pass" _
                    And _CheckBeneficiariesCount = "Pass" And _CheckProjectConditions = "Pass" _
                    And _CheckBenefit_Desc = "Pass" And _CheckProject_Desc = "Pass" _
                    And _CheckYear = "Pass" Then

                    Dim str As String
                    str = " INSERT INTO Marketing_Temp_UploadExcel (Serial,ProjectNo,Country,Sector,ExecutingSides,Center,City,Section,ProjectType,ProjectCategory,RequiredProjects,UnitCost,TotalUnitsCost,StartMonth,PeriodByMonths,BeneficiariesCount,ProjectConditions,SeasonsMonths,Notes,BenefitDesc,ProjectDesc,Project_Year,UserName) VALUES ('" & dr(0).ToString.Trim & "','" & dr(1).ToString.Trim & "','" & dr(2).ToString.Trim & "','" & dr(3).ToString.Trim & "','" & dr(4).ToString.Trim & "','" & dr(5).ToString.Trim & "','" & dr(6).ToString.Trim & "','" & dr(7).ToString.Trim & "','" & dr(8).ToString.Trim & "','" & dr(9).ToString.Trim & "','" & dr(10).ToString.Trim & "','" & dr(11).ToString.Trim & "','" & dr(12).ToString.Trim & "','" & dr(13).ToString.Trim & "','" & dr(14).ToString.Trim & "','" & dr(15).ToString.Trim & "','" & dr(16).ToString.Trim & "','" & dr(17).ToString.Trim & "','" & dr(18).ToString.Trim & "','" & dr(19).ToString.Trim & "','" & dr(20).ToString.Trim & "','" & dr(21).ToString.Trim & "','" & Session("UserName") & "')"
                    cmd.CommandText = str
                    cmd.Connection = con
                    cmd.CommandTimeout = 0
                    cmd.ExecuteNonQuery()
                End If



                'End If

            End While

            dr.Close()
            lblErrorsCount.Text = ErrorsCount1
            If ErrorLog <> "" Then
                str = "DELETE FROM Marketing_Temp_UploadExcel WHERE UserName='" & Session("UserName") & "'"
                cmd.CommandText = str
                cmd.Connection = con
                cmd.ExecuteNonQuery()
                txtError.Text = ErrorLog
            Else
                str = "SELECT * FROM Marketing_Temp_UploadExcel WHERE UserName='" & Session("UserName") & "'"
                cmd.CommandText = str
                cmd.Connection = con
                dtsql.SelectCommand = cmd
                dtsql.Fill(dt)
                ASPxGridView1.DataSource = dt
                ASPxGridView1.DataBind()
            End If

            cn.Close()
            con.Close()

            'Label2.Text = "Done"
            btSave.Enabled = True
        Catch ex As OleDbException
            ASPxLabel1.Text = ex.Message
            'Label2.Text = "Fail"
            btSave.Enabled = False
        Finally
            cn.Close()
            con.Close()
        End Try

    End Sub

    Protected Sub btUploadExcel_Click(sender As Object, e As EventArgs) Handles btUploadExcel.Click
        btNew_Click(sender, e)
        CopyDataFromExcel_TO_TempOrphansData()
    End Sub

    Protected Sub btNew_Click(sender As Object, e As EventArgs) Handles btNew.Click
        With cmd
            .CommandTimeout = 0
            .Connection = con

        End With
        If con.State = ConnectionState.Closed Then
            con.Open()
        End If
        str = "DELETE FROM Marketing_Temp_UploadExcel WHERE UserName='" & Session("UserName") & "'"
        cmd.CommandText = str
        cmd.Connection = con
        cmd.ExecuteNonQuery()
        con.Close()
        ASPxGridView1.DataBind()
        txtError.Text = ""
        lblErrorsCount.Text = 0
        ASPxLabel1.Text = ""
    End Sub

    Private Function ProjectIsExist(ByVal _ProjectNo As String) As Boolean
        str = " SELECT Project_No FROM Marketing_Projects_Master WHERE CONVERT(nvarchar(50), Project_No)='" & _ProjectNo & "' "

        cmd.CommandText = str
        cmd.Connection = con

        Dim dd As New DataTable
        dtsql.SelectCommand = cmd
        dtsql.Fill(dd)
        If dd.Rows.Count = 0 Then
             Return False
        Else
            Return True
        End If

    End Function

    Private Function CheckCountry(ByVal _Country As String) As String
        If _Country.Trim = "" Then
            Return " لم يتم ادخال الدولة  "
            Exit Function
        End If

        str = " SELECT Country_ID FROM Marketing_Countries WHERE LTRIM(RTRIM(Country_Desc))  = N'" & _Country.Trim & "' "
        cmd.CommandText = str
        cmd.Connection = con

        Dim dd As New DataTable
        dtsql.SelectCommand = cmd
        dtsql.Fill(dd)
        If dd.Rows.Count = 0 Then
            Return " اسم الدولة غير موجود في قائمة الاختيار "
        Else
            Return "Pass"
        End If
    End Function

    Private Function CheckSector(ByVal _Sector As String) As String
        If _Sector.Trim = "" Then
            Return " لم يتم ادخال القطاع "
            Exit Function
        End If

        str = " SELECT Sector_ID FROM Marketing_Sectors WHERE LTRIM(RTRIM(Sector_Desc)) = N'" & _Sector.Trim & "' "
        cmd.CommandText = str
        cmd.Connection = con
     
        Dim dd As New DataTable
        dtsql.SelectCommand = cmd
        dtsql.Fill(dd)
        If dd.Rows.Count = 0 Then
            Return "  القطاع غير موجودة في قائمة الاختيار "
        Else
            Return "Pass"
        End If
    End Function

    Private Function CheckExecutingSide(ByVal _ExecutingSide As String) As String
        If _ExecutingSide.Trim = "" Then
            Return " لم يتم ادخال جهة التنفيذ "
            Exit Function
        End If

        str = " SELECT ExecutingSide_ID FROM Marketing_ExecutingSides WHERE LTRIM(RTRIM(ExecutindSide_Desc)) = N'" & _ExecutingSide.Trim & "' "
        cmd.CommandText = str
        cmd.Connection = con

        Dim dd As New DataTable
        dtsql.SelectCommand = cmd
        dtsql.Fill(dd)
        If dd.Rows.Count = 0 Then
            Return "  جهة التنفيذ غير موجودة في قائمة الاختيار "
        Else
            Return "Pass"
        End If


    End Function

    Private Function CheckCenter(ByVal _Center As String) As String
        If _Center.Trim = "" Then
            Return " لم يتم ادخال المركز / المكتب "
            Exit Function
        End If

        str = " SELECT Center_ID FROM Marketing_Centers WHERE LTRIM(RTRIM(Center_Desc)) = N'" & _Center.Trim & "' "
        cmd.CommandText = str
        cmd.Connection = con
      
        Dim dd As New DataTable
        dtsql.SelectCommand = cmd
        dtsql.Fill(dd)
        If dd.Rows.Count = 0 Then
            Return "  المركز / المكتب غير موجود في قائمة الاختيار "
        Else
            Return "Pass"
        End If
    End Function

    Private Function CheckSection(ByVal _Section As String) As String
        If _Section.Trim = "" Then
            Return " لم يتم ادخال القسم "
            Exit Function
        End If

        str = " SELECT Section_ID FROM Marketing_Sections WHERE LTRIM(RTRIM(Section_Desc)) = N'" & _Section.Trim & "' "
        cmd.CommandText = str
        cmd.Connection = con
     
        Dim dd As New DataTable
        dtsql.SelectCommand = cmd
        dtsql.Fill(dd)
        If dd.Rows.Count = 0 Then
            Return " القسم غير موجود في قائمة الاختيار "
        Else
            Return "Pass"
        End If
    End Function

    Private Function CheckProjectType(ByVal _ProjectType As String) As String
        If _ProjectType.Trim = "" Then
            Return " لم يتم ادخال نوع المشروع "
            Exit Function
        End If

        str = " SELECT ProjectType_ID FROM Marketing_ProjectsTypes WHERE LTRIM(RTRIM(ProjectType_Desc)) = N'" & _ProjectType.Trim & "' "
        cmd.CommandText = str
        cmd.Connection = con
      
        Dim dd As New DataTable
        dtsql.SelectCommand = cmd
        dtsql.Fill(dd)
        If dd.Rows.Count = 0 Then
            Return " نوع المشروع غير موجودة في قائمة الاختيار "
        Else
            Return "Pass"
        End If
    End Function

    Private Function CheckProjectCategory(ByVal _ProjectCategory As String) As String
        If _ProjectCategory.Trim = "" Then
            Return "Pass"
            Exit Function
        End If

        str = " SELECT Category_ID FROM Marketing_Category WHERE LTRIM(RTRIM(Category_Desc)) = N'" & _ProjectCategory.Trim & "' "
        cmd.CommandText = str
        cmd.Connection = con
        
        Dim dd As New DataTable
        dtsql.SelectCommand = cmd
        dtsql.Fill(dd)
        If dd.Rows.Count = 0 Then
            Return "  تصنيف المشروع غير موجود في قائمة الاختيار "
        Else
            Return "Pass"
        End If
    End Function

    Private Function CheckRequiredProjects(ByVal _RequiredProjects As String) As String
        If _RequiredProjects.Trim = "" Then
            Return " لابد من ادخال عدد المشاريع المطلوب "
            Exit Function
        End If

        If Not IsNumeric(_RequiredProjects.Trim) Then
            Return " عدد المشاريع المطلوب لابد أن يكون رقم "
        Else
            Return "Pass"
        End If
    End Function

    Private Function CheckUnitCost(ByVal _UnitCost As String) As String
        If _UnitCost.Trim = "" Then
            Return " لابد من ادخال تكلفة الوحدة "
            Exit Function
        End If

        If Not IsNumeric(_UnitCost) = True Then
            Return " قيمة تكلفة الوحدة غير صحيح "
        Else
            Return "Pass"
        End If

    End Function

    Private Function CheckTotalUnitCost(ByVal _TotalUnitCost As String) As String
        If _TotalUnitCost.Trim = "" Then
            Return " لابد من ادخال اجمالي تكلفة الوحدات "
            Exit Function
        End If

        If Not IsNumeric(_TotalUnitCost) = True Then
            Return " قيمة اجمالي تكلفة الوحدات غير صحيح "
        Else
            Return "Pass"
        End If
    End Function

    Private Function CheckStartMonth(ByVal _StartMonth As String) As String
        If _StartMonth.Trim = "" Then
            Return "Pass"
            Exit Function
        End If

        str = " SELECT Month_ID FROM Marketing_Months WHERE Month_Num = N'" & _StartMonth.Trim & "' "
        cmd.CommandText = str
        cmd.Connection = con
       
        Dim dd As New DataTable
        dtsql.SelectCommand = cmd
        dtsql.Fill(dd)
        If dd.Rows.Count = 0 Then
            Return "  التاريخ المطلوب للتنفيذ غير موجود في قائمة الاختيار "
        Else
            Return "Pass"
        End If
    End Function

    Private Function CheckBeneficiariesCount(ByVal _BeneficiariesCount As String) As String
        If _BeneficiariesCount.Trim = "" Then
            Return " لابد من ادخال عدد المستفيدين المطلوب "
            Exit Function
        End If

        If Not IsNumeric(_BeneficiariesCount.Trim) Then
            Return " عدد المستفيدين لابد أن يكون رقم "
        Else
            Return "Pass"
        End If

    End Function

    Private Function CheckProjectConditions(ByVal _ProjectConditions As String) As String
        If _ProjectConditions.Trim = "" Then
            Return "Pass"
            Exit Function
        End If

        str = " SELECT ProjectCondition_ID FROM Marketing_ProjectConditions WHERE LTRIM(RTRIM(ProjectCondition_Desc))  = N'" & _ProjectConditions.Trim & "' "
        cmd.CommandText = str
        cmd.Connection = con
     
        Dim dd As New DataTable
        dtsql.SelectCommand = cmd
        dtsql.Fill(dd)
        If dd.Rows.Count = 0 Then
            Return " ظروف المشروع غير موجودة في قائمة الاختيار "
        Else
            Return "Pass"
        End If
    End Function

    Private Function CheckBenefit_Desc(ByVal _Benefit_Desc As String) As String
        If _Benefit_Desc.Trim = "" Then
            Return " لابد من ادخال فوائد المشروع "
        Else
            Return "Pass"
        End If
    End Function

    Private Function CheckProject_Desc(ByVal _Project_Desc As String) As String
        If _Project_Desc.Trim = "" Then
            Return " لابد من ادخال وصف / مكونات المشروع "
        Else
            Return "Pass"
        End If
    End Function

    Private Function CheckYear(ByVal _Year As String) As String
        If _Year.Trim = "" Then
            Return " لابد من ادخال السنة "
            Exit Function
        End If

        If Not IsNumeric(_Year.Trim) Then
            Return " السنة لابد من ان تكون رقم مثال 2015 "
        Else
            Return "Pass"
        End If
    End Function

End Class