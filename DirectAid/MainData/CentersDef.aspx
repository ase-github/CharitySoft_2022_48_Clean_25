<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainData.master" CodeBehind="CentersDef.aspx.vb" Inherits="DirectAid.CentersDef" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource_center_tab" Width="100%" ClientInstanceName="ASPxGridView1" KeyFieldName="center_code" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" Caption="المراكز">
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
            <dx:GridViewDataTextColumn FieldName="center_namear" VisibleIndex="3" Caption="الوصف - عربى" Width="35%">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="center_code" Visible="False" VisibleIndex="1" Caption="الكود">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="الوصف - انجليزى" FieldName="center_nameen" VisibleIndex="4" Width="35%">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="الدوله" FieldName="region_code" VisibleIndex="2">
            <PropertiesComboBox DataSourceID="EntityDataSource_nat_tab" IncrementalFilteringMode="Contains" TextField="nat_descrar" ValueField="nat_code" ValueType="System.Int16">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsPager AlwaysShowPager="True">
        </SettingsPager>
        <Settings ShowFilterRow="True" />
        <SettingsText ConfirmDelete="هل تريد الحذف؟" />
    </dx:ASPxGridView>
    <asp:EntityDataSource ID="EntityDataSource_center_tab" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="center_tab" Where="" EntityTypeFilter="center_tab" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:EntityDataSource>







    <asp:EntityDataSource ID="EntityDataSource_nat_tab" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="nat_tab" Where="" EntityTypeFilter="nat_tab" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:EntityDataSource>







</asp:Content>
