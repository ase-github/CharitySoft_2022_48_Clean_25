
#Region "Imports Directives"

Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data
Imports System.Data.SqlClient

#End Region

Public Class DataAccessLibrary

#Region "Methods"

    Public Overloads Function GetMyBoolean(ByVal MyConName As String, ByVal UsrID As String, ByVal UsrPwd As String, _
                        ByVal MyQuery As String) As Boolean

        Dim Con As SqlConnection
        Dim Cmd As SqlCommand
        Dim MyReturnValue As Boolean

        Dim connectionString As String = ConfigurationManager.ConnectionStrings(MyConName).ConnectionString
        Con = New SqlConnection(connectionString & ";uid=" & UsrID & ";password=" & UsrPwd)
        Con.Open()

        Cmd = New SqlCommand(MyQuery, Con)
        MyReturnValue = Cmd.ExecuteScalar()

        Con.Close()
        Con = Nothing

        Return MyReturnValue
    End Function

    Public Overloads Function GetMyScalar(ByVal MyConName As String, ByVal UsrID As String, ByVal UsrPwd As String, _
                     ByVal MyQuery As String) As Object

        Dim Con As SqlConnection
        Dim Cmd As SqlCommand
        Dim MyReturnValue As Object

        Dim connectionString As String = ConfigurationManager.ConnectionStrings(MyConName).ConnectionString
        Con = New SqlConnection(connectionString & ";uid=" & UsrID & ";password=" & UsrPwd)
        Con.Open()

        Cmd = New SqlCommand(MyQuery, Con)
        MyReturnValue = Cmd.ExecuteScalar()

        Con.Close()
        Con = Nothing

        Return MyReturnValue
    End Function

    Public Function GetMyData(ByVal MyConName As String, ByVal UsrID As String, ByVal UsrPwd As String, _
                 ByVal MyQuery As String) As DataSet

        Dim Con As SqlConnection
        Dim ds As New DataSet
        Dim da As SqlDataAdapter

        Dim connectionString As String = ConfigurationManager.ConnectionStrings(MyConName).ConnectionString
        Con = New SqlConnection(connectionString & ";uid=" & UsrID & ";password=" & UsrPwd)

        da = New SqlDataAdapter(MyQuery, Con)
        da.Fill(ds)

        Con.Close()
        Con = Nothing

        Return ds
    End Function

    Public Function TestResultSet(ByVal MyConName As String, _
                                ByVal UsrID As String, ByVal UsrPwd As String, _
                                ByVal TxtSpSQL As String) As DataSet

        Dim Con As SqlConnection
        Dim Cmd As SqlCommand
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim connectionString As String = ConfigurationManager.ConnectionStrings(MyConName).ConnectionString

        Con = New SqlConnection(connectionString & ";uid=" & UsrID & ";password=" & UsrPwd)
        Con.Open()

        Cmd = New SqlCommand
        Cmd.CommandText = TxtSpSQL
        Cmd.CommandType = CommandType.Text
        Cmd.Connection = Con

        'Dim CmdBuilder = New SqlCommandBuilder
        'CmdBuilder.DeriveParameters(Cmd)

        'Dim x As Short
        ''For x = 0 To CType(ParamsVal.Length - 1, Int16)
        'Cmd.Parameters(0).Value = ParamsVal
        ''Next

        da = New SqlDataAdapter(Cmd)
        da.Fill(ds)

        Cmd = Nothing
        Con.Close()
        Con = Nothing



        Return ds
    End Function

    Public Function ExecSpResultSet(ByVal MyConName As String, _
                                   ByVal UsrID As String, ByVal UsrPwd As String, _
                                   ByVal TxtSpSQL As String, _
                                   ByVal MyCmdType As CommandType, _
                                   ByVal ParamArray ParamsVal() As Object) As DataSet

        Dim Con As SqlConnection
        Dim Cmd As SqlCommand
        Dim da As SqlDataAdapter
        Dim ds As New DataSet
        Dim connectionString As String = ConfigurationManager.ConnectionStrings(MyConName).ConnectionString

        Con = New SqlConnection(connectionString & ";uid=" & UsrID & ";password=" & UsrPwd)
        Con.Open()

        Cmd = New SqlCommand
        Cmd.CommandText = TxtSpSQL
        Cmd.CommandType = MyCmdType
        Cmd.Connection = Con

        Dim CmdBuilder = New SqlCommandBuilder
        CmdBuilder.DeriveParameters(Cmd)

        Dim x As Short
        For x = 0 To CType(ParamsVal.Length - 1, Int16)
            Cmd.Parameters(x + 1).Value = ParamsVal(x)
        Next

        da = New SqlDataAdapter(Cmd)
        da.Fill(ds)

        Cmd = Nothing
        Con.Close()
        Con = Nothing



        Return ds
    End Function

    Public Function ExecSp(ByVal MyConName As String, _
                                    ByVal UsrID As String, ByVal UsrPwd As String, _
                                    ByVal TxtSpSQL As String, _
                                    ByVal MyCmdType As CommandType, _
                                    ByVal ParamArray ParamsVal() As Object) As Int32

        Dim Con As SqlConnection
        Dim Cmd As SqlCommand
        Dim LstParam As Int32
        Dim sOutPut As Int32
        Dim connectionString As String = ConfigurationManager.ConnectionStrings(MyConName).ConnectionString

        Con = New SqlConnection(connectionString & ";uid=" & UsrID & ";password=" & UsrPwd)
        Con.Open()

        Cmd = New SqlCommand
        Cmd.CommandText = TxtSpSQL
        Cmd.CommandType = MyCmdType
        Cmd.Connection = Con

        Dim CmdBuilder = New SqlCommandBuilder
        CmdBuilder.DeriveParameters(Cmd)

        Dim x As Short
        For x = 0 To CType(ParamsVal.Length - 1, Int16)
            Cmd.Parameters(x + 1).Value = ParamsVal(x)
        Next

        Cmd.ExecuteNonQuery()

        LstParam = CType(Cmd.Parameters.Count - 1, Int32)

        If MyCmdType = CommandType.Text Then
            sOutPut = 0
        Else
            If Cmd.Parameters(LstParam).Direction = _
                ParameterDirection.InputOutput Or _
                Cmd.Parameters(LstParam).Direction = _
                ParameterDirection.ReturnValue Then
                sOutPut = CType(Cmd.Parameters(LstParam).Value, Int32)
            Else
                sOutPut = 0
            End If
        End If

        Cmd = Nothing
        Con.Close()
        Con = Nothing

        Return sOutPut
    End Function

    Public Function TestListOfValues(ByVal ParamArray MyList() As Object) As Int32
        Return MyList.Length
    End Function

    Public Function ExecuteNonQuery(ByVal MyConName As String, _
                                    ByVal UsrID As String, ByVal UsrPwd As String, _
                                    ByVal TxtSpSQL As String) As Int32
        Dim sOutPut As Int32
        Dim Con As SqlConnection
        Dim Cmd As SqlCommand
        Dim connectionString As String = ConfigurationManager.ConnectionStrings(MyConName).ConnectionString

        Con = New SqlConnection(connectionString & ";uid=" & UsrID & ";password=" & UsrPwd)
        Con.Open()

        Cmd = New SqlCommand
        Cmd.CommandText = TxtSpSQL
        Cmd.CommandType = CommandType.Text
        Cmd.Connection = Con

        sOutPut = Cmd.ExecuteNonQuery()

        Cmd = Nothing
        Con.Close()
        Con = Nothing

        Return sOutPut
    End Function

#End Region

End Class