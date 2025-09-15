Imports System.Linq

Public Class UIDonorMerge
    Inherits BaseWebForm

#Region "Fields"

    Private databaseName As String = Constant.CHARITYSOFT

#End Region

#Region "Properties"

    Public ReadOnly Property ID_ToKeep As Int32?

        Get

            Dim re As Int32 = 0

            If Int32.TryParse(Request.QueryString(QueryStringKey.ID_TO_KEEP), re) Then

                Return re

            Else

                Return Nothing

            End If

        End Get

    End Property

    Public ReadOnly Property ID_ToCancel As Int32?

        Get

            Dim re As Int32 = 0

            If Int32.TryParse(Request.QueryString(QueryStringKey.ID_TO_CANCEL), re) Then

                Return re

            Else

                re = Nothing

            End If

        End Get

    End Property

    Public ReadOnly Property SearchByLegacyID_ToKeep As Boolean

        Get

            Dim re As Boolean = False

            Boolean.TryParse(Request.QueryString(QueryStringKey.SEARCH_BY_LEGACY_ID_TO_KEEP), re)

            Return re

        End Get

    End Property

    Public ReadOnly Property SearchByLegacyID_ToCancel As Boolean

        Get

            Dim re As Boolean = False

            Boolean.TryParse(Request.QueryString(QueryStringKey.SEARCH_BY_LEGACY_ID_TO_CANCEL), re)

            Return re

        End Get

    End Property

#End Region

#Region "Methods"

    Private Sub Navigation(_ID_ToKeep As Object, _ID_ToCancel As Object, _SearchByLegacyID_ToKeep As Object, _SearchByLegacyID_ToCancel As Object)

        Response.Redirect(String.Format("UIDonorMerge.aspx?{0}={1}&{2}={3}&{4}={5}&{6}={7}", QueryStringKey.ID_TO_KEEP, _ID_ToKeep, QueryStringKey.ID_TO_CANCEL, _ID_ToCancel, QueryStringKey.SEARCH_BY_LEGACY_ID_TO_KEEP, _SearchByLegacyID_ToKeep, QueryStringKey.SEARCH_BY_LEGACY_ID_TO_CANCEL, _SearchByLegacyID_ToCancel))

    End Sub

    Private Sub Navigation(_ID_ToKeep As Object, _ID_ToCancel As Object)

        Navigation(_ID_ToKeep, _ID_ToCancel, ASPxCheckBox_SearchByLegacyID_ToKeep.Value, ASPxCheckBox_SearchByLegacyID_ToCancel.Value)

    End Sub

    Private Sub Navigation()

        Navigation(ASPxTextBox_ID_ToKeep.Value, ASPxTextBox_ID_ToCancel.Value)

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            ASPxCheckBox_SearchByLegacyID_ToKeep.Value = SearchByLegacyID_ToKeep
            ASPxCheckBox_SearchByLegacyID_ToCancel.Value = SearchByLegacyID_ToCancel

            If ID_ToKeep.HasValue Then

                Dim _ID_ToKeep As Int32 = ID_ToKeep.Value

                ASPxTextBox_ID_ToKeep.Value = _ID_ToKeep

                Using db As New Database(databaseName)

                    Dim _donor_data As donor_data = Nothing

                    If ASPxCheckBox_SearchByLegacyID_ToKeep.Value Then

                        _donor_data = (From o In db.donor_data Where o.donor_prev_id = _ID_ToKeep Select o).FirstOrDefault
                        ASPxCheckBox_SearchByLegacyID_ToKeep.Value = False

                    Else

                        _donor_data = (From o In db.donor_data Where o.donor_id = _ID_ToKeep Select o).FirstOrDefault

                    End If

                    If Not _donor_data Is Nothing Then

                        ASPxCheckBox_SearchByLegacyID_ToKeep.ReadOnly = True

                        ASPxTextBox_ID_ToKeep.ReadOnly = True

                        ASPxButton_New_ToKeep.Visible = True
                        ASPxButton_Search_ToKeep.Visible = False

                        ASPxTextBox_ID_ToKeep.Value = _donor_data.donor_id
                        ASPxTextBox_LegacyID_ToKeep.Value = _donor_data.donor_prev_id
                        ASPxTextBox_Name_ToKeep.Value = _donor_data.donor_namear
                        ASPxTextBox_Total_ToKeep.Value = (From o In db.donation_tran Where o.donor_id = _ID_ToKeep Select o.total_amount).Sum()
                        ASPxTextBox_Orphans_ToKeep.Value = (From o In db.benf_master Where o.app_type = 0 And o.donor_id = _ID_ToKeep Select o.app_ser).Count()
                        ASPxTextBox_Student_ToKeep.Value = (From o In db.benf_master Where o.app_type = 1 And o.donor_id = _ID_ToKeep Select o.app_ser).Count()
                        ASPxTextBox_Daaya_ToKeep.Value = (From o In db.benf_master Where o.app_type = 2 And o.donor_id = _ID_ToKeep Select o.app_ser).Count()
                        ASPxTextBox_Project_ToKeep.Value = (From o In db.project_donors Where o.donor_id = _ID_ToKeep Select o.project_id).Distinct().Count()

                    End If

                End Using

            End If

            If ID_ToCancel.HasValue Then

                Dim _ID_ToCancel As Int32 = ID_ToCancel.Value

                ASPxTextBox_ID_ToCancel.Value = _ID_ToCancel

                Using db As New Database(databaseName)

                    Dim _donor_data As donor_data = Nothing

                    If ASPxCheckBox_SearchByLegacyID_ToCancel.Value Then

                        _donor_data = (From o In db.donor_data Where o.donor_prev_id = _ID_ToCancel Select o).FirstOrDefault
                        ASPxCheckBox_SearchByLegacyID_ToCancel.Value = False

                    Else

                        _donor_data = (From o In db.donor_data Where o.donor_id = _ID_ToCancel Select o).FirstOrDefault

                    End If

                    If Not _donor_data Is Nothing Then

                        ASPxCheckBox_SearchByLegacyID_ToCancel.ReadOnly = True

                        ASPxTextBox_ID_ToCancel.ReadOnly = True

                        ASPxButton_New_ToCancel.Visible = True
                        ASPxButton_Search_ToCancel.Visible = False

                        ASPxTextBox_ID_ToCancel.Value = _donor_data.donor_id
                        ASPxTextBox_LegacyID_ToCancel.Value = _donor_data.donor_prev_id
                        ASPxTextBox_Name_ToCancel.Value = _donor_data.donor_namear
                        ASPxTextBox_Total_ToCancel.Value = (From o In db.donation_tran Where o.donor_id = _ID_ToCancel Select o.total_amount).Sum()
                        ASPxTextBox_Orphans_ToCancel.Value = (From o In db.benf_master Where o.app_type = 0 And o.donor_id = _ID_ToCancel Select o.app_ser).Count()
                        ASPxTextBox_Student_ToCancel.Value = (From o In db.benf_master Where o.app_type = 1 And o.donor_id = _ID_ToCancel Select o.app_ser).Count()
                        ASPxTextBox_Daaya_ToCancel.Value = (From o In db.benf_master Where o.app_type = 2 And o.donor_id = _ID_ToCancel Select o.app_ser).Count()
                        ASPxTextBox_Project_ToCancel.Value = (From o In db.project_donors Where o.donor_id = _ID_ToCancel Select o.project_id).Distinct().Count()

                    End If

                End Using

            End If

            If ASPxTextBox_ID_ToKeep.ReadOnly And ASPxTextBox_ID_ToCancel.ReadOnly Then

                Using db As New Database(databaseName)

                    Dim _ID_ToKeep As Int32 = ID_ToKeep.Value
                    Dim _ID_ToCancel As Int32 = ID_ToCancel.Value
                    Dim hasAlreadyMerged As Boolean = ((From o In db.donor_merge_log Where o.donor_id_to_keep = _ID_ToKeep And o.donor_id_to_cancel = _ID_ToCancel Select o.id).Count() > 0)

                    ASPxButton_Save.Visible = (Not hasAlreadyMerged)
                    ASPxLabel_MSG_Success.Visible = hasAlreadyMerged

                End Using

            End If

        End If

    End Sub

    Protected Sub ASPxButton_Search_ToKeep_Click(sender As Object, e As EventArgs) Handles ASPxButton_Search_ToKeep.Click

        Navigation()

    End Sub

    Protected Sub ASPxButton_New_ToKeep_Click(sender As Object, e As EventArgs) Handles ASPxButton_New_ToKeep.Click

        Navigation(Nothing, ASPxTextBox_ID_ToCancel.Value)

    End Sub

    Protected Sub ASPxButton_New_ToCancel_Click(sender As Object, e As EventArgs) Handles ASPxButton_New_ToCancel.Click

        Navigation(ASPxTextBox_ID_ToKeep.Value, Nothing)

    End Sub

    Protected Sub ASPxButton_Search_ToCancel_Click(sender As Object, e As EventArgs) Handles ASPxButton_Search_ToCancel.Click

        Navigation()

    End Sub

    Protected Sub ASPxButton_Save_Click(sender As Object, e As EventArgs) Handles ASPxButton_Save.Click

        Try

            If ASPxTextBox_ID_ToKeep.ReadOnly And ASPxTextBox_ID_ToCancel.ReadOnly Then

                Using db As New Database(databaseName)

                    db.SP_UPDATE_MERGE_donor_id(ID_ToKeep, ID_ToCancel)

                End Using

            End If

            Navigation()

        Catch ex As Exception

            ASPxLabel_MSG_Failure.Visible = True

        End Try

    End Sub

    Protected Sub ASPxCheckBox_SearchByLegacyID_ToKeep_CheckedChanged(sender As Object, e As EventArgs) Handles ASPxCheckBox_SearchByLegacyID_ToKeep.CheckedChanged

        Navigation()

    End Sub

    Protected Sub ASPxCheckBox_SearchByLegacyID_ToCancel_CheckedChanged(sender As Object, e As EventArgs) Handles ASPxCheckBox_SearchByLegacyID_ToCancel.CheckedChanged

        Navigation()

    End Sub

#End Region

End Class