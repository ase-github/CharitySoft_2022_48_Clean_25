<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCGenericReportListV1.ascx.vb"
    Inherits="DirectAid.UCGenericReportListV1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<script type="text/javascript">
    function OnUpdateClick() {
        uploader.UploadFile();
    }
</script>
<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource_system_report"
    KeyFieldName="report_id" Width="100%" ClientInstanceName="ASPxGridView1" EnableCallbackAnimation="True">
    <Settings ShowFilterRow="True" />
    <Columns>
        <dx:GridViewDataColumn Caption="التقرير" FieldName="report_file_name" VisibleIndex="3" Width="25%">
            <Settings AutoFilterCondition="Contains" />
            <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <DataItemTemplate>
                <table width="100%" align="center">
                    <tr>
                        <td align="center" style="width: 0%;">
                            <img src="../Images/BO_Report_32x32.png" alt="" /></td>
                        <td align="center" style="width: 100%;">
                            <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" NavigateUrl='<%# String.Format("~/UIGenericReportViewer.aspx?REPORTFILENAME={0}", Eval("report_file_name"))%>' Text='<%# Eval("namear")%>' Target="_blank" Font-Bold="True" Font-Size="Small" Font-Underline="False">
                            </dx:ASPxHyperLink>
                        </td>
                    </tr>
                </table>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <Settings ShowFilterRow="True"></Settings>
    <SettingsText ConfirmDelete="Delete ?" />
</dx:ASPxGridView>
<%--<dx:ASPxDataView runat="server" ID="ASPxDataView1" DataSourceID="EntityDataSource_system_report" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" Width="100%">
    <ItemTemplate>
                        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Height="75px" NavigateUrl='<%# String.Format("~/UIGenericReportViewer.aspx?REPORTFILENAME={0}", Eval("report_file_name"))%>' Text='<%# Eval("namear")%>' ImageHeight="26px" ImageWidth="26px" Target="_blank" Font-Bold="True" Font-Size="Small" Font-Underline="True">
                </dx:ASPxHyperLink>
    </ItemTemplate>
</dx:ASPxDataView>--%>
<asp:EntityDataSource ID="EntityDataSource_system_report" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False"
    EnableInsert="True" EnableUpdate="True" EntitySetName="system_report" AutoGenerateWhereClause="True"
    Where="" EntityTypeFilter="system_report" Select="">
    <WhereParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="system_module_id" QueryStringField="system_module_id" Type="Byte"/>
        <asp:Parameter DefaultValue="4" Name="system_unit_id" Type="Int16"/>
        <asp:Parameter DefaultValue="True" Name="Visible" Type="Boolean"/>
    </WhereParameters>
</asp:EntityDataSource>

