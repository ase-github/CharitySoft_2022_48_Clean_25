<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BeneficiaryYearlyDataMasterFree.aspx.vb"
    Inherits="DirectAid.BeneficiaryYearlyDataMasterFree" %>

<%@ Register src="Beneficiary/UCBeneficiaryYearlyDataV1.ascx" tagname="UCBeneficiaryYearlyDataV1" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:UCBeneficiaryYearlyDataV1 ID="UCBeneficiaryYearlyDataV11" runat="server" />
    </form>
</body>
</html>
