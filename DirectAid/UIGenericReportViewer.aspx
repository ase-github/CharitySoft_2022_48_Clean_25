<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIGenericReportViewer.aspx.vb"
    Inherits="DirectAid.UIGenericReportViewer" %>


<%@ Register src="Reporting/UCGenericReportViewerV1.ascx" tagname="UCGenericReportViewerV1" tagprefix="uc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script language="javaScript" type="text/javascript" src="/crystalreportviewers13/js/crviewer/crv.js"></script> 
</head>
<body>
    <form id="form1" runat="server">
        <uc1:UCGenericReportViewerV1 ID="UCGenericReportViewerV11" runat="server" />
    </form>
</body>
</html>
