<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIWaqfCreation.aspx.vb"
    Inherits="DirectAid.UIWaqfCreation" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>



<%@ Register Src="UCProjectDetail.ascx" TagName="ucprojectdetail" TagPrefix="uc1" %>

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

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel5" runat="server" Width="100%" HeaderText="أوقاف جديدة">
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <table width="100%">
                    <tbody>
                        <tr>
                            <td align="center" colspan="7">
                                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView1"
                                    Width="100%" DataSourceID="SqlDataSource_waqf_create_temp" KeyFieldName="waqf_no"
                                    RightToLeft="True">
                                    <columns>
                                        <dx:GridViewDataTextColumn Caption="رقم الوقف" FieldName="waqf_no" ReadOnly="false"
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="10%">
                                            <EditFormSettings Visible="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                            <DataItemTemplate>
                                                <a href='UIWaqfDonorProject.aspx?WaqfNo=<%# Eval("waqf_no") %>' target="_blank">
                                                    <%# Eval("waqf_no")%></a>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="اسم الوقف" FieldName="waqf_name" ShowInCustomizationForm="True"
                                            VisibleIndex="2" Width="30%">
                                            <EditFormSettings Visible="True" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="waqf_name_eng" ShowInCustomizationForm="false"
                                            Visible="False" VisibleIndex="3">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="التصنيف" FieldName="donation_descrar" ShowInCustomizationForm="false"
                                            VisibleIndex="4" Width="25%">
                                            <EditFormSettings Visible="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ الوقف" FieldName="create_date" ShowInCustomizationForm="false"
                                            VisibleIndex="5" Width="15%">
                                            <EditFormSettings Visible="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn FieldName="waqf_amount" VisibleIndex="2" Caption="مبلغ الوقف"
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
                                    </columns>
                                    <settingsbehavior confirmdelete="True" enablecustomizationwindow="True" />
                                    <settingspager>
                                        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                                        </PageSizeItemSettings>
                                    </settingspager>
                                    <settingsediting editformcolumncount="1" mode="EditForm" />
                                    <settings enablefiltercontrolpopupmenuscrolling="True" showfilterrowmenu="True" showheaderfilterbutton="True" />
                                    <settingsdetail allowonlyonemasterrowexpanded="True" />
                                </dx:ASPxGridView>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="3">
                                <asp:Label ID="lbl_followers0" runat="server" Text="الواقفون" Width="100%"></asp:Label>
                            </td>
                            <td align="center" colspan="3">
                                <asp:Label runat="server" Text="المساهمات الوقفية" Width="100%" ID="lbl_followers"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 10%;">
                                <asp:Label ID="Label1" runat="server" Text="عدد المساهمين" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxTextBox ID="ASPxTextBox_DonorCount" runat="server" EnableClientSideAPI="true"
                                    ClientInstanceName="ASPxTextBox_DonorCount" Width="100%" ReadOnly="True">
                                    <masksettings mask="&lt;0..9999999&gt;" />
                                    <validationsettings errordisplaymode="None" errortext="">
                                    </validationsettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 25%;" rowspan="6">
                                <dx:ASPxCallback ID="ASPxCallback_Donor" runat="server" ClientInstanceName="ASPxCallback_Donor">
                                </dx:ASPxCallback>
                                <dx:ASPxGridView ID="ASPxGridView_Donor" runat="server" AutoGenerateColumns="False"
                                    ClientInstanceName="ASPxGridView_Donor" EnableCallBacks="true" DataSourceID="SqlDataSource_waqf_donor_receipts_create_view_Donor"
                                    RightToLeft="True" Width="100%" KeyFieldName="reciept_num">
                                    <clientsideevents selectionchanged="function(s, e) {
		Calculate_Donor(s, e);
}" />
                                    <columns>
                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True"
                                            VisibleIndex="0" Width="5%">
                                            <ClearFilterButton Visible="True">
                                            </ClearFilterButton>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn Caption="الايصال" FieldName="reciept_num" ShowInCustomizationForm="True"
                                            VisibleIndex="2" Width="10%">
                                            <DataItemTemplate>
                                                <a href='../Collection.aspx?ReceiptID=<%# Eval("reciept_num") %>' target="_blank">
                                                    <%# Eval("reciept_num")%></a>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="القيمه" FieldName="donation_value" ShowInCustomizationForm="True"
                                            VisibleIndex="3" Width="10%">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="الاسم" FieldName="donor_namear" ShowInCustomizationForm="True"
                                            VisibleIndex="1" Width="60%" SortIndex="0" SortOrder="Ascending">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="التاريخ" ShowInCustomizationForm="True" UnboundType="DateTime"
                                            VisibleIndex="4" Width="15%">
                                        </dx:GridViewDataDateColumn>
                                    </columns>
                                    <settingsbehavior confirmdelete="True" enablecustomizationwindow="True" />
                                    <settingspager>
                                        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                                        </PageSizeItemSettings>
                                    </settingspager>
                                    <settingsediting editformcolumncount="3" />
                                    <settings enablefiltercontrolpopupmenuscrolling="True" showfilterrowmenu="True" showheaderfilterbutton="True"
                                        showfilterrow="True" showfooter="True" />
                                    <settingsdetail allowonlyonemasterrowexpanded="True" />
                                </dx:ASPxGridView>
                            </td>
                            <td align="center" style="width: 25%;" rowspan="6">
                                <dx:ASPxCallback ID="ASPxCallback_SharingDonor" runat="server" ClientInstanceName="ASPxCallback_SharingDonor">
                                </dx:ASPxCallback>
                                <dx:ASPxGridView ID="ASPxGridView_SharingDonor" runat="server" AutoGenerateColumns="False"
                                    ClientInstanceName="ASPxGridView_SharingDonor" EnableCallBacks="true" DataSourceID="SqlDataSource_waqf_donor_receipts_create_view_SharingDonor"
                                    RightToLeft="True" Width="100%" KeyFieldName="reciept_num">
                                    <clientsideevents selectionchanged="function(s, e) {
	Calculate_SharingDonor(s, e);
}" />
                                    <columns>
                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" ShowSelectCheckbox="True"
                                            VisibleIndex="0" Width="5%">
                                            <ClearFilterButton Visible="True">
                                            </ClearFilterButton>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn Caption="الايصال" FieldName="reciept_num" ShowInCustomizationForm="True"
                                            VisibleIndex="2" Width="10%">
                                            <DataItemTemplate>
                                                <a href='../Collection.aspx?ReceiptNum=<%# Eval("reciept_num") %>' target="_blank">
                                                    <%# Eval("reciept_num")%></a>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="القيمه" FieldName="donation_value" ShowInCustomizationForm="True"
                                            VisibleIndex="3" Width="10%">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="الاسم" FieldName="donor_namear" ShowInCustomizationForm="True"
                                            VisibleIndex="1" Width="60%" SortIndex="0" SortOrder="Ascending">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="التاريخ" ShowInCustomizationForm="True" UnboundType="DateTime"
                                            VisibleIndex="4" Width="15%">
                                        </dx:GridViewDataDateColumn>
                                    </columns>
                                    <settingsbehavior confirmdelete="True" enablecustomizationwindow="True" />
                                    <settingspager>
                                        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                                        </PageSizeItemSettings>
                                    </settingspager>
                                    <settingsediting editformcolumncount="3" />
                                    <settings enablefiltercontrolpopupmenuscrolling="True" showfilterrowmenu="True" showheaderfilterbutton="True"
                                        showfilterrow="True" showfooter="True" />
                                    <settingsdetail allowonlyonemasterrowexpanded="True" />
                                </dx:ASPxGridView>
                            </td>
                            <td align="center" style="width: 10%;">
                                <asp:Label ID="Label4" runat="server" Text="عدد المساهمين" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxTextBox ID="ASPxTextBox_DonorCount_Share" runat="server" ClientInstanceName="ASPxTextBox_DonorCount_Share"
                                    EnableClientSideAPI="True" ReadOnly="True" Width="100%">
                                    <masksettings mask="&lt;0..9999999&gt;" />
                                    <validationsettings errordisplaymode="None" errortext="">
                                    </validationsettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxButton ID="ASPxButton1" runat="server" Text="الكتب الرسمية" Width="100%">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 10%;">
                                <asp:Label ID="Label2" runat="server" Text="إجمالى القيمة" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxTextBox ID="ASPxTextBox_TotalValue" runat="server" EnableClientSideAPI="true"
                                    ClientInstanceName="ASPxTextBox_TotalValue" Width="100%" ReadOnly="True">
                                    <masksettings mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <validationsettings errordisplaymode="None" errortext="">
                                    </validationsettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 10%;">
                                <asp:Label ID="Label5" runat="server" Text="إجمالى القيمة" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxTextBox ID="ASPxTextBox_TotalValue_Share" runat="server" ClientInstanceName="ASPxTextBox_TotalValue_Share"
                                    EnableClientSideAPI="True" ReadOnly="True" Width="100%">
                                    <masksettings mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <validationsettings errordisplaymode="None" errortext="">
                                    </validationsettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="EXCEL" Width="100%">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 10%;">
                                <asp:Label ID="lbl_late" runat="server" Text="إجمالى المبلغ المتوفر" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxTextBox ID="txtCost1" runat="server" EnableClientSideAPI="true" ClientInstanceName=""
                                    Width="100%" ReadOnly="True">
                                    <masksettings mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <validationsettings errordisplaymode="None" errortext="">
                                    </validationsettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 10%;">
                                <asp:Label ID="lbl_late0" runat="server" Text="إجمالى المبلغ المتوفر" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxTextBox ID="txtCost5" runat="server" EnableClientSideAPI="True" ReadOnly="True"
                                    Width="100%">
                                    <masksettings mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <validationsettings errordisplaymode="None" errortext="">
                                    </validationsettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxButton ID="ASPxButton3" runat="server" Text=" SMS تقرير " Width="100%">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 10%;">
                                <asp:Label ID="Label3" runat="server" Text="إجمالي المتبقي" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxTextBox ID="txtCost2" runat="server" EnableClientSideAPI="true" ClientInstanceName=""
                                    Width="100%" ReadOnly="True">
                                    <masksettings mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <validationsettings errordisplaymode="None" errortext="">
                                    </validationsettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 10%;">
                                <asp:Label ID="Label6" runat="server" Text="إجمالي المتبقي" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxTextBox ID="txtCost6" runat="server" EnableClientSideAPI="True" ReadOnly="True"
                                    Width="100%">
                                    <masksettings mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <validationsettings errordisplaymode="None" errortext="">
                                    </validationsettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxButton ID="ASPxButton4" runat="server" Text="نقل الوقف لواقف آخر" Width="100%">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 10%;">
                                <asp:Label ID="lbl_paid" runat="server" Text="إجمالي الفرق" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxTextBox ID="txtCost3" runat="server" EnableClientSideAPI="true" ClientInstanceName=""
                                    Width="100%" ReadOnly="True">
                                    <masksettings mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <validationsettings errordisplaymode="None" errortext="">
                                    </validationsettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 10%;">
                                <asp:Label ID="lbl_paid0" runat="server" Text="إجمالي الفرق" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxTextBox ID="txtCost7" runat="server" EnableClientSideAPI="True" ReadOnly="True"
                                    Width="100%">
                                    <masksettings mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <validationsettings errordisplaymode="None" errortext="">
                                    </validationsettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxButton ID="ASPxButton5" runat="server" Text="تقرير" Width="100%">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 10%;">
                                <asp:Label ID="lbl_percent" runat="server" Text="نسبة الموزع" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxTextBox ID="txtCost4" runat="server" EnableClientSideAPI="true" ClientInstanceName=""
                                    Width="100%" ReadOnly="True">
                                    <masksettings mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <validationsettings errordisplaymode="None" errortext="">
                                    </validationsettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 10%;">
                                <asp:Label ID="lbl_percent0" runat="server" Text="نسبة الموزع" Width="100%"></asp:Label>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxTextBox ID="txtCost8" runat="server" EnableClientSideAPI="True" ReadOnly="True"
                                    Width="100%">
                                    <masksettings mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                    <validationsettings errordisplaymode="None" errortext="">
                                    </validationsettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxButton ID="ASPxButton_alocate_waqf" runat="server" Text="ربط الأوقاف بالواقفين"
                                    Width="100%">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <asp:SqlDataSource ID="SqlDataSource_ProjectType" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_type]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_Country" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT nat_code ,
        nat_descrar  FROM [nat_tab]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_City" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [city]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_Project" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_banks_list" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [banks_list]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_waqf_create_temp" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM VIEW_waqf WHERE (batch_id = @batch_id)"
        UpdateCommandType="Text" UpdateCommand="UPDATE waqf SET waqf_name = @waqf_name WHERE (waqf_no = @waqf_no)">
        <UpdateParameters>
            <asp:Parameter Name="waqf_no" Type="Int32" />
            <asp:Parameter Name="waqf_name" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:SessionParameter Name="batch_id" Type="String" SessionField="batch_id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_waqf_donor_receipts_create_view_Donor" runat="server"
        ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT * FROM [waqf_donor_receipts_create_view]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_waqf_donor_receipts_create_view_SharingDonor"
        runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [waqf_donor_receipts_create_view]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_current_flag" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT ISNULL(MAX(CURRENT_FLAG), 0) + 1 AS CURRENT_FLAG FROM WAQF_PROJ_ALOC_SEARCH">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_waqf_proj_aloc_search" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        InsertCommandType="Text"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_waqf_proj_aloc_temp" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        InsertCommandType="StoredProcedure" InsertCommand="waqf_alloc_init" UpdateCommandType="Text"
        UpdateCommand="UPDATE waqf_proj_aloc_temp SET enab_disab = @enab_disab WHERE (reciept_num = @reciept_num)">
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
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [waqf_donor_receipts_create_view]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_SUM_SharingDonor" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [waqf_donor_receipts_create_view]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_alocate_waqf" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        InsertCommandType="StoredProcedure" InsertCommand="alocate_waqf">
        <InsertParameters>
            <asp:Parameter Name="aloc_bat" Type="String" DefaultValue="aloc_bat" />
            <asp:Parameter Name="current_flag" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>