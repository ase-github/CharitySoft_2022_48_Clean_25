<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIMasterFreeProjectResponsible.aspx.vb" Inherits="DirectAid.UIMasterFreeProjectResponsible" %>

<%@ Register src="~/Projects/UCProjectOfficalsV1.ascx" tagname="ProjectOfficals" tagprefix="UC" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" dir="rtl" dir="rtl">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <UC:ProjectOfficals ID="UCProjectOfficalsV1" runat="server" />
    
    </div>
    </form>
</body>
</html>
