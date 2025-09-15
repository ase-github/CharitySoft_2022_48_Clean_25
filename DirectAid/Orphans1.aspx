<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Orphans1.aspx.vb" Inherits="DirectAid.Orphans1"
    ClientIDMode="Static" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title></title>
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
    <script type="text/javascript">





        function pageLoad() {
            //Date picker for the Date



            //  $("#txt_birth_date").datepicker({
            //   changeMonth: true,
            //       changeYear: true,
            //      dateFormat: 'dd/mm/yy',
            //     yearRange: 'c-110:c+70'
            // });


            //   $("#txt_father_death_date").datepicker({
            //     changeMonth: true,
            //    changeYear: true,
            //  dateFormat: 'dd/mm/yy',
            //  yearRange: 'c-110:c+70'
            // });



            $('#txt_app_ser').keydown(function (event) {
                var actualkey = String.fromCharCode(event)
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





            $('#txt_brothers_count').keydown(function (event) {
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


            $('#txt_guaranteed_brothers').keydown(function (event) {
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




            $('#txt_mother_salary').keydown(function (event) {
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

            $(".postitveNumber").keydown(function (e) {
                //var evtobj = window.event ? event : e;  //distinguish between IE's explicit event object (window.event) and Firefox's implicit.
                //var unicode = evtobj.charCode ? evtobj.charCode : evtobj.keyCode;
                //var actualkey = String.fromCharCode(unicode);

                if (e.keyCode == 45 || e.keyCode == 109 || e.keyCode == 189) {
                    e.preventDefault();
                }
            });

        }




        function Search() {

            var key = event.keyCode;
            var i = document.getElementById("lnk_search_rtn");

            if (key == 13) {
                i.click();

            }

        }


        function Search_Names() {


            var i = document.getElementById("lnk_search_rtn");
            i.click();



        }



        function GetFatherName() {

            var i = document.getElementById("lnk_Get_Father_name");
            i.click();
            document.getElementById("txt_name_en_1").focus();


        }


        function open_education() {

            var i;
            var j;
            var k;
            var floatingWindow;
            i = (event.keyCode);
            floatingWindow = open("", "", "width=600,height=600");
            floatingWindow.location.href = "orphans_education.aspx";
            return false;
        }


        function open_health() {

            var i;
            var j;
            var k;
            var floatingWindow;
            i = (event.keyCode);
            floatingWindow = open("", "", "width=600,height=600");
            floatingWindow.location.href = "orphans_health_file.aspx";
            return false;
        }



        function open_transfer() {

            var i;
            var j;
            var k;
            var floatingWindow;
            i = (event.keyCode);
            floatingWindow = open("", "", "width=1000,height=600");
            floatingWindow.location.href = "orphans_transfer1.aspx";
            return false;
        }

        function open_search_names_scrn() {

            var i;
            var j;
            var k;
            var floatingWindow;
            i = (event.keyCode);
            floatingWindow = open("", "", "width=700,height=700");
            floatingWindow.location.href = "search_screen_benf.aspx?searchFLAG=1";
            return false;
        }

        function open_allocation() {

            var i;
            var j;
            var k;
            var floatingWindow;
            i = (event.keyCode);
            floatingWindow = open("", "", "width=1000,height=600");
            floatingWindow.location.href = "allocate_donor.aspx";
            return false;
        }



        function getFile() {
            document.getElementById("file1").click();
            var file = "";
            if (document.getElementById("TextBox1").value == "") {
                file = document.getElementById("file1").value;
                document.getElementById("TextBox1").value = file

            }
            else {
                file = document.getElementById("TextBox1").value +
            "\r\n" + document.getElementById("file1").value;
                document.getElementById("TextBox1").value = file;
            }
        }








        //             function detectSubstract(e) {
        //                 var evtobj = window.event ? event : e;  //distinguish between IE's explicit event object (window.event) and Firefox's implicit.
        //                 var unicode = evtobj.charCode ? evtobj.charCode : evtobj.keyCode;
        //                 var actualkey = String.fromCharCode(unicode);


        //                 if (actualkey == "-") {
        //                     e.preventDefault();
        //                 }
        //             }

        //document.onkeypress = detectSubstract

        function file1_onclick() {

        }

    </script>
    <style type="text/css">
        .style77
        {
            width: 702px;
            height: 35px;
            margin-right: 40px;
        }
        .style23
        {
            height: 25px;
            margin-right: 40px;
        }
        .style58
        {
            width: 145px;
        }
        .style5
        {
            width: 50px;
        }
        .style55
        {
            height: 23px;
            margin-right: 40px;
        }
        .style66
        {
            height: 23px;
            width: 494px;
        }
        .style64
        {
            height: 23px;
        }
        .style80
        {
            height: 18px;
        }
        .style81
        {
            height: 28px;
        }
        .style82
        {
            width: 145px;
            height: 28px;
        }
        .style83
        {
            width: 50px;
            height: 28px;
        }
        .style84
        {
            height: 23px;
            width: 388px;
        }
        .style87
        {
            height: 34px;
        }
        .style88
        {
            height: 26px;
            width: -300;
        }
        .style89
        {
            height: 26px;
        }
        .style91
        {
            width: 702px;
            height: 18px;
        }
        .postitveNumber
        {
        }
        .style94
        {
            width: 702px;
        }
        .style95
        {
            width: 158px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div style="margin-left: 40px" dir="ltr">
                <table dir="rtl" style="width: 100%; height: 410px;">
                    <tr>
                        <td bgcolor="#F2F9FF" class="style95" dir="rtl">
                            <a id="lnk_new" runat="server">
                                <img alt="" border="0" src="images/New_32x32.png" style="height: 30px; width: 30px;" />
                            </a>&nbsp;<a id="lnk_search" runat="server"><img alt="" border="0" src="images/Find_32x32.png"
                                style="height: 32px; width: 32px;" />
                            </a>&nbsp;<a id="lnk_save" runat="server"><img alt="" border="0" src="images/Save_32x32.png"
                                style="width: 32px; height: 32px;" />
                            </a>&nbsp;<a id="lnk_search_rtn" runat="server" visible="True"></a><a id="lnk_Get_Father_name"
                                runat="server" visible="True"></a>&nbsp; &nbsp;&nbsp;
                        </td>
                        </caption>
                        <td bgcolor="#F2F9FF" class="style94" dir="rtl">
                            <asp:Panel ID="Panel1" runat="server">
                                <a id="Link_Pic" runat="server" visible="True" style="color: #0000FF; text-decoration: underline;
                                    font-family: Arial">مرفقات</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a id="Link_Edu" runat="server"
                                        style="color: #0000FF; text-decoration: underline; font-family: Arial" visible="True">
                                        البيانات التعليمية</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a id="Link_Health" runat="server"
                                            style="color: #0000FF; text-decoration: underline; font-family: Arial" visible="True">
                                            الملف الصحي</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a id="Link_Allocate" runat="server"
                                                style="color: #0000FF; text-decoration: underline; font-family: Arial" visible="True">
                                                تخصيص كافل</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a id="Link_transfer" runat="server"
                                                    style="color: #0000FF; text-decoration: underline; font-family: Arial" visible="True">
                                                    نقل اليتيم</a><asp:Literal ID="Literal1" runat="server" Visible="False"></asp:Literal>
                            </asp:Panel>
                        </td>
                    </tr>
                    </td> </tr>
                    <caption>
                        </tr>
                        <tr>
                            <td bgcolor="#F2F9FF" class="style77" dir="rtl" colspan="2">
                                <dx:ASPxPageControl ID="ASPxPageControl2" runat="server" ActiveTabIndex="0" Height="598px"
                                    Theme="Aqua" Width="914px">
                                    <TabPages>
                                        <dx:TabPage Name="oprhans_Basic_info" Text="بيانات اليتيم الأساسية">
                                            <ContentCollection>
                                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                    <table bgcolor="#F1F7FC" style="width: 100%; height: 73px;">
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label290" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="رقم اليتيم"></asp:Label>
                                                            </td>
                                                            <td colspan="2">
                                                                <asp:TextBox ID="txt_app_ser" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                                                    BorderStyle="Solid" BorderWidth="1px" ClientIDMode="Static" Enabled="False" Font-Names="Tahoma"
                                                                    Font-Size="8pt" Height="21px" Width="52px" CssClass="postitveNumber" AutoCompleteType="Disabled"
                                                                    MaxLength="5"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                <%--    <span>
                                                                    <img alt="Search by names" border="0" height="24" src="images/Find_32x32.png" style="visibility: visible;
                                                                        width: 24px; height: 22px" onclick="open_search_names_scrn();" />
                                                                    <img alt="Search by names" border="0" height="24" src="images/Find_32x32.png" style="visibility: visible;
                                                                        width: 24px; height: 22px" onclick="open_search_names_scrn();" /><img alt="Search by names"
                                                                            border="0" height="24" src="images/Find_32x32.png" style="visibility: visible;
                                                                            width: 24px; height: 22px" onclick="open_search_names_scrn();" /><img alt="Search by names"
                                                                                border="0" height="24" src="images/Find_32x32.png" style="visibility: visible;
                                                                                width: 24px; height: 22px" onclick="open_search_names_scrn();" /><img alt="Search by names"
                                                                                    border="0" height="24" src="images/Find_32x32.png" style="visibility: visible;
                                                                                    width: 24px; height: 22px" onclick="open_search_names_scrn();" /><img alt="Search by names"
                                                                                        border="0" height="24" src="images/Find_32x32.png" style="visibility: visible;
                                                                                        width: 24px; height: 22px" onclick="open_search_names_scrn();" /></span>--%>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label293" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="تاريخ التسجيل"
                                                                    Width="70px"></asp:Label>
                                                            </td>
                                                            <td colspan="2">
                                                                <asp:TextBox ID="txt_reg_date" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                                                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px"
                                                                    Width="120px" ReadOnly="True"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label115" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="الاسم باللغة العربية"
                                                                    Width="96px"></asp:Label>
                                                                <asp:Label ID="Label306" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                                                    Text="*"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_name_ar_1" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" MaxLength="25"
                                                                    Width="52px" TabIndex="1"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_name_ar_2" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="52px"
                                                                    MaxLength="25" TabIndex="2"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_name_ar_3" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="52px"
                                                                    MaxLength="25" TabIndex="3"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_name_ar_4" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="52px"
                                                                    MaxLength="25" TabIndex="4"></asp:TextBox>
                                                            </td>
                                                            <td style="margin-right: 200px">
                                                                <asp:TextBox ID="txt_name_ar_5" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="52px"
                                                                    MaxLength="25" TabIndex="5"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label294" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="الاسم باللغة الانجليزية"
                                                                    Width="116px"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_name_en_1" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="52px"
                                                                    MaxLength="25" TabIndex="6"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_name_en_2" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="52px"
                                                                    MaxLength="25" TabIndex="7"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_name_en_3" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="52px"
                                                                    MaxLength="25" TabIndex="8"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_name_en_4" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="52px"
                                                                    MaxLength="25" TabIndex="9"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_name_en_5" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="52px"
                                                                    MaxLength="25" TabIndex="10"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table bgcolor="#F1F7FC" cellspacing="1" dir="rtl" style="width: 100%; height: 163px;">
                                                        <tr>
                                                            <td class="style23" colspan="6">
                                                            </td>
                                                            <td class="style23">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style24">
                                                                <asp:Label ID="Label125" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="الجنس"></asp:Label>
                                                                <asp:Label ID="Label307" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                                                    Text="*"></asp:Label>
                                                            </td>
                                                            <td class="style58">
                                                                <asp:RadioButtonList ID="opt_gender" runat="server" Font-Names="Tahoma" Font-Size="8pt"
                                                                    Height="16px" RepeatDirection="Horizontal" Width="97px" TabIndex="11">
                                                                    <asp:ListItem>ذكر</asp:ListItem>
                                                                    <asp:ListItem>أنثى</asp:ListItem>
                                                                </asp:RadioButtonList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label15" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="تاريخ الميلاد"></asp:Label>
                                                                <asp:Label ID="Label308" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                                                    Text="*"></asp:Label>
                                                            </td>
                                                            <td class="style13">
                                                                <dx:ASPxDateEdit ID="txt_birth_date" runat="server" DisplayFormatString="dd/MM/yyyy"
                                                                    EditFormat="Custom" TabIndex="12" Theme="Aqua">
                                                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                                                        <RequiredField IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxDateEdit>
                                                            </td>
                                                            <td class="style5">
                                                                <asp:Label ID="Label292" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="الجنسية"></asp:Label>
                                                            </td>
                                                            <td dir="rtl">
                                                                <asp:DropDownList ID="ddl_nat" runat="server" Height="21px" Width="156px" TabIndex="13">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td dir="rtl">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style81">
                                                                <asp:Label ID="Label288" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="الدولة"></asp:Label>
                                                            </td>
                                                            <td class="style82">
                                                                <asp:DropDownList ID="ddl_country" runat="server" Height="21px" Width="170px" TabIndex="14"
                                                                    AutoPostBack="True">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="style81">
                                                                <asp:Label ID="Label287" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="المدينة"></asp:Label>
                                                            </td>
                                                            <td class="style81">
                                                                <asp:DropDownList ID="ddl_city" runat="server" Height="21px" Width="170px" TabIndex="15">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="style83">
                                                                <asp:Label ID="Label140" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="الديانة"></asp:Label>
                                                            </td>
                                                            <td class="style81" dir="rtl">
                                                                <asp:DropDownList ID="ddl_religion" runat="server" Height="21px" Width="156px" TabIndex="16">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="style81" dir="rtl">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style24">
                                                                <asp:Label ID="Label286" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="القرية"></asp:Label>
                                                            </td>
                                                            <td class="style58">
                                                                <asp:TextBox ID="txt_village" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="164px"
                                                                    MaxLength="30" TabIndex="17"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label285" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="القبيلة"></asp:Label>
                                                            </td>
                                                            <td class="style13">
                                                                <asp:TextBox ID="ddl_clan" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                                                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px"
                                                                    Width="164px"></asp:TextBox>
                                                            </td>
                                                            <td class="style5">
                                                                <asp:Label ID="Label284" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="بلد الأقامة"
                                                                    Width="60px"></asp:Label>
                                                            </td>
                                                            <td dir="rtl">
                                                                <asp:DropDownList ID="ddl_residence_country" runat="server" AutoPostBack="True" Height="21px"
                                                                    Width="156px" TabIndex="19">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td dir="rtl">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style24">
                                                                <asp:Label ID="Label129" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="وضع اليتيم"
                                                                    Width="52px"></asp:Label>
                                                            </td>
                                                            <td class="style58">
                                                                <asp:DropDownList ID="ddl_app_type" runat="server" Height="21px" Width="170px" TabIndex="20">
                                                                    <asp:ListItem Value="1">مرشح</asp:ListItem>
                                                                    <asp:ListItem Value="2">غير مخصص</asp:ListItem>
                                                                    <asp:ListItem Value="3">مخصص</asp:ListItem>
                                                                    <asp:ListItem Value="4">مرفوض</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label283" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="16px"
                                                                    Text="اسم الكافل الحالي" Width="92px"></asp:Label>
                                                            </td>
                                                            <td class="style13">
                                                                <asp:TextBox ID="txt_donor_name" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                                                    BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px"
                                                                    Width="164px" ReadOnly="True" Enabled="False"></asp:TextBox>
                                                            </td>
                                                            <td class="style5">
                                                                <asp:Label ID="Label282" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="تاريخ التخصيص للكافل"
                                                                    Width="113px"></asp:Label>
                                                            </td>
                                                            <td dir="rtl">
                                                                <asp:TextBox ID="txt_allocation_date" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                                                    BorderStyle="Solid" BorderWidth="1px" Enabled="False" Font-Names="Tahoma" Font-Size="9pt"
                                                                    Height="21px" Width="150px" ReadOnly="True" TabIndex="22"></asp:TextBox>
                                                            </td>
                                                            <td dir="rtl">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style24">
                                                                <asp:Label ID="Label309" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="المركز"
                                                                    Width="100%"></asp:Label>
                                                            </td>
                                                            <td class="style58">
                                                                <dx:ASPxComboBox ID="ASPxComboBox_Center_id" runat="server" Width="100%" AutoPostBack="True"
                                                                    DataSourceID="SqlDataSource_center_tab" TextField="center_namear" ValueField="center_code"
                                                                    ValueType="System.Int32">
                                                                </dx:ASPxComboBox>
                                                                <asp:SqlDataSource ID="SqlDataSource_center_tab" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>"
                                                                    SelectCommand="SELECT [center_code], [center_namear], [center_nameen] FROM [center_tab]">
                                                                </asp:SqlDataSource>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label310" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="الدار"
                                                                    Width="100%"></asp:Label>
                                                            </td>
                                                            <td class="style13">
                                                                <dx:ASPxComboBox ID="ASPxComboBox_orphanage_code" runat="server" Width="100%" DataSourceID="SqlDataSource_orphanage_tab"
                                                                    TextField="orphanage_name" ValueField="orphanage_code" ValueType="System.Int32">
                                                                </dx:ASPxComboBox>
                                                                <asp:SqlDataSource ID="SqlDataSource_orphanage_tab" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>"
                                                                    SelectCommand="SELECT [orphanage_code], [orphanage_name], [Center_id] FROM [orphanage_tab] WHERE ([Center_id] = @Center_id)">
                                                                    <SelectParameters>
                                                                        <asp:ControlParameter ControlID="ASPxComboBox_Center_id" Name="Center_id" PropertyName="Value"
                                                                            Type="Int32" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </td>
                                                            <td class="style5">
                                                                &nbsp;
                                                            </td>
                                                            <td dir="rtl">
                                                                &nbsp;
                                                            </td>
                                                            <td dir="rtl">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style24" colspan="6">
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;&nbsp;&nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table bgcolor="#F1F7FC" style="width: 100%; height: 78px;">
                                                        <tr>
                                                            <td class="style55">
                                                                <asp:Label ID="Label119" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="اسم الاب"
                                                                    Width="49px"></asp:Label>
                                                            </td>
                                                            <td class="style55">
                                                                <asp:TextBox ID="txt_father_name_1" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                                                    BorderStyle="Solid" BorderWidth="1px" Enabled="False" Font-Names="Tahoma" Font-Size="9pt"
                                                                    Height="21px" Width="57px" MaxLength="10"></asp:TextBox>
                                                            </td>
                                                            <td class="style55">
                                                                <asp:TextBox ID="txt_father_name_2" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                                                    BorderStyle="Solid" BorderWidth="1px" Enabled="False" Font-Names="Tahoma" Font-Size="9pt"
                                                                    Height="21px" Width="57px" MaxLength="1"></asp:TextBox>
                                                            </td>
                                                            <td class="style55">
                                                                <asp:TextBox ID="txt_father_name_3" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                                                    BorderStyle="Solid" BorderWidth="1px" Enabled="False" Font-Names="Tahoma" Font-Size="9pt"
                                                                    Height="21px" Width="57px" MaxLength="10"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_father_name_4" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                                                    BorderStyle="Solid" BorderWidth="1px" Enabled="False" Font-Names="Tahoma" Font-Size="9pt"
                                                                    Height="21px" Width="57px"></asp:TextBox>
                                                            </td>
                                                            <td class="style55">
                                                                <asp:Label ID="Label120" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="اسم الأم"
                                                                    Width="73px"></asp:Label>
                                                            </td>
                                                            <td class="style84">
                                                                <asp:TextBox ID="txt_mother_name_1" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="85%"
                                                                    MaxLength="10" TabIndex="23"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                                                    ControlToValidate="txt_mother_name_1" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="style64" colspan="2">
                                                                <asp:TextBox ID="txt_mother_name_2" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="85%"
                                                                    MaxLength="10" TabIndex="24"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                                                                    ControlToValidate="txt_mother_name_2" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="style64">
                                                                <asp:TextBox ID="txt_mother_name_3" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="99px"
                                                                    MaxLength="10" TabIndex="25"></asp:TextBox>
                                                            </td>
                                                            <td class="style64">
                                                                <asp:TextBox ID="txt_mother_name_4" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="99px"
                                                                    MaxLength="10" TabIndex="26"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style55">
                                                                <asp:Label ID="Label235" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                                                                    Text="وظيفة الأم" Width="64px"></asp:Label>
                                                            </td>
                                                            <td class="style55" colspan="4">
                                                                <asp:DropDownList ID="ddl_mother_job" runat="server" Height="22px" Width="263px"
                                                                    TabIndex="27">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                                                                    ControlToValidate="ddl_mother_job" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="style66">
                                                                <asp:Label ID="Label234" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                                                                    Text="الدخل الشهري" Width="71px"></asp:Label>
                                                            </td>
                                                            <td class="style84">
                                                                <asp:TextBox ID="txt_mother_salary" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="100px"
                                                                    CssClass="postitveNumber" MaxLength="8" TabIndex="28">0</asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*"
                                                                    ControlToValidate="txt_mother_salary" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                            <td class="style64">
                                                                <asp:Label ID="Label233" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                                                                    Text="العملة" Width="31px"></asp:Label>
                                                            </td>
                                                            <td class="style64">
                                                                <asp:DropDownList ID="ddl_currency" runat="server" Height="22px" Width="69px" Enabled="False">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="style64">
                                                                <asp:Label ID="Label299" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                                                                    Text="ديانة الأم" Width="52px"></asp:Label>
                                                            </td>
                                                            <td class="style64">
                                                                <asp:DropDownList ID="ddl_mother_religion" runat="server" Height="21px" Width="105px"
                                                                    TabIndex="29">
                                                                </asp:DropDownList>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*"
                                                                    ControlToValidate="ddl_mother_religion" ForeColor="Red"></asp:RequiredFieldValidator>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style55">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style55" colspan="4">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style66">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style84">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style64">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style64">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style64">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style64">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table bgcolor="#F1F7FC" style="width: 100%; height: 57px;">
                                                        <tr>
                                                            <td class="style88">
                                                                <asp:Label ID="Label305" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="حالة الطلب"
                                                                    Width="63px"></asp:Label>
                                                            </td>
                                                            <td class="style89">
                                                                <asp:TextBox ID="ddl_status" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" MaxLength="25"
                                                                    TabIndex="6" Width="191px" Enabled="False">انتظار</asp:TextBox>
                                                            </td>
                                                            <td class="style89">
                                                                <a id="lnk_pending" runat="server" style="color: #0000FF; font-family: Tahoma; font-size: small;
                                                                    text-decoration: underline;">انتظار</a>
                                                            </td>
                                                            <td class="style88" style="width: -11" width="30">
                                                                <a id="lnk_Accepted" runat="server" style="color: #0000FF; font-family: Tahoma; font-size: small;
                                                                    text-decoration: underline;" title="قبول">قبول</a> &#160;&#160;
                                                            </td>
                                                            <td class="style88" style="width: -6" width="30">
                                                                <a id="lnk_rejected" runat="server" style="color: #0000FF; font-family: Tahoma; font-size: small;
                                                                    text-decoration: underline;" title="رفض">رفض</a> &#160;&#160;
                                                            </td>
                                                            <td class="style88" style="width: -3" width="30">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style88" style="width: 0" width="30">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style88" style="width: 2px" width="30">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style88">
                                                                &nbsp;
                                                            </td>
                                                            <td class="style88">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label302" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="مرفوض من خلال"
                                                                    Width="81px"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddl_rejected_by" runat="server" Enabled="False" Height="21px"
                                                                    Width="206px" TabIndex="30">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label297" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="سبب الرفض"
                                                                    Width="60px"></asp:Label>
                                                            </td>
                                                            <td colspan="6">
                                                                <asp:DropDownList ID="ddl_reasons" runat="server" Enabled="False" Height="21px" Width="206px"
                                                                    TabIndex="31">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label298" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="ملاحظات عامة"
                                                                    Width="69px"></asp:Label>
                                                            </td>
                                                            <td colspan="10">
                                                                <asp:TextBox ID="txt_general_notes" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="61px" Width="796px"
                                                                    MaxLength="250" Rows="50" TextMode="MultiLine" TabIndex="32"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table bgcolor="#F1F7FC" style="width: 100%; height: 184px;">
                                                        <tr>
                                                            <td class="style80" style="margin-right: 120px">
                                                            </td>
                                                            <td class="style80">
                                                            </td>
                                                            <td class="style80">
                                                            </td>
                                                            <td class="style80" colspan="2">
                                                            </td>
                                                            <td class="style80">
                                                            </td>
                                                            <td class="style80" colspan="3">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="margin-right: 120px">
                                                                <asp:Label ID="Label131" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="نوع اليتيم"
                                                                    Width="60px"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="ddl_orp_type" runat="server" AutoPostBack="True" Height="21px"
                                                                    Width="95px" TabIndex="33">
                                                                    <asp:ListItem>داخلي</asp:ListItem>
                                                                    <asp:ListItem>خارجي</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label206" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="مكان الاقامة"></asp:Label>
                                                            </td>
                                                            <td colspan="2">
                                                                <asp:DropDownList ID="ddl_residence_place" runat="server" Height="21px" Width="200px"
                                                                    TabIndex="34">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbl_orphanage" runat="server" Font-Names="Tahoma" Font-Size="8pt"
                                                                    Text="صلة القرابة" Width="60px"></asp:Label>
                                                            </td>
                                                            <td colspan="3">
                                                                <asp:DropDownList ID="ddl_rel_type" runat="server" Enabled="False" Height="21px"
                                                                    Width="206px" TabIndex="35">
                                                                    <asp:ListItem>الام</asp:ListItem>
                                                                    <asp:ListItem>العم</asp:ListItem>
                                                                    <asp:ListItem>العمة</asp:ListItem>
                                                                    <asp:ListItem>خال</asp:ListItem>
                                                                    <asp:ListItem>خالة</asp:ListItem>
                                                                    <asp:ListItem>جد</asp:ListItem>
                                                                    <asp:ListItem>جدة</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="margin-right: 120px">
                                                                <asp:Label ID="lbl_name" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="اسم المعيل"
                                                                    Width="58px"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_guarantor_name" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Enabled="False" Font-Names="Tahoma" Font-Size="9pt" Height="21px"
                                                                    Width="200px" MaxLength="50" TabIndex="36"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbl_job" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="وظيفة المعيل"
                                                                    Width="70px"></asp:Label>
                                                            </td>
                                                            <td colspan="2">
                                                                <asp:DropDownList ID="ddl_guarantor_job" runat="server" Enabled="False" Height="21px"
                                                                    Width="200px" TabIndex="37">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbl_religion" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                                                                    Text="الديانة" Width="34px"></asp:Label>
                                                            </td>
                                                            <td colspan="3">
                                                                <asp:DropDownList ID="ddl_guarantor_religion" runat="server" Enabled="False" Height="21px"
                                                                    Width="206px" TabIndex="38">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="margin-right: 120px">
                                                                <asp:Label ID="lbl_address" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="العنوان"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="txt_guarantor_address" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Enabled="False" Font-Names="Tahoma" Font-Size="9pt" Height="21px"
                                                                    Width="200px" MaxLength="150" TabIndex="39"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label289" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="مرشح من قبل"></asp:Label>
                                                            </td>
                                                            <td colspan="2">
                                                                <asp:DropDownList ID="ddl_nominated_by" runat="server" Height="21px" Width="200px"
                                                                    TabIndex="40">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label301" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text=" اسم جهة الترشيح"></asp:Label>
                                                            </td>
                                                            <td colspan="3">
                                                                <asp:TextBox ID="txt_nominated_by_name" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="200px"
                                                                    MaxLength="50" TabIndex="45"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="margin-right: 120px">
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td colspan="2">
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td colspan="3">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="style87" style="margin-right: 120px">
                                                                <asp:Label ID="Label121" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="حالة الأبوين"></asp:Label>
                                                            </td>
                                                            <td class="style87">
                                                                <asp:DropDownList ID="ddl_parents_status" runat="server" Height="21px" Width="206px"
                                                                    TabIndex="46">
                                                                    <asp:ListItem>متوفى الأب</asp:ListItem>
                                                                    <asp:ListItem>كلاهما متوفى</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="style87">
                                                                <asp:Label ID="Label122" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="تاريخ وفاة الأب"></asp:Label>
                                                            </td>
                                                            <td class="style87" colspan="2">
                                                                <dx:ASPxDateEdit ID="txt_father_death_date" runat="server" DisplayFormatString="dd/MM/yyyy"
                                                                    EditFormat="Custom" Height="16px" TabIndex="12" Theme="Aqua" Width="202px">
                                                                </dx:ASPxDateEdit>
                                                            </td>
                                                            <td class="style87">
                                                                <asp:Label ID="Label242" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="عدد الاخوة"></asp:Label>
                                                            </td>
                                                            <td class="style87">
                                                                <asp:TextBox ID="txt_brothers_count" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="61px"
                                                                    CssClass="postitveNumber" TabIndex="48" MaxLength="2"></asp:TextBox>
                                                            </td>
                                                            <td class="style87">
                                                                <asp:Label ID="Label243" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="عدد الاخوة المكفولين"
                                                                    Width="50px"></asp:Label>
                                                            </td>
                                                            <td class="style87">
                                                                <asp:TextBox ID="txt_guaranteed_brothers" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                                                    BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="61px"
                                                                    CssClass="postitveNumber" MaxLength="2" TabIndex="49"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="margin-right: 120px">
                                                                &nbsp;
                                                            </td>
                                                            <td colspan="2">
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                            <td colspan="3">
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </dx:ContentControl>
                                            </ContentCollection>
                                        </dx:TabPage>
                                    </TabPages>
                                </dx:ASPxPageControl>
                            </td>
                        </tr>
                    </caption>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
