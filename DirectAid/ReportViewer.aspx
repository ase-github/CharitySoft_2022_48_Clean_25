<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ReportViewer.aspx.vb"
    Inherits="DirectAid.ReportViewer" %>

<%@ Register Src="Reporting/UCReportViewerV1.ascx" TagName="UCReportViewer" TagPrefix="uc" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="Scripts/jquery.min.js"></script>
    <script type="text/javascript">

        //window.onload = PrintWindow();

        //function PrintWindow() {
        //    if (navigator.appName == "Microsoft Internet Explorer") {
        //        var PrintCommand = '< O B J E C T ID="PrintCommandObject" WIDTH=0 HEIGHT=0 ';
        //        PrintCommand += 'CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></O B J E C T>';
        //        document.body.insertAdjacentHTML('beforeEnd', PrintCommand);
        //        PrintCommandObject.ExecWB(6, -1); PrintCommandObject.outerHTML = "";
        //    }
        //    else { window.print(); }
        //}

        $(document).keyup(function (e) {
            if (e.keyCode == 27) {
                e.preventDefault();
                ASPxButton_Back.DoClick();
            }
        });

        function setIframeHeight(iframeId) /** IMPORTANT: All framed documents *must* have a DOCTYPE applied **/ {
            
            var ifRef = document.getElementById(iframeId);
            var ifDoc = null;
            
            try {
                ifDoc = ifRef.contentWindow.document.documentElement;
            }
            catch (e) {
                try {
                    alert(e);
                    ifDoc = ifRef.contentDocument.documentElement;
                }
                catch (ee) {
                }
            }

            if (ifDoc)
            {
                ifRef.height = 1;
                ifRef.height = ifDoc.scrollHeight;

                /* For width resize, enable below.  */

                 ifRef.width = 1;
                 ifRef.width = ifDoc.scrollWidth; 
            }
        }

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
        <uc:UCReportViewer ID="_UCReportViewer" runat="server" />
        <%--<iframe id="iframe_Main" src="ReportViewerIFrame.aspx" width="100%" onload = "setIframeHeight(this.id);"></iframe>--%>
    </form>
</body>
</html>
