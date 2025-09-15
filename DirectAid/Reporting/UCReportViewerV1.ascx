<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCReportViewerV1.ascx.vb"
    Inherits="DirectAid.UCReportViewerV1" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
<asp:Panel runat="server" ID="Panel1">
    <table align="center" width="100%">
        <tr>
            <td align="center" style="width: 16%;">

                <dx:ASPxButton ID="ASPxButton_Print" runat="server" Text="طباعة مباشرة" Font-Bold="True" Width="100%" Visible="False">
                    <Image Url="~/Images/Print_32x32.png">
                    </Image>
                </dx:ASPxButton>

            </td>
            <td align="center" style="width: 16%;">&nbsp;</td>
            <td align="center" style="width: 16%;">

                <dx:ASPxButton ID="ASPxButton_PDF" runat="server" Text="PDF" Font-Bold="True" Width="100%">
                    <Image Url="~/Images/ExportToPDF_32x32.png">
                    </Image>
                </dx:ASPxButton>

            </td>
            <td align="center" style="width: 16%;"></td>
            <td align="center" style="width: 16%;"></td>
            <td align="center" style="width: 16%;">&nbsp;</td>
            <td align="center" style="width: 4%;"></td>
        </tr>
    </table>
</asp:Panel>
<CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
    <Report FileName=".\Reports\Collection_Receipt.rpt">
    </Report>
</CR:CrystalReportSource>

<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
    Width="881px" ToolPanelView="None" ReportSourceID="CrystalReportSource1" Height="50px" PrintMode="ActiveX" />
