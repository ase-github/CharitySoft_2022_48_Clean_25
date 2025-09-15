<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="UIUserRoles.aspx.vb" Inherits="DirectAid.UIUserRoles" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>



<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <% If DesignMode Then%>
    <script src="Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
    <% End If%>
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
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" width="100%">
        <tbody>
            <tr>
                <td align="center" style="width: 10%;">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="اسم المستخدم : " Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 30%;">
                    <dx:ASPxComboBox ID="ASPxComboBox_user_name" runat="server" Width="100%"
                        meta:resourcekey="ASPxComboBox_ListTypeResource1" DataSourceID="EntityDataSource_view_user" TextField="namear" ValueField="user_name" CallbackPageSize="5" DropDownRows="5" IncrementalFilteringMode="Contains" TextFormatString="{0} - {1}" EnableCallbackMode="True">
                        <Columns>
                            <dx:ListBoxColumn Caption="المستخدم" FieldName="user_name" Width="25%" />
                            <dx:ListBoxColumn Caption="الاسم" FieldName="namear" Width="75%" />
                        </Columns>
                        <Buttons>
                            <dx:EditButton>
                                <Image Url="~/Images/Action_Reload_32x32.png">
                                </Image>
                            </dx:EditButton>
                        </Buttons>
                    </dx:ASPxComboBox>
                </td>
                <td align="center" style="width: 60%;">
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
                    <asp:EntityDataSource ID="EntityDataSource_view_user" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="view_user" EntityTypeFilter="view_user">
                    </asp:EntityDataSource>
                </td>
            </tr>

        </tbody>
    </table>
    <table align="center" width="100%">
        <tbody>
            <tr>
                <td align="center" style="width: 40%; vertical-align: top;">

                    <cc1:LinqServerModeDataSource ID="LinqServerModeDataSource_target" runat="server" ContextTypeName="DirectAid.charitysoftEntities"
                        TableName="role_data" />

                    <dx:ASPxGridView ID="ASPxGridView_Target" runat="server" AutoGenerateColumns="False" DataSourceID="LinqServerModeDataSource_target"
                        KeyFieldName="id" Width="100%" ClientInstanceName="ASPxGridView_Target" meta:resourcekey="ASPxGridView1Resource1">
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
                                        ClientSideEvents-CheckedChanged="function(s, e) { ASPxGridView_Target.SelectAllRowsOnPage(s.GetChecked()); }" />
                                </HeaderTemplate>
                                <HeaderStyle HorizontalAlign="Center" />

                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="الصلاحيه" FieldName="namear" VisibleIndex="1" Width="90%">
                                <PropertiesTextEdit EnableClientSideAPI="True">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="id" Visible="False" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>

                        </Columns>
                        <SettingsBehavior AutoFilterRowInputDelay="10000" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFilterRow="True" ShowFooter="True" ShowTitlePanel="True" />
                        <SettingsText Title="الصلاحيات الممنوحه" />
                    </dx:ASPxGridView>
                </td>
                <td align="center" style="width: 20%; vertical-align: top;">
                    <table align="center" width="100%">
                        <tr>
                            <td align="center" style="width: 100%;">
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
                <td align="center" style="width: 40%; vertical-align: top;">
                    <cc1:LinqServerModeDataSource ID="LinqServerModeDataSource_source" runat="server" ContextTypeName="DirectAid.charitysoftEntities"
                        TableName="role_data" />

                    <dx:ASPxGridView ID="ASPxGridView_Source" runat="server" AutoGenerateColumns="False" DataSourceID="LinqServerModeDataSource_source"
                        KeyFieldName="id" Width="100%" ClientInstanceName="ASPxGridView_Source" meta:resourcekey="ASPxGridView1Resource1">
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
                            <dx:GridViewDataTextColumn Caption="الصلاحيه" FieldName="namear" VisibleIndex="1" Width="90%">
                                <PropertiesTextEdit EnableClientSideAPI="True">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="id" Visible="False" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>

                        </Columns>
                        <SettingsBehavior AutoFilterRowInputDelay="10000" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFilterRow="True" ShowFooter="True" ShowTitlePanel="True" />
                        <SettingsText Title="الصلاحيات الغير ممنوحه" />
                    </dx:ASPxGridView>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
