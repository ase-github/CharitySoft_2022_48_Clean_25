<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DiraidRcpt.aspx.vb" Inherits="DirectAid.DiraidRcpt" %>

<%@ Register assembly="DevExpress.XtraReports.v25.1.Web.WebForms, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1
        {
            height: 649px;
            width: 655px;
        }
    </style>
</head>
<body style="height: 677px; width: 879px">
    <form id="form1" runat="server">
    <div>
    
    </div>
    
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="604px" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="639px">
        <LocalReport ReportPath="Reports\DrRecptWithPay.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="DsF" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="DirectAid.DsFTableAdapters.rcpt_numsprintNTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="rcpt_num" QueryStringField="receipt_num" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="DirectAid.DsDRcptNTableAdapters.rcpt_numsprintTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="rcpt_num" QueryStringField="receipt_num" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
 <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
      OldValuesParameterFormatString="original_{0}"  SelectMethod="GetData" 
        TypeName="DirectAid.DsFinalREcptTableAdapters.rcpt_numsprintTableAdapter" >
       
        <SelectParameters>
            <asp:QueryStringParameter Name="rcpt_num" QueryStringField="receipt_num" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <%--<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="DirectAid.DSDAIDTableAdapters.rcpt_numsprintTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="rcpt_num" QueryStringField="rcpt_num" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>--%>
    <asp:SqlDataSource ID="DsRcpt" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Cn1 %>" SelectCommand="rcpt_numsprintN" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="rcpt_num" QueryStringField="receipt_num" 
                Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    </form>
</body>
</html>
