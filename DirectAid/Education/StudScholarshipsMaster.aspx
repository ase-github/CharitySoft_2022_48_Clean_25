<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="StudScholarshipsMaster.aspx.vb" Inherits="DirectAid.StudScholarshipsMaster" %>

<%@ Register Src="~/Education/UCBeneficiaryScholarshipsV2.ascx" TagPrefix="uc1" TagName="UCBeneficiaryScholarshipsV2" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:UCBeneficiaryScholarshipsV2 runat="server" ID="UCBeneficiaryScholarshipsV1" />
    </div>
    </form>
</body>
</html>
