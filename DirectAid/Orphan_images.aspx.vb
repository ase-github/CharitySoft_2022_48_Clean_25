#Region "Imports Directives"

Imports DevExpress.Web.ASPxGridView
Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxUploadControl
Imports System.Web.UI
Imports System.IO
Imports System.Drawing
Imports DevExpress.Web

#End Region

Public Class Orphan_images


    Inherits BaseWebForm
    Dim WS As New DataAccessLibrary

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Me.txt_app_ser.Attributes.Add("onkeydown", "Search();")

        If Not IsPostBack Then


            'For Testing, username and password must be enter from Login Form
            'Session("username") = "sa"
            'Session("password") = "pass@word1"




            If Not Session("orphans_app_ser") Is Nothing And Not Session("orphans_app_name") Is Nothing Then
                Me.txt_app_ser.Text = Session("orphans_app_ser")
                Me.txt_orphan_name.Text = Session("orphans_app_name")
                lnk_search_rtn_ServerClick(sender, e)
            End If

            Fill_DDL()

            Session("form_flg") = "orphan_images"
            Session("orph_type") = 0

        End If
    End Sub


    Public Sub Fill_DDL()
        Dim DDL_DS As DataSet
        Dim SQL As String


        'Session("username") = "sa"
        'Session("password") = "pass@word1"



        'Fill Nat 
        SQL = "select * from application_attach_type"

        DDL_DS = New DataSet
        DDL_DS = WS.GetMyData("charitysoft", Session("username"), Session("password"), SQL)
        Me.ddl_attach_type.DataSource = DDL_DS.Tables(0)
        ddl_attach_type.DataTextField = "type_name"
        ddl_attach_type.DataValueField = "type_id"
        ddl_attach_type.DataBind()
        '  ddl_nat.Items.Insert(0, "")
        DDL_DS.Clear()
        DDL_DS = Nothing











    End Sub

    Protected Sub ASPxUploadControl1_FileUploadComplete(sender As Object, e As DevExpress.Web.FileUploadCompleteEventArgs) Handles ASPxUploadControl1.FileUploadComplete
        Save_Photos(e.UploadedFile)
    End Sub

    Sub Save_Photos(ByVal uploadedFile As UploadedFile)
        If (uploadedFile.IsValid) Then

            'Directory.CreateDirectory(Path.Combine(MapPath(Constant.Images)))
            'Directory.CreateDirectory(Path.Combine(MapPath(Constant.Images), Session(SessionName.PROJECT_ID), Session(SessionName.PROJECTPHASE_ID)))

            Dim logicalPath As String = Path.Combine(Constant.Orphans_Images, uploadedFile.FileName)
            Dim physicalPath As String = MapPath(logicalPath)

            Using original As Image = Image.FromStream(uploadedFile.FileContent)

                original.Save(physicalPath)

            End Using

            Me.txt_app_ser.Text = Session("orphans_app_ser")

            dts_pic.InsertParameters("attach_code").DefaultValue = Session("attach_type")
            dts_pic.InsertParameters("attachment_image").DefaultValue = logicalPath
            dts_pic.InsertParameters("attach_date").DefaultValue = dt_attach_date.Date
            dts_pic.Insert()
        End If
    End Sub


    Private Sub lnk_search_rtn_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search_rtn.ServerClick
        Dim ds As New DataSet
        Dim BenefParam As Object

        If Session("app_ser_from_srch") <> "" Then
            Me.txt_app_ser.Text = Session("app_ser_from_srch")
        End If



        BenefParam = Me.txt_app_ser.Text
        ds = WS.ExecSpResultSet("charitysoft", Session("username"), Session("password"), "Get_orph_name", ServiceReference.CommandType.StoredProcedure, BenefParam)

        If ds.Tables(0).Rows.Count > 0 Then

            Me.txt_orphan_name.Text = If(IsDBNull(ds.Tables(0).Rows(0)(0)), String.Empty, ds.Tables(0).Rows(0)(0))
        End If

        ds.Clear()
        ds = Nothing

        Me.txt_app_ser.Focus()
        Session("app_ser_from_srch") = ""
        Session("orphans_app_ser") = Me.txt_app_ser.Text
        Session("orphans_app_name") = Me.txt_orphan_name.Text
    End Sub

    Private Sub lnk_search_ServerClick(sender As Object, e As System.EventArgs) Handles lnk_search.ServerClick
        'Try


        'clear screen
        Clear_Frm(Me)

        Me.txt_app_ser.Focus()

        'Catch ex As Exception

        'End Try
    End Sub

    Sub Clear_Frm(ByVal container As Control)
        Try
            Dim control As Control

            For Each control In container.Controls

                ClearControl(control)

                If control.HasControls() Then
                    Clear_Frm(control)
                End If
            Next

        Catch ex As Exception

        End Try
    End Sub

    Sub ClearControl(ByRef control As Control)
        Try

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

        Catch ex As Exception

        End Try
    End Sub

    Private Sub ddl_attach_type_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddl_attach_type.SelectedIndexChanged
        Session("attach_type") = ddl_attach_type.SelectedValue
    End Sub
End Class