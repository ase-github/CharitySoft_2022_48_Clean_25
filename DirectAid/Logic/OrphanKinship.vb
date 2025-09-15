
#Region "Imports Directives"

Imports System.ComponentModel

#End Region

<DataObject()>
Public Class OrphanKinship

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
    Public Function Load() As List(Of OrphanKinship)

        Dim re As New List(Of OrphanKinship)

        Dim mother As New OrphanKinship
        mother.ID = 0
        mother.NameAr = "الام"
        re.Add(mother)

        Dim uncle1 As New OrphanKinship
        uncle1.ID = 1
        uncle1.NameAr = "العم"
        re.Add(uncle1)

        Dim aunt1 As New OrphanKinship
        aunt1.ID = 2
        aunt1.NameAr = "العمة"
        re.Add(aunt1)

        Dim uncle2 As New OrphanKinship
        uncle2.ID = 3
        uncle2.NameAr = "خال"
        re.Add(uncle2)

        Dim aunt2 As New OrphanKinship
        aunt2.ID = 4
        aunt2.NameAr = "خالة"
        re.Add(aunt2)

        Dim grandFather As New OrphanKinship
        grandFather.ID = 5
        grandFather.NameAr = "جد"
        re.Add(grandFather)

        Dim grandMother As New OrphanKinship
        grandMother.ID = 6
        grandMother.NameAr = "جدة"
        re.Add(grandMother)

        Return re

    End Function

#End Region

End Class
