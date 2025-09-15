
#Region "Imports Directives"

Imports System.Globalization
Imports System.Linq
Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxClasses
Imports Microsoft.VisualBasic
Imports System.Configuration
Imports System.Collections
Imports System.Collections.Generic
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxCallbackPanel
Imports DevExpress.Web

#End Region

Public Class NewDonationsDetail
    Inherits BaseWebForm

#Region "Fields"

    Protected _culture As String

    Dim WS As New DataAccessLibrary

    Private _ws As New DataAccessLibrary

#End Region

#Region "Methods"

    Sub Clear_Frm(ByVal container As Control)

        Dim control As Control

        For Each control In container.Controls

            ClearControl(control)

            If control.HasControls() Then
                Clear_Frm(control)
            End If
        Next
    End Sub

    Sub ClearControl(ByRef control As Control)
        'other types can obviously be put in if necessary
        Select Case control.GetType.Name
            Case "ASPxTextBox"
                CType(control, ASPxTextBox).Text = ""
            Case "ASPxComboBox"
                CType(control, ASPxComboBox).SelectedIndex = -1
                ' Case "DataGrid"
                ' CType(control, DataGrid).DataSource = Nothing
                ' control.DataBind()

            Case Else
        End Select

    End Sub

    Sub SearchDonation(ByVal code As Integer)
        Dim DonCod As Object
        Dim DOnation_DS As DataSet
        Dim SQL As String


        If Session("app_ser_from_srch") <> "" Then
            Me.CmbSearchId.Value = Session("app_ser_from_srch")
        End If




        DonCod = Me.CmbSearchId.Value
        DOnation_DS = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonations", CommandType.StoredProcedure, DonCod)





        If DOnation_DS.Tables(0).Rows.Count > 0 Then

            Dim s As Decimal = If(IsDBNull(DOnation_DS.Tables(0).Rows(0)(2)), 0, DOnation_DS.Tables(0).Rows(0)(2))

        End If


        Session("app_ser_from_srch") = ""
        Session("orphans_app_ser") = Me.CmbSearchId.Value

    End Sub

    Sub UpdateSourceTargetGrids()
        LinqServerModeDataSource_source.DataBind()
        ASPxGridView_Source.DataBind()
        EntityDataSource_donations_rates.DataBind()
        ASPxGridView_Target.DataBind()
    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        DsSearchID.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

    Protected Sub LinqServerModeDataSource_target_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource_target.Selecting

        'If Not CmbSearchId.Value Is Nothing Then

        '    e.KeyExpression = "nat_code"
        '    Dim donID As Int16 = CmbSearchId.Value
        '    Dim db As New Database

        '    e.QueryableSource = (From o In db.donations_rates Where o.donation_code = donID Select o)

        'End If

    End Sub

    Protected Sub LinqServerModeDataSource_source_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource_source.Selecting

        If Not CmbSearchId.Value Is Nothing Then

            e.KeyExpression = "nat_code"

            Dim donID As Int16 = CmbSearchId.Value


            Dim db As New Database
            Dim countries As New List(Of Short)
            ' Dim userName As String = ASPxComboBox_user_name.Value

            countries = (From o In db.donations_rates Where o.donation_code = donID Select o.nat_code).ToList()
            e.QueryableSource = (From o In db.nat_tab Where Not countries.Contains(o.nat_code) Select o)
        Else

            e.QueryableSource = Nothing

        End If

    End Sub

    'Protected Sub ASPxComboBox_ListType_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ASPxComboBox_user_name.SelectedIndexChanged

    '    ASPxGridView_Source.DataBind()
    '    ' ASPxGridView_Target.DataBind()

    '    ASPxGridView_Source.Selection.UnselectAll()
    '    ' ASPxGridView_Target.Selection.UnselectAll()

    'End Sub

    Protected Sub ASPxCallback_Add_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Add.Callback


        If (Not CmbSearchId.Value Is Nothing) Then
            Try
                Dim selectionList As List(Of Object) = ASPxGridView_Source.GetSelectedFieldValues("nat_code")

                If selectionList.Count > 0 Then

                    Using db As New Database

                        Dim donationCode As Int16 = Val(CmbSearchId.Value)
                        Dim _ApplyCurrencyConversion As Boolean = (From o In db.donations Where o.donation_code = donationCode Select o.ApplyCurrencyConversion).DefaultIfEmpty(False).FirstOrDefault()

                        For a = 0 To selectionList.Count - 1

                            Dim _donation_rates As New donations_rates

                            _donation_rates.nat_code = selectionList(a)
                            _donation_rates.donation_code = Val(CmbSearchId.Value)
                            _donation_rates.donation_standard_value = 1
                            _donation_rates.target_quantity = 1
                            _donation_rates.ApplyCurrencyConversion = _ApplyCurrencyConversion

                            db.donations_rates.AddObject(_donation_rates)

                        Next

                        db.SaveChanges()

                    End Using

                End If

                e.Result = "OK"

            Catch ex As Exception

                e.Result = FaultEngine.HandleException(ex).Message

            End Try
        End If


    End Sub

    Protected Sub ASPxCallback_Remove_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs) Handles ASPxCallback_Remove.Callback
        If (Not CmbSearchId.Value Is Nothing) Then
            Try

                Dim selectionList As List(Of Object) = ASPxGridView_Target.GetSelectedFieldValues("nat_code")
                ' Dim userName As String = ASPxComboBox_user_name.Value

                If selectionList.Count > 0 Then

                    Using db As New Database

                        For a = 0 To selectionList.Count - 1
                            Dim DonID = Val(CmbSearchId.Value)
                            Dim nat_code As Short = selectionList(a)
                            Dim _donation_rates As donations_rates = (From o In db.donations_rates Where o.nat_code = nat_code And o.donation_code = DonID Select o).FirstOrDefault()

                            If Not _donation_rates Is Nothing Then

                                db.donations_rates.DeleteObject(_donation_rates)

                            End If

                        Next

                        db.SaveChanges()

                    End Using

                End If

                e.Result = "OK"

            Catch ex As Exception

                e.Result = ex.Message

            End Try
        End If


    End Sub

    Protected Sub ASPxButton_Add_Click(sender As Object, e As EventArgs) Handles ASPxButton_Add.Click

    End Sub

    Protected Sub txtdonCode_TextChanged(sender As Object, e As EventArgs) Handles CmbSearchId.ValueChanged
        UpdateSourceTargetGrids()
    End Sub


    Protected Sub Btn_Search_Click(sender As Object, e As EventArgs) Handles Btn_Search.Click
        If CmbSearchId.SelectedIndex <> -1 Then
            Me.CmbSearchId.Value = CmbSearchId.SelectedItem.Value
            'SearchDonation(Me.CmbSearchId.Value)
            UpdateSourceTargetGrids()
        End If
    End Sub

    Protected Sub ASPxGridView_Target_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ASPxGridView_Target.RowUpdating

        e.NewValues("donation_code") = CmbSearchId.Value

    End Sub

#End Region

End Class