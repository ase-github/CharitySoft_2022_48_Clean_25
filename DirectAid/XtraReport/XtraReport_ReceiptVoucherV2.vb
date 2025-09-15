
Public Class XtraReport_ReceiptVoucherV2

    Private Sub XtraReport_ReceiptVoucherV2_DataSourceRowChanged(sender As Object, e As DevExpress.XtraReports.UI.DataSourceRowEventArgs)


    End Sub

    Private Sub XtraReport_ReceiptVoucherV2_DataSourceDemanded(sender As Object, e As EventArgs) Handles MyBase.DataSourceDemanded

        Dim dt As DataTable = HttpContext.Current.Session(SessionKey.REPORT_DATASOURCE)

        Dim theFifthDiff As Int32 = 5 - dt.Rows.Count

        If Not dt Is Nothing Then

            If dt.Rows.Count > 0 And theFifthDiff > 0 Then

                For a = 1 To theFifthDiff

                    Dim dr As DataRow = dt.NewRow()

                    For b = 0 To dt.Columns.Count - 1

                        dr(dt.Columns(b)) = dt.Rows(0)(dt.Columns(b))

                    Next

                    dr("qty") = DBNull.Value
                    dr("line_amount") = DBNull.Value
                    dr("donation_descrar") = DBNull.Value
                    dr("nat_descrar") = DBNull.Value

                    dt.Rows.Add(dr)

                Next

            End If

        End If

        Me.DataSource = dt
        Me.DataMember = dt.TableName

    End Sub

End Class