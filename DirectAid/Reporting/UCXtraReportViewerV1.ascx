<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCXtraReportViewerV1.ascx.vb"
    Inherits="DirectAid.UCXtraReportViewerV1" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraReports.v25.1.Web.WebForms, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>

<script type="text/javascript">

    var firstRun = true;
    var endCallbackCount = 0;

    document.onreadystatechange = function () {
        if (firstRun) {
            if (document.readyState == "interactive" || document.readyState == "complete") {
                firstRun = false;
                ASPxClientReportViewer.Cast("ReportViewer1").Print();
            }
        }
    }

    function ActivateEscape(e) {
        endCallbackCount++;
        ASPxButton_Back.DoClick();
    }

</script>

<table width="100%" align="center">
    <tr>
        <td align="center" style="width: 100%">
            <dx:ReportToolbar ID="ReportToolbar1" runat="server" ShowDefaultButtons="False" ClientInstanceName="ReportToolbar1" ReportViewerID="ReportViewer1" Width="100%">
                <Items>
                    <dx:ReportToolbarButton ItemKind="Search" />
                    <dx:ReportToolbarSeparator />
                    <dx:ReportToolbarButton ItemKind="PrintReport" />
                    <dx:ReportToolbarButton ItemKind="PrintPage" />
                    <dx:ReportToolbarSeparator />
                    <dx:ReportToolbarButton Enabled="False" ItemKind="FirstPage" />
                    <dx:ReportToolbarButton Enabled="False" ItemKind="PreviousPage" />
                    <dx:ReportToolbarLabel ItemKind="PageLabel" />
                    <dx:ReportToolbarComboBox ItemKind="PageNumber" Width="65px">
                    </dx:ReportToolbarComboBox>
                    <dx:ReportToolbarLabel ItemKind="OfLabel" />
                    <dx:ReportToolbarTextBox ItemKind="PageCount" />
                    <dx:ReportToolbarButton ItemKind="NextPage" />
                    <dx:ReportToolbarButton ItemKind="LastPage" />
                    <dx:ReportToolbarSeparator />
                    <dx:ReportToolbarButton ItemKind="SaveToDisk" />
                    <dx:ReportToolbarButton ItemKind="SaveToWindow" />
                    <dx:ReportToolbarComboBox ItemKind="SaveFormat" Width="70px">
                        <Elements>
                            <dx:ListElement Value="pdf" />
                            <dx:ListElement Value="xls" />
                            <dx:ListElement Value="xlsx" />
                            <dx:ListElement Value="rtf" />
                            <dx:ListElement Value="mht" />
                            <dx:ListElement Value="html" />
                            <dx:ListElement Value="txt" />
                            <dx:ListElement Value="csv" />
                            <dx:ListElement Value="png" />
                        </Elements>
                    </dx:ReportToolbarComboBox>
                </Items>
                <Styles>
                    <LabelStyle>
                        <Margins MarginLeft='3px' MarginRight='3px' />
                    </LabelStyle>
                </Styles>
            </dx:ReportToolbar>

            <dx:ReportViewer ID="ReportViewer1" runat="server" ClientInstanceName="ReportViewer1"
                EnableCallbackCompression="False" Report="<%# new DirectAid.XtraReport_ReceiptVoucherDoubleV2() %>"
                 PrintUsingAdobePlugIn="False" ReportName="DirectAid.XtraReport_ReceiptVoucherDoubleV2">
                <ClientSideEvents EndCallback="function(s, e) {
	ActivateEscape(e);
}" />
            </dx:ReportViewer>
        </td>
    </tr>
</table>

