<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectHeaderV1.ascx.vb"
    Inherits="DirectAid.UCProjectHeaderV1" %>



<%@ Register Namespace="DevExpress.XtraCharts.Web" TagPrefix="Web" %>
<%@ Register Assembly="DevExpress.XtraCharts.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.XtraCharts.v25.1.Web, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>



<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<script type="text/javascript">

</script>

<table width="100%" align="center">
    <tr>
        <td align="center" style="width: 100%">
            <dx:ASPxRoundPanel ID="ASPxRoundPanel_Data" runat="server"
                Width="100%" meta:resourcekey="ASPxRoundPanel_Content" RightToLeft="True" Font-Bold="True" HeaderText="بيانات المشروع">
                <HeaderStyle HorizontalAlign="Center" />
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True" meta:resourcekey="PanelContentResource2">
                        <asp:EntityDataSource ID="EntityDataSource3" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="view_project_list" Where="" Select="it.[project_id], it.[project_name_ar]">
                            <WhereParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id" Type="Int32" />
                            </WhereParameters>
                        </asp:EntityDataSource>
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="EntityDataSource3" Width="100%">
                                    <ItemTemplate>
                                        <table align="center" width="100%" border="1" cellpadding="5" cellspacing="5">
                                            <tr>
                                                <td align="center" style="width:16%;">
                                                    <asp:Label ID="Label227" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='اسم المشروع' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width:16%;">
                                                    <asp:Label ID="Label228" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("project_name_ar") %>' Width="100%" BackColor="White"></asp:Label>
                                                </td>
                                                <td align="center" style="width:16%;">
                                                    <asp:Label ID="Label229" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="رقم المشروع" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width:16%;">
                                                    <asp:Label ID="Label230" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("project_id") %>' Width="100%" BackColor="White"></asp:Label>
                                                </td>
                                                                                                <td align="center" style="width:16%;">
                                                    
                                                </td>
                                                <td align="center" style="width:16%;">
                                                    
                                                </td>
                                                <td align="center" style="width:4%;"></td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    </asp:FormView>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>

        </td>
    </tr>
    </table>
