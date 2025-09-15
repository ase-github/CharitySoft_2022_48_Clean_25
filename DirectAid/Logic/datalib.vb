Imports System
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Reflection


Public Class datalib

    'Public Declare Function LoadKeyboardLayout Lib "user32" Alias "LoadKeyboardLayoutA" (ByVal pwszKLID As String, ByVal flags As Long) As Long
    'Public Const KLF_activate = &H1
    ''Dim user_nm As String
    ''Public xDataLib As New datalib
    'Public Shared user_name As String = String.Empty
    'Public Shared pass_word As String = String.Empty

    ''Public Property user_name_val() As String
    ''    Get
    ''        Return user_nm
    ''    End Get
    ''    Set(ByVal value As String)
    ''        user_nm = value
    ''    End Set
    ''End Property

    'Public Shared Con As New SqlConnection()
    ''Public Shared Trans As SqlTransaction()

    'Public Shared Sub open_con(ByVal user_nm As String, ByVal pass_wd As String)
    '    Try
    '        Dim con_str As String
    '        Dim username As String = System.Web.HttpContext.Current.Session("username")
    '        Dim password As String = System.Web.HttpContext.Current.Session("password")

    '        If (Not String.IsNullOrEmpty(username)) And (Not String.IsNullOrEmpty(password)) Then
    '            con_str = ConfigurationManager.AppSettings("Con")
    '            con_str = con_str & "UID=" & username & ";password=" & password & ";"
    '            Con = New SqlConnection(con_str)
    '            Con.Open()
    '        Else
    '            Throw New ArgumentException("Username or Password are Empty")
    '        End If


    '    Catch ex As Exception

    '    End Try
    'End Sub

    'Public Shared Sub open_con()
    '    Dim con_str As String
    '    Dim username As String = System.Web.HttpContext.Current.Session("username")
    '    Dim password As String = System.Web.HttpContext.Current.Session("password")

    '    If (Not String.IsNullOrEmpty(username)) And (Not String.IsNullOrEmpty(password)) Then
    '        con_str = ConfigurationManager.AppSettings("Con")
    '        con_str = con_str & "UID=" & username & ";password=" & password & ";"
    '        Con = New SqlConnection(con_str)
    '        Con.Open()
    '    Else
    '        Throw New ArgumentException("Username or Password are Empty")
    '    End If

    'End Sub

    'Public Shared Sub open_con(ByRef sqlTrans As SqlTransaction)
    '    Dim con_str As String
    '    con_str = ConfigurationManager.AppSettings("Con")
    '    con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '    Con = New SqlConnection(con_str)
    '    Con.Open()
    '    sqlTrans = Con.BeginTransaction()
    'End Sub

    'Public Shared Sub close_con()
    '    If Con Is Nothing Then
    '        Con = Nothing
    '    Else
    '        If Con.State = ConnectionState.Open Then
    '            Con.Close()
    '            Con = Nothing
    '        End If
    '    End If
    'End Sub

    'Public Shared Sub Populate_DDL(ByVal sqlCommand As String, ByVal dropdownlist As DropDownList)

    '    'Dim Con As New SqlConnection()
    '    'Dim con_str As String

    '    'con_str = ConfigurationManager.AppSettings("Con")
    '    'con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '    'Con = New SqlConnection(con_str)
    '    'Con.Open()
    '    If String.IsNullOrWhiteSpace(user_name) Or String.IsNullOrWhiteSpace(pass_word) Then
    '        open_con("sisdbreader", "pass@word1")
    '    Else
    '        open_con()
    '    End If


    '    'dropdownlist.Items.Clear()
    '    Using (Con)
    '        Dim command As New SqlCommand
    '        command.Connection = Con
    '        command.CommandText = sqlCommand
    '        command.CommandType = CommandType.Text
    '        Dim dr As SqlDataReader = command.ExecuteReader
    '        Using (dr)
    '            While dr.Read
    '                'Create List from the Text and Value from the Database Table and add the Item to the DropDownList
    '                Dim listItem As New ListItem
    '                listItem.Text = IIf(IsDBNull(dr(1)), "", dr(1))
    '                listItem.Value = dr(0).ToString
    '                dropdownlist.Items.Add(listItem)
    '            End While

    '            dr.Close()
    '            dr = Nothing
    '        End Using
    '        close_con()
    '    End Using

    'End Sub

    'Public Shared Sub PopulateReportsDDL(ByVal sqlCommand As String, ByVal dropdownlist As DropDownList)

    '    'Dim Con As New SqlConnection()
    '    'Dim con_str As String

    '    'Add Empty Item to the report's filters
    '    Dim emptyListItem As New ListItem
    '    emptyListItem.Value = -1
    '    emptyListItem.Text = "---------"
    '    dropdownlist.Items.Add(emptyListItem)
    '    open_con()

    '    Using (Con)
    '        Dim command As New SqlCommand
    '        command.Connection = Con
    '        command.CommandText = sqlCommand
    '        command.CommandType = CommandType.Text
    '        Dim dr As SqlDataReader = command.ExecuteReader
    '        Using (dr)
    '            While dr.Read
    '                'Create List from the Text and Value from the Database Table and add the Item to the DropDownList
    '                Dim listItem As New ListItem
    '                listItem.Text = IIf(IsDBNull(dr(1)), "", dr(1))
    '                listItem.Value = dr(0).ToString
    '                dropdownlist.Items.Add(listItem)
    '            End While

    '            dr.Close()
    '            dr = Nothing
    '        End Using
    '        close_con()
    '    End Using

    'End Sub

    Public Shared Sub LockField(ByVal control As TextBox)

        control.Enabled = False
        'control.BackColor = Drawing.Color.LightYellow
        'control.ForeColor = Drawing.Color.Navy

    End Sub

    Public Shared Sub UnLockField(ByVal control As TextBox)

        control.Enabled = True
        'control.BackColor = Drawing.Color.White

    End Sub

    ''' <summary>
    ''' Convert Checkbox value to 1 for check 2 for unchecked.
    ''' </summary>
    ''' <param name="checkBox">The check box control name.</param><returns></returns>
    Public Shared Function CheckBoxValue(ByVal checkBox As CheckBox) As Byte
        Dim value As Byte
        If checkBox.Checked Then
            value = 1
            Return value
        ElseIf Not checkBox.Checked Then
            value = 2
            Return value
        Else
            value = 0
            Return value 'For Catching Error
        End If

    End Function

    'Public Shared Function FormatDate(ByVal textbox As TextBox) As String

    '    Dim DateForm As New System.Globalization.CultureInfo("ar-KW", True)

    '    Try
    '        If String.IsNullOrWhiteSpace(textbox.Text) Then
    '            Return Format(DateTime.Parse("1900/01/01 12:00 PM", DateForm), "yyyy/MM/dd hh:mm tt")
    '        Else
    '            Return Format(DateTime.Parse(textbox.Text, DateForm), "yyyy/MM/dd")
    '        End If
    '    Catch ex As Exception

    '    End Try

    'End Function

    Public Shared Sub ClearForm(ByVal container As Control)
        Dim control As Control
        For Each control In container.Controls
            If (control.ID <> "txt_user_id") Or (control.ID <> "ddlLanguage") Then
                clearcontrol(control)
                If control.HasControls() Then
                    ClearForm(control)
                End If
            End If
        Next
    End Sub

    Public Shared Sub ClearControl(ByRef control As Control)
        Select Case control.GetType.Name
            Case "TextBox"
                CType(control, TextBox).Text = ""
            Case "DropDownList"

                Try
                    If CType(control, DropDownList).SelectedIndex = -1 Then
                        CType(control, DropDownList).SelectedIndex = -1
                    Else
                        CType(control, DropDownList).SelectedIndex = 0
                    End If
                Catch ex As Exception

                End Try

            Case "CheckBox"
                If CType(control, CheckBox).Checked Then
                    CType(control, CheckBox).Checked = False

                End If
            Case "GridView"
                CType(control, GridView).DataSource = Nothing
                CType(control, GridView).DataBind()
        End Select
    End Sub

    

    'Public Shared Function ExecSp(ByVal TxtSpSQL As String, ByVal MyCmdType As CommandType, ByVal ParamArray ParamsVal() As Object) As Int32

    '    Dim Cmd As SqlCommand
    '    'Dim Trans As SqlTransaction
    '    Dim LstParam As Int32
    '    Dim sOutPut As Int32

    '    'Dim Con As New SqlConnection()
    '    'Dim con_str As String
    '    'con_str = ConfigurationManager.AppSettings("Con")
    '    'con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '    'Con = New SqlConnection(con_str)
    '    'Con.Open()

    '    'open_con(Trans)
    '    open_con()

    '    Cmd = New SqlCommand
    '    Cmd.CommandText = TxtSpSQL
    '    Cmd.CommandType = MyCmdType
    '    'Cmd.Transaction = Trans
    '    Cmd.Connection = Con
    '    Try
    '        SqlCommandBuilder.DeriveParameters(Cmd)

    '        Dim x As Short
    '        For x = 0 To CType(ParamsVal.Length - 1, Int16)
    '            Cmd.Parameters(x + 1).Value = ParamsVal(x)
    '        Next

    '        Cmd.ExecuteNonQuery()

    '        'Get the last passed parameter, to return auto generated Student ID 
    '        LstParam = CType(Cmd.Parameters.Count - 1, Int32)


    '        If MyCmdType = CommandType.Text Then
    '            sOutPut = 0
    '        Else
    '            If Cmd.Parameters(LstParam).Direction = _
    '               ParameterDirection.InputOutput Or _
    '               Cmd.Parameters(LstParam).Direction = _
    '               ParameterDirection.ReturnValue Then
    '                sOutPut = CType(Cmd.Parameters(LstParam).Value, Int32)
    '            Else
    '                sOutPut = 0
    '            End If
    '        End If

    '        'Throw New Exception

    '        'Trans.Commit()

    '        Cmd = Nothing
    '        close_con()
    '        Return sOutPut
    '    Catch ex As SqlException
    '        Return -1
    '    End Try


    'End Function


    'Public Shared Function ExecSp_olld(ByVal TxtSpSQL As String, ByVal MyCmdType As CommandType, ByVal ParamArray ParamsVal() As Object) As Int32



    '    Dim Cmd As SqlCommand
    '    Dim LstParam As Int32
    '    Dim sOutPut As Int32

    '    'Dim Con As New SqlConnection()
    '    'Dim con_str As String
    '    'con_str = ConfigurationManager.AppSettings("Con")
    '    'con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '    'Con = New SqlConnection(con_str)
    '    'Con.Open()

    '    open_con()

    '    Cmd = New SqlCommand
    '    Cmd.CommandText = TxtSpSQL
    '    Cmd.CommandType = MyCmdType
    '    Cmd.Connection = Con

    '    SqlCommandBuilder.DeriveParameters(Cmd)

    '    Dim x As Short
    '    For x = 0 To CType(ParamsVal.Length - 1, Int16)
    '        Cmd.Parameters(x + 1).Value = ParamsVal(x)
    '    Next

    '    'Cmd.ExecuteNonQuery()

    '    'Get the last passed parameter, to return auto generated Student ID 
    '    LstParam = CType(Cmd.Parameters.Count - 1, Int32)


    '    If MyCmdType = CommandType.Text Then
    '        sOutPut = 0
    '    Else
    '        If Cmd.Parameters(LstParam).Direction = _
    '           ParameterDirection.InputOutput Or _
    '           Cmd.Parameters(LstParam).Direction = _
    '           ParameterDirection.ReturnValue Then
    '            sOutPut = CType(Cmd.Parameters(LstParam).Value, Int32)
    '        Else
    '            sOutPut = 0
    '        End If
    '    End If

    '    Cmd = Nothing
    '    close_con()
    '    Return sOutPut

    'End Function

    'Public Shared Function ExecSp_ollllld(ByVal TxtSpSQL As String, ByVal MyCmdType As CommandType, ByVal ParamArray ParamsVal() As Object) As Int32

    '    Dim Cmd As SqlCommand
    '    Dim LstParam As Int32
    '    Dim sOutPut As Int32

    '    'Dim Con As New SqlConnection()
    '    'Dim con_str As String
    '    'con_str = ConfigurationManager.AppSettings("Con")
    '    'con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '    'Con = New SqlConnection(con_str)
    '    'Con.Open()

    '    open_con()
    '    Cmd = New SqlCommand
    '    Cmd.CommandText = TxtSpSQL
    '    Cmd.CommandType = MyCmdType
    '    Cmd.Connection = Con

    '    SqlCommandBuilder.DeriveParameters(Cmd)

    '    Dim x As Short
    '    For x = 0 To CType(ParamsVal.Length - 1, Int16)
    '        Cmd.Parameters(x + 1).Value = ParamsVal(x)
    '    Next

    '    Cmd.ExecuteNonQuery()

    '    'Get the last passed parameter, to return auto generated Student ID 
    '    LstParam = CType(Cmd.Parameters.Count - 1, Int32)


    '    If MyCmdType = CommandType.Text Then
    '        sOutPut = 0
    '    Else
    '        If Cmd.Parameters(LstParam).Direction = _
    '            ParameterDirection.InputOutput Or _
    '            Cmd.Parameters(LstParam).Direction = _
    '            ParameterDirection.ReturnValue Then
    '            sOutPut = CType(Cmd.Parameters(LstParam).Value, Int32)
    '        Else
    '            sOutPut = 0
    '        End If
    '    End If

    '    Cmd = Nothing
    '    close_con()

    '    Return sOutPut
    'End Function

    'Public Shared Function ExecuteDR(ByVal sqlCommand As String) As SqlDataReader


    '    'Dim Con As New SqlConnection()
    '    'Dim con_str As String
    '    'con_str = ConfigurationManager.AppSettings("Con")
    '    'con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '    'Con = New SqlConnection(con_str)
    '    'Con.Open()

    '    open_con()

    '    Dim command As New SqlCommand
    '    command.Connection = Con
    '    command.CommandText = sqlCommand
    '    command.CommandType = CommandType.Text

    '    Dim dr As SqlDataReader = command.ExecuteReader
    '    command = Nothing
    '    Return dr

    'End Function

    'Public Shared Function ExecuteDR_SP(ByVal SP_STR_Name As String, ByVal MyCmdType As CommandType, ByVal ParamArray ParamsVal() As Object) As SqlDataReader
    '    Dim LstParam As Int32
    '    Dim sOutPut As Int32

    '    'Dim Con As New SqlConnection()
    '    'Dim con_str As String
    '    'con_str = ConfigurationManager.AppSettings("Con")
    '    'con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '    'Con = New SqlConnection(con_str)
    '    'Con.Open()

    '    open_con()

    '    Dim command As New SqlCommand
    '    command.Connection = Con
    '    command.CommandText = SP_STR_Name
    '    command.CommandType = MyCmdType

    '    SqlCommandBuilder.DeriveParameters(command)

    '    Dim x As Short
    '    For x = 0 To CType(ParamsVal.Length - 1, Int16)
    '        command.Parameters(x + 1).Value = ParamsVal(x)
    '    Next

    '    command.ExecuteNonQuery()

    '    'Get the last passed parameter, to return auto generated Student ID 
    '    LstParam = CType(command.Parameters.Count - 1, Int32)


    '    If MyCmdType = CommandType.Text Then
    '        sOutPut = 0
    '    Else
    '        If command.Parameters(LstParam).Direction = _
    '            ParameterDirection.InputOutput Or _
    '            command.Parameters(LstParam).Direction = _
    '            ParameterDirection.ReturnValue Then
    '            sOutPut = CType(command.Parameters(LstParam).Value, Int32)
    '        Else
    '            sOutPut = 0
    '        End If
    '    End If

    '    Dim dr As SqlDataReader = command.ExecuteReader
    '    command = Nothing
    '    Return dr


    'End Function
    'Sub fill_combo_loop(ByVal sql_1 As String, ByVal cmb As DropDownList, ByVal curr_con As SqlConnection)
    '    Dim com As SqlCommand
    '    Dim DR As SqlDataReader
    '    '----------------------
    '    com = New SqlCommand()
    '    com.Connection = curr_con
    '    com.CommandType = CommandType.Text
    '    com.CommandText = sql_1

    '    DR = com.ExecuteReader
    '    Dim i As Integer
    '    i = 0
    '    cmb.ClearSelection()
    '    Do While DR.Read
    '        cmb.Items.Add(DR(1))
    '        cmb.Items.Item(i).Value = DR(0)
    '        i = i + 1
    '    Loop
    '    cmb.Items.Add("----------")
    '    cmb.Items(i).Value = -1
    '    DR.Close()
    '    com = Nothing
    '    curr_con.Close()
    '    curr_con = Nothing
    'End Sub

    'Public Shared Function ExecDataSetSp(ByVal TxtSpSQL As String, _
    '                       ByVal MyCmdType As CommandType, _
    '                       ByVal ParamArray ParamsVal() As Object) As DataSet



    '    Dim ds As New DataSet
    '    Try

    '        Dim Con As New SqlConnection()
    '        Dim con_str As String
    '        con_str = ConfigurationManager.AppSettings("Con")
    '        con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '        Con = New SqlConnection(con_str)
    '        Con.Open()

    '        open_con()

    '        Dim command As New SqlCommand
    '        command.Connection = Con
    '        command.CommandText = TxtSpSQL
    '        command.CommandType = MyCmdType

    '        command = New SqlCommand
    '        command.CommandText = TxtSpSQL
    '        command.CommandType = MyCmdType
    '        command.Connection = Con

    '        Dim da As New SqlDataAdapter(command)

    '        Dim CmdBuilder = New SqlCommandBuilder
    '        SqlCommandBuilder.DeriveParameters(command)

    '        Dim x As Short
    '        For x = 0 To CType(ParamsVal.Length - 1, Int16)
    '            command.Parameters(x + 1).Value = ParamsVal(x)
    '        Next

    '        da.SelectCommand = command

    '        da.Fill(ds)

    '        command = Nothing
    '        close_con()
    '        Return ds
    '    Catch ex As NullReferenceException
    '        MsgBox(ex.Message & ex.InnerException.ToString, MsgBoxStyle.Exclamation)
    '        Return ds
    '    End Try
    'End Function

    'Public Shared Function GetMyData(ByVal MyConName As String, _
    '              ByVal MyQuery As String) As DataSet

    '    'Dim Con As New SqlConnection()
    '    'Dim con_str As String

    '    Dim ds As New DataSet
    '    Dim da As SqlDataAdapter

    '    'con_str = ConfigurationManager.AppSettings("Con")
    '    'con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '    'Con = New SqlConnection(con_str)
    '    'Con.Open()

    '    open_con()

    '    da = New SqlDataAdapter(MyQuery, Con)
    '    da.Fill(ds)
    '    da = Nothing
    '    close_con()

    '    Return ds
    'End Function

    'Public Shared Function GetApplicationVersion() As String
    '    'Return "1.1.5." & DateTime.UtcNow.ToString("ddMMyyyy")
    '    Return Assembly.GetExecutingAssembly().GetName().Version.ToString() '& " " & DateTime.UtcNow.ToString("ddMMyyyy hhmm")
    'End Function

    'Public Shared Function Populate(ByVal sqlCommand As String) As DataTable

    '    'Dim Con As New SqlConnection()
    '    'Dim con_str As String

    '    'con_str = ConfigurationManager.AppSettings("Con")
    '    'con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '    'Con = New SqlConnection(con_str)
    '    'Con.Open()

    '    open_con()

    '    Dim command As New SqlCommand(sqlCommand, Con)
    '    Dim adapter As New SqlDataAdapter()
    '    adapter.SelectCommand = command
    '    Dim table As New DataTable()
    '    table.Locale = System.Globalization.CultureInfo.InvariantCulture
    '    adapter.Fill(table)
    '    command = Nothing
    '    close_con()
    '    Return table

    'End Function

    'Public Shared Function FormatTime(ByVal textbox As TextBox) As String

    '    Dim TimeForm As New System.Globalization.CultureInfo("ar-KW", True)

    '    If String.IsNullOrWhiteSpace(textbox.Text) Then
    '        Return Format(DateTime.Parse("1900/01/01 12:00 PM", TimeForm), "yyyy/MM/dd hh:mm tt")
    '    Else
    '        Return Format(DateTime.Parse("1900/01/01 " & textbox.Text, TimeForm), "yyyy/MM/dd hh:mm tt")
    '    End If

    'End Function


    'Public Shared Sub PopulateLB(ByVal sqlCommand As String, ByVal listBox As ListBox)

    '    'Dim Con As New SqlConnection()
    '    'Dim con_str As String

    '    'con_str = ConfigurationManager.AppSettings("Con")
    '    'con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '    'Con = New SqlConnection(con_str)

    '    open_con()
    '    Using (Con)
    '        'Con.Open()
    '        Dim command As New SqlCommand
    '        command.Connection = Con
    '        command.CommandText = sqlCommand
    '        command.CommandType = CommandType.Text
    '        Dim dr As SqlDataReader = command.ExecuteReader
    '        Using (dr)
    '            While dr.Read
    '                'Create List from the Text and Value from the Database Table and add the Item to the DropDownList
    '                Dim listItem As New ListItem
    '                listItem.Text = IIf(IsDBNull(dr(1)), "", dr(1))
    '                listItem.Value = dr(0).ToString
    '                listBox.Items.Add(listItem)
    '            End While
    '            dr.Close()
    '        End Using

    '        close_con()
    '    End Using
    'End Sub

    'Public Shared Function ExecuteSPDS(ByVal TxtSpSQL As String, ByVal MyCmdType As CommandType, ByVal ParamArray ParamsVal() As Object) As DataSet

    '    'Dim Con As SqlConnection
    '    Dim Cmd As SqlCommand
    '    Dim ds As New DataSet
    '    'Dim connectionString As String

    '    Try
    '        'connectionString = ConfigurationManager.AppSettings("Con")
    '        'connectionString = connectionString & "UID=" & user_name & ";password=" & pass_word & ";"
    '        'Con = New SqlConnection(connectionString)
    '        'Con.Open()

    '        open_con()
    '        Cmd = New SqlCommand
    '        Cmd.CommandText = TxtSpSQL
    '        Cmd.CommandType = MyCmdType
    '        Cmd.Connection = Con

    '        Dim da As New SqlDataAdapter(Cmd)

    '        Dim CmdBuilder = New SqlCommandBuilder
    '        SqlCommandBuilder.DeriveParameters(Cmd)

    '        Dim x As Short
    '        For x = 0 To CType(ParamsVal.Length - 1, Int16)
    '            Cmd.Parameters(x + 1).Value = ParamsVal(x)
    '        Next

    '        da.SelectCommand = Cmd

    '        da.Fill(ds)

    '        Cmd = Nothing
    '        close_con()

    '        Return ds
    '    Catch ex As NullReferenceException
    '        MsgBox(ex.Message & ex.InnerException.ToString, MsgBoxStyle.Exclamation)
    '        Return ds
    '    End Try
    'End Function

    'Public Shared Function ExecuteDrScalar(ByVal sqlCommand As String) As Object

    '    open_con()

    '    Dim command As New SqlCommand
    '    command.Connection = Con
    '    command.CommandText = sqlCommand
    '    command.CommandType = CommandType.Text

    '    Dim dr As Object = command.ExecuteScalar
    '    command = Nothing
    '    Return dr

    'End Function

    'Public Shared Sub InvalidTextboxState(ByVal textboxControl As System.Web.UI.WebControls.TextBox)
    '    textboxControl.BackColor = Drawing.Color.Red
    '    textboxControl.BorderColor = Drawing.Color.Tomato
    '    textboxControl.BorderWidth = "1px"
    '    textboxControl.BorderStyle = BorderStyle.Solid
    'End Sub

    'Public Shared Sub InvalidDropDownListState(ByVal dropdownlistControl As System.Web.UI.WebControls.TextBox)
    '    dropdownlistControl.BackColor = Drawing.Color.Red
    '    dropdownlistControl.BorderColor = Drawing.Color.Tomato
    '    dropdownlistControl.BorderWidth = "1px"
    '    dropdownlistControl.BorderStyle = BorderStyle.Solid
    'End Sub

    'Public Shared Function ExecSp_Nested(ByVal TxtSpSQL As String) As Int32

    '    Dim Cmd As SqlCommand

    '    Dim sOutPut As Int32
    '    open_con()

    '    Cmd = New SqlCommand
    '    Cmd.CommandText = TxtSpSQL
    '    Cmd.CommandType = CommandType.Text
    '    Cmd.Connection = Con


    '    Cmd.ExecuteNonQuery()

    '    sOutPut = 0

    '    Cmd = Nothing
    '    close_con()
    '    Return sOutPut

    'End Function

    'Public Shared Function ExecDataSetSp(ByVal TxtSpSQL As String, _
    '                      ByVal MyCmdType As CommandType, _
    '                      ByVal ParamArray ParamsVal() As Object) As DataSet



    '    Dim ds As New DataSet
    '    Try

    '        'Dim Con As New SqlConnection()
    '        'Dim con_str As String
    '        'con_str = ConfigurationManager.AppSettings("Con")
    '        'con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '        'Con = New SqlConnection(con_str)
    '        'Con.Open()

    '        open_con()

    '        Dim command As New SqlCommand
    '        command.Connection = Con
    '        command.CommandText = TxtSpSQL
    '        command.CommandType = MyCmdType

    '        command = New SqlCommand
    '        command.CommandText = TxtSpSQL
    '        command.CommandType = MyCmdType
    '        command.Connection = Con

    '        Dim da As New SqlDataAdapter(command)

    '        Dim CmdBuilder = New SqlCommandBuilder
    '        SqlCommandBuilder.DeriveParameters(command)

    '        Dim x As Short
    '        For x = 0 To CType(ParamsVal.Length - 1, Int16)
    '            command.Parameters(x + 1).Value = ParamsVal(x)
    '        Next
    '        da.SelectCommand = command

    '        da.Fill(ds)

    '        command = Nothing
    '        close_con()
    '        Return ds
    '    Catch ex As NullReferenceException
    '        MsgBox(ex.Message & ex.InnerException.ToString, MsgBoxStyle.Exclamation)
    '        Return ds
    '    End Try
    'End Function


    'Public Shared Function ExecuteDR_SP(ByVal SP_STR_Name As String, ByVal MyCmdType As CommandType, ByVal ParamArray ParamsVal() As Object) As SqlDataReader
    '    Dim LstParam As Int32
    '    Dim sOutPut As Int32

    '    'Dim Con As New SqlConnection()
    '    'Dim con_str As String
    '    'con_str = ConfigurationManager.AppSettings("Con")
    '    'con_str = con_str & "UID=" & user_name & ";password=" & pass_word & ";"
    '    'Con = New SqlConnection(con_str)
    '    'Con.Open()

    '    open_con()

    '    Dim command As New SqlCommand
    '    command.Connection = Con
    '    command.CommandText = SP_STR_Name
    '    command.CommandType = MyCmdType

    '    SqlCommandBuilder.DeriveParameters(command)

    '    Dim x As Short
    '    For x = 0 To CType(ParamsVal.Length - 1, Int16)
    '        command.Parameters(x + 1).Value = ParamsVal(x)
    '    Next

    '    command.ExecuteNonQuery()

    '    'Get the last passed parameter, to return auto generated Student ID 
    '    LstParam = CType(command.Parameters.Count - 1, Int32)


    '    If MyCmdType = CommandType.Text Then
    '        sOutPut = 0
    '    Else
    '        If command.Parameters(LstParam).Direction = _
    '            ParameterDirection.InputOutput Or _
    '            command.Parameters(LstParam).Direction = _
    '            ParameterDirection.ReturnValue Then
    '            sOutPut = CType(command.Parameters(LstParam).Value, Int32)
    '        Else
    '            sOutPut = 0
    '        End If
    '    End If

    '    Dim dr As SqlDataReader = command.ExecuteReader
    '    command = Nothing
    '    Return dr
    'End Function
    'Public Shared Function Populate_DR(ByVal UsrID As String, ByVal UsrPwd As String, _
    '                      ByVal sqlCommand As String) As SqlDataReader
    '    open_con()
    '    Dim command As New SqlCommand
    '    command.Connection = Con
    '    command.CommandText = sqlCommand
    '    command.CommandType = CommandType.Text
    '    Dim reader As SqlDataReader = command.ExecuteReader()
    '    Return reader
    'End Function

    ' ''' <summary>
    ' ''' Gets the academic year status.
    ' ''' </summary>
    ' ''' <param name="academicYear">The academic year.</param><returns></returns>
    'Public Shared Function GetAcademicYearStatus(ByVal academicYear As String, ByVal schoolCode As String) As Int32
    '    If (Not String.IsNullOrEmpty(academicYear)) Then
    '        Dim strGetYearStatus As String = "SELECT year_status FROM academic_year WHERE acad_year_code = " & academicYear & " AND school_code = " & schoolCode
    '        Dim academicYearDS As DataSet

    '        academicYearDS = GetMyData("siscrux", strGetYearStatus)

    '        If (academicYearDS.Tables(0).Rows.Count > 0) Then

    '            Return Convert.ToInt32(academicYearDS.Tables(0).Rows(0).Item(0))

    '        End If

    '    End If

    'End Function

    'Public Shared Function SpellNumber(ByVal MyNumber As String) As String
    '    Dim Dollars As String = ""
    '    Dim Cents As String = ""
    '    Dim Temp As String = ""
    '    Dim DecimalPlace, Count As Integer
    '    Dim Place(9) As String
    '    Place(2) = " Thousand "
    '    Place(3) = " Million "
    '    Place(4) = " Billion "
    '    Place(5) = " Trillion "
    '    ' String representation of amount.
    '    MyNumber = Trim(Str(MyNumber))
    '    ' Position of decimal place 0 if none.
    '    DecimalPlace = InStr(MyNumber, ".")
    '    ' Convert cents and set MyNumber to dollar amount.
    '    If DecimalPlace > 0 Then
    '        Cents = GetTens(Left(Mid(MyNumber, DecimalPlace + 1) & _
    '        "00", 2))
    '        MyNumber = Trim(Left(MyNumber, DecimalPlace - 1))
    '    End If
    '    Count = 1
    '    Do While MyNumber <> ""
    '        Temp = GetHundreds(Right(MyNumber, 3))
    '        If Temp <> "" Then Dollars = Temp & Place(Count) & Dollars
    '        If Len(MyNumber) > 3 Then
    '            MyNumber = Left(MyNumber, Len(MyNumber) - 3)
    '        Else
    '            MyNumber = ""
    '        End If
    '        Count = Count + 1
    '    Loop
    '    Select Case Dollars
    '        Case ""
    '            Dollars = "No Kuwaiti Dinars"
    '        Case "One"
    '            Dollars = "One Kuwaiti Dinar"
    '        Case Else
    '            Dollars = Dollars & " Kuwaiti Dinars"
    '    End Select
    '    Select Case Cents
    '        Case ""
    '            Cents = " and No Fils"
    '        Case "One"
    '            Cents = " and One Fils"
    '        Case Else
    '            Cents = " and " & Cents & " Fils"
    '    End Select
    '    SpellNumber = Dollars & Cents
    'End Function
    '' Converts a number from 100-999 into text 
    'Public Shared Function GetHundreds(ByVal MyNumber As String) As String
    '    Dim Result As String
    '    If Val(MyNumber) = 0 Then : Return "" : Exit Function : End If
    '    MyNumber = Right("000" & MyNumber, 3)
    '    ' Convert the hundreds place.
    '    If Mid(MyNumber, 1, 1) <> "0" Then
    '        Result = GetDigit(Mid(MyNumber, 1, 1)) & " Hundred "
    '    End If
    '    ' Convert the tens and ones place.
    '    If Mid(MyNumber, 2, 1) <> "0" Then
    '        Result = Result & GetTens(Mid(MyNumber, 2))
    '    Else
    '        Result = Result & GetDigit(Mid(MyNumber, 3))
    '    End If
    '    GetHundreds = Result
    'End Function
    '' Converts a number from 10 to 99 into text. 
    'Public Shared Function GetTens(ByVal TensText As String) As String
    '    Dim Result As String
    '    Result = ""           ' Null out the temporary function value.
    '    If Val(Left(TensText, 1)) = 1 Then   ' If value between 10-19...
    '        Select Case Val(TensText)
    '            Case 10 : Result = "Ten"
    '            Case 11 : Result = "Eleven"
    '            Case 12 : Result = "Twelve"
    '            Case 13 : Result = "Thirteen"
    '            Case 14 : Result = "Fourteen"
    '            Case 15 : Result = "Fifteen"
    '            Case 16 : Result = "Sixteen"
    '            Case 17 : Result = "Seventeen"
    '            Case 18 : Result = "Eighteen"
    '            Case 19 : Result = "Nineteen"
    '            Case Else
    '        End Select
    '    Else                                 ' If value between 20-99...
    '        Select Case Val(Left(TensText, 1))
    '            Case 2 : Result = "Twenty "
    '            Case 3 : Result = "Thirty "
    '            Case 4 : Result = "Forty "
    '            Case 5 : Result = "Fifty "
    '            Case 6 : Result = "Sixty "
    '            Case 7 : Result = "Seventy "
    '            Case 8 : Result = "Eighty "
    '            Case 9 : Result = "Ninety "
    '            Case Else
    '        End Select
    '        Result = Result & GetDigit _
    '        (Right(TensText, 1))  ' Retrieve ones place.
    '    End If
    '    GetTens = Result
    'End Function
    '' Converts a number from 1 to 9 into text. 
    'Public Shared Function GetDigit(ByVal Digit As String) As String
    '    Select Case Val(Digit)
    '        Case 1 : GetDigit = "One"
    '        Case 2 : GetDigit = "Two"
    '        Case 3 : GetDigit = "Three"
    '        Case 4 : GetDigit = "Four"
    '        Case 5 : GetDigit = "Five"
    '        Case 6 : GetDigit = "Six"
    '        Case 7 : GetDigit = "Seven"
    '        Case 8 : GetDigit = "Eight"
    '        Case 9 : GetDigit = "Nine"
    '        Case Else : GetDigit = ""
    '    End Select
    'End Function

    Public Shared Function FormatTime(ByVal textbox As TextBox) As String

        Dim TimeForm As New System.Globalization.CultureInfo("ar-KW", True)

        If String.IsNullOrWhiteSpace(textbox.Text) Then
            Return Format(DateTime.Parse("1900/01/01 12:00 PM", TimeForm), "yyyy/MM/dd hh:mm tt")
        Else
            Return Format(DateTime.Parse("1900/01/01 " & textbox.Text, TimeForm), "yyyy/MM/dd hh:mm tt")
        End If

    End Function

    Public Shared Function FormatDate(ByVal textbox As TextBox) As String

        Dim DateForm As New System.Globalization.CultureInfo("ar-KW", True)

        Try
            If String.IsNullOrWhiteSpace(textbox.Text) Then
                Return Format(DateTime.Parse("1900/01/01 12:00 PM", DateForm), "yyyy/MM/dd hh:mm tt")
            Else
                Return Format(DateTime.Parse(textbox.Text, DateForm), "yyyy/MM/dd")
            End If
        Catch ex As Exception

        End Try

    End Function

    Public Shared Sub clear_frm(ByVal container As Control)
        Dim control As Control
        For Each control In container.Controls
            If (control.ID <> "txt_user_id") Or (control.ID <> "ddlLanguage") Then
                clearcontrol(control)
                If control.HasControls() Then
                    clear_frm(control)
                End If
            End If
        Next
    End Sub

End Class
