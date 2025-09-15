<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SuperAdminLogin.aspx.vb" Inherits="DirectAid.SuperAdminLogin" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>تسجيل دخول المشرف العام</title>
</head>
<body style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
    <form id="form1" runat="server">
        <div style="width: 400px; margin: 100px auto; padding: 30px; border: 1px solid #ccc; border-radius: 8px; background-color: #f9f9f9; text-align: center;">
            <h2 style="margin-bottom: 20px;">تسجيل دخول المشرف العام</h2>

            <dx:ASPxLabel ID="lblMessage" runat="server" ClientInstanceName="lblMessage" 
                          ForeColor="Red" Font-Bold="true" Width="100%" />

            <br /><br />

            <dx:ASPxButton ID="btnSuperAdminLogin" runat="server" Text="دخول المشرف العام" AutoPostBack="true"
                           OnClick="btnSuperAdminLogin_Click" Width="80%" />
        </div>
    </form>
</body>
</html>