<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIProjectFinancialsBudgetSummary.aspx.vb" Inherits="DirectAid.UIProjectFinancialsBudgetSummary" %>

<%@ Register src="~/Projects/UCProjectFinancialsBudgetSummaryV1.ascx" tagname="ProjectFinancials" tagprefix="UC" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <UC:ProjectFinancials ID="UCProjectFinancialsBudgetSummaryV1" runat="server" />
    
    </div>
    </form>
</body>
</html>
