<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCDonorHeaderV1.ascx.vb"
    Inherits="DirectAid.UCDonorHeaderV1" %>



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
                Width="100%" meta:resourcekey="ASPxRoundPanel_Content" RightToLeft="True" Font-Bold="True" HeaderText="بيانات المتبرع">
                <HeaderStyle HorizontalAlign="Center" />
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True" meta:resourcekey="PanelContentResource2">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [view_donor_quick_profile] WHERE ([donor_id] = @donor_id)">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="donor_id" QueryStringField="DonorID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" Width="100%">
                                    <ItemTemplate>
                                        <table align="center" width="100%" border="1" cellpadding="5" cellspacing="5">
                                            <tr>
                                                <td align="center" style="width:16%;">
                                                    <asp:Label ID="Label227" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("salut_arname") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" colspan="3" style="width:16%;">
                                                    <asp:Label ID="Label228" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("donor_namear") %>' Width="100%" BackColor="White"></asp:Label>
                                                </td>
                                                <td align="center" style="width:16%;">
                                                    <asp:Label ID="Label229" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الرقم" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width:16%;">
                                                    <asp:Label ID="Label230" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("donor_id") %>' Width="100%" BackColor="White"></asp:Label>
                                                </td>
                                                <td align="center" style="width:4%;"></td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label231" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الجنس" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label234" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("gender_name_ar") %>' Width="100%" BackColor="White"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label232" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الجنسيه" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label235" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("nat_descrar") %>' Width="100%" BackColor="White"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label233" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الهاتف" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label236" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("primary_phone") %>' Width="100%" BackColor="White"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 4%;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label237" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="المنطقه" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label240" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("area_codeara") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label238" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="القطعه" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label241" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("block_num") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label239" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الشارع" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label242" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("street_name") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 4%;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label243" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الجاده" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label247" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("gadda_h") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label244" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="المبنى" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label248" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("building_num") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label245" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="رقم الوحده" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label249" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("unit_num") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 4%;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label246" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="باقى العنوان" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" colspan="5">
                                                    <asp:Label ID="Label250" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("address_text") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 4%;">&nbsp;</td>
                                            </tr>
                                                                                        <tr>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="قيمه اخر تبرع" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%; margin-right: 40px;">
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("total_amount") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="تاريخ اخر تبرع" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("reciept_date", "{0:yyyy-MM-dd}") %>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="نوع اخر تبرع" Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 16%;">
                                                    <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("FundingSourceNameAr")%>' Width="100%"></asp:Label>
                                                </td>
                                                <td align="center" style="width: 4%;">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="width: 16%;">&nbsp;</td>
                                                <td align="center" style="width: 16%; margin-right: 40px;">&nbsp;</td>
                                                <td align="center" style="width: 16%;">&nbsp;</td>
                                                <td align="center" style="width: 16%;">&nbsp;</td>
                                                <td align="center" style="width: 16%;">&nbsp;</td>
                                                <td align="center" style="width: 16%;">
                                                    <dx:ASPxButton ID="btPeriodicalReports" runat="server" Font-Bold="True" PostBackUrl='<%# string.Format("~/ApplicationPeriodicalReportsDonor.aspx?DonorID={0}", Eval("donor_id")) %>' Text="التقارير الدورية" BackColor="Gray" Width="100%">                                                     
                                                 </dx:ASPxButton>
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
