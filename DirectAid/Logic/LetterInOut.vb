
#Region "Imports Directives"

Imports System.ComponentModel

#End Region

<DataObject()>
Public Class LetterInOut

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
    Public Function Load() As List(Of LetterInOut)

        Dim re As New List(Of LetterInOut)

        Dim value_0 As New LetterInOut
        value_0.ID = 0
        value_0.NameAr = "صادر"

        Dim value_1 As New LetterInOut
        value_1.ID = 1
        value_1.NameAr = "وارد"

        re.Add(value_0)
        re.Add(value_1)

        Return re

    End Function

#End Region

End Class
