Public Class orphans_edu_hist
    Inherits BaseWebForm

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then


            'For Testing, username and password must be enter from Login Form
            'Session("username") = "sa"
            'Session("password") = "pass@word1"



            If Session("orphans_app_ser") <> "" Then
                Me.lbl_app_ser.Text = Session("orphans_app_ser")
            Else
                Me.lbl_app_ser.Text = ""
            End If


        End If
    End Sub

End Class