<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectOther.ascx.vb"
    Inherits="DirectAid.UCProjectOther" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource_ProjectPhase" KeyFieldName="ID" 
    Caption="Others" meta:resourcekey="ASPxGridView1Resource1">
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
        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" 
            Visible="False" meta:resourcekey="GridViewDataTextColumnResource1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataMemoColumn Caption="Remark" FieldName="Remark" 
            VisibleIndex="5" meta:resourcekey="GridViewDataMemoColumnResource1">
            <EditFormSettings ColumnSpan="3" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="2" Caption="Date" 
            meta:resourcekey="GridViewDataDateColumnResource1">
                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" 
                EditFormatString="yyyy-MM-dd">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
    <SettingsPager PageSize="5" RenderMode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" 
            Visible="True">
        </PageSizeItemSettings>
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource_ProjectPhase" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [ProjectOther] WHERE [ID] = @original_ID "
    InsertCommand="INSERT INTO [ProjectOther] ([Project_ID], [Date], [Remark]) VALUES (@Project_ID, @Date, @Remark)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ProjectOther] WHERE ([Project_ID] = @Project_ID)"
    
    
    UpdateCommand="UPDATE [ProjectOther] SET [Project_ID] = @Project_ID, [Date] = @Date, [Remark] = @Remark WHERE [ID] = @original_ID AND (([Project_ID] = @original_Project_ID) OR ([Project_ID] IS NULL AND @original_Project_ID IS NULL)) AND (([Date] = @original_Date) OR ([Date] IS NULL AND @original_Date IS NULL)) AND (([Remark] = @original_Remark) OR ([Remark] IS NULL AND @original_Remark IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_ID" Type="Int64" />
        <asp:Parameter Name="original_Project_ID" Type="Int64" />
        <asp:Parameter Name="original_Date" Type="DateTime" />
        <asp:Parameter Name="original_Remark" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="Project_ID" QueryStringField="Project_ID"
            Type="Int64" />
        <asp:Parameter Name="Date" Type="DateTime" />
        <asp:Parameter Name="Remark" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="Project_ID" QueryStringField="Project_ID"
            Type="Int64" />
    </SelectParameters>
    <UpdateParameters>
        <asp:SessionParameter DefaultValue="0" Name="Project_ID" 
            SessionField="Project_ID" Type="Int64" />
        <asp:Parameter Name="Date" Type="DateTime" />
        <asp:Parameter Name="Remark" Type="String" />
        <asp:Parameter Name="original_ID" Type="Int64" />
        <asp:Parameter Name="original_Project_ID" Type="Int64" />
        <asp:Parameter Name="original_Date" Type="DateTime" />
        <asp:Parameter Name="original_Remark" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource_GetNextID" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT isnull(max(responsible_id), 0) + 1 as id FROM project_responsible">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id" />
    </SelectParameters>
</asp:SqlDataSource>