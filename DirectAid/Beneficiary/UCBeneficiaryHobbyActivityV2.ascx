<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryHobbyActivityV2.ascx.vb"
    Inherits="DirectAid.UCBeneficiaryHobbyActivityV2" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" ClientInstanceName="ASPxGridView1" KeyFieldName="app_ser;hobby_code" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" Caption="الهوايات و الانشطة">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Width="15%">
            <EditButton>
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
        <dx:GridViewDataComboBoxColumn Caption="الوصف" FieldName="hobby_code" VisibleIndex="4" Width="45%">
            <PropertiesComboBox DataSourceID="EntityDataSource_view_hobby_tab" ValueType="System.Int16" ValueField="hobby_code" Width="100%" CallbackPageSize="5" DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" TextFormatString="{0} - {1}">
                <Columns>
                    <dx:ListBoxColumn Caption="النوع" FieldName="type_descr_ar" Width="25%" />
                    <dx:ListBoxColumn Caption="الوصف" FieldName="hobby_descar" Width="75%" />
                </Columns>
                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    <RequiredField IsRequired="True" ErrorText=""></RequiredField>
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings ColumnSpan="2" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="ser_no" Visible="False" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="app_ser" Visible="False" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="التاريخ" FieldName="AddedDate" VisibleIndex="6" Width="20%">
            <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="المستخدم" FieldName="AddedBy" VisibleIndex="4" Width="20%">
            <PropertiesComboBox DataSourceID="SqlDataSourceUsers" TextField="collect_namear" ValueField="collect_id">
            </PropertiesComboBox>
         <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <SettingsPager AlwaysShowPager="True">
    </SettingsPager>
    <Settings ShowFilterRow="True" />
    <SettingsText ConfirmDelete="هل تريد الحذف؟" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
    DeleteCommand="DELETE FROM [orphans_hobby] WHERE [app_ser] = @app_ser AND [hobby_code] = @hobby_code" 
    InsertCommand="INSERT INTO orphans_hobby(app_ser, hobby_code, AddedBy) VALUES (@app_ser, @hobby_code, @AddedBy)" 
    SelectCommand="SELECT * FROM [orphans_hobby] WHERE ([app_ser] = @app_ser)" >
    <DeleteParameters>
        <asp:QueryStringParameter Name="app_ser" QueryStringField="OrphanID" Type="Int32" />
        <asp:Parameter Name="hobby_code" Type="Int16" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter Name="app_ser" QueryStringField="OrphanID" Type="Int32" />
        <asp:Parameter Name="hobby_code" Type="Int16" />
        <asp:Parameter Name="AddedBy" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="app_ser" QueryStringField="OrphanID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:EntityDataSource ID="EntityDataSource_view_hobby_tab" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="view_hobby_tab" Where="" EntityTypeFilter="view_hobby_tab">
</asp:EntityDataSource>







<asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT [collect_id], [collect_namear] FROM [collectors_tab]"></asp:SqlDataSource>













