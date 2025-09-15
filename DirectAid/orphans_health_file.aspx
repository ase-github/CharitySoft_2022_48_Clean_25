<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="orphans_health_file.aspx.vb"
    Inherits="DirectAid.orphans_health_file" MasterPageFile="~/Site.Master" %>

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





            $('#txt_app_ser').keydown(function (event) {
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


    </script>
    <style type="text/css">
        .style9
        {
            height: 25px;
        }
        .style12
        {
            height: 25px;
        }
        
        a:link, a:visited
        {
            color: #034af3;
        }
        
        .style24
        {
            height: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div>
                <table bgcolor="#F1F7FC" cellspacing="1" dir="rtl" style="width: 72%; height: 57px;
                    margin-right: 62px;">
                    <tr>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style9" colspan="6">
                            &nbsp;<a id="lnk_search" runat="server"><img alt="" border="0" src="images/Find_32x32.png"
                                style="height: 32px; width: 32px;" />
                            </a>&nbsp;<a id="lnk_save" runat="server"><img alt="" border="0" src="images/Save_32x32.png"
                                style="width: 32px; height: 32px;" />
                            </a>&nbsp;<asp:Literal ID="Literal1" runat="server" Visible="False"></asp:Literal>
                            <a id="lnk_search_rtn" runat="server" visible="True"></a><a id="lnk_Get_Fayher_name"
                                runat="server" visible="True"></a>&nbsp; &nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                        </td>
                        <td class="style9">
                        </td>
                        <td class="style9">
                        </td>
                        <td class="style9">
                        </td>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style9">
                        </td>
                        <td class="style9">
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style9">
                            <asp:Label runat="server" Text="رقم اليتيم" Font-Names="Tahoma" Font-Size="8pt" ID="Label11"></asp:Label>
                            <asp:Label ID="Label306" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                Text="*"></asp:Label>
                        </td>
                        <td class="style9">
                            <asp:TextBox runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF" BorderWidth="1px"
                                BorderStyle="Solid" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="147px"
                                ClientIDMode="Static" ID="txt_app_ser" MaxLength="5" AutoCompleteType="Disabled"></asp:TextBox>
                        </td>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style12">
                            &nbsp;
                        </td>
                        <td class="style12">
                            <asp:Label ID="Label315" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="تاريخ الحالة"></asp:Label>
                        </td>
                        <td class="style9">
                            <dx:ASPxDateEdit ID="txt_report_date" runat="server" Theme="Aqua" Width="154px" DisplayFormatString="dd/MM/yyyy"
                                EditFormat="Custom">
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style9">
                            <asp:Label ID="Label218" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="اسم اليتيم"></asp:Label>
                            &nbsp;<span><img alt="Search by names" border="0" height="24" src="images/Find_32x32.png"
                                style="visibility: visible; width: 24px; height: 22px" onclick="open_search_names_scrn();" />
                            </span>
                        </td>
                        <td class="style9" colspan="2">
                            <asp:TextBox ID="txt_orphan_name" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                BorderStyle="Solid" BorderWidth="1px" Enabled="False" Font-Names="Tahoma" Font-Size="9pt"
                                Height="21px" Width="332px"></asp:TextBox>
                        </td>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style9">
                            <asp:CheckBox ID="chk_card_available" runat="server" Font-Names="Tahoma" Font-Size="8pt"
                                Text="لديه كرت تطعيمات" Width="110px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style9">
                            <asp:Label ID="Label162" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="الحالة الصحية"
                                Width="70px"></asp:Label>
                            <asp:Label ID="Label307" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                Text="*"></asp:Label>
                        </td>
                        <td class="style9">
                            <asp:DropDownList ID="ddl_health_status" runat="server" Height="21px" Width="155px">
                            </asp:DropDownList>
                        </td>
                        <td class="style9">
                            <asp:Label ID="Label163" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="حالة السمع"
                                Width="60px"></asp:Label>
                            <asp:Label ID="Label308" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                Text="*"></asp:Label>
                        </td>
                        <td class="style12">
                            <asp:DropDownList ID="ddl_hearing_status" runat="server" Height="21px" Width="155px">
                            </asp:DropDownList>
                        </td>
                        <td class="style9">
                            <asp:Label ID="Label164" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="حالة النظر"></asp:Label>
                            <asp:Label ID="Label311" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                Text="*"></asp:Label>
                        </td>
                        <td class="style9">
                            <asp:DropDownList ID="ddl_eye_status" runat="server" Height="21px" Width="155px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style9">
                            <asp:Label ID="Label165" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="الحالة النفسية"
                                Width="80px"></asp:Label>
                            <asp:Label ID="Label309" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                Text="*"></asp:Label>
                        </td>
                        <td class="style9">
                            <asp:DropDownList ID="ddl_psych_status" runat="server" Height="21px" Width="155px">
                            </asp:DropDownList>
                        </td>
                        <td class="style9">
                            <asp:Label ID="Label166" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="المظهر العام"></asp:Label>
                            <asp:Label ID="Label310" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                Text="*"></asp:Label>
                        </td>
                        <td class="style12">
                            <asp:DropDownList ID="ddl_general_status" runat="server" Height="21px" Width="155px">
                            </asp:DropDownList>
                        </td>
                        <td class="style9">
                            <asp:Label ID="Label167" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="22px"
                                Text="العمليات الجراحية" Width="83px"></asp:Label>
                            <asp:Label ID="Label312" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                Text="*"></asp:Label>
                        </td>
                        <td class="style9">
                            <asp:DropDownList ID="ddl_surger_status" runat="server" Height="21px" Width="155px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style9">
                            <asp:Label ID="Label214" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="نوع المركز الصحي"
                                Width="87px"></asp:Label>
                            <asp:Label ID="Label314" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                Text="*"></asp:Label>
                        </td>
                        <td class="style9">
                            <asp:DropDownList ID="ddl_center_type" runat="server" Height="21px" Width="155px"
                                AutoPostBack="True">
                                <asp:ListItem></asp:ListItem>
                                <asp:ListItem>تابع للهيئة</asp:ListItem>
                                <asp:ListItem>خارجي</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style9">
                            <asp:Label ID="Label216" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="المراكز التابعة للهيئة"></asp:Label>
                        </td>
                        <td class="style12">
                            <asp:DropDownList ID="ddl_DirAid_center" runat="server" Height="21px" Width="155px">
                            </asp:DropDownList>
                        </td>
                        <td class="style9">
                            <asp:Label ID="Label215" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="اسم المركز الصحي"></asp:Label>
                            <asp:Label ID="Label313" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                                Text="*"></asp:Label>
                        </td>
                        <td class="style9">
                            <asp:TextBox ID="txt_center_name" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="151px"
                                MaxLength="150" EnableViewState="False"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style9">
                            <asp:Label ID="Label169" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="22px"
                                Text="نوع المرض الحالي" Width="87px"></asp:Label>
                        </td>
                        <td class="style9">
                            <asp:DropDownList ID="ddl_current_disease" runat="server" Height="21px" Width="155px">
                            </asp:DropDownList>
                        </td>
                        <td class="style9">
                            <asp:Label ID="Label217" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="الأمراض التي اصيب بها من قبل"
                                Width="147px"></asp:Label>
                        </td>
                        <td class="style9" colspan="3">
                            <asp:TextBox ID="txt_diseases_descr" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="44px" Width="487px"
                                MaxLength="250" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style24">
                            &nbsp;
                        </td>
                        <td class="style24">
                            &nbsp;
                        </td>
                        <td class="style24" colspan="3">
                            &nbsp;
                        </td>
                        <td class="style24">
                        </td>
                        <td class="style24">
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style9" colspan="6">
                            <asp:SqlDataSource ID="dts_health_log" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                SelectCommand="GetOrphansHealthLog" InsertCommand="benf_master_health_Update"
                                InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommand="benf_master_health_Update"
                                UpdateCommandType="StoredProcedure">
                                <InsertParameters>
                                    <asp:Parameter Name="app_ser" Type="Int32" />
                                    <asp:Parameter Name="health_status" Type="Byte" />
                                    <asp:Parameter Name="hearing_stat" Type="Byte" />
                                    <asp:Parameter Name="eye_stat" Type="Byte" />
                                    <asp:Parameter Name="psych_stat" Type="Byte" />
                                    <asp:Parameter Name="general_app" Type="Byte" />
                                    <asp:Parameter Name="surger_stat" Type="Byte" />
                                    <asp:Parameter Name="health_status_descr" Type="String" />
                                    <asp:Parameter Name="medical_cent_type" Type="Int32" />
                                    <asp:Parameter Name="medical_cent" Type="String" />
                                    <asp:Parameter Name="inter_med_cent" Type="Byte" />
                                    <asp:Parameter Name="vacc_doc" Type="Byte" />
                                    <asp:Parameter Name="current_disease" Type="Byte" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser" PropertyName="Text"
                                        Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="app_ser" Type="Int32" />
                                    <asp:Parameter Name="health_status" Type="Byte" />
                                    <asp:Parameter Name="hearing_stat" Type="Byte" />
                                    <asp:Parameter Name="eye_stat" Type="Byte" />
                                    <asp:Parameter Name="psych_stat" Type="Byte" />
                                    <asp:Parameter Name="general_app" Type="Byte" />
                                    <asp:Parameter Name="surger_stat" Type="Byte" />
                                    <asp:Parameter Name="health_status_descr" Type="String" />
                                    <asp:Parameter Name="medical_cent_type" Type="Int32" />
                                    <asp:Parameter Name="medical_cent" Type="String" />
                                    <asp:Parameter Name="inter_med_cent" Type="Byte" />
                                    <asp:Parameter Name="vacc_doc" Type="Byte" />
                                    <asp:Parameter Name="current_disease" Type="Byte" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                            &nbsp;
                        </td>
                        <td class="style9" colspan="6">
                            <dx:ASPxGridView ID="grd_health_log" runat="server" AutoGenerateColumns="False" DataSourceID="dts_health_log"
                                KeyFieldName="ser_no;app_ser" Width="850px" Theme="Aqua">
                                <SettingsPager AlwaysShowPager="True">
                                </SettingsPager>
                                <Settings ShowFilterRow="True" />
                                <Columns>
                                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                        <ClearFilterButton Visible="True">
                                        </ClearFilterButton>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="الرقم الآلي" FieldName="ser_no" ReadOnly="True"
                                        VisibleIndex="1" ShowInCustomizationForm="True">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="رقم اليتيم" FieldName="app_ser" VisibleIndex="2"
                                        ShowInCustomizationForm="True">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="الحالة الصحية" FieldName="health_status"
                                        VisibleIndex="3">
                                        <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_health_status" EnableCallbackMode="True"
                                            EnableClientSideAPI="True" TextField="health_descr_ar" ValueField="health_code"
                                            ValueType="System.Int32">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="حالة السمع" FieldName="hearing_status" VisibleIndex="4">
                                        <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_health_status" EnableCallbackMode="True"
                                            EnableClientSideAPI="True" TextField="health_descr_ar" ValueField="health_code"
                                            ValueType="System.Int32">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="حالة النظر" FieldName="eye_status" VisibleIndex="5">
                                        <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_health_status" EnableCallbackMode="True"
                                            EnableClientSideAPI="True" TextField="health_descr_ar" ValueField="health_code"
                                            ValueType="System.Int32">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="الحالة النفسية" FieldName="psych_status"
                                        VisibleIndex="6">
                                        <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_psych_state" EnableCallbackMode="True"
                                            EnableClientSideAPI="True" TextField="psych_stat_namear" ValueField="psych_stat_code"
                                            ValueType="System.Int32">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="المظهر العام" FieldName="general_appearance"
                                        VisibleIndex="7">
                                        <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_general_appearance" EnableCallbackMode="True"
                                            EnableClientSideAPI="True" TextField="descr_ar" ValueField="status_code" ValueType="System.Int32">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="العمليات الجراحية" FieldName="surger_status"
                                        VisibleIndex="8">
                                        <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_surgery" EnableCallbackMode="True"
                                            EnableClientSideAPI="True" TextField="surgery_name_ar" ValueField="surgery_code"
                                            ValueType="System.Int32">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="المرض الحالي" FieldName="current_disease"
                                        VisibleIndex="9">
                                        <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_disease" EnableCallbackMode="True"
                                            EnableClientSideAPI="True" TextField="disease_descr_ar" ValueField="disease_code"
                                            ValueType="System.Int32">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataMemoColumn Caption="وصف الحالة" FieldName="disease_descr" VisibleIndex="10">
                                        <PropertiesMemoEdit Rows="3">
                                            <FocusedStyle Wrap="False">
                                            </FocusedStyle>
                                            <Style Wrap="True">
                                                
                                            </Style>
                                        </PropertiesMemoEdit>
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataMemoColumn>
                                    <dx:GridViewDataCheckColumn Caption="لديه كرت تطعيمات" FieldName="vacc_doc" VisibleIndex="11">
                                    </dx:GridViewDataCheckColumn>
                                    <dx:GridViewDataDateColumn Caption="تاريخ الادخال" FieldName="status_date" ReadOnly="True"
                                        VisibleIndex="12">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataDateColumn FieldName="report_date" Caption="تاريخ الحالة" VisibleIndex="12">
                                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                        </PropertiesDateEdit>
                                    </dx:GridViewDataDateColumn>
                                </Columns>
                                <SettingsText CommandCancel="خروج" CommandDelete="إلغاء" CommandEdit="تعديل" CommandNew="جديد"
                                    CommandUpdate="حفظ" />
                            </dx:ASPxGridView>
                        </td>
                    </tr>
                    <tr>
                        <td class="style9">
                        </td>
                        <td class="style9" colspan="6">
                            <asp:SqlDataSource ID="dts_general_appearance" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                SelectCommand="SELECT * FROM [general_appearance_tab]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dts_disease" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                SelectCommand="SELECT * FROM [disease_tab]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dts_surgery" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                SelectCommand="SELECT * FROM [surgery_tab]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dts_psych_state" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                SelectCommand="SELECT * FROM [psych_state_tab]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dts_health_status" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                SelectCommand="SELECT * FROM [health_status]"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
