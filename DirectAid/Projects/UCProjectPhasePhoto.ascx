<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectPhasePhoto.ascx.vb"
    Inherits="DirectAid.UCProjectPhasePhoto" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>


<%  If (DesignMode) Then%>
<script src="ASPxScriptIntelliSense.js" type="text/javascript"></script>
<%  End If%>
<dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ShowProgressPanel="True"
    ShowUploadButton="True" UploadMode="Advanced" Width="100%" ClientInstanceName="ASPxUploadControl1"
    meta:resourcekey="ASPxUploadControl1Resource1">
    <ClientSideEvents FilesUploadComplete="function(s, e) {
	ASPxGridView_project_photos.Refresh();
}" FileUploadComplete="function(s, e) {
	ASPxGridView_project_photos.Refresh();
}" />
    <AdvancedModeSettings EnableMultiSelect="True" />
</dx:ASPxUploadControl>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    KeyFieldName="photo_id" Caption="Photos" DataSourceID="SqlDataSource_project_photos"
    ClientInstanceName="ASPxGridView_project_photos" meta:resourcekey="ASPxGridView1Resource1">
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
        <dx:GridViewDataTextColumn FieldName="photo_id" ReadOnly="True" VisibleIndex="1"
            Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataImageColumn Caption="Photo" FieldName="photo_path" VisibleIndex="2"
            Width="100px">
            <PropertiesImage DisplayFormatString="{0}" EnableClientSideAPI="True" ImageHeight="100px"
                ImageWidth="100px">
            </PropertiesImage>
            <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataImageColumn>
        <dx:GridViewDataMemoColumn Caption="Notes" FieldName="photo_notes" VisibleIndex="4"
            Width="100%">
            <EditFormSettings ColumnSpan="2" />
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
<asp:SqlDataSource ID="SqlDataSource_project_photos" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [project_photos] WHERE [photo_id] = @original_photo_id"
    InsertCommand="INSERT INTO project_photos(photo_id, project_progress_id, photo_path, photo_notes, Photo) VALUES (@photo_id, @project_progress_id, @photo_path, @photo_notes, @Photo)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_photos] WHERE ([project_progress_id] = @project_progress_id)"
    UpdateCommand="UPDATE project_photos SET photo_notes = @photo_notes WHERE (photo_id = @original_photo_id)">
    <DeleteParameters>
        <asp:Parameter Name="original_photo_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="photo_id" Type="Int32" />
        <asp:SessionParameter DefaultValue="0" Name="project_progress_id" SessionField="project_progress_id"
            Type="Int32" />
        <asp:Parameter Name="photo_path" Type="String" />
        <asp:Parameter Name="photo_notes" Type="String" />
        <asp:Parameter Name="Photo" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="project_progress_id" SessionField="project_progress_id"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="photo_notes" Type="String" />
        <asp:Parameter Name="original_photo_id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_GetNextID" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT isnull(max(photo_id), 0) + 1 as id FROM project_photos">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="project_progress_id" SessionField="project_progress_id"
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
