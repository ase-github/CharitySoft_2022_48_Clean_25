<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OrphanEducationMasterFree.aspx.vb"
    Inherits="DirectAid.OrphanEducationMasterFree" %>

<%@ Register Src="Orphans/UCOrphanEducation.ascx" TagName="UCOrphanEducation" TagPrefix="uc1" %>
<%@ Register Src="Beneficiary/UCBeneficiaryEducationV2.ascx" TagName="UCBeneficiaryEducationV2" TagPrefix="uc2" %>
<%@ Register src="/Beneficiary/UCBeneficiaryEducationV3.ascx" tagname="UCBeneficiaryEducationV3" tagprefix="uc3" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%--<uc1:UCOrphanEducation ID="UCOrphanEducation1" runat="server" />--%>
        <%--<uc2:UCBeneficiaryEducationV2 ID="UCBeneficiaryEducationV21" runat="server" />--%>
        <uc3:UCBeneficiaryEducationV3 ID="UCBeneficiaryEducationV31" runat="server" />
    </form>
</body>
</html>
