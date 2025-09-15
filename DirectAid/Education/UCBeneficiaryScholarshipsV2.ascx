<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryScholarshipsV2.ascx.vb" Inherits="DirectAid.UCBeneficiaryScholarshipsV2" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>



<link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
<script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
<script type="text/javascript">
    //--------------------------------Block For CallBacks in Grid -------------------------------
    var lastAppStatus = null;
    function onAppStatusChanged(s) {
        /*
        if (grid.GetEditor("status_reason").InCallback())
            lastAppStatus = cmbAppStatus.GetValue().toString();
        else
            grid.GetEditor("status_reason").PerformCallback(cmbAppStatus.GetValue().toString());
         */
        grid.GetEditor("status_reason").PerformCallback(cmbAppStatus.GetValue().toString());
    }

    function oncmbNominated_site_typeChanged(s) {
        //nominated_site_type
        grid.GetEditor("nominated_site").PerformCallback(cmbNominated_site_type.GetValue().toString());
    }
    function onAppStatusEndCallBack() {
        if (lastAppStatus) {
            grid.GetEditor("status_reason").PerformCallback(lastAppStatus);
            lastAppStatus = null;
        }
    }
    //-----------------------------------------------------------------------
    var command;
    function OnBeginCallback(s, e) {
        command = e.command;
        if (command == "UPDATEEDIT") {
            confirm("هل انت متاكد ؟");
        }
    }
    function OnEndCallback(s, e) {
        //alert(command);
        if (command == "STARTEDIT") {
                //alert("The record can't be edit, reason: " + s.cpMessage);
        }
    }
    //---------------------------------------------------------------------------------------------
    //------------------------------Block For Poup Controll and selection from grid inside --------
    function configureLoadingAndCallBack() {
        Callback.PerformCallback();
        LoadingPanel.Show();
    }
    function configureLoadingForSearchPopup() {
        ASPxPopupControl1.Hide();
        Callback.PerformCallback();
        LoadingPanel.Show();
    }
    //---------------------------------------------------------------------------------------------
    function openTransfers(url, options) {
        // get the height correction for IE and set the window height and width
        //alert('');
        var height = screen.availHeight;
        var width = screen.availWidth;

        var fullscreen = (document.all) ? "no" : "yes";
        var resizable = "no";
        var toolbar = "no";
        var status = "no";
        var left = 0;
        var top = 0;

        //set window properties
        props = "toolbar=no" +
        ",fullscreen=" + fullscreen +
        ",status=no" +
        ",resizable=no" +
        ",scrollbars=no" +
        ",menubar=no" +
        ",location=no" + ",";

        dims = "width=" + width +
        ",height=" + height +
        ",left=" + left +
        ",top=" + top;

        win = window.open("", name, props + dims);
        win.resizeTo(width, height);
        win.location.href = url;
        win.focus();
        /*var floatingWindow;
        floatingWindow = open("", "", options);
        floatingWindow.location.href = url;*/
        return false;
    }
</script>
<style type="text/css">
    .style7
    {
        height: 31px;
    }

    .style12
    {
        height: 29px;
    }

    #form1
    {
        height: 1245px;
        width: 1278px;
    }

    .style19
    {
        height: 14px;
    }

    .style24
    {
    }

    .style28
    {
        height: 10px;
        text-align: right;
    }

    .style30
    {
        width: 44px;
    }

    .style31
    {
        width: 125px;
    }

    .style32
    {
        width: 20px;
    }

    .style33
    {
        width: 68px;
    }

    .style34
    {
        width: 84px;
    }

    .style35
    {
        width: 133px;
    }

    .style36
    {
        width: 130px;
    }

    .style37
    {
        width: 47px;
    }

    .style38
    {
        width: 102px;
    }

    .auto-style1
    {
        height: 10px;
        text-align: right;
        width: 551px;
    }

    .auto-style2
    {
        height: 10px;
        text-align: right;
        width: 116px;
    }

    .auto-style3
    {
        height: 10px;
        text-align: right;
        width: 400px;
    }

    .auto-style4
    {
        width: 1188px;
        height: 219px;
    }

    .auto-style5
    {
        height: 10px;
        text-align: right;
        width: 103px;
    }
</style>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Font-Size="Medium" ForeColor="#000066" KeyFieldName="scholarship_ser"
    Theme="Default" Width="100%" DataSourceID="students_scholarship_DS" ClientInstanceName="grid" EnableTheming="True" EnableCallBacks="False">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0">
            <EditButton Visible="True">
            </EditButton>
            <NewButton Visible="True">
            </NewButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="stud_code" ReadOnly="True"
            Visible="False" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="scholarship_ser" ReadOnly="True"
            Visible="False" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="القيمة الاجمالية للمنحة/المتوقعه" Visible="False" VisibleIndex="8">
            <PropertiesTextEdit ClientInstanceName="expectedAmount">
            </PropertiesTextEdit>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="قيمة المنحة" FieldName="scholarship_amount"
            VisibleIndex="3">
            <PropertiesTextEdit MaxLength="15" ClientInstanceName="periodicAmount">
                <ClientSideEvents TextChanged="function(s, e) {
	var diff = expectedEndDate.GetDate() - startDate.GetDate();
    var day = Math.floor((diff / 1000) / 31536000);
    expectedAmount.SetText((day * periodicAmount.GetValue()).toString());
}" />
                <ValidationSettings>
                    <RegularExpression ValidationExpression="^(?=.*\d)\d*(?:\.\d{0,3})?$" />
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ البداية/الاعتماد" FieldName="scholarship_start_date" VisibleIndex="4">
            <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd" ClientInstanceName="startDate">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ الانتهاء المتوقع" FieldName="scholarship_end_date" VisibleIndex="5">
            <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd" ClientInstanceName="expectedEndDate">
                <ClientSideEvents DateChanged="function(s, e) {
 var oneDay = 1000 * 60 * 60 * 24;
 
	if(s.GetDate() != null &amp;&amp; s.GetDate() != ''
       &amp;&amp; startDate.GetDate() != null &amp;&amp; startDate.GetDate() != ''){
       //alert('has value '+s.GetDate());
       if(s.GetDate() &lt;= startDate.GetDate()){
          alert(&quot;خطأ في ادخال تاريخ نهاية المنحة المتوقع برجاء راجع تاريخ الاعتماد&quot;);
          s.SetDate(null);
		  s.focus();
          return;
       }
       var diff = s.GetDate() - startDate.GetDate();
       var day = Math.floor((diff / 1000) / 31536000);
       expectedAmount.SetText((day * periodicAmount.GetValue()).toString());
       expectedPeriod.SetText(day.toString() + &quot; سنوات &quot;);
       
    }
    else{
       //alert('does not have any val');
    }
}" Init="function(s, e) {
	var oneDay = 1000 * 60 * 60 * 24;
 
	if(s.GetDate() != null &amp;&amp; s.GetDate() != ''
       &amp;&amp; startDate.GetDate() != null &amp;&amp; startDate.GetDate() != ''){
       //alert('has value '+s.GetDate());
       if(s.GetDate() &lt;= startDate.GetDate()){
          alert(&quot;خطأ في ادخال تاريخ نهاية المنحة المتوقع برجاء راجع تاريخ الاعتماد&quot;);
          s.SetDate(null);
		  s.focus();
          return;
       }
       var diff = s.GetDate() - startDate.GetDate();
       var day = Math.floor((diff / 1000) / 31536000);
       expectedAmount.SetText((day * periodicAmount.GetValue()).toString());
       expectedPeriod.SetText(day.toString() + &quot; سنوات &quot;);
       
    }
    else{
       //alert('does not have any val');
    }
}" />
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="نمط المنحة" FieldName="scholarship_pattern1" VisibleIndex="9">
            <PropertiesComboBox CallbackPageSize="10" DataSourceID="DS_Scholarship_patterns" EnableCallbackMode="True"
                EnableClientSideAPI="True" TextField="Pattern_Name_ar" ValueField="id" ValueType="System.Int64" IncrementalFilteringMode="Contains">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="نوع المنحة" FieldName="scholarship_pattern2" VisibleIndex="10">
            <PropertiesComboBox CallbackPageSize="10" DataSourceID="DS_Scholarship_types" EnableCallbackMode="True"
                EnableClientSideAPI="True" TextField="Type_name_ar" ValueField="id" ValueType="System.Int64" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="حالة المنحة" FieldName="scholarship_status1" VisibleIndex="11">
            <PropertiesComboBox CallbackPageSize="10" DataSourceID="DS_Scholarship_status" EnableCallbackMode="True"
                EnableClientSideAPI="True" TextField="status_name_ar" ValueField="id" ValueType="System.Int32" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="حالة المنحة2" FieldName="scholarship_status2" VisibleIndex="12" Visible="False">
            <PropertiesComboBox CallbackPageSize="10" DataSourceID="reasons_tab_DS7" EnableCallbackMode="True"
                EnableClientSideAPI="True" TextField="reason_ar" ValueField="reason_code" ValueType="System.Int64" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn Caption="المدة المتوقعة" Visible="False" VisibleIndex="7" FieldName="transfer_covered_period" ReadOnly="True">
            <PropertiesTextEdit MaxLength="2" ClientInstanceName="expectedPeriod">
                <ValidationSettings>
                    <RegularExpression ErrorText="*" />
                </ValidationSettings>
            </PropertiesTextEdit>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="نظام الدفع" Visible="False" VisibleIndex="13" FieldName="payment_method">
            <PropertiesComboBox DataSourceID="pay_method_DS" TextField="pay_method_ar" ValueField="pay_method_id" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="العملة" Visible="False" VisibleIndex="14" FieldName="currency_code">
            <PropertiesComboBox DataSourceID="currency_tab_DS" TextField="currency_descrar" ValueField="currency_code" EnableCallbackMode="True" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="العام الدراسي" Visible="False" VisibleIndex="16" FieldName="academic_year">
            <PropertiesComboBox DataSourceID="acad_year_codes_DS" TextField="acad_year_name" ValueField="acad_year_code" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="نوع المؤسسة المرشح لها" Visible="False" VisibleIndex="17" FieldName="nominated_site_type">
            <PropertiesComboBox DataSourceID="org_type_DS" TextField="org_type_ar" ValueField="org_type_code" ClientInstanceName="cmbNominated_site_type" EnableCallbackMode="True" IncrementalFilteringMode="Contains">
                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	oncmbNominated_site_typeChanged(s);
}" />
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="المؤسسة المرشح لها" Visible="False" VisibleIndex="18" FieldName="nominated_site">
            <PropertiesComboBox DataSourceID="DS_GetSchoolsByType" TextField="school_name_ar" ValueField="school_code" EnableCallbackMode="True" FilterMinLength="1" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="المدينة" Visible="False" VisibleIndex="20" FieldName="nominated_site_city">
<PropertiesComboBox DataSourceID="city_DS" TextField="city_name_ar" ValueField="city_id" EnableCallbackMode="True" IncrementalFilteringMode="Contains"></PropertiesComboBox>

            <EditFormSettings Visible="False" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="المرحلة الدراسية" Visible="False" VisibleIndex="21" FieldName="study_level">
            <PropertiesComboBox DataSourceID="stud_qualif_type_codes_DS" TextField="stud_qual_name_ar" ValueField="stud_qual_type_code" EnableCallbackMode="True" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="الكلية" FieldName="faculty" Visible="False" VisibleIndex="23">
            <PropertiesComboBox DataSourceID="DS_Education_Faculties_master" EnableCallbackMode="True" IncrementalFilteringMode="Contains" TextField="name_ar" ValueField="id">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="الدرجة الدراسية" Visible="False" VisibleIndex="22" FieldName="study_category">
            <PropertiesComboBox DataSourceID="stud_qualif_level_codes_DS" TextField="stud_qualif_level_ar" ValueField="stud_qualif_level_code" EnableCallbackMode="True" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="التخصص" Visible="False" VisibleIndex="24" FieldName="study_prof">
            <PropertiesComboBox DataSourceID="stud_prof_types_codes_DS" TextField="stud_prof_name_ar" ValueField="stud_prof_type_code" EnableCallbackMode="True" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="الفرع" Visible="False" VisibleIndex="25" FieldName="nominated_site_branch">
            <PropertiesComboBox DataSourceID="city_DS" TextField="city_name_ar" ValueField="city_id" EnableCallbackMode="True" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="False" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="اسم جهة الترشيح" Visible="False" VisibleIndex="26" FieldName="nominated_by">
            <PropertiesComboBox DataSourceID="org_tab_DS" TextField="org_namear" ValueField="org_code" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ الانتهاء الفعلي" Visible="False" VisibleIndex="6" FieldName="nominated_site_join_date">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="عدد السنوات" Visible="False" VisibleIndex="27" FieldName="study_years_num">
<PropertiesTextEdit MaxLength="2">
<ValidationSettings>
<RegularExpression ErrorText="*" ValidationExpression="^(?=.*\d)\d*(?:)?$"></RegularExpression>
</ValidationSettings>
</PropertiesTextEdit>

            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="طبيعة عمل المؤسسة المرشح منها" Visible="False" VisibleIndex="29" FieldName="entity_activity">
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn Caption="عنوان المؤسسة المرشحة منها" Visible="False" VisibleIndex="30" FieldName="nominated_by_address">
            <PropertiesTextEdit MaxLength="2">
                <ValidationSettings>
                    <RegularExpression ErrorText="*" ValidationExpression="^(?=.*\d)\d*(?:)?$" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="حالة الطلب" Visible="False" VisibleIndex="34" FieldName="application_status">
            <PropertiesComboBox ClientInstanceName="cmbAppStatus" DataSourceID="ODS_Status" TextField="NameAr" ValueField="ID" IncrementalFilteringMode="StartsWith">
                <ClientSideEvents SelectedIndexChanged="function(s, e) {
	onAppStatusChanged(s);
}" />
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="سبب الحالة" Visible="False" VisibleIndex="34" FieldName="status_reason">
            <PropertiesComboBox DataSourceID="reasons_tab_DS" TextField="reason_ar" ValueField="reason_code" IncrementalFilteringMode="Contains">
                <ClientSideEvents EndCallback="function(s, e) {
	onAppStatusEndCallBack();
}" />
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="مبررات الترشيح" FieldName="public_relation" Visible="False" VisibleIndex="31">
            <PropertiesComboBox IncrementalFilteringMode="Contains">
                <Items>
                    <dx:ListEditItem Text="من ايتام الجمعية" Value="1" />
                    <dx:ListEditItem Text="التفوق الدراسي" Value="2" />
                    <dx:ListEditItem Text="الفقر" Value="3" />
                    <dx:ListEditItem Text="علاقات عامة" Value="4" />
                </Items>
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ الحالة" Visible="False" VisibleIndex="35" FieldName="status_date" ReadOnly="True">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="عنوان المؤسسة المرشح منها" Visible="False" VisibleIndex="28" FieldName="entity_address">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="التحويلات" VisibleIndex="32" UnboundType="String">
            <EditFormSettings Visible="False" />
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="hyperLink" runat="server" OnInit="hyperLink_Init" Text="التحويلات">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataMemoColumn Caption="ملاحظات جهة الترشيح" FieldName="nominated_site_notes" Visible="False" VisibleIndex="32">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataMemoColumn Caption="ملاحظات عامة" FieldName="scholarship_notes" Visible="False" VisibleIndex="33">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataTextColumn Caption="المؤسسة المرشح لها" FieldName="school_name_ar" VisibleIndex="19" Width="250px">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="النتائج الدراسية" VisibleIndex="36" UnboundType="String">
            <EditFormSettings Visible="False" />
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="hyperLink_results" runat="server" OnInit="hyperLink_results_Init" Text="النتائج الدراسية">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الرسوم الدراسية" VisibleIndex="37" UnboundType="String">
            <EditFormSettings Visible="False" />
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="hyperLink_Fees" runat="server" OnInit="hyperLink_Fees_Init" Text="الرسوم الدراسية">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>

        <dx:GridViewDataDateColumn Caption="تاريخ الالتحاق بالمؤسسة التعليمية (الحالي)" FieldName="nominated_site_join_date" Visible="False" VisibleIndex="15">
            <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormatString="yyyy-MM-dd">
            </PropertiesDateEdit>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataDateColumn>

    </Columns>
    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True"
        ProcessFocusedRowChangedOnServer="True" ProcessSelectionChangedOnServer="True" />
    <SettingsPager ShowSeparators="True">
        <PageSizeItemSettings Caption="عدد الصفحات : " Items="5, 10, 20, 50, 100, 200" ShowAllItem="True"
            Visible="True">
        </PageSizeItemSettings>
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" />
    <Settings ShowFilterBar="Auto" ShowFilterRow="True" />
    <SettingsText CommandCancel="الغاء" CommandUpdate="حفظ" CommandEdit="تعديل" CommandNew="جديد" EmptyDataRow="لا توجد بيانات" />
    <SettingsLoadingPanel Text="برجاء الانتظار&amp;hellip;" />
    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
    <ClientSideEvents BeginCallback="function(s, e) {
	OnBeginCallback();
}" EndCallback="function(s, e) {
	OnEndCallback();
}" />
</dx:ASPxGridView>
<div dir="rtl" style="display:none">
    <table dir="ltr" class="auto-style4">

        <tr>
            <td class="style28" colspan="2"></td>
            <td class="auto-style1">
                <asp:TextBox ID="txt_app_ser" runat="server" BackColor="#FFFFCC" BorderColor="#CEE6FF"
                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#003366"
                    Height="23px" MaxLength="4" Width="130px"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:Label ID="Label11" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                    Text="رقم الطالب" Width="90px"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="auto-style3">
                <span>
                    <img id="btn_search" alt="Search by names" border="0" src="../images/Search-icon.png" style="visibility: visible; width: 19px; height: 20px"
                        onclick="//open_search_names_scrn();" /></span><asp:TextBox ID="txt_applicant_name_en" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                            BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#003366" Height="23px"
                            ReadOnly="True" Style="margin-right: 0px" Width="350px"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:Label ID="Label231" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                    Text="اسم الطالب بالانجليزية" Width="116px"></asp:Label>
            </td>
            <td class="style28">
                <asp:TextBox ID="txt_applicant_name_ar" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#003366" Height="24px"
                    ReadOnly="True" Width="350px"></asp:TextBox>
            </td>
            <td class="auto-style5">
                <asp:Label ID="Label230" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                    Text="اسم الطالب بالعربية" Width="102px"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="style28" colspan="4"></td>
        </tr>
    </table>
    <asp:SqlDataSource ID="reasons_tab_DS4" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_reason_tab" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="4" Name="reason_cate" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="reasons_tab_DS5" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_reason_tab" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="5" Name="reason_cate" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="reasons_tab_DS6" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_reason_tab" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="6" Name="reason_cate" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="students_scholarship_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        DeleteCommand="Delete_students_scholarship" DeleteCommandType="StoredProcedure"
        InsertCommand="Insert_students_scholarship" InsertCommandType="StoredProcedure"
        SelectCommand="Select_students_scholarship" SelectCommandType="StoredProcedure"
        UpdateCommand="Update_students_scholarship" UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:ControlParameter ControlID="txt_app_ser" Name="stud_code" PropertyName="Text"
                Type="Int32" />
            <asp:Parameter Name="scholarship_ser" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="txt_app_ser" Name="stud_code" PropertyName="Text"
                Type="Int32" />
            <asp:Parameter Name="scholarship_amount" Type="Decimal" />
            <asp:Parameter Name="scholarship_start_date" Type="DateTime" />
            <asp:Parameter Name="scholarship_end_date" Type="DateTime" />
            <asp:Parameter Name="scholarship_pattern1" Type="Int16" />
            <asp:Parameter Name="scholarship_pattern2" Type="Int16" />
            <asp:Parameter Name="scholarship_status1" Type="Int16" />
            <asp:Parameter Name="scholarship_status2" Type="Int16" />
            <asp:Parameter Name="scholarship_notes" Type="String" />
            <asp:Parameter Name="payment_method" Type="Int16" />
            <asp:Parameter Name="transfer_covered_period" Type="Int16" />
            <asp:Parameter Name="application_status" Type="Byte" DefaultValue="1" />
            <asp:Parameter Name="status_reason" Type="Byte" />
            <asp:Parameter Name="status_date" DbType="Date"></asp:Parameter>
            <asp:Parameter Name="status_by" Type="Int16" />
            <asp:Parameter Name="nominated_site_join_date" Type="DateTime" />
            <asp:Parameter Name="nominated_site_type" Type="Int16"></asp:Parameter>
            <asp:Parameter Name="nominated_site" Type="Int16" />
            <asp:Parameter Name="study_level" Type="Int16" />
            <asp:Parameter Name="study_category" Type="Int16" />
            <asp:Parameter Name="academic_year" Type="Int16" />
            <asp:Parameter Name="study_years_num" Type="Int16" />
            <asp:Parameter Name="study_prof" Type="Int16" />
            <asp:Parameter Name="nominated_site_branch" Type="Int16" />
            <asp:Parameter Name="public_relation" Type="Byte" />
            <asp:Parameter Name="nominated_by_address" Type="String" />
            <asp:Parameter Name="nominated_site_notes" Type="String" />
            <asp:Parameter Name="nominated_by" Type="Int16" />
            <asp:Parameter Name="entity_activity" Type="Byte" />
            <asp:Parameter Name="entity_address" Type="String" />
            <asp:Parameter Name="currency_code" Type="Int16" />
            <asp:Parameter Direction="InputOutput" Name="scholarship_ser" Type="Int32" />
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:Parameter Name="nominated_site_city" Type="Int16" />
            <asp:Parameter Name="faculty" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txt_app_ser" Name="stud_code" PropertyName="Text"
                Type="Int32" />
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="stud_code" Type="Int32" />
            <asp:Parameter Name="scholarship_ser" Type="Int32" />
            <asp:Parameter Name="scholarship_amount" Type="Decimal" />
            <asp:Parameter Name="scholarship_start_date" Type="DateTime" />
            <asp:Parameter Name="scholarship_end_date" Type="DateTime" />
            <asp:Parameter Name="scholarship_pattern1" Type="Int16" />
            <asp:Parameter Name="scholarship_pattern2" Type="Int16" />
            <asp:Parameter Name="scholarship_status1" Type="Int16" />
            <asp:Parameter Name="scholarship_status2" Type="Int16" />
            <asp:Parameter Name="scholarship_notes" Type="String" />
            <asp:Parameter Name="payment_method" Type="Int16" />
            <asp:Parameter Name="transfer_covered_period" Type="Int16" />
            <asp:Parameter Name="application_status" Type="Byte" />
            <asp:Parameter Name="status_reason" Type="Byte" />
            <asp:Parameter DbType="Date" Name="status_date" />
            <asp:Parameter Name="status_by" Type="Int16" />
            <asp:Parameter Name="nominated_site_join_date" Type="DateTime" />
            <asp:Parameter Name="nominated_site_type" Type="Int16" />
            <asp:Parameter Name="nominated_site" Type="Int16" />
            <asp:Parameter Name="study_level" Type="Int16" />
            <asp:Parameter Name="study_category" Type="Int16" />
            <asp:Parameter Name="academic_year" Type="Int16" />
            <asp:Parameter Name="study_years_num" Type="Int16" />
            <asp:Parameter Name="study_prof" Type="Int16" />
            <asp:Parameter Name="nominated_site_branch" Type="Int16" />
            <asp:Parameter Name="public_relation" Type="Byte" />
            <asp:Parameter Name="nominated_by_address" Type="String" />
            <asp:Parameter Name="nominated_site_notes" Type="String" />
            <asp:Parameter Name="nominated_by" Type="Int16" />
            <asp:Parameter Name="entity_activity" Type="Byte" />
            <asp:Parameter Name="entity_address" Type="String" />
            <asp:Parameter Name="currency_code" Type="Int16" />
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:Parameter Name="nominated_site_city" Type="Int16" />
            <asp:Parameter Name="faculty" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="city_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [city]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="reasons_tab_DS7" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_reason_tab" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="7" Name="reason_cate" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="reasons_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_reason_tab" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="" Name="reason_cate" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="currency_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_currency_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="pay_method_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_pay_methods" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="acad_year_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_academic_year_codes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="org_type_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_organization_type" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="stud_qualif_type_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_stud_qualif_type_codes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="stud_qualif_level_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_stud_qualif_level_codes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="stud_prof_types_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_stud_prof_types_codes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource ID="org_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_organization_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    <asp:SqlDataSource ID="reasons_tab_DS8" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_reason_tab" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="4" Name="reason_cate" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="reasons_tab_DS9" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_reason_tab" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="5" Name="reason_cate" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="reasons_tab_DS10" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_reason_tab" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="6" Name="reason_cate" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="reasons_tab_DS11" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_reason_tab" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="7" Name="reason_cate" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:SqlDataSource ID="DS_GetSchoolsByType" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="select school_code,
	cast(school_code as nvarchar)+' - '+cast(school_name_ar as nvarchar) +'  - ('+nat_tab.nat_descrar collate Arabic_CI_AS +')'  as school_name_ar,
	cast(school_code as nvarchar)+' - '+cast(school_name_en as nvarchar) +'  - ('+nat_tab.nat_descrar collate Arabic_CI_AS +')'  as school_name_en
from school_master
left outer join city on  school_master.country_city = city.city_id
left outer join nat_tab on city.nat_city = nat_tab.nat_code
where [site_type] = @type


">
        <SelectParameters>
            <asp:Parameter Name="type" DbType="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True" AllowResize="True"
        CloseAction="CloseButton" ClientInstanceName="ASPxPopupControl1" EnableViewState="False"
        PopupElementID="btn_search" PopupHorizontalAlign="WindowCenter" Modal="True"
        PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="1000px" Height="500px"
        FooterText="" Theme="Office2010Blue" HeaderText="بحث الطلبة" EnableHierarchyRecreation="True"
        RightToLeft="True">
        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                <%-- <dx:ASPxButton ID="ASPxButton1" runat="server" Text="ASPxButton">
                        <ClientSideEvents Click="function(s, e) { ASPxPopupControl1.Hide(); }" />
                        </dx:ASPxButton>--%>
                <div style="direction: rtl">
                    <h2>اختر</h2>
                    <dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" EnableTheming="True"
                        Theme="Office2010Blue" DataSourceID="DS_Select_students" EnableViewState="true"
                        KeyFieldName="app_ser"
                        OnRowCommand="ASPxGridView4_RowCommand">
                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="اسم الطالب - E" FieldName="Name_EN"
                                ShowInCustomizationForm="True" VisibleIndex="3" Width="425px">
                                <DataItemTemplate>
                                    <asp:LinkButton runat="server" ID="ddd" Text='<%# Eval("Name_EN") %>' CommandName="stud"
                                        CommandArgument='<%# Eval("app_ser") %>' OnClientClick="configureLoadingForSearchPopup();">
                                            
                                            
                                            
                                    </asp:LinkButton>
                                </DataItemTemplate>

                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="اسم الطالب - ع" FieldName="Name"
                                VisibleIndex="2" Width="425px">
                                <DataItemTemplate>
                                    <asp:LinkButton runat="server" ID="ddd0" Text='<%# Eval("Name")%>' CommandName="stud"
                                        CommandArgument='<%# Eval("app_ser") %>' OnClientClick="configureLoadingForSearchPopup();">
                                            
                                            
                                            
                                    </asp:LinkButton>
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="رقم الطالب" ShowInCustomizationForm="True"
                                VisibleIndex="1" FieldName="app_ser">
                                <DataItemTemplate>
                                    <asp:LinkButton runat="server" ID="ddd1" Text='<%# Eval("app_ser") %>' CommandName="stud"
                                        CommandArgument='<%# Eval("app_ser") %>' OnClientClick="configureLoadingForSearchPopup();">
                                            
                                            
                                            
                                    </asp:LinkButton>
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                        </Columns>
                        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                        <SettingsText EmptyDataRow="لا توجد بيانات" />
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="DS_Select_students" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>">
                        <SelectParameters>
                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <cc1:LinqServerModeDataSource ID="LinqDS_Schools" runat="server"
                        ContextTypeName="DirectAid.charitysoftEntities"
                        TableName="benf_master" />

                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="Callback">
        <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Hide(); }" />
        <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Hide(); }" />
    </dx:ASPxCallback>
    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="true" Text="برجاء الانتظار .." RightToLeft="True">
    </dx:ASPxLoadingPanel>

    <br />

</div>
<asp:SqlDataSource ID="DS_Scholarship_patterns" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="select id,Pattern_Name_ar,Pattern_Name_en from scholarship_patterns"></asp:SqlDataSource>
<asp:SqlDataSource ID="DS_Scholarship_status" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="select id,status_name_ar,status_name_en from scholarship_status"></asp:SqlDataSource>
<asp:SqlDataSource ID="DS_Scholarship_types" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="select id,Type_name_ar,Type_name_en from scholarship_types"></asp:SqlDataSource>
<asp:SqlDataSource ID="DS_Education_Faculties_master" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="select id,name_ar,name_en from education_Faculties_master"></asp:SqlDataSource>
<asp:ObjectDataSource ID="ODS_Status" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Load" TypeName="DirectAid.OrphanRequestStatus"></asp:ObjectDataSource>


<asp:Literal ID="ltrl_updatePeriod" runat="server"></asp:Literal>



