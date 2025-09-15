<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReportViewerSelectionFormula.aspx.vb"
    Inherits="DirectAid.ReportViewerSelectionFormula" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" >
    <div >
    <dx:ASPxButton ID="ASPxButton_Back" runat="server" Text="العوده">
    </dx:ASPxButton>
        <CR:CrystalReportSource ID="CrystalReportSource1" runat="server" EnableCaching="False">
            <Report FileName=".\Reports\Collection_Receipt.rpt">
            </Report>
        </CR:CrystalReportSource>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
             Width="100%" ToolPanelView="None" 
            PrintMode="ActiveX" ReportSourceID="CrystalReportSource1" />
            </div>
    </form>
</body>
</html>