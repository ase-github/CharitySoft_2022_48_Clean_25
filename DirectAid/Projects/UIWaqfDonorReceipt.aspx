<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIWaqfDonorReceipt.aspx.vb"
    Inherits="DirectAid.UIWaqfDonorReceipt" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%  If (DesignMode) Then%>
    <script src="ASPxScriptIntelliSense.js" type="text/javascript"></script>
    <%  End If%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="100%">
        <tbody>
            <tr>
                <td align="center" colspan="7">
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView1"
                        Width="100%" DataSourceID="SqlDataSource_VIEW_WaqfDonorReceipt" RightToLeft="True">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="waqf_no" ReadOnly="false" VisibleIndex="0"
                                Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="اسم المتبرع" FieldName="donor_namear" VisibleIndex="1"
                                Width="55%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="waqf_amount" VisibleIndex="2" Caption="مبلغ الوقف"
                                Width="15%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="رقم الايصال" FieldName="reciept_num" VisibleIndex="3"
                                Width="15%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="مبلغ الايصال" FieldName="amount" VisibleIndex="4"
                                Width="15%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                        <SettingsPager>
                            <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                            </PageSizeItemSettings>
                        </SettingsPager>
                        <SettingsEditing EditFormColumnCount="1" Mode="EditForm" />
                        <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True" />
                        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                    </dx:ASPxGridView>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:SqlDataSource ID="SqlDataSource_VIEW_WaqfDonorReceipt" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [VIEW_WaqfDonorReceipt] WHERE ([waqf_no] = @waqf_no)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="waqf_no" QueryStringField="WaqfNo"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
