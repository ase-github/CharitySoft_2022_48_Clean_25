<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainData.master" CodeBehind="HealthFacilitationsDef.aspx.vb" Inherits="DirectAid.HealthFacilitationsDef" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource_health_facilitation_master" Width="100%" ClientInstanceName="ASPxGridView1" KeyFieldName="ID" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" Caption="التيسير">
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
        <dx:GridViewDataTextColumn FieldName="Facilitation_name_ar" VisibleIndex="3" Caption="الوصف - عربى" Width="35%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="ID" Visible="False" VisibleIndex="1">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الوصف - انجليزى" FieldName="Facilitation_name_en" VisibleIndex="4" Width="35%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <SettingsPager AlwaysShowPager="True">
    </SettingsPager>
    <Settings ShowFilterRow="True" />
    <SettingsText ConfirmDelete="هل تريد الحذف؟" />
</dx:ASPxGridView>
<asp:EntityDataSource ID="EntityDataSource_health_facilitation_master" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="health_facilitation_master" Where="" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
</asp:EntityDataSource>







</asp:Content>
