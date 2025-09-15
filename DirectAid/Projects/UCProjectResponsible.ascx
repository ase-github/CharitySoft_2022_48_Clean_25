<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectResponsible.ascx.vb"
    Inherits="DirectAid.UCProjectResponsible" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource_project_responsible" KeyFieldName="responsible_id" 
    Caption="Responsibles" meta:resourcekey="ASPxGridView1Resource1">
    <Columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="100px" 
            meta:resourcekey="GridViewCommandColumnResource1">
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
        <dx:GridViewDataTextColumn FieldName="responsible_id" ReadOnly="True" VisibleIndex="1" 
            Visible="False" meta:resourcekey="GridViewDataTextColumnResource1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Designation" FieldName="responsible_designation" 
            VisibleIndex="5" meta:resourcekey="GridViewDataTextColumnResource2">
            <EditFormSettings ColumnSpan="3" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Name" FieldName="responsible_name" VisibleIndex="2" 
            meta:resourcekey="GridViewDataTextColumnResource3">
            <PropertiesTextEdit DisplayFormatString="d">
            </PropertiesTextEdit>
            <EditFormSettings ColumnSpan="3" />
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
    <SettingsPager PageSize="5" RenderMode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource_project_responsible" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [project_responsible] WHERE [responsible_id] = @original_responsible_id "
    InsertCommand="INSERT INTO [project_responsible] ([project_id],responsible_id, [responsible_name], [responsible_designation]) VALUES (@project_id,@responsible_id, @responsible_name, @responsible_designation)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_responsible] WHERE ([project_id] = @project_id)"
    UpdateCommand="UPDATE [project_responsible] SET [responsible_name] = @responsible_name, [responsible_designation] = @responsible_designation WHERE [responsible_id] = @original_responsible_id">
    <DeleteParameters>
        <asp:Parameter Name="original_responsible_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id"
            Type="Int32" />
        <asp:Parameter Name="responsible_id" Type="Int32" />
        <asp:Parameter Name="responsible_name" Type="String" />
        <asp:Parameter Name="responsible_designation" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:SessionParameter DefaultValue="0" Name="project_id" SessionField="project_id"
            Type="Int64" />
        <asp:Parameter Name="responsible_name" Type="String" />
        <asp:Parameter Name="responsible_designation" Type="String" />
        <asp:Parameter Name="original_responsible_id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_GetNextID" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT isnull(max(responsible_id), 0) + 1 as id FROM project_responsible">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id" />
    </SelectParameters>
</asp:SqlDataSource>