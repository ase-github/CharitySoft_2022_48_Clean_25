<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIWaqfDonorProject.aspx.vb"
    Inherits="DirectAid.UIWaqfDonorProject" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>




<%@ Register src="UC_IWaqfDonorProject_Detail.ascx" tagname="UC_IWaqfDonorProject_Detail" tagprefix="uc1" %>
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
                        Width="100%" DataSourceID="SqlDataSource_VIEW_WaqfList" RightToLeft="True" KeyFieldName="waqf_no">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="waqf_no" ReadOnly="false" VisibleIndex="0"
                                Caption="الرقم" Width="10%">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="الاسم" FieldName="waqf_name" VisibleIndex="1"
                                Width="50%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="التصنيف" FieldName="donation_descrar" VisibleIndex="2"
                                Width="20%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="create_date" 
                                VisibleIndex="3" Width="20%">
                                <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd">
                                </PropertiesDateEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataDateColumn>
                        </Columns>
                        <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                        <SettingsPager>
                            <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                            </PageSizeItemSettings>
                        </SettingsPager>
                        <SettingsEditing EditFormColumnCount="1" Mode="EditForm" />
                        <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" 
                            ShowHeaderFilterButton="True" ShowFilterRow="True" />
                        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
                        <Templates>
                            <DetailRow>
                                <uc1:UC_IWaqfDonorProject_Detail ID="UC_IWaqfDonorProject_Detail1" 
                                    runat="server" />
                            </DetailRow>
                        </Templates>
                    </dx:ASPxGridView>
                </td>
            </tr>
        </tbody>
    </table>
    <asp:SqlDataSource ID="SqlDataSource_VIEW_WaqfList" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM VIEW_WaqfList">
    </asp:SqlDataSource>
</asp:Content>
