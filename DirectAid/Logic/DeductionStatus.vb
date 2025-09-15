
#Region "Imports Directives"

Imports System.ComponentModel

#End Region

<DataObject()>
Public Class DeductionStatus

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
    Public Function Load() As List(Of DeductionStatus)

        Dim re As New List(Of DeductionStatus)

        Dim value_1 As New DeductionStatus
        value_1.ID = 1
        value_1.NameAr = "انتظار"

        Dim value_2 As New DeductionStatus
        value_2.ID = 2
        value_2.NameAr = "معلق"

        Dim value_3 As New DeductionStatus
        value_3.ID = 3
        value_3.NameAr = "مغلق"

        Dim value_4 As New DeductionStatus
        value_4.ID = 4
        value_4.NameAr = "نشط"

        Dim value_5 As New DeductionStatus
        value_5.ID = 5
        value_5.NameAr = "ملغى"

        re.Add(value_1)
        re.Add(value_2)
        re.Add(value_3)
        re.Add(value_4)
        re.Add(value_5)

        Return re

    End Function

#End Region

End Class
