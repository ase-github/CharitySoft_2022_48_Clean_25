<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCGenericReportViewerV1.ascx.vb"
    Inherits="DirectAid.UCGenericReportViewerV1" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>


<asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
<CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
    <Report FileName=".\Reports\Collection_Receipt.rpt">
    </Report>
</CR:CrystalReportSource>

<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
    Width="881px" ToolPanelView="None" ReportSourceID="CrystalReportSource1" Height="50px" PrintMode="ActiveX" HasRefreshButton="True" />
