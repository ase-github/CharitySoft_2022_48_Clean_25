
#Region "Imports Directives"

Imports System.ComponentModel

#End Region

<DataObject()>
Public Class BeneficiaryType

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
    Public Function Load() As List(Of BeneficiaryType)

        Dim re As New List(Of BeneficiaryType)

        Dim value_0 As New BeneficiaryType
        value_0.ID = 0
        value_0.NameAr = "يتيم"

        Dim value_1 As New BeneficiaryType
        value_1.ID = 1
        value_1.NameAr = "طالب"

        Dim value_2 As New BeneficiaryType
        value_2.ID = 2
        value_2.NameAr = "داعيه"

        re.Add(value_0)
        re.Add(value_1)
        re.Add(value_2)

        Return re

    End Function

#End Region

End Class
