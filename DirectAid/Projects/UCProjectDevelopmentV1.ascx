<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectDevelopmentV1.ascx.vb"
    Inherits="DirectAid.UCProjectDevelopmentV1" %>
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
        window.open(url, 'Popup', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=600');
    }

    function OpenDetailEx(theType) {
        var url = "UIMasterFreeProjectFinancials.aspx?project_id=" + ASPxClientTextBox.Cast("txtNum").GetValue() + "&TheType=" + theType;
        window.open(url, 'Popup', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=600');
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
    window.onload = function () { SetMaxLength(Goals, 1000); };
    window.onload = function () { SetMaxLength(Results, 1000); };
    window.onload = function () { SetMaxLength(Guarantees, 1000); };

</script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<table align="center" width="100%" cellpadding="3px">
    <tbody>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnNew" runat="server" Text="New" Width="100%" meta:resourcekey="btnNewResource1" Font-Bold="True">
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
            <td align="center" style="width: 16%;"></td>
            <td align="center" style="width: 16%;"></td>
            <td align="center" style="width: 16%;"></td>
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
                    <ReadOnlyStyle BackColor="Silver">
                    </ReadOnlyStyle>
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
                <dx:ASPxLabel ID="ASPxLabel51" runat="server" Text="تاريخ المشروع" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxDateEdit ID="RegisterDate" runat="server" Width="100%" meta:resourcekey="deApproveDateResource1"
                    DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd">
                </dx:ASPxDateEdit>
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
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel30" runat="server" Text="Center" Width="100%" meta:resourcekey="ASPxLabel30Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboCenter" runat="server" ValueType="System.Int16" TextField="center_namear"
                    ValueField="center_code" Width="100%" DataSourceID="SqlDataSource_Center" CallbackPageSize="10"
                    EnableCallbackMode="True" meta:resourcekey="cboCenterResource1" IncrementalFilteringMode="Contains">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel28" runat="server" Text="Governorate" Width="100%" meta:resourcekey="ASPxLabel28Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboGovernorate" runat="server" ValueType="System.Int16" TextField="governrate_name_ar"
                    ValueField="governrate_id" Width="100%" DataSourceID="SqlDataSource_Governorate"
                    CallbackPageSize="10" EnableCallbackMode="True" ClientInstanceName="cboGovernorate"
                    EnableClientSideAPI="True" meta:resourcekey="cboGovernorateResource1" IncrementalFilteringMode="Contains">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel29" runat="server" Text="City" Width="100%" meta:resourcekey="ASPxLabel29Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboCity" runat="server" ValueType="System.Int16" TextField="city_name_ar"
                    ValueField="city_id" Width="100%" DataSourceID="SqlDataSource_City" CallbackPageSize="10"
                    EnableCallbackMode="True" ClientInstanceName="cboCity" EnableClientSideAPI="True"
                    meta:resourcekey="cboCityResource1" IncrementalFilteringMode="Contains">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel31" runat="server" Text="Village" Width="100%" meta:resourcekey="ASPxLabel31Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="txtVillageName" runat="server" Width="100%" MaxLength="100" meta:resourcekey="txtVillageNameResource1">
                </dx:ASPxTextBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel42" runat="server" Text="الموقع الجغرافى" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="geo_coordinates" runat="server" Width="100%" MaxLength="50">
                </dx:ASPxTextBox>
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
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Nature" Width="100%" meta:resourcekey="ASPxLabel10Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboNature" runat="server" ValueType="System.Int16" Width="100%"
                    CallbackPageSize="10" EnableCallbackMode="True" ClientInstanceName="cboNature"
                    EnableClientSideAPI="True">
                    <Items>
                        <dx:ListEditItem Text="غير محدد" Value="0" />
                        <dx:ListEditItem Text="مشروع" Value="1" />
                        <dx:ListEditItem Text="قرض" Value="2" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Benefit Org." Width="100%" meta:resourcekey="ASPxLabel12Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboBenefit" runat="server" ValueType="System.Int32" TextField="org_name_ar"
                    ValueField="org_id" Width="100%" DataSourceID="SqlDataSource_Organization" CallbackPageSize="10"
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
                <dx:ASPxLabel ID="ASPxLabel52" runat="server" Text="عدد الاسر المستفيده" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="BeneficiaryFamilyCount" runat="server" Width="100%">
                    <MaskSettings Mask="&lt;0..99999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel53" runat="server" Text="الجهه المعتمده" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" colspan="3">
                <dx:ASPxTextBox ID="AccreditedBy" runat="server" Width="100%" MaxLength="50">
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
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel54" runat="server" Text="اهداف المشروع" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" colspan="5">
                <dx:ASPxMemo ID="Goals" runat="server" Width="100%" meta:resourcekey="txtSpecsResource1"
                    ClientInstanceName="Goals">
                </dx:ASPxMemo>
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
                <dx:ASPxLabel ID="ASPxLabel17" runat="server" Width="100%" Text="تكلفه المشروع د.ك">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="txtCost" runat="server" Width="100%" meta:resourcekey="txtCostResource1">
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel55" runat="server" Width="100%" Text="المبالغ المربوطه د.ك">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="donation_value0" runat="server" meta:resourcekey="txtCostResource1" ReadOnly="True" Width="100%">
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                    <ReadOnlyStyle BackColor="Silver">
                    </ReadOnlyStyle>
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
                <dx:ASPxLabel ID="ASPxLabel60" runat="server" Text="تاريخ استلام المستفيد" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxDateEdit ID="ReceiveDate" runat="server" Width="100%" meta:resourcekey="deApproveDateResource1"
                    DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd">
                </dx:ASPxDateEdit>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel46" runat="server" Text="تاريخ الاقراض" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxDateEdit ID="loan_date" runat="server" DisplayFormatString="yyyy-MM-dd"
                    EditFormat="Custom" EditFormatString="yyyy-MM-dd" Width="100%" meta:resourcekey="deStartDateResource1">
                </dx:ASPxDateEdit>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel56" runat="server" Text="العمله" Width="100%">
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
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel48" runat="server" Text="مدة السداد (شهر)" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="loan_pay_period" runat="server" Width="100%">
                    <MaskSettings Mask="&lt;0..99999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel49" runat="server" Text="تاريخ بدء السداد" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxDateEdit ID="loan_pay_start_date" runat="server" DisplayFormatString="yyyy-MM-dd"
                    EditFormat="Custom" EditFormatString="yyyy-MM-dd" Width="100%" meta:resourcekey="deStartDateResource1">
                </dx:ASPxDateEdit>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Fund Source" Width="100%" meta:resourcekey="ASPxLabel11Resource1" Visible="False">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboFundSource" runat="server" ValueType="System.Int32" TextField="namear"
                    ValueField="id" Width="100%" CallbackPageSize="10" EnableCallbackMode="True"
                    meta:resourcekey="cboFundSourceResource1" DataSourceID="SqlDataSource_funding_source" Visible="False">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel57" runat="server" Text="المبلغ المستلم" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="ReceivedAmount" runat="server" Width="100%" meta:resourcekey="txtCostResource1">
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel58" runat="server" Text="المبلغ المسدد" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="PaidAmount" runat="server" meta:resourcekey="txtCostResource1" ReadOnly="True" Width="100%">
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                    <ReadOnlyStyle BackColor="Silver">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel59" runat="server" Text="المبلغ المتبقى" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="RemainingAmount" runat="server" meta:resourcekey="txtCostResource1" ReadOnly="True" Width="100%">
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                    <ReadOnlyStyle BackColor="Silver">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 4%;" align="center">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel26" runat="server" Text="ملاحظات" Width="100%">
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
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="الضمانات" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" colspan="5" rowspan="1">
                <dx:ASPxMemo ID="Guarantees" runat="server" Width="100%" meta:resourcekey="txtSpecsResource1"
                    ClientInstanceName="Guarantees">
                </dx:ASPxMemo>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="النتائج" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" colspan="5" rowspan="1">
                <dx:ASPxMemo ID="Results" runat="server" Width="100%" meta:resourcekey="txtSpecsResource1"
                    ClientInstanceName="Results">
                </dx:ASPxMemo>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="الاضافه بواسطه" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxTextBox ID="insert_userid" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                    <ReadOnlyStyle BackColor="Silver">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="وقت الاضافه" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxTextBox ID="insert_date" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                    <ReadOnlyStyle BackColor="Silver">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 16%;">&nbsp;</td>
            <td align="center" style="width: 16%;">
                <dx:ASPxCheckBox ID="over_plan" runat="server" CheckState="Unchecked" Text="خارج الخطه"
                    Width="100%">
                </dx:ASPxCheckBox>
            </td>
            <td align="center" style="width: 4%;">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="اخر تعديل بواسطه" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxTextBox ID="last_update_userid" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                    <ReadOnlyStyle BackColor="Silver">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="وقت التعديل" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxTextBox ID="last_update_date" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                    <ReadOnlyStyle BackColor="Silver">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 16%;">&nbsp;</td>
            <td align="center" style="width: 16%;">
                <dx:ASPxCheckBox ID="Cancelled" runat="server" CheckState="Unchecked" Text="ملغى"
                    Width="100%">
                </dx:ASPxCheckBox>
            </td>
            <td align="center" style="width: 4%;">&nbsp;</td>
        </tr>
    </tbody>
</table>
<table align="center" width="100%" cellpadding="3px">
    <tbody>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnPhases" runat="server" Text="المصروفات التاسيسيه المتوقعه" Width="100%" AutoPostBack="False"
                    Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetailEx('1');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnRemarks" runat="server" Text="المصروفات التشغيليه المتوقعه" Width="100%" AutoPostBack="False"
                    Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetailEx('2');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnDonors" runat="server" Text="المصروفات الاداريه المتوقعه" Width="100%" AutoPostBack="False"
                    Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetailEx('3');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnLetters" runat="server" Text="الايرادات المتوقعه" Width="100%" AutoPostBack="False"
                    Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetailEx('4');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="ASPxButton_InstallmentTable" runat="server" Text="جدول السداد" Width="100%"
                    AutoPostBack="False" Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIProjectInstallmentTable');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnResponsibles" runat="server" Text="القائمون على المشروع" Width="100%"
                    AutoPostBack="False" Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIMasterFreeProjectResponsible');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 4%;"></td>
        </tr>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="ASPxButton1" runat="server" Text="المصروفات التاسيسيه الفعليه" Width="100%" AutoPostBack="False"
                    Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetailEx('5');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="المصروفات التشغيليه الفعليه" Width="100%" AutoPostBack="False"
                    Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetailEx('6');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="ASPxButton3" runat="server" Text="المصروفات الاداريه الفعليه" Width="100%" AutoPostBack="False"
                    Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetailEx('7');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="ASPxButton4" runat="server" Text="الايرادات الفعليه" Width="100%" AutoPostBack="False"
                    Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetailEx('8');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="ASPxButton_Families" runat="server" Text="الأسر المستفيده" Width="100%"
                    AutoPostBack="False" Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIMasterFreeProjectFamily');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="ASPxButton5" runat="server" Text="ملخص الميزانيه" Width="100%"
                    AutoPostBack="False" Visible="False" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIProjectFinancialsBudgetSummary');
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
    InsertCommandType="StoredProcedure" 
    SelectCommand="SELECT *, (SELECT ISNULL(SUM(Paid), 0) FROM dbo.ProjectInstallmentTable WHERE (ProjectInstallmentTable.project_id = @project_id)) AS PaidAmount, ReceivedAmount - (SELECT ISNULL(SUM(Paid), 0) FROM dbo.ProjectInstallmentTable WHERE (ProjectInstallmentTable.project_id = @project_id)) AS RemainingAmount  FROM project WHERE (project_id = @project_id)"
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
        <asp:Parameter Name="project_class" Type="Int16" DefaultValue="5" />
        <asp:Parameter Name="project_type" Type="Int32" DefaultValue="" />
        <asp:ControlParameter Name="project_state_id" Type="Int32" ControlID="cboState" PropertyName="Value" />
        <asp:ControlParameter Name="project_nature" Type="Int16" ControlID="cboNature" PropertyName="Value" />
        <asp:ControlParameter Name="fund_source" Type="Int16" ControlID="cboFundSource" PropertyName="Value" />
        <asp:ControlParameter Name="project_specs" Type="String" ControlID="txtSpecs" PropertyName="Value" />
        <asp:ControlParameter Name="center_id" Type="Int16" ControlID="cboCenter" PropertyName="Value" />
        <asp:ControlParameter Name="villag_name" Type="String" ControlID="txtVillageName"
            PropertyName="Value" />
        <asp:ControlParameter Name="geo_coordinates" Type="String" ControlID="geo_coordinates"
            PropertyName="Value" />
        <asp:ControlParameter Name="over_plan" Type="Boolean" ControlID="over_plan" PropertyName="Value" />

        <asp:ControlParameter Name="ax_dimension" Type="String" ControlID="ax_dimension" PropertyName="Value" />
        <asp:ControlParameter Name="donation_cat" Type="Int16" ControlID="donation_cat" PropertyName="Value" />
        <asp:ControlParameter Name="nat_code" Type="Int16" ControlID="nat_code" PropertyName="Value" />
        <asp:ControlParameter Name="loan_date" Type="DateTime" ControlID="loan_date" PropertyName="Value" />
        <asp:ControlParameter Name="loan_pay_period" Type="Int16" ControlID="loan_pay_period" PropertyName="Value" />
        <asp:ControlParameter Name="loan_pay_start_date" Type="DateTime" ControlID="loan_pay_start_date" PropertyName="Value" />
        <asp:ControlParameter Name="beneficiary_count" Type="Int16" ControlID="beneficiary_count" PropertyName="Value" />
        <asp:ControlParameter Name="governrate_id" Type="Int16" ControlID="cboGovernorate" PropertyName="Value" />
        <asp:ControlParameter Name="city_id" Type="Int16" ControlID="cboCity" PropertyName="Value" />

        <asp:ControlParameter Name="RegisterDate" Type="DateTime" ControlID="RegisterDate" PropertyName="Value" />
        <asp:ControlParameter Name="Goals" Type="String" ControlID="Goals" PropertyName="Value" />
        <asp:ControlParameter Name="AccreditedBy" Type="String" ControlID="AccreditedBy" PropertyName="Value" />
        <asp:ControlParameter Name="BeneficiaryFamilyCount" Type="Int16" ControlID="BeneficiaryFamilyCount" PropertyName="Value" />
        <asp:ControlParameter Name="currency_code" Type="Int16" ControlID="cboCurrency" PropertyName="Value" />
        <asp:ControlParameter Name="ReceivedAmount" Type="Decimal" ControlID="ReceivedAmount" PropertyName="Value" />

        <asp:ControlParameter Name="ReceiveDate" Type="DateTime" ControlID="ReceiveDate" PropertyName="Value" />
        <asp:ControlParameter Name="Results" Type="String" ControlID="Results" PropertyName="Value" />
        <asp:ControlParameter Name="Guarantees" Type="String" ControlID="Guarantees" PropertyName="Value" />
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
        <asp:Parameter Name="project_class" Type="Int16" DefaultValue="5" />
        <asp:Parameter Name="project_type" Type="Int32" DefaultValue="" />
        <asp:ControlParameter Name="project_state_id" Type="Int32" ControlID="cboState" PropertyName="Value" />
        <asp:ControlParameter Name="project_nature" Type="Int16" ControlID="cboNature" PropertyName="Value" />
        <asp:ControlParameter Name="fund_source" Type="Int16" ControlID="cboFundSource" PropertyName="Value" />
        <asp:ControlParameter Name="project_specs" Type="String" ControlID="txtSpecs" PropertyName="Value" />
        <asp:ControlParameter Name="center_id" Type="Int16" ControlID="cboCenter" PropertyName="Value" />
        <asp:ControlParameter Name="villag_name" Type="String" ControlID="txtVillageName"
            PropertyName="Value" />
        <asp:ControlParameter Name="geo_coordinates" Type="String" ControlID="geo_coordinates"
            PropertyName="Value" />
        <asp:ControlParameter Name="over_plan" Type="Boolean" ControlID="over_plan" PropertyName="Value" />
        <asp:ControlParameter Name="Cancelled" Type="Boolean" ControlID="Cancelled" PropertyName="Value" />
        <asp:ControlParameter Name="ax_dimension" Type="String" ControlID="ax_dimension" PropertyName="Value" />
        <asp:ControlParameter Name="donation_cat" Type="Int16" ControlID="donation_cat" PropertyName="Value" />
        <asp:ControlParameter Name="nat_code" Type="Int16" ControlID="nat_code" PropertyName="Value" />
        <asp:ControlParameter Name="loan_date" Type="DateTime" ControlID="loan_date" PropertyName="Value" />
        <asp:ControlParameter Name="loan_pay_period" Type="Int16" ControlID="loan_pay_period" PropertyName="Value" />
        <asp:ControlParameter Name="loan_pay_start_date" Type="DateTime" ControlID="loan_pay_start_date" PropertyName="Value" />
        <asp:ControlParameter Name="beneficiary_count" Type="Int16" ControlID="beneficiary_count" PropertyName="Value" />
        <asp:ControlParameter Name="governrate_id" Type="Int16" ControlID="cboGovernorate" PropertyName="Value" />
        <asp:ControlParameter Name="city_id" Type="Int16" ControlID="cboCity" PropertyName="Value" />

        <asp:ControlParameter Name="RegisterDate" Type="DateTime" ControlID="RegisterDate" PropertyName="Value" />
        <asp:ControlParameter Name="Goals" Type="String" ControlID="Goals" PropertyName="Value" />
        <asp:ControlParameter Name="AccreditedBy" Type="String" ControlID="AccreditedBy" PropertyName="Value" />
        <asp:ControlParameter Name="BeneficiaryFamilyCount" Type="Int16" ControlID="BeneficiaryFamilyCount" PropertyName="Value" />
        <asp:ControlParameter Name="currency_code" Type="Int16" ControlID="cboCurrency" PropertyName="Value" />
        <asp:ControlParameter Name="ReceivedAmount" Type="Decimal" ControlID="ReceivedAmount" PropertyName="Value" />

                <asp:ControlParameter Name="ReceiveDate" Type="DateTime" ControlID="ReceiveDate" PropertyName="Value" />
        <asp:ControlParameter Name="Results" Type="String" ControlID="Results" PropertyName="Value" />
        <asp:ControlParameter Name="Guarantees" Type="String" ControlID="Guarantees" PropertyName="Value" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_ProjectType" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [donations] WHERE ([dimension5] = 5) AND (donation_cat <> 0)"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_ProjectState" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_state]  WHERE (project_class = 5)  ORDER BY SortOrder"></asp:SqlDataSource>
<%--<asp:SqlDataSource ID="SqlDataSource_RelatedProject" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT project_id, CAST(project_id AS VARCHAR(10)) + ' - ' + project_name_ar AS project_name_ar, CAST(project_id AS VARCHAR(10)) + ' - ' + project_name_en AS project_name_en FROM [project]"></asp:SqlDataSource>--%>
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
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [city] WHERE ( ([nat_city] = @nat_city))">
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
<asp:SqlDataSource ID="SqlDataSource_funding_source" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [funding_source]"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource_Organization" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [request_org] ORDER BY SortOrder"></asp:SqlDataSource>



<asp:SqlDataSource ID="SqlDataSource_Currency" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [currency_tab]"></asp:SqlDataSource>




