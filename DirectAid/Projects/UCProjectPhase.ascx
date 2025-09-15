<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectPhase.ascx.vb"
    Inherits="DirectAid.UCProjectPhase" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<%@ Register Src="UCProjectPhaseDetail.ascx" TagName="UCProjectPhaseDetail" TagPrefix="uc1" %>

<script type="text/javascript">


</script>

<%  If (DesignMode) Then%>
<script src="ASPxScriptIntelliSense.js" type="text/javascript"></script>
<%  End If%>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource_ProjectPhase" 
    KeyFieldName="project_progress_id" Caption="Phases"
    meta:resourcekey="ASPxGridView1Resource1">
    <Columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="100px">
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
        <dx:GridViewDataTextColumn FieldName="project_progress_id" ReadOnly="True" 
            VisibleIndex="1" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="نسبه الانجاز" 
            FieldName="completion_percent" VisibleIndex="5">
            <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:n3} %">
                


<MaskSettings Mask="&lt;0..999&gt;.&lt;000..999&gt;" />
            


</PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataMemoColumn Caption="المرحله" FieldName="stage_desc" 
            VisibleIndex="6">
            <EditFormSettings ColumnSpan="3" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataDateColumn FieldName="stage_start_date" VisibleIndex="3" 
            Caption="تاريخ البدايه" SortIndex="0" 
            SortOrder="Ascending" Visible="False">
                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" 
                EditFormatString="yyyy-MM-dd">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="stage_finish_date" VisibleIndex="4" 
            Caption="تاريخ الانتهاء المتوقع">
                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" 
                EditFormatString="yyyy-MM-dd">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="الحاله" FieldName="project_status_id" 
            VisibleIndex="7">
            <PropertiesComboBox CallbackPageSize="10" DataSourceID="SqlDataSource_ProjectStatus"
                EnableCallbackMode="True" EnableClientSideAPI="True" TextField="project_status_name_ar"
                ValueField="project_status_id" ValueType="System.Int32">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="actual_finish_date" VisibleIndex="2" Caption="تاريخ المرحله">
                            <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" 
                EditFormatString="yyyy-MM-dd">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataCheckColumn FieldName="follow" VisibleIndex="8" Caption="متابعه" Visible="False">
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="finished" VisibleIndex="9" Caption="انتهت" Visible="False">
        </dx:GridViewDataCheckColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
    <SettingsPager PageSize="5" RenderMode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" />
    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
    <Templates>
        <DetailRow>
            <uc1:UCProjectPhaseDetail ID="UCProjectPhaseDetail1" runat="server" />
        </DetailRow>
    </Templates>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource_ProjectPhase" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM project_progress WHERE (project_progress_id = @original_project_progress_id)"
    InsertCommand="INSERT INTO [project_progress] (project_progress_id, [project_id], [stage_start_date], [stage_finish_date], [stage_desc], [completion_percent],project_status_id,actual_finish_date, follow, finished) VALUES (@project_progress_id, @Project_ID, @stage_start_date, @stage_finish_date, @stage_desc, @completion_percent, @project_status_id, @actual_finish_date, @follow, @finished)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT project_progress_id, project_id, stage_start_date, stage_finish_date, stage_desc, completion_percent, project_status_id, actual_finish_date, follow, finished FROM project_progress WHERE (project_id = @project_id)"
    UpdateCommand="UPDATE [project_progress] SET [stage_start_date] = @stage_start_date, [stage_finish_date] = @stage_finish_date, [stage_desc] = @stage_desc, [completion_percent] = @completion_percent , project_status_id = @project_status_id, actual_finish_date = @actual_finish_date, follow = @follow, finished = @finished WHERE [project_progress_id] = @original_project_progress_id ">
    <DeleteParameters>
        <asp:Parameter Name="original_project_progress_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id"
            Type="Int32" />
        <asp:Parameter Name="stage_start_date" Type="DateTime" />
        <asp:Parameter Name="stage_finish_date" Type="DateTime" />
        <asp:Parameter Name="stage_desc" Type="String" />
        <asp:Parameter Name="completion_percent" Type="Decimal" />
        <asp:Parameter Name="project_status_id" Type="Int32" />
        <asp:Parameter Name="project_progress_id" Type="Int32" />
        <asp:Parameter Name="actual_finish_date" Type="DateTime" />
        <asp:Parameter Name="follow" Type="Boolean" />
        <asp:Parameter Name="finished" Type="Boolean" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="stage_start_date" Type="DateTime" />
        <asp:Parameter Name="stage_finish_date" Type="DateTime" />
        <asp:Parameter Name="stage_desc" Type="String" />
        <asp:Parameter Name="completion_percent" Type="Decimal" />
        <asp:Parameter Name="project_status_id" Type="Int32" />
        <asp:Parameter Name="original_project_progress_id" Type="Int32" />
        <asp:Parameter Name="actual_finish_date" Type="DateTime" />
                <asp:Parameter Name="follow" Type="Boolean" />
        <asp:Parameter Name="finished" Type="Boolean" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_ProjectStatus" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_status]">
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_GetNextID" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT isnull(max(project_progress_id), 0) + 1 as id FROM project_progress">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id" />
    </SelectParameters>
</asp:SqlDataSource>