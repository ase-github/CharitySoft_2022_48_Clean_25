<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="UIProjectType.aspx.vb" Inherits="DirectAid.UIProjectType" Culture="auto"
    UICulture="auto" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
        DataSourceID="SqlDataSource_GenericIDName" KeyFieldName="project_type" meta:resourcekey="ASPxGridView1Resource1"
        Caption="انواع المشاريع">
        <Columns>
            <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="10%" meta:resourcekey="GridViewCommandColumnResource1">
                <EditButton Visible="True">
                    <Image Url="~/Images/Edit_32x32.png">
                    </Image>
                </EditButton>
                <NewButton Visible="True">
                    <Image Url="~/Images/New_32x32.png">
                    </Image>
                </NewButton>
                <DeleteButton Visible="True">
                    <Image Url="~/Images/Delete_32x32.png">
                    </Image>
                </DeleteButton>
                <CancelButton Visible="True">
                    <Image Url="~/Images/Cancel_32x32.png">
                    </Image>
                </CancelButton>
                <ClearFilterButton Visible="True">
                    <Image Url="~/Images/Cancel_32x32.png">
                    </Image>
                </ClearFilterButton>
                <UpdateButton Visible="True">
                    <Image Url="~/Images/Save_32x32.png">
                    </Image>
                </UpdateButton>
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="project_type" VisibleIndex="1" Width="15%"
                Caption="الرقم" meta:resourcekey="GridViewDataTextColumnResource6">
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="project_type_name_ar" VisibleIndex="3" Width="25%"
                Caption="البيان باللغه العربيه" meta:resourcekey="GridViewDataTextColumnResource4">
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="project_type_name_en" VisibleIndex="4" Width="25%"
                Caption="البيان باللغه الانجليزيه" meta:resourcekey="GridViewDataTextColumnResource5">
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="تصنيف المشروع" FieldName="project_class"
                Width="25%" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="SqlDataSource_PROJECT_CLASS" TextField="project_class_name_ar"
                    ValueField="project_class" ValueType="System.Int16">
                </PropertiesComboBox>
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <Settings ShowFilterRow="True" />
        <Settings ShowFilterRow="True"></Settings>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource_GenericIDName" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        DeleteCommand="DELETE FROM [project_type] WHERE [project_type] = @original_project_type AND [project_type_name_ar] = @original_project_type_name_ar AND [project_type_name_en] = @original_project_type_name_en AND [project_class] = @original_project_class"
        InsertCommand="INSERT INTO [project_type] ([project_type], [project_type_name_ar], [project_type_name_en], [project_class]) VALUES (@project_type, @project_type_name_ar, @project_type_name_en, @project_class)"
        SelectCommand="SELECT * FROM [project_type]" UpdateCommand="UPDATE [project_type] SET [project_type_name_ar] = @project_type_name_ar, [project_type_name_en] = @project_type_name_en, [project_class] = @project_class WHERE [project_type] = @original_project_type AND [project_type_name_ar] = @original_project_type_name_ar AND [project_type_name_en] = @original_project_type_name_en AND [project_class] = @original_project_class"
        ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_project_type" Type="Int32" />
            <asp:Parameter Name="original_project_type_name_ar" Type="String" />
            <asp:Parameter Name="original_project_type_name_en" Type="String" />
            <asp:Parameter Name="original_project_class" Type="Int16" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="project_type" Type="Int32" />
            <asp:Parameter Name="project_type_name_ar" Type="String" />
            <asp:Parameter Name="project_type_name_en" Type="String" />
            <asp:Parameter Name="project_class" Type="Int16" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="project_type_name_ar" Type="String" />
            <asp:Parameter Name="project_type_name_en" Type="String" />
            <asp:Parameter Name="project_class" Type="Int16" />
            <asp:Parameter Name="original_project_type" Type="Int32" />
            <asp:Parameter Name="original_project_type_name_ar" Type="String" />
            <asp:Parameter Name="original_project_type_name_en" Type="String" />
            <asp:Parameter Name="original_project_class" Type="Int16" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_PROJECT_CLASS" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        SelectCommand="SELECT * FROM [project_class]"></asp:SqlDataSource>
</asp:Content>
