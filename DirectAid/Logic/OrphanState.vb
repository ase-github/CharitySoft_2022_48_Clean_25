
#Region "Imports Directives"

Imports System.ComponentModel

#End Region

<DataObject()>
Public Class OrphanState

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
    Public Function Load() As List(Of OrphanState)

        Dim re As New List(Of OrphanState)

        Dim nominated As New OrphanState
        nominated.ID = 1
        nominated.NameAr = "مرشح"

        Dim unassigned As New OrphanState
        unassigned.ID = 2
        unassigned.NameAr = "غير مخصص"

        Dim assigned As New OrphanState
        assigned.ID = 3
        assigned.NameAr = "مخصص"

        Dim rejected As New OrphanState
        rejected.ID = 4
        rejected.NameAr = "مرفوض"

        re.Add(nominated)
        re.Add(unassigned)
        re.Add(assigned)
        re.Add(rejected)

        Return re

    End Function

#End Region

End Class
