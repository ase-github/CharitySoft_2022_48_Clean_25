<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OrphanHobbyMasterFree.aspx.vb" Inherits="DirectAid.OrphanHobbyMasterFree" %>

<%@ Register Src="~/Orphans/UCOrphanHobby.ascx" TagName="UCOrphanHobby" TagPrefix="uc1" %>

<%@ Register src="Beneficiary/UCBeneficiaryHobbyActivityV2.ascx" tagname="UCBeneficiaryHobbyActivityV2" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%--<uc1:UCOrphanHobby ID="UCOrphanHobby1" runat="server" />--%>
        <uc2:UCBeneficiaryHobbyActivityV2 ID="UCBeneficiaryHobbyActivityV21" runat="server" />
    </form>
</body>
</html>
