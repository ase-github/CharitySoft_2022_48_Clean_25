<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIYearlyProjectAllocationSearch.aspx.vb"
    Inherits="DirectAid.UIYearlyProjectAllocationSearch" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel5" runat="server" Width="100%" HeaderText="بيانات المتبرعين والواقفين">
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <table width="100%">
                    <tr>
                        <td style="width: 15%;" align="center">
                            <asp:Label ID="Label1" runat="server" Text="النوع" Width="100%"></asp:Label>
                        </td>
                        <td style="width: 15%;" align="center">
                            <asp:Label ID="Label7" runat="server" Text="نوع المتبرع" Width="100%"></asp:Label>
                        </td>
                        <td style="width: 15%;" align="center">
                            <asp:Label ID="Label26" runat="server" Width="100%">تصنيف المشروع</asp:Label>
                        </td>
                        <td style="width: 15%;" align="center">
                            <asp:Label ID="Label11" runat="server" Text="نوع المشروع" Width="100%"></asp:Label>
                        </td>
                        <td style="width: 15%;" align="center">
                            </td>
                        <td style="width: 15%;" align="center">
                            </td>
                        <td style="width: 10%;" align="center">
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="vertical-align: top;">
                            <dx:ASPxComboBox ID="donors_count" runat="server" SelectedIndex="0" ValueType="System.Int16" Width="100%">
                                <Items>
                                    <dx:ListEditItem Selected="True" Text="واقف" Value="1" />
                                    <dx:ListEditItem Text="مساهمات وقفيه" Value="2" />
                                    <dx:ListEditItem Text="الكل" Value="3" />
                                </Items>
                            </dx:ASPxComboBox>
                        </td>
                        <td align="center" style="vertical-align: top;">
                            <dx:ASPxCheckBoxList ID="donor_gender" runat="server" Height="100%" ValueType="System.Int32"
                                Width="100%">
                                <Items>
                                    <dx:ListEditItem Text="ذكر" Value="0" />
                                    <dx:ListEditItem Text="انثى" Value="1" />
                                </Items>
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="vertical-align: top;">
                            <dx:ASPxCheckBoxList ID="dimension5" runat="server"
                                Width="100%">
                                <Items>
                                    <dx:ListEditItem Text="مشاريع مياه" Value="4" />
                                    <dx:ListEditItem Text="مشاريع تنمويه" Value="5" />
                                    <dx:ListEditItem Text="مشاريع انشائيه" Value="6" />
                                </Items>
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="vertical-align: top;">
                            <dx:ASPxCheckBoxList ID="donation_cat" runat="server" ValueType="System.Int16"
                                Width="100%" DataSourceID="SqlDataSource_ProjectType" TextField="donation_descrar"
                                ValueField="donation_code">
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="vertical-align: top;">
                            &nbsp;</td>
                        <td align="center" style="vertical-align: top;">
                            &nbsp;</td>
                        <td align="center" style="vertical-align: top;">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <table width="100%">
                                <tr>
                                    <td style="width: 10%;" align="center">
                                        <asp:Label ID="Label37" runat="server" Text="تاريخ الوقف من" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <dx:ASPxDateEdit ID="create_date_from" runat="server" DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd" meta:resourceKey="deApproveDateResource1" Width="100%">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width: 5%;" align="center">
                                        <asp:Label ID="Label38" runat="server" Text="إلى" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <dx:ASPxDateEdit ID="create_date_to" runat="server" DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd" meta:resourceKey="deApproveDateResource1" Width="100%">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <asp:Label ID="Label36" runat="server" Text="قيمة الوقف" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <dx:ASPxComboBox ID="waqf_amount_operator" runat="server" ValueType="System.Int16" Width="100%">
                                            <Items>
                                                <dx:ListEditItem Text="اكبر من" Value="1" Selected="true" />
                                                <dx:ListEditItem Text="اقل من" Value="2" />
                                                <dx:ListEditItem Text="يساوى" Value="3" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <dx:ASPxTextBox ID="waqf_amount" runat="server" meta:resourceKey="txtCostResource1"
                                            Width="100%">
                                            <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                            <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        &nbsp;</td>
                                    <td style="width: 10%;" align="center">
                                        &nbsp;</td>
                                    <td style="width: 5%;" align="center">
                                        &nbsp;</td>
                                    <td style="width: 10%;" align="center">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <%--<dx:ASPxRoundPanel ID="ASPxRoundPanel6" runat="server" Width="100%" HeaderText="بيانات المشروعات" Visible="false">
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <table width="100%">
                    <tr>
                        <td align="center" style="width: 15%;">
                            &nbsp;</td>
                        <td align="center" style="width: 15%;">
                            &nbsp;</td>
                        <td align="center" style="width: 15%;">
                            <asp:Label ID="Label12" runat="server" Text="المنطقة" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 15%;">
                            <asp:Label ID="Label15" runat="server" Text="الدوله" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 15%;">
                            <asp:Label ID="lbl_late_months" runat="server" Text="المدينة" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 15%;">
                            <asp:Label ID="lbl_late_inst" runat="server" Text="المشروع" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 10%;">
                            <asp:Label ID="lbl_late" runat="server" Text="قيمة المشروع" Width="100%"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 15%;">
                            &nbsp;
                            </td>
                        <td align="center" style="width: 15%;">
                            &nbsp;&nbsp;
                            </td>
                        <td align="center" style="width: 15%;">
                            &nbsp;
                            <dx:ASPxCheckBoxList ID="zone_code" runat="server" ValueType="System.Byte" Width="100%"
                                DataSourceID="SqlDataSource_zone" TextField="zone_namear" ValueField="zone_code">
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="width: 15%;">
                            <dx:ASPxCheckBoxList ID="country_code" runat="server" ValueType="System.Int32" Width="100%"
                                DataSourceID="SqlDataSource_Country" TextField="nat_descrar" ValueField="nat_code">
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="width: 15%;">
                            <dx:ASPxCheckBoxList ID="ASPxCheckBoxList11" runat="server" ValueType="System.Int16"
                                Width="100%" DataSourceID="SqlDataSource_City" TextField="city_name_ar" ValueField="city_id">
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="width: 15%;">
                            <dx:ASPxCheckBoxList ID="ASPxCheckBoxList12" runat="server" ValueType="System.Int32"
                                Width="100%" DataSourceID="SqlDataSource_Project" TextField="project_name_ar"
                                ValueField="project_id">
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="width: 10%;">
                            <table width="100%" align="center">
                                <tr>
                                    <td style="width: 100%;" align="center">
                                        <dx:ASPxComboBox ID="cboClass0" runat="server" SelectedIndex="0" ValueType="System.Int16"
                                            Width="100%">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="اكبر من" Value="1" />
                                                <dx:ListEditItem Text="اقل من" Value="2" />
                                                <dx:ListEditItem Text="يساوى" Value="3" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;" align="center">
                                        <dx:ASPxTextBox ID="txtCost2" runat="server" meta:resourceKey="txtCostResource1"
                                            Width="100%">
                                            <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                            <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;" align="center">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;" align="center">
                                        <asp:Label ID="Label13" runat="server" Text="تاريخ البداية من" Width="100%"></asp:Label>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;" align="center">
                                        <dx:ASPxDateEdit ID="deApproveDate1" runat="server" DisplayFormatString="yyyy-MM-dd"
                                            EditFormat="Custom" EditFormatString="yyyy-MM-dd" meta:resourceKey="deApproveDateResource1"
                                            Width="100%">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;" align="center">
                                        <asp:Label ID="Label28" runat="server" Text="إلى" Width="100%"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;" align="center">
                                        <dx:ASPxDateEdit ID="deApproveDate2" runat="server" DisplayFormatString="yyyy-MM-dd"
                                            EditFormat="Custom" EditFormatString="yyyy-MM-dd" meta:resourceKey="deApproveDateResource1"
                                            Width="100%">
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>--%>
    <table width="100%">
        <tr>
            <td style="width: 20%;" align="center">
                <dx:ASPxButton ID="ASPxButton_Allocate" runat="server" Text="تخصيص مشاريع لاوقاف حال عليها الحول"
                    Width="100%">
                </dx:ASPxButton>
            </td>
            <td style="width: 20%;" align="center">
                &nbsp;</td>
            <td style="width: 20%;" align="center">
                &nbsp;</td>
            <td style="width: 20%;" align="center">
                &nbsp;</td>
            <td style="width: 20%;" align="center">
                </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource_ProjectType" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_type]">
    </asp:SqlDataSource>
    <%--    <asp:SqlDataSource ID="SqlDataSource_Country" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT nat_code ,
        nat_descrar  FROM [nat_tab]"></asp:SqlDataSource>--%><%--    <asp:SqlDataSource ID="SqlDataSource_City" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [city]">
    </asp:SqlDataSource>--%><%--    <asp:SqlDataSource ID="SqlDataSource_Project" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project]">
    </asp:SqlDataSource>--%><%--    <asp:SqlDataSource ID="SqlDataSource_banks_list" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [banks_list]">
    </asp:SqlDataSource>--%><%--    <asp:SqlDataSource ID="SqlDataSource_nat_group" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [nat_group]">
    </asp:SqlDataSource>--%><%--    <asp:SqlDataSource ID="SqlDataSource_pay_methods" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [pay_methods]">
    </asp:SqlDataSource>--%>
    <asp:SqlDataSource ID="SqlDataSource_project_class" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_class]">
    </asp:SqlDataSource>
    <%--    <asp:SqlDataSource ID="SqlDataSource_zone" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [zone]">
    </asp:SqlDataSource>--%>
</asp:Content>
