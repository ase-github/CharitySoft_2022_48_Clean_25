<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="NewDonationsDetail.aspx.vb" Inherits="DirectAid.NewDonationsDetail" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>



<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>

<%--<!DOCTYPE html>--%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <script type="text/javascript">

        function OpenRecord(recordID) {

            document.location.href = 'Orphan.aspx?OrphanID=' + recordID;
        }

        function CustomButtonClick(e) {

            var gridName = "ASPxGridView1";
            var index = e.visibleIndex;
            var key = ASPxClientGridView.Cast("ASPxGridView1").GetRowKey(index);
            OpenRecord(key);

        }

        function Add_Begin() {
            ASPxButton_Add.SetEnabled(false);
            ASPxLoadingPanel1.Show();
            ASPxCallback_Add.PerformCallback(null);
        }

        function Add_End(e) {

            var result = e.result;

            if (result == "OK") {
                ASPxGridView_Source.Refresh();
                ASPxGridView_Target.Refresh();
                location.reload();
            }
            else {
                alert(result);
            }

            ASPxButton_Add.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

        function Add_Error(e) {
            alert(e.message);
            ASPxButton_Add.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

        function Remove_Begin() {
            ASPxButton_Remove.SetEnabled(false);
            ASPxLoadingPanel1.Show();
            ASPxCallback_Remove.PerformCallback(null);
        }

        function Remove_End(e) {

            var result = e.result;

            if (result == "OK") {
                ASPxGridView_Source.Refresh();
                ASPxGridView_Target.Refresh();
                location.reload();
            }
            else {
                alert(result);
            }

            ASPxButton_Remove.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

        function Remove_Error(e) {
            alert(e.message);
            ASPxButton_Remove.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

    </script>

    <table align="center" width="100%" cellpadding="5px">
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel ID="lblDOnationCod" runat="server" Font-Bold="True" Text="التبرع" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center">
                <dx:ASPxComboBox ID="CmbSearchId" runat="server" DataSourceID="DsSearchID"
                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                    IncrementalFilteringMode="Contains" TextField="name" ValueField="donation_code"
                    ValueType="System.Int16" Height="40px" Width="100%" CallbackPageSize="5">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="Btn_Search" runat="server" Height="25px" Text="بحث" Width="100%">
                    <Image Url="~/Images/Find_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" width="4%"></td>
        </tr>
    </table>

    <div style="direction: rtl">
        <table align="RIGHT" width="100%" cellpadding="5px">
            <tr>
                <td align="center" style="width: 48%" valign="top">
                    <dx:ASPxGridView ID="ASPxGridView_Target" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource_donations_rates"
                        KeyFieldName="donation_code;nat_code" Width="100%" ClientInstanceName="ASPxGridView_Target" meta:resourcekey="ASPxGridView1Resource1" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
                        <ClientSideEvents CustomButtonClick="function(s, e) {
	CustomButtonClick(e);
}" />
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="app_ser"
                                ShowInColumn="الرقم" ShowInGroupFooterColumn="الرقم" SummaryType="Count"
                                ValueDisplayFormat="{0:n0}" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image"
                                Width="20%" ShowSelectCheckbox="True">
                                <EditButton Visible="True">
                                    <Image Url="~/Images/Edit_16x16.png">
                                    </Image>
                                </EditButton>
                                <CancelButton>
                                    <Image Url="~/Images/Cancel_32x32.png">
                                    </Image>
                                </CancelButton>
                                <UpdateButton>
                                    <Image Url="~/Images/Save_32x32.png">
                                    </Image>
                                </UpdateButton>
                                <ClearFilterButton Visible="True">
                                    <Image Url="~/Images/Cancel_32x32.png">
                                    </Image>
                                </ClearFilterButton>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>

                                <HeaderTemplate>
                                    <dx:ASPxCheckBox ID="SelectAllCheckBox" runat="server" ToolTip="Select/Unselect all rows on the page"
                                        ClientSideEvents-CheckedChanged="function(s, e) { ASPxGridView_Target.SelectAllRowsOnPage(s.GetChecked()); }" />
                                </HeaderTemplate>
                                <HeaderStyle HorizontalAlign="Center" />

                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataComboBoxColumn Caption="الدولة" FieldName="nat_code" VisibleIndex="1" Width="40%" ReadOnly="True">
                                <PropertiesComboBox DataSourceID="EntityDataSource_nat_tab" TextField="nat_descrar" ValueField="nat_code" ValueType="System.Int16">
                                </PropertiesComboBox>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataComboBoxColumn>
                            <%--                            <dx:GridViewDataTextColumn Caption="القيمة" FieldName="nat_code" VisibleIndex="2" Width="20%" Visible="false">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>--%>
                            <dx:GridViewDataTextColumn Caption="القيمة" FieldName="donation_standard_value" VisibleIndex="2" Width="20%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="الكمية" FieldName="target_quantity" VisibleIndex="4" Width="20%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                        </Columns>
                        <SettingsBehavior AutoFilterRowInputDelay="10000" />
                        <SettingsPager PageSize="15">
                        </SettingsPager>
                        <SettingsEditing Mode="Inline" />
                        <Settings ShowFilterRow="True" ShowFooter="True" ShowTitlePanel="True" />
                        <SettingsText Title="الدول المسموح بها" />
                    </dx:ASPxGridView>

                    <asp:EntityDataSource ID="EntityDataSource_donations_rates" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EnableUpdate="True" EntitySetName="donations_rates" EntityTypeFilter="donations_rates" Where="" AutoGenerateWhereClause="True" Select="">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="CmbSearchId" DbType="Int16" DefaultValue="0" Name="donation_code" PropertyName="Value" />
                        </WhereParameters>
                    </asp:EntityDataSource>

                </td>
                <td align="center" style="width: 16%;" valign="top">
                    <table align="center" width="100%">
                        <tr>
                            <td align="center" style="width: 100%;">

                                <asp:EntityDataSource ID="EntityDataSource_nat_tab" runat="server" ConnectionString="name=charitysoftEntities"
                                    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="nat_tab"
                                    EntityTypeFilter="nat_tab">
                                </asp:EntityDataSource>

                                <cc1:LinqServerModeDataSource ID="LinqServerModeDataSource_target" runat="server" ContextTypeName="DirectAid.charitysoftEntities" EnableUpdate="True" />

                                <cc1:LinqServerModeDataSource ID="LinqServerModeDataSource_source" runat="server" ContextTypeName="DirectAid.charitysoftEntities"
                                    TableName="nat_tab" />

                                <asp:SqlDataSource ID="DsSearchID" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="  select cast(donation_code as varchar)+ ' - ' + donation_descrar  as name, donation_code  from donations "></asp:SqlDataSource>

                                <dx:ASPxButton ID="ASPxButton_Add" runat="server" Text="اضافه" Width="100%" UseSubmitBehavior="False"
                                    AutoPostBack="False" ClientInstanceName="ASPxButton_Add" EnableClientSideAPI="True"
                                    Font-Bold="True">
                                    <ClientSideEvents Click="function(s, e) {
	Add_Begin();
}" />
                                    <Image Url="~/Images/Action_Navigation_History_Forward_32x32.png">
                                    </Image>
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 100%;"></td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 100%;">
                                <dx:ASPxButton ID="ASPxButton_Remove" runat="server" Text="حذف" Width="100%" UseSubmitBehavior="False"
                                    AutoPostBack="False" ClientInstanceName="ASPxButton_Remove" EnableClientSideAPI="True"
                                    Font-Bold="True">
                                    <ClientSideEvents Click="function(s, e) {
	Remove_Begin();
}" />
                                    <Image Url="~/Images/Action_Navigation_History_Back_32x32.png">
                                    </Image>
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </td>
                <td align="center" style="width: 32%;" valign="top">
                    <dx:ASPxGridView ID="ASPxGridView_Source" runat="server" AutoGenerateColumns="False" DataSourceID="LinqServerModeDataSource_source"
                        KeyFieldName="nat_code" Width="100%" ClientInstanceName="ASPxGridView_Source" meta:resourcekey="ASPxGridView1Resource1" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
                        <ClientSideEvents CustomButtonClick="function(s, e) {
	CustomButtonClick(e);
}" />
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="app_ser"
                                ShowInColumn="الرقم" ShowInGroupFooterColumn="الرقم" SummaryType="Count"
                                ValueDisplayFormat="{0:n0}" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image"
                                Width="10%" ShowSelectCheckbox="True">
                                <ClearFilterButton Visible="True">
                                    <Image Url="~/Images/Cancel_32x32.png">
                                    </Image>
                                </ClearFilterButton>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>

                                <HeaderTemplate>
                                    <dx:ASPxCheckBox ID="SelectAllCheckBox" runat="server" ToolTip="Select/Unselect all rows on the page"
                                        ClientSideEvents-CheckedChanged="function(s, e) { ASPxGridView_Source.SelectAllRowsOnPage(s.GetChecked()); }" />
                                </HeaderTemplate>
                                <HeaderStyle HorizontalAlign="Center" />

                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="الدولة" FieldName="nat_descrar" VisibleIndex="1" Width="90%">
                                <PropertiesTextEdit EnableClientSideAPI="True">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nat_code" Visible="False" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>

                        </Columns>
                        <SettingsBehavior AutoFilterRowInputDelay="10000" />
                        <SettingsPager AlwaysShowPager="True" PageSize="15">
                        </SettingsPager>
                        <Settings ShowFilterRow="True" ShowFooter="True" ShowTitlePanel="True" />
                        <SettingsText Title="الدول الغير مسموح بها" />
                    </dx:ASPxGridView>

                </td>
                <td align="center" width="4%"></td>
            </tr>

        </table>
        <dx:ASPxCallback ID="ASPxCallback_Add" runat="server"
            ClientInstanceName="ASPxCallback_Add">
            <ClientSideEvents CallbackComplete="function(s, e) {
	Add_End(e);
}"
                CallbackError="function(s, e) {
	Add_Error(e);
}" />
        </dx:ASPxCallback>
        <dx:ASPxCallback ID="ASPxCallback_Remove" runat="server" ClientInstanceName="ASPxCallback_Remove">
            <ClientSideEvents CallbackComplete="function(s, e) {
	Remove_End(e);
}"
                CallbackError="function(s, e) {
	Remove_Error(e);
}" />
        </dx:ASPxCallback>
        <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
            Modal="True" Font-Bold="True">
        </dx:ASPxLoadingPanel>
    </div>

</asp:Content>



<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

