<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="BeneficiaryScholarshipReportSearch.aspx.vb" Inherits="DirectAid.BeneficiaryScholarshipReportSearch" %>

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
                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="الجنسيه" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox ID="nat_code" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_nat_tab"
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
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel runat="server" Text="اسم المؤسسة التعليمية" Width="100%" Font-Bold="True" ID="ASPxLabel_section_opinion"></dx:ASPxLabel>

            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxTextBox runat="server" Width="100%" ClientInstanceName="StudyingAt" ID="StudyingAt" MaxLength="100"></dx:ASPxTextBox>

            </td>
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel_orphanage_code" runat="server" Text="المرحلة الدراسية" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" ValueType="System.Int16" TextField="stud_qual_name_ar" ValueField="stud_qual_type_code"
                    Width="100%" ID="study_level" ClientInstanceName="study_level" DataSourceID="EntityDataSource_stud_qualif_type_codes">
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
                <asp:EntityDataSource ID="EntityDataSource_stud_qualif_type_codes" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="stud_qualif_type_codes" EntityTypeFilter="stud_qualif_type_codes">
                </asp:EntityDataSource>
            </td>
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel runat="server" Text="الدرجة الدراسية" Width="100%" Font-Bold="True" ID="ASPxLabel_stud_qualif_type"></dx:ASPxLabel>

            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" CallbackPageSize="5" EnableCallbackMode="True" EnableSynchronization="True" IncrementalFilteringMode="Contains" DropDownRows="5" ValueType="System.Int16" DataSourceID="EntityDataSource_stud_qualif_level_codes" TextField="stud_qualif_level_ar" ValueField="stud_qualif_level_code" Width="100%" ClientInstanceName="stud_qualif_type" EnableClientSideAPI="True" ID="study_category">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
                <asp:EntityDataSource ID="EntityDataSource_stud_qualif_level_codes" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="stud_qualif_level_codes" EntityTypeFilter="stud_qualif_level_codes">
                </asp:EntityDataSource>
            </td>
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel runat="server" Text="الكلية" Width="100%" Font-Bold="True" ID="ASPxLabel_stud_qualif_type0"></dx:ASPxLabel>

            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" CallbackPageSize="5" EnableCallbackMode="True" EnableSynchronization="True" IncrementalFilteringMode="Contains" DropDownRows="5" ValueType="System.Int32" DataSourceID="EntityDataSource_education_Faculties_master" TextField="name_ar" ValueField="ID" Width="100%" ClientInstanceName="faculty" EnableClientSideAPI="True" ID="faculty">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
                <asp:EntityDataSource ID="EntityDataSource_education_Faculties_master" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="education_Faculties_master" EntityTypeFilter="education_Faculties_master">
                </asp:EntityDataSource>
            </td>
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel runat="server" Text="التخصص" Width="100%" Font-Bold="True" ID="ASPxLabel_stud_qualif_type1"></dx:ASPxLabel>

            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox runat="server" CallbackPageSize="5" EnableCallbackMode="True" EnableSynchronization="True" IncrementalFilteringMode="Contains" DropDownRows="5" ValueType="System.Int16" DataSourceID="EntityDataSource_stud_prof_types_codes" TextField="stud_prof_name_ar" ValueField="stud_prof_type_code" Width="100%" ClientInstanceName="study_prof" EnableClientSideAPI="True" ID="study_prof">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
                <asp:EntityDataSource ID="EntityDataSource_stud_prof_types_codes" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="stud_prof_types_codes" EntityTypeFilter="stud_prof_types_codes">
                </asp:EntityDataSource>
            </td>
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="قيمه المنحه من" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxTextBox runat="server" Width="100%" ID="scholarship_amountFrom">
                    <MaskSettings Mask="&lt;0..999999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="قيمه المنحه الى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxTextBox runat="server" Width="100%" ID="scholarship_amountTo">
                    <MaskSettings Mask="&lt;0..999999&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="حاله المنحه" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxComboBox ID="scholarship_status1" runat="server"
                    ValueType="System.Int16" Width="100%"
                    DataSourceID="EntityDataSource_scholarship_status" TextField="status_name_ar" ValueField="ID">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Buttons>
                        <dx:EditButton Text="X">
                        </dx:EditButton>
                    </Buttons>
                </dx:ASPxComboBox>
                <asp:EntityDataSource ID="EntityDataSource_scholarship_status" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="scholarship_status" EntityTypeFilter="scholarship_status">
                </asp:EntityDataSource>
            </td>
            <td align="center" style="width: 10%;">
                &nbsp;</td>
            <td align="center" style="width: 40%;">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="تاريخ التسجيل من" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="RegisterDate_From" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="الى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="RegisterDate_To" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="تاريخ الاعتماد من" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="scholarship_start_date_from" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="الى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="scholarship_start_date_to" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="تاريخ الانتهاء المتوقع من" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="scholarship_end_date_From" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="الى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="scholarship_end_date_To" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="تاريخ الانتهاء الفعلي من" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="nominated_site_join_date_from" runat="server" Width="100%">
                </dx:ASPxDateEdit>
            </td>
            <td align="center" style="width: 10%;">
                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="الى" Width="100%"
                    Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 40%;">
                <dx:ASPxDateEdit ID="nominated_site_join_date_to" runat="server" Width="100%">
                </dx:ASPxDateEdit>
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
                        <asp:Parameter DefaultValue="True" Name="Visible" Type="Boolean"/>
                    </WhereParameters>
                </asp:EntityDataSource>
            </td>
            <td align="center" style="width: 10%;">
                &nbsp;</td>
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
                &nbsp;</td>
            <td align="center" style="width: 10%;">&nbsp;</td>
            <td align="center" style="width: 40%;">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
