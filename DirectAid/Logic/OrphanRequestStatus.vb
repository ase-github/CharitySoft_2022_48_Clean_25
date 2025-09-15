
#Region "Imports Directives"

Imports System.ComponentModel

#End Region

<DataObject()>
Public Class OrphanRequestStatus

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
    Public Function Load() As List(Of OrphanRequestStatus)

        Dim re As New List(Of OrphanRequestStatus)

        Dim waiting As New OrphanRequestStatus
        waiting.ID = 0
        waiting.NameAr = "انتظار"

        Dim accepted As New OrphanRequestStatus
        accepted.ID = 1
        accepted.NameAr = "مقبول"

        Dim rejected As New OrphanRequestStatus
        rejected.ID = 2
        rejected.NameAr = "مرفوض"

        Dim cancelled As New OrphanRequestStatus
        cancelled.ID = 3
        cancelled.NameAr = "ملغى"

        re.Add(waiting)
        re.Add(accepted)
        re.Add(rejected)
        re.Add(cancelled)

        Return re

    End Function

#End Region

End Class
