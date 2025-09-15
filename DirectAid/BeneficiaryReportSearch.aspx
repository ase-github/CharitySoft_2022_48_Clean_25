<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="BeneficiaryReportSearch.aspx.vb" Inherits="DirectAid.BeneficiaryReportSearch" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <% If DesignMode Then%>
    <script src="Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
    <% End If%>
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
    <style type="text/css">
        .auto-style1 {
            width: 10%;
            height: 32px;
        }

        .auto-style2 {
            width: 40%;
            height: 32px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True" AllowResize="True"
        CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="75%"
        HeaderText="" ClientInstanceName="ASPxPopupControl1" EnableHierarchyRecreation="True" AutoUpdatePosition="True" EnableCallbackAnimation="True" EnableClientSideAPI="True" Maximized="True" RenderMode="Lightweight" ShowCollapseButton="True" ShowMaximizeButton="True" DragElement="Window" FooterText="" ShowPinButton="True" ShowRefreshButton="True">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <table width="75%" align="center">
        <tr>
            <td align="center" class="auto-style1">
                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="نوع التقرير" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" class="auto-style2">
                <dx:ASPxComboBox runat="server" TextField="namear" ValueField="report_file_name"
                    Width="100%" ID="ASPxComboBox_ReportType" SelectedIndex="0" DataSourceID="EntityDataSource_system_report">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
            <td align="center">
                <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="ترتيب حسب" Width="100%"
                    Font-Bold="True" Visible="False">
                </dx:ASPxLabel>
            </td>
            <td align="center">
                <dx:ASPxComboBox runat="server"
                    Width="100%" ID="ASPxComboBox_SortOrder" Visible="False">
                    <Items>
                        <dx:ListEditItem Text="الرقم" Value="app_ser" />
                        <dx:ListEditItem Text="الاسم" Value="applicant_name_ar_1" />
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
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">&nbsp;</td>
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="الحاله" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox ID="application_status_stud_orp" runat="server"
                    ValueType="System.Byte" Width="100%"
                    DataSourceID="ObjectDataSource_Status" TextField="NameAr" ValueField="ID">
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
                <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="صادر رقم" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxTextBox runat="server" Width="100%" ID="ASPxTextBox_OutboxNumber"></dx:ASPxTextBox>

            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="تاريخ الحاله من" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="status_date_From" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="الى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="status_date_To" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="تاريخ التخصيص من" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="allocation_date_from" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="الى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="allocation_date_to" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="تاريخ فصل الكفاله من" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="DeAllocationDate_From" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="الى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="DeAllocationDate_To" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="تاريخ الميلاد من" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="applicant_dob_from" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="الى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="applicant_dob_to" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
        </tr>
<tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="تاريخ التحديث من" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="overall_last_update_date_from" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="الى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="overall_last_update_date_to" runat="server" Width="100%">
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
                    Width="100%" ID="applicant_gender">
                    <Items>
                        <dx:ListEditItem Text="ذكر" Value="0" />
                        <dx:ListEditItem Text="انثى" Value="1" />
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
                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="الكفاله" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" ValueType="System.Byte" TextField="NameAr" ValueField="ID"
                    Width="100%" ID="donor">
                    <Items>
                        <dx:ListEditItem Text="مخصص" Value="1" />
                        <dx:ListEditItem Text="غير مخصص" Value="2" />
                        <dx:ListEditItem Text="الكل" Value="3" />
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
                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="الدوله" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox ID="ASPxComboBox_Country" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_nat_tab"
                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                    IncrementalFilteringMode="Contains" TextField="nat_descrar" ValueField="nat_code"
                    ValueType="System.Int16" Width="100%" AutoPostBack="True">
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
                <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="المركز" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox ID="center_tab" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_center_tab"
                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                    IncrementalFilteringMode="Contains" TextField="center_namear" ValueField="center_code"
                    ValueType="System.Int32" Width="100%">
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
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="الجنسيه" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox ID="applicant_nat" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_nat_tab"
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
                <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="الرقم" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxTextBox runat="server" Width="100%" ID="app_ser">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="التخصيص من" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxTextBox runat="server" Width="100%" ID="ASPxTextBox_AllocationFrom">
                    <MaskSettings Mask="&lt;1..1000000&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="التخصيص الى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxTextBox runat="server" Width="100%" ID="ASPxTextBox_AllocationTo">
                    <MaskSettings Mask="&lt;1..1000000&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel_orphanage_code" runat="server" Text="داخلى / خارجى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" ValueType="System.Byte" TextField="NameAr" ValueField="ID"
                    Width="100%" ID="orphanage_code">
                    <Items>
                        <dx:ListEditItem Text="داخلى" Value="1" />
                        <dx:ListEditItem Text="خارجى" Value="2" />
                        <dx:ListEditItem Text="غير محدد" Value="3" />
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
                <dx:ASPxLabel runat="server" Text="المؤهل الدراسي" Width="100%" Font-Bold="True" ID="ASPxLabel_stud_qualif_type"></dx:ASPxLabel>

            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" CallbackPageSize="5" EnableCallbackMode="True" EnableSynchronization="True" IncrementalFilteringMode="Contains" DropDownRows="5" ValueType="System.Int16" DataSourceID="EntityDataSource_stud_qualif_type_codes" TextField="stud_qual_name_ar" ValueField="stud_qual_type_code" Width="100%" ClientInstanceName="stud_qualif_type" EnableClientSideAPI="True" ID="stud_qualif_type">
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
                <dx:ASPxLabel runat="server" Text="تاريخ التعيين من" Width="100%" Font-Bold="True" ID="ASPxLabel_school_reg_date_from"></dx:ASPxLabel>

            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit runat="server" Width="100%" ClientInstanceName="school_reg_date_from" EnableClientSideAPI="True" ID="school_reg_date_from">
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel runat="server" Text=" تاريخ التعيين الى" Width="100%" Font-Bold="True" ID="ASPxLabel_school_reg_date_to"></dx:ASPxLabel>

            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit runat="server" Width="100%" ClientInstanceName="school_reg_date_to" EnableClientSideAPI="True" ID="school_reg_date_to">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel runat="server" Text="مكان العمل" Width="100%" Font-Bold="True" ID="ASPxLabel_section_opinion"></dx:ASPxLabel>

            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxTextBox runat="server" Width="100%" ClientInstanceName="section_opinion" ID="section_opinion" MaxLength="100"></dx:ASPxTextBox>

            </td>
            <td align="center" style="width: 10%;">
                &nbsp;</td>
            <td align="center" style="width: 40%;">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="رقم الكافل" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>

            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxTextBox runat="server" Width="100%" ID="donor_id">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>

            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="اسم الكافل" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxTextBox runat="server" Width="100%" ID="donor_namear">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">&nbsp;
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxButton ID="ASPxButton_Print" runat="server" Text="طباعة" Width="100%" AutoPostBack="False"
                    ClientInstanceName="ASPxButton_Print" EnableClientSideAPI="True" Font-Bold="True"
                    ValidationGroup="print">
                    <ClientSideEvents Click="function(s, e) {
	Print_Begin();
}" />
                    <Image Url="~/Images/Print_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
                    Modal="True" Font-Bold="True">
                </dx:ASPxLoadingPanel>
                <dx:ASPxCallback ID="ASPxCallback_Print" runat="server"
                    ClientInstanceName="ASPxCallback_Print">
                    <ClientSideEvents CallbackComplete="function(s, e) {
	Print_End(e);
}"
                        CallbackError="function(s, e) {
	Print_Error(e);
}" />
                </dx:ASPxCallback>
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
            <td align="center" style="width: 10%;">&nbsp;
            </td>
            <td align="center" style="width: 40%;">
                <asp:EntityDataSource ID="EntityDataSource_system_report" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="system_report" EntityTypeFilter="system_report" Where="">
                    <WhereParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="system_module_id" QueryStringField="system_module_id" Type="Byte" />
                        <asp:QueryStringParameter DefaultValue="0" Name="system_unit_id" QueryStringField="system_unit_id" Type="Int16" />
                    </WhereParameters>
                </asp:EntityDataSource>
            </td>
            <td align="center" style="width: 10%;">
                <asp:ObjectDataSource ID="ObjectDataSource_Status" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Load" TypeName="DirectAid.OrphanRequestStatus"></asp:ObjectDataSource>
            </td>
            <td align="center" style="width: 40%;">
                <asp:EntityDataSource ID="EntityDataSource_nat_tab" runat="server" ConnectionString="name=charitysoftEntities"
                    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="nat_tab"
                    EntityTypeFilter="nat_tab">
                </asp:EntityDataSource>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">
                <asp:EntityDataSource ID="EntityDataSource_stud_qualif_type_codes" runat="server" ConnectionString="name=charitysoftEntities"
                    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="stud_qualif_type_codes">
                </asp:EntityDataSource>

            </td>
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">
                <asp:EntityDataSource ID="EntityDataSource_center_tab" runat="server" ConnectionString="name=charitysoftEntities"
                    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="center_tab" AutoGenerateWhereClause="True" Select="it.[center_code], it.[center_namear], it.[center_nameen], it.[region_code]" Where="">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="ASPxComboBox_Country" DefaultValue="0" Name="region_code" PropertyName="Value" Type="Int32" />
                    </WhereParameters>
                </asp:EntityDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
