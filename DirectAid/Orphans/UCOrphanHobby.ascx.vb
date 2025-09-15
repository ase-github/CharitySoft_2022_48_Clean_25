
#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxCallbackPanel
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxClasses
Imports DevExpress.Web

#End Region

Public Class UCOrphanHobby
    Inherits System.Web.UI.UserControl

#Region "Properties"

    Public Property app_ser() As String

        Get
            Return HiddenField_app_ser.Value
        End Get

        Set(value As String)
            HiddenField_app_ser.Value = value
        End Set

    End Property

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        dts_hobby.ConnectionString = New ConnectionStringEx().TheConnectionString

    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles grd_hobby.RowInserting

        If (app_ser <> 0) Then

            e.NewValues("app_ser") = app_ser

        Else

            Throw New Exception("من فضلك قم بحفظ او استدعاء بيانات اليتيم")

        End If


    End Sub

    Protected Sub FillHobbyTypeCombo(ByVal cmb As ASPxComboBox, ByVal HobbyType As String)

        If String.IsNullOrEmpty(HobbyType) Then
            Return
        End If

        Dim Hobby As Dictionary(Of Int16, String) = GetHobbies(HobbyType)

        cmb.Items.Clear()
        For i As Integer = 0 To Hobby.Keys.Count - 1
            cmb.Items.Add(Hobby(Hobby.Keys()(i)), Hobby.Keys()(i))
        Next i

    End Sub

    Private Function GetHobbies(ByVal hobby_type As String) As Dictionary(Of Int16, String)
        Dim list As New Dictionary(Of Int16, String)
        dts_hobby_combo.SelectParameters(0).DefaultValue = hobby_type
        Dim view As DataView = CType(dts_hobby_combo.Select(DataSourceSelectArguments.Empty), DataView)
        For i As Integer = 0 To view.Count - 1
            list.Add(view(i)(0), view(i)(1))
        Next i
        Return list
    End Function

    Private Sub cmbHobbyCode_OnCallback(ByVal source As Object, ByVal e As CallbackEventArgsBase)
        FillHobbyTypeCombo(TryCast(source, ASPxComboBox), e.Parameter)
    End Sub

    Private Sub grd_hobby_CellEditorInitialize(sender As Object, e As DevExpress.Web.ASPxGridViewEditorEventArgs) Handles grd_hobby.CellEditorInitialize

        If (Not grd_hobby.IsEditing) OrElse e.Column.FieldName <> "hobby_code" Then
            Return
        End If
        If e.KeyValue Is DBNull.Value OrElse e.KeyValue Is Nothing Then
            Return
        End If
        Dim val As Object = grd_hobby.GetRowValuesByKeyValue(e.KeyValue, "hobby_type")
        If val Is DBNull.Value Then
            Return
        End If
        Dim HType As String = CStr(val)

        Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)
        FillHobbyTypeCombo(combo, HType)

        AddHandler combo.Callback, AddressOf cmbHobbyCode_OnCallback


        'Dim Hoppy_name As New GridViewDataComboBoxColumn
        'Hoppy_name = DirectCast(grd_hobby.Columns("hobby_code"), GridViewDataComboBoxColumn)
        'Hoppy_name.PropertiesComboBox.DataSourceID = "dts_hobby_combo"

        ''If (Not grd_hobby.IsEditing) OrElse e.Column.FieldName <> "hobby_type" Then
        ''    Return
        ''End If
        ''If e.KeyValue Is DBNull.Value OrElse e.KeyValue Is Nothing Then
        ''    Return
        ''End If

        'Dim val As Object = grd_hobby.GetRowValuesByKeyValue(e.KeyValue, "hobby_type")
        'If val Is DBNull.Value Then
        '    Return
        'End If

        'Dim country As String = CStr(val)

        'Dim combo As ASPxComboBox = TryCast(e.Editor, ASPxComboBox)

        'FillHobbyTypeCombo(combo, country)

        'AddHandler combo.Callback, AddressOf cmbHobbyCode_OnCallback

    End Sub

    Private Sub grd_hobby_RowUpdated(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatedEventArgs) Handles grd_hobby.RowUpdated

        Dim Hoppy_name As New GridViewDataComboBoxColumn
        Hoppy_name = DirectCast(grd_hobby.Columns("hobby_code"), GridViewDataComboBoxColumn)
        Hoppy_name.PropertiesComboBox.DataSourceID = "dst_hobby_combo_main"
    End Sub

    Protected Sub grd_hobby_StartRowEditing(sender As Object, e As DevExpress.Web.Data.ASPxStartRowEditingEventArgs) Handles grd_hobby.StartRowEditing

        Dim Hoppy_name As New GridViewDataComboBoxColumn
        Hoppy_name = DirectCast(grd_hobby.Columns("hobby_code"), GridViewDataComboBoxColumn)
        Hoppy_name.PropertiesComboBox.DataSourceID = "dts_hobby_combo"
    End Sub

#End Region

End Class