<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainData.master" CodeBehind="AcacdemicYearCodesDef.aspx.vb" Inherits="DirectAid.AcacdemicYearCodesDef" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource_academic_year_codes" Width="100%" ClientInstanceName="ASPxGridView1" KeyFieldName="acad_year_code" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" Caption="السنوات الدراسية">
        <SettingsCommandButton>
            <EditButton >
                <Image Url="~/Images/Edit_32x32.png">
                </Image>
            </EditButton>
            <NewButton >
                <Image Url="~/Images/New_32x32.png">
                </Image>
            </NewButton>
            <DeleteButton >
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
            <ClearFilterButton >
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </ClearFilterButton>
        </SettingsCommandButton>  
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Width="15%" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="acad_year_name" VisibleIndex="2" Caption="الوصف" Width="35%">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="acad_year_code" VisibleIndex="1" Caption="الكود">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ البداية" FieldName="acad_year_start_date" VisibleIndex="3">
            <PropertiesDateEdit>
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ الانتهاء" FieldName="acad_year_end_date" VisibleIndex="5">
            <PropertiesDateEdit>
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <SettingsPager AlwaysShowPager="True">
    </SettingsPager>
    <Settings ShowFilterRow="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

    <SettingsText ConfirmDelete="هل تريد الحذف؟" />
</dx:ASPxGridView>
<asp:EntityDataSource ID="EntityDataSource_academic_year_codes" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="academic_year_codes" Where="" EntityTypeFilter="academic_year_codes" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
</asp:EntityDataSource>







</asp:Content>
