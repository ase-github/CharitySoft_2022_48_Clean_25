Public NotInheritable Class CharityEFDBContext
    Private Shared _context = Nothing

    Public Shared Function CurrentContext() As charitysoftEntities
        If _context Is Nothing Then
            _context = New charitysoftEntities
            Return _context
        Else
            Return _context
        End If
    End Function

End Class
