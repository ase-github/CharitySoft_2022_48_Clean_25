Imports DevExpress.Web
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView

Public Class ConvoysList
    Inherits BaseWebForm

#Region "Methods"
    Sub Fill_cities(ByRef combo As ASPxComboBox, ByVal code As Integer)
        If code <> -1 Then
            city_DS.SelectParameters("nat_city").DefaultValue = code
            combo.DataBind()
        End If
    End Sub
#End Region


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        DS_Countries.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_Convoy_Types.ConnectionString = New ConnectionStringEx().TheConnectionString
        DS_Convoy_Master.ConnectionString = New ConnectionStringEx().TheConnectionString
        currency_tab_DS.ConnectionString = New ConnectionStringEx().TheConnectionString
        city_DS.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

    Protected Sub grd_ConvoysList_RowValidating(sender As Object, e As DevExpress.Web.Data.ASPxDataValidationEventArgs) Handles grd_ConvoysList.RowValidating
        If e.NewValues("convoy_name_ar") Is Nothing Then
            e.Errors(grd_ConvoysList.Columns("convoy_name_ar")) = "Please fill the field"
        End If
        If e.NewValues("convoy_name_en") Is Nothing Then
            e.Errors(grd_ConvoysList.Columns("convoy_name_en")) = "Please fill the field"
        End If
        If e.NewValues("type_id") Is Nothing Then
            e.Errors(grd_ConvoysList.Columns("type_id")) = "Please fill the field"
        End If

    End Sub

    Protected Sub grd_ConvoysList_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles grd_ConvoysList.StartRowEditing
        If (Not grd_ConvoysList.IsNewRowEditing) Then
            grd_ConvoysList.DoRowValidation()
        End If
    End Sub

    Protected Sub grd_ConvoysList_ParseValue(sender As Object, e As DevExpress.Web.Data.ASPxParseValueEventArgs) Handles grd_ConvoysList.ParseValue
        Try
            If e.FieldName.Equals("budgeted_cost") Then
                Dim budgetedCost As Decimal
                If e.Value Is Nothing Or Not Decimal.TryParse(e.Value.ToString(), budgetedCost) Then
                    Throw New Exception("برجاء ادخال ارقام.")
                End If
            End If
            If e.FieldName.Equals("actual_cost") Then
                Dim actual_cost As Decimal
                If e.Value Is Nothing Or Not Decimal.TryParse(e.Value.ToString(), actual_cost) Then
                    Throw New Exception("برجاء ادخال ارقام.")
                End If
            End If
        Catch ex As NullReferenceException

        End Try

    End Sub

    Protected Sub hyperLink_details_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Convoys/Modal/ConvoyDetails.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim convoy_id As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "convoy_id").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?sid={1}&t={2}", urlBase, convoy_id, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub


    Private Sub cmbCountries_CallBack(sender As Object, e As DevExpress.Web.CallbackEventArgsBase)
        Fill_cities(TryCast(sender, ASPxComboBox), e.Parameter)
    End Sub

    Protected Sub grd_ConvoysList_CellEditorInitialize(sender As Object, e As ASPxGridViewEditorEventArgs) Handles grd_ConvoysList.CellEditorInitialize
        If (Not grd_ConvoysList.IsEditing) Then
            Return
        End If
        If e.Column.FieldName.Equals("city_id") Then
            Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)
            AddHandler combo.Callback, AddressOf cmbCountries_CallBack

            Dim grid = e.Column.Grid
            If (Not combo.IsCallback) Then
                Dim val = -1
                If (Not grid.IsNewRowEditing) Then
                    Try
                        val = CInt(Fix(grid.GetRowValues(e.VisibleIndex, "country_id")))
                    Catch ex As ArgumentException
                        'TODO: handling exception
                    End Try

                End If
                Fill_cities(combo, val)
            End If
        End If
    End Sub

    Protected Sub hyperLink_attach_Init(sender As Object, e As EventArgs)
        Dim urlBase = "/Education/EducationAttachments.aspx"
        Dim link As ASPxHyperLink = CType(sender, ASPxHyperLink)
        Dim templateContainer As GridViewDataItemTemplateContainer = CType(link.NamingContainer, GridViewDataItemTemplateContainer)

        Dim rowVisibleIndex As Integer = templateContainer.VisibleIndex
        Dim convoy_id As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "convoy_id").ToString()
        'Dim status As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "application_status").ToString()
        'scholarship_amount
        'Dim scholarship_amount As Integer = templateContainer.Grid.GetRowValues(rowVisibleIndex, "scholarship_amount").ToString()

        'Dim contentUrl As String = String.Format("{0}?sid={1}&stat={2}&a={3}", urlBase, scholarship_ser, status, scholarship_amount)
        Dim contentUrl As String = String.Format("{0}?app_ser={1}&mod=21&t={2}", urlBase, convoy_id, Guid.NewGuid().ToString())
        link.NavigateUrl = "javascript:void(0);"
        link.ClientSideEvents.Click = String.Format("function(s, e) {{ openTransfers('{0}','{1}'); }}", contentUrl, "width=950,height=300,resizable=no,location=no")
    End Sub
End Class