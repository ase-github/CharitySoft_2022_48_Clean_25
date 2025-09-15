
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView
Imports System.Linq
Imports DevExpress.Web

#End Region

Public Class UCBeneficiaryAllocationV5
    Inherits System.Web.UI.UserControl

#Region "Fields"

#End Region

#Region "Methods"

    Private Sub Loading()

        Using db As New Database

            Dim benfMaster As New benf_master

            Dim appSerial As Int32 = app_ser.Value

            benfMaster = (From o In db.benf_master Where o.app_ser = appSerial Select o).FirstOrDefault

            If Not benfMaster Is Nothing Then

                applicant_name_ar.Value = benfMaster.applicant_name_ar_1

                app_type.Value = benfMaster.app_type

            End If

        End Using

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'EntityDataSource_view_beneficiary_donor_source_all.ConnectionString = New EntityConnectionEx().TheConnectionString

        If Not IsPostBack And Not Page.IsCallback Then

            tran_date.Value = DateTime.Now
            app_ser.Value = Request.QueryString(QueryStringKey.OrphanID)
            Loading()

        End If

        grd_donor_allocate.Columns(String.Format("donor_name{0}", Session(SessionKey.CULTURE_ISO))).Visible = True
        grd_donor_allocate.Columns(String.Format("allocate_descr_{0}", Session(SessionKey.CULTURE_ISO))).Visible = True

        'Select Case Convert.ToByte(app_type.Value)
        '    Case BeneficiaryTypeEnum.Orphan
        '        LinqServerModeDataSource1.TableName = "view_beneficiary_donor_source_all_orphan"
        '    Case BeneficiaryTypeEnum.Student
        '        LinqServerModeDataSource1.TableName = "view_beneficiary_donor_source_all_student"
        '    Case BeneficiaryTypeEnum.Daaiya
        '        LinqServerModeDataSource1.TableName = "view_beneficiary_donor_source_all_daaya"
        'End Select

    End Sub

    Protected Sub LinqServerModeDataSource1_Selecting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceSelectEventArgs) Handles LinqServerModeDataSource1.Selecting

        Dim db As New Database()

        e.KeyExpression = "id"

        Dim app_type_value As Byte = Convert.ToByte(app_type.Value)

        Dim query = (From o In db.view_beneficiary_donor_source_all Where o.app_type = app_type_value Select o)

        e.QueryableSource = query

    End Sub

    Protected Sub ASPxGridView_Source_AfterPerformCallback(sender As Object, e As DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs) Handles ASPxGridView_Source.AfterPerformCallback

        Dim gv As ASPxGridView = DirectCast(sender, ASPxGridView)
        gv.JSProperties.Add("cpIsDELETEROW", Nothing)
        gv.JSProperties("cpIsDELETEROW") = (e.CallbackName = "DELETEROW")

    End Sub

    Protected Sub LinqServerModeDataSource1_Deleting(sender As Object, e As DevExpress.Data.Linq.LinqServerModeDataSourceEditEventArgs) Handles LinqServerModeDataSource1.Deleting

        Using db As New Database()

            Dim app_ser_Value As Int32 = app_ser.Value

            Dim donor_id_Value As Int32? = (From o In db.benf_master Where o.app_ser = app_ser_Value Select o.donor_id).FirstOrDefault()

            If donor_id_Value.HasValue Then

                Throw New Exception("لا يمكن الحفظ لوجود تخصيص سارى")

                e.Handled = True

            Else

                Dim donorID As Int32 = e.OldValues("donor_id_string")
                Dim receiptID As Int32 = e.OldValues("src_num")
                Dim amount As Decimal = e.OldValues("src_value")
                Dim src_fund_value As Byte = e.OldValues("src_fund")
                Dim tran_type_value As Byte = Convert.ToByte(Constant.ALLOCATION_OPERATION_ASSIGN)
                Dim allocation_date As DateTime? = tran_date.Value
                Dim reasons_Value As Int16? = 0
                Dim instead_of_app_ser_Value As Int32? = 0

                If replacement.Checked Then

                    If Not Int16.TryParse(reasons.Value, reasons_Value) Then

                        reasons_Value = Nothing

                    End If

                    If Not Int32.TryParse(instead_of_app_ser.Value, instead_of_app_ser_Value) Then

                        instead_of_app_ser_Value = Nothing

                    End If
                Else

                    reasons_Value = Nothing
                    instead_of_app_ser_Value = Nothing

                End If

                db.benf_master_donor_Update_V3(app_ser_Value, tran_type_value, donorID, reasons_Value, notes.Value, src_fund_value, receiptID, instead_of_app_ser_Value, allocation_date)

                db.SaveChanges()

                e.Handled = True

            End If

        End Using

    End Sub

    Protected Sub EntityDataSource_reasons_Selecting(sender As Object, e As EntityDataSourceSelectingEventArgs) Handles EntityDataSource_reasons.Selecting

        Select Case app_type.Value

            Case BeneficiaryTypeEnum.Orphan

                e.DataSource.WhereParameters("reason_cat").DefaultValue = Convert.ToByte(ReasonCategoryEnum.Orphan)

            Case BeneficiaryTypeEnum.Daaiya

                e.DataSource.WhereParameters("reason_cat").DefaultValue = Convert.ToByte(ReasonCategoryEnum.Daaiya)

        End Select

    End Sub

#End Region

End Class