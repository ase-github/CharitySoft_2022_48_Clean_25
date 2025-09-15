<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIProjectDonorReceipt.aspx.vb"
    Inherits="DirectAid.UIProjectDonorReceipt" MasterPageFile="~/Site.Master" %>

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
                        Width="100%" DataSourceID="SqlDataSource_VIEW_ProjectDonorReceipt" RightToLeft="True">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:N3}" FieldName="amount" ShowInColumn="مبلغ الايصال" ShowInGroupFooterColumn="مبلغ الايصال" SummaryType="Sum" ValueDisplayFormat="{0:N3}" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="project_id" ReadOnly="false" VisibleIndex="0"
                                Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="donor_id" ReadOnly="false" VisibleIndex="0"
                                Visible="true" Caption="رقم المتبرع" Width="15%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <DataItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("../UIDonorProfileView.aspx?DonorID={0}", Eval("donor_id"))%>'
                                        Text='<%# Bind("donor_id")%>' Target="_blank"></asp:HyperLink>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="اسم المتبرع" FieldName="donor_namear" VisibleIndex="1"
                                Width="40%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="رقم الايصال" FieldName="receipt_id" VisibleIndex="2"
                                Width="15%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <DataItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("../Collection.aspx?ReceiptID={0}", Eval("receipt_id"))%>'
                                        Text='<%# Bind("receipt_id")%>' Target="_blank"></asp:HyperLink>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="تاريخ الايصال" FieldName="reciept_date" VisibleIndex="3" Width="15%">
                                <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd"></PropertiesDateEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="amount" VisibleIndex="4" Caption="مبلغ الايصال"
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
                        <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True" ShowFooter="True" />
                        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
                    </dx:ASPxGridView>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:SqlDataSource ID="SqlDataSource_VIEW_ProjectDonorReceipt" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [VIEW_ProjectDonorReceipt] WHERE ([project_id] = @project_id)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
