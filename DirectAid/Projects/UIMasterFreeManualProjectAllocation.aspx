<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIMasterFreeManualProjectAllocation.aspx.vb" Inherits="DirectAid.UIMasterFreeManualProjectAllocation" %>

<%@ Register src="UCProjectExpense.ascx" tagname="UCProjectExpense" tagprefix="uc1" %>

<%@ Register src="~/Projects/UCManualProjectAllocation.ascx" tagname="UCManualProjectAllocation" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"  dir="rtl">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <uc2:UCManualProjectAllocation ID="UCManualProjectAllocation1" runat="server" />
    </form>
    </body>
</html>
