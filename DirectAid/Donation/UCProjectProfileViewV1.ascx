<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectProfileViewV1.ascx.vb"
    Inherits="DirectAid.UCProjectProfileViewV1" %>



<%@ Register Namespace="DevExpress.XtraCharts.Web" TagPrefix="Web" %>
<%@ Register Assembly="DevExpress.XtraCharts.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.XtraCharts.v25.1.Web, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>


<%@ Register src="UCDonorHeaderV1.ascx" tagname="UCDonorHeaderV1" tagprefix="uc2" %>
<%@ Register src="../Projects/UCProjectPhaseDetail.ascx" tagname="ucprojectphasedetail" tagprefix="uc1" %>
<%@ Register src="UCProjectHeaderV1.ascx" tagname="UCProjectHeaderV1" tagprefix="uc3" %>



<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<script type="text/javascript">

</script>

<table width="100%" align="center">
    <tr>
        <td align="center" style="width: 100%">
            <uc2:UCDonorHeaderV1 ID="UCDonorHeaderV11" runat="server" />

        </td>
    </tr>
    <tr>
        <td align="center" style="width: 100%"></td>
    </tr>
    <tr>
        <td align="center" style="width: 100%">
            <uc3:UCProjectHeaderV1 ID="UCProjectHeaderV11" runat="server" />
        </td>
    </tr>
    <tr>
        <td align="center" style="width: 100%">&nbsp;</td>
    </tr>
    <tr>
        <td align="center" style="width: 100%">
            <dx:ASPxRoundPanel ID="ASPxRoundPanel_Beneficiaries" runat="server"
                Width="100%" meta:resourcekey="ASPxRoundPanel_Content" RightToLeft="True" Font-Bold="True" HeaderText="تفاصيل المشروع">
                <HeaderStyle HorizontalAlign="Center" />
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True" meta:resourcekey="PanelContentResource2">
                        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="ASPxPageControl1" EnableClientSideAPI="True" Font-Bold="True" RenderMode="Lightweight" RightToLeft="True" Width="100%">
                            <TabPages>
                                <dx:TabPage Text="المدفوعات">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxGridView ID="ASPxGridView_Target" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView_Target" DataSourceID="SqlDataSource_view_project_donor_receipts" RightToLeft="True" Width="100%" Caption="المدفوعات">
                                                <ClientSideEvents BeginCallback="function(s, e) {
	        if (e.command == 'CUSTOMCALLBACK ')
            isCustomCallback = true;
}" EndCallback="function(s, e) {
	Target_EndCallback(s, e);
}" />
                                                <TotalSummary>
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="amount" ShowInColumn="القيمه" ShowInGroupFooterColumn="القيمه" SummaryType="Sum" ValueDisplayFormat="{0:n3}" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="receipt_id" ShowInColumn="الايصال" ShowInGroupFooterColumn="الايصال" SummaryType="Count" ValueDisplayFormat="{0:n0}" />
                                                </TotalSummary>
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="donor_id" ShowInCustomizationForm="True" VisibleIndex="4" Visible="False">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="project_id" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="رقم الايصال" FieldName="receipt_id" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="القيمه" FieldName="amount" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="reciept_date" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataTextColumn FieldName="funding_source_id" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="مصدر التمويل" FieldName="funding_source_namear" ShowInCustomizationForm="True" VisibleIndex="3">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                        <FooterCellStyle HorizontalAlign="Center">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="funding_source_nameen" ShowInCustomizationForm="True" Visible="False" VisibleIndex="7">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsBehavior AutoFilterRowInputDelay="30000" ConfirmDelete="True" />
                                                <Settings ShowFilterRow="True" ShowFooter="True" />
                                                <SettingsText ConfirmDelete="هل تريد الحذف؟" />
                                            </dx:ASPxGridView>
                                            <asp:SqlDataSource ID="SqlDataSource_view_project_donor_receipts" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"  SelectCommand="SELECT * FROM [view_donor_project_payments] 
WHERE ([project_id] = @project_id)
and (donor_id = @donor_id)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id" Type="Int32" />
                                                    <asp:QueryStringParameter DefaultValue="0" Name="donor_id" QueryStringField="DonorID" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="المراحل">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Caption="المراحل" DataSourceID="SqlDataSource_ProjectPhase" KeyFieldName="project_progress_id" meta:resourceKey="ASPxGridView1Resource1" Width="100%">
                                                <Columns>

                                                    <dx:GridViewDataTextColumn FieldName="project_progress_id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="نسبه الانجاز" FieldName="completion_percent" ShowInCustomizationForm="True" VisibleIndex="4">
                                                        <PropertiesTextEdit DisplayFormatInEditMode="True" DisplayFormatString="{0:n3} %">
                                                            <MaskSettings Mask="&lt;0..999&gt;.&lt;000..999&gt;" />
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataMemoColumn Caption="الوصف" FieldName="stage_desc" ShowInCustomizationForm="True" VisibleIndex="5">
                                                        <EditFormSettings ColumnSpan="3" />
                                                    </dx:GridViewDataMemoColumn>
                                                    <dx:GridViewDataDateColumn Caption="تاريخ البدايه" FieldName="stage_start_date" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="2">
                                                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd">
                                                        </PropertiesDateEdit>
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataDateColumn Caption="تاريخ الانتهاء المتوقع" FieldName="stage_finish_date" ShowInCustomizationForm="True" VisibleIndex="3">
                                                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd">
                                                        </PropertiesDateEdit>
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataComboBoxColumn Caption="الحاله" FieldName="project_status_id" ShowInCustomizationForm="True" VisibleIndex="6">
                                                        <PropertiesComboBox CallbackPageSize="10" DataSourceID="SqlDataSource_ProjectStatus" EnableCallbackMode="True" EnableClientSideAPI="True" TextField="project_status_name_ar" ValueField="project_status_id" ValueType="System.Int32">
                                                        </PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>
                                                    <dx:GridViewDataDateColumn Caption="تاريخ الانتهاء الفعلى" FieldName="actual_finish_date" ShowInCustomizationForm="True" VisibleIndex="7">
                                                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd">
                                                        </PropertiesDateEdit>
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataCheckColumn Caption="متابعه" FieldName="follow" ShowInCustomizationForm="True" VisibleIndex="8">
                                                    </dx:GridViewDataCheckColumn>
                                                    <dx:GridViewDataCheckColumn Caption="انتهت" FieldName="finished" ShowInCustomizationForm="True" VisibleIndex="9">
                                                    </dx:GridViewDataCheckColumn>
                                                </Columns>
                                                <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                                                <SettingsPager PageSize="5">
                                                    <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                                                    </PageSizeItemSettings>
                                                </SettingsPager>
                                                <SettingsEditing EditFormColumnCount="3" />
                                                <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                                                <Templates>
                                                    <DetailRow>
                                                        <uc1:UCProjectPhaseDetail ID="UCProjectPhaseDetail1" runat="server" />
                                                    </DetailRow>
                                                </Templates>
                                            </dx:ASPxGridView>
                                            <asp:SqlDataSource ID="SqlDataSource_ProjectPhase" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT project_progress_id, project_id, stage_start_date, stage_finish_date, stage_desc, completion_percent, project_status_id, actual_finish_date, follow, finished FROM project_progress WHERE (project_id = @project_id)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:SqlDataSource ID="SqlDataSource_ProjectStatus" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_status]"></asp:SqlDataSource>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="المراسلات">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" Caption="المراسلات" DataSourceID="EntityDataSource_project_letters" KeyFieldName="letter_id" meta:resourceKey="ASPxGridView1Resource1" Width="100%">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="letter_id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataMemoColumn Caption="الوصف" FieldName="letter_desc" ShowInCustomizationForm="True" VisibleIndex="5" Width="60%">
                                                        <EditFormSettings ColumnSpan="3" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataMemoColumn>
                                                    <dx:GridViewDataComboBoxColumn Caption="صادر/وارد" FieldName="letter_in_out" ShowInCustomizationForm="True" VisibleIndex="2" Width="5%">
                                                        <PropertiesComboBox DataSourceID="ObjectDataSource_LetterInOut" TextField="NameAr" ValueField="ID" ValueType="System.Byte">
                                                            <Items>
                                                                <dx:ListEditItem Text="صادر" Value="0" />
                                                                <dx:ListEditItem Text="وارد" Value="1" />
                                                            </Items>
                                                        </PropertiesComboBox>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataComboBoxColumn>
                                                    <dx:GridViewDataComboBoxColumn Caption="الجھة المرسل إلیھا" FieldName="to_recipient" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                        <PropertiesComboBox DataSourceID="ObjectDataSource_LetterRecipient" TextField="NameAr" ValueField="ID" ValueType="System.Int16">
                                                            <Items>
                                                                <dx:ListEditItem Text="المتبرع" Value="1" />
                                                                <dx:ListEditItem Text="القطاع" Value="2" />
                                                                <dx:ListEditItem Text="المالیة" Value="3" />
                                                                <dx:ListEditItem Text="أخرى" Value="4" />
                                                            </Items>
                                                        </PropertiesComboBox>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataComboBoxColumn>
                                                    <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="letter_date" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                                        <PropertiesDateEdit DisplayFormatString="">
                                                        </PropertiesDateEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataDateColumn>
                                                </Columns>
                                                <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                                                <SettingsPager PageSize="5">
                                                    <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                                                    </PageSizeItemSettings>
                                                </SettingsPager>
                                                <SettingsEditing EditFormColumnCount="3" />
                                            </dx:ASPxGridView>
                                            <asp:EntityDataSource ID="EntityDataSource_project_letters" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="project_letters" EntityTypeFilter="project_letters" Select="" Where="">
                                                <WhereParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id" Type="Int32" />
                                                </WhereParameters>
                                            </asp:EntityDataSource>
                                            <asp:ObjectDataSource ID="ObjectDataSource_LetterInOut" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Load" TypeName="DirectAid.LetterInOut"></asp:ObjectDataSource>
                                            <asp:ObjectDataSource ID="ObjectDataSource_LetterRecipient" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Load" TypeName="DirectAid.LetterRecipient"></asp:ObjectDataSource>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>

        </td>
    </tr>
    </table>
