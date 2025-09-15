<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectPhaseTransfer.ascx.vb"
    Inherits="DirectAid.UCProjectPhaseTransfer" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource_project_transfer" KeyFieldName="trans_id" Caption="Transfers"
    meta:resourcekey="ASPxGridView1Resource1">

    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />

    <SettingsEditing EditFormColumnCount="3" />

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
        <dx:GridViewDataTextColumn FieldName="trans_id" ReadOnly="True" VisibleIndex="1"
            Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataMemoColumn Caption="الوصف" FieldName="trans_desc" VisibleIndex="6">
            <PropertiesMemoEdit ClientInstanceName="dateDifferenceResult" 
                EnableClientSideAPI="True">
            </PropertiesMemoEdit>
            <EditFormSettings ColumnSpan="3" />
<EditFormSettings ColumnSpan="3"></EditFormSettings>
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataDateColumn FieldName="trans_date" VisibleIndex="2" Caption="تاريخ التحويل">
            <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" 
                EditFormatString="yyyy-MM-dd" ClientInstanceName="startDate" 
                EnableClientSideAPI="True">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="trans_confirm_date" VisibleIndex="3" Caption="تاريخ التاكيد">
            <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" 
                EditFormatString="yyyy-MM-dd" ClientInstanceName="endDate" 
                EnableClientSideAPI="True">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="القيمه" FieldName="trans_amount" VisibleIndex="4">
            <PropertiesTextEdit>
                
                

<MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
            
                

</PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="طريقه التحويل" FieldName="trans_method" VisibleIndex="5">
            <PropertiesComboBox ValueType="System.Int16">
                <Items>
                    
                    

<dx:ListEditItem Text="تحويل بنكى" Value="0" />
                    
                    

<dx:ListEditItem Text="ويسترن يونيون" Value="1" />
                
                    

</Items>
            
                

</PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn Caption="رقم الطلب" FieldName="request_no" VisibleIndex="7">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="request_date" VisibleIndex="8" Caption="تاريخ الطلب">
            <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="العمله" FieldName="currency_code" VisibleIndex="8">
            <PropertiesComboBox ValueType="System.Int16" 
                datasourceid="SqlDataSource_Currency" ValueField="currency_code"  TextField="currency_descrar">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>

        <dx:GridViewDataTextColumn Caption="طباعة" VisibleIndex="31" UnboundType="String">
            <EditFormSettings Visible="False" />
            <DataItemTemplate>
                <a id="clickElement" target="_blank" href="../Projects/UIConstructionTranferReportViewer.aspx?ID=<%# Eval("trans_id").ToString()%>">طباعة الطلب</a>
               
                <%--<a href="../Projects/UIConstructionTranferReportViewer.aspx?ID=<%# Container.KeyValue%>"><%# "Show New Form, Key Field = " + Eval("trans_id").ToString()%></a>--%>
                   </DataItemTemplate>
        </dx:GridViewDataTextColumn>
    </Columns>

<SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True"></SettingsBehavior>

    <SettingsPager PageSize="5" RenderMode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </SettingsPager>

<SettingsEditing EditFormColumnCount="3"></SettingsEditing>

</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource_project_transfer" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [project_transfer] WHERE [trans_id] = @original_trans_id "
    InsertCommand="INSERT INTO project_transfer(project_progress_id, trans_id, trans_date, trans_desc, trans_confirm_date, trans_amount, trans_method, request_date, request_no, currency_code) VALUES (@project_progress_id, @trans_id, @trans_date, @trans_desc, @trans_confirm_date, @trans_amount, @trans_method, @request_date, @request_no, @currency_code)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_transfer] WHERE ([project_progress_id] = @project_progress_id)"
    UpdateCommand="UPDATE [project_transfer] SET 
[trans_date] = @trans_date
, [trans_desc] = @trans_desc 
, trans_confirm_date = @trans_confirm_date, trans_amount= @trans_amount, trans_method = @trans_method
,request_date = @request_date, request_no = @request_no , currency_code = @currency_code
WHERE [trans_id] = @original_trans_id ">
    <DeleteParameters>
        <asp:Parameter Name="original_trans_id" />
    </DeleteParameters>
    <InsertParameters>
        <asp:SessionParameter DefaultValue="0" Name="project_progress_id" SessionField="project_progress_id"
            Type="Int32" />
        <asp:Parameter Name="trans_id" />
        <asp:Parameter Name="trans_date" Type="DateTime" />
        <asp:Parameter Name="trans_desc" Type="String" />
        <asp:Parameter Name="trans_confirm_date" Type="DateTime" />
        <asp:Parameter Name="trans_amount" Type="Decimal" />
        <asp:Parameter Name="trans_method" Type="Byte" />
        <asp:Parameter Name="request_date" Type="DateTime" />
        <asp:Parameter Name="request_no" Type="String" />
        <asp:Parameter Name="currency_code" Type="Int16" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="project_progress_id" SessionField="project_progress_id"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="trans_date" Type="DateTime" />
        <asp:Parameter Name="trans_desc" Type="String" />
        <asp:Parameter Name="trans_confirm_date" Type="DateTime" />
        <asp:Parameter Name="trans_amount" Type="Decimal" />
        <asp:Parameter Name="trans_method" Type="Byte" />
        <asp:Parameter Name="request_date" Type="DateTime" />
        <asp:Parameter Name="request_no" Type="String" />
        <asp:Parameter Name="currency_code" Type="Int16" />
        <asp:Parameter Name="original_trans_id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_GetNextID" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT isnull(max(trans_id), 0) + 1 as id FROM project_transfer">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="project_progress_id" SessionField="project_progress_id"
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_Currency" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [currency_tab]">
</asp:SqlDataSource>
