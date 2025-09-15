<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SchoolActivities.aspx.vb" Inherits="DirectAid.SchoolActivities" %>

<%@ Register Src="~/Education/UCSchoolActivitiesV1.ascx" TagPrefix="uc1" TagName="UCSchoolActivitiesV1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:UCSchoolActivitiesV1 runat="server" ID="UCSchoolActivitiesV1" />
    </div>
    </form>
</body>
</html>
