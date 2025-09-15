<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="dash_details_qry.aspx.vb" Inherits="DirectAid.dash_details_qry" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="75%" align="center">
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="نوع التقرير" Width="100%" 
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" TextField="NameAr" ValueField="ID"
                    Width="100%" ID="ASPxComboBox_ReportType" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="تبرعات حسب الدول" Value="dash_collect1" 
                            Selected="True" />
                        <dx:ListEditItem Text="حسب نوع التبرع" Value="dash_collect2" />
                        <dx:ListEditItem Text="تبرعات حسب الاشهر ونوع التبرع" Value="dash_collect3" />
                        <dx:ListEditItem Text="تبرعات حسب الاشهر ونوع التبرع والدول" 
                            Value="dash_collect4" />
                        <dx:ListEditItem Text="تبرعات حسب الجنس" Value="dash_collect5" />
                        <dx:ListEditItem Text="تبرعات حسب الافرع" Value="dash_collect6" />
                        <dx:ListEditItem Text="تبرعات حسب الموظف" Value="dash_collect7" />
                        <dx:ListEditItem Text="المتبرعين الجدد" Value="NEW_DONORS_PERIODICAL" />
                        <dx:ListEditItem Text="تقرير حسب انوع التبرعات" Value="Dash_collect8" />
                    </Items>
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 10%;">
                &nbsp;</td>
            <td align="center" style="width: 40%;">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                &nbsp;</td>
            <td align="center" style="width: 40%;">
                &nbsp;</td>
            <td align="center" style="width: 10%;">
                &nbsp;</td>
            <td align="center" style="width: 40%;">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="التاريخ من" Width="100%" 
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="ASPxDateEdit_From" runat="server" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="print">
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="التاريخ الى" Width="100%" 
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="ASPxDateEdit_To" runat="server" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="print">
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="الجنس" Width="100%" 
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" ValueType="System.Byte" TextField="NameAr" ValueField="ID"
                    Width="100%" ID="ASPxComboBox_Gender">
                    <Items>
                        <dx:ListEditItem Text="ذكر" Value="1" />
                        <dx:ListEditItem Text="انثى" Value="2" />
                    </Items>
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="المصدر" Width="100%" 
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" ValueType="System.Byte" TextField="namear" ValueField="id"
                    Width="100%" ID="ASPxComboBox_Source" DataSourceID="EntityDataSource_funding_source">
                    <Items>
                        <dx:ListEditItem Text="الاستقبال" Value="1" />
                        <dx:ListEditItem Text="الاستقطاعات الشهريه" Value="2" />
                        <dx:ListEditItem Text="موقع الهيئه" Value="3" />
                    </Items>
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                &nbsp;<dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="الغرض" Width="100%" 
                    Font-Bold="True">
                </dx:ASPxLabel>
                &nbsp;
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" ValueType="System.Byte" TextField="NameAr" ValueField="ID"
                    Width="100%" ID="ASPxComboBox_Purpose" AutoPostBack="True">
                    <Items>
                        <dx:ListEditItem Text="تبرعات" Value="1" />
                        <dx:ListEditItem Text="وقف" Value="2" />
                        <dx:ListEditItem Text="زكاه" Value="3" />
                    </Items>
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="التبرعات" Width="100%" 
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox ID="ASPxComboBox_Donation" runat="server" CallbackPageSize="5" DataSourceID="SqlDataSource_Donations"
                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                    IncrementalFilteringMode="Contains" TextField="donation_descrar" ValueField="donation_code"
                    ValueType="System.Int16" Width="100%">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="الدوله" Width="100%" 
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox ID="ASPxComboBox_Country" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_nat_tab"
                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                    IncrementalFilteringMode="Contains" TextField="nat_descrar" ValueField="nat_code"
                    ValueType="System.Int16" Width="100%">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 10%;">
                &nbsp;<dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="الفرع" Width="100%" 
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox ID="ASPxComboBox_Branch" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_branch"
                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                    IncrementalFilteringMode="Contains" TextField="branch_descar" ValueField="branch_id"
                    ValueType="System.Byte" Width="100%">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                &nbsp;
            </td>
            <td align="center" style="width: 40%;">
                <%--<dx:ASPxCheckBox ID="void" runat="server" CheckState="Unchecked" Text="ملغى"
                    Width="100%" ValueChecked="2" ValueType="System.Byte" ValueUnchecked="0">
                </dx:ASPxCheckBox>--%>
            </td>
            <td align="center" style="width: 10%;">
                &nbsp;
            </td>
            <td align="center" style="width: 40%;">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                &nbsp;</td>
            <td align="center" style="width: 40%;">
                &nbsp;</td>
            <td align="center" style="width: 10%;">
                &nbsp;</td>
            <td align="center" style="width: 40%;">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                &nbsp;
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxButton ID="ASPxButton_Print" runat="server" Text="طباعة" Width="100%" AutoPostBack="true"
                    ClientInstanceName="ASPxButton_Print" EnableClientSideAPI="True" Font-Bold="True"
                    ValidationGroup="print">
                    <Image Url="~/Images/Print_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 10%;">
                &nbsp;
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxButton ID="ASPxButton_New" runat="server" Text="جديد" Width="100%" UseSubmitBehavior="False"
                    ClientInstanceName="ASPxButton_New" EnableClientSideAPI="True" Font-Bold="True">
                    <Image Url="~/Images/New_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                &nbsp;
            </td>
            <td align="center" style="width: 40%;">
                <asp:EntityDataSource ID="EntityDataSource_funding_source" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="funding_source" EntityTypeFilter="funding_source">
    </asp:EntityDataSource>
                </td>
            <td align="center" style="width: 10%;">
                &nbsp;</td>
            <td align="center" style="width: 40%;">
                <asp:EntityDataSource ID="EntityDataSource_nat_tab" runat="server" ConnectionString="name=charitysoftEntities"
                    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="nat_tab"
                    EntityTypeFilter="nat_tab">
                </asp:EntityDataSource>
                <asp:EntityDataSource ID="EntityDataSource_branch" runat="server" ConnectionString="name=charitysoftEntities"
                    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="branches"
                    EntityTypeFilter="branch">
                </asp:EntityDataSource>
                <asp:SqlDataSource ID="SqlDataSource_Donations" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="SELECT DISTINCT donations.donation_code, donations.donation_cat, donations.donation_descrar, donations.donation_descreng, donations.donation_standard_value FROM donation_categories INNER JOIN donations ON donation_categories.waqf_donation = donations.donation_cat WHERE (donation_categories.donation_cat = @donation_cat)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ASPxComboBox_Purpose" Name="donation_cat" PropertyName="Value"
                            DefaultValue="0" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
