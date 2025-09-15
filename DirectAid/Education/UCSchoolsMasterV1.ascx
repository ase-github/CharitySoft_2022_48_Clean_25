<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCSchoolsMasterV1.ascx.vb" Inherits="DirectAid.UCSchoolsMasterV1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>





<%--<%@ Register Src="Controls/education/ctrl_StudentsSearch.ascx" TagName="ctrl_StudentsSearch"
    TagPrefix="uc1" %>--%>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>



<script type="text/javascript">
    function openStuentsCountAndTuition() {
        var id = ASPxButton_FindByKey.GetValue();//document.getElementById("txt_hdn_scode").value;
        //alert(txt_hdn_scode.GetValue());
        var url = "SchoolsFeesAndStudCount.aspx?SchoolID=";
        if (id != "" && id != null) {
            url += id;
            openTransfers(url, "width=1150,height=400,resizable=no,location=no");
        }
    }
    function openBasicInfo() {
        var id = ASPxButton_FindByKey.GetValue();//document.getElementById("txt_school_code").value;
        var url = "SchoolsBasicInfo.aspx?SchoolID=";
        if (id != "" && id != null) {
            url += id;
            openTransfers(url, "width=1150,height=400,resizable=no,location=no");
        }
    }
    function openActivities() {
        var id = ASPxButton_FindByKey.GetValue();//document.getElementById("txt_school_code").value;
        var url = "SchoolActivities.aspx?SchoolID=";
        if (id != "" && id != null) {
            url += id;
            openTransfers(url, "width=1150,height=400,resizable=no,location=no");
        }
    }
    function openBuildings() {
        var id = ASPxButton_FindByKey.GetValue();//document.getElementById("txt_school_code").value;
        var url = "SchoolsBuildings.aspx?SchoolID=";
        if (id != "" && id != null) {
            url += id;
            openTransfers(url, "width=1150,height=400,resizable=no,location=no");
        }
    }
    function openAttachments() {
        var id = ASPxButton_FindByKey.GetValue();//document.getElementById("txt_school_code").value;
        var url = "EducationAttachments.aspx?mod=11&app_ser=";
        if (id != "" && id != null) {
            url += id;
            openTransfers(url, "width=1150,height=400,resizable=no,location=no");
        }
    }
    function openEmployees() {
        var id = ASPxButton_FindByKey.GetValue();//document.getElementById("txt_school_code").value;
        var url = "SchoolsEmployeesModal.aspx?SchoolID=";
        if (id != "" && id != null) {
            url += id;
            openTransfers(url, "width=1150,height=400,resizable=no,location=no");
        }
    }
    function openTransfers(url, options) {
        //var floatingWindow;
        //floatingWindow = open("", "", options);
        //floatingWindow.location.href = url;
        //return false;
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
        //alert('configureload');
        LoadingPanel.Show();
        //alert('configureload');
        Callback.PerformCallback();
        //LoadingPanel.Hide();
        //alert('configureload');
    }
    function configureLoadingForSearchPopup() {
        ASPxPopupControl1.Hide();
        Callback.PerformCallback();
        LoadingPanel.Show();
    }
    function hideDialog() {
        ASPxPopupControl1.Hide();
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


        $('#txt_est_year').keydown(function (event) {
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


        $('#txt_years_num').keydown(function (event) {
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
        var key = event.keyCode;
        var i = document.getElementById("A_search");

        if (key == 13) {
            i.click();
        }
    } //main
    function Save_Begin() {
        if (ASPxClientEdit.ValidateGroup("Save")) {
            ASPxButton_Save.SetEnabled(false);
            ASPxLoadingPanel1.Show();
            ASPxCallback_Save.PerformCallback(null);
        }
    }
    function Save_End(e) {

        var result = e.result;

        if (!isNaN(result)) {
            alert("تم الحفظ");
            //ASPxButton_FindByKey.SetValue(result);
        }
        else {
            alert(result);
        }

        ASPxButton_Save.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }
    function Save_Error(e) {
        //alert(e.message);
        ASPxButton_Save.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }
    function FindByKey_Begin() {
        if (ASPxButton_FindByKey.GetValue() != null) {
            ASPxButton_FindByKey.SetEnabled(false);
            ASPxLoadingPanel1.Show();
            //ASPxCallback_Print.PerformCallback(null);
            OpenRecord(ASPxButton_FindByKey.GetValue());
        }
    }
    function OpenRecord(recordID) {

        document.location.href = 'SchoolsMaster.aspx?scode=' + recordID;
        document.URL
    }
    function createNew() {
        document.location.href = 'SchoolsMaster.aspx?t=New';
        document.URL
    }
    function ButtonEditClickByEnter(s, e) {
        if (e.htmlEvent.keyCode == 13) {
            ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
            s.GetButton(0).click();
        }
    }
</script>
<script type="text/javascript">
    function open_search_names_scrn() {

        var i;
        var j;
        var k;
        var floatingWindow;
        i = (event.keyCode);
        floatingWindow = open("", "", "width=800,height=400");
        floatingWindow.location.href = "search_screen.aspx?searchFLAG=1";
        return false;
    }

    function Get_school_info() {

        var j;

        //document.getElementById("txt_search_flag").value = '5';
        j = document.getElementById("A2");
        j.click();

    }


</script>
<script type="text/javascript">
    function GetDateDifference() {

        var startDate = ASPxClientDateEdit.Cast("StartDate").GetDate();
        var endDate = ASPxClientDateEdit.Cast("EndDate").GetDate();
        var days = null;

        if (startDate != null && endDate != null) {
            var millisecondsPerDay = 1000 * 60 * 60 * 24;
            var millisBetween = endDate - startDate;
            days = millisBetween / millisecondsPerDay;
        }

        //ASPxClientMemo.Cast("dateDifferenceResult").SetValue(days);
        //ASPxTextBox.Cast("dateDifferenceResult").SetValue(days);
        dateDifferenceResult.SetValue(days);
    }
</script>

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

<table style="width: 100%; height: 139px;" dir="rtl">

    <tr>
        <td class="style50" dir="rtl" style="text-align: right">
            <table align="center" width="100%" cellpadding="5px">
                <tbody>
                    <tr>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_New" runat="server" Text="جديد" Width="100%" UseSubmitBehavior="False"
                                ClientInstanceName="ASPxButton_New" EnableClientSideAPI="True" Font-Bold="True">
                                <ClientSideEvents Click="function(s, e) {
	createNew();
}" />
                                <Image Url="~/Images/New_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_Save" runat="server" Text="حفظ" Width="100%"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Save" EnableClientSideAPI="True"
                                Font-Bold="True" ValidateInvisibleEditors="True"
                                ValidationGroup="Save" UseSubmitBehavior="False">
                                <ClientSideEvents Click="function(s, e) {
	Save_Begin();
}" />
                                <Image Url="~/Images/Save_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButtonEdit ID="ASPxButton_FindByKey" runat="server" Width="100%" UseSubmitBehavior="False" ClientInstanceName="ASPxButton_FindByKey" EnableClientSideAPI="True"
                                Font-Bold="True" NullText="بحث">
                                <ClientSideEvents ButtonClick="function(s, e) {
	FindByKey_Begin();
}"
                                    KeyPress="function(s, e) {
		ButtonEditClickByEnter(s, e);
}" />
                                <MaskSettings Mask="&lt;1..2147483647&gt;" />
                                <Buttons>
                                    <dx:EditButton Text="" Position="Left">
                                        <Image Url="~/Images/Find_32x32.png">
                                        </Image>
                                    </dx:EditButton>
                                </Buttons>
                                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                </ValidationSettings>
                            </dx:ASPxButtonEdit>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxTextBox ID="txt_hdn_scode" runat="server" ClientInstanceName="txt_hdn_scode" EnableClientSideAPI="True" Visible="False" Width="170px">
                            </dx:ASPxTextBox>
                        </td>
                        <td align="center" style="width: 16%;">&nbsp;</td>
                        <td align="center" style="width: 16%;">&nbsp;</td>
                        <td align="center" style="width: 4%;"></td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td class="style50" dir="rtl">
            <table border="1" cellspacing="1" dir="rtl" style="margin: auto 0px auto auto; padding: inherit; border: 1px solid #FFFFFF; width: 82%; line-height: normal; vertical-align: middle; table-layout: auto; height: 245px;">
                <tr>
                    <td class="style99" dir="rtl" style="border: 1px none #FFFFFF">
                        <asp:Label ID="Label12" runat="server" Font-Names="Tahoma" Font-Size="9pt" Text="اسم المؤسسة التعليمية ع"
                            Width="134px" ForeColor="#000066"></asp:Label>
                    </td>
                    <td class="style2" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;"
                        colspan="3">
                        <dx:ASPxTextBox ID="txt_school_name_ar" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" Height="23px" Width="100%"
                            ForeColor="#000066">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="style2" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;">
                        <asp:Label ID="Label321" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Width="140px">اسم المؤسسة التعليمية E</asp:Label>
                    </td>
                    <td class="style2" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 160px;"
                        colspan="3">

                        <dx:ASPxTextBox ID="txt_school_name_en" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                            Width="100%">
                        </dx:ASPxTextBox>


                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" dir="rtl" style="border: 1px none #FFFFFF">
                        <asp:Label ID="Label325" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Height="16px" Text="نوع المؤسسة التعليمية" Width="140px"></asp:Label>
                    </td>
                    <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;">
                        <dx:ASPxComboBox ID="ddl_site_type" runat="server" DataSourceID="org_type_DS" DataTextField="org_type_ar"
                            DataValueField="org_type_code" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#003366"
                            Height="23px" Width="100%" TextField="org_type_ar" ValueField="org_type_code" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" ValueType="System.Byte">
                        </dx:ASPxComboBox>
                    </td>
                    <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;">
                        <asp:Label ID="Label333" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="تاريخ الافتتاح" Width="110px"></asp:Label>
                    </td>
                    <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;">
                        <dx:ASPxDateEdit ID="txt_opening_date" runat="server" DisplayFormatString="yyyy-MM-dd"
                            EditFormat="Custom" EditFormatString="yyyy-MM-dd" Height="16px" Style="margin-bottom: 0px"
                            Width="100%" Date="06/18/2014 14:57:44" MinDate="1900-01-01">
                        </dx:ASPxDateEdit>
                    </td>
                    <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;">
                        <asp:Label ID="Label112" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Style="margin-top: 0px" Text="سنة التأسيس" Width="110px"></asp:Label>
                    </td>
                    <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 160px;">
                        <dx:ASPxTextBox ID="txt_est_year" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                            MaxLength="4" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                    <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 160px;">
                        <asp:Label ID="Label334" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="رقم المشروع"></asp:Label>
                    </td>
                    <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 160px;">
                        <dx:ASPxTextBox ID="txt_school_proj_num" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                            MaxLength="10" Width="180px">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style100" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                        <asp:Label ID="Label199" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="الدولة" Width="109px"></asp:Label>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxComboBox ID="ddl_country_name" runat="server" AutoPostBack="True" ClientIDMode="Static"
                            DataSourceID="country_name" DataTextField="nat_descrar" DataValueField="nat_code"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px" Width="100%" TextField="nat_descrar" ValueField="nat_code" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" ValueType="System.Int16">
                        </dx:ASPxComboBox>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:Label ID="Label200" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="المدينة" Width="110px"></asp:Label>
                    </td>
                    <td class="style95" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxComboBox ID="ddl_country_city" runat="server" AutoPostBack="True" Font-Names="Tahoma"
                            Font-Size="9pt" ForeColor="#000066" Height="23px" Width="100%" DataSourceID="cities_name" TextField="city_name_ar" ValueField="city_id" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" ValueType="System.Int16">
                        </dx:ASPxComboBox>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                        width="120">
                        <asp:Label ID="Label203" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="المحافظة" Width="110px"></asp:Label>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxComboBox ID="governrate_id" runat="server" Font-Names="Tahoma"
                            Font-Size="9pt" ForeColor="#000066" Height="23px" Width="100%" DataSourceID="SqlDataSource_governrate" TextField="governrate_name_ar" ValueField="governrate_id" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" ValueType="System.Int16">
                        </dx:ASPxComboBox>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:Label ID="Label322" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="القرية" Width="98px"></asp:Label>
                    </td>
                    <td class="style85" dir="rtl" style="margin-right: 40px;">
                        <dx:ASPxTextBox ID="txt_country_village" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                            Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style100" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                        <asp:Label ID="Label204" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="المركز" Width="140px"></asp:Label>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxComboBox ID="ddl_school_center" runat="server" DataSourceID="school_center_DS"
                            DataTextField="center_namear" DataValueField="center_code" Font-Names="Tahoma"
                            Font-Size="9pt" ForeColor="#000066" Height="23px" Width="100%" TextField="center_namear" ValueField="center_code" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" ValueType="System.Int16">
                        </dx:ASPxComboBox>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:Label ID="Label208" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="لغة الدراسة" Width="110px"></asp:Label>
                    </td>
                    <td class="style95" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxComboBox ID="DDL_school_language" runat="server" DataSourceID="language_DS"
                            DataTextField="lang_descrar" DataValueField="lang_code" Font-Names="Tahoma" Font-Size="10pt"
                            ForeColor="#000066" Height="23px" Width="100%" TextField="lang_descrar" ValueField="lang_code" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" ValueType="System.Int16">
                        </dx:ASPxComboBox>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                        width="120">
                        <asp:Label ID="Label206" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="عدد سنوات الدراسة" Width="110px"></asp:Label>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxTextBox ID="txt_years_num" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                            MaxLength="2" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:Label ID="Label97" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="المرحلة الدراسية" Width="110px" Visible="False"></asp:Label>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxComboBox ID="ddl_school_category" runat="server" DataSourceID="school_category_DS"
                            DataTextField="category_name_ar" DataValueField="category_code" Font-Names="Tahoma"
                            Font-Size="9pt" ForeColor="#000066" Height="23px" Width="100%" Visible="False" TextField="category_name_ar" ValueField="category_code" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" ValueType="System.Int16">
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="style101" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                        <asp:Label ID="Label207" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="هاتف" Width="140px"></asp:Label>
                    </td>
                    <td class="style97" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxTextBox ID="txt_school_tel" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                            MaxLength="20" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="style97" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:Label ID="Label209" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="نقال" Width="110px"></asp:Label>
                    </td>
                    <td class="style98" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxTextBox ID="txt_school_mobile" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                            MaxLength="20" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="style97" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                        width="120">
                        <asp:Label ID="Label306" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="فاكس" Width="110px"></asp:Label>
                    </td>
                    <td class="style97" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxTextBox ID="txt_school_fax" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                            MaxLength="20" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="style97" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:Label ID="Label328" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="الموقع الالكتروني" Width="103px"></asp:Label>
                    </td>
                    <td class="style97" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxTextBox ID="txt_school_website" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                            MaxLength="100" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style100" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                        <asp:Label ID="Label210" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="البريد الالكتروني" Width="110px"></asp:Label>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                        colspan="3">
                        <dx:ASPxTextBox ID="txt_school_email" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                            MaxLength="100" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                        width="120">
                        <asp:Label ID="Label327" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="عنوان المؤسسة التعليمية" Width="140px"></asp:Label>
                    </td>
                    <td class="style85" colspan="3" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxTextBox ID="txt_notes_1" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="36px"
                            MaxLength="300" TextMode="MultiLine" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style100" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                        <asp:Label ID="Label339" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="العطله" Width="110px"></asp:Label>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                        colspan="3">
                        <dx:ASPxTextBox ID="Vacation" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                            MaxLength="50" Width="100%">
                        </dx:ASPxTextBox>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                        width="120">&nbsp;</td>
                    <td class="style85" colspan="3" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">&nbsp;</td>
                </tr>
                <tr>
                    <td class="style100" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                        <asp:Label ID="Label153" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                            Text="بداية العام الدراسي" Width="150px"></asp:Label>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxComboBox ID="ddl_acad_year_start" runat="server"
                            DataTextField="month_name_ar" DataValueField="month_code" Font-Names="Tahoma"
                            Font-Size="10pt" ForeColor="#000066" Height="23px" Width="153px" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" ValueType="System.Int16">
                            <Items>
                                <dx:ListEditItem Value="1" Text="يناير"></dx:ListEditItem>
                                <dx:ListEditItem Value="2" Text="فبراير"></dx:ListEditItem>
                                <dx:ListEditItem Value="3" Text="مارس"></dx:ListEditItem>
                                <dx:ListEditItem Value="4" Text="ابريل"></dx:ListEditItem>
                                <dx:ListEditItem Value="5" Text="مايو"></dx:ListEditItem>
                                <dx:ListEditItem Value="6" Text="يونيو"></dx:ListEditItem>
                                <dx:ListEditItem Value="7" Text="يوليو"></dx:ListEditItem>
                                <dx:ListEditItem Value="8" Text="اغسطس"></dx:ListEditItem>
                                <dx:ListEditItem Value="9" Text="سبتمبر"></dx:ListEditItem>
                                <dx:ListEditItem Value="10" Text="اكتوبر"></dx:ListEditItem>
                                <dx:ListEditItem Value="11" Text="نوفمبر"></dx:ListEditItem>
                                <dx:ListEditItem Value="12" Text="ديسمبر"></dx:ListEditItem>
                            </Items>
                        </dx:ASPxComboBox>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:Label ID="Label211" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Height="16px" Text="نهاية العام الدراسي" Width="100px"></asp:Label>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxComboBox ID="ddl_acad_year_end" runat="server"
                            DataTextField="month_name_ar" DataValueField="month_code" Font-Names="Tahoma"
                            Font-Size="10pt" ForeColor="#000066" Height="22px" Width="100%" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" ValueType="System.Int16">
                            <Items>
                                <dx:ListEditItem Value="1" Text="يناير"></dx:ListEditItem>
                                <dx:ListEditItem Value="2" Text="فبراير"></dx:ListEditItem>
                                <dx:ListEditItem Value="3" Text="مارس"></dx:ListEditItem>
                                <dx:ListEditItem Value="4" Text="ابريل"></dx:ListEditItem>
                                <dx:ListEditItem Value="5" Text="مايو"></dx:ListEditItem>
                                <dx:ListEditItem Value="6" Text="يونيو"></dx:ListEditItem>
                                <dx:ListEditItem Value="7" Text="يوليو"></dx:ListEditItem>
                                <dx:ListEditItem Value="8" Text="اغسطس"></dx:ListEditItem>
                                <dx:ListEditItem Value="9" Text="سبتمبر"></dx:ListEditItem>
                                <dx:ListEditItem Value="10" Text="اكتوبر"></dx:ListEditItem>
                                <dx:ListEditItem Value="11" Text="نوفمبر"></dx:ListEditItem>
                                <dx:ListEditItem Value="12" Text="ديسمبر"></dx:ListEditItem>
                            </Items>

                        </dx:ASPxComboBox>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                        width="120">
                        <asp:Label ID="Label307" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                            Height="16px" Text="تدار من قبل :" Width="84px"></asp:Label>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxComboBox ID="ddl_managed_by" runat="server" DataSourceID="org_DS" DataTextField="org_namear"
                            DataValueField="org_code" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                            Height="23px" Width="140px" TextField="NameAr" ValueField="ID" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" ValueType="System.Int16">
                            <Items>
                                <dx:ListEditItem Text="الجمعية" Value="1"></dx:ListEditItem>
                                <dx:ListEditItem Text="جهات أخرى" Value="2"></dx:ListEditItem>
                                <dx:ListEditItem Text="ادارة مشتركة" Value="3"></dx:ListEditItem>
                            </Items>

                        </dx:ASPxComboBox>

                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:Label ID="Label308" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Height="16px" Text="اسم الجهه" Width="100px" Visible="False"></asp:Label>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxTextBox ID="txt_site_name" runat="server"
                            Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066" Height="23px"
                            Width="100%" Visible="False">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style100" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                        <asp:Label ID="Label151" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                            Height="16px" Text="ملكية الأرض و المؤسسة " Width="147px"></asp:Label>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:RadioButtonList ID="rdo_ownership_1" runat="server" Font-Names="Tahoma" Font-Size="10pt"
                            ForeColor="#000066" RepeatDirection="Horizontal" Width="92px">
                            <asp:ListItem Value="0">نعم</asp:ListItem>
                            <asp:ListItem Value="1">لا</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:Label ID="Label152" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            Text="مسجلة في الدولة" Width="100px"></asp:Label>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:RadioButtonList ID="rdo_registered_1" runat="server" Font-Names="Tahoma" Font-Size="10pt"
                            ForeColor="#000066" RepeatDirection="Horizontal" Width="92px">
                            <asp:ListItem Value="0">نعم</asp:ListItem>
                            <asp:ListItem Value="1">لا</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                        width="120">
                        <asp:Label ID="Label140" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                            Text="الشهادة معترف بها" Width="104px"></asp:Label>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:RadioButtonList ID="rdo_certifictae_1" runat="server" Font-Names="Tahoma" Font-Size="10pt"
                            ForeColor="#000066" RepeatDirection="Horizontal" Width="92px">
                            <asp:ListItem Value="0">نعم</asp:ListItem>
                            <asp:ListItem Value="1">لا</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <asp:Label ID="Label213" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                            Height="16px" Text="النظام الدراسي المتبع " Width="126px"></asp:Label>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                        <dx:ASPxComboBox ID="ddl_terms_num" runat="server" DataSourceID="terms_DS" DataTextField="term_name_ar"
                            DataValueField="term_code" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                            Height="23px" Width="100%" TextField="term_name_ar" ValueField="term_code" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" ValueType="System.Int16">
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="style100" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                        <asp:Label ID="Label335" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066" Text="ملاحظات مدير المدرسة" Width="147px"></asp:Label>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;" colspan="3">
                        <dx:ASPxMemo ID="SchoolManagerRemarks" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            MaxLength="1000" TextMode="MultiLine" Width="100%">
                        </dx:ASPxMemo>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                        width="120">
                        <asp:Label ID="Label337" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066" Text="ملاحظات مدير المكتب الميداني" Width="147px"></asp:Label>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;" colspan="3">
                        <dx:ASPxMemo ID="FieldOfficeManagerRemarks" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            MaxLength="1000" TextMode="MultiLine" Width="100%">
                        </dx:ASPxMemo>
                    </td>
                </tr>
                <tr>
                    <td class="style100" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                        <asp:Label ID="Label336" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066" Text="ملاحظات المختص بالقطاع الجغرافي" Width="147px"></asp:Label>
                    </td>
                    <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;" colspan="3">
                        <dx:ASPxMemo ID="GeoSectorRemarks" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            MaxLength="1000" TextMode="MultiLine" Width="100%">
                        </dx:ASPxMemo>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                        width="120">
                        <asp:Label ID="Label338" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066" Text="ملاحظات المختص بوحدة التعليم" Width="147px"></asp:Label>
                    </td>
                    <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;" colspan="3">
                        <dx:ASPxMemo ID="EducationSectionRemarks" runat="server"
                            Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                            MaxLength="1000" TextMode="MultiLine" Width="100%">
                        </dx:ASPxMemo>
                    </td>
                </tr>
            </table>
            <table style="width: 1000px; margin-top: 15px">
                <tr>
                    <td>
                        <dx:ASPxButton ID="btn_Activities" runat="server" Text="الأنشطة و البرامج التعليمية"
                            Width="250px" UseSubmitBehavior="False"
                            AutoPostBack="False" ClientInstanceName="btn_Activities" EnableClientSideAPI="True"
                            Font-Bold="True">
                            <ClientSideEvents Click="function(s, e) {
	openActivities();
}" />
                            <Image Url="~/Images/Open_32x32.png">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btn_BasicInfo" runat="server" Text="عدد الفصول/العطل الرسمية"
                            Width="250px" UseSubmitBehavior="False"
                            AutoPostBack="False" ClientInstanceName="btn_BasicInfo" EnableClientSideAPI="True"
                            Font-Bold="True">
                            <ClientSideEvents Click="function(s, e) {
	openBasicInfo();
}" />
                            <Image Url="~/Images/Open_32x32.png">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btn_studentsCount_Cost" runat="server" Text="عدد الطلاب / الرسوم الدراسية"
                            Width="250px" UseSubmitBehavior="False"
                            AutoPostBack="False" ClientInstanceName="btn_studentsCount_Cost" EnableClientSideAPI="True"
                            Font-Bold="True">
                            <ClientSideEvents Click="function(s, e) {
	openStuentsCountAndTuition();
}" />
                            <Image Url="~/Images/Open_32x32.png">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btn_Buildings" runat="server" Text="المباني و التجهيزات"
                            Width="250px" UseSubmitBehavior="False"
                            AutoPostBack="False" ClientInstanceName="btn_Buildings" EnableClientSideAPI="True"
                            Font-Bold="True">
                            <ClientSideEvents Click="function(s, e) {
	openBuildings();
}" />
                            <Image Url="~/Images/Open_32x32.png">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxButton ID="btn_Attachments" runat="server" Text="المرفقات"
                            Width="250px" UseSubmitBehavior="False"
                            AutoPostBack="False" ClientInstanceName="btn_Attachments" EnableClientSideAPI="True"
                            Font-Bold="True">
                            <ClientSideEvents Click="function(s, e) {
	openAttachments();
}" />
                            <Image Url="~/Images/Open_32x32.png">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                    <td>
                        <dx:ASPxButton ID="btn_Employees" runat="server" Text="العاملين و الهيئة التدريسية"
                            Width="250px" UseSubmitBehavior="False"
                            AutoPostBack="False" ClientInstanceName="btn_Employees" EnableClientSideAPI="True"
                            Font-Bold="True">
                            <ClientSideEvents Click="function(s, e) {
	openEmployees();
}" />
                            <Image Url="~/Images/Open_32x32.png">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <asp:SqlDataSource ID="school_category_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [school_category]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="language_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [languages_tab]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource_governrate" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString4 %>"
                SelectCommand="SELECT * FROM [governrate] WHERE ([nat_code] = @nat_city)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_country_name" Name="nat_city" PropertyName="Value"
                        Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="cities_name" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [city] WHERE ([nat_city] = @nat_city)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_country_name" Name="nat_city" PropertyName="Value"
                        Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="districts" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [governrate]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="org_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [SchoolManagedBy]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="terms_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [terms_codes]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="month_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [month_codes]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="acad_year_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [academic_year_codes] where acad_year_code &gt;0"></asp:SqlDataSource>
            <asp:SqlDataSource ID="country_name" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="school_center_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [center_tab]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="school_grades_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                DeleteCommand="Delete_school_grades" InsertCommand="Insert_school_grades" SelectCommand="Select_school_grades"
                UpdateCommand="Update_school_grades" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure"
                SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="ASPxButton_FindByKey" Name="school_code" PropertyName="Value"
                        Type="Int16" />
                    <asp:Parameter Name="academic_year" Type="Int16" />
                    <asp:Parameter Name="grade_code" Type="Byte" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="ASPxButton_FindByKey" Name="school_code" PropertyName="Value"
                        Type="Int16" />
                    <asp:Parameter Name="academic_year" Type="Int16" />
                    <asp:Parameter Name="grade_code" Type="Byte" />
                    <asp:Parameter Name="class_num" Type="Byte" />
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ASPxButton_FindByKey" Name="school_code" PropertyName="Value"
                        Type="Int16" />
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="ASPxButton_FindByKey" Name="school_code" PropertyName="Value"
                        Type="Int16" />
                    <asp:Parameter Name="academic_year" Type="Int16" />
                    <asp:Parameter Name="grade_code" Type="Byte" />
                    <asp:Parameter Name="class_num" Type="Byte" />
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="month2_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [month_codes]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="org_type_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="Select_organization_type" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <asp:SqlDataSource ID="grades_setup_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [grades_codes] where grade_code &gt; 0"></asp:SqlDataSource>
            <asp:SqlDataSource ID="stud_category_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [students_category]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="gender_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [gender_tab]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="class_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [classes_tab] where class_code &gt;0 "></asp:SqlDataSource>
            <asp:SqlDataSource ID="unit_types_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [unit_types_codes]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="unit_cond_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT * FROM [unit_cond_codes]"></asp:SqlDataSource>

            <asp:SqlDataSource ID="currency_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="Select_currency_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </td>
    </tr>
</table>

<dx:ASPxLoadingPanel runat="server" Modal="True" ClientInstanceName="ASPxLoadingPanel1" Font-Bold="True" ID="ASPxLoadingPanel1"></dx:ASPxLoadingPanel>

<dx:ASPxCallback runat="server" ClientInstanceName="ASPxCallback_Save" ID="ASPxCallback_Save" OnCallback="ASPxCallback_Save_Callback">
    <ClientSideEvents CallbackComplete="function(s, e) {
	Save_End(e);
}"
        CallbackError="function(s, e) {
	Save_Error(e);
}"></ClientSideEvents>
</dx:ASPxCallback>

