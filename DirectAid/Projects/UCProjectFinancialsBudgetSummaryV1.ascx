<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectFinancialsBudgetSummaryV1.ascx.vb"
    Inherits="DirectAid.UCProjectFinancialsBudgetSummaryV1" %>



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
                Width="100%" meta:resourcekey="ASPxRoundPanel_Content" RightToLeft="True" Font-Bold="True" HeaderText="ملخص الميزانيه">
                <HeaderStyle HorizontalAlign="Center" />
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True" meta:resourcekey="PanelContentResource2">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [VIEW_Project_Financials_BudgetSummary] WHERE ([project_id] = @project_id)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="project_id" QueryStringField="project_id" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" Width="100%">
                                    <ItemTemplate>
                                        <table align="center" width="100%" border="1" cellpadding="5" cellspacing="5">
                                            <tr>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label251" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="ملخص الميزانيه" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label252" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="المصروفات التاسيسه" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label253" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="المصروفات التشغيليه" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label254" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="المصروفات الاداريه" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label255" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الاجمالى" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    &nbsp;</td>
                                                <td align="center" style="width: 4%;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label231" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="التكلفه المقدره" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label234" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("EstimatedFoundationCosts", "{0:N3}") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label257" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("EstimatedOperationCosts", "{0:N3}") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label235" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("EstimatedAdministrationCosts", "{0:N3}") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label258" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("EstimatedCosts", "{0:N3}") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label256" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="المبالغ المربوطه" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 4%;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label237" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="المصروف الفعلى" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label240" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("ActualFoundationCosts", "{0:N3}") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label260" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("ActualOperationCosts", "{0:N3}") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label241" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("ActualAdministrationCosts", "{0:N3}") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label259" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("ActualCosts", "{0:N3}") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label242" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("AllocatedAmount", "{0:N3}") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 4%;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label243" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الفرق بين الفعلى و المقدر" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label247" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("DiffrenceFoundationCosts", "{0:N3}") %>' Width="100%" BackColor="White"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label261" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("DiffrenceOperationCosts", "{0:N3}") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label248" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("DiffrenceAdministrationCosts", "{0:N3}") %>' Width="100%" BackColor="White"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label262" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("DiffrenceCosts", "{0:N3}") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    &nbsp;</td>
                                                <td align="center" style="width: 4%;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='الايرادات' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("ActualRevenues", "{0:N3}") %>' Width="100%" BackColor="White"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">&nbsp;</td>
                                                <td align="center" style="width: 16%;">&nbsp;</td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الرصيد المالى" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("Balance", "{0:N3}") %>' Width="100%" BackColor="White"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 4%;">&nbsp;</td>
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
