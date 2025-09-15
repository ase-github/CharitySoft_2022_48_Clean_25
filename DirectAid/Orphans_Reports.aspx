<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="Orphans_Reports.aspx.vb" Inherits="DirectAid.Orphans_Reports" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="75%" align="center" cellpadding="5px">
        <tr>
            <td align="center" style="width: 50%;">
                <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="حركة الأيتام (الجدد و الملغيين) لسنة " Width="100%" 
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxTextBox runat="server" Width="100%" Text="0" ID="ASPxTextBox_Year">
                    <MaskSettings Mask="&lt;1900..3000&gt;">
                    </MaskSettings>
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxButton ID="ASPxButton_Print" runat="server" Text="طباعة" Width="100%" AutoPostBack="true"
                    ClientInstanceName="ASPxButton_Print" EnableClientSideAPI="True" Font-Bold="True"
                    ValidationGroup="print">
                    <Image Url="~/Images/Print_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 50%;">
                <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="كشف تفصيلي لاعداد الايتام لعام" Width="100%" 
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxTextBox runat="server" Width="100%" Text="0" ID="ASPxTextBox_Year_2">
                    <MaskSettings Mask="&lt;1900..3000&gt;">
                    </MaskSettings>
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxButton ID="ASPxButton_Print_2" runat="server" Text="طباعة" Width="100%" AutoPostBack="true"
                    ClientInstanceName="ASPxButton_Print_2" EnableClientSideAPI="True" Font-Bold="True"
                    ValidationGroup="print">
                    <Image Url="~/Images/Print_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
        </tr>
        </table>
</asp:Content>
