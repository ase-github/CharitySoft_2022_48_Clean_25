<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIProjectAllocationSearch.aspx.vb"
    Inherits="DirectAid.UIProjectAllocationSearch" MasterPageFile="~/Site.Master" %>

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
                            <asp:Label ID="Label6" runat="server" Text="الجنسية" Width="100%"></asp:Label>
                        </td>
                        <td style="width: 15%;" align="center">
                            <asp:Label ID="Label8" runat="server" Text="طريقة السداد" Width="100%"></asp:Label>
                        </td>
                        <td style="width: 15%;" align="center">
                            <asp:Label ID="Label10" runat="server" Text="البنك" Width="100%"></asp:Label>
                        </td>
                        <td style="width: 15%;" align="center">
                            <asp:Label ID="Label9" runat="server" Text="المجموعة" Width="100%"></asp:Label>
                        </td>
                        <td style="width: 10%;" align="center">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 15%;" valign="top">
                            <dx:ASPxComboBox ID="donation_type" runat="server" SelectedIndex="0" ValueType="System.Int16" Width="100%" AutoPostBack="True">
                                <Items>
                                    <dx:ListEditItem Text="متبرع" Value="1" Selected="True" />
                                    <dx:ListEditItem Text="واقف + مساهمات وقفيه" Value="2" />
                                </Items>
                            </dx:ASPxComboBox>
                        </td>
                        <td align="center" style="width: 15%;" valign="top">
                            <dx:ASPxCheckBoxList ID="donor_gender" runat="server" Height="100%" ValueType="System.Int32"
                                Width="100%">
                                <Items>
                                    <dx:ListEditItem Text="ذكر" Value="0" />
                                    <dx:ListEditItem Text="انثى" Value="1" />
                                </Items>
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="width: 15%;" valign="top">
                            <dx:ASPxCheckBoxList ID="nat_group" runat="server" Height="100%" ValueType="System.Byte"
                                Width="100%" DataSourceID="SqlDataSource_nat_group" TextField="nat_group_namear"
                                ValueField="nat_group_id">
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="width: 15%;" valign="top">
                            <dx:ASPxCheckBoxList ID="pay_method_id" runat="server" Height="100%" ValueType="System.Byte"
                                Width="100%" DataSourceID="SqlDataSource_pay_methods" TextField="pay_method_ar"
                                ValueField="pay_method_id">
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="width: 15%;" valign="top">
                            <dx:ASPxCheckBoxList ID="bank_code" runat="server" Height="100%" ValueType="System.Int16"
                                Width="100%" DataSourceID="SqlDataSource_banks_list" TextField="bank_ar_name"
                                ValueField="bank_code">
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="width: 15%;" valign="top">
                            <dx:ASPxCheckBoxList ID="ASPxCheckBoxList6" runat="server" Height="100%" ValueType="System.Int32"
                                Width="100%">
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="width: 10%;" valign="top">
                            <dx:ASPxCheckBox ID="partial" runat="server" CheckState="Unchecked" 
                                Text="سداد جزئى">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <table width="100%">
                                <tr>
                                    <td style="width: 10%;" align="center">
                                        <asp:Label ID="lbl_late0" runat="server" Text="قيمة الاستقطاع من" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <dx:ASPxTextBox ID="txtCost" runat="server" meta:resourceKey="txtCostResource1" Width="100%">
                                            <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                            <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="width: 5%;" align="center">
                                        <asp:Label ID="Label33" runat="server" Text="إلى" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <dx:ASPxTextBox ID="txtCost0" runat="server" meta:resourceKey="txtCostResource1"
                                            Width="100%">
                                            <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                            <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <asp:Label ID="Label36" runat="server" Text="اجمالي التبرع" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <dx:ASPxComboBox ID="cboClass" runat="server" ValueType="System.Int16" Width="100%">
                                            <Items>
                                                <dx:ListEditItem Text="اكبر من" Value="1" Selected="true" />
                                                <dx:ListEditItem Text="اقل من" Value="2" />
                                                <dx:ListEditItem Text="يساوى" Value="3" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <dx:ASPxTextBox ID="txtCost1" runat="server" meta:resourceKey="txtCostResource1"
                                            Width="100%">
                                            <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                            <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <asp:Label ID="Label37" runat="server" Text="تاريخ التبرع من" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <dx:ASPxDateEdit ID="deApproveDate" runat="server" DisplayFormatString="yyyy-MM-dd"
                                            EditFormat="Custom" EditFormatString="yyyy-MM-dd" meta:resourceKey="deApproveDateResource1"
                                            Width="100%">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td style="width: 5%;" align="center">
                                        <asp:Label ID="Label38" runat="server" Text="إلى" Width="100%"></asp:Label>
                                    </td>
                                    <td style="width: 10%;" align="center">
                                        <dx:ASPxDateEdit ID="deApproveDate0" runat="server" DisplayFormatString="yyyy-MM-dd"
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
    </dx:ASPxRoundPanel>
    <dx:ASPxRoundPanel ID="ASPxRoundPanel6" runat="server" Width="100%" HeaderText="بيانات المشروعات">
        <PanelCollection>
            <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                <table width="100%">
                    <tr>
                        <td align="center" style="width: 15%;">
                            <asp:Label ID="Label26" runat="server" Width="100%">تصنيف المشروع</asp:Label>
                        </td>
                        <td align="center" style="width: 15%;">
                            <asp:Label ID="Label11" runat="server" Text="نوع المشروع" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 55%;">
                            <asp:Label ID="Label15" runat="server" Text="الدوله" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 15%;">
                            <asp:Label ID="lbl_late" runat="server" Text="قيمة المشروع" Width="100%"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 15%;" valign="top">
                            <dx:ASPxCheckBoxList ID="dimension5" runat="server"
                                Width="100%">
                                <Items>
                                    <dx:ListEditItem Text="مشاريع مياه" Value="4" />
                                    <dx:ListEditItem Text="مشاريع تنمويه" Value="5" />
                                    <dx:ListEditItem Text="مشاريع انشائيه" Value="6" />
                                </Items>
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="width: 15%;" valign="top">
                            <dx:ASPxCheckBoxList ID="donation_cat" runat="server" ValueType="System.Int16"
                                Width="100%" DataSourceID="SqlDataSource_ProjectType" TextField="donation_descrar"
                                ValueField="donation_code">
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="width: 55%;" valign="top">
                            <dx:ASPxCheckBoxList ID="country_code" runat="server" ValueType="System.Int32"
                                Width="100%" DataSourceID="SqlDataSource_Country" TextField="nat_descrar" 
                                ValueField="nat_code" RepeatColumns="4">
                            </dx:ASPxCheckBoxList>
                        </td>
                        <td align="center" style="width: 15%;" valign="top">
                            <table align="center" width="100%">
                                <tr>
                                    <td align="center" style="width: 100%;">
                                        <dx:ASPxComboBox ID="cboClass0" runat="server" SelectedIndex="0" ValueType="System.Int16" Width="100%">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="اكبر من" Value="1" />
                                                <dx:ListEditItem Text="اقل من" Value="2" />
                                                <dx:ListEditItem Text="يساوى" Value="3" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 100%;">
                                        <dx:ASPxTextBox ID="txtCost2" runat="server" meta:resourceKey="txtCostResource1" Width="100%">
                                            <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                            <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 100%;">&nbsp; </td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 100%;">
                                        &nbsp; </td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 100%;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 100%;">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 100%;">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    <table width="100%">
        <tr>
            <td style="width: 20%;" align="center">
                <dx:ASPxButton ID="ASPxButton_Allocate" runat="server" Text="تخصيص أوقاف" 
                    Width="100%">
                </dx:ASPxButton>
            </td>
            <td style="width: 20%;" align="center">
                &nbsp;</td>
            <td style="width: 20%;" align="center">
                <dx:ASPxButton ID="ASPxButton_Allocate_Projects" runat="server" Text="تخصيص مشاريع لمتبرعين" 
                    Width="100%">
                </dx:ASPxButton>
            </td>
            <td style="width: 20%;" align="center">
                &nbsp;</td>
            <td style="width: 20%;" align="center">
                <dx:ASPxButton ID="ASPxButton_Search" runat="server" Text="بحــــــــــث" 
                    Width="100%">
                </dx:ASPxButton>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource_ProjectType" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT [donation_code], [donation_cat], [donation_descrar], [donation_descreng], [dimension5] FROM dbo.donations WHERE (donation_code IN (SELECT DISTINCT donation_code FROM dbo.dont_dist)) AND (([donation_cat] = @donation_cat) OR ([donation_cat] = @donation_cat_3))">
        <SelectParameters>
            <asp:Parameter Name="donation_cat" Type="Byte" DefaultValue="1"/>
            <asp:Parameter Name="donation_cat_3" Type="Byte" DefaultValue="3"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_Country" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT nat_code ,
        nat_descrar  FROM [nat_tab]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_banks_list" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [banks_list]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_nat_group" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [nat_group]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_pay_methods" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [pay_methods]">
    </asp:SqlDataSource>
    </asp:Content>
