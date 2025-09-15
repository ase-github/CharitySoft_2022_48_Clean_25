<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectPhaseDocument.ascx.vb"
    Inherits="DirectAid.UCProjectPhaseDocument" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>


<dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ShowProgressPanel="True"
    ShowUploadButton="True" UploadMode="Advanced" Width="100%" ClientInstanceName="ASPxUploadControl1"
    meta:resourcekey="ASPxUploadControl1Resource1">
    <ClientSideEvents FilesUploadComplete="function(s, e) {
	ASPxGridView1.Refresh();
}" FileUploadComplete="function(s, e) {
	ASPxGridView1.Refresh();
}" />
    <AdvancedModeSettings EnableMultiSelect="True" />
</dx:ASPxUploadControl>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    KeyFieldName="doc_id" Caption="Documents" DataSourceID="SqlDataSource_project_documents"
    ClientInstanceName="ASPxGridView1" meta:resourcekey="ASPxGridView1Resource1">
    <Columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="100px">
            <EditButton Visible="True">
                <Image Url="~/Images/Edit_32x32.png">
                </Image>
            </EditButton>
            <NewButton>
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
            <UpdateButton Visible="True">
                <Image Url="~/Images/Save_32x32.png">
                </Image>
            </UpdateButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="doc_id" ReadOnly="True" VisibleIndex="1" 
            Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataHyperLinkColumn Caption="الوثيقه" FieldName="doc_path" 
            VisibleIndex="2" Width="100px">
            <PropertiesHyperLinkEdit EnableClientSideAPI="True" TextFormatString="{0}" 
                Text="...">
            </PropertiesHyperLinkEdit>
            <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataHyperLinkColumn>
        <dx:GridViewDataMemoColumn Caption="Details" FieldName="doc_details" 
            VisibleIndex="4">
            <EditFormSettings ColumnSpan="3" />
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataMemoColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
    <SettingsPager PageSize="5" RenderMode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource_project_documents" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [project_documents] WHERE [doc_id] = @original_doc_id"
    InsertCommand="INSERT INTO [project_documents] ([doc_id], [project_progress_id], [doc_details],doc_path) VALUES (@doc_id, @project_progress_id, @doc_details, @doc_path)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_documents] WHERE ([project_progress_id] = @project_progress_id)"
    UpdateCommand="UPDATE [project_documents] SET  [doc_details] = @doc_details WHERE [doc_id] = @original_doc_id ">
    <DeleteParameters>
        <asp:Parameter Name="original_doc_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:SessionParameter DefaultValue="0" Name="project_progress_id" SessionField="project_progress_id"
            Type="Int32" />
        <asp:Parameter Name="doc_id" Type="Int32" />
        <asp:Parameter Name="doc_details" Type="String" />
        <asp:Parameter Name="doc_path" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="project_progress_id" SessionField="project_progress_id"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="doc_details" Type="String" />
        <asp:Parameter Name="original_doc_id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_GetNextID" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT isnull(max(doc_id), 0) + 1 as id FROM project_documents">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="project_progress_id" SessionField="project_progress_id"
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
