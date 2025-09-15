<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCSystemReportV1.ascx.vb"
    Inherits="DirectAid.UCSystemReportV1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<script type="text/javascript">
    function OnUpdateClick() {
        uploader.UploadFile();
    }
</script>
<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource_system_report"
    KeyFieldName="report_id" Width="100%" ClientInstanceName="ASPxGridView1" EnableCallbackAnimation="True">
    <Settings ShowFilterRow="True" />
    <Columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="20%">
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
        <dx:GridViewDataTextColumn FieldName="report_id" ReadOnly="True" VisibleIndex="5"
            Caption="ID" Visible="False">
            <EditFormSettings Visible="False" />
            <EditFormSettings Visible="False"></EditFormSettings>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="Module" FieldName="system_module_id" VisibleIndex="1"
            Width="20%">
            <PropertiesComboBox DataSourceID="EntityDataSource_system_module" TextField="namear" ValueField="id"
                ValueType="System.Byte">
                <ValidationSettings ErrorText="*">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="Unit" FieldName="system_unit_id" VisibleIndex="2"
            Width="20%">
            <PropertiesComboBox DataSourceID="EntityDataSource_system_unit" TextField="namear" ValueField="id"
                ValueType="System.Int16">
                <ValidationSettings ErrorText="*">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataHyperLinkColumn Caption="Report" FieldName="report_file_name" VisibleIndex="4" Visible="False">
            <EditFormSettings ColumnSpan="2" Visible="True" />
            <EditItemTemplate>
                <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ClientInstanceName="uploader" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" Size="35" Width="100%">
                    <ValidationSettings MaxFileSize="4000000">
                    </ValidationSettings>
                    <ClientSideEvents FileUploadComplete="function(s, e) { if (e.isValid) { ASPxGridView1.UpdateEdit(); }}" />
                    <UploadButton Text="Upload and Save">
                        <Image Url="~/Images/Upload_32x32.png">
                        </Image>
                    </UploadButton>
                </dx:ASPxUploadControl>
            </EditItemTemplate>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataHyperLinkColumn>
        <dx:GridViewDataColumn Caption="Download" FieldName="report_file_name" VisibleIndex="3" Width="25%">
            <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" NavigateUrl='<%# System.IO.Path.Combine(DirectAid.Constant.REPORTS_FOLDER, Eval("report_file_name") + ".rpt")%>' Text='<%# Eval("report_file_name")%>' Target="_blank">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
        <dx:GridViewDataTextColumn Caption="Name" FieldName="namear" VisibleIndex="2" Width="20%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn Caption="ظهور" FieldName="Visible" VisibleIndex="6" Width="15%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataCheckColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <Settings ShowFilterRow="True"></Settings>
    <SettingsText ConfirmDelete="Delete ?" />
</dx:ASPxGridView>
<asp:EntityDataSource ID="EntityDataSource_system_report" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False"
    EnableInsert="True" EnableUpdate="True" EntitySetName="system_report" AutoGenerateWhereClause="True"
    Where="" EntityTypeFilter="system_report">
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource_system_module" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="system_module" EntityTypeFilter="system_module">
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource_system_unit" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="system_unit" EntityTypeFilter="system_unit">
</asp:EntityDataSource>
