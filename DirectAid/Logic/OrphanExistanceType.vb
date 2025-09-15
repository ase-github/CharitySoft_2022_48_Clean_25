
#Region "Imports Directives"

Imports System.ComponentModel

#End Region

<DataObject()>
Public Class OrphanExistanceType

#Region "Fields"

    Private _ID As Byte
    Private _NameAr As String
    Private _NameEn As String

#End Region

#Region "Properties"

    Public Property ID() As Byte
        Get
            Return _ID
        End Get

        Set(value As Byte)
            _ID = value
        End Set
    End Property

    Public Property NameAr() As String
        Get
            Return _NameAr
        End Get

        Set(value As String)
            _NameAr = value
        End Set
    End Property

    Public Property NameEn() As String
        Get
            Return _NameEn
        End Get

        Set(value As String)
            _NameEn = value
        End Set
    End Property

#End Region

#Region "Methods"

    <DataObjectMethodAttribute(DataObjectMethodType.Select, True)>
    Public Function Load() As List(Of OrphanExistanceType)

        Dim re As New List(Of OrphanExistanceType)

        Dim internal As New OrphanExistanceType
        internal.ID = 0
        internal.NameAr = "داخلى"

        Dim external As New OrphanExistanceType
        external.ID = 1
        external.NameAr = "خارجى"

        re.Add(internal)
        re.Add(external)

        Return re

    End Function

#End Region

End Class
