<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProject.ascx.vb"
    Inherits="DirectAid.UCProject" %>
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
            <td align="center" style="width: 16%;">&nbsp;
            </td>
            <td align="center" style="width: 16%;">&nbsp;</td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="btnFind" runat="server" Text="Find" Width="100%" meta:resourcekey="btnFindResource1" Visible="False" Font-Bold="True">
                    <Image Url="~/Images/Find_32x32.png">
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
            <td style="width: 4%;" align="center">&nbsp;
            </td>
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
            <td style="width: 4%;" align="center">&nbsp;
            </td>
        </tr>
        <tr style="display: none;">
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel33" runat="server" Text="Details" Width="100%" Font-Bold="True"
                    meta:resourcekey="ASPxLabel33Resource1">
                </dx:ASPxLabel>
            </td>
            <td align="center" colspan="5">
                <dx:ASPxLabel ID="ASPxLabel35" runat="server" Width="100%" BackColor="Black" Font-Bold="True"
                    Height="1px" meta:resourcekey="ASPxLabel35Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 4%;" align="center">&nbsp;
            </td>
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
            <td style="width: 4%;" align="center">&nbsp;
            </td>
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
                            Width="100%">
                            <ClientSideEvents ValueChanged="function(s, e) {
	donation_cat.SetValue(null);
    //cboType.PerformCallback(null);
}" />
                            <Items>
                                <dx:ListEditItem Text="مياه" Value="4" />
                                <dx:ListEditItem Text="تنموى" Value="5" />
                                <dx:ListEditItem Text="انشائى" Value="6" />
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
                <dx:ASPxLabel ID="ASPxLabel50" runat="server" Text="التبرع المرصود" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                    <ContentTemplate>
                        <dx:ASPxTextBox ID="donation_value" runat="server" meta:resourcekey="txtCostResource1" ReadOnly="True" Width="100%">
                            <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                            <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td style="width: 4%;" align="center">&nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Nature" Width="100%" meta:resourcekey="ASPxLabel10Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <dx:ASPxComboBox ID="cboNature" runat="server" ValueType="System.Int16" Width="100%"
                            CallbackPageSize="10" EnableCallbackMode="True" ClientInstanceName="cboNature"
                            EnableClientSideAPI="True">
                            <Items>
                                <dx:ListEditItem Text="غير محدد" Value="0" />
                                <dx:ListEditItem Text="مشروع" Value="1" />
                                <dx:ListEditItem Text="قرض" Value="2" />
                            </Items>
                        </dx:ASPxComboBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Related Project" Width="100%"
                    meta:resourcekey="ASPxLabel14Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboRelated" runat="server" ValueType="System.Int32" ValueField="project_id"
                    Width="100%" CallbackPageSize="10"
                    EnableCallbackMode="True" meta:resourcekey="cboRelatedResource1" TextField="project_name_ar" EnableClientSideAPI="True">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="State" Width="100%" meta:resourcekey="ASPxLabel13Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                        <dx:ASPxComboBox ID="cboState" runat="server" CallbackPageSize="10" DataSourceID="SqlDataSource_ProjectState" EnableCallbackMode="True" meta:resourcekey="cboStateResource1" TextField="project_state_name_ar" ValueField="project_state_id" ValueType="System.Int32" Width="100%">
                        </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center">&nbsp;
            </td>
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
                <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Request Org." Width="100%" meta:resourcekey="ASPxLabel15Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboRequest" runat="server" ValueType="System.Int32" TextField="org_name_ar"
                    ValueField="org_id" Width="100%" DataSourceID="SqlDataSource_Organization" CallbackPageSize="10"
                    EnableCallbackMode="True" meta:resourcekey="cboRequestResource1">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center">&nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Cost" Width="100%" meta:resourcekey="ASPxLabel17Resource1">
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
                <dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="Currency" Width="100%" meta:resourcekey="ASPxLabel25Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboCurrency" runat="server" ValueType="System.Int16" TextField="currency_descrar"
                    ValueField="currency_code" Width="100%" DataSourceID="SqlDataSource_Currency"
                    CallbackPageSize="10" EnableCallbackMode="True" meta:resourcekey="cboCurrencyResource1">
                    <ClientSideEvents ValueChanged="function(s, e) {
	ASPxLabel_Currency.SetText(s.GetText());
}" />
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel37" runat="server" Text="الطريق" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="ASPxComboBox_project_road" runat="server" ValueType="System.Int16"
                    Width="100%">
                    <Items>
                        <dx:ListEditItem Text="الطريق ممهد" Value="1" />
                        <dx:ListEditItem Text="الطريق غير ممهد" Value="0" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center">&nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="Furnish Cost" Width="100%" meta:resourcekey="ASPxLabel24Resource1">
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
                <dx:ASPxLabel ID="ASPxLabel32" runat="server" Text="Furnish Currency" Width="100%"
                    meta:resourcekey="ASPxLabel32Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboFurnishCurrency" runat="server" ValueType="System.Int16"
                    TextField="currency_descrar" ValueField="currency_code" Width="100%" DataSourceID="SqlDataSource_Currency"
                    CallbackPageSize="10" EnableCallbackMode="True" meta:resourcekey="cboFurnishCurrencyResource1">
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
                        <dx:ListEditItem Text="الكهرباء متوفره" Value="1" />
                        <dx:ListEditItem Text="الكهرباء غير متوفره" Value="0" Selected="true" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center">&nbsp;
            </td>
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
                        <dx:ListEditItem Text="الماء متوفر" Value="1" />
                        <dx:ListEditItem Text="الماء غير متوفر" Value="0" Selected="true" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="مصدر الماء" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="ASPxComboBox_water_source" runat="server" ValueType="System.Int16"
                    Width="100%">
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
            <td style="width: 16%;" align="center">&nbsp;<dx:ASPxLabel ID="ASPxLabel38" runat="server" Text="مضخه ماء" Width="100%">
            </dx:ASPxLabel>
                &nbsp;
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="ASPxComboBox_water_pump" runat="server" ValueType="System.Int16"
                    Width="100%">
                    <Items>
                        <dx:ListEditItem Text="توجد مضخه" Value="1" />
                        <dx:ListEditItem Text="لا توجد مضخه" Value="0" Selected="true" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center">&nbsp;
            </td>
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
            <td style="width: 4%;" align="center">&nbsp;
            </td>
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
                <dx:ASPxLabel ID="ASPxLabel42" runat="server" Text="الموقع الجغرافى" Width="100%">
                </dx:ASPxLabel>
                &nbsp;
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="geo_coordinates" runat="server" Width="100%" MaxLength="50">
                </dx:ASPxTextBox>
            </td>
            <td style="width: 4%;" align="center"></td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel43" runat="server" Text="التكلفه المبدأيه" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="start_cost" runat="server" Width="100%" meta:resourcekey="txtCostResource1">
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel44" runat="server" Text="سبب الخروج عن الخطه" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxTextBox ID="over_reason" runat="server" Width="100%" MaxLength="50">
                </dx:ASPxTextBox>
            </td>
            <td style="width: 16%;" align="center">&nbsp;
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxCheckBox ID="over_plan" runat="server" CheckState="Unchecked" Text="خارج الخطه"
                    Width="100%">
                </dx:ASPxCheckBox>
            </td>
            <td style="width: 4%;" align="center">&nbsp;
            </td>
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
                <dx:ASPxLabel ID="ASPxLabel46" runat="server" Text="تاريخ الاقراض" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxDateEdit ID="loan_date" runat="server" DisplayFormatString="yyyy-MM-dd"
                    EditFormat="Custom" EditFormatString="yyyy-MM-dd" Width="100%" meta:resourcekey="deStartDateResource1">
                </dx:ASPxDateEdit>
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
            <td style="width: 4%;" align="center">&nbsp;</td>
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
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Fund Source" Width="100%" meta:resourcekey="ASPxLabel11Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboFundSource" runat="server" ValueType="System.Int32" TextField="namear"
                    ValueField="id" Width="100%" CallbackPageSize="10" EnableCallbackMode="True"
                    meta:resourcekey="cboFundSourceResource1" DataSourceID="SqlDataSource_funding_source">
                </dx:ASPxComboBox>
            </td>
            <td style="width: 4%;" align="center">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel26" runat="server" Text="Specs" Width="100%" meta:resourcekey="ASPxLabel26Resource1">
                </dx:ASPxLabel>
            </td>
            <td align="center" colspan="5" rowspan="1">
                <dx:ASPxMemo ID="txtSpecs" runat="server" Width="100%" meta:resourcekey="txtSpecsResource1"
                    ClientInstanceName="txtSpecs">
                </dx:ASPxMemo>
            </td>
            <td style="width: 4%;" align="center">&nbsp;
            </td>
        </tr>
        <tr style="display: none;">
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel34" runat="server" Text="Location" Width="100%" Font-Bold="True"
                    meta:resourcekey="ASPxLabel34Resource1">
                </dx:ASPxLabel>
            </td>
            <td align="center" colspan="5">
                <dx:ASPxLabel ID="ASPxLabel36" runat="server" Width="100%" BackColor="Black" Font-Bold="True"
                    Height="1px" meta:resourcekey="ASPxLabel36Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 4%;" align="center">&nbsp;
            </td>
        </tr>
        <tr>
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
                            <ClientSideEvents ValueChanged="function(s, e) {
    	cboCity.SetValue(null);
}" />
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
                            meta:resourcekey="cboCityResource1" AutoPostBack="True">
                        </dx:ASPxComboBox>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td style="width: 4%;" align="center">&nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 16%;" align="center">
                <dx:ASPxLabel ID="ASPxLabel30" runat="server" Text="Center" Width="100%" meta:resourcekey="ASPxLabel30Resource1">
                </dx:ASPxLabel>
            </td>
            <td style="width: 16%;" align="center">
                <dx:ASPxComboBox ID="cboCenter" runat="server" ValueType="System.Int16" TextField="center_name_ar"
                    ValueField="center_id" Width="100%" DataSourceID="SqlDataSource_Center" CallbackPageSize="10"
                    EnableCallbackMode="True" meta:resourcekey="cboCenterResource1">
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
            <td style="width: 16%;" align="center">&nbsp;<dx:ASPxLabel ID="ASPxLabel39" runat="server" Text="المصروف حتى تاريخه" Width="100%">
            </dx:ASPxLabel>
                &nbsp;
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
            <td style="width: 4%;" align="center">&nbsp;
            </td>
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
                <dx:ASPxButton ID="btnResponsibles" runat="server" Text="Responsibles" Width="100%"
                    AutoPostBack="False" Visible="False" meta:resourcekey="btnResponsiblesResource1" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIMasterFreeProjectResponsible');
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
                <dx:ASPxButton ID="btnFacility" runat="server" Text="Facility" Width="100%" AutoPostBack="False"
                    Visible="False" meta:resourcekey="btnFacilityResource1" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	OpenDetail('UIMasterFreeProjectFacility');
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">&nbsp;</td>
            <td align="center" style="width: 16%;">&nbsp;</td>
            <td align="center" style="width: 16%;">&nbsp;</td>
            <td align="center" style="width: 16%;">&nbsp;</td>
            <td align="center" style="width: 4%;">&nbsp;</td>
        </tr>
    </tbody>
</table>
<asp:SqlDataSource ID="SqlDataSource_Project" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    InsertCommand="SP_INSERT_Project" OldValuesParameterFormatString="original_{0}"
    InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM project WHERE (project_id = @project_id)"
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
        <asp:ControlParameter Name="project_nature" Type="Int16" ControlID="cboNature" PropertyName="Value" />
        <asp:ControlParameter Name="related_project_id" Type="Int32" ControlID="cboRelated"
            PropertyName="Value" />
        <asp:ControlParameter Name="fund_source" Type="Int16" ControlID="cboFundSource" PropertyName="Value" />
        <asp:ControlParameter Name="request_org_org_id" Type="Int32" ControlID="cboRequest"
            PropertyName="Value" />
        <asp:ControlParameter Name="org_id" Type="Int32" ControlID="cboBenefit" PropertyName="Value" />
        <asp:ControlParameter Name="target_id" Type="Int32" ControlID="cboTarget" PropertyName="Value" />
        <asp:ControlParameter Name="cost" Type="Decimal" ControlID="txtCost" PropertyName="Value" />
        <asp:ControlParameter Name="furnish_cost" Type="Decimal" ControlID="txtFurnishCost"
            PropertyName="Value" />
        <asp:ControlParameter Name="area" Type="Decimal" ControlID="txtArea" PropertyName="Value" />
        <asp:ControlParameter Name="depth" Type="Decimal" ControlID="txtDepth" PropertyName="Value" />
        <asp:ControlParameter Name="capacity" Type="Decimal" ControlID="txtCapacity" PropertyName="Value" />
        <asp:ControlParameter Name="water_avail" Type="Int16" ControlID="ASPxComboBox_water_avail"
            PropertyName="Value" />
        <asp:ControlParameter Name="water_pumb" Type="Int16" ControlID="ASPxComboBox_water_pump"
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
        <asp:ControlParameter Name="furnish_currency_code" Type="Int16" ControlID="cboCurrency"
            PropertyName="Value" />
        <asp:ControlParameter Name="maintenance_start_date" Type="DateTime" ControlID="maintenance_start_date"
            PropertyName="Value" />
        <asp:ControlParameter Name="maintenance_duration" Type="Int16" ControlID="maintenance_duration"
            PropertyName="Value" />
        <asp:ControlParameter Name="geo_coordinates" Type="String" ControlID="geo_coordinates"
            PropertyName="Value" />
        <asp:ControlParameter Name="start_cost" Type="Decimal" ControlID="start_cost" PropertyName="Value" />
        <asp:ControlParameter Name="over_plan" Type="Boolean" ControlID="over_plan" PropertyName="Value" />
        <asp:ControlParameter Name="over_reason" Type="String" ControlID="over_reason" PropertyName="Value" />
        <asp:ControlParameter Name="area_unit" Type="Int16" ControlID="ASPxComboBox_Area_Unit" PropertyName="Value" />
        <asp:ControlParameter Name="depth_unit" Type="Int16" ControlID="ASPxComboBox_Depth_Unit" PropertyName="Value" />
        <asp:ControlParameter Name="capacity_unit" Type="Int16" ControlID="ASPxComboBox_Capacity_Unit" PropertyName="Value" />
        <asp:ControlParameter Name="ax_dimension" Type="String" ControlID="ax_dimension" PropertyName="Value" />
        <asp:ControlParameter Name="donation_cat" Type="Int16" ControlID="donation_cat" PropertyName="Value" />
        <asp:ControlParameter Name="nat_code" Type="Int16" ControlID="nat_code" PropertyName="Value" />

        <asp:ControlParameter Name="loan_date" Type="DateTime" ControlID="loan_date" PropertyName="Value" />
        <asp:ControlParameter Name="loan_pay_period" Type="Int16" ControlID="loan_pay_period" PropertyName="Value" />
        <asp:ControlParameter Name="loan_pay_start_date" Type="DateTime" ControlID="loan_pay_start_date" PropertyName="Value" />
        <asp:ControlParameter Name="beneficiary_count" Type="Int16" ControlID="beneficiary_count" PropertyName="Value" />

        <asp:ControlParameter Name="governrate_id" Type="Int16" ControlID="cboGovernorate" PropertyName="Value" />
        <asp:ControlParameter Name="city_id" Type="Int16" ControlID="cboCity" PropertyName="Value" />
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
        <asp:ControlParameter Name="project_nature" Type="Int16" ControlID="cboNature" PropertyName="Value" />
        <asp:ControlParameter Name="related_project_id" Type="Int32" ControlID="cboRelated"
            PropertyName="Value" />
        <asp:ControlParameter Name="fund_source" Type="Int16" ControlID="cboFundSource" PropertyName="Value" />
        <asp:ControlParameter Name="request_org_org_id" Type="Int32" ControlID="cboRequest"
            PropertyName="Value" />
        <asp:ControlParameter Name="org_id" Type="Int32" ControlID="cboBenefit" PropertyName="Value" />
        <asp:ControlParameter Name="target_id" Type="Int32" ControlID="cboTarget" PropertyName="Value" />
        <asp:ControlParameter Name="cost" Type="Decimal" ControlID="txtCost" PropertyName="Value" />
        <asp:ControlParameter Name="furnish_cost" Type="Decimal" ControlID="txtFurnishCost"
            PropertyName="Value" />
        <asp:ControlParameter Name="area" Type="Decimal" ControlID="txtArea" PropertyName="Value" />
        <asp:ControlParameter Name="depth" Type="Decimal" ControlID="txtDepth" PropertyName="Value" />
        <asp:ControlParameter Name="capacity" Type="Decimal" ControlID="txtCapacity" PropertyName="Value" />
        <asp:ControlParameter Name="water_avail" Type="Int16" ControlID="ASPxComboBox_water_avail"
            PropertyName="Value" />
        <asp:ControlParameter Name="water_pumb" Type="Int16" ControlID="ASPxComboBox_water_pump"
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
        <asp:ControlParameter Name="furnish_currency_code" Type="Int16" ControlID="cboCurrency"
            PropertyName="Value" />
        <asp:ControlParameter Name="maintenance_start_date" Type="DateTime" ControlID="maintenance_start_date"
            PropertyName="Value" />
        <asp:ControlParameter Name="maintenance_duration" Type="Int16" ControlID="maintenance_duration"
            PropertyName="Value" />
        <asp:ControlParameter Name="geo_coordinates" Type="String" ControlID="geo_coordinates"
            PropertyName="Value" />
        <asp:ControlParameter Name="start_cost" Type="Decimal" ControlID="start_cost" PropertyName="Value" />
        <asp:ControlParameter Name="over_plan" Type="Boolean" ControlID="over_plan" PropertyName="Value" />
        <asp:ControlParameter Name="over_reason" Type="String" ControlID="over_reason" PropertyName="Value" />
        <asp:ControlParameter Name="area_unit" Type="Int16" ControlID="ASPxComboBox_Area_Unit" PropertyName="Value" />
        <asp:ControlParameter Name="depth_unit" Type="Int16" ControlID="ASPxComboBox_Depth_Unit" PropertyName="Value" />
        <asp:ControlParameter Name="capacity_unit" Type="Int16" ControlID="ASPxComboBox_Capacity_Unit" PropertyName="Value" />
        <asp:ControlParameter Name="ax_dimension" Type="String" ControlID="ax_dimension" PropertyName="Value" />
        <asp:ControlParameter Name="donation_cat" Type="Int16" ControlID="donation_cat" PropertyName="Value" />
        <asp:ControlParameter Name="nat_code" Type="Int16" ControlID="nat_code" PropertyName="Value" />

        <asp:ControlParameter Name="loan_date" Type="DateTime" ControlID="loan_date" PropertyName="Value" />
        <asp:ControlParameter Name="loan_pay_period" Type="Int16" ControlID="loan_pay_period" PropertyName="Value" />
        <asp:ControlParameter Name="loan_pay_start_date" Type="DateTime" ControlID="loan_pay_start_date" PropertyName="Value" />
        <asp:ControlParameter Name="beneficiary_count" Type="Int16" ControlID="beneficiary_count" PropertyName="Value" />

        <asp:ControlParameter Name="governrate_id" Type="Int16" ControlID="cboGovernorate" PropertyName="Value" />
        <asp:ControlParameter Name="city_id" Type="Int16" ControlID="cboCity" PropertyName="Value" />
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
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_state]"></asp:SqlDataSource>
<%--<asp:SqlDataSource ID="SqlDataSource_RelatedProject" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT project_id, CAST(project_id AS VARCHAR(10)) + ' - ' + project_name_ar AS project_name_ar, CAST(project_id AS VARCHAR(10)) + ' - ' + project_name_en AS project_name_en FROM [project]"></asp:SqlDataSource>--%>
<asp:SqlDataSource ID="SqlDataSource_Organization" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [request_org]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_ProjectTarget" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_target]"></asp:SqlDataSource>
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
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [city] WHERE (([governrte] = @governrte) AND ([nat_city] = @nat_city))">
    <SelectParameters>
        <asp:ControlParameter ControlID="cboGovernorate" DefaultValue="0" Name="governrte" PropertyName="Value" Type="Int16" />
        <asp:ControlParameter ControlID="nat_code" DefaultValue="0" Name="nat_city" PropertyName="Value" Type="Int16" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_Center" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [center] WHERE ([city_id] = @city_id)">
    <SelectParameters>
        <asp:ControlParameter ControlID="cboCity" DefaultValue="0" Name="city_id" PropertyName="Value" Type="Int16" />
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
