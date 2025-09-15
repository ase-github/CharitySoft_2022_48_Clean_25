
#Region "Imports Directives"

Imports System.Globalization
Imports System.Data
Imports System.Data.SqlClient
Imports System.Threading

#End Region

Public Class UCOrphanAllocation
    Inherits System.Web.UI.UserControl

#Region "Fields"

    Protected _culture As String

    Dim WS As New DataAccessLibrary

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
            Case "TextBox"
                CType(control, TextBox).Text = ""
            Case "DropDownList"
                CType(control, DropDownList).SelectedIndex = 0
            Case "DataGrid"
                CType(control, DataGrid).DataSource = Nothing
                control.DataBind()

            Case Else
        End Select

    End Sub

    Public Sub Fill_DDL()
        Dim DDL_DS As DataSet
        Dim SQL As String


        'Session("username") = "sa"
        'Session("password") = "pass@word1"



        'Fill  REASONS
        'SQL = "select * from reason_tab WHERE reason_cat = 2"
        'DDL_DS = New DataSet
        'DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        'Me.ddl_reasons.DataSource = DDL_DS.Tables(0)
        'ddl_reasons.DataTextField = "reason_ar"
        'ddl_reasons.DataValueField = "reason_code"
        'ddl_reasons.DataBind()

        'DDL_DS.Clear()
        'DDL_DS = Nothing


        'fill tran_type
        SQL = "select * from allocation_trans_cat WHERE allocate_cat = 0"
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_trans_type.DataSource = DDL_DS.Tables(0)
        ddl_trans_type.DataTextField = "allocate_descr_ar"
        ddl_trans_type.DataValueField = "allocate_code"
        ddl_trans_type.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing



        'Fill  Donor name
        SQL = "select top 10 donor_id,donor_namear,donor_nameen from donor_data "
        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_donor_name.DataSource = DDL_DS.Tables(0)
        ddl_donor_name.DataTextField = "donor_namear"
        ddl_donor_name.DataValueField = "donor_id"
        ddl_donor_name.DataBind()

        DDL_DS.Clear()
        DDL_DS = Nothing



    End Sub

    Sub ShowAlert(ByVal message As String)
        ScriptManager.RegisterStartupScript(Me.UpdatePanel, UpdatePanel.GetType(), "notificationScript", "<script language='JavaScript'> alert('" & message & "'); </script>", False)
    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        dts_donor_allocate.ConnectionString = New ConnectionStringEx().TheConnectionString

        'Try




        If Not IsPostBack Then

            'Get the Page Culture to pass it to the clien side
            If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then

                _culture = "ar"

            ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then

                _culture = "en"

            End If

            'For Testing, username and password must be enter from Login Form
            'Session("username") = "sa"
            'Session("password") = "pass@word1"

            Session("Toolbar_Flag") = 0
            Me.Literal1.Text = ""
            Me.txt_transaction_date.Date = DateTime.Now.Date

            'Fill DropdownLists
            Fill_DDL()



            Me.txt_app_ser.Attributes.Add("onkeydown", "Search();")
            'Me.txt_name_ar_5.Attributes.Add("OnBlur", "GetFatherName();")



            Session("form_flg") = "allocate_doner"

            If Session("orph_type") = 0 Then
                Me.ddl_benf_type.SelectedIndex = 0
                ddl_benf_type_SelectedIndexChanged(sender, e)
            Else
                Me.ddl_benf_type.SelectedIndex = 1
                ddl_benf_type_SelectedIndexChanged(sender, e)
            End If
        End If

        If Not Session("orphans_app_ser") Is Nothing And Not Session("orphans_app_name") Is Nothing Then
            Me.txt_app_ser.Text = Session("orphans_app_ser")
            Me.txt_orphan_name.Text = Session("orphans_app_name")
            lnk_search_rtn_ServerClick(sender, e)
        End If



        'Catch ex As Exception

        'End Try
    End Sub

    Private Sub lnk_save_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_save.ServerClick

        If (Me.txt_app_ser.Text = "") Or Val(Me.txt_app_ser.Text) <= 0 Then
            ShowAlert("الرجاء تحديد رقم اليتيم")
            Exit Sub
        End If



        'Conditions


        Dim orphanParam() As Object = {Convert.ToInt16(Me.txt_app_ser.Text),
                                                        Convert.ToInt16(Me.ddl_trans_type.SelectedIndex),
                                                        Convert.ToInt16(Me.ddl_donor_name.SelectedValue),
                                                        Convert.ToInt16(Me.ddl_reasons.SelectedValue),
                                                        IIf(String.IsNullOrWhiteSpace(Me.txt_notes.Text), "", Me.txt_notes.Text)
                                                      }


        ' save new row   

        WS.ExecSp("charitysoft", Session(SessionKey.USERNAME), Session(SessionKey.PASSWORD), "benf_master_donor_Update", CommandType.StoredProcedure, orphanParam)



        If (CultureInfo.CurrentUICulture.Name.Contains("ar")) Then
            ShowAlert("تم حفظ ملف المتبرع بنجاح")
        ElseIf (CultureInfo.CurrentUICulture.Name.Contains("en")) Then
            ShowAlert("Donor Profile Saved Successfully")
        End If
    End Sub

    Private Sub lnk_search_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search.ServerClick
        'clear screen
        Clear_Frm(Me)


        Session("orph_education_flg") = 1
        Me.Literal1.Text = ""
        Me.txt_app_ser.Enabled = True
        Me.txt_transaction_date.Date = DateTime.Now.Date
    End Sub

    Private Sub lnk_search_rtn_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search_rtn.ServerClick



        Dim OrphanName_Ds As DataSet
        Dim SQL As String

        Dim BenefParam As Object
        Dim BenefMaster_DS As DataSet

        If Session("app_ser_from_srch") <> "" Then
            Me.txt_app_ser.Text = Session("app_ser_from_srch")
        End If


        SQL = "select app_ser,applicant_name_ar_1 + '  ' + applicant_name_ar_2 + '  ' + applicant_name_ar_3 + '  ' + applicant_name_ar_4 + '  ' + applicant_name_ar_5 AS oprhan_name from benf_master where app_ser =" & Val(Me.txt_app_ser.Text)
        OrphanName_Ds = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        If OrphanName_Ds.Tables(0).Rows.Count > 0 Then
            Me.txt_orphan_name.Text = OrphanName_Ds.Tables(0).Rows(0)(1).ToString
        End If

        BenefParam = Me.txt_app_ser.Text
        BenefMaster_DS = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "GetDonorAllocate", CommandType.StoredProcedure, BenefParam)





        If BenefMaster_DS.Tables(0).Rows.Count > 0 Then

            Me.txt_transaction_date.Date = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(2)), String.Empty, CDate(BenefMaster_DS.Tables(0).Rows(0)(2)))
            Me.ddl_trans_type.SelectedIndex = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(3)), 0, BenefMaster_DS.Tables(0).Rows(0)(3))
            Me.ddl_donor_name.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(4)), 0, BenefMaster_DS.Tables(0).Rows(0)(4))
            Me.ddl_reasons.SelectedValue = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(5)), 0, BenefMaster_DS.Tables(0).Rows(0)(5))
            Me.txt_notes.Text = If(IsDBNull(BenefMaster_DS.Tables(0).Rows(0)(6)), String.Empty, BenefMaster_DS.Tables(0).Rows(0)(6))

        End If





        Session("app_ser_from_srch") = ""
        Session("orphans_app_ser") = Me.txt_app_ser.Text
        Session("orphans_app_name") = Me.txt_orphan_name.Text


    End Sub

    Protected Sub ddl_benf_type_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddl_benf_type.SelectedIndexChanged
        Dim SQL As String
        Dim DDL_DS As DataSet

        If Me.ddl_benf_type.SelectedIndex = 0 Then

            'Fill  REASONS
            SQL = "select * from reason_tab WHERE reason_cat = 2"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_reasons.DataSource = DDL_DS.Tables(0)
            ddl_reasons.DataTextField = "reason_ar"
            ddl_reasons.DataValueField = "reason_code"
            ddl_reasons.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing

            'fill tran_type
            SQL = "select * from allocation_trans_cat WHERE allocate_cat = 0"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_trans_type.DataSource = DDL_DS.Tables(0)
            ddl_trans_type.DataTextField = "allocate_descr_ar"
            ddl_trans_type.DataValueField = "allocate_code"
            ddl_trans_type.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing

        ElseIf Me.ddl_benf_type.SelectedIndex = 1 Then
            'Fill  REASONS
            SQL = "select * from reason_tab WHERE reason_cat = 6"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_reasons.DataSource = DDL_DS.Tables(0)
            ddl_reasons.DataTextField = "reason_ar"
            ddl_reasons.DataValueField = "reason_code"
            ddl_reasons.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing


            'fill tran_type
            SQL = "select * from allocation_trans_cat WHERE allocate_cat = 0"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_trans_type.DataSource = DDL_DS.Tables(0)
            ddl_trans_type.DataTextField = "allocate_descr_ar"
            ddl_trans_type.DataValueField = "allocate_code"
            ddl_trans_type.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing

        ElseIf Me.ddl_benf_type.SelectedIndex = 2 Then
            'Fill  REASONS
            SQL = "select * from reason_tab WHERE reason_cat = 7"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_reasons.DataSource = DDL_DS.Tables(0)
            ddl_reasons.DataTextField = "reason_ar"
            ddl_reasons.DataValueField = "reason_code"
            ddl_reasons.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing



            'fill tran_type
            SQL = "select * from allocation_trans_cat WHERE allocate_cat = 0"
            DDL_DS = New DataSet
            DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
            Me.ddl_trans_type.DataSource = DDL_DS.Tables(0)
            ddl_trans_type.DataTextField = "allocate_descr_ar"
            ddl_trans_type.DataValueField = "allocate_code"
            ddl_trans_type.DataBind()

            DDL_DS.Clear()
            DDL_DS = Nothing
        End If

    End Sub

#End Region

End Class