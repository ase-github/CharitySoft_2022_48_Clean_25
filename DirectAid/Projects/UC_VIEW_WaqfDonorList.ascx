<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UC_VIEW_WaqfDonorList.ascx.vb"
    Inherits="DirectAid.UC_VIEW_WaqfDonorList" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<table width="100%">
    <tbody>
        <tr>
            <td align="center" colspan="7">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView1"
                    Width="100%" DataSourceID="SqlDataSource1" RightToLeft="True" KeyFieldName="donor_id">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="donor_id" ReadOnly="false" VisibleIndex="0"
                            Caption="الرقم" Width="10%">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="الاسم" FieldName="donor_namear" VisibleIndex="1"
                            Width="75%">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="المبلغ" FieldName="waqf_amount" VisibleIndex="2"
                            Width="15%">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True"></SettingsBehavior>
                    <SettingsPager>
                        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <SettingsEditing EditFormColumnCount="1" Mode="EditForm" />
                    <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True"
                        ShowFilterRow="True" />
                    <SettingsEditing EditFormColumnCount="1" Mode="EditForm"></SettingsEditing>
                </dx:ASPxGridView>
            </td>
        </tr>
    </tbody>
</table>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT * FROM [VIEW_WaqfDonorList] WHERE ([waqf_no] = @waqf_no)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="waqf_no" SessionField="waqfNo" 
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
