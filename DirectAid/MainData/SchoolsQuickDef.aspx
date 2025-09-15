<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainData.master" CodeBehind="SchoolsQuickDef.aspx.vb" Inherits="DirectAid.SchoolsQuickDef" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource_school_master" Width="100%" ClientInstanceName="ASPxGridView1" KeyFieldName="school_code" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" Caption="المؤسسات التعليمية">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Width="15%">
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
            <CancelButton>
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </CancelButton>
            <UpdateButton>
                <Image Url="~/Images/Save_32x32.png">
                </Image>
            </UpdateButton>
            <ClearFilterButton Visible="True">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </ClearFilterButton>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="school_name_ar" VisibleIndex="3" Caption="الاسم - عربى" Width="35%">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="school_code" VisibleIndex="1" Caption="الكود">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الاسم - انجليزى" FieldName="school_name_en" VisibleIndex="4" Width="35%">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="النوع" FieldName="school_category" VisibleIndex="2">
            <PropertiesComboBox DataSourceID="EntityDataSource_organization_type" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" TextField="org_type_ar" ValueField="org_type_code">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="المدينة" FieldName="country_city" VisibleIndex="6">
            <PropertiesComboBox DataSourceID="EntityDataSource_city" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" TextField="city_name_ar" ValueField="city_id">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <SettingsPager AlwaysShowPager="True">
    </SettingsPager>
    <Settings ShowFilterRow="True" />
    <SettingsText ConfirmDelete="هل تريد الحذف؟" />
</dx:ASPxGridView>
<asp:EntityDataSource ID="EntityDataSource_school_master" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="school_master" Where="" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
</asp:EntityDataSource>







<asp:EntityDataSource ID="EntityDataSource_city" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="cities" Where="" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
</asp:EntityDataSource>







<asp:EntityDataSource ID="EntityDataSource_organization_type" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="organization_type" Where="" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
</asp:EntityDataSource>







</asp:Content>
