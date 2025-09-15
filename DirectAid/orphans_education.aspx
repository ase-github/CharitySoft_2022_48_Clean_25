<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="orphans_education.aspx.vb"
    Inherits="DirectAid.orphans_education" ClientIDMode="Static" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Xpo.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Xpo" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
    <script type="text/javascript">



        function pageLoad() {



            //      $("#txt_school_reg_date").datepicker({
            //       changeMonth: true,
            //    changeYear: true,
            //   dateFormat: 'dd/mm/yy',
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

        function OnCountryChanged(HobyyType) {
            grd_hobby.GetEditor("hobby_code").PerformCallback(HobyyType.GetValue().toString());
        }


        //   function OnTypeChanged(cmbHobbytype) {
        //     grd_hobby.GetEditor("hobby_code").PerformCallback(cmbHobbytype.GetValue().toString());
        //  }

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



        function open_hist_scrn() {

            var i;
            var j;
            var k;
            var floatingWindow;
            i = (event.keyCode);
            floatingWindow = open("", "", "width=900,height=600");
            floatingWindow.location.href = "orphans_edu_hist.aspx?searchFLAG=1";
            return false;
        }




        function detectSubstract(e) {
            var evtobj = window.event ? event : e;  //distinguish between IE's explicit event object (window.event) and Firefox's implicit.
            var unicode = evtobj.charCode ? evtobj.charCode : evtobj.keyCode;
            var actualkey = String.fromCharCode(unicode);

            if (actualkey == "-") {
                e.preventDefault();
            }
        }
        document.onkeypress = detectSubstract


    </script>
    <style type="text/css">
        .style41
        {
            height: 22px;
        }
        .style61
        {
            width: 66px;
            height: 22px;
        }
        
        a:link, a:visited
        {
            color: #034af3;
        }
        
        .style63
        {
            width: 66px;
            height: 28px;
        }
        .style64
        {
            height: 22px;
            width: 524px;
        }
        .style65
        {
            height: 28px;
            width: 524px;
        }
        .style66
        {
            height: 22px;
            width: 908px;
        }
        .style67
        {
            height: 28px;
            width: 908px;
        }
        .style68
        {
            height: 22px;
            width: 102px;
        }
        .style69
        {
            height: 28px;
            width: 102px;
        }
        .style70
        {
            width: 102px;
        }
        .style71
        {
            height: 32px;
            width: 102px;
        }
        .style72
        {
            height: 32px;
        }
        .style73
        {
            height: 32px;
            width: 524px;
        }
        .style74
        {
            height: 32px;
            width: 908px;
        }
        .style75
        {
            width: 66px;
            height: 32px;
        }
        .style76
        {
            height: 28px;
        }
        .style78
        {
            height: 32px;
            width: 209px;
        }
        .style79
        {
            height: 28px;
            width: 209px;
        }
        .style80
        {
            height: 22px;
            width: 209px;
        }
        .style81
        {
            height: 22px;
            width: 268435648px;
        }
        .style82
        {
            height: 22px;
            width: 275px;
        }
        .style83
        {
            height: 32px;
            width: 275px;
        }
        .style84
        {
            height: 28px;
            width: 275px;
        }
    
.dxpControl_Aqua
{
	font: 12px Tahoma;
	color: #C7DFFF;
}
.dxpSummary_Aqua
{
	color: #749BCA;
	white-space: nowrap;
	text-align: center;
	vertical-align: middle;
	padding: 0px 4px;
}
.dxpButton_Aqua
{
	color: #3F66A0;
	text-decoration: underline;
	white-space: nowrap;
	text-align: center;
	vertical-align: middle;
}

.dxpDisabledButton_Aqua
{
	color: #000000;
	text-decoration: none;
}
.dxpDisabled_Aqua
{
	color: #A6A6A6;
	border-color: #A6A6A6;
	cursor: default;
}

.dxWeb_pPrevDisabled_Aqua
{
	display:inline;
}

.dxWeb_pPrevDisabled_Aqua {
    background-position: -105px -25px;
    width: 19px;
    height: 19px;
}

.dxpPageNumber_Aqua
{
	color: #3F66A0;
	text-decoration: underline;
	text-align: center;
	vertical-align: middle;
	padding: 0px 5px;
}

.dxpCurrentPageNumber_Aqua
{
	color: #000000;
	text-decoration: none;
	padding: 0px 3px;
	background-color: #FFE7A2;
	border: 1px solid #FFBD69;
	white-space: nowrap;
}

.dxWeb_pNextDisabled_Aqua {
    background-position: -81px -25px;
    width: 19px;
    height: 19px;
}

        .dxWeb_pNextDisabled_Aqua
{
	display:inline;
}

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 664px">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
                <table bgcolor="#F1F7FC" cellspacing="1" dir="rtl" style="width: 86%; height: 163px;
                    margin-right: 74px;">
                    <tr>
                        <td class="style68">
                            &nbsp;
                        </td>
                        <td class="style41">
                            <a id="lnk_search" runat="server">
                                <img alt="" border="0" src="images/Find_32x32.png" style="height: 32px; width: 32px;" />
                            </a><a id="lnk_save" runat="server">
                                <img alt="" border="0" src="images/Save_32x32.png" style="width: 32px; height: 32px;" />
                            </a><a id="lnk_search_rtn" runat="server" visible="True"></a><a id="lnk_get_orphan_name"
                                runat="server" visible="True"></a>
                        </td>
                        <td class="style41" colspan="2">
                            &nbsp;
                        </td>
                        <td class="style41" colspan="2">
                            <asp:Literal ID="Literal1" runat="server" Visible="False"></asp:Literal>
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41" colspan="2">
                            &nbsp;
                        </td>
                        <td class="style81" colspan="2">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            &nbsp;
                        </td>
                        <td class="style41">
                            <span>
                                &nbsp;</span></td>
                    </tr>
                    <tr>
                        <td class="style68">
                            &nbsp;
                        </td>
                        <td class="style41" colspan="25">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style68">
                            &nbsp;
                        </td>
                        <td class="style82" colspan="2">
                            <asp:Label ID="Label216" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="16px"
                                Text="رقم اليتيم" Width="59px"></asp:Label>
                            <asp:Label ID="Label306" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                Text="*"></asp:Label>
                        </td>
                        <td class="style80" colspan="2">
                            <asp:TextBox ID="txt_app_ser" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px"
                                Width="155px" AutoCompleteType="Disabled" MaxLength="5"></asp:TextBox>
                        </td>
                        <td class="style64" colspan="2">
                            &nbsp;
                        </td>
                        <td class="style66" colspan="2">
                            <span>
                                <img alt="Search by names" border="0" height="24" src="images/Find_32x32.png" style="visibility: visible;
                                    width: 24px; height: 22px" onclick="open_search_names_scrn();" /></span>
                        </td>
                        <td class="style41" colspan="2">
                            <asp:Label ID="Label217" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="اسم اليتيم"></asp:Label>
                        </td>
                        <td class="style61" colspan="15">
                            <asp:TextBox ID="txt_orphan_name" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px"
                                Width="252px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style68">
                            &nbsp;
                        </td>
                        <td class="style82" colspan="2">
                            <asp:Label ID="Label213" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="16px"
                                Text="تاريخ التسجيل" Width="70px"></asp:Label>
                            <asp:Label ID="Label307" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                Text="*"></asp:Label>
                        </td>
                        <td class="style80" colspan="2">
                            <dx:ASPxDateEdit ID="txt_school_reg_date" runat="server" DisplayFormatString="dd/MM/yyyy"
                                EditFormat="Custom" Theme="Aqua" Width="160px">
                            </dx:ASPxDateEdit>
                        </td>
                        <td class="style64" colspan="2">
                            &nbsp;
                        </td>
                        <td class="style66" colspan="2">
                            &nbsp;
                        </td>
                        <td class="style41" colspan="2">
                            <asp:Label ID="Label148" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="جهة الدراسة"></asp:Label>
                        </td>
                        <td class="style61" colspan="15">
                            <asp:DropDownList ID="ddl_organization_type" runat="server" AutoPostBack="True" Height="21px"
                                Width="160px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style71">
                            &nbsp;
                        </td>
                        <td class="style83" colspan="2">
                            <asp:Label ID="Label210" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="اسم الجهه"></asp:Label>
                        </td>
                        <td class="style78" colspan="2">
                            <asp:DropDownList ID="ddl_organizations" runat="server" Height="21px" Width="160px">
                            </asp:DropDownList>
                        </td>
                        <td class="style73" colspan="2">
                        </td>
                        <td class="style74" colspan="2">
                        </td>
                        <td class="style72" colspan="2">
                            <asp:Label ID="Label209" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="اسم المدرسة"></asp:Label>
                        </td>
                        <td class="style75" colspan="15">
                            <asp:DropDownList ID="ddl_school_name" runat="server" Height="21px" Width="160px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style68">
                            &nbsp;
                        </td>
                        <td class="style82" colspan="2">
                            <asp:Label ID="Label218" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="الوضع الدراسي"
                                Width="71px"></asp:Label>
                        </td>
                        <td class="style80" colspan="2">
                            <asp:DropDownList ID="ddl_academic_situation" runat="server" Height="21px" Width="160px">
                                <asp:ListItem Selected="True"></asp:ListItem>
                                <asp:ListItem>يدرس</asp:ListItem>
                                <asp:ListItem>ترك الدراسة</asp:ListItem>
                                <asp:ListItem>مفصول</asp:ListItem>
                                <asp:ListItem>أمي</asp:ListItem>
                                <asp:ListItem>صغير السن</asp:ListItem>
                                <asp:ListItem>لم يلتحق</asp:ListItem>
                                <asp:ListItem>أخرى</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style64" colspan="2">
                            &nbsp;
                        </td>
                        <td class="style66" colspan="2">
                            &nbsp;
                        </td>
                        <td class="style41" colspan="2">
                            <asp:Label ID="Label212" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="مرحلة التعليم"
                                Width="68px"></asp:Label>
                        </td>
                        <td class="style61" colspan="15">
                            <asp:DropDownList ID="ddl_learning_cat" runat="server" AutoPostBack="True" Height="21px"
                                Width="160px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style68">
                            &nbsp;
                        </td>
                        <td class="style82" colspan="2">
                            <asp:Label ID="Label74" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="السنة الدراسية"
                                Width="72px"></asp:Label>
                        </td>
                        <td class="style80" colspan="2">
                            <asp:DropDownList ID="ddl_academic_year" runat="server" Height="21px" Width="160px">
                            </asp:DropDownList>
                        </td>
                        <td class="style64" colspan="2">
                            &nbsp;
                        </td>
                        <td class="style66" colspan="2">
                            &nbsp;
                        </td>
                        <td class="style41" colspan="2">
                            <asp:Label ID="Label153" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="الصف"></asp:Label>
                        </td>
                        <td class="style61" colspan="15">
                            <asp:DropDownList ID="ddl_class" runat="server" Height="21px" Width="160px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style69">
                        </td>
                        <td class="style84" colspan="2">
                            <asp:Label ID="Label197" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="التقدير العام"
                                Width="67px"></asp:Label>
                        </td>
                        <td class="style79" colspan="2">
                            <asp:DropDownList ID="ddl_general_evaluation" runat="server" Height="21px" Width="160px">
                            </asp:DropDownList>
                        </td>
                        <td class="style65" colspan="2">
                        </td>
                        <td class="style67" colspan="2">
                        </td>
                        <td class="style76" colspan="2">
                        </td>
                        <td class="style63" colspan="15">
                            <asp:CheckBox ID="chk_participate_in_activity" runat="server" Font-Names="Tahoma"
                                Font-Size="8pt" Height="21px" Text="يشارك في نشاط دراسي" Width="140px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style68">
                        </td>
                        <td class="style41" colspan="25">
                        </td>
                    </tr>
                    <tr>
                        <td class="style68">
                            &nbsp;
                        </td>
                        <td class="style41" colspan="25">
                            <dx:ASPxGridView ID="grd_Edu_log" runat="server" AutoGenerateColumns="False" DataSourceID="Dts_edu_hist" Theme="Aqua" Width="835px">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="رقم اليتيم" FieldName="app_ser" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                        <editformsettings visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Caption="تاريخ التسجيل" FieldName="school_reg_date" VisibleIndex="1">
                                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Caption="اسم المؤسسة التعليمية" FieldName="school_name_ar" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="السنة الدراسية" FieldName="acad_year_name" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="مرحلة التعليم" FieldName="category_name_ar" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="الصف" FieldName="class_name_ar" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="التقدير العام" FieldName="assesment_namear" VisibleIndex="6">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsPager AlwaysShowPager="True">
                                </SettingsPager>
                                <Settings ShowFilterRow="True" />
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="Dts_edu_hist" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="GetEducationHistory" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser" PropertyName="Text" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style70">
                            &nbsp;
                        </td>
                        <td class="style24" colspan="25">
                            &nbsp;</td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
