Public Class DonorBeneficiaries
    Inherits BaseWebForm

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound, GridView2.RowDataBound, GridView3.RowDataBound, GridView4.RowDataBound
        If e.Row.RowType = DataControlRowType.Footer Then

            Dim beneficiaryCount As Int32 = 0
            Dim donorID As Int32 = Convert.ToInt32(Request.QueryString(QueryStringKey.DonorID))

            Using db As New Database

                Select Case DirectCast(sender, GridView).ID

                    Case "GridView1"

                        beneficiaryCount = (From o In db.benf_master Where o.app_type = 0 And o.donor_id = donorID Select o.app_ser).Count

                    Case "GridView2"

                        beneficiaryCount = (From o In db.benf_master Where o.app_type = 1 And o.donor_id = donorID Select o.app_ser).Count

                    Case "GridView3"

                        beneficiaryCount = (From o In db.benf_master Where o.app_type = 2 And o.donor_id = donorID Select o.app_ser).Count

                    Case "GridView4"

                        beneficiaryCount = (From o In db.project_donors Where o.donor_id = donorID Select o.project_id).Count

                    Case Else

                        beneficiaryCount = 0

                End Select

            End Using

            e.Row.Cells(0).Text = beneficiaryCount.ToString

        End If
    End Sub
End Class