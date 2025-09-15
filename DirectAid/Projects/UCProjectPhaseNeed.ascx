<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectPhaseNeed.ascx.vb"
    Inherits="DirectAid.UCProjectPhaseNeed" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    KeyFieldName="need_id" Caption="Needs" DataSourceID="SqlDataSource_project_needs"
    ClientInstanceName="ASPxGridView1" meta:resourcekey="ASPxGridView1Resource1">
    <Columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="100px" meta:resourcekey="GridViewCommandColumnResource1">
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
            <UpdateButton Visible="True">
                <Image Url="~/Images/Save_32x32.png">
                </Image>
            </UpdateButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="need_id" ReadOnly="True" VisibleIndex="1" Visible="False"
            meta:resourcekey="GridViewDataTextColumnResource1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataMemoColumn Caption="Details" FieldName="need_details" VisibleIndex="4"
            meta:resourcekey="GridViewDataMemoColumnResource1">
            <EditFormSettings ColumnSpan="3" />
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataComboBoxColumn Caption="التصنيف" FieldName="need_class" VisibleIndex="5"
            meta:resourcekey="GridViewDataComboBoxColumnResource1">
            <PropertiesComboBox ValueType="System.Int32">
                <Items>
                    <dx:ListEditItem Text="A" Value="0" />
                    <dx:ListEditItem Text="B" Value="1" />
                </Items>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
    <SettingsPager PageSize="5" RenderMode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource_project_needs" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [project_needs] WHERE [need_id] = @original_need_id"
    InsertCommand="INSERT INTO [project_needs] ([need_id], [project_progress_id], [need_details], need_class) VALUES (@need_id, @project_progress_id, @need_details, @need_class)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_needs] WHERE ([project_progress_id] = @project_progress_id)"
    UpdateCommand="UPDATE [project_needs] SET  [need_details] = @need_details, need_class = @need_class  WHERE [need_id] = @original_need_id ">
    <DeleteParameters>
        <asp:Parameter Name="original_need_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:SessionParameter DefaultValue="0" Name="project_progress_id" SessionField="project_progress_id"
            Type="Int32" />
        <asp:Parameter Name="need_details" Type="String" />
        <asp:Parameter Name="need_class" Type="Int32" />
        <asp:Parameter Name="need_id" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="project_progress_id" SessionField="project_progress_id"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="need_details" Type="String" />
        <asp:Parameter Name="need_class" Type="Int32" />
        <asp:Parameter Name="original_need_id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_GetNextID" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT isnull(max(need_id), 0) + 1 as id FROM project_needs">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="project_progress_id" SessionField="project_progress_id"
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
