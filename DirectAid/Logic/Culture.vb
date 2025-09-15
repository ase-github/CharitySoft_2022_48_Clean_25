Public Class Culture

    Public Shared Function Direction() As String

        Dim re As String = "rtl"

        If HttpContext.Current.Session(SessionKey.CULTURE) = Constant.CULTURE_EN_US Then

            re = "ltr"

        End If

        Return re

    End Function

    Public Shared Function IsRightToLeft() As Boolean

        Dim re As Boolean = True

        If HttpContext.Current.Session(SessionKey.CULTURE) = Constant.CULTURE_EN_US Then

            re = False

        End If

        Return re

    End Function

    Public Shared Function IsDefaultRightToLeft() As DevExpress.Utils.DefaultBoolean

        Dim re As DevExpress.Utils.DefaultBoolean = DevExpress.Utils.DefaultBoolean.True

        If HttpContext.Current.Session(SessionKey.CULTURE) = Constant.CULTURE_EN_US Then

            re = DevExpress.Utils.DefaultBoolean.False

        End If

        Return re

    End Function

End Class
