<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectFacility.ascx.vb"
    Inherits="DirectAid.UCProjectFacility" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<%@ Register Src="UCProjectPhaseDetail.ascx" TagName="UCProjectPhaseDetail" TagPrefix="uc1" %>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource_project_facilities" KeyFieldName="fcl_type_id" Caption="Phases"
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
        <dx:GridViewDataComboBoxColumn Caption="Status" FieldName="fcl_type_id" VisibleIndex="1"
            meta:resourcekey="GridViewDataComboBoxColumnResource1">
            <PropertiesComboBox CallbackPageSize="10" DataSourceID="SqlDataSource_facilities_types"
                EnableCallbackMode="True" EnableClientSideAPI="True" TextField="fcl_type_name_ar"
                ValueField="fcl_type_id" ValueType="System.Int32">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataSpinEditColumn Caption="Percentage" FieldName="cost" VisibleIndex="4"
            meta:resourcekey="GridViewDataSpinEditColumnResource1">
            <PropertiesSpinEdit DisplayFormatInEditMode="True" DisplayFormatString="n3" MaxValue="100"
                NumberFormat="Custom">
            </PropertiesSpinEdit>
        </dx:GridViewDataSpinEditColumn>
        <dx:GridViewDataMemoColumn Caption="notes" FieldName="notes" VisibleIndex="5" meta:resourcekey="GridViewDataMemoColumnResource1">
            <EditFormSettings ColumnSpan="3" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataDateColumn FieldName="start_date" VisibleIndex="2" Caption="Start Date"
            meta:resourcekey="GridViewDataDateColumnResource1">
                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" 
                EditFormatString="yyyy-MM-dd">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="finish_date" VisibleIndex="3" Caption="Finish Date"
            meta:resourcekey="GridViewDataDateColumnResource2">
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
<asp:SqlDataSource ID="SqlDataSource_project_facilities" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM project_facilities WHERE (fcl_type_id = @original_fcl_type_id)"
    InsertCommand="INSERT INTO [project_facilities] (fcl_type_id, [project_id], [start_date], [finish_date], [notes], [cost]) VALUES (@fcl_type_id, @Project_ID, @start_date, @finish_date, @notes, @cost)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM project_facilities WHERE (project_id = @project_id)"
    UpdateCommand="UPDATE [project_facilities] SET [start_date] = @start_date, [finish_date] = @finish_date, [notes] = @notes, [cost] = @cost WHERE [fcl_type_id] = @original_fcl_type_id ">
    <DeleteParameters>
        <asp:Parameter Name="original_fcl_type_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id"
            Type="Int32" />
        <asp:Parameter Name="start_date" Type="DateTime" />
        <asp:Parameter Name="finish_date" Type="DateTime" />
        <asp:Parameter Name="notes" Type="String" />
        <asp:Parameter Name="cost" Type="Decimal" />
        <asp:Parameter Name="fcl_type_id" Type="Int32" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="start_date" Type="DateTime" />
        <asp:Parameter Name="finish_date" Type="DateTime" />
        <asp:Parameter Name="notes" Type="String" />
        <asp:Parameter Name="cost" Type="Decimal" />
        <asp:Parameter Name="original_fcl_type_id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_facilities_types" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [facilities_types]">
</asp:SqlDataSource>
