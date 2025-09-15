<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="XtraReportViewer.aspx.vb"
    Inherits="DirectAid.XtraReportViewer" %>

<%@ Register Src="Reporting/UCReportViewerV1.ascx" TagName="UCReportViewer" TagPrefix="uc" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Src="Reporting/UCXtraReportViewerV1.ascx" TagName="UCXtraReportViewerV1" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery.min.js"></script>
    <script type="text/javascript">

        $(document).keyup(function (e) {
            if (e.keyCode == 27) {
                e.preventDefault();
                ASPxButton_Back.DoClick();
            }
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table align="center" width="100%">
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxButton ID="ASPxButton_Back" runat="server" Text="العوده" Font-Bold="True" Width="100%" ClientInstanceName="ASPxButton_Back" EnableClientSideAPI="True">
                        <Image Url="~/Images/Back_32x32.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td align="center" style="width: 16%;"></td>
                <td align="center" style="width: 16%;"></td>
                <td align="center" style="width: 16%;"></td>
                <td align="center" style="width: 16%;"></td>
                <td align="center" style="width: 16%;"></td>
                <td align="center" style="width: 4%;"></td>
            </tr>
        </table>
        <uc1:UCXtraReportViewerV1 ID="UCXtraReportViewerV11" runat="server" />
    </form>
</body>
</html>
