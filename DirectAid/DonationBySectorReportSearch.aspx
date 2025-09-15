<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="DonationBySectorReportSearch.aspx.vb" Inherits="DirectAid.DonationBySectorReportSearch" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
        <% If DesignMode Then%>
    <script src="Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
        <% End If%>
    <script type="text/javascript">

        function Print_Begin() {
            if (ASPxClientEdit.ValidateGroup("print")) {
                ASPxButton_Print.SetEnabled(false);
                ASPxLoadingPanel1.Show();
                ASPxCallback_Print.PerformCallback(null);
            }
        }

        function Print_End(e) {

            var result = e.result;

            if (result == "OK") {
                window.open("ReportViewerSelectionFormula.aspx?popup=1", "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1000,height=600");
            }
            else {
                alert(result);
            }

            ASPxButton_Print.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

        function Print_Error(e) {
            alert(e.message);
            ASPxButton_Print.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="75%" align="center">
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="نوع التقرير" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" TextField="namear" ValueField="report_file_name"
                    Width="100%" ID="ASPxComboBox_ReportType" SelectedIndex="0">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Items>
                        <dx:ListEditItem Selected="True" Text="تبرعات حسب القطاع" Value="dash_collect_sector" />
                    </Items>
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 10%;">
                    <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
                        Modal="True" Font-Bold="True">
                    </dx:ASPxLoadingPanel>
                </td>
            <td align="center" style="width: 40%;">
                    <dx:ASPxCallback ID="ASPxCallback_Print" runat="server"
                        ClientInstanceName="ASPxCallback_Print">
                        <ClientSideEvents CallbackComplete="function(s, e) {
	Print_End(e);
}"
                            CallbackError="function(s, e) {
	Print_Error(e);
}" />
                    </dx:ASPxCallback>
                    </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">&nbsp;</td>
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="التاريخ من" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="reciept_date_From" runat="server" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="print">
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="الى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="reciept_date_To" runat="server" Width="100%">
                                        <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="print">
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="مصدر التمويل" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" ValueType="System.Byte" TextField="namear" ValueField="id"
                    Width="100%" ID="recpt_src" DataSourceID="EntityDataSource_funding_source">
                    <Items>
                        <dx:ListEditItem Text="استقطاع" Value="1" />
                        <dx:ListEditItem Text="سند قبض" Value="2" />
                    </Items>
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 10%;">
                &nbsp;</td>
            <td align="center" style="width: 40%;">
                <asp:EntityDataSource ID="EntityDataSource_funding_source" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="funding_source" EntityTypeFilter="funding_source">
    </asp:EntityDataSource>




            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">&nbsp;
            </td>
            <td align="center" style="width: 40%;">&nbsp;
            </td>
            <td align="center" style="width: 10%;">&nbsp;
            </td>
            <td align="center" style="width: 40%;">&nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">&nbsp;
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxButton ID="ASPxButton_Print" runat="server" Text="طباعة" Width="100%" AutoPostBack="False"
                    ClientInstanceName="ASPxButton_Print" EnableClientSideAPI="True" Font-Bold="True"
                    ValidationGroup="print">
                    <ClientSideEvents Click="function(s, e) {
	Print_Begin();
}" />
                    <Image Url="~/Images/Print_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 10%;">&nbsp;
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxButton ID="ASPxButton_New" runat="server" Text="جديد" Width="100%" UseSubmitBehavior="False"
                    ClientInstanceName="ASPxButton_New" EnableClientSideAPI="True" Font-Bold="True">
                    <Image Url="~/Images/New_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">&nbsp;
            </td>
            <td align="center" style="width: 40%;">
                &nbsp;</td>
            <td align="center" style="width: 10%;">
                &nbsp;</td>
            <td align="center" style="width: 40%;">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
