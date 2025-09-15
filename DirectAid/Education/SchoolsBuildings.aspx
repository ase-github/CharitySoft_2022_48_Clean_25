<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SchoolsBuildings.aspx.vb" Inherits="DirectAid.SchoolsBuildings" %>

<%@ Register Src="~/Education/UCSchoolBuildingsV1.ascx" TagPrefix="uc1" TagName="UCSchoolBuildingsV1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:UCSchoolBuildingsV1 runat="server" ID="UCSchoolBuildingsV1" />
    </div>
    </form>
</body>
</html>
