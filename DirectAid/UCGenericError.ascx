<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCGenericError.ascx.vb"
    Inherits="DirectAid.UCGenericError" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<table align="center">
    <tbody>
        <tr>
            <td align="center">
                <img alt="" src="Images/Error.gif" />
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center">
                <dx:ASPxLabel ID="ASPxLabel_Message" runat="server" Text="عذرا لقد حدث خطأ">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <dx:ASPxLabel ID="ASPxLabel_Message_Technical" runat="server" Text="">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td align="center">
                <dx:ASPxButton ID="ASPxButton_Home" runat="server" PostBackUrl="~/Default.aspx" Text="العودة للصفحه الرئيسيه">
                    <Image Url="~/Images/Home_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
        </tr>
    </tbody>
</table>
