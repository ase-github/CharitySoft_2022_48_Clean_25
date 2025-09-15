
#Region "Imports Directives"

Imports System.ComponentModel

#End Region

<DataObject()>
Public Class FundSource

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
    Public Function Load() As List(Of FundSource)

        Dim re As New List(Of FundSource)

        Dim value_0 As New FundSource
        value_0.ID = 0
        value_0.NameAr = "لا يوجد"

        Dim value_1 As New FundSource
        value_1.ID = 1
        value_1.NameAr = "سند قبض"

        Dim value_2 As New FundSource
        value_2.ID = 2
        value_2.NameAr = "استقطاع"

        Dim value_3 As New FundSource
        value_3.ID = 3
        value_3.NameAr = "الموقع الالكترونى"

        Dim value_4 As New FundSource
        value_4.ID = 4
        value_4.NameAr = "الحواله البنكيه"

        Dim value_5 As New FundSource
        value_5.ID = 5
        value_5.NameAr = "موقع بيت التمويل الكويتى أون لاين"

        Dim value_6 As New FundSource
        value_6.ID = 6
        value_6.NameAr = "موقع بنك وربة أون لاين"

        re.Add(value_0)
        re.Add(value_1)
        re.Add(value_2)
        re.Add(value_3)
        re.Add(value_4)
        re.Add(value_5)
        re.Add(value_6)
        Return re

    End Function

#End Region

End Class
