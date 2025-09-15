<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCSchoolActivitiesV1.ascx.vb" Inherits="DirectAid.UCSchoolActivitiesV1" %>


<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>






<link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
<script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
<script type="text/javascript">
    function openTransfers(url, options) {
        // get the height correction for IE and set the window height and width
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

    function configureLoadingAndCallBack() {
        Callback.PerformCallback();
        LoadingPanel.Show();
    }
    function configureLoadingForSearchPopup() {
        ASPxPopupControl1.Hide();
        Callback.PerformCallback();
        LoadingPanel.Show();
    }

    function pageLoad() {


        $('#txt_school_code').keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                // let it happen, don't do anything
            }
            else {
                event.preventDefault();
            }
        });


    }



    function srch_rtn() { //main
        var i;
        var j;

        i = (event.keyCode);

        if (i == 13) {
            j = document.getElementById("A_search");
            j.click();
        } //13
    } //main


</script>
<script type="text/javascript">
    function open_search_names_scrn() {

        var i;
        var j;
        var k;
        var floatingWindow;
        //var accNo = '<%# Session("opr_flag")%>';
        //if (accNo == 3) {
        i = (event.keyCode);
        floatingWindow = open("", "", "width=800,height=400");
        floatingWindow.location.href = "search_screen.aspx?searchFLAG=1";
        return false;
        //                }
        //                else {
        //                    alert('اضغط خيار البحث');
        //                }
    }


    function Get_school_info() {

        var j;

        //document.getElementById("txt_search_flag").value = '5';
        j = document.getElementById("A2");
        j.click();

    }


</script>
<style type="text/css">
    s .style50
    {
        height: 29px;
    }

    a:link, a:visited
    {
        color: #034af3;
    }

    .style7
    {
        height: 29px;
    }

    .style33
    {
        height: 29px;
    }

    .style34
    {
        width: 143px;
        height: 29px;
    }

    .style81
    {
        height: 29px;
        width: 296px;
    }

    .style85
    {
        height: 29px;
        width: 100px;
    }

    .style90
    {
        width: 296px;
    }

    .style91
    {
        width: 100px;
    }

    .style92
    {
        width: 143px;
    }

    .style80
    {
        width: 113px;
    }

    .style74
    {
        height: 31px;
    }

    .style93
    {
        width: 110px;
    }

    .style94
    {
        height: 29px;
        width: 110px;
    }

    .style96
    {
        width: 163px;
    }

    .style97
    {
        width: 424px;
    }

    .style98
    {
        height: 31px;
        width: 224px;
    }
</style>


<dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0"
    Theme="Default" Width="1100px">
    <TabPages>
        <dx:TabPage Name="1" Text="الكتب و المناهج">
            <ContentCollection>
                <dx:ContentControl ID="ContentControl1" runat="server" BackColor="#E6EEFF" SupportsDisabledAttribute="True">
                    <table border="1" cellspacing="1" dir="rtl" frame="border" style="margin: auto 0px auto auto; padding: inherit; border: thin solid #FFFFFF; width: 81%; line-height: normal; vertical-align: middle; table-layout: auto;">
                        <tr>
                            <td class="style36" dir="rtl" style="border: 1px none #FFFFFF">
                                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="school_activities_DS1" KeyFieldName="school_code;activity_ser" Theme="Default" Width="1100px">
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                            <EditButton Text="تعديل" Visible="True">
                                            </EditButton>
                                            <NewButton Text="جديد" Visible="True">
                                            </NewButton>
                                            <DeleteButton Text="الغاء" Visible="True">
                                            </DeleteButton>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="school_code" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="activity_ser" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="السنة الدراسية" FieldName="acad_year_code" ShowInCustomizationForm="True" VisibleIndex="4">
                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="acad_year_codes_DS" EnableCallbackMode="True" EnableClientSideAPI="True" TextField="acad_year_name" ValueField="acad_year_code" ValueType="System.Int64" IncrementalFilteringMode="Contains">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                            <HeaderStyle VerticalAlign="Middle" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn FieldName="activity_type" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="المرحلة الدراسية" FieldName="grade_code" ShowInCustomizationForm="True" VisibleIndex="6">
                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="grades_setup_DS" EnableCallbackMode="True" EnableClientSideAPI="True" TextField="grade_name_ar" ValueField="grade_code" ValueType="System.Int64" IncrementalFilteringMode="Contains">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn Caption="التكلفة الاجمالية" FieldName="cost_1" ShowInCustomizationForm="True" VisibleIndex="26">
                                            <PropertiesTextEdit MaxLength="15">
                                                <MaskSettings IncludeLiterals="DecimalSymbol" />
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="notes_1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="38">
                                            <PropertiesMemoEdit>
                                            </PropertiesMemoEdit>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataMemoColumn>
                                        <dx:GridViewDataTextColumn Caption="عدد الطلبة" FieldName="beneficiaries" ShowInCustomizationForm="True" VisibleIndex="9">
                                            <PropertiesTextEdit MaxLength="3">
                                                <ValidationSettings>
                                                    <RegularExpression ErrorText="برجاء ادخال ارقام فقط" ValidationExpression="^(?=.*\d)\d*(?:)?$" />
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="الصف" FieldName="class_code" ShowInCustomizationForm="True" VisibleIndex="10">
                                            <PropertiesComboBox DataSourceID="class_codes_DS" TextField="class_name_ar" ValueField="class_code" IncrementalFilteringMode="Contains">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="العملة" FieldName="currency_code" ShowInCustomizationForm="True" VisibleIndex="28">
                                            <PropertiesComboBox DataSourceID="currency_tab_DS" TextField="currency_descrar" ValueField="currency_code" IncrementalFilteringMode="Contains">
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn Caption="عدد الكتب" FieldName="books_count" ShowInCustomizationForm="True" VisibleIndex="22">
                                            <PropertiesTextEdit MaxLength="3">
                                                <ValidationSettings>
                                                    <RegularExpression ErrorText="برجاء ادخال ارقام فقط" ValidationExpression="^(?=.*\d)\d*(?:)?$" />
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ التنفيذ" FieldName="exec_date" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="المرفقات" ShowInCustomizationForm="True" UnboundType="String" VisibleIndex="40">
                                            <Settings AllowAutoFilter="False" />
                                            <EditFormSettings Visible="False" />
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="hyperLink_attach" runat="server" OnInit="hyperLink_attach_Init" Text="المرفقات">
                                                </dx:ASPxHyperLink>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="التوفر" ShowInCustomizationForm="True" VisibleIndex="7" Visible="False" FieldName="availability">
                                            <PropertiesComboBox IncrementalFilteringMode="Contains">
                                                <Items>
                                                    <dx:ListEditItem Text="متوفرة" Value="1" />
                                                    <dx:ListEditItem Text="متوفرة جزئيا" Value="2" />
                                                    <dx:ListEditItem Text="غير متوفرة" Value="3" />
                                                </Items>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="حالة التغطية" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False" FieldName="coverage">
                                            <PropertiesComboBox IncrementalFilteringMode="Contains">
                                                <Items>
                                                    <dx:ListEditItem Text="ضمن الرسوم" Value="1" />
                                                    <dx:ListEditItem Text="مجانية" Value="2" />
                                                    <dx:ListEditItem Text="حكومية" Value="3" />
                                                </Items>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="32" FieldName="status">
                                            <PropertiesComboBox DataSourceID="ODS_Status" IncrementalFilteringMode="Contains" TextField="NameAr" ValueField="ID">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="سبب حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="34" FieldName="status_reason" Visible="False">
                                            <PropertiesComboBox DataSourceID="reasons_tab_DS4" IncrementalFilteringMode="Contains" TextField="reason_ar" ValueField="reason_code">
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="36" FieldName="status_date" Visible="False">
                                            <PropertiesDateEdit>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesDateEdit>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="الماده" ShowInCustomizationForm="True" VisibleIndex="11" FieldName="subject">
                                            <PropertiesComboBox DataSourceID="DS_schools_subjects" IncrementalFilteringMode="Contains" TextField="subject_name_ar" ValueField="subject_id">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn Caption="عدد الكتب المطلوب شراؤها" ShowInCustomizationForm="True" VisibleIndex="24" FieldName="required_purchase_count" Visible="False">
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="تكلفة الكتاب (الوحدة)" ShowInCustomizationForm="True" VisibleIndex="30" ReadOnly="True" Visible="False">
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="اسم الكتاب" FieldName="Name" ShowInCustomizationForm="True" VisibleIndex="12">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior ConfirmDelete="True" />
                                    <SettingsPager PageSize="5">
                                        <PageSizeItemSettings Caption="عدد الصفحات : " Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <SettingsEditing EditFormColumnCount="4" />
                                    <Settings ShowFilterRow="True" />
                                    <SettingsText CommandCancel="الغاء" CommandUpdate="حفظ" />
                                </dx:ASPxGridView>
                            </td>
                        </tr>
                    </table>
                    <br />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="الزي">
            <ContentCollection>
                <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxGridView ID="ASPxGridView6" runat="server" AutoGenerateColumns="False" DataSourceID="school_activities_DS7" KeyFieldName="school_code;activity_ser" Theme="Default" Width="1100px">
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                <EditButton Text="تعديل" Visible="True">
                                </EditButton>
                                <NewButton Text="جديد" Visible="True">
                                </NewButton>
                                <DeleteButton Text="الغاء" Visible="True">
                                </DeleteButton>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="school_code" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="activity_ser" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="السنة الدراسية" FieldName="acad_year_code" ShowInCustomizationForm="True" VisibleIndex="3">
                                <PropertiesComboBox CallbackPageSize="10" DataSourceID="acad_year_codes_DS" EnableCallbackMode="True" EnableClientSideAPI="True" TextField="acad_year_name" ValueField="acad_year_code" ValueType="System.Int64" IncrementalFilteringMode="Contains">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesComboBox>
                                <HeaderStyle VerticalAlign="Middle" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn FieldName="activity_type" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="المرحلة الدراسية" FieldName="grade_code" ShowInCustomizationForm="True" VisibleIndex="5">
                                <PropertiesComboBox CallbackPageSize="10" DataSourceID="grades_setup_DS" EnableCallbackMode="True" EnableClientSideAPI="True" TextField="grade_name_ar" ValueField="grade_code" ValueType="System.Int64" IncrementalFilteringMode="Contains">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn Caption="التكلفة الاجمالية" FieldName="cost_1" ShowInCustomizationForm="True" VisibleIndex="7">
                                <PropertiesTextEdit MaxLength="15">
                                    <MaskSettings IncludeLiterals="DecimalSymbol" />
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="notes_1" ShowInCustomizationForm="True" VisibleIndex="36" Visible="False">
                                <PropertiesMemoEdit>
                                </PropertiesMemoEdit>
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataMemoColumn>
                            <dx:GridViewDataTextColumn Caption="عدد المستفيدين" FieldName="beneficiaries" ShowInCustomizationForm="True" VisibleIndex="6">
                                <PropertiesTextEdit>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="العملة" FieldName="currency_code" ShowInCustomizationForm="True" VisibleIndex="9">
                                <PropertiesComboBox DataSourceID="currency_tab_DS" TextField="currency_descrar" ValueField="currency_code" IncrementalFilteringMode="Contains">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataDateColumn Caption="تاريخ التنفيذ" FieldName="exec_date" ShowInCustomizationForm="True" VisibleIndex="3">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="المرفقات" ShowInCustomizationForm="True" UnboundType="String" VisibleIndex="40">
                                <Settings AllowAutoFilter="False" />
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <dx:ASPxHyperLink ID="hyperLink_attach_2" runat="server" OnInit="hyperLink_attach_2_Init" Text="المرفقات">
                                    </dx:ASPxHyperLink>
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="التوفر" ShowInCustomizationForm="True" VisibleIndex="7" Visible="False" FieldName="availability">
                                <PropertiesComboBox IncrementalFilteringMode="Contains">
                                    <Items>
                                        <dx:ListEditItem Text="متوفرة" Value="1" />
                                        <dx:ListEditItem Text="متوفرة جزئيا" Value="2" />
                                        <dx:ListEditItem Text="غير متوفرة" Value="3" />
                                    </Items>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="حالة التغطية" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False" FieldName="coverage">
                                <PropertiesComboBox IncrementalFilteringMode="Contains">
                                    <Items>
                                        <dx:ListEditItem Text="ضمن الرسوم" Value="1" />
                                        <dx:ListEditItem Text="مجانية" Value="2" />
                                        <dx:ListEditItem Text="حكومية" Value="3" />
                                    </Items>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="30" FieldName="status">
                                <PropertiesComboBox DataSourceID="ODS_Status" IncrementalFilteringMode="Contains" TextField="NameAr" ValueField="ID">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="سبب حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="32" FieldName="status_reason" Visible="False">
                                <PropertiesComboBox DataSourceID="reasons_tab_DS4" IncrementalFilteringMode="Contains" TextField="reason_ar" ValueField="reason_code">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataDateColumn Caption="تاريخ حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="34" FieldName="status_date" Visible="False">
                                <PropertiesDateEdit>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesDateEdit>
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataComboBoxColumn Caption="نوع الزي" ShowInCustomizationForm="True" VisibleIndex="11" FieldName="subject">
                                <PropertiesComboBox IncrementalFilteringMode="Contains">
                                    <Items>
                                        <dx:ListEditItem Text="قميص" Value="1" />
                                        <dx:ListEditItem Text="بنطلون" Value="2" />
                                        <dx:ListEditItem Text="نطلون و قميص" Value="3" />
                                    </Items>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn Caption="العدد المطلوب شراؤه" ShowInCustomizationForm="True" VisibleIndex="11" FieldName="required_purchase_count" Visible="False">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="تكلفة الزي (الوحدة)" ShowInCustomizationForm="True" VisibleIndex="24" ReadOnly="True" Visible="False">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                        <SettingsPager PageSize="5">
                            <PageSizeItemSettings Caption="عدد الصفحات : " Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                            </PageSizeItemSettings>
                        </SettingsPager>
                        <SettingsEditing EditFormColumnCount="4" />
                        <Settings ShowFilterRow="True" />
                        <SettingsText CommandCancel="الغاء" CommandUpdate="حفظ" />
                    </dx:ASPxGridView>
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Name="2" Text="وسائل الايضاح">
            <ContentCollection>
                <dx:ContentControl ID="ContentControl3" runat="server" SupportsDisabledAttribute="True">
                    <table border="1" cellspacing="1" dir="rtl" frame="border" style="margin: auto 0px auto auto; padding: inherit; border: thin solid #FFFFFF; width: 81%; line-height: normal; vertical-align: middle; table-layout: auto;">
                        <tr>
                            <td class="style36" colspan="2" dir="rtl" style="border: 1px none #FFFFFF">
                                <dx:ASPxGridView ID="GRD_school_activity_2" runat="server" AutoGenerateColumns="False"
                                    DataSourceID="school_activities_DS2" EnableTheming="True" KeyFieldName="school_code;activity_ser"
                                    Theme="Default" Width="1100px">
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                            <EditButton Text="تعديل" Visible="True">
                                            </EditButton>
                                            <NewButton Text="جديد" Visible="True">
                                            </NewButton>
                                            <DeleteButton Text="الغاء" Visible="True">
                                            </DeleteButton>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="school_code" ReadOnly="True" ShowInCustomizationForm="True"
                                            Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="activity_ser" ReadOnly="True" ShowInCustomizationForm="True"
                                            Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="السنة الدراسية" FieldName="acad_year_code"
                                            ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="acad_year_codes_DS" EnableCallbackMode="True"
                                                EnableClientSideAPI="True" TextField="acad_year_name" ValueField="acad_year_code"
                                                ValueType="System.Int64" IncrementalFilteringMode="Contains">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn FieldName="activity_type" ShowInCustomizationForm="True"
                                            Visible="False" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="وسائل الايضاح" FieldName="type_1" ShowInCustomizationForm="True"
                                            VisibleIndex="5">
                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="school_tools_DS" EnableCallbackMode="True"
                                                EnableClientSideAPI="True" TextField="tool_type_name_ar" ValueField="school_tool_code"
                                                ValueType="System.Int64" IncrementalFilteringMode="Contains">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn Caption="العدد" FieldName="count_1" ShowInCustomizationForm="True"
                                            VisibleIndex="6">
                                            <PropertiesTextEdit MaxLength="4">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="التكلفة الاجمالية" FieldName="cost_1" ShowInCustomizationForm="True"
                                            VisibleIndex="7">
                                            <PropertiesTextEdit DisplayFormatString="g" MaxLength="8">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="notes_1" ShowInCustomizationForm="True"
                                            VisibleIndex="34" Visible="False">
                                            <PropertiesMemoEdit>
                                            </PropertiesMemoEdit>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataMemoColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ التنفيذ" FieldName="exec_date" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="المرفقات" ShowInCustomizationForm="True" UnboundType="String" VisibleIndex="40">
                                            <Settings AllowAutoFilter="False" />
                                            <EditFormSettings Visible="False" />
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="hyperLink_attach_3" runat="server" OnInit="hyperLink_attach_3_Init" Text="المرفقات">
                                                </dx:ASPxHyperLink>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="التوفر" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False" FieldName="availability">
                                            <PropertiesComboBox IncrementalFilteringMode="Contains">
                                                <Items>
                                                    <dx:ListEditItem Text="متوفرة" Value="1" />
                                                    <dx:ListEditItem Text="متوفرة جزئيا" Value="2" />
                                                    <dx:ListEditItem Text="غير متوفرة" Value="3" />
                                                    <dx:ListEditItem Text="متوفرة محليا" Value="4" />
                                                </Items>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="حالة التغطية" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False" FieldName="coverage">
                                            <PropertiesComboBox IncrementalFilteringMode="Contains">
                                                <Items>
                                                    <dx:ListEditItem Text="ضمن الرسوم" Value="1" />
                                                    <dx:ListEditItem Text="مجانية" Value="2" />
                                                    <dx:ListEditItem Text="حكومية" Value="3" />
                                                </Items>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="24" FieldName="status">
                                            <PropertiesComboBox DataSourceID="ODS_Status" IncrementalFilteringMode="Contains" TextField="NameAr" ValueField="ID">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="سبب حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="30" FieldName="status_reason" Visible="False">
                                            <PropertiesComboBox DataSourceID="reasons_tab_DS4" IncrementalFilteringMode="Contains" TextField="reason_ar" ValueField="reason_code">
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="32" FieldName="status_date" Visible="False">
                                            <PropertiesDateEdit>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesDateEdit>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="العدد المطلوب شراؤه" ShowInCustomizationForm="True" VisibleIndex="11" FieldName="required_purchase_count" Visible="False">
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="تكلفة الوسيلة (الوحدة)" ShowInCustomizationForm="True" VisibleIndex="7" ReadOnly="True" Visible="False">
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                                    <SettingsPager PageSize="5">
                                        <PageSizeItemSettings Caption="عدد الصفحات : " Items="5, 10, 20, 50, 100, 200" ShowAllItem="True"
                                            Visible="True">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <SettingsEditing EditFormColumnCount="4" />
                                    <Settings ShowFilterRow="True" />
                                    <SettingsText CommandCancel="الغاء" CommandUpdate="حفظ" />
                                </dx:ASPxGridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="style36" dir="rtl" style="border: 1px none #FFFFFF">&nbsp;
                            </td>
                            <td class="style36" dir="rtl" style="border: 1px none #FFFFFF">
                                <br />
                            </td>
                        </tr>
                    </table>
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Name="3" Text="المكتبات">
            <ContentCollection>
                <dx:ContentControl ID="ContentControl4" runat="server" SupportsDisabledAttribute="True">
                    <table style="width: 81%;">
                        <tr>
                            <td colspan="3">
                                <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="school_activities_DS3"
                                    KeyFieldName="school_code;activity_ser" Theme="Default" Width="900px">
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                            <EditButton Text="تعديل" Visible="True">
                                            </EditButton>
                                            <NewButton Text="جديد" Visible="True">
                                            </NewButton>
                                            <DeleteButton Text="الغاء" Visible="True">
                                            </DeleteButton>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="school_code" ReadOnly="True" ShowInCustomizationForm="True"
                                            Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="activity_ser" ReadOnly="True" ShowInCustomizationForm="True"
                                            Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="السنة الدراسية" FieldName="acad_year_code"
                                            ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="acad_year_codes_DS" EnableCallbackMode="True"
                                                EnableClientSideAPI="True" TextField="acad_year_name" ValueField="acad_year_code"
                                                ValueType="System.Int64">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn FieldName="activity_type" ShowInCustomizationForm="True"
                                            Visible="False" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="اسم الكتاب" FieldName="Name" ShowInCustomizationForm="True"
                                            VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="العدد" FieldName="count_1" ShowInCustomizationForm="True"
                                            VisibleIndex="6">
                                            <PropertiesTextEdit MaxLength="4">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataSpinEditColumn Caption=" التكلفة الاجمالية" FieldName="cost_1" ShowInCustomizationForm="True"
                                            VisibleIndex="7">
                                            <PropertiesSpinEdit DisplayFormatString="g" MaxLength="8">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesSpinEdit>
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="notes_1" ShowInCustomizationForm="True"
                                            VisibleIndex="32" Visible="False">
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataMemoColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ التنفيذ" FieldName="exec_date" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="المرفقات" ShowInCustomizationForm="True" UnboundType="String" VisibleIndex="40">
                                            <Settings AllowAutoFilter="False" />
                                            <EditFormSettings Visible="False" />
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="hyperLink_attach_4" runat="server" OnInit="hyperLink_attach_4_Init" Text="المرفقات">
                                                </dx:ASPxHyperLink>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="التوفر" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False" FieldName="availability">
                                            <PropertiesComboBox IncrementalFilteringMode="Contains">
                                                <Items>
                                                    <dx:ListEditItem Text="متوفرة" Value="1" />
                                                    <dx:ListEditItem Text="متوفرة جزئيا" Value="2" />
                                                    <dx:ListEditItem Text="غير متوفرة" Value="3" />
                                                    <dx:ListEditItem Text="متوفرة محليا" Value="4" />
                                                </Items>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="الصيانة" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False" FieldName="coverage">
                                            <PropertiesComboBox IncrementalFilteringMode="Contains">
                                                <Items>
                                                    <dx:ListEditItem Text="تحتاج تجديد" Value="1" />
                                                    <dx:ListEditItem Text="لا تحتاج تجديد" Value="2" />
                                                </Items>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="11" FieldName="status">
                                            <PropertiesComboBox DataSourceID="ODS_Status" IncrementalFilteringMode="Contains" TextField="NameAr" ValueField="ID">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="سبب حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="24" FieldName="status_reason" Visible="False">
                                            <PropertiesComboBox DataSourceID="reasons_tab_DS4" IncrementalFilteringMode="Contains" TextField="reason_ar" ValueField="reason_code">
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="30" FieldName="status_date" Visible="False">
                                            <PropertiesDateEdit>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesDateEdit>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="العدد المطلوب شراؤه" ShowInCustomizationForm="True" VisibleIndex="8" FieldName="required_purchase_count" Visible="False">
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="تكلفة الكتاب (الوحدة)" ShowInCustomizationForm="True" VisibleIndex="7" ReadOnly="True" Visible="False">
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                                    <SettingsPager PageSize="5">
                                        <PageSizeItemSettings Caption="عدد الصفحات : " Items="5, 10, 20, 50, 100, 200" ShowAllItem="True"
                                            Visible="True">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <SettingsEditing EditFormColumnCount="4" />
                                    <Settings ShowFilterRow="True" />
                                    <SettingsText CommandCancel="الغاء" CommandUpdate="حفظ" />
                                </dx:ASPxGridView>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>&nbsp;
                            </td>
                        </tr>
                    </table>
                    <br />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Name="4" Text="دعم المدارس">
            <ContentCollection>
                <dx:ContentControl ID="ContentControl5" runat="server" SupportsDisabledAttribute="True">
                    <table style="width: 74%;">
                        <tr>
                            <td>
                                <dx:ASPxGridView ID="GRD_school_activity_4" runat="server" AutoGenerateColumns="False"
                                    DataSourceID="school_activities_DS4" KeyFieldName="school_code;activity_ser"
                                    Theme="Default" Width="1100px">
                                    <TotalSummary>
                                        <dx:ASPxSummaryItem DisplayFormat="الاجمالي الكلي المطلوب = {0:n3}" FieldName="cost_1" ShowInColumn="اجمالي التكلفة الكلي" ShowInGroupFooterColumn="اجمالي التكلفة الكلي" SummaryType="Sum" />
                                    </TotalSummary>
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                            <EditButton Text="تعديل" Visible="True">
                                            </EditButton>
                                            <NewButton Text="جديد" Visible="True">
                                            </NewButton>
                                            <DeleteButton Text="الغاء" Visible="True">
                                            </DeleteButton>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="school_code" ReadOnly="True" ShowInCustomizationForm="True"
                                            Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="activity_ser" ReadOnly="True" ShowInCustomizationForm="True"
                                            Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="السنة الدراسية" FieldName="acad_year_code"
                                            ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="acad_year_codes_DS" EnableCallbackMode="True"
                                                EnableClientSideAPI="True" TextField="acad_year_name" ValueField="acad_year_code"
                                                ValueType="System.Int64" IncrementalFilteringMode="Contains">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn FieldName="activity_type" ShowInCustomizationForm="True"
                                            Visible="False" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="الدعم المطلوب" FieldName="Name" ShowInCustomizationForm="True"
                                            VisibleIndex="5">
                                            <PropertiesTextEdit
                                                EnableClientSideAPI="True">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="اجمالي التكلفة الكلي" FieldName="cost_1" ShowInCustomizationForm="True"
                                            VisibleIndex="6">
                                            <PropertiesTextEdit DisplayFormatString="g" MaxLength="8">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="notes_1" ShowInCustomizationForm="True"
                                            VisibleIndex="30" Visible="False">
                                            <PropertiesMemoEdit>
                                            </PropertiesMemoEdit>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataMemoColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ التنفيذ" FieldName="exec_date" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="المرفقات" ShowInCustomizationForm="True" UnboundType="String" VisibleIndex="40">
                                            <Settings AllowAutoFilter="False" />
                                            <EditFormSettings Visible="False" />
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="hyperLink_attach_5" runat="server" OnInit="hyperLink_attach_5_Init" Text="المرفقات">
                                                </dx:ASPxHyperLink>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="الاحتياج" ShowInCustomizationForm="True" VisibleIndex="8" Visible="False" FieldName="availability">
                                            <PropertiesComboBox IncrementalFilteringMode="Contains">
                                                <Items>
                                                    <dx:ListEditItem Text="تحتاج" Value="1" />
                                                    <dx:ListEditItem Text="لا تحتاج" Value="2" />
                                                </Items>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="8" FieldName="status">
                                            <PropertiesComboBox DataSourceID="ODS_Status" IncrementalFilteringMode="Contains" TextField="NameAr" ValueField="ID">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="سبب حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="11" Visible="False" FieldName="status_reason">
                                            <PropertiesComboBox IncrementalFilteringMode="Contains" DataSourceID="reasons_tab_DS4" TextField="reason_ar" ValueField="reason_code">
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="24" FieldName="status_date" Visible="False">
                                            <PropertiesDateEdit>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesDateEdit>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="العدد" ShowInCustomizationForm="True" VisibleIndex="7" FieldName="books_count" Visible="False">
                                            <PropertiesTextEdit>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="اجمالي سعر الوحده" ShowInCustomizationForm="True" VisibleIndex="7" ReadOnly="True" FieldName="unit_cost">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                                    <SettingsPager PageSize="5">
                                        <PageSizeItemSettings Caption="عدد الصفحات : " Items="5, 10, 20, 50, 100, 200" ShowAllItem="True"
                                            Visible="True">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <SettingsEditing EditFormColumnCount="4" />
                                    <Settings ShowFilterRow="True" ShowFooter="True" />
                                    <SettingsText CommandCancel="الغاء" CommandUpdate="حفظ" />
                                </dx:ASPxGridView>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Name="5" Text="أنشطة مدرسية">
            <ContentCollection>
                <dx:ContentControl ID="ContentControl6" runat="server" SupportsDisabledAttribute="True">
                    <table border="1" cellspacing="1" dir="rtl" frame="border" style="margin: auto 0px auto auto; padding: inherit; border: thin solid #FFFFFF; width: 89%; line-height: normal; vertical-align: middle; table-layout: auto;">
                        <tr>
                            <td class="style96" dir="rtl" style="border: 1px none #FFFFFF" colspan="2">
                                <dx:ASPxGridView ID="ASPxGridView3" runat="server" AutoGenerateColumns="False" DataSourceID="school_activities_DS5" KeyFieldName="school_code;activity_ser" Theme="Default" Width="1100px">
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                            <EditButton Text="تعديل" Visible="True">
                                            </EditButton>
                                            <NewButton Text="جديد" Visible="True">
                                            </NewButton>
                                            <DeleteButton Text="الغاء" Visible="True">
                                            </DeleteButton>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="school_code" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="activity_ser" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="السنة الدراسية" FieldName="acad_year_code" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="acad_year_codes_DS" EnableCallbackMode="True" EnableClientSideAPI="True" TextField="acad_year_name" ValueField="acad_year_code" ValueType="System.Int64" IncrementalFilteringMode="Contains">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn FieldName="activity_type" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="اسم النشاط" FieldName="type_1" ShowInCustomizationForm="True" VisibleIndex="5">
                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="school_activity_codes_DS" EnableCallbackMode="True" EnableClientSideAPI="True" TextField="school_activity_name_ar" ValueField="school_activity_code" ValueType="System.Int64" IncrementalFilteringMode="Contains">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn Caption="عدد المستفيدين" FieldName="beneficiaries" ShowInCustomizationForm="True" VisibleIndex="6">
                                            <PropertiesTextEdit DisplayFormatString="g" MaxLength="8">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="التكلفة" FieldName="cost_1" ShowInCustomizationForm="True" VisibleIndex="7">
                                            <PropertiesTextEdit DisplayFormatString="g" MaxLength="3">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="notes_1" ShowInCustomizationForm="True" VisibleIndex="40" Visible="False">
                                            <PropertiesMemoEdit>
                                            </PropertiesMemoEdit>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataMemoColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ التنفيذ" FieldName="exec_date" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="المرفقات" ShowInCustomizationForm="True" UnboundType="String" VisibleIndex="42">
                                            <Settings AllowAutoFilter="False" />
                                            <EditFormSettings Visible="False" />
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="hyperLink_attach_6" runat="server" OnInit="hyperLink_attach_6_Init" Text="المرفقات">
                                                </dx:ASPxHyperLink>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="22" FieldName="status">
                                            <PropertiesComboBox IncrementalFilteringMode="Contains" DataSourceID="ODS_Status" TextField="NameAr" ValueField="ID">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="سبب حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="28" Visible="False" FieldName="status_reason">
                                            <PropertiesComboBox IncrementalFilteringMode="Contains" DataSourceID="reasons_tab_DS4" TextField="reason_ar" ValueField="reason_code">
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="38" FieldName="status_date" Visible="False">
                                            <PropertiesDateEdit>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesDateEdit>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="مكان تنفيذ النشاط" ShowInCustomizationForm="True" VisibleIndex="8" FieldName="place_1" Visible="False">
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="مدة النشاط" ShowInCustomizationForm="True" VisibleIndex="9" FieldName="days_num">
                                            <PropertiesTextEdit MaxLength="2">
                                                <ValidationSettings>
                                                    <RegularExpression ErrorText="برجاء ادخال ارقام فقط" ValidationExpression="^(?=.*\d)\d*(?:)?$" />
                                                </ValidationSettings>

                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                                    <SettingsPager PageSize="5">
                                        <PageSizeItemSettings Caption="عدد الصفحات : " Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <SettingsEditing EditFormColumnCount="4" />
                                    <Settings ShowFilterRow="True" ShowFooter="True" />
                                    <SettingsText CommandCancel="الغاء" CommandUpdate="حفظ" />
                                </dx:ASPxGridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="style96" dir="rtl" style="border: 1px none #FFFFFF">&nbsp;
                            </td>
                            <td class="style36" dir="rtl" style="border: 1px none #FFFFFF;">&nbsp;
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Name="6" Text="دورات للمدرسين">
            <ContentCollection>
                <dx:ContentControl ID="ContentControl7" runat="server" SupportsDisabledAttribute="True">
                    <table border="1" cellspacing="1" dir="rtl" frame="border" style="margin: auto 0px auto auto; padding: inherit; border: thin solid #FFFFFF; width: 98%; line-height: normal; vertical-align: middle; table-layout: auto;">
                        <tr>
                            <td class="style36" dir="rtl" style="border: 1px none #FFFFFF" colspan="2">
                                <dx:ASPxGridView ID="ASPxGridView4" runat="server" AutoGenerateColumns="False" DataSourceID="school_activity_DS6" KeyFieldName="school_code;activity_ser" Theme="Default" Width="1100px">
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                            <EditButton Text="تعديل" Visible="True">
                                            </EditButton>
                                            <NewButton Text="جديد" Visible="True">
                                            </NewButton>
                                            <DeleteButton Text="الغاء" Visible="True">
                                            </DeleteButton>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="school_code" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="activity_ser" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="السنة الدراسية" FieldName="acad_year_code" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="acad_year_codes_DS" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" TextField="acad_year_name" ValueField="acad_year_code" ValueType="System.Int64">
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn FieldName="activity_type" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="اسم الدورة" FieldName="type_1" ShowInCustomizationForm="True" VisibleIndex="5">
                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="course_codes_DS" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" TextField="course_name_ar" ValueField="course_code" ValueType="System.Int64">
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataTextColumn Caption="اجمالي التكلفة" FieldName="cost_1" ShowInCustomizationForm="True" VisibleIndex="6">
                                            <PropertiesTextEdit MaxLength="8">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="notes_1" ShowInCustomizationForm="True" VisibleIndex="38" Visible="False">
                                            <PropertiesMemoEdit>
                                            </PropertiesMemoEdit>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataMemoColumn>
                                        <dx:GridViewDataTextColumn Caption="مدة الدورة" FieldName="days_num" ShowInCustomizationForm="True" VisibleIndex="7">
                                            <PropertiesTextEdit MaxLength="3">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="عدد الحاضرين" FieldName="count_1" ShowInCustomizationForm="True" VisibleIndex="8">
                                            <PropertiesTextEdit MaxLength="3">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="مكان الدورة" FieldName="place_1" ShowInCustomizationForm="True" VisibleIndex="9">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataMemoColumn Caption="موضوع الدورة" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10" FieldName="Name">
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataMemoColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ التنفيذ" FieldName="exec_date" ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="المرفقات" ShowInCustomizationForm="True" UnboundType="String" VisibleIndex="42">
                                            <Settings AllowAutoFilter="False" />
                                            <EditFormSettings Visible="False" />
                                            <DataItemTemplate>
                                                <dx:ASPxHyperLink ID="hyperLink_attach_7" runat="server" OnInit="hyperLink_attach_7_Init" Text="المرفقات">
                                                </dx:ASPxHyperLink>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="11" FieldName="status">
                                            <PropertiesComboBox IncrementalFilteringMode="Contains" DataSourceID="ODS_Status" TextField="NameAr" ValueField="ID">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="سبب حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="22" Visible="False" FieldName="status_reason">
                                            <PropertiesComboBox IncrementalFilteringMode="Contains" DataSourceID="reasons_tab_DS4" TextField="reason_ar" ValueField="reason_code">
                                            </PropertiesComboBox>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ حالة الطلب" ShowInCustomizationForm="True" VisibleIndex="28" FieldName="status_date" Visible="False">
                                            <PropertiesDateEdit>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </PropertiesDateEdit>
                                            <EditFormSettings Visible="True" />
                                        </dx:GridViewDataDateColumn>
                                        <dx:GridViewDataTextColumn Caption="تكلفة الوحده" ShowInCustomizationForm="True" VisibleIndex="7" ReadOnly="True" FieldName="unit_cost">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                                    <SettingsPager PageSize="5">
                                        <PageSizeItemSettings Caption="عدد الصفحات : " Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <SettingsEditing EditFormColumnCount="4" />
                                    <Settings ShowFilterRow="True" ShowFooter="True" />
                                    <SettingsText CommandCancel="الغاء" CommandUpdate="حفظ" />
                                </dx:ASPxGridView>
                            </td>
                        </tr>
                        <tr>
                            <td class="style36" dir="rtl" style="border: 1px none #FFFFFF">&nbsp;
                            </td>
                            <td class="style36" dir="rtl" style="border: 1px none #FFFFFF">&nbsp;
                            </td>
                        </tr>
                    </table>
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
    </TabPages>
</dx:ASPxPageControl>


<div style="display: none">
    <table style="width: 100%; height: 139px;" dir="rtl">

        <tr>
            <td class="style50" dir="rtl">
                <a id="lnk_new" runat="server" href="" style="width: 72px; visibility: hidden; height: 24px">
                    <img alt="" border="0" src="../images/New_32x32.png" />
                </a><a id="A5" runat="server">
                    <img alt="" border="0" src="../images/Find_32x32.png" style="height: 32px; width: 32px;" />
                </a><a id="lnk_save" runat="server">
                    <img alt="" border="0" src="../images/Save_32x32.png" style="width: 32px; height: 32px;" />
                </a><a id="lnk_delete" runat="server" style="visibility: hidden; width: 72px; height: 1px">
                    <img alt="" border="0" src="../images/Delete_32x32.png" />
                </a>
            </td>
        </tr>
        <tr>
            <td class="style50" dir="rtl">
                <table border="1" cellspacing="1" dir="rtl" style="margin: auto 0px auto auto; padding: inherit; border: 1px solid #FFFFFF; width: 99%; line-height: normal; vertical-align: middle; table-layout: auto;">
                    <tr>
                        <td dir="rtl" style="border: 1px none #FFFFFF" class="style93">
                            <asp:Label ID="Label11" runat="server" Font-Names="Tahoma" Font-Size="10pt" Text="رقم الملف"
                                Width="103px" ForeColor="#003366"></asp:Label>
                        </td>
                        <td class="style90" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                            <asp:TextBox ID="txt_school_code" runat="server" BackColor="#FFFFCC" BorderColor="#CEE6FF"
                                BorderStyle="Solid" BorderWidth="1px" ClientIDMode="Static" Font-Names="Tahoma"
                                Font-Size="10pt" Height="24px" Width="90px" ForeColor="#003366" MaxLength="4"></asp:TextBox>
                        </td>
                        <td class="style91" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 160px;"
                            width="120">
                            <asp:LinkButton ID="A_search" runat="server"></asp:LinkButton>
                        </td>
                        <td dir="rtl" style="border: 1px none #FFFFFF">&nbsp;
                        </td>
                        <td dir="rtl" style="border: 1px none #FFFFFF">
                            <asp:LinkButton ID="A2" runat="server"></asp:LinkButton>
                        </td>
                        <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">&nbsp;
                        </td>
                        <td class="style92" dir="rtl" style="border: 1px none #FFFFFF">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style94" dir="rtl" style="border: 1px none #FFFFFF">
                            <asp:Label ID="Label12" runat="server" Font-Names="Tahoma" Font-Size="10pt" Text="اسم المؤسسة التعليمية-عربي"
                                Width="220px" ForeColor="#003366"></asp:Label>
                        </td>
                        <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;">
                            <asp:TextBox ID="txt_school_name_ar" runat="server" AutoPostBack="True" BorderColor="#CEE6FF"
                                BorderStyle="Solid" BorderWidth="1px" ClientIDMode="Static" Font-Names="Tahoma"
                                Font-Size="9pt" ForeColor="#000066" Height="24px" Width="500px" BackColor="#FFFFCC"
                                ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 160px;"
                            width="120" colspan="2">
                            <span>
                                <img id="btn_search" alt="Search by names" border="0" height="24" src="../images/Search-icon.png"
                                    style="visibility: visible; width: 24px; height: 22px" onclick="//open_search_names_scrn();" /></span>
                        </td>
                        <td class="style7" dir="rtl" style="border: 1px none #FFFFFF">&nbsp;
                        </td>
                        <td class="style33" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">&nbsp;
                        </td>
                        <td class="style34" dir="rtl" style="border: 1px none #FFFFFF">&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style94" dir="rtl" style="border: 1px none #FFFFFF">
                            <asp:Label ID="Label346" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#003366"
                                Text="اسم المؤسسة التعليمية-انجليزي" Width="220px"></asp:Label>
                        </td>
                        <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;">
                            <asp:TextBox ID="txt_school_name_en" runat="server" AutoPostBack="True" BorderColor="#CEE6FF"
                                BorderStyle="Solid" BorderWidth="1px" ClientIDMode="Static" Font-Names="Tahoma"
                                Font-Size="9pt" ForeColor="#000066" Height="24px" Width="500px" BackColor="#FFFFCC"
                                ReadOnly="True"></asp:TextBox>
                        </td>
                        <td class="style85" colspan="2" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 160px;"
                            width="120">&nbsp;
                        </td>
                        <td class="style7" dir="rtl" style="border: 1px none #FFFFFF">&nbsp;
                        </td>
                        <td class="style33" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">&nbsp;
                        </td>
                        <td class="style34" dir="rtl" style="border: 1px none #FFFFFF">&nbsp;
                        </td>
                    </tr>
                </table>
                <table style="width: 100%;">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                <br />
                <asp:SqlDataSource ID="school_activities_DS3" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    DeleteCommand="Delete_school_activities_1" DeleteCommandType="StoredProcedure"
                    InsertCommand="Insert_school_activities_2" InsertCommandType="StoredProcedure"
                    SelectCommand="Select_school_activities_3" SelectCommandType="StoredProcedure"
                    UpdateCommand="Update_school_activities_2" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter DefaultValue="3" Name="activity_type" Type="Int16" />
                        <asp:Parameter Name="type_1" Type="Int16" />
                        <asp:Parameter Name="count_1" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:Parameter Name="required_purchase_count" Type="Int32" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="coverage" Type="Int16" />
                        <asp:Parameter Name="availability" Type="Int16" />
                        <asp:Parameter Name="Name" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter Name="type_1" Type="Int16" />
                        <asp:Parameter Name="count_1" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:Parameter Name="required_purchase_count" Type="Int32" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="coverage" Type="Int16" />
                        <asp:Parameter Name="availability" Type="Int16" />
                        <asp:Parameter Name="Name" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="school_activities_DS4" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    DeleteCommand="Delete_school_activities_1" DeleteCommandType="StoredProcedure"
                    InsertCommand="Insert_school_activities_4" InsertCommandType="StoredProcedure"
                    SelectCommand="Select_school_activities_4" SelectCommandType="StoredProcedure"
                    UpdateCommand="Update_school_activities_4" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter DefaultValue="4" Name="activity_type" Type="Int16" />
                        <asp:Parameter Name="type_1" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Name="RETURN_VALUE" Type="Int32" Direction="ReturnValue" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="availability" Type="Int16" />
                        <asp:Parameter Name="books_count" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                            Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter Name="type_1" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Name="RETURN_VALUE" Type="Int32" Direction="ReturnValue" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="availability" Type="Int16" />
                        <asp:Parameter Name="books_count" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="school_activities_DS5" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    DeleteCommand="Delete_school_activities_1" DeleteCommandType="StoredProcedure"
                    InsertCommand="Insert_school_activities_5" InsertCommandType="StoredProcedure"
                    SelectCommand="Select_school_activities_5" SelectCommandType="StoredProcedure"
                    UpdateCommand="Update_school_activities_5" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RETURN_VALUE" Type="Int32" Direction="ReturnValue" />
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter Name="activity_type" Type="Int16" DefaultValue="5" />
                        <asp:Parameter Name="type_1" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="days_num" Type="Int16" />
                        <asp:Parameter Name="place_1" Type="String" />
                        <asp:Parameter Name="beneficiaries" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int32" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RETURN_VALUE" Type="Int32" Direction="ReturnValue" />
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter Name="type_1" Type="Int16" />
                        <asp:Parameter Name="count_1" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="days_num" Type="Int16" />
                        <asp:Parameter Name="place_1" Type="String" />
                        <asp:Parameter Name="beneficiaries" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="school_activity_DS6" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    DeleteCommand="Delete_school_activities_1" DeleteCommandType="StoredProcedure"
                    InsertCommand="Insert_school_activities_6" InsertCommandType="StoredProcedure"
                    SelectCommand="Select_school_activities_6" SelectCommandType="StoredProcedure"
                    UpdateCommand="Update_school_activities_6" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter DefaultValue="6" Name="activity_type" Type="Int16" />
                        <asp:Parameter Name="type_1" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Name="days_num" Type="Int16" />
                        <asp:Parameter Name="count_1" Type="Int16" />
                        <asp:Parameter Name="place_1" Type="String" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="availability" Type="Int16" />
                        <asp:Parameter Name="Name" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                            Type="Int16" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter Name="type_1" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Name="days_num" Type="Int16" />
                        <asp:Parameter Name="count_1" Type="Int16" />
                        <asp:Parameter Name="place_1" Type="String" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="availability" Type="Int16" />
                        <asp:Parameter Name="Name" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="school_activities_DS7" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    DeleteCommand="Delete_school_activities_1" DeleteCommandType="StoredProcedure"
                    InsertCommand="Insert_school_activities_7" InsertCommandType="StoredProcedure"
                    SelectCommand="Select_school_activities_7" SelectCommandType="StoredProcedure"
                    UpdateCommand="Update_school_activities_7" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RETURN_VALUE" Type="Int32" Direction="ReturnValue" />
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter Name="activity_type" Type="Int16" />
                        <asp:Parameter Name="grade_code" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Name="beneficiaries" Type="Int32" />
                        <asp:Parameter Name="currency_code" Type="Int16" />
                        <asp:Parameter Name="subject" Type="Int16" />
                        <asp:Parameter Name="required_purchase_count" Type="Int32" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="coverage" Type="Int16" />
                        <asp:Parameter Name="availability" Type="Int16" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RETURN_VALUE" Type="Int32" Direction="ReturnValue" />
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter Name="grade_code" Type="Int16" />
                        <asp:Parameter Name="class_code" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Name="beneficiaries" Type="Int32" />
                        <asp:Parameter Name="currency_code" Type="Int16" />
                        <asp:Parameter Name="books_count" Type="Int32" />
                        <asp:Parameter Name="subject" Type="Int16" />
                        <asp:Parameter Name="required_purchase_count" Type="Int32" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="coverage" Type="Int16" />
                        <asp:Parameter Name="availability" Type="Int16" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="school_activities_DS2" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    DeleteCommand="Delete_school_activities_1" DeleteCommandType="StoredProcedure"
                    InsertCommand="Insert_school_activities_2" InsertCommandType="StoredProcedure"
                    SelectCommand="Select_school_activities_2" SelectCommandType="StoredProcedure"
                    UpdateCommand="Update_school_activities_2" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter DefaultValue="2" Name="activity_type" Type="Int16" />
                        <asp:Parameter Name="type_1" Type="Int16" />
                        <asp:Parameter Name="count_1" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:Parameter Name="required_purchase_count" Type="Int32" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="coverage" Type="Int16" />
                        <asp:Parameter Name="availability" Type="Int16" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter Name="type_1" Type="Int16" />
                        <asp:Parameter Name="count_1" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:Parameter Name="required_purchase_count" Type="Int32" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="coverage" Type="Int16" />
                        <asp:Parameter Name="availability" Type="Int16" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="school_activities_DS1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    DeleteCommand="Delete_school_activities_1" DeleteCommandType="StoredProcedure"
                    InsertCommand="Insert_school_activities_1" InsertCommandType="StoredProcedure"
                    SelectCommand="Select_school_activities_1" SelectCommandType="StoredProcedure"
                    UpdateCommand="Update_school_activities_1" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RETURN_VALUE" Type="Int32" Direction="ReturnValue" />
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter Name="activity_type" Type="Int16" />
                        <asp:Parameter Name="grade_code" Type="Int16" />
                        <asp:Parameter Name="class_code" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Name="beneficiaries" Type="Int32" />
                        <asp:Parameter Name="books_count" Type="Int32" />
                        <asp:Parameter Name="currency_code" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter Name="required_purchase_count" Type="Int32" />
                        <asp:Parameter Name="subject" Type="Int32" />
                        <asp:Parameter Name="coverage" Type="Int16" />
                        <asp:Parameter Name="availability" Type="Int16" />
                        <asp:Parameter Name="Name" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="RETURN_VALUE" Type="Int32" Direction="ReturnValue" />
                        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int16" />
                        <asp:Parameter Name="activity_ser" Type="Int16" />
                        <asp:Parameter Name="acad_year_code" Type="Int16" />
                        <asp:Parameter Name="grade_code" Type="Int16" />
                        <asp:Parameter Name="class_code" Type="Int16" />
                        <asp:Parameter Name="cost_1" Type="Decimal" />
                        <asp:Parameter Name="notes_1" Type="String" />
                        <asp:Parameter Name="beneficiaries" Type="Int32" />
                        <asp:Parameter Name="currency_code" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="exec_date" />
                        <asp:Parameter Name="status" Type="Int16" />
                        <asp:Parameter Name="status_reason" Type="Int16" />
                        <asp:Parameter DbType="Date" Name="status_date" />
                        <asp:Parameter Name="required_purchase_count" Type="Int32" />
                        <asp:Parameter Name="subject" Type="Int32" />
                        <asp:Parameter Name="coverage" Type="Int16" />
                        <asp:Parameter Name="availability" Type="Int16" />
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="books_count" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="acad_year_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="SELECT * FROM [academic_year_codes] where acad_year_code &gt; 0"></asp:SqlDataSource>
                <asp:SqlDataSource ID="grades_setup_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="SELECT * FROM [grades_codes] where grade_code &gt;0"></asp:SqlDataSource>
                <asp:SqlDataSource ID="class_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="SELECT * FROM [classes_tab] where class_code &gt;0 "></asp:SqlDataSource>
                <asp:SqlDataSource ID="school_tools_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="Select_school_tools_types" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="school_activity_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="Select_school_activity_codes" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:Parameter DefaultValue="5" Name="activity_cat" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="Select_school_activity_codes_6" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="Select_school_activity_codes" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:Parameter DefaultValue="6" Name="activity_cat" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="course_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="Select_course_codes" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="reasons_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="Select_reason_tab" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="9" Name="reason_cate" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="SELECT * FROM [academic_year_codes] where acad_year_code &gt;0"></asp:SqlDataSource>

                <asp:SqlDataSource ID="currency_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="Select_currency_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</div>


<asp:ObjectDataSource ID="ODS_Status" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Load" TypeName="DirectAid.OrphanRequestStatus"></asp:ObjectDataSource>
<asp:SqlDataSource ID="reasons_tab_DS4" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="Select_reason_tab" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="4" Name="reason_cate" Type="Int16" />
    </SelectParameters>
</asp:SqlDataSource>





<asp:SqlDataSource ID="DS_schools_subjects" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [schools_subjects]"></asp:SqlDataSource>






