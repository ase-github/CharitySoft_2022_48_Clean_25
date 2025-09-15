<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="DirectAid.Login" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/CapsLock.compressed.js"></script>

    <script type="text/javascript">

        function x() {
            //if (CapsLock.isOn()) {
            //    ASPxLabel_Message.SetValue("Caps Lock is On.");
            //}
            //else {
            //    ASPxLabel_Message.SetValue("");
            //}
        }

        //CapsLock.addListener(
        //function (status) {
        //    if (status) {
        //        ASPxLabel_Message.SetValue("Caps Lock is On.");
        //    }
        //    else {
        //        ASPxLabel_Message.SetValue("");
        //    }
        //});

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table align="center" width="30%">
            <tr>
                <td align="center" style="width: 100%;">
                    <table align="center" width="100%">
                        <tr>
                            <td align="center" style="width: 50%;">
                                <img src="Images/logo.png" />
                            </td>
                            <td align="center" style="width: 50%;">
                                <img src="images/clip_image002.jpg" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 50%;">
                                <asp:Button ID="Button1" runat="server" Text="Button" Visible="false" />
                            </td>
                            <td align="center" style="width: 50%;">&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 100%;">
                    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%"
                        HeaderText="تسجيل الدخول">
                        <HeaderImage Url="~/Images/UserKey_16x16.png">
                        </HeaderImage>
                        <PanelCollection>
                            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                <table align="center" cellpadding="5px" width="100%">
                                    <tr>
                                        <td align="center" style="width: 25%;">&nbsp;</td>
                                        <td align="center" style="width: 75%;">
                                            <dx:ASPxLabel ID="ASPxLabel_Message" runat="server" ClientInstanceName="ASPxLabel_Message" EnableClientSideAPI="True" Width="100%">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 25%;">
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="اسم المستخدم" Width="100%">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td align="center" style="width: 75%;">
                                            <dx:ASPxTextBox ID="ASPxTextBox_UserName" runat="server" Width="100%">
                                                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                                    <RequiredField ErrorText="" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 25%;">
                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="كلمه المرور" Width="100%">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td align="center" style="width: 75%;">
                                            <dx:ASPxTextBox ID="ASPxTextBox_Password" runat="server" Password="True" Width="100%">
                                                <ClientSideEvents KeyPress="function(s, e) {
	x();
}" />
                                                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                                    <RequiredField ErrorText="" IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 25%;">&nbsp;</td>
                                        <td align="center" style="width: 75%;">
                                            <dx:ASPxButton ID="ASPxButton_Login" runat="server" Text="دخول" Width="50%">
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 25%;">&nbsp;</td>
                                        <td align="center" style="width: 75%;">&nbsp;</td>
                                    </tr>
                                </table>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxRoundPanel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
