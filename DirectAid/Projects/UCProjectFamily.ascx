<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectFamily.ascx.vb"
    Inherits="DirectAid.UCProjectFamily" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource_project_responsible" KeyFieldName="ID" meta:resourcekey="ASPxGridView1Resource1">
    <Columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="25%" 
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
        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" 
            Visible="False" meta:resourcekey="GridViewDataTextColumnResource1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الاسم" FieldName="Name" 
            VisibleIndex="2" meta:resourcekey="GridViewDataTextColumnResource3" Width="75%">
            <propertiestextedit displayformatstring="d"></propertiestextedit>
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
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [ProjectFamily] WHERE [ID] = @original_ID"
    InsertCommand="INSERT INTO [ProjectFamily] ([project_id], [Name]) VALUES (@project_id, @Name)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ProjectFamily] WHERE ([project_id] = @project_id)"
    UpdateCommand="UPDATE [ProjectFamily] SET [Name] = @Name WHERE [ID] = @original_ID">
    <DeleteParameters>
        <asp:Parameter Name="original_ID" Type="Int64" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="project_id" Type="Int32" />
        <asp:Parameter Name="Name" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="original_ID" Type="Int64" />
    </UpdateParameters>
</asp:SqlDataSource>