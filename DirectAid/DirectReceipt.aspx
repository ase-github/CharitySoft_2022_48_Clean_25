<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DirectReceipt.aspx.vb" Inherits="DirectAid.DirectReceipt" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    
    </div>
    <rsweb:ReportViewer ID="rcptVewer1" runat="server" Height="621px" 
        Width="807px" Font-Names="Verdana" Font-Size="8pt" 
        InteractiveDeviceInfos="(Collection)" WaitMessageFont-Names="Verdana" 
        WaitMessageFont-Size="14pt">
        <LocalReport ReportPath="Reports\FinalReceipt.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" 
                    Name="DsFinalREcpt" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="DirectAid.DsReceiptsTableAdapters.rcpt_numsprintTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="rcpt_num" QueryStringField="receipt_num" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="DirectAid.DsREcEiptTableAdapters.rcpt_numsprintTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="rcpt_num" QueryStringField="receipt_num" 
                Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
        TypeName="DirectAid.DsFinalREcptTableAdapters.rcpt_numsprintTableAdapter">
        <SelectParameters>
            <asp:QueryStringParameter Name="rcpt_num" QueryStringField="receipt_num" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    
    <asp:SqlDataSource ID="DSDonation" runat="server" 
        ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString4 %>" 
        SelectCommand="rcpt_numsprint" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="rcpt_num" QueryStringField="rcpt_num" 
                Type="Int32" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
