
#Region "Imports Directives"

Imports System.Data.SqlClient
Imports System.Exception
Imports System.Data.EntityClient

#End Region

Public Class Database
    Inherits charitysoftEntities

    Public Sub New()

        'metadata=res://*/Logic.ModelDB.csdl|res://*/Logic.ModelDB.ssdl|res://*/Logic.ModelDB.msl;provider=System.Data.SqlClient;provider connection string="Data Source=192.168.1.40 ;initial catalog=charitysoft;User ID=sa;Password=pass@word1;multipleactiveresultsets=True;App=EntityFramework"
        MyBase.New(New EntityConnectionEx().TheEntityConnection)

    End Sub

    Public Sub New(ByVal databaseName)

        'metadata=res://*/Logic.ModelDB.csdl|res://*/Logic.ModelDB.ssdl|res://*/Logic.ModelDB.msl;provider=System.Data.SqlClient;provider connection string="Data Source=192.168.1.40 ;initial catalog=charitysoft;User ID=sa;Password=pass@word1;multipleactiveresultsets=True;App=EntityFramework"
        MyBase.New(New EntityConnectionEx(databaseName).TheEntityConnection)

    End Sub

End Class

Public Class EntityConnectionEx

    Public TheEntityConnection As EntityConnection
    Public TheConnectionString As String

    Public Sub New(ByVal databaseName)

        ' Initialize the EntityConnectionStringBuilder.
        Dim entityBuilder As New EntityConnectionStringBuilder()

        'Set the provider name.
        entityBuilder.Provider = "System.Data.SqlClient"

        ' Set the provider-specific connection string.
        entityBuilder.ProviderConnectionString = New ConnectionStringEx(databaseName).TheConnectionString

        ' Set the Metadata location.
        entityBuilder.Metadata = "res://*/Logic.ModelDB.csdl|res://*/Logic.ModelDB.ssdl|res://*/Logic.ModelDB.msl"

        TheEntityConnection = New EntityConnection(entityBuilder.ToString())

        TheConnectionString = TheEntityConnection.ConnectionString

    End Sub

    Public Sub New()

        ' Initialize the EntityConnectionStringBuilder.
        Dim entityBuilder As New EntityConnectionStringBuilder()

        'Set the provider name.
        entityBuilder.Provider = "System.Data.SqlClient"

        ' Set the provider-specific connection string.
        entityBuilder.ProviderConnectionString = New ConnectionStringEx().TheConnectionString

        ' Set the Metadata location.
        entityBuilder.Metadata = "res://*/Logic.ModelDB.csdl|res://*/Logic.ModelDB.ssdl|res://*/Logic.ModelDB.msl"

        TheEntityConnection = New EntityConnection(entityBuilder.ToString())

        TheConnectionString = TheEntityConnection.ConnectionString

    End Sub

End Class

Public Class ConnectionStringEx

    Public TheConnectionString As String

    Public Sub New()

        '=======================================================================================
        'Declaration
        '---------------------------------------------------------------------------------------
        Dim _ConnectionString As String
        Dim _SqlConnectionStringBuilder As SqlConnectionStringBuilder
        '=======================================================================================

        '=======================================================================================
        'Initialization
        '---------------------------------------------------------------------------------------
        _ConnectionString = ConfigurationManager.ConnectionStrings("Con_1").ConnectionString

        _SqlConnectionStringBuilder = New SqlConnectionStringBuilder(_ConnectionString)
        _SqlConnectionStringBuilder.IntegratedSecurity = False
        _SqlConnectionStringBuilder.UserID = HttpContext.Current.Session(SessionKey.USERNAME)
        _SqlConnectionStringBuilder.Password = HttpContext.Current.Session(SessionKey.PASSWORD)
        '=======================================================================================

        TheConnectionString = _SqlConnectionStringBuilder.ConnectionString

    End Sub

    Public Sub New(ByVal databaseName)

        '=======================================================================================
        'Declaration
        '---------------------------------------------------------------------------------------
        Dim _ConnectionString As String
        Dim _SqlConnectionStringBuilder As SqlConnectionStringBuilder
        '=======================================================================================

        '=======================================================================================
        'Initialization
        '---------------------------------------------------------------------------------------
        _ConnectionString = ConfigurationManager.ConnectionStrings("Con_1").ConnectionString

        _SqlConnectionStringBuilder = New SqlConnectionStringBuilder(_ConnectionString)
        _SqlConnectionStringBuilder.InitialCatalog = databaseName
        _SqlConnectionStringBuilder.IntegratedSecurity = False
        _SqlConnectionStringBuilder.UserID = HttpContext.Current.Session(SessionKey.USERNAME)
        _SqlConnectionStringBuilder.Password = HttpContext.Current.Session(SessionKey.PASSWORD)
        '=======================================================================================

        TheConnectionString = _SqlConnectionStringBuilder.ConnectionString

    End Sub

End Class

Public Class DatabaseSecurity

    Public Shared Function IsRoleMember(ByVal roleName) As Boolean

        '=======================================================================================
        'Declaration
        '---------------------------------------------------------------------------------------
        Dim _StringBuilder As StringBuilder
        Dim _ConnectionString As String
        Dim _SqlConnection As SqlConnection
        Dim _SqlCommand As SqlCommand
        Dim _DataTable As DataTable
        Dim _SqlConnectionStringBuilder As SqlConnectionStringBuilder
        '=======================================================================================

        '=======================================================================================
        'Initialization
        '---------------------------------------------------------------------------------------
        _StringBuilder = New StringBuilder

        _ConnectionString = ConfigurationManager.ConnectionStrings("charitysoft").ConnectionString

        _SqlConnectionStringBuilder = New SqlConnectionStringBuilder(_ConnectionString)
        _SqlConnectionStringBuilder.IntegratedSecurity = False
        _SqlConnectionStringBuilder.UserID = HttpContext.Current.Session(SessionKey.USERNAME)
        _SqlConnectionStringBuilder.Password = HttpContext.Current.Session(SessionKey.PASSWORD)
        _SqlConnection = New SqlConnection(_SqlConnectionStringBuilder.ConnectionString)

        _DataTable = New DataTable
        '---------------------------------------------------------------------------------------
        _StringBuilder.AppendFormat("SELECT ISNULL(IS_ROLEMEMBER('{0}', '{1}'), 0);", roleName, _SqlConnectionStringBuilder.UserID)

        _SqlCommand = New SqlCommand(_StringBuilder.ToString(), _SqlConnection)
        '=======================================================================================

        '=======================================================================================
        'Processing
        '---------------------------------------------------------------------------------------
        _SqlConnection.Open()
        Dim re As Object = _SqlCommand.ExecuteScalar()
        _SqlConnection.Dispose()
        Return Convert.ToBoolean(re)
        '=======================================================================================

    End Function

End Class

Public Class DatabaseRoles

    Public Const reception_role As String = "reception_role"
    Public Const recp_supervisor As String = "recp_supervisor"
    Public Const don_menu As String = "don_menu"
    Public Const ded_sub_men As String = "ded_sub_men"
    Public Const read_all_tab_views As String = "read_all_tab_views"
    Public Const overide_date_recpt As String = "overide_date_recpt"
    Public Const orphan_men As String = "orphan_men"
    Public Const orphan_user_gen As String = "orphan_user_gen"
    Public Const projects_role_1 As String = "projects_role_1"
    Public Const dawa_role As String = "dawa_role"
    Public Const db_owner As String = "db_owner"
    Public Const db_accessadmin As String = "db_accessadmin"
    Public Const db_securityadmin As String = "db_securityadmin"
    Public Const db_ddladmin As String = "db_ddladmin"
    Public Const db_backupoperator As String = "db_backupoperator"
    Public Const db_datareader As String = "db_datareader"
    Public Const db_datawriter As String = "db_datawriter"
    Public Const backlog As String = "backlog"
    Public Const branch_supervisor As String = "branch_supervisor"
    Public Const settings_menu As String = "settings_menu"
    Public Const DonorImportance As String = "DonorImportance"
    Public Const SMSEnabled As String = "SMSEnabled"

End Class