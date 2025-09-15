<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ScholarshipExpenses.aspx.vb" Inherits="DirectAid.ScholarshipExpenses" %>

<%@ Register Src="~/Education/UCScholarshipExpensesV1.ascx" TagPrefix="uc1" TagName="UCScholarshipExpensesV1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:UCScholarshipExpensesV1 runat="server" id="UCScholarshipExpensesV1" />
    </form>
</body>
</html>
