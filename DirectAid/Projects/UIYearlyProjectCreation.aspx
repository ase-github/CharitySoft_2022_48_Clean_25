<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIYearlyProjectCreation.aspx.vb"
    Inherits="DirectAid.UIYearlyProjectCreation" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>



<%@ Register Src="UCProjectDetail.ascx" TagName="ucprojectdetail" TagPrefix="uc1" %>


<%@ Register Src="UC_projects_approval_view.ascx" TagName="UC_projects_approval_view"
    TagPrefix="uc2" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%  If (DesignMode) Then%>
    <script src="ASPxScriptIntelliSense.js" type="text/javascript"></script>
    <%  End If%>
    <script type="text/javascript">
        window.onload = function () {
            //var grid = ASPxClientGridView.Cast("ASPxGridView_Donor")
            //grid.SelectRows();
            //var donorCount = grid.GetSelectedRowCount();
            //ASPxClientTextBox.Cast('ASPxTextBox_DonorCount').SetValue(donorCount.toString());

            //grid = ASPxClientGridView.Cast("ASPxGridView_SharingDonor");
            //grid.SelectRows()
            //donorCount = grid.GetSelectedRowCount();
            //ASPxClientTextBox.Cast('ASPxTextBox_DonorCount_Share').SetValue(donorCount.toString());
        };

        function TotalValuePlus_SharingDonor(values) {
            var totalValue = ASPxClientTextBox.Cast('ASPxTextBox_TotalValue_Share').GetValue();
            totalValue = totalValue * 1;
            totalValue = totalValue + (values[1] * 1);
            ASPxClientTextBox.Cast('ASPxTextBox_TotalValue_Share').SetValue(totalValue.toString());
        }

        function TotalValueMinus_SharingDonor(values) {
            var totalValue = ASPxClientTextBox.Cast('ASPxTextBox_TotalValue_Share').GetValue();
            totalValue = totalValue * 1;
            totalValue = totalValue - (values[1] * 1);
            ASPxClientTextBox.Cast('ASPxTextBox_TotalValue_Share').SetValue(totalValue.toString());
        }

        function Calculate_SharingDonor(s, e) {

            var donorCount = s.GetSelectedRowCount();

            if (e.isSelected) {
                s.GetRowValues(e.visibleIndex, 'reciept_num;donation_value', TotalValuePlus_SharingDonor);
            }
            else {
                s.GetRowValues(e.visibleIndex, 'reciept_num;donation_value', TotalValueMinus_SharingDonor);
            }

            ASPxClientTextBox.Cast('ASPxTextBox_DonorCount_Share').SetValue(donorCount.toString());

            ASPxClientCallback.Cast("ASPxCallback_SharingDonor").PerformCallback(e.visibleIndex + '|' + e.isSelected);
        }

        function TotalValuePlus_Donor(values) {
            var totalValue = ASPxClientTextBox.Cast('ASPxTextBox_TotalValue').GetValue();
            totalValue = totalValue * 1;
            totalValue = totalValue + (values[1] * 1);
            ASPxClientTextBox.Cast('ASPxTextBox_TotalValue').SetValue(totalValue.toString());
        }

        function TotalValueMinus_Donor(values) {
            var totalValue = ASPxClientTextBox.Cast('ASPxTextBox_TotalValue').GetValue();
            totalValue = totalValue * 1;
            totalValue = totalValue - (values[1] * 1);
            ASPxClientTextBox.Cast('ASPxTextBox_TotalValue').SetValue(totalValue.toString());
        }

        function Calculate_Donor(s, e) {

            var donorCount = s.GetSelectedRowCount();

            if (e.isSelected) {
                s.GetRowValues(e.visibleIndex, 'reciept_num;donation_value', TotalValuePlus_Donor);
            }
            else {
                s.GetRowValues(e.visibleIndex, 'reciept_num;donation_value', TotalValueMinus_Donor);
            }

            ASPxClientTextBox.Cast('ASPxTextBox_DonorCount').SetValue(donorCount.toString());

            ASPxClientCallback.Cast("ASPxCallback_Donor").PerformCallback(e.visibleIndex + '|' + e.isSelected);
        }

        function AllocateProject_Begin() {
            ASPxLoadingPanel1.Show();
            ASPxButton_alocate_project.SetEnabled(false);
            ASPxCallback_AllocateProject.PerformCallback(null);
        }

        function AllocateProject_End(e) {
            if (e.result == "OK") {
                ASPxGridView1.Refresh();
                alert("تم التخصيص بنجاح");
            }
            else {
                ASPxButton_alocate_project.SetEnabled(true);
                alert(e.result);
            }
            //ASPxGridView_Donor.Refresh();
            //ASPxGridView_SharingDonor.Refresh();
            ASPxLoadingPanel1.Hide();
        }

        function OK_Begin() {
            ASPxLoadingPanel1.Show();
            ASPxCallback_OK.PerformCallback(null);
        }

        function OK_End(e) {
            if (e.result == "True") {
                ASPxButton_alocate_project.SetEnabled(false);
                ASPxGridView_Approval.Refresh();
                ASPxGridView1.Refresh();
                ASPxGridView_Donor.Refresh();
                ASPxGridView_SharingDonor.Refresh();
                ASPxPopupControl1.Hide();
            }
            ASPxLoadingPanel1.Hide();
        }

        function Cancel_Begin() {
            ASPxLoadingPanel1.Show();
            ASPxCallback_Cancel.PerformCallback(null);
        }

        function Cancel_End(e) {
            if (e.result == "True") {
                ASPxGridView_Approval.Refresh();
                ASPxPopupControl1.Hide();
            }
            ASPxLoadingPanel1.Hide();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel5" runat="server" Width="100%" HeaderText="مشاريع جديدة">
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
            <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="ASPxPopupControl1"
                    AllowDragging="True" AllowResize="True" AutoUpdatePosition="True" CloseAction="None"
                    EnableClientSideAPI="True" HeaderText="Approve" RenderMode="Lightweight" ShowCloseButton="False"
                    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" RightToLeft="True"
                    Modal="True">
                    <ContentCollection>
                        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                            <table width="100%">
                                <tbody>
                                    <tr>
                                        <td align="center" style="width: 50%;">
                                            <dx:ASPxButton ID="ASPxButton_OK" runat="server" AutoPostBack="False" CommandName="ASPxButton_OK"
                                                EnableClientSideAPI="True" Text="موافق" UseSubmitBehavior="False" Width="50%">
                                                <ClientSideEvents Click="function(s, e) {
	OK_Begin();
}" />
                                                <Image Url="~/Images/ActiveRents_32x32.png">
                                                </Image>
                                            </dx:ASPxButton>
                                            <dx:ASPxCallback ID="ASPxCallback_OK" runat="server" ClientInstanceName="ASPxCallback_OK">
                                                <ClientSideEvents CallbackComplete="function(s, e) {
	OK_End(e);
}" />
                                            </dx:ASPxCallback>
                                            <asp:SqlDataSource ID="SqlDataSource_OK" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
                                                InsertCommand="alocate_approved_projects" InsertCommandType="StoredProcedure"
                                                UpdateCommand="UPDATE waqf_proj_aloc_temp SET approved = @approved , over_reason = @over_reason WHERE ( project_id = @project_id ) AND ( current_flag = @current_flag );">
                                                <InsertParameters>
                                                    <asp:SessionParameter Name="aloc_bat" SessionField="batch_id" Type="String" />
                                                    <asp:SessionParameter Name="current_flag" SessionField="current_flag" Type="Int32" />
                                                </InsertParameters>
                                                <UpdateParameters>
                                                    <asp:Parameter Name="project_id" Type="Int32" />
                                                    <asp:Parameter Name="approved" Type="Boolean" />
                                                    <asp:Parameter Name="over_reason" Type="String" />
                                                    <asp:SessionParameter Name="current_flag" SessionField="current_flag" Type="Int32" />
                                                </UpdateParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td align="center" style="width: 50%;">
                                            <dx:ASPxButton ID="ASPxButton_Cancel" runat="server" AutoPostBack="False" CommandName="ASPxButton_Cancel"
                                                EnableClientSideAPI="True" Text="الغاء" UseSubmitBehavior="False" Width="50%">
                                                <ClientSideEvents Click="function(s, e) {
	Cancel_Begin();
}" />
                                                <Image Url="~/Images/Remove_32x32.png">
                                                </Image>
                                            </dx:ASPxButton>
                                            <dx:ASPxCallback ID="ASPxCallback_Cancel" runat="server" ClientInstanceName="ASPxCallback_Cancel">
                                                <ClientSideEvents CallbackComplete="function(s, e) {
	Cancel_End(e);
}" />
                                            </dx:ASPxCallback>
                                            <asp:SqlDataSource ID="SqlDataSource_Cancel" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
                                                InsertCommand="cancel_alocate_project" InsertCommandType="StoredProcedure"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table width="100%">
                                <tbody>
                                    <tr>
                                        <td align="center" style="width: 100%;">
                                            <dx:ASPxGridView ID="ASPxGridView_Approval" runat="server" AutoGenerateColumns="False"
                                                ClientInstanceName="ASPxGridView_Approval" DataSourceID="SqlDataSource1" RightToLeft="True"
                                                Width="100%">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="project_id" ShowInCustomizationForm="True"
                                                        Visible="False" VisibleIndex="8">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataCheckColumn Caption="خارج الخطه" FieldName="over_plan" ShowInCustomizationForm="True"
                                                        VisibleIndex="1" Width="7%">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataCheckColumn>
                                                    <dx:GridViewDataCheckColumn Caption="اعتماد" FieldName="approved" Name="approved"
                                                        ShowInCustomizationForm="True" VisibleIndex="2" Width="7%">
                                                        <DataItemTemplate>
                                                            <dx:ASPxCheckBox ID="approved" runat="server" Checked="true">
                                                            </dx:ASPxCheckBox>
                                                        </DataItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataCheckColumn>
                                                    <dx:GridViewDataTextColumn Caption="الدوله" FieldName="nat_descrar" ShowInCustomizationForm="True"
                                                        VisibleIndex="3" Width="25%">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="zone_code" ShowInCustomizationForm="True" Visible="False"
                                                        VisibleIndex="6">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="nat_group" ShowInCustomizationForm="True" Visible="False"
                                                        VisibleIndex="7">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="قيمه المشروع" FieldName="Project Value" ShowInCustomizationForm="True"
                                                        VisibleIndex="4" Width="10%">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="donation_cat" ShowInCustomizationForm="True"
                                                        Visible="False" VisibleIndex="8">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="نوع التبرع" FieldName="donation_descrar" ShowInCustomizationForm="True"
                                                        VisibleIndex="5" Width="25%">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="current_flag" ShowInCustomizationForm="True"
                                                        Visible="False" VisibleIndex="9">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="السبب" FieldName="over_reason" Name="over_reason"
                                                        ShowInCustomizationForm="True" UnboundType="String" VisibleIndex="0" Width="26%">
                                                        <DataItemTemplate>
                                                            <dx:ASPxTextBox ID="over_reason" runat="server" Width="100%">
                                                            </dx:ASPxTextBox>
                                                        </DataItemTemplate>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle HorizontalAlign="Center">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                                                <SettingsPager>
                                                    <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                                                    </PageSizeItemSettings>
                                                </SettingsPager>
                                                <SettingsEditing EditFormColumnCount="1" Mode="EditForm" />
                                                <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRow="True" ShowFilterRowMenu="True"
                                                    ShowHeaderFilterButton="True" />
                                            </dx:ASPxGridView>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
                                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [projects_approval_view] WHERE ([current_flag] = @current_flag)">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="current_flag" SessionField="current_flag"
                                        Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
                                Modal="True">
                            </dx:ASPxLoadingPanel>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
                <table width="100%" cellpadding="2x">
                    <tbody>
                        <tr>
                            <td align="center" style="width: 16%;">
                                <dx:ASPxButton ID="ASPxButton1" runat="server" Text="الكتب الرسمية" Width="100%">
                                </dx:ASPxButton>
                            </td>
                            <td align="center" style="width: 16%;">
                                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="EXCEL" Width="100%">
                                </dx:ASPxButton>
                            </td>
                            <td align="center" style="width: 16%;">
                                <dx:ASPxButton ID="ASPxButton3" runat="server" Text=" SMS تقرير " Width="100%">
                                </dx:ASPxButton>
                            </td>
                            <td align="center" style="width: 16%;">
                                <dx:ASPxButton ID="ASPxButton4" runat="server" Text="نقل المشروع لمتبرع آخر" Width="100%">
                                </dx:ASPxButton>
                            </td>
                            <td align="center" style="width: 16%;">
                                <dx:ASPxButton ID="ASPxButton5" runat="server" Text="تقرير" Width="100%">
                                </dx:ASPxButton>
                            </td>
                            <td align="center" style="width: 16%;">
                                <dx:ASPxButton ID="ASPxButton_alocate_project" runat="server" AutoPostBack="False"
                                    ClientInstanceName="ASPxButton_alocate_project" EnableClientSideAPI="True" Text="ربط المشاريع بالمتبرعين"
                                    Width="100%">
                                    <ClientSideEvents Click="function(s, e) {
	AllocateProject_Begin();
}" />
                                </dx:ASPxButton>
                            </td>
                            <td align="center" style="width: 4%;">
                                <dx:ASPxCallback ID="ASPxCallback_AllocateProject" runat="server" ClientInstanceName="ASPxCallback_AllocateProject">
                                    <ClientSideEvents CallbackComplete="function(s, e) {
	AllocateProject_End(e);
}" />
                                </dx:ASPxCallback>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <table width="100%">
                    <tbody>
                        <tr>
                            <td align="center" colspan="6">
                                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView1"
                                    Width="100%" DataSourceID="SqlDataSource_project_create_temp" KeyFieldName="waqf_no"
                                    RightToLeft="True">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="رقم المشروع" FieldName="project_id" ReadOnly="false"
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="10%">
                                            <EditFormSettings Visible="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                            <DataItemTemplate>
                                                <a href='UIProjectDonorReceipt.aspx.aspx?project_id=<%# Eval("project_id") %>' target="_blank">
                                                    <%# Eval("waqf_no")%></a>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="اسم المشروع" FieldName="project_name_ar" ShowInCustomizationForm="True"
                                            VisibleIndex="2" Width="30%">
                                            <EditFormSettings Visible="True" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="project_name_en" ShowInCustomizationForm="false"
                                            Visible="False" VisibleIndex="3">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="التصنيف" FieldName="donation_cat" ShowInCustomizationForm="false"
                                            VisibleIndex="4" Width="25%">
                                            <EditFormSettings Visible="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ المشروع" FieldName="create_date" ShowInCustomizationForm="false"
                                            VisibleIndex="5" Width="15%">
                                            <EditFormSettings Visible="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn FieldName="project_amount" VisibleIndex="2" Caption="مبلغ المشروع"
                                            Width="15%">
                                            <EditFormSettings Visible="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0"
                                            Width="5%">
                                            <EditButton Visible="True">
                                                <Image Url="~/Images/Edit_16x16.png">
                                                </Image>
                                            </EditButton>
                                            <CancelButton Visible="True">
                                                <Image Url="~/Images/Cancel_32x32.png">
                                                </Image>
                                            </CancelButton>
                                            <UpdateButton Visible="True">
                                                <Image Url="~/Images/Save_32x32.png">
                                                </Image>
                                            </UpdateButton>
                                            <ClearFilterButton Visible="True">
                                            </ClearFilterButton>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewCommandColumn>
                                    </Columns>
                                    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                                    <SettingsPager>
                                        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <SettingsEditing EditFormColumnCount="1" Mode="EditForm" />
                                    <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True" />
                                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                                </dx:ASPxGridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Label ID="lbl_followers0" runat="server" Text="اوقاف لشخص واحد" Width="100%" Font-Bold="True"></asp:Label>
                            </td>
                            <td align="center" colspan="3">
                                <asp:Label runat="server" Text="اوقاف مساهمات" Width="100%" ID="lbl_followers"
                                    Font-Bold="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 8%;">
                                <asp:Label ID="Label1" runat="server" Text="عدد المتبرعون" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 7%;">
                                <dx:ASPxTextBox ID="ASPxTextBox_DonorCount" runat="server" EnableClientSideAPI="true"
                                    ClientInstanceName="ASPxTextBox_DonorCount" Width="100%" ReadOnly="True">
                                    <MaskSettings Mask="&lt;0..9999999&gt;" />
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 35%;" rowspan="6">
                                <dx:ASPxCallback ID="ASPxCallback_Donor" runat="server" ClientInstanceName="ASPxCallback_Donor">
                                </dx:ASPxCallback>
                                <dx:ASPxGridView ID="ASPxGridView_Donor" runat="server" AutoGenerateColumns="False"
                                    ClientInstanceName="ASPxGridView_Donor" EnableCallBacks="true" DataSourceID="SqlDataSource_waqf_accrual_view_1_Donor"
                                    RightToLeft="True" Width="100%" KeyFieldName="reciept_num">
                                    <ClientSideEvents SelectionChanged="function(s, e) {
		Calculate_Donor(s, e);
}" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True"
                                            VisibleIndex="0" Width="5%">
                                            <ClearFilterButton Visible="True">
                                            </ClearFilterButton>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn Caption="التبرع" FieldName="donation_descrar" ShowInCustomizationForm="True"
                                            VisibleIndex="1" Width="20%" >
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="عدد الوحدات" FieldName="waqf_units" ShowInCustomizationForm="True"
                                            VisibleIndex="3" Width="10%">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="القيمه" FieldName="waqf_amount" ShowInCustomizationForm="True"
                                            VisibleIndex="3" Width="10%">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="الاسم" FieldName="waqf_name" ShowInCustomizationForm="True"
                                            VisibleIndex="2" Width="40%" SortIndex="0" SortOrder="Ascending">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="بداية الوقف" ShowInCustomizationForm="True" UnboundType="DateTime"
                                            VisibleIndex="5" Width="15%" FieldName="create_date">
                                        </dx:GridViewDataDateColumn>
                                    </Columns>
                                    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                                    <SettingsPager>
                                        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <SettingsEditing EditFormColumnCount="3" />
                                    <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True"
                                        ShowFilterRow="True" ShowFooter="True" />
                                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                                </dx:ASPxGridView>
                            </td>
                            <td align="center" style="width: 35%;" rowspan="6">
                                <dx:ASPxCallback ID="ASPxCallback_SharingDonor" runat="server" ClientInstanceName="ASPxCallback_SharingDonor">
                                </dx:ASPxCallback>
                                <dx:ASPxGridView ID="ASPxGridView_SharingDonor" runat="server" AutoGenerateColumns="False"
                                    ClientInstanceName="ASPxGridView_SharingDonor" EnableCallBacks="true" DataSourceID="SqlDataSource_waqf_accrual_view_1_SharingDonor"
                                    RightToLeft="True" Width="100%" KeyFieldName="reciept_num">
                                    <ClientSideEvents SelectionChanged="function(s, e) {
	Calculate_SharingDonor(s, e);
}" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True"
                                            VisibleIndex="0" Width="5%">
                                            <ClearFilterButton Visible="True">
                                            </ClearFilterButton>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn Caption="التبرع" FieldName="donation_descrar" ShowInCustomizationForm="True"
                                            VisibleIndex="1" Width="20%" >
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="عدد الوحدات" FieldName="waqf_units" ShowInCustomizationForm="True"
                                            VisibleIndex="3" Width="10%">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="القيمه" FieldName="waqf_amount" ShowInCustomizationForm="True"
                                            VisibleIndex="3" Width="10%">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="الاسم" FieldName="waqf_name" ShowInCustomizationForm="True"
                                            VisibleIndex="2" Width="40%" SortIndex="0" SortOrder="Ascending">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="بداية الوقف" ShowInCustomizationForm="True" UnboundType="DateTime"
                                            VisibleIndex="5" Width="15%" FieldName="create_date">
                                        </dx:GridViewDataDateColumn>
                                    </Columns>
                                    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                                    <SettingsPager>
                                        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <SettingsEditing EditFormColumnCount="3" />
                                    <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True"
                                        ShowFilterRow="True" ShowFooter="True" />
                                    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                                </dx:ASPxGridView>
                            </td>
                            <td align="center" style="width: 8%;">
                                <asp:Label ID="Label4" runat="server" Text="عدد المساهمين" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 7%;">
                                <dx:ASPxTextBox ID="ASPxTextBox_DonorCount_Share" runat="server" ClientInstanceName="ASPxTextBox_DonorCount_Share"
                                    EnableClientSideAPI="True" ReadOnly="True" Width="100%">
                                    <MaskSettings Mask="&lt;0..9999999&gt;" />
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 8%;">
                                <asp:Label ID="Label2" runat="server" Text="إجمالى القيمة" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 7%;">
                                <dx:ASPxTextBox ID="ASPxTextBox_TotalValue" runat="server" EnableClientSideAPI="true"
                                    ClientInstanceName="ASPxTextBox_TotalValue" Width="100%" ReadOnly="True">
                                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 8%;">
                                <asp:Label ID="Label5" runat="server" Text="إجمالى القيمة" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 7%;">
                                <dx:ASPxTextBox ID="ASPxTextBox_TotalValue_Share" runat="server" ClientInstanceName="ASPxTextBox_TotalValue_Share"
                                    EnableClientSideAPI="True" ReadOnly="True" Width="100%">
                                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 8%;">
                                <asp:Label ID="lbl_late" runat="server" Text="إجمالى المبلغ المتوفر" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 7%;">
                                <dx:ASPxTextBox ID="txtCost1" runat="server" EnableClientSideAPI="true" ClientInstanceName=""
                                    Width="100%" ReadOnly="True">
                                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 8%;">
                                <asp:Label ID="lbl_late0" runat="server" Text="إجمالى المبلغ المتوفر" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 7%;">
                                <dx:ASPxTextBox ID="txtCost5" runat="server" EnableClientSideAPI="True" ReadOnly="True"
                                    Width="100%">
                                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 8%;">
                                <asp:Label ID="Label3" runat="server" Text="إجمالي المتبقي" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 7%;">
                                <dx:ASPxTextBox ID="txtCost2" runat="server" EnableClientSideAPI="true" ClientInstanceName=""
                                    Width="100%" ReadOnly="True">
                                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 8%;">
                                <asp:Label ID="Label6" runat="server" Text="إجمالي المتبقي" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 7%;">
                                <dx:ASPxTextBox ID="txtCost6" runat="server" EnableClientSideAPI="True" ReadOnly="True"
                                    Width="100%">
                                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 8%;">
                                <asp:Label ID="lbl_paid" runat="server" Text="إجمالي الفرق" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 7%;">
                                <dx:ASPxTextBox ID="txtCost3" runat="server" EnableClientSideAPI="true" ClientInstanceName=""
                                    Width="100%" ReadOnly="True">
                                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 8%;">
                                <asp:Label ID="lbl_paid0" runat="server" Text="إجمالي الفرق" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 7%;">
                                <dx:ASPxTextBox ID="txtCost7" runat="server" EnableClientSideAPI="True" ReadOnly="True"
                                    Width="100%">
                                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 8%;">
                                <asp:Label ID="lbl_percent" runat="server" Text="نسبة الموزع" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 7%;">
                                <dx:ASPxTextBox ID="txtCost4" runat="server" EnableClientSideAPI="true" ClientInstanceName=""
                                    Width="100%" ReadOnly="True">
                                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 8%;">
                                <asp:Label ID="lbl_percent0" runat="server" Text="نسبة الموزع" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 7%;">
                                <dx:ASPxTextBox ID="txtCost8" runat="server" EnableClientSideAPI="True" ReadOnly="True"
                                    Width="100%">
                                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <asp:SqlDataSource ID="SqlDataSource_project_create_temp" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM VIEW_yearly_project WHERE (batch_id = @batch_id)"
        UpdateCommandType="Text" UpdateCommand="UPDATE project SET project_name_ar = @project_name_ar WHERE (project_id = @project_id)">
        <UpdateParameters>
            <asp:Parameter Name="project_id" Type="Int32" />
            <asp:Parameter Name="project_name_ar" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter Name="batch_id" Type="String" SessionField="batch_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_waqf_accrual_view_1_Donor" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [waqf_accrual_view_1]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_waqf_accrual_view_1_SharingDonor" runat="server"
        ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT * FROM [waqf_accrual_view_1]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_current_flag" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT ISNULL(MAX(CURRENT_FLAG), 0) + 1 AS CURRENT_FLAG FROM yearly_waqf_proj_aloc_temp">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_waqf_proj_aloc_search" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        InsertCommandType="Text"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_yearly_waqf_proj_aloc_temp" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        InsertCommandType="StoredProcedure" InsertCommand="yearly_waqf_proj_alloc_init"
        UpdateCommandType="Text" UpdateCommand="UPDATE yearly_waqf_proj_aloc_temp SET enab_disab = @enab_disab WHERE (reciept_num = @reciept_num)">
        <InsertParameters>
            <asp:Parameter Name="batch_id" Type="String" DefaultValue="batch_id" />
            <asp:Parameter Name="current_flag" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="enab_disab" Type="Byte" />
            <asp:Parameter Name="reciept_num" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_SUM_Donor" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [waqf_accrual_view_1]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_SUM_SharingDonor" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [waqf_accrual_view_1]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_yearly_alocate_project" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        InsertCommandType="StoredProcedure" InsertCommand="yearly_alocate_project_full_units">
        <InsertParameters>
            <asp:Parameter Name="aloc_bat" Type="String" DefaultValue="aloc_bat" />
            <asp:Parameter Name="current_flag" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
