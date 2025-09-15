<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCHobbyV1.ascx.vb"
    Inherits="DirectAid.UCHobbyV1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource_hobby_tab" Width="100%" ClientInstanceName="ASPxGridView1" KeyFieldName="hobby_code" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" Caption="الهوايات و الانشطة">
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
        <dx:GridViewDataComboBoxColumn Caption="النوع" FieldName="hobby_type" VisibleIndex="2" Width="15%">
            <PropertiesComboBox DataSourceID="EntityDataSource_hobby_type" ValueType="System.Byte" ValueField="hobby_type_code" Width="100%" CallbackPageSize="5" DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" TextField="type_descr_ar">
                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    <RequiredField IsRequired="True" ErrorText=""></RequiredField>
                </ValidationSettings>
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="hobby_descar" VisibleIndex="3" Caption="الوصف - عربى" Width="35%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="hobby_code" Visible="False" VisibleIndex="1">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الوصف - انجليزى" FieldName="hobby_descren" VisibleIndex="4" Width="35%">
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
<asp:EntityDataSource ID="EntityDataSource_hobby_tab" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="hobby_tab" Where="" EntityTypeFilter="hobby_tab" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
</asp:EntityDataSource>







<asp:EntityDataSource ID="EntityDataSource_hobby_type" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="hobby_type" Where="" EntityTypeFilter="hobby_type" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
</asp:EntityDataSource>







