Imports DevExpress.Web
Imports DevExpress.Web.ASPxGridView

Public Class UIGenericIDName
    Inherits System.Web.UI.Page

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim tableName As String = ""
        Dim idFieldName As String = ""
        Dim nameArFieldName As String = ""
        Dim nameEnFieldName As String = ""
        Dim caption As String = ""
        Dim insertID As Boolean = False
        Dim idTypeCode As TypeCode

        Select Case Request.QueryString("TableName")

            Case TableNameConstant.FUNDING_SOURCE
                tableName = TableNameConstant.FUNDING_SOURCE
                idFieldName = "id"
                nameArFieldName = "namear"
                nameEnFieldName = "nameen"
                caption = "مصدر التمويل"
                insertID = False
                idTypeCode = TypeCode.Int32

            Case TableNameConstant.PROJECT_CLASS
                tableName = TableNameConstant.PROJECT_CLASS
                idFieldName = "project_class"
                nameArFieldName = "project_class_name_ar"
                nameEnFieldName = "project_class_name_en"
                caption = "تصنيف المشروع"
                insertID = True
                idTypeCode = TypeCode.Int16

            Case TableNameConstant.REQUEST_ORG
                tableName = TableNameConstant.REQUEST_ORG
                idFieldName = "org_id"
                nameArFieldName = "org_name_ar"
                nameEnFieldName = "org_name_en"
                caption = "الجهات الطالبه"
                insertID = True
                idTypeCode = TypeCode.Int32

            Case TableNameConstant.PROJECT_TARGET
                tableName = TableNameConstant.PROJECT_TARGET
                idFieldName = "target_id"
                nameArFieldName = "target_name_ar"
                nameEnFieldName = "target_name_eng"
                caption = "الجهات المستهدفه"
                insertID = True
                idTypeCode = TypeCode.Int32

            Case TableNameConstant.PROJECT_STATUS
                tableName = TableNameConstant.PROJECT_STATUS
                idFieldName = "project_status_id"
                nameArFieldName = "project_status_name_ar"
                nameEnFieldName = "project_status_name_eng"
                caption = "وضع المشروع"
                insertID = True
                idTypeCode = TypeCode.Int32

            Case TableNameConstant.UNIT_OF_MEASURE
                tableName = TableNameConstant.UNIT_OF_MEASURE
                idFieldName = "id"
                nameArFieldName = "name_ar"
                nameEnFieldName = "name_en"
                caption = "وحدات القياس"
                insertID = True
                idTypeCode = TypeCode.Int16

            Case TableNameConstant.FACILITIES_TYPES
                tableName = TableNameConstant.FACILITIES_TYPES
                idFieldName = "fcl_type_id"
                nameArFieldName = "fcl_type_name_ar"
                nameEnFieldName = "fcl_type_name_en"
                caption = "انواع المرافق"
                insertID = True
                idTypeCode = TypeCode.Int32


            Case TableNameConstant.DONOR_IMPORTANCE
                tableName = TableNameConstant.DONOR_IMPORTANCE
                idFieldName = "ID"
                nameArFieldName = "NameAr"
                nameEnFieldName = "NameEn"
                caption = "اهميه المتبرع"
                insertID = False
                idTypeCode = TypeCode.Int16

            Case Else
                tableName = Request.QueryString("TableName")
                idFieldName = "ID"
                nameArFieldName = "NameAr"
                nameEnFieldName = "NameEn"
                caption = ""
                insertID = True
                idTypeCode = TypeCode.Int32

        End Select

        SqlDataSource_GenericIDName.SelectCommand = SqlDataSource_GenericIDName.SelectCommand.Replace("[TableName]", tableName)

        SqlDataSource_GenericIDName.InsertCommand = SqlDataSource_GenericIDName.InsertCommand.Replace("[TableName]", tableName)
        If insertID Then
            SqlDataSource_GenericIDName.InsertCommand = SqlDataSource_GenericIDName.InsertCommand.Replace("[ID]", idFieldName)
            SqlDataSource_GenericIDName.InsertCommand = SqlDataSource_GenericIDName.InsertCommand.Replace("@ID,", String.Format("(SELECT ISNULL(MAX({0}) , 0) + 1  FROM {1}),", idFieldName, tableName))
        Else
            SqlDataSource_GenericIDName.InsertCommand = SqlDataSource_GenericIDName.InsertCommand.Replace("[ID],", "")
            SqlDataSource_GenericIDName.InsertCommand = SqlDataSource_GenericIDName.InsertCommand.Replace("@ID,", "")
        End If
        SqlDataSource_GenericIDName.InsertCommand = SqlDataSource_GenericIDName.InsertCommand.Replace("[NameAR]", nameArFieldName)
        SqlDataSource_GenericIDName.InsertCommand = SqlDataSource_GenericIDName.InsertCommand.Replace("[NameEN]", nameEnFieldName)

        SqlDataSource_GenericIDName.UpdateCommand = SqlDataSource_GenericIDName.UpdateCommand.Replace("[TableName]", tableName)
        SqlDataSource_GenericIDName.UpdateCommand = SqlDataSource_GenericIDName.UpdateCommand.Replace("[ID]", idFieldName)
        SqlDataSource_GenericIDName.UpdateCommand = SqlDataSource_GenericIDName.UpdateCommand.Replace("[NameAR]", nameArFieldName)
        SqlDataSource_GenericIDName.UpdateCommand = SqlDataSource_GenericIDName.UpdateCommand.Replace("[NameEN]", nameEnFieldName)
        SqlDataSource_GenericIDName.UpdateParameters("original_ID").Type = idTypeCode

        SqlDataSource_GenericIDName.DeleteCommand = SqlDataSource_GenericIDName.DeleteCommand.Replace("[TableName]", tableName)
        SqlDataSource_GenericIDName.DeleteCommand = SqlDataSource_GenericIDName.DeleteCommand.Replace("[ID]", idFieldName)
        SqlDataSource_GenericIDName.DeleteCommand = SqlDataSource_GenericIDName.DeleteCommand.Replace("[NameAR]", nameArFieldName)
        SqlDataSource_GenericIDName.DeleteCommand = SqlDataSource_GenericIDName.DeleteCommand.Replace("[NameEN]", nameEnFieldName)
        SqlDataSource_GenericIDName.DeleteParameters("original_ID").Type = idTypeCode

        CType(ASPxGridView1.Columns(1), GridViewDataColumn).FieldName = idFieldName
        CType(ASPxGridView1.Columns(2), GridViewDataColumn).FieldName = nameArFieldName
        CType(ASPxGridView1.Columns(3), GridViewDataColumn).FieldName = nameEnFieldName

        ASPxGridView1.KeyFieldName = idFieldName

        ASPxGridView1.Caption = caption

    End Sub

    Protected Sub ASPxGridView1_RowInserting(sender As Object, e As DevExpress.Web.Data.ASPxDataInsertingEventArgs) Handles ASPxGridView1.RowInserting
        ViewState("NameAr") = e.NewValues(0)
        ViewState("NameEn") = e.NewValues(1)
    End Sub

    Protected Sub SqlDataSource_GenericIDName_Inserting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource_GenericIDName.Inserting
        e.Command.Parameters("@NameAR").Value = ViewState("NameAr")
        e.Command.Parameters("@NameEn").Value = ViewState("NameEn")
    End Sub

    Protected Sub ASPxGridView1_RowUpdating(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs) Handles ASPxGridView1.RowUpdating
        ViewState("ID") = e.Keys(0)
        ViewState("NameAr") = e.NewValues(0)
        ViewState("NameEn") = e.NewValues(1)
    End Sub

    Protected Sub SqlDataSource_GenericIDName_Updating(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource_GenericIDName.Updating
        e.Command.Parameters("@original_ID").Value = ViewState("ID")
        e.Command.Parameters("@NameAR").Value = ViewState("NameAr")
        e.Command.Parameters("@NameEn").Value = ViewState("NameEn")
    End Sub

    Protected Sub ASPxGridView1_RowDeleting(sender As Object, e As DevExpress.Web.Data.ASPxDataDeletingEventArgs) Handles ASPxGridView1.RowDeleting
        ViewState("ID") = e.Keys(0)
    End Sub

    Protected Sub SqlDataSource_GenericIDName_Deleting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles SqlDataSource_GenericIDName.Deleting
        e.Command.Parameters("@original_ID").Value = ViewState("ID")
    End Sub

#End Region

End Class