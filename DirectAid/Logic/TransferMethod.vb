
#Region "Imports Directives"

Imports System.ComponentModel

#End Region

<DataObject()>
Public Class TransferMethod

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
    Public Function Load() As List(Of TransferMethod)

        Dim re As New List(Of TransferMethod)

        Dim value_0 As New TransferMethod
        value_0.ID = 3
        value_0.NameAr = "شيك"

        Dim value_1 As New TransferMethod
        value_1.ID = 6
        value_1.NameAr = "حواله"

        Dim value_2 As New TransferMethod
        value_2.ID = 7
        value_2.NameAr = "مكتب الجمعيه"

        Dim value_3 As New TransferMethod
        value_3.ID = 8
        value_3.NameAr = "اخرى"

        re.Add(value_0)
        re.Add(value_1)
        re.Add(value_2)
        re.Add(value_3)

        Return re

    End Function

#End Region

End Class
