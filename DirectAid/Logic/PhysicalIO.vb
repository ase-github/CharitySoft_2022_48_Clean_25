
#Region "Imports Directives"

Imports System
Imports System.IO

#End Region

Public Class PhysicalIO

    Public Shared Sub CreateDirectoryByLogicalPath(logicalPath As String)

        Dim physicalPath As String = System.Web.HttpContext.Current.Server.MapPath(logicalPath)

        If Not System.IO.Directory.Exists(physicalPath) Then

            System.IO.Directory.CreateDirectory(physicalPath)

        End If

    End Sub

    Public Shared Sub CreateFileByLogicalPath(logicalPath As String)

        Dim physicalPath As String = System.Web.HttpContext.Current.Server.MapPath(logicalPath)

        If Not System.IO.File.Exists(physicalPath) Then

            Dim fs As System.IO.FileStream = System.IO.File.Create(physicalPath)
            fs.Close()

        End If

    End Sub

End Class