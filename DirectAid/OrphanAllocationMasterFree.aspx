<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OrphanAllocationMasterFree.aspx.vb" Inherits="DirectAid.OrphanAllocationMasterFree" %>

<%@ Register src="~/Beneficiary/UCBeneficiaryAllocationV5.ascx" tagname="UCBeneficiaryAllocation" tagprefix="uc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <uc:UCBeneficiaryAllocation ID="_UCBeneficiaryAllocation" runat="server" />
    </form>
</body>
</html>