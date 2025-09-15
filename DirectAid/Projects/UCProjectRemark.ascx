<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectRemark.ascx.vb"
    Inherits="DirectAid.UCProjectRemark" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource_project_remarks" KeyFieldName="remark_id" Caption="Remarks"
    meta:resourcekey="ASPxGridView1Resource1">
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
        <dx:GridViewDataTextColumn FieldName="remark_id" ReadOnly="True" VisibleIndex="1"
            Visible="False" meta:resourcekey="GridViewDataTextColumnResource1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataMemoColumn Caption="Remark" FieldName="remark" VisibleIndex="5" meta:resourcekey="GridViewDataMemoColumnResource1">
            <EditFormSettings ColumnSpan="3" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataDateColumn FieldName="remark_date" VisibleIndex="2" Caption="Date"
            meta:resourcekey="GridViewDataDateColumnResource1">
                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" 
                EditFormatString="yyyy-MM-dd">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
    <SettingsPager PageSize="5" RenderMode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource_project_remarks" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [project_remarks] WHERE [remark_id] = @original_remark_id "
    InsertCommand="INSERT INTO [project_remarks] ([project_id], remark_id,  [remark_date], [remark]) VALUES (@project_id,@remark_id, @remark_date, @remark)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_remarks] WHERE ([project_id] = @project_id)"
    UpdateCommand="UPDATE [project_remarks] SET [remark_date] = @remark_date, [remark] = @remark WHERE [remark_id] = @original_remark_id">
    <DeleteParameters>
        <asp:Parameter Name="original_remark_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id"
            Type="Int32" />
        <asp:Parameter Name="remark_id" Type="int32" />
        <asp:Parameter Name="remark_date" Type="DateTime" />
        <asp:Parameter Name="remark" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="remark_date" Type="DateTime" />
        <asp:Parameter Name="remark" Type="String" />
        <asp:Parameter Name="original_remark_id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_GetNextID" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT isnull(max(remark_id), 0) + 1 as id FROM project_remarks">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id" />
    </SelectParameters>
</asp:SqlDataSource>
