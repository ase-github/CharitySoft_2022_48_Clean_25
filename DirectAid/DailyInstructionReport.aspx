<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DailyInstructionReport.aspx.vb"
    Inherits="DirectAid.DailyInstructionReport" Culture="auto" meta:resourcekey="PageResource1"
    UICulture="auto" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <% If DesignMode Then%>
    <script src="Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
    <% End If%>
    <title></title>
    <link href="Styles/CRUXStyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="Content/jquery.jnotify-alt.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
    <script src="Scripts/jquery.jnotify.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.js" type="text/javascript"></script>
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" width="75%">
        <tr>
            <td class="header-label">
                <asp:Label ID="lblDailyCollectionHead" Text="تقارير الاستقطاع " runat="server" CssClass="header-label"
                    meta:resourcekey="lblDailyCollectionHeadResource1" />
            </td>
        </tr>
    </table>
    <table align="center" width="75%" >
        <tr>
            <td align="center" style="width: 25%;">
                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="نوع التقرير" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxComboBox runat="server" TextField="NameAr" ValueField="ID"
                    Width="100%" ID="ASPxComboBox_ReportType">
                    <Items>
                        <dx:ListEditItem Text="عام" Value="standing_instpay_view" />
                        <dx:ListEditItem Text="الاستقطاع" Value="standing_instructrep" />
                        <dx:ListEditItem Text="متأخر الاستقطاع" Value="standing_instpay_viewlate" />
                        <dx:ListEditItem Text="حسب البنوك" Value="standing_instpay_viewbanks" />
                    </Items>
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 25%;">
                &nbsp;</td>
            <td align="center" style="width: 25%;">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblstartDt" Text="Start Date" Font-Names="Tahoma" Font-Size="8pt"
                    ForeColor="Red" runat="server" CssClass="label" for="txtStartDt" meta:resourcekey="lblstartDtResource1"
                    Width="80px" />
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxDateEdit ID="ASPxDateEdit_From" runat="server" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" 
                        ValidationGroup="print">
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblendDt" Text="End Date" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                    runat="server" CssClass="label" for="txtEndDate" meta:resourcekey="lblendDtResource1" />
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxDateEdit ID="ASPxDateEdit_To" runat="server" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" 
                        ValidationGroup="print">
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblDonationPurposeType" Text="Donation Type" runat="server" CssClass="label"
                    for="ddlNewDonationPurposeType" meta:resourcekey="lblReceiptIDResource1" />
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxComboBox ID="ASPxComboBox_Donation" runat="server" CallbackPageSize="5"
                    DataSourceID="DonationsForInsertSqlDataSource" DropDownRows="5" EnableCallbackMode="True"
                    EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains"
                    TextField="donation_descrar" ValueField="donation_code" ValueType="System.Int16" 
                    Width="100%">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Items>
                        <dx:ListEditItem Text="تبرعات" Value="1" />
                        <dx:ListEditItem Text="وقف" Value="2" />
                        <dx:ListEditItem Text="زكاة" Value="3" />
                    </Items>
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblGendar" runat="server" CssClass="label" for="ddlGender" meta:resourcekey="lblGendarResource1"
                    Text="Gender" Width="100px"></asp:Label>
            </td>
            <td align="center" style="width: 25%;">
                <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdownlist" meta:resourcekey="ddlGenderResource1"
                    Width="100%">
                    <asp:ListItem meta:resourcekey="ListItemResource6" Text="Select Gender Type" Value="0"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource7" Text="Male" Value="1"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListItemResource8" Text="Female" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblArabicName" runat="server" CssClass="label" for="txtArabicName"
                    meta:resourcekey="lblArabicNameResource1" Text="Donor Name Arabic"></asp:Label>
            </td>
            <td align="center" colspan="3">
                <dx:ASPxTextBox ID="ASPxTextBox_donor_name" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblNationality" runat="server" CssClass="label" for="ddlNat" meta:resourcekey="lblNationalityResource1"
                    Text="Country To" Width="100%"></asp:Label>
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxComboBox ID="ASPxComboBox_Country" runat="server" CallbackPageSize="5"
                    DataSourceID="EntityDataSource_nat_tab" DropDownRows="5" EnableCallbackMode="True"
                    EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains"
                    TextField="nat_descrar" ValueField="nat_code" ValueType="System.Int16" 
                    Width="100%">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 25%;">
                    <asp:Label ID="Label6" runat="server" CssClass="label" Font-Names="Tahoma" Font-Size="8pt"
                        for="ddlstandStat" Text="حاله الاستقطاع" meta:resourcekey="lblStatusResource1"
                        Width="100%"></asp:Label>
                </td>
            <td align="center" style="width: 25%;">
                    <asp:DropDownList ID="ddlstandStat" runat="server" CssClass="dropdownlist"
                        Font-Names="Tahoma" Font-Size="8pt" Height="23px" Style="margin-left: 0px" meta:resourcekey="ddlddlstandStatResource1"
                        Width="100%" TabIndex="23" DataSourceID="EntityDataSource_DeductionStatus" DataTextField="NameAr" DataValueField="ID"
                        AppendDataBoundItems="true">
                        <asp:ListItem  Text="اختر حاله الاستقطاع ..." Value="0" Selected="True"></asp:ListItem>
<%--                        <asp:ListItem  Selected="True" Text="انتظار" Value="1"></asp:ListItem>
                        <asp:ListItem  Text="مغلق" Value="2"></asp:ListItem>
                        <asp:ListItem  Text="مغلق" Value="3"></asp:ListItem>
                        <asp:ListItem  Text="نشط" Value="4"></asp:ListItem>
                        <asp:ListItem  Text="الغاء" Value="5"></asp:ListItem>--%>
                    </asp:DropDownList>
                </td>
        </tr>
        
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblBranch" runat="server" CssClass="label" for="ddlBranch" meta:resourcekey="lbllblBranchResource1"
                    Text="Branch" Width="100%"></asp:Label>
            </td>
            <td align="center" style="width: 25%;">
                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="dropdownlist" meta:resourcekey="ddlJobResource1"
                    Width="100%">
                    <asp:ListItem meta:resourcekey="ListBranchResource1" Text="Select Branch" Value="0"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListBranchResource2" Text="Main" Value="1"></asp:ListItem>
                    <asp:ListItem meta:resourcekey="ListBranchResource3" Text="Other" Value="2"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblCampaign" Text="Campaign" runat="server" Width="100%" CssClass="label"
                    for="ddlcampaign" meta:resourcekey="lblCampaignResource1" />
            </td>
            <td align="center" style="width: 25%;">
                <asp:DropDownList ID="ddlcampaign" runat="server" DataSourceID="CampaignSDS" DataTextField="campaign_desceng"
                    DataValueField="campaign_code" AppendDataBoundItems="True" CssClass="dropdownlist"
                    Width="100%" meta:resourcekey="ddlcampaignResource1">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblGroup" runat="server" CssClass="label" for="ddlWaqfColDonation"
                    meta:resourcekey="lblDonationGroupResource1" Text="Donation Group" />
            </td>
            <td align="center" style="width: 25%;">
                <asp:DropDownList ID="ddlDontationGroup" runat="server" CssClass="dropdownlist" Width="100%"
                    DataSourceID="DonationsGroupSDS" DataTextField="group_desc_eng" DataValueField="group_id"
                    meta:resourcekey="ddlDontationGroupResource1">
                </asp:DropDownList>
            </td>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblCurrency" Text="Currency" runat="server" CssClass="label" for="ddlCurrency"
                    meta:resourcekey="lblCurrencyResource1" Width="100%" />
            </td>
            <td align="center" style="width: 25%;">
                <asp:DropDownList ID="ddlCurrency" runat="server" DataSourceID="CurrencySDS" DataTextField="currency_desceng"
                    DataValueField="currency_code" Width="100%" AppendDataBoundItems="True" meta:resourcekey="ddlCurrencyResource1"
                    CssClass="dropdownlist" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                &nbsp;</td>
            <td align="center" style="width: 25%;">
                &nbsp;</td>
            <td align="center" style="width: 25%;">
                &nbsp;
            </td>
            <td align="center" style="width: 25%;">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                &nbsp;
            </td>
            <td align="center" style="width: 25%;">
                    <dx:ASPxButton ID="ASPxButton_Print" runat="server" Text="طباعة" 
                    Width="100%"
                        AutoPostBack="true" ClientInstanceName="ASPxButton_Print" EnableClientSideAPI="True"
                        Font-Bold="True" ValidationGroup="print">
                        <Image Url="~/Images/Print_32x32.png">
                        </Image>
                    </dx:ASPxButton>
            </td>
            <td align="center" style="width: 25%;">
                &nbsp;
            </td>
            <td align="center" style="width: 25%;">
                    <dx:ASPxButton ID="ASPxButton_New" runat="server" Text="جديد" Width="100%" UseSubmitBehavior="False"
                        ClientInstanceName="ASPxButton_New" EnableClientSideAPI="True" 
                    Font-Bold="True">
                        <Image Url="~/Images/New_32x32.png">
                        </Image>
                    </dx:ASPxButton>
            </td>
        </tr>
    </table>
                <asp:EntityDataSource ID="EntityDataSource_DeductionStatus" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="DeductionStatus" EntityTypeFilter="DeductionStatu">
    </asp:EntityDataSource>
    <asp:SqlDataSource ID="DonationsForInsertSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="SELECT DISTINCT donations.donation_code, donations.donation_cat, donations.donation_descrar, donations.donation_descreng, donations.donation_standard_value FROM donation_categories INNER JOIN donations ON donation_categories.waqf_donation = donations.donation_cat WHERE (donation_categories.donation_cat = @waqf_donation)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ASPxComboBox_Donation" Name="waqf_donation" 
                PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:EntityDataSource ID="EntityDataSource_nat_tab" runat="server" ConnectionString="name=charitysoftEntities"
        DefaultContainerName="charitysoftEntities" EntitySetName="nat_tab"
        EntityTypeFilter="nat_tab">
    </asp:EntityDataSource>
    <asp:SqlDataSource ID="NatDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DonationsGroupSDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="SELECT * FROM [donations_group]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="CampaignSDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="SELECT * FROM [campaign_tab]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="CurrencySDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="SELECT * FROM [currency_tab]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="PaymentSqlDataSource0" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="SELECT * FROM [pay_methods]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_IS_MEMBER" runat="server" 
        SelectCommand="SELECT ISNULL(IS_MEMBER('recp_supervisor'), 0);" 
        ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"></asp:SqlDataSource>
</asp:Content>
