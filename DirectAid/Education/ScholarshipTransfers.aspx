<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ScholarshipTransfers.aspx.vb" Inherits="DirectAid.ScholarshipTransfers" %>

<%@ Register Src="~/Education/UCScholarshipTransfersV1.ascx" TagPrefix="uc1" TagName="UCScholarshipTransfersV1" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <uc1:UCScholarshipTransfersV1 runat="server" id="UCScholarshipTransfersV1" />
    </form>
</body>
</html>
