<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SchoolsFeesAndStudCount.aspx.vb" Inherits="DirectAid.SchoolsFeesAndStudCount" %>

<%@ Register Src="~/Education/UCSchoolsStudentsCountAndFeesV1.ascx" TagPrefix="uc1" TagName="UCSchoolsStudentsCountAndFeesV1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:UCSchoolsStudentsCountAndFeesV1 runat="server" ID="UCSchoolsStudentsCountAndFeesV1" />
    </div>
    </form>
</body>
</html>
