<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ApplicationPeriodicalReportsDonorLog.aspx.vb" Inherits="DirectAid.ApplicationPeriodicalReportsDonorLog" %>

<%@ Register src="Beneficiary/UCApplicationPeriodicalReportsDonorLog.ascx" tagname="UCApplicationPeriodicalReportsDonorLog" tagprefix="UC" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <UC:UCApplicationPeriodicalReportsDonorLog ID="UCApplicationPeriodicalReportsDonorLog" runat="server" />
    </div>
    </form>
</body>
</html>
