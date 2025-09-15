
#Region "Imports Directives"

Imports System.ComponentModel

#End Region

<DataObject()>
Public Class OrphanParentsStatus

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
    Public Function Load() As List(Of OrphanParentsStatus)

        Dim re As New List(Of OrphanParentsStatus)

        Dim OrphanParentsStatus1 As New OrphanParentsStatus
        OrphanParentsStatus1.ID = 1
        OrphanParentsStatus1.NameAr = "متوفى الاب"

        Dim OrphanParentsStatus2 As New OrphanParentsStatus
        OrphanParentsStatus2.ID = 2
        OrphanParentsStatus2.NameAr = "متوفى الام"

        Dim OrphanParentsStatus3 As New OrphanParentsStatus
        OrphanParentsStatus3.ID = 3
        OrphanParentsStatus3.NameAr = "كلاهما متوفى"

        re.Add(OrphanParentsStatus1)
        re.Add(OrphanParentsStatus2)
        re.Add(OrphanParentsStatus3)

        Return re

    End Function

#End Region

End Class
