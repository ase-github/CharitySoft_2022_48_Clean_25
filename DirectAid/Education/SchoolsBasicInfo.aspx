<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SchoolsBasicInfo.aspx.vb" Inherits="DirectAid.SchoolsBasicInfo" %>

<%@ Register Src="~/Education/UCSchoolsBasicInfoDetailsV1.ascx" TagPrefix="uc1" TagName="UCSchoolsBasicInfoDetailsV1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:UCSchoolsBasicInfoDetailsV1 runat="server" ID="UCSchoolsBasicInfoDetailsV1" />
    </div>
    </form>
</body>
</html>
