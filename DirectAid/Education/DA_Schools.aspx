<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DA_Schools.aspx.vb" Inherits="DirectAid.DA_Schools"
    EnableSessionState="True" MasterPageFile="~/Site.Master" %>


<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>





<%--<%@ Register Src="Controls/education/ctrl_StudentsSearch.ascx" TagName="ctrl_StudentsSearch"
    TagPrefix="uc1" %>--%>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title></title>
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
    <script type="text/javascript">
        function openStuentsCountAndTuition() {
            var id = document.getElementById("txt_school_code").value;
            var url = "SchoolsFeesAndStudCount.aspx?SchoolID=";
            if (id != "" && id != null) {
                url+=id;
                openTransfers(url, "width=1150,height=400,resizable=no,location=no");
            }
        }
        function openBasicInfo() {
            var id = document.getElementById("txt_school_code").value;
            var url = "SchoolsBasicInfo.aspx?SchoolID=";
            if (id != "" && id != null) {
                url += id;
                openTransfers(url, "width=1150,height=400,resizable=no,location=no");
            }
        }
        function openActivities() {
            var id = document.getElementById("txt_school_code").value;
            var url = "SchoolActivities.aspx?SchoolID=";
            if (id != "" && id != null) {
                url += id;
                openTransfers(url, "width=1150,height=400,resizable=no,location=no");
            }
        }
        function openBuildings() {
            var id = document.getElementById("txt_school_code").value;
            var url = "SchoolsBuildings.aspx?SchoolID=";
            if (id != "" && id != null) {
                url += id;
                openTransfers(url, "width=1150,height=400,resizable=no,location=no");
            }
        }
        function openAttachments() {
            var id = document.getElementById("txt_school_code").value;
            var url = "EducationAttachments.aspx?mod=11&app_ser=";
            if (id != "" && id != null) {
                url += id;
                openTransfers(url, "width=1150,height=400,resizable=no,location=no");
            }
        }
        function openEmployees() {
            var id = document.getElementById("txt_school_code").value;
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
        //        function closeDialog() {
        //            ASPxPopupControl1.Hide() ;
        //        }
        //        function openDialog() {
        //            ASPxPopupControl1.Show();
        //        }
        function pageLoad() {
            //Date picker for the Date

            //            $("#txt_opening_date").datepicker({
            //                changeMonth: true,
            //                changeYear: true,
            //                dateFormat: 'yy/mm/dd'
            //              });


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
    <style type="text/css">
        s .style50 {
            height: 29px;
        }

        a:link, a:visited {
            color: #034af3;
        }

        .style2 {
            height: 11px;
        }

        .style81 {
            height: 29px;
        }

        .style82 {
            height: 21px;
            width: 133px;
        }

        .style85 {
            height: 29px;
        }

        .style65 {
        }

        .style90 {
            width: 296px;
            height: 21px;
        }

        .style91 {
            width: 100px;
            height: 21px;
        }

        .style94 {
            width: 269px;
            height: 21px;
        }

        .style95 {
            height: 29px;
            width: 269px;
        }

        .style97 {
            height: 9px;
        }

        .style98 {
            height: 9px;
            width: 269px;
        }

        .style99 {
            height: 11px;
            width: 133px;
        }

        .style100 {
            height: 29px;
            width: 133px;
        }

        .style101 {
            height: 9px;
            width: 133px;
        }
        /* for playing happy with DX */
        td.dxpDropDownButton img {
            max-width: none;
        }

        td.dxpComboBox input {
            margin-bottom: 0px;
            padding: 0px 0px;
        }

        .auto-style1 {
            width: 133px;
        }

        .auto-style2 {
            width: 39px;
            height: 21px;
        }
        input[type=text]
        {
            border:1px solid #ccc;
        }
        textarea
        {
            border:1px solid #ccc;
        }
        select
        {
            border:1px solid #ccc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  
    <table style="width: 100%; height: 139px; " dir="rtl">

                <tr>
                    <td  class="style50" dir="rtl" style="text-align:right">
                        <a id="lnk_new" runat="server" href="" style="float:right">
                            <div style="background-image:url('../images/New_32x32.png');background-size:cover;height:32px;width:32px;"></div>
                        </a><a id="A5" runat="server" style="float:right;display:none">
                            <div style="background-image:url('../images/Find_32x32.png');background-size:cover;height:32px;width:32px;"></div>
                        </a><a id="lnk_save" runat="server" style="float:right">
                        <%--<%@ Register Src="Controls/education/ctrl_StudentsSearch.ascx" TagName="ctrl_StudentsSearch"
    TagPrefix="uc1" %>--%>
                            <div style="background-image:url('../images/Save_32x32.png');background-size:cover;height:32px;width:32px;"></div>
                        </a><a id="lnk_delete" runat="server" style="visibility: hidden; width: 72px; height: 1px">
                            <img alt="" border="0" src="../images/Delete_32x32.png" />
                        </a><a id="A1" runat="server" style="visibility: hidden; width: 43px; height: 1px">
                            <img alt="" border="0" src="" />
                        </a><a id="A3" runat="server" style="visibility: hidden; width: 43px; height: 1px">
                            <img alt="" border="0" src="" />
                        </a><a id="lnk_pictures" runat="server" style="visibility: hidden; width: 43px; height: 1px">
                            <img alt="" border="0" src="../images/Employee_32x32.png" />
                        </a><a id="lnk_scholarships" runat="server" style="visibility: hidden; width: 43px; height: 1px">
                            <img alt="" border="0" src="../images/note-32x32.png" />
                        </a>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td  class="style50" dir="rtl">
                        <table border="1" cellspacing="1" dir="rtl" style="margin: auto 0px auto auto; padding: inherit; border: 1px solid #FFFFFF; width: 82%; line-height: normal; vertical-align: middle; table-layout: auto; height: 245px;">
                            <tr>
                                <td class="style82" dir="rtl" style="border: 1px none #FFFFFF">
                                    <asp:Label ID="Label11" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="رقم الملف" Width="140px"></asp:Label>
                                </td>
                                <td class="style90" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:TextBox ID="txt_school_code" runat="server" BackColor="#FFFFCC" 
                                          ClientIDMode="Static" Font-Names="Tahoma"
                                        Font-Size="9pt" ForeColor="#CEE6FF" Height="23px" MaxLength="4" Width="150px"></asp:TextBox>
                                </td>
                                <td class="style90" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"></td>
                                <td class="style94" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:CheckBox ID="chk_school_related_to_da" runat="server" Font-Names="Tahoma" Font-Size="9pt"
                                        ForeColor="#003366" Text="تابعة للجمعية" Width="116px" Checked="True" />
                                </td>
                                <td class="style91" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 160px;"
                                    width="120">
                                    <asp:LinkButton ID="A_search" runat="server" CssClass="hide"></asp:LinkButton>
                                </td>
                                <td class="style91" dir="rtl" style="border: 1px none #FFFFFF">
                                    <asp:LinkButton ID="A2" runat="server" CssClass="hide"></asp:LinkButton>
                                </td>
                                <td class="auto-style2" dir="rtl" style="border: 1px none #FFFFFF"></td>
                                <td class="style91" dir="rtl" style="border: 1px none #FFFFFF"></td>
                                <td class="style91" dir="rtl" style="border: 1px none #FFFFFF"></td>
                                <td class="style91" dir="rtl" style="border: 1px none #FFFFFF"></td>
                            </tr>
                            <tr>
                                <td class="style99" dir="rtl" style="border: 1px none #FFFFFF">
                                    <asp:Label ID="Label12" runat="server" Font-Names="Tahoma" Font-Size="9pt" Text="اسم المؤسسة التعليمية ع"
                                        Width="134px" ForeColor="#000066"></asp:Label>
                                </td>
                                <td class="style2" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;"
                                    colspan="3">
                                    <asp:TextBox ID="txt_school_name_ar" runat="server"
                                        Font-Names="Tahoma" Font-Size="9pt" Height="23px" Width="100%"
                                        ForeColor="#000066"></asp:TextBox>
                                </td>
                                <td class="style2" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;">
                                    <asp:Label ID="Label321" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Width="140px">اسم المؤسسة التعليمية E</asp:Label>
                                </td>
                                <td class="style2" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 160px;"
                                    colspan="5">

                                    <asp:TextBox ID="txt_school_name_en" runat="server"  
                                        Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                                        Width="417px"></asp:TextBox>


                                    <span>
                                        <img id="btn_search" alt="Search by names" border="0" height="24" src="../images/Search-icon.png"
                                            style="visibility: visible; width: 24px; height: 22px" onclick="configureLoadingAndCallBack();//open_search_names_scrn();" />
                                    </span>


                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1" dir="rtl" style="border: 1px none #FFFFFF">
                                    <asp:Label ID="Label325" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Height="16px" Text="نوع المؤسسة التعليمية" Width="140px"></asp:Label>
                                </td>
                                <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;">
                                    <asp:DropDownList ID="ddl_site_type" runat="server" DataSourceID="org_type_DS" DataTextField="org_type_ar"
                                        DataValueField="org_type_code" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#003366"
                                        Height="23px" Width="100%">
                                    </asp:DropDownList>
                                </td>
                                <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;">
                                    <asp:Label ID="Label333" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="تاريخ الافتتاح" Width="110px"></asp:Label>
                                </td>
                                <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;">
                                    <dx:ASPxDateEdit ID="txt_opening_date" runat="server" DisplayFormatString="yyyy-MM-dd"
                                        EditFormat="Custom" EditFormatString="yyyy-MM-dd" Height="16px" Style="margin-bottom: 0px"
                                        Width="135px">
                                    </dx:ASPxDateEdit>
                                </td>
                                <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 120px;">
                                    <asp:Label ID="Label112" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Style="margin-top: 0px" Text="سنة التأسيس" Width="110px"></asp:Label>
                                </td>
                                <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 160px;" colspan="2">
                                    <asp:TextBox ID="txt_est_year" runat="server"  
                                        Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                                        MaxLength="4" Width="140px">0</asp:TextBox>
                                </td>
                                <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 160px;">
                                    <asp:Label ID="Label334" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="رقم المشروع"></asp:Label>
                                </td>
                                <td dir="rtl" style="border: 1px none #FFFFFF; margin-right: 160px;" colspan="2">
                                    <asp:TextBox ID="txt_school_proj_num" runat="server"  
                                        Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                                        MaxLength="10" Width="180px">0</asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style100" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                                    <asp:Label ID="Label199" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="الدولة" Width="109px"></asp:Label>
                                </td>
                                <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:DropDownList ID="ddl_country_name" runat="server" AutoPostBack="True" ClientIDMode="Static"
                                        DataSourceID="country_name" DataTextField="nat_descrar" DataValueField="nat_code"
                                        Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px" Width="153px">
                                    </asp:DropDownList>
                                </td>
                                <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:Label ID="Label200" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="المدينة" Width="110px"></asp:Label>
                                </td>
                                <td class="style95" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:DropDownList ID="ddl_country_city" runat="server" AutoPostBack="True" Font-Names="Tahoma"
                                        Font-Size="9pt" ForeColor="#000066" Height="23px" Width="100%" DataSourceID="cities_name" DataTextField="city_name_ar" DataValueField="city_id">
                                    </asp:DropDownList>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                                    width="120">
                                    <asp:Label ID="Label203" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="المحافظة" Width="110px"></asp:Label>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;" colspan="2">
                                    <asp:TextBox ID="txt_district" runat="server" BackColor="#FFFFCC" 
                                         Enabled="False" Font-Names="Tahoma" Font-Size="9pt"
                                        ForeColor="#000066" Height="23px" MaxLength="4" ReadOnly="True" Width="140px"></asp:TextBox>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:Label ID="Label322" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="القرية" Width="98px"></asp:Label>
                                </td>
                                <td class="style85" dir="rtl" style="margin-right: 40px;" colspan="2">
                                    <asp:TextBox ID="txt_country_village" runat="server" 
                                        Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                                        Width="100%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style100" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                                    <asp:Label ID="Label204" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="المركز" Width="140px"></asp:Label>
                                </td>
                                <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:DropDownList ID="ddl_school_center" runat="server" DataSourceID="school_center_DS"
                                        DataTextField="center_namear" DataValueField="center_code" Font-Names="Tahoma"
                                        Font-Size="9pt" ForeColor="#000066" Height="23px" Width="154px">
                                    </asp:DropDownList>
                                </td>
                                <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:Label ID="Label208" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="لغة الدراسة" Width="110px"></asp:Label>
                                </td>
                                <td class="style95" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:DropDownList ID="DDL_school_language" runat="server" DataSourceID="language_DS"
                                        DataTextField="lang_descrar" DataValueField="lang_code" Font-Names="Tahoma" Font-Size="10pt"
                                        ForeColor="#000066" Height="23px" Width="100%">
                                    </asp:DropDownList>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                                    width="120">
                                    <asp:Label ID="Label206" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="عدد سنوات الدراسة" Width="110px"></asp:Label>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;" colspan="2">
                                    <asp:TextBox ID="txt_years_num" runat="server"  
                                        Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                                        MaxLength="2" Width="140px">0</asp:TextBox>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:Label ID="Label97" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="المرحلة الدراسية" Width="110px" Visible="False"></asp:Label>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;" colspan="2">
                                    <asp:DropDownList ID="ddl_school_category" runat="server" DataSourceID="school_category_DS"
                                        DataTextField="category_name_ar" DataValueField="category_code" Font-Names="Tahoma"
                                        Font-Size="9pt" ForeColor="#000066" Height="23px" Width="100%" Visible="False">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style101" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                                    <asp:Label ID="Label207" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="هاتف" Width="140px"></asp:Label>
                                </td>
                                <td class="style97" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:TextBox ID="txt_school_tel" runat="server"  
                                        Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                                        MaxLength="20" Width="150px">0</asp:TextBox>
                                </td>
                                <td class="style97" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:Label ID="Label209" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="نقال" Width="110px"></asp:Label>
                                </td>
                                <td class="style98" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:TextBox ID="txt_school_mobile" runat="server"  
                                        Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                                        MaxLength="20" Width="100%">0</asp:TextBox>
                                </td>
                                <td class="style97" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                                    width="120">
                                    <asp:Label ID="Label306" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="فاكس" Width="110px"></asp:Label>
                                </td>
                                <td class="style97" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;" colspan="2">
                                    <asp:TextBox ID="txt_school_fax" runat="server"  
                                         Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                                        MaxLength="20" Width="140px">0</asp:TextBox>
                                </td>
                                <td class="style97" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:Label ID="Label328" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="الموقع الالكتروني" Width="103px"></asp:Label>
                                </td>
                                <td class="style97" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                                    colspan="2">
                                    <asp:TextBox ID="txt_school_website" runat="server"  
                                         Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                                        MaxLength="100" Width="100%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style100" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                                    <asp:Label ID="Label210" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="البريد الالكتروني" Width="110px"></asp:Label>
                                </td>
                                <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                                    colspan="3">
                                    <asp:TextBox ID="txt_school_email" runat="server"  
                                         Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="23px"
                                        MaxLength="100" Width="100%"></asp:TextBox>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                                    width="120">
                                    <asp:Label ID="Label327" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Text="عنوان المؤسسة التعليمية" Width="140px"></asp:Label>
                                </td>
                                <td class="style85" colspan="5" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:TextBox ID="txt_notes_1" runat="server"  
                                         Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066" Height="36px"
                                        MaxLength="300" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style100" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 80px;">
                                    <asp:Label ID="Label153" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                                        Text="بداية العام الدراسي" Width="150px"></asp:Label>
                                </td>
                                <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:DropDownList ID="ddl_acad_year_start" runat="server"
                                        DataTextField="month_name_ar" DataValueField="month_code" Font-Names="Tahoma"
                                        Font-Size="10pt" ForeColor="#000066" Height="23px" Width="153px">
                                        <asp:ListItem Value="1">يناير</asp:ListItem>
                                        <asp:ListItem Value="2">فبراير</asp:ListItem>
                                        <asp:ListItem Value="3">مارس</asp:ListItem>
                                        <asp:ListItem Value="4">ابريل</asp:ListItem>
                                        <asp:ListItem Value="5">مايو</asp:ListItem>
                                        <asp:ListItem Value="6">يونيو</asp:ListItem>
                                        <asp:ListItem Value="7">يوليو</asp:ListItem>
                                        <asp:ListItem Value="8">اغسطس</asp:ListItem>
                                        <asp:ListItem Value="9">سبتمبر</asp:ListItem>
                                        <asp:ListItem Value="10">اكتوبر</asp:ListItem>
                                        <asp:ListItem Value="11">نوفمبر</asp:ListItem>
                                        <asp:ListItem Value="12">ديسمبر</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:Label ID="Label211" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Height="16px" Text="نهاية العام الدراسي" Width="100px"></asp:Label>
                                </td>
                                <td class="style81" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:DropDownList ID="ddl_acad_year_end" runat="server" 
                                        DataTextField="month_name_ar" DataValueField="month_code" Font-Names="Tahoma"
                                        Font-Size="10pt" ForeColor="#000066" Height="22px" Width="100%">
                                        <asp:ListItem Value="1">يناير</asp:ListItem>
                                        <asp:ListItem Value="2">فبراير</asp:ListItem>
                                        <asp:ListItem Value="3">مارس</asp:ListItem>
                                        <asp:ListItem Value="4">ابريل</asp:ListItem>
                                        <asp:ListItem Value="5">مايو</asp:ListItem>
                                        <asp:ListItem Value="6">يونيو</asp:ListItem>
                                        <asp:ListItem Value="7">يوليو</asp:ListItem>
                                        <asp:ListItem Value="8">اغسطس</asp:ListItem>
                                        <asp:ListItem Value="9">سبتمبر</asp:ListItem>
                                        <asp:ListItem Value="10">اكتوبر</asp:ListItem>
                                        <asp:ListItem Value="11">نوفمبر</asp:ListItem>
                                        <asp:ListItem Value="12">ديسمبر</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                                    width="120">
                                    <asp:Label ID="Label307" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                                        Height="16px" Text="تدار من قبل :" Width="84px"></asp:Label>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;" colspan="2">
                                    <asp:DropDownList ID="ddl_managed_by" runat="server" DataSourceID="org_DS" DataTextField="org_namear"
                                        DataValueField="org_code" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                                        Height="23px" Width="140px">
                                        <asp:ListItem>الجمعية</asp:ListItem>
                                        <asp:ListItem>جهات أخرى</asp:ListItem>
                                        <asp:ListItem>ادارة مشتركة</asp:ListItem>
                                    </asp:DropDownList>

                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:Label ID="Label308" runat="server" Font-Names="Tahoma" Font-Size="9pt" ForeColor="#000066"
                                        Height="16px" Text="اسم الجهه" Width="100px" Visible="False"></asp:Label>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                                    colspan="2">
                                    <asp:TextBox ID="txt_site_name" runat="server"  
                                         Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066" Height="23px"
                                        Width="100%" Visible="False"></asp:TextBox>
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
                                        <asp:ListItem Selected="True" Value="0">نعم</asp:ListItem>
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
                                        <asp:ListItem Selected="True" Value="0">نعم</asp:ListItem>
                                        <asp:ListItem Value="1">لا</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                                    width="120">
                                    <asp:Label ID="Label140" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                                        Text="الشهادة معترف بها" Width="104px"></asp:Label>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;" colspan="2">
                                    <asp:RadioButtonList ID="rdo_certifictae_1" runat="server" Font-Names="Tahoma" Font-Size="10pt"
                                        ForeColor="#000066" RepeatDirection="Horizontal" Width="92px">
                                        <asp:ListItem Selected="True" Value="0">نعم</asp:ListItem>
                                        <asp:ListItem Value="1">لا</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;">
                                    <asp:Label ID="Label213" runat="server" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                                        Height="16px" Text="النظام الدراسي المتبع " Width="126px"></asp:Label>
                                </td>
                                <td class="style85" dir="rtl" style="border: 1px none #FFFFFF; margin-right: 40px;"
                                    colspan="2">
                                    <asp:DropDownList ID="ddl_terms_num" runat="server" DataSourceID="terms_DS" DataTextField="term_name_ar"
                                        DataValueField="term_code" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#000066"
                                        Height="23px" Width="100%">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            </table>
                        <table style="width:1000px;margin-top:15px">
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
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="school_category_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [school_category]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="language_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [languages_tab]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="cities_name" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [city] WHERE ([nat_city] = @nat_city)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddl_country_name" Name="nat_city" PropertyName="SelectedValue"
                                    Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="districts" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [governrate]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="org_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [organization_tab]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="terms_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [terms_codes]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="month_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [month_codes]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="school_holidays_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            DeleteCommand="Delete_school_holidays" InsertCommand="Insert_school_holidays"
                            SelectCommand="Select_school_holidays" UpdateCommand="Update_school_holidays"
                            DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure"
                            UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="holiday_name" Type="String" />
                                <asp:Parameter Name="holiday_start_date" Type="DateTime" />
                                <asp:Parameter Name="holiday_end_date" Type="DateTime" />
                                <asp:Parameter Name="holiday_days_num" Type="Int16" />
                                <asp:Parameter Name="notes_1" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="holiday_name" Type="String" />
                                <asp:Parameter Name="holiday_start_date" Type="DateTime" />
                                <asp:Parameter Name="holiday_end_date" Type="DateTime" />
                                <asp:Parameter Name="holiday_days_num" Type="Int16" />
                                <asp:Parameter Name="notes_1" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
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
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="academic_year" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Byte" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="academic_year" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Byte" />
                                <asp:Parameter Name="class_num" Type="Byte" />
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
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
                        <br />
                        <asp:SqlDataSource ID="school_statistics_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            DeleteCommand="Delete_school_statistic" InsertCommand="Insert_school_statistic"
                            SelectCommand="Select_school_statistic" UpdateCommand="Update_school_statistic"
                            DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure"
                            UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Int16" />
                                <asp:Parameter Name="class_code" Type="String" />
                                <asp:Parameter Name="stud_gender" Type="Byte" />
                                <asp:Parameter Name="stud_category" Type="Byte" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Int16" />
                                <asp:Parameter Name="class_code" Type="String" />
                                <asp:Parameter Name="stud_gender" Type="Byte" />
                                <asp:Parameter Name="stud_category" Type="Byte" />
                                <asp:Parameter Name="stud_num" Type="Byte" />
                                <asp:Parameter Name="amount_val" Type="Decimal" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Int16" />
                                <asp:Parameter Name="class_code" Type="String" />
                                <asp:Parameter Name="stud_gender" Type="Byte" />
                                <asp:Parameter Name="stud_category" Type="Byte" />
                                <asp:Parameter Name="stud_num" Type="Byte" />
                                <asp:Parameter Name="amount_val" Type="Decimal" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="grades_setup_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [grades_codes] where grade_code &gt; 0"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="stud_category_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [students_category]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="gender_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [gender_tab]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="class_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [classes_tab] where class_code &gt;0 "></asp:SqlDataSource>
                        <br />
                        <asp:SqlDataSource ID="school_fees_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            DeleteCommand="Delete_school_fees" InsertCommand="Insert_school_fees" SelectCommand="Select_school_fees"
                            UpdateCommand="Update_school_fees" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure"
                            SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Byte" />
                                <asp:Parameter Name="stud_category" Type="Byte" />
                                <asp:Parameter Name="class_num" Type="Int16" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Int16" />
                                <asp:Parameter Name="stud_category" Type="Byte" />
                                <asp:Parameter Name="class_num" Type="Int16" />
                                <asp:Parameter Name="fees_amount" Type="Decimal" />
                                <asp:Parameter Name="currency_code" Type="Int16" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Int16" />
                                <asp:Parameter Name="stud_category" Type="Byte" />
                                <asp:Parameter Name="class_num" Type="Int16" />
                                <asp:Parameter Name="fees_amount" Type="Decimal" />
                                <asp:Parameter Name="currency_code" Type="Int16" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:SqlDataSource ID="school_building_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            DeleteCommand="Delete_school_building_trx" InsertCommand="Insert_school_building_trx"
                            SelectCommand="Select_school_building_trx" UpdateCommand="Update_school_building_trx"
                            DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure"
                            UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="trx_ser" Type="Int16" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="unit_type" Type="Byte" />
                                <asp:Parameter Name="unit_count" Type="Byte" />
                                <asp:Parameter Name="unit_condition" Type="Byte" />
                                <asp:Parameter Name="under_construction" Type="Byte" />
                                <asp:Parameter Name="construction_cost" Type="Decimal" />
                                <asp:Parameter Name="need_maint" Type="Byte" />
                                <asp:Parameter Name="maint_cost" Type="Decimal" />
                                <asp:Parameter Name="need_accomd" Type="Byte" />
                                <asp:Parameter Name="accomd_cost" Type="Decimal" />
                                <asp:Parameter Name="notes_1" Type="String" />
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="currency_code" Type="Int16" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="trx_ser" Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="unit_type" Type="Byte" />
                                <asp:Parameter Name="unit_count" Type="Byte" />
                                <asp:Parameter Name="unit_condition" Type="Byte" />
                                <asp:Parameter Name="under_construction" Type="Byte" />
                                <asp:Parameter Name="construction_cost" Type="Decimal" />
                                <asp:Parameter Name="need_maint" Type="Byte" />
                                <asp:Parameter Name="maint_cost" Type="Decimal" />
                                <asp:Parameter Name="need_accomd" Type="Byte" />
                                <asp:Parameter Name="accomd_cost" Type="Decimal" />
                                <asp:Parameter Name="notes_1" Type="String" />
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="currency_code" Type="Int16" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="unit_types_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [unit_types_codes]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="unit_cond_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [unit_cond_codes]"></asp:SqlDataSource>

        <asp:SqlDataSource ID="currency_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
            SelectCommand="Select_currency_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True" AllowResize="True"
                CloseAction="CloseButton" ClientInstanceName="ASPxPopupControl1" EnableViewState="False"
                PopupElementID="btn_search" PopupHorizontalAlign="WindowCenter" Modal="True"
                PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="1000px" Height="500px"
                FooterText="" Theme="Default" HeaderText="بحث المؤسسات التعليمية" EnableHierarchyRecreation="True"
                RightToLeft="True">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                        <%-- <dx:ASPxButton ID="ASPxButton1" runat="server" Text="ASPxButton">
                        <ClientSideEvents Click="function(s, e) { ASPxPopupControl1.Hide(); }" />
                        </dx:ASPxButton>--%>
                        <div style="direction: rtl">
                            <h2>اختر</h2>
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" EnableTheming="True"
                                Theme="Default" DataSourceID="DS_Schools_master" EnableViewState="true"
                                KeyFieldName="school_code"
                                OnRowCommand="ASPxGridView1_RowCommand">
                                <Columns>
                                    <dx:GridViewCommandColumn VisibleIndex="0">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="اسم المؤسسة التعليمية - E" FieldName="school_name_en"
                                        ShowInCustomizationForm="True" VisibleIndex="3" Width="425px">
                                        <DataItemTemplate>
                                            <asp:LinkButton runat="server" ID="ddd" Text='<%# Eval("school_name_en") %>' CommandName="name"
                                                CommandArgument='<%# Eval("school_code") %>' OnClientClick="configureLoadingForSearchPopup();">
                                            
                                            </asp:LinkButton>
                                        </DataItemTemplate>

                                    </dx:GridViewDataHyperLinkColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="اسم المؤسسة التعليمية - ع" FieldName="school_name_ar"
                                        VisibleIndex="2" Width="425px">
                                        <DataItemTemplate>
                                            <asp:LinkButton runat="server" ID="ddd" Text='<%# Eval("school_name_ar") %>' CommandName="name"
                                                CommandArgument='<%# Eval("school_code") %>' OnClientClick="configureLoadingForSearchPopup();">
                                            
                                            </asp:LinkButton>
                                        </DataItemTemplate>
                                    </dx:GridViewDataHyperLinkColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="الكود" ShowInCustomizationForm="True"
                                        VisibleIndex="1" FieldName="school_code">
                                        <DataItemTemplate>
                                            <asp:LinkButton runat="server" ID="ddd" Text='<%# Eval("school_code") %>' CommandName="name"
                                                CommandArgument='<%# Eval("school_code") %>' OnClientClick="configureLoadingForSearchPopup();">
                                            
                                            </asp:LinkButton>
                                        </DataItemTemplate>
                                    </dx:GridViewDataHyperLinkColumn>
                                </Columns>
                                <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                                <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="DS_Schools_master" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT [school_code], [school_name_ar], [school_name_en] FROM [school_master]"></asp:SqlDataSource>

                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>

            <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="Callback">
                <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Hide(); }" />
            </dx:ASPxCallback>
            <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
                Modal="true" Text="برجاء الانتظار .." RightToLeft="True">
            </dx:ASPxLoadingPanel>
   
</asp:Content>
