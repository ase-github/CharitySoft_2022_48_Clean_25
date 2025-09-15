<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SchoolsEmployeesDetails.aspx.vb" Inherits="DirectAid.SchoolsEmployeesDetails" %>

<%@ Register Src="~/Education/UCSchoolsEmployeesDetailsV1.ascx" TagPrefix="uc1" TagName="UCSchoolsEmployeesDetailsV1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:UCSchoolsEmployeesDetailsV1 runat="server" id="UCSchoolsEmployeesDetailsV1" />
    </form>
</body>
</html>
