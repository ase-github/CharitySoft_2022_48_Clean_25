<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AwqafReport.aspx.vb"
    Inherits="DirectAid.AwqafReport" Culture="auto" meta:resourcekey="PageResource1"
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
    
    <script type="text/javascript">

        function Print_Begin() {
            //ASPxClientPopupControl.Cast("ASPxPopupControl1").SetContentUrl("");
            ASPxButton_Print.SetEnabled(false);
            ASPxLoadingPanel1.Show();
            ASPxCallback_Print.PerformCallback(null);
        }

        function Print_End(e) {

            var result = e.result;

            if (result == "OK") {
                window.open("ReportViewer.aspx?popup=1", "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1000,height=600");
                
                //window.open("ReportViewer.aspx?popup=1", "_blank");
                //ASPxClientPopupControl.Cast("ASPxPopupControl1").SetContentUrl("ReportViewer.aspx?popup=1");
                //ASPxClientPopupControl.Cast("ASPxPopupControl1").Show();
            }
            else {
                alert(result);
            }

            ASPxButton_Print.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

        function Print_Error(e) {
            alert(e.message);
            ASPxButton_Print.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" width="75%">
        <tr>
            <td class="header-label">
                <asp:Label ID="lblDailyCollectionHead" Text="تقرير الأوقاف" runat="server" CssClass="header-label"
                    meta:resourcekey="lblDailyCollectionHeadResource1" />
            </td>
        </tr>
    </table>
    <table align="center" width="75%" >
        <tr>
            <td align="center" style="width: 25%;">
                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 25%;">
                &nbsp;</td>
            <td align="center" style="width: 25%;">
                &nbsp;</td>
            <td align="center" style="width: 25%;">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblstartDt" Text="من تاريخ" Font-Names="Tahoma" Font-Size="8pt"
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
                <asp:Label ID="lblendDt" Text="الى تاريخ" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
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
                <asp:Label ID="lblDonationCat" runat="server" CssClass="label" for="ddlWaqfColDonation"
                    meta:resourcekey="lblDonationCatResource1" Text="نوع التبرع" />
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxComboBox ID="ASPxComboBox_Purpose" runat="server" CallbackPageSize="5" DropDownRows="5" EnableCallbackMode="True"
                    EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains" 
                    Width="100%" AutoPostBack="True">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Items>
                        <dx:ListEditItem Text="أخرى" Value="0" />
                        <dx:ListEditItem Text="صدقة" Value="1" />
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
                <asp:Label ID="lblDonationPurposeType" Text="غرض التبرع" runat="server" CssClass="label"
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
                        <dx:ListEditItem Text="صدقه" Value="1" />
                        <dx:ListEditItem Text="وقف" Value="2" />
                        <dx:ListEditItem Text="زكاة" Value="3" />
                    </Items>
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
            </td>
        </tr>
        
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblNationality" runat="server" CssClass="label" for="ddlNat" meta:resourcekey="lblNationalityResource1"
                    Text="الدولة الى" Width="100%"></asp:Label>
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
                <asp:Label ID="lblGroup2" runat="server" CssClass="label" 
                    Text="رقم المتبرع" Width="100%" />
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxTextBox ID="donor_id" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblpaymethod" runat="server" CssClass="label" for="ddlPaymentMethodNew"
                    meta:resourcekey="lblEmailResource1" Text="طريقة السداد" Width="100%"></asp:Label>
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxComboBox ID="pay_method_id" runat="server" CallbackPageSize="5"
                    DataSourceID="PaymentSqlDataSource0" DropDownRows="5" EnableCallbackMode="True"
                    EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains"
                    TextField="pay_method_ar" ValueField="pay_method_id" ValueType="System.Byte" 
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
                <asp:Label ID="lblArabicName" runat="server" CssClass="label" for="txtArabicName"
                    meta:resourcekey="lblArabicNameResource1" Text="اسم المتبرع"></asp:Label>
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxTextBox ID="ASPxTextBox_donor_name" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblBranch" runat="server" CssClass="label" for="ddlBranch" meta:resourcekey="lbllblBranchResource1"
                    Text="الفرع" Width="100%"></asp:Label>
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxComboBox ID="ASPxComboBox_Branch" runat="server" CallbackPageSize="5"
                    DataSourceID="SqlDataSource_Branch" DropDownRows="5" EnableCallbackMode="True"
                    EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains"
                    TextField="branch_descar" ValueField="branch_id" ValueType="System.Byte" 
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
                <asp:Label ID="lblGendar" runat="server" CssClass="label" for="ddlGender" meta:resourcekey="lblGendarResource1"
                    Text="الجنس" Width="100px"></asp:Label>
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxComboBox runat="server" ValueType="System.Byte" TextField="NameAr" ValueField="ID"
                    Width="100%" ID="applicant_gender">
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
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblGroup" runat="server" CssClass="label" for="ddlWaqfColDonation"
                    meta:resourcekey="lblDonationGroupResource1" Text="قيمة التبرع بالعملة" />
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxTextBox ID="txtAmount" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblCurrency" Text="العملة" runat="server" CssClass="label" for="ddlCurrency"
                    meta:resourcekey="lblCurrencyResource1" Width="100%" />
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxComboBox ID="ASPxComboBox_Currency" runat="server" CallbackPageSize="5"
                    DataSourceID="CurrencySDS" DropDownRows="5" EnableCallbackMode="True"
                    EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains"
                    TextField="currency_descrar" ValueField="currency_code" ValueType="System.Int32" 
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
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblGroup0" runat="server" CssClass="label" 
                    Text="مصدر التحصيل" Width="100%" />
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxComboBox runat="server" ValueType="System.Byte" DataSourceID="EntityDataSource_funding_source" TextField="namear" ValueField="id" Width="100%" ID="recpt_src" ClientInstanceName="recpt_src" EnableClientSideAPI="True">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="Save">
                        <RequiredField IsRequired="True" ErrorText=""></RequiredField>
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblCampaign" Text="قيمة التبرع بالدينار" runat="server" Width="100%" CssClass="label"
                    for="ddlcampaign" meta:resourcekey="lblCampaignResource1" />
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxTextBox ID="txtAmountKD" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                <asp:Label ID="lblGroup1" runat="server" CssClass="label" 
                    Text="البنك" Width="100%" />
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxComboBox runat="server" CallbackPageSize="5" EnableCallbackMode="True" EnableSynchronization="True" IncrementalFilteringMode="Contains" DropDownRows="5" ValueType="System.Int16" DataSourceID="EntityDataSource_Bank" TextField="bank_ar_name" ValueField="bank_code" Width="100%" ClientInstanceName="bank_code" EnableClientSideAPI="True" ID="bank_code">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}"></ClientSideEvents>

                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>

            </td>
            <td align="center" style="width: 25%;">
                &nbsp;</td>
            <td align="center" style="width: 25%;">
                <dx:ASPxCheckBox ID="void" runat="server" CheckState="Unchecked" Text="ملغى"
                    Width="100%" ValueChecked="2" ValueType="System.Byte" ValueUnchecked="0">
                </dx:ASPxCheckBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                &nbsp;
            </td>
            <td align="center" style="width: 25%;">
                <dx:ASPxButton ID="ASPxButton_Print" runat="server" Text="طباعة"
                    Width="100%"
                    AutoPostBack="False" ClientInstanceName="ASPxButton_Print" EnableClientSideAPI="True"
                    Font-Bold="True" ValidationGroup="print">
                    <Image Url="~/Images/Print_32x32.png">
                    </Image>
                    <ClientSideEvents Click="function(s, e) {
	Print_Begin();
}" />
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
                <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
                    Modal="True" Font-Bold="True">
                </dx:ASPxLoadingPanel>
                <asp:EntityDataSource ID="EntityDataSource_funding_source" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="funding_source" EntityTypeFilter="funding_source">
    </asp:EntityDataSource>
                <dx:ASPxCallback ID="ASPxCallback_Print" runat="server"
                    ClientInstanceName="ASPxCallback_Print">
                    <ClientSideEvents CallbackComplete="function(s, e) {
	Print_End(e);
}"
                        CallbackError="function(s, e) {
	Print_Error(e);
}" />
                </dx:ASPxCallback>
    <asp:SqlDataSource ID="DonationsForInsertSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="SELECT DISTINCT donations.donation_code, donations.donation_cat, donations.donation_descrar, donations.donation_descreng, donations.donation_standard_value FROM donation_categories INNER JOIN donations ON donation_categories.donation_cat = donations.donation_cat WHERE (donation_categories.donation_cat = @waqf_donation)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ASPxComboBox_Purpose" Name="waqf_donation" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:EntityDataSource ID="EntityDataSource_nat_tab" runat="server" ConnectionString="name=charitysoftEntities"
        DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="nat_tab"
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
    <asp:SqlDataSource ID="SqlDataSource_Branch" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [branch]"></asp:SqlDataSource>
<asp:EntityDataSource ID="EntityDataSource_Bank" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="banks_list">
</asp:EntityDataSource>
</asp:Content>
