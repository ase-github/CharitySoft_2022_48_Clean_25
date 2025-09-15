
#Region "Imports Directives"

#End Region

Public Class StringEngine

    ''' <summary>
    ''' ProcessArabicString
    ''' </summary>
    ''' <param name="input">input</param>
    ''' <returns>String</returns>
    ''' <remarks></remarks>
    Public Shared Function ProcessArabicString(input As String) As String

        Dim output As String = ""

        If input <> String.Empty Then

            'Add space to the tail so that it can consider removing ي at the end of the word
            'Add space to the tail so that it can consider removing ة at the end of the word
            input = input + " "

            'ي must be at the end of the word which means must be followed by a space
            'ة must be at the end of the word which means must be followed by a space
            output = input.Replace("أ", "ا").Replace("إ", "ا").Replace("آ", "ا").Replace("ي ", "ى ").Replace("ة ", "ه ").Trim()

            'replaces the redundant spaces into the string by a single space
            output = Regex.Replace(output, "[ ]{2,}", " ")

        End If

        Return output

    End Function

End Class