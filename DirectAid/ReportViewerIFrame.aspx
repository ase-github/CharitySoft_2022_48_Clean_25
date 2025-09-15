<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReportViewerIFrame.aspx.vb"
    Inherits="DirectAid.ReportViewerIFrame" %>



<%@ Register Src="Reporting/UCReportViewerV1.ascx" TagName="UCReportViewer" TagPrefix="uc" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <uc:UCReportViewer ID="_UCReportViewer" runat="server" />
    </form>
</body>
</html>
