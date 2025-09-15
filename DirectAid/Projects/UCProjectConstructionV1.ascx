<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectConstructionV1.ascx.vb"
    Inherits="DirectAid.UCProjectConstructionV1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx1" %>
<%  If (DesignMode) Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<%  End If%>
<script type="text/javascript">

    function OpenDetail(name) {
        var url = name + ".aspx?project_id=" + ASPxClientTextBox.Cast("txtNum").GetValue();
        window.open(url, 'Popup', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600');
    }

    function OpenDetail2(name) {
        var url = name + ".aspx?project_id=" + ASPxClientTextBox.Cast("txtNum").GetValue() + "&DonorID=" + cmbDonors.GetValue();
        window.open(url, 'Popup', 'toolbar=no,location=no,status=no,scrollbars=yes,resizable=yes,width=1000,height=600');
    }

    function SetMaxLength(memo, maxLength) {
        if (!memo)
            return;
        if (typeof (maxLength) != "undefined" && maxLength >= 0) {
            memo.maxLength = maxLength;
            memo.maxLengthTimerToken = window.setInterval(function () {
                var text = memo.GetText();
                if (text && text.length > memo.maxLength)
                    memo.SetText(text.substr(0, memo.maxLength));
            }, 10);
        } else if (memo.maxLengthTimerToken) {
            window.clearInterval(memo.maxLengthTimerToken);
            delete memo.maxLengthTimerToken;
            delete memo.maxLength;
        }
    }

    window.onload = function () { SetMaxLength(txtSpecs, 2000); };

</script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<table align="center" width="100%" cellpadding="3px">
    <tbody>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnNew" runat="server" Text="New" Width="100%" meta:resourcekey="btnNewResource1" Font-Bold="True" PostBackUrl="~/Projects/UIProjectConstruction.aspx">
                    <Image Url="~/Images/New_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnSave" runat="server" Text="Save" Width="100%" meta:resourcekey="btnSaveResource1" Font-Bold="True">
                    <Image Url="~/Images/Save_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnManualProjectAllocation" runat="server" Text="التخصيص" Width="100%" AutoPostBack="False"
                    Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIMasterFreeManualProjectAllocation');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnDonorReport" runat="server" Text="تقرير المتبرع" Width="100%" AutoPostBack="False"
                    Visible="False" Font-Bold="True" ValidationGroup="ReportValidation">
                    <ClientSideEvents Click="function(s, e) {
    var x = cboClass.GetValue(); 
var z = 'ConstructionReport'
if (x == 6) {
    z='ConstructionReport';
} else { 
   z='ProjectsDonorsReports';
}
	OpenDetail2(z);
}" />
                    <Image Url="~/Images/BO_Report_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 20%;">
                <dx:ASPxComboBox ID="cmbDonors" runat="server" ValueType="System.Int32" TextField="donor_namear"
                    ValueField="donor_id" Width="100%" DataSourceID="SqlDataSource_project_donor_receipts"
                    CallbackPageSize="10" EnableCallbackMode="True" meta:resourcekey="cboCurrencyResource1" IncrementalFilteringMode="Contains" ClientInstanceName="cmbDonors">
                    <ClientSideEvents ValueChanged="function(s, e) {
	ASPxLabel_Currency.SetText(s.GetText());
}" />
                    <Columns>
                        <dx:ListBoxColumn FieldName="donor_id" Caption="رقم المتبرع" />
                        <dx:ListBoxColumn FieldName="donor_namear" Caption="اسم المتبرع" />
                    </Columns>
                    <validationsettings setfocusonerror="True" validationgroup="ReportValidation" errordisplaymode="None">
                        <requiredfield isrequired="True" />
                    </validationsettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSource_project_donor_receipts" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT DISTINCT [donor_id], [donor_namear], [project_id] FROM [view_project_donor_receipts] WHERE ([project_id] = @project_id) ORDER BY [donor_namear]">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="project_id" QueryStringField="project_id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnDonorReportWebsite" runat="server" Text="تقرير مساهمي الموقع" Width="100%" AutoPostBack="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
    var x = cboClass.GetValue(); 
var z = 'ConstructionReportWebSite'
if (x == 6) {
    z='ConstructionReportWebSite';
} else { 
   z='ConstructionPageReportWaterWebSite';
}
	OpenDetail2(z);
}" />
                    <Image Url="~/Images/BO_Report_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 4%;"></td>
        </tr>
    </tbody>
</table>
<table width="100%" align="center" cellpadding="3px">
    <tbody>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Number" Width="100%" meta:resourcekey="ASPxLabel1Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="txtNum" runat="server" Width="100%" MaxLength="50" ReadOnly="True"
                    meta:resourcekey="txtNumResource1" ClientInstanceName="txtNum" EnableClientSideAPI="True">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Name (Arabic)" Width="100%" meta:resourcekey="ASPxLabel3Resource1">
                </dx:ASPxLabel>
            </td>
            <td align="center" colspan="3">
                <dx:ASPxTextBox ID="txtNameAR" runat="server" Width="100%" MaxLength="200" meta:resourcekey="txtNameARResource1">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Reference" Width="100%" meta:resourcekey="ASPxLabel2Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="txtRefNum" runat="server" Width="100%" MaxLength="50" meta:resourcekey="txtRefNumResource1">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Name (English)" Width="100%" meta:resourcekey="ASPxLabel4Resource1">
                </dx:ASPxLabel>
            </td>
            <td align="center" colspan="3">
                <dx:ASPxTextBox ID="txtNameEN" runat="server" Width="100%" MaxLength="200" meta:resourcekey="txtNameENResource1">
                </dx:ASPxTextBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Approve Date" Width="100%" meta:resourcekey="ASPxLabel5Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxDateEdit ID="deApproveDate" runat="server" Width="100%" meta:resourcekey="deApproveDateResource1"
                    DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd">
                </dx:ASPxDateEdit>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Start Date" Width="100%" meta:resourcekey="ASPxLabel6Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxDateEdit ID="deStartDate" runat="server" DisplayFormatString="yyyy-MM-dd"
                    EditFormat="Custom" EditFormatString="yyyy-MM-dd" Width="100%" meta:resourcekey="deStartDateResource1">
                </dx:ASPxDateEdit>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Finish Date" Width="100%" meta:resourcekey="ASPxLabel7Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxDateEdit ID="deFinishDate" runat="server" DisplayFormatString="yyyy-MM-dd"
                    EditFormat="Custom" EditFormatString="yyyy-MM-dd" Width="100%" meta:resourcekey="deFinishDateResource1">
                </dx:ASPxDateEdit>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Class" Width="100%" meta:resourcekey="ASPxLabel8Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                    <ContentTemplate>
                        <dx:ASPxComboBox ID="cboClass" runat="server" AutoPostBack="True" CallbackPageSize="10"
                            EnableCallbackMode="True"
                            Width="100%" ClientInstanceName="cboClass">
                            <ClientSideEvents ValueChanged="function(s, e) {
	donation_cat.SetValue(null);
    //cboType.PerformCallback(null);
}" />
                            <Items>
                                <dx:ListEditItem Text="انشائى" Value="6" />
                                <dx:ListEditItem Text="مياه" Value="4" />
                                <%--<dx:ListEditItem Text="تنموى" Value="5" />--%>
                            </Items>
                            <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Type" Width="100%" meta:resourcekey="ASPxLabel9Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="donation_cat" runat="server" CallbackPageSize="10"
                    ClientInstanceName="donation_cat" DataSourceID="SqlDataSource_ProjectType" EnableCallbackMode="True"
                    EnableClientSideAPI="True" TextField="donation_descrar"
                    ValueField="donation_code" ValueType="System.Int16" Width="100%" IncrementalFilteringMode="Contains">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel27" runat="server" Text="Country" Width="100%" meta:resourcekey="ASPxLabel27Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                    <ContentTemplate>
                        <dx:ASPxComboBox ID="nat_code" runat="server" ValueType="System.Int16" TextField="nat_descrar"
                            ValueField="nat_code" Width="100%" DataSourceID="SqlDataSource_Country" CallbackPageSize="10"
                            EnableCallbackMode="True" AutoPostBack="True" ClientInstanceName="nat_code"
                            EnableClientSideAPI="True" meta:resourcekey="cboCountryResource1" IncrementalFilteringMode="Contains">
                            <ClientSideEvents ValueChanged="function(s, e) {
		cboGovernorate.SetValue(null);
}" />
                            <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                <RequiredField ErrorText="" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel50" runat="server" Text="قيمه التبرع المرصود" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="donation_value" runat="server" meta:resourcekey="txtCostResource1" Width="100%">
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel55" runat="server" Text="اجمالى المدفوع" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="allocated_donation_value" runat="server" meta:resourcekey="txtCostResource1" ReadOnly="True" Width="100%">
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel56" runat="server" Text="المتبقى" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="remaining_donation_value" runat="server" meta:resourcekey="txtCostResource1" ReadOnly="True" Width="100%">
                    <MaskSettings Mask="#&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Benefit Org." Width="100%" meta:resourcekey="ASPxLabel12Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboBenefit" runat="server" ValueType="System.Int32" TextField="NameAr"
                    ValueField="ID" Width="100%" DataSourceID="SqlDataSource_BeneficiaryOrg" CallbackPageSize="10"
                    EnableCallbackMode="True" meta:resourcekey="cboBenefitResource1">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel47" runat="server" Text="عدد المستفيدين" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="beneficiary_count" runat="server" Width="100%">
                    <MaskSettings Mask="&lt;0..99999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Request Org." Width="100%" meta:resourcekey="ASPxLabel15Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboRequest" runat="server" ValueType="System.Int32" TextField="org_name_ar"
                    ValueField="org_id" Width="100%" DataSourceID="SqlDataSource_Organization" CallbackPageSize="10"
                    EnableCallbackMode="True" meta:resourcekey="cboRequestResource1">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel52" runat="server" Text="تكلفة البناء" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="ConstructionCost" runat="server" Width="100%" meta:resourcekey="txtCostResource1">
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="Currency" Width="100%" meta:resourcekey="ASPxLabel25Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboCurrency" runat="server" ValueType="System.Int16" TextField="currency_descrar"
                    ValueField="currency_code" Width="100%" DataSourceID="SqlDataSource_Currency"
                    CallbackPageSize="10" EnableCallbackMode="True" meta:resourcekey="cboCurrencyResource1" IncrementalFilteringMode="Contains">
                    <ClientSideEvents ValueChanged="function(s, e) {
	ASPxLabel_Currency.SetText(s.GetText());
}" />
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="التكلفه الاجماليه" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="txtCost" runat="server" Width="100%" meta:resourcekey="txtCostResource1" ReadOnly="True">
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="تكلفه الاثاث" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="txtFurnishCost" runat="server" Width="100%" meta:resourcekey="txtFurnishCostResource1">
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="State" Width="100%" meta:resourcekey="ASPxLabel13Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboState" runat="server" CallbackPageSize="10" DataSourceID="SqlDataSource_ProjectState" EnableCallbackMode="True" meta:resourcekey="cboStateResource1" TextField="project_state_name_ar" ValueField="project_state_id" ValueType="System.Int32" Width="100%">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel37" runat="server" Text="الطريق" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="ASPxComboBox_project_road" runat="server" ValueType="System.Int16"
                    Width="100%" DataSourceID="SqlDataSource_ProjectRoadType" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" TextField="NameAr" ValueField="ID">
                    <Items>
                        <dx:ListEditItem Text="الطريق ممهد" Value="1" />
                        <dx:ListEditItem Text="الطريق غير ممهد" Value="0" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="الماء" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="ASPxComboBox_water_avail" runat="server" ValueType="System.Int16"
                    Width="100%">
                    <Items>
                        <dx:ListEditItem Text="متوفر" Value="1" />
                        <dx:ListEditItem Text="غير متوفر" Value="0" Selected="true" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="مصدر الماء" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="ASPxComboBox_water_source" runat="server" ValueType="System.Int16"
                    Width="100%" DataSourceID="SqlDataSource_ProjectWaterSource" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" TextField="NameAr" ValueField="ID">
                    <Items>
                        <dx:ListEditItem Text="الشبكه العامه" Value="1" />
                        <dx:ListEditItem Text="ابار سطحيه" Value="2" />
                        <dx:ListEditItem Text="ابار جوفيه" Value="3" />
                        <dx:ListEditItem Text="انهار" Value="4" />
                        <dx:ListEditItem Text="سدود" Value="5" />
                        <dx:ListEditItem Text="اخرى" Value="6" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="الكهرباء" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="ASPxComboBox_electricity" runat="server" ValueType="System.Byte"
                    Width="100%">
                    <Items>
                        <dx:ListEditItem Text="متوفره" Value="1" />
                        <dx:ListEditItem Text="غير متوفره" Value="0" Selected="true" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Area" Width="100%" meta:resourcekey="ASPxLabel18Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <table width="100%">
                    <tr>
                        <td align="center" style="width: 50%;">
                            <dx:ASPxTextBox ID="txtArea" runat="server" Width="100%" meta:resourcekey="txtAreaResource1">
                                <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                        <td align="center" style="width: 50%;">
                            <dx:ASPxComboBox ID="ASPxComboBox_Area_Unit" runat="server" ValueType="System.Int16"
                                TextField="name_ar" ValueField="id" Width="100%" DataSourceID="SqlDataSource_unit_of_measure"
                                CallbackPageSize="10" EnableCallbackMode="True">
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="Depth" Width="100%" meta:resourcekey="ASPxLabel23Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <table width="100%">
                    <tr>
                        <td align="center" style="width: 50%;">
                            <dx:ASPxTextBox ID="txtDepth" runat="server" Width="100%" meta:resourcekey="txtDepthResource1">
                                <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                        <td align="center" style="width: 50%;">
                            <dx:ASPxComboBox ID="ASPxComboBox_Depth_Unit" runat="server"
                                ValueType="System.Int16" TextField="name_ar"
                                ValueField="id" Width="100%" DataSourceID="SqlDataSource_unit_of_measure" CallbackPageSize="10"
                                EnableCallbackMode="True">
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Capacity" Width="100%" meta:resourcekey="ASPxLabel19Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <table width="100%">
                    <tr>
                        <td align="center" style="width: 50%;">
                            <dx:ASPxTextBox ID="txtCapacity" runat="server" Width="100%" meta:resourcekey="txtCapacityResource1">
                                <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                        <td align="center" style="width: 50%;">
                            <dx:ASPxComboBox ID="ASPxComboBox_Capacity_Unit" runat="server"
                                ValueType="System.Int16" TextField="name_ar"
                                ValueField="id" Width="100%" DataSourceID="SqlDataSource_unit_of_measure" CallbackPageSize="10"
                                EnableCallbackMode="True">
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel40" runat="server" Text="تاريخ بداية الصيانه" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxDateEdit ID="maintenance_start_date" runat="server" Width="100%" DisplayFormatString="yyyy-MM-dd"
                    EditFormat="Custom" EditFormatString="yyyy-MM-dd">
                </dx:ASPxDateEdit>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel41" runat="server" Text="مدة الصيانة (شهر)" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="maintenance_duration" runat="server" Width="100%">
                    <MaskSettings Mask="&lt;0..99999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel42" runat="server" Text="الموقع الجغرافي / إحداثيات" Width="100%">
                </dx:ASPxLabel>

            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="geo_coordinates" runat="server" Width="100%" MaxLength="50">
                </dx:ASPxTextBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center"></td>
            <td style="width: 16%;" align="center">
                <dx:ASPxCheckBox ID="over_plan" runat="server" CheckState="Unchecked" Text="خارج الخطه"
                    Width="100%">
                </dx:ASPxCheckBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel44" runat="server" Text="سبب الخروج عن الخطه" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="OverPlanReasonID" runat="server" ValueType="System.Int16"
                    Width="100%" DataSourceID="SqlDataSource_ProjectOverPlanReason" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" TextField="NameAr" ValueField="ID">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel51" runat="server" Text="مصدر الكهرباء" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="ElectricitySourceID" runat="server" ValueType="System.Int16"
                    Width="100%" DataSourceID="SqlDataSource_ProjectElectricitySource" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" TextField="NameAr" ValueField="ID">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel45" runat="server" Text="الرقم فى الماليه" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="ax_dimension" runat="server" Width="100%" MaxLength="30">
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Target" Width="100%" meta:resourcekey="ASPxLabel16Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboTarget" runat="server" ValueType="System.Int32" TextField="target_name_ar"
                    ValueField="target_id" Width="100%" DataSourceID="SqlDataSource_ProjectTarget"
                    CallbackPageSize="10" EnableCallbackMode="True" meta:resourcekey="cboTargetResource1">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Related Project" Width="100%"
                    meta:resourcekey="ASPxLabel14Resource1" Visible="False">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboRelated" runat="server" ValueType="System.Int32" ValueField="project_id"
                    Width="100%" CallbackPageSize="10"
                    EnableCallbackMode="True" meta:resourcekey="cboRelatedResource1" TextField="project_name_ar" EnableClientSideAPI="True" Visible="False">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel26" runat="server" Text="مكونات المشروع" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" colspan="5" rowspan="1">
                <dx:ASPxMemo ID="txtSpecs" runat="server" Width="100%" meta:resourcekey="txtSpecsResource1"
                    ClientInstanceName="txtSpecs">
                </dx:ASPxMemo>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center"></td>
            <td style="width: 16%;" align="center"></td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel28" runat="server" Text="Governorate" Width="100%" meta:resourcekey="ASPxLabel28Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <asp:UpdatePanel runat="server" ID="UpdatePanel4">
                    <ContentTemplate>
                        <dx:ASPxComboBox ID="cboGovernorate" runat="server" ValueType="System.Int16" TextField="governrate_name_ar"
                            ValueField="governrate_id" Width="100%" DataSourceID="SqlDataSource_Governorate"
                            CallbackPageSize="10" EnableCallbackMode="True" AutoPostBack="True" ClientInstanceName="cboGovernorate"
                            EnableClientSideAPI="True" meta:resourcekey="cboGovernorateResource1" IncrementalFilteringMode="Contains">
                            <%--<ClientSideEvents ValueChanged="function(s, e) {
    	cboCity.SetValue(null);
}" />--%>
                        </dx:ASPxComboBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel29" runat="server" Text="City" Width="100%" meta:resourcekey="ASPxLabel29Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <asp:UpdatePanel runat="server" ID="UpdatePanel5">
                    <ContentTemplate>
                        <dx:ASPxComboBox ID="cboCity" runat="server" ValueType="System.Int16" TextField="city_name_ar"
                            ValueField="city_id" Width="100%" DataSourceID="SqlDataSource_City" CallbackPageSize="10"
                            EnableCallbackMode="True" ClientInstanceName="cboCity" EnableClientSideAPI="True"
                            meta:resourcekey="cboCityResource1" IncrementalFilteringMode="Contains">
                        </dx:ASPxComboBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel30" runat="server" Text="Center" Width="100%" meta:resourcekey="ASPxLabel30Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboCenter" runat="server" ValueType="System.Int16" TextField="center_namear"
                    ValueField="center_code" Width="100%" DataSourceID="SqlDataSource_Center" CallbackPageSize="10"
                    EnableCallbackMode="True" meta:resourcekey="cboCenterResource1" EnableClientSideAPI="True" IncrementalFilteringMode="Contains">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel31" runat="server" Text="Village" Width="100%" meta:resourcekey="ASPxLabel31Resource1">
                </dx:ASPxLabel>
            </td>
            <td align="center">
                <dx:ASPxTextBox ID="txtVillageName" runat="server" Width="100%" MaxLength="100" meta:resourcekey="txtVillageNameResource1">
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel39" runat="server" Text="المصروف حتى تاريخه" Width="100%">
                </dx:ASPxLabel>

            </td>
            <td style="width: 16%;" align="center">
                <table width="100%">
                    <tr>
                        <td align="center" style="width: 50%;">
                            <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="100%" ReadOnly="true">
                                <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                        <td align="center" style="width: 50%;">
                            <dx:ASPxLabel ID="ASPxLabel_Currency" runat="server" Width="100%" ClientInstanceName="ASPxLabel_Currency" EnableClientSideAPI="True">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="الاضافه بواسطه" Width="100%">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxTextBox ID="insert_userid" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                                            <ReadOnlyStyle BackColor="Silver">
                                            </ReadOnlyStyle>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="وقت الاضافه" Width="100%">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxTextBox ID="insert_date" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                                            <ReadOnlyStyle BackColor="Silver">
                                            </ReadOnlyStyle>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td align="center" style="width: 16%;">&nbsp;</td>
                                    <td align="center" style="width: 16%;">&nbsp;</td>
                                    <td align="center" style="width: 4%;">&nbsp;</td>
                                </tr>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel ID="ASPxLabel53" runat="server" Text="اخر تعديل بواسطه" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxTextBox ID="last_update_userid" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                    <ReadOnlyStyle BackColor="Silver">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel ID="ASPxLabel54" runat="server" Text="وقت التعديل" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxTextBox ID="last_update_date" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                    <ReadOnlyStyle BackColor="Silver">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 16%;">&nbsp;</td>
            <td align="center" style="width: 16%;">&nbsp;</td>
            <td align="center" style="width: 4%;">&nbsp;</td>
        </tr>
    </tbody>
</table>
<table align="center" width="100%" cellpadding="3px">
    <tbody>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnPhases" runat="server" Text="Phases" Width="100%" AutoPostBack="False"
                    Visible="False" meta:resourcekey="btnPhasesResource1" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIMasterFreeProjectPhase');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnRemarks" runat="server" Text="Remarks" Width="100%" AutoPostBack="False"
                    Visible="False" meta:resourcekey="btnRemarksResource1" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIMasterFreeProjectRemark');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnLetters" runat="server" Text="Letters" Width="100%" AutoPostBack="False"
                    Visible="False" meta:resourcekey="btnLettersResource1" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIMasterFreeProjectLetter');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnDonors" runat="server" Text="Donors" Width="100%" AutoPostBack="False"
                    Visible="False" meta:resourcekey="btnDonorsResource1" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIProjectDonorReceipt');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnCosts" runat="server" Text="Expenses" Width="100%" AutoPostBack="False"
                    Visible="False" meta:resourcekey="btnCostsResource1" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIMasterFreeProjectExpense');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnFacility" runat="server" Text="Facility" Width="100%" AutoPostBack="False"
                    Visible="False" meta:resourcekey="btnFacilityResource1" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIMasterFreeProjectFacility');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 4%;"></td>
        </tr>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnRevenue" runat="server" Text="Revenue" Width="100%" AutoPostBack="False"
                    Visible="False" meta:resourcekey="btnRevenueResource1" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIMasterFreeProjectRevenue');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="ASPxButton_RelatedProjects" runat="server" Text="مشاريع مشتركة في الموقع" Width="100%"
                    AutoPostBack="False" Visible="False"  Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIRelatedProjects');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="ASPxButton_ReportsData" runat="server" Text="بيانات تقرير المتبرعين" Width="100%"
                    AutoPostBack="False"  Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIReportsData');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;"></td>
            <td align="center" style="width: 16%;"></td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnResponsibles" runat="server" Text="Responsibles" Width="100%"
                    AutoPostBack="False" Visible="False" meta:resourcekey="btnResponsiblesResource1" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIMasterFreeProjectResponsible');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 4%;"></td>
        </tr>
    </tbody>
</table>
<asp:SqlDataSource ID="SqlDataSource_Project" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    InsertCommand="SP_INSERT_Project" OldValuesParameterFormatString="original_{0}"
    InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" SelectCommand="SP_SELECT_Project"
    UpdateCommand="SP_UPDATE_Project" UpdateCommandType="StoredProcedure">
    <InsertParameters>
        <asp:ControlParameter ControlID="txtNum" Name="project_id" PropertyName="Value" Type="Int32" />
        <asp:ControlParameter ControlID="txtRefNum" Name="refrence_no" PropertyName="Text"
            Type="String" />
        <asp:ControlParameter Name="project_name_ar" Type="String" ControlID="txtNameAR"
            PropertyName="Text" />
        <asp:ControlParameter Name="project_name_en" Type="String" ControlID="txtNameEN"
            PropertyName="Text" />
        <asp:ControlParameter Name="approve_date" Type="DateTime" ControlID="deApproveDate"
            PropertyName="Value" />
        <asp:ControlParameter Name="start_date" Type="DateTime" ControlID="deStartDate" PropertyName="Value" />
        <asp:ControlParameter Name="finish_date" Type="DateTime" ControlID="deFinishDate"
            PropertyName="Value" />
        <asp:ControlParameter Name="project_class" Type="Int16" ControlID="cboClass" PropertyName="Value" />
        <asp:Parameter Name="project_type" Type="Int32" DefaultValue="" />
        <asp:ControlParameter Name="project_state_id" Type="Int32" ControlID="cboState" PropertyName="Value" />

        <asp:ControlParameter Name="related_project_id" Type="Int32" ControlID="cboRelated"
            PropertyName="Value" />

        <asp:ControlParameter Name="request_org_org_id" Type="Int32" ControlID="cboRequest"
            PropertyName="Value" />
        <asp:ControlParameter Name="org_id" Type="Int32" ControlID="cboBenefit" PropertyName="Value" />
        <asp:ControlParameter Name="target_id" Type="Int32" ControlID="cboTarget" PropertyName="Value" />
        <asp:ControlParameter Name="cost" Type="Decimal" ControlID="txtCost" PropertyName="Value" />
        <asp:ControlParameter Name="donation_value" Type="Decimal" ControlID="donation_value" PropertyName="Value" />
        <asp:ControlParameter Name="furnish_cost" Type="Decimal" ControlID="txtFurnishCost"
            PropertyName="Value" />
        <asp:ControlParameter Name="area" Type="Decimal" ControlID="txtArea" PropertyName="Value" />
        <asp:ControlParameter Name="depth" Type="Decimal" ControlID="txtDepth" PropertyName="Value" />
        <asp:ControlParameter Name="capacity" Type="Decimal" ControlID="txtCapacity" PropertyName="Value" />
        <asp:ControlParameter Name="water_avail" Type="Int16" ControlID="ASPxComboBox_water_avail"
            PropertyName="Value" />

        <asp:ControlParameter Name="project_road" Type="Int16" ControlID="ASPxComboBox_project_road"
            PropertyName="Value" />
        <asp:ControlParameter Name="water_source" Type="Int16" ControlID="ASPxComboBox_water_source"
            PropertyName="Value" />
        <asp:ControlParameter Name="electricity" Type="Byte" ControlID="ASPxComboBox_electricity"
            PropertyName="Value" />
        <asp:ControlParameter Name="currency_code" Type="Int16" ControlID="cboCurrency" PropertyName="Value" />
        <asp:ControlParameter Name="project_specs" Type="String" ControlID="txtSpecs" PropertyName="Value" />
        <asp:ControlParameter Name="center_id" Type="Int16" ControlID="cboCenter" PropertyName="Value" />
        <asp:ControlParameter Name="villag_name" Type="String" ControlID="txtVillageName"
            PropertyName="Value" />
        <asp:ControlParameter Name="maintenance_start_date" Type="DateTime" ControlID="maintenance_start_date"
            PropertyName="Value" />
        <asp:ControlParameter Name="maintenance_duration" Type="Int16" ControlID="maintenance_duration"
            PropertyName="Value" />
        <asp:ControlParameter Name="geo_coordinates" Type="String" ControlID="geo_coordinates"
            PropertyName="Value" />

        <asp:ControlParameter Name="over_plan" Type="Boolean" ControlID="over_plan" PropertyName="Value" />
        <asp:ControlParameter Name="OverPlanReasonID" Type="Int16" ControlID="OverPlanReasonID" PropertyName="Value" />
        <asp:ControlParameter Name="area_unit" Type="Int16" ControlID="ASPxComboBox_Area_Unit" PropertyName="Value" />
        <asp:ControlParameter Name="depth_unit" Type="Int16" ControlID="ASPxComboBox_Depth_Unit" PropertyName="Value" />
        <asp:ControlParameter Name="capacity_unit" Type="Int16" ControlID="ASPxComboBox_Capacity_Unit" PropertyName="Value" />
        <asp:ControlParameter Name="ax_dimension" Type="String" ControlID="ax_dimension" PropertyName="Value" />
        <asp:ControlParameter Name="donation_cat" Type="Int16" ControlID="donation_cat" PropertyName="Value" />
        <asp:ControlParameter Name="nat_code" Type="Int16" ControlID="nat_code" PropertyName="Value" />


        <asp:ControlParameter Name="beneficiary_count" Type="Int16" ControlID="beneficiary_count" PropertyName="Value" />

        <asp:ControlParameter Name="governrate_id" Type="Int16" ControlID="cboGovernorate" PropertyName="Value" />
        <asp:ControlParameter Name="city_id" Type="Int16" ControlID="cboCity" PropertyName="Value" />

        <asp:ControlParameter Name="ElectricitySourceID" Type="Int16" ControlID="ElectricitySourceID" PropertyName="Value" />

        <asp:ControlParameter Name="ConstructionCost" Type="Decimal" ControlID="ConstructionCost" PropertyName="Value" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="project_id" QueryStringField="project_id" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="txtNum" Name="project_id" PropertyName="Value" Type="Int32" />
        <asp:ControlParameter ControlID="txtRefNum" Name="refrence_no" PropertyName="Text"
            Type="String" />
        <asp:ControlParameter Name="project_name_ar" Type="String" ControlID="txtNameAR"
            PropertyName="Text" />
        <asp:ControlParameter Name="project_name_en" Type="String" ControlID="txtNameEN"
            PropertyName="Text" />
        <asp:ControlParameter Name="approve_date" Type="DateTime" ControlID="deApproveDate"
            PropertyName="Value" />
        <asp:ControlParameter Name="start_date" Type="DateTime" ControlID="deStartDate" PropertyName="Value" />
        <asp:ControlParameter Name="finish_date" Type="DateTime" ControlID="deFinishDate"
            PropertyName="Value" />
        <asp:ControlParameter Name="project_class" Type="Int16" ControlID="cboClass" PropertyName="Value" />
        <asp:Parameter Name="project_type" Type="Int32" DefaultValue="" />
        <asp:ControlParameter Name="project_state_id" Type="Int32" ControlID="cboState" PropertyName="Value" />

        <asp:ControlParameter Name="related_project_id" Type="Int32" ControlID="cboRelated"
            PropertyName="Value" />

        <asp:ControlParameter Name="request_org_org_id" Type="Int32" ControlID="cboRequest"
            PropertyName="Value" />
        <asp:ControlParameter Name="org_id" Type="Int32" ControlID="cboBenefit" PropertyName="Value" />
        <asp:ControlParameter Name="target_id" Type="Int32" ControlID="cboTarget" PropertyName="Value" />
        <asp:ControlParameter Name="cost" Type="Decimal" ControlID="txtCost" PropertyName="Value" />
                <asp:ControlParameter Name="donation_value" Type="Decimal" ControlID="donation_value" PropertyName="Value" />
        <asp:ControlParameter Name="furnish_cost" Type="Decimal" ControlID="txtFurnishCost"
            PropertyName="Value" />
        <asp:ControlParameter Name="area" Type="Decimal" ControlID="txtArea" PropertyName="Value" />
        <asp:ControlParameter Name="depth" Type="Decimal" ControlID="txtDepth" PropertyName="Value" />
        <asp:ControlParameter Name="capacity" Type="Decimal" ControlID="txtCapacity" PropertyName="Value" />
        <asp:ControlParameter Name="water_avail" Type="Int16" ControlID="ASPxComboBox_water_avail"
            PropertyName="Value" />

        <asp:ControlParameter Name="project_road" Type="Int16" ControlID="ASPxComboBox_project_road"
            PropertyName="Value" />
        <asp:ControlParameter Name="water_source" Type="Int16" ControlID="ASPxComboBox_water_source"
            PropertyName="Value" />
        <asp:ControlParameter Name="electricity" Type="Byte" ControlID="ASPxComboBox_electricity"
            PropertyName="Value" />
        <asp:ControlParameter Name="currency_code" Type="Int16" ControlID="cboCurrency" PropertyName="Value" />
        <asp:ControlParameter Name="project_specs" Type="String" ControlID="txtSpecs" PropertyName="Value" />
        <asp:ControlParameter Name="center_id" Type="Int16" ControlID="cboCenter" PropertyName="Value" />
        <asp:ControlParameter Name="villag_name" Type="String" ControlID="txtVillageName"
            PropertyName="Value" />
        <asp:ControlParameter Name="maintenance_start_date" Type="DateTime" ControlID="maintenance_start_date"
            PropertyName="Value" />
        <asp:ControlParameter Name="maintenance_duration" Type="Int16" ControlID="maintenance_duration"
            PropertyName="Value" />
        <asp:ControlParameter Name="geo_coordinates" Type="String" ControlID="geo_coordinates"
            PropertyName="Value" />

        <asp:ControlParameter Name="over_plan" Type="Boolean" ControlID="over_plan" PropertyName="Value" />
        <asp:ControlParameter Name="OverPlanReasonID" Type="Int16" ControlID="OverPlanReasonID" PropertyName="Value" />
        <asp:ControlParameter Name="area_unit" Type="Int16" ControlID="ASPxComboBox_Area_Unit" PropertyName="Value" />
        <asp:ControlParameter Name="depth_unit" Type="Int16" ControlID="ASPxComboBox_Depth_Unit" PropertyName="Value" />
        <asp:ControlParameter Name="capacity_unit" Type="Int16" ControlID="ASPxComboBox_Capacity_Unit" PropertyName="Value" />
        <asp:ControlParameter Name="ax_dimension" Type="String" ControlID="ax_dimension" PropertyName="Value" />
        <asp:ControlParameter Name="donation_cat" Type="Int16" ControlID="donation_cat" PropertyName="Value" />
        <asp:ControlParameter Name="nat_code" Type="Int16" ControlID="nat_code" PropertyName="Value" />

        <asp:ControlParameter Name="beneficiary_count" Type="Int16" ControlID="beneficiary_count" PropertyName="Value" />

        <asp:ControlParameter Name="governrate_id" Type="Int16" ControlID="cboGovernorate" PropertyName="Value" />
        <asp:ControlParameter Name="city_id" Type="Int16" ControlID="cboCity" PropertyName="Value" />

        <asp:ControlParameter Name="ElectricitySourceID" Type="Int16" ControlID="ElectricitySourceID" PropertyName="Value" />

        <asp:ControlParameter Name="ConstructionCost" Type="Decimal" ControlID="ConstructionCost" PropertyName="Value" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_ProjectType" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [donations] WHERE ([dimension5] = @dimension5) AND (donation_cat <> 0)">
    <SelectParameters>
        <asp:ControlParameter ControlID="cboClass" DefaultValue="0" Name="dimension5"
            PropertyName="Value" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_ProjectState" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_state] WHERE (project_class = 6) ORDER BY SortOrder"></asp:SqlDataSource>
<%--<dx:ListEditItem Text="تنموى" Value="5" />--%>
<asp:SqlDataSource ID="SqlDataSource_Organization" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [request_org] ORDER BY SortOrder"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource_BeneficiaryOrg" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [BeneficiaryOrg] ORDER BY SortOrder"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource_ProjectTarget" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_target] ORDER BY SortOrder"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_Currency" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [currency_tab]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_Country" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT nat_code ,
        nat_descrar ,
        nat_desceng ,
        zone_code FROM [nat_tab]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_Governorate" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [governrate] WHERE ([nat_code] = @nat_code)">
    <SelectParameters>
        <asp:ControlParameter ControlID="nat_code" DefaultValue="0" Name="nat_code" PropertyName="Value" Type="Int16" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_City" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [city] WHERE ([nat_city] = @nat_city)">
    <SelectParameters>
        <asp:ControlParameter ControlID="nat_code" DefaultValue="0" Name="nat_city" PropertyName="Value" Type="Int16" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_Center" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [center_tab] WHERE ([region_code] = @region_code)">
    <SelectParameters>
        <asp:ControlParameter ControlID="nat_code" DefaultValue="0" Name="region_code" PropertyName="Value" Type="Int16" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_GetNextID" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT isnull(max(project_id), 0) + 1 as project_id FROM project"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_PROJECT_CLASS" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_class]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_funding_source" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [funding_source]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_unit_of_measure" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [unit_of_measure]"></asp:SqlDataSource>


<asp:SqlDataSource ID="SqlDataSource_ProjectRoadType" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM ProjectRoadType"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource_ProjectOverPlanReason" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM ProjectOverPlanReason"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource_ProjectElectricitySource" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM ProjectElectricitySource"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource_ProjectWaterSource" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM ProjectWaterSource"></asp:SqlDataSource>
