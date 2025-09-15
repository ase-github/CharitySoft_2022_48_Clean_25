<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="orphanage1.aspx.vb" Inherits="DirectAid.orphanage1"
    MasterPageFile="~/Site.Master" %>

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







            $('#txt_orphanage_code').keydown(function (event) {
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



        function OnSupervisorChanged(EmpType) {
            grd_visits.GetEditor("supervisior_name").PerformCallback(EmpType.GetValue().toString());
        }


        //   function OnTypeChanged(cmbHobbytype) {
        //     grd_hobby.GetEditor("hobby_code").PerformCallback(cmbHobbytype.GetValue().toString());
        //  }





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
        a:link, a:visited
        {
            color: #034af3;
        }
        
        .style1
        {
            width: 151px;
        }
        .style104
        {
            width: 235px;
            height: 3px;
        }
        .style105
        {
            height: 3px;
        }
        .style106
        {
            width: 94px;
            height: 3px;
        }
        .style107
        {
            height: 3px;
            width: 300px;
        }
        .style108
        {
            width: 300px;
        }
        .style109
        {
            width: 235px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div dir="ltr">
                <table style="width: 54%; height: 50px;" bgcolor="#F1F7FC" dir="rtl">
                    <tr>
                        <td class="style105" bgcolor="#F2F9FF" dir="rtl">
                            <a id="lnk_new" runat="server">
                                <img alt="" border="0" src="images/New_32x32.png" style="height: 30px; width: 30px;" />
                            </a>&nbsp;<a id="lnk_search" runat="server"><img alt="" border="0" src="images/Find_32x32.png"
                                style="height: 32px; width: 32px;" />
                            </a>&nbsp;<a id="lnk_save" runat="server"><img alt="" border="0" src="images/Save_32x32.png"
                                style="width: 32px; height: 32px;" />
                            </a>&nbsp;<a id="lnk_search_rtn" runat="server" visible="True"></a><a id="lnk_Get_Father_name"
                                runat="server" visible="True"></a>&nbsp;
                        </td>
                        <td class="style106">
                            &nbsp;
                        </td>
                        <td class="style107">
                            &nbsp;
                        </td>
                        <td class="style106">
                        </td>
                        <td class="style104">
                        </td>
                        <td class="style106">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label265" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="رقم المهجع"
                                Width="120px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_orphanage_code" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="130px"
                                BackColor="#FFFFCC"></asp:TextBox>
                        </td>
                        <td class="style108">
                            <asp:Label ID="Label264" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="اسم المهجع"
                                Width="120px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_Orphanage_name" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="130px"
                                MaxLength="60"></asp:TextBox>
                        </td>
                        <td class="style109">
                            <asp:Label ID="Label266" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="تابع لمركز"
                                Width="85px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddl_center_id" runat="server" Height="21px" Width="136px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label197" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="اسم المسؤول"
                                Width="88px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList runat="server" Height="21px" Width="136px" ID="ddl_supervisor_name">
                            </asp:DropDownList>
                        </td>
                        <td class="style108">
                            <asp:Label ID="Label117" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="عدد الأيتام"
                                Width="77px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_orphans_count" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="130px"
                                MaxLength="5"></asp:TextBox>
                        </td>
                        <td class="style109">
                            <asp:Label ID="Label267" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="المساحة"
                                Width="77px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_space" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="130px"
                                MaxLength="8"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label115" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="السعة"
                                Width="133px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_capacity" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="130px"
                                MaxLength="6"></asp:TextBox>
                        </td>
                        <td class="style108">
                            <asp:Label ID="Label198" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="عدد الأسرة"
                                Width="108px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_beds_count" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="130px"
                                MaxLength="6"></asp:TextBox>
                        </td>
                        <td class="style109">
                            <asp:Label ID="Label199" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="حالة الأسرة"
                                Width="63px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddl_beds_status" runat="server" Height="21px" Width="136px">
                                <asp:ListItem>ممتاز</asp:ListItem>
                                <asp:ListItem>جيدجدا</asp:ListItem>
                                <asp:ListItem>جيد</asp:ListItem>
                                <asp:ListItem>رديئ</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label268" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="حالة الفراش"
                                Width="133px"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddl_matt_status" runat="server" Height="21px" Width="136px">
                                <asp:ListItem>ممتاز</asp:ListItem>
                                <asp:ListItem>جيدجدا</asp:ListItem>
                                <asp:ListItem>جيد</asp:ListItem>
                                <asp:ListItem>رديئ</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="style108">
                            <asp:Label ID="Label269" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="عدد الناموسيات"
                                Width="91px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_nets_count" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="130px"
                                MaxLength="6"></asp:TextBox>
                        </td>
                        <td class="style109">
                            <asp:Label ID="Label270" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="عدد الخزائن"
                                Width="133px"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_cabinets_count" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="131px"
                                MaxLength="6"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" colspan="6">
                            <asp:SqlDataSource ID="dts_statics" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                InsertCommand="usp_orphanage_tran_tabInsert" InsertCommandType="StoredProcedure"
                                SelectCommand="usp_orphanage_tran_tabSelect" SelectCommandType="StoredProcedure"
                                DeleteCommand="usp_orphanage_tran_tabDelete" DeleteCommandType="StoredProcedure"
                                UpdateCommand="usp_orphanage_tran_tabUpdate" UpdateCommandType="StoredProcedure">
                                <DeleteParameters>
                                    <asp:Parameter Name="tran_code" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                        Type="String" />
                                    <asp:Parameter DbType="Date" Name="tran_date" />
                                    <asp:Parameter Name="new_orphans" Type="Int32" />
                                    <asp:Parameter Name="absent_orphans" Type="Int32" />
                                    <asp:Parameter Name="exit_permission" Type="Int32" />
                                    <asp:Parameter Name="hit_attack" Type="Int32" />
                                    <asp:Parameter Name="unfollow_instruction" Type="Int32" />
                                    <asp:Parameter Name="stay_unwanted" Type="Int32" />
                                    <asp:Parameter Name="escape_cases" Type="Int32" />
                                    <asp:Parameter Name="exit_without_permission" Type="Int32" />
                                    <asp:Parameter Name="dismissed_cases" Type="Int32" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                        Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="tran_code" Type="Int32" />
                                    <asp:Parameter Name="center_code" Type="String" />
                                    <asp:Parameter DbType="Date" Name="tran_date" />
                                    <asp:Parameter Name="new_orphans" Type="Int32" />
                                    <asp:Parameter Name="upset_orphans" Type="Int32" />
                                    <asp:Parameter Name="exit_permission" Type="Int32" />
                                    <asp:Parameter Name="hit_attack" Type="Int32" />
                                    <asp:Parameter Name="unfollow_instruction" Type="Int32" />
                                    <asp:Parameter Name="stay_unwanted" Type="Int32" />
                                    <asp:Parameter Name="escape_cases" Type="Int32" />
                                    <asp:Parameter Name="exit_without_permission" Type="Int32" />
                                    <asp:Parameter Name="dismissed_cases" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="dts_status_code" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                SelectCommand="SELECT * FROM [status_tab]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dts_supervisor" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                SelectCommand="usp_GetCenterSupervisor" SelectCommandType="StoredProcedure" DeleteCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="dts_supervisor_combo" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                SelectCommand="usp_supervisorsSelect" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="emp_cat" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="dts_supervisors_categories" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                SelectCommand="SELECT * FROM [supervisors_categories]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" colspan="6">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" colspan="6">
                            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="2" Height="249px"
                                Theme="Aqua" Width="797px">
                                <TabPages>
                                    <dx:TabPage Text="زيارات المسؤولين">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxGridView ID="grd_visits" runat="server" Width="776px" AutoGenerateColumns="False"
                                                    DataSourceID="dts_supervisior_visits" EnableTheming="True" KeyFieldName="Visit_id"
                                                    Theme="Aqua" ClientInstanceName="grd_visits">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                            <EditButton Visible="True" Text="تعديل">
                                                            </EditButton>
                                                            <NewButton Visible="True" Text="جديد">
                                                            </NewButton>
                                                            <DeleteButton Text="حذف" Visible="True">
                                                            </DeleteButton>
                                                            <CancelButton Text="إلغاء">
                                                            </CancelButton>
                                                            <UpdateButton Text="حفظ">
                                                            </UpdateButton>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="رقم الزيارة" FieldName="Visit_id" ReadOnly="True"
                                                            ShowInCustomizationForm="True" VisibleIndex="1">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="رقم المركز" FieldName="center_code" ReadOnly="True"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="اسم المسؤول /المشرف" FieldName="supervisior_name"
                                                            ShowInCustomizationForm="True" VisibleIndex="5">
                                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_supervisor" EnableCallbackMode="True"
                                                                EnableClientSideAPI="True" TextField="emp_name_ar" ValueField="emp_code" ValueType="System.Int32">
                                                            </PropertiesComboBox>
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataDateColumn Caption="تاريخ الزيارة" FieldName="visit_date" ShowInCustomizationForm="True"
                                                            VisibleIndex="3">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataTextColumn Caption="ملاحظات الزيارة" FieldName="visit_notes" ShowInCustomizationForm="True"
                                                            VisibleIndex="6">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="نوع المسؤول" FieldName="supervisor_type"
                                                            ShowInCustomizationForm="True" VisibleIndex="4">
                                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_supervisors_categories"
                                                                EnableCallbackMode="True" EnableClientSideAPI="True" TextField="emp_cat_name_ar"
                                                                ValueField="emp_cat_code" ValueType="System.Byte" EnableSynchronization="False"
                                                                IncrementalFilteringMode="StartsWith">
                                                                <ClientSideEvents SelectedIndexChanged="function(s, e) { OnSupervisorChanged(s); }" />
                                                            </PropertiesComboBox>
                                                            <EditFormSettings Visible="True" />
                                                        </dx:GridViewDataComboBoxColumn>
                                                    </Columns>
                                                    <SettingsPager>
                                                        <Summary Text="Page {0} of {1} ({2} عدد الزيارات)" />
                                                    </SettingsPager>
                                                    <Settings ShowFilterRow="True" />
                                                </dx:ASPxGridView>
                                                <asp:SqlDataSource ID="dts_supervisior_visits" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                                    SelectCommand="usp_orp_supervisior_visitsSelect" InsertCommand="usp_orp_supervisior_visitsInsert"
                                                    InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommand="usp_orp_supervisior_visitsUpdate"
                                                    UpdateCommandType="StoredProcedure" DeleteCommand="usp_orp_supervisior_visitsDelete"
                                                    DeleteCommandType="StoredProcedure">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="Visit_id" Type="Int32" />
                                                        <asp:Parameter Name="center_code" Type="Int16" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="Int16" />
                                                        <asp:Parameter Name="supervisior_name" Type="String" />
                                                        <asp:Parameter DbType="Date" Name="visit_date" />
                                                        <asp:Parameter Name="visit_notes" Type="String" />
                                                        <asp:Parameter Name="supervisor_type" Type="String" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="Int16" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="Visit_id" Type="Int32" />
                                                        <asp:Parameter Name="center_code" Type="Int16" />
                                                        <asp:Parameter Name="supervisior_name" Type="String" />
                                                        <asp:Parameter DbType="Date" Name="visit_date" />
                                                        <asp:Parameter Name="visit_notes" Type="String" />
                                                        <asp:Parameter Name="supervisor_type" Type="String" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="إحصائيات">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                <dx:ASPxGridView ID="grd_statics" runat="server" AutoGenerateColumns="False" DataSourceID="dts_statics"
                                                    KeyFieldName="tran_code;orphanage_code" Theme="Aqua">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                            <EditButton Text="تعديل" Visible="True">
                                                            </EditButton>
                                                            <NewButton Text="جديد" Visible="True">
                                                            </NewButton>
                                                            <DeleteButton Text="حذف">
                                                            </DeleteButton>
                                                            <CancelButton Text="إلغاء">
                                                            </CancelButton>
                                                            <UpdateButton Text="حفظ">
                                                            </UpdateButton>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="الرقم الآلي" FieldName="tran_code" ReadOnly="True"
                                                            ShowInCustomizationForm="True" VisibleIndex="1">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="orphanage_code" ReadOnly="True" ShowInCustomizationForm="True"
                                                            Visible="False" VisibleIndex="2">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="tran_date" ShowInCustomizationForm="True"
                                                            VisibleIndex="3">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataTextColumn Caption="أيتام جدد" FieldName="new_orphans" ShowInCustomizationForm="True"
                                                            VisibleIndex="4">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="أيتام متغيبين" FieldName="absent_orphans" ShowInCustomizationForm="True"
                                                            VisibleIndex="5">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="خروج بإذن" FieldName="exit_permission" ShowInCustomizationForm="True"
                                                            VisibleIndex="6">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="الأعتداء بالضرب" FieldName="hit_attack" ShowInCustomizationForm="True"
                                                            VisibleIndex="7">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="عدم اتباع التعليمات" FieldName="unfollow_instruction"
                                                            ShowInCustomizationForm="True" VisibleIndex="8">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="عدم الرغبة بالاقامة" FieldName="stay_unwanted"
                                                            ShowInCustomizationForm="True" VisibleIndex="9">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="حالات الهروب" FieldName="escape_cases" ShowInCustomizationForm="True"
                                                            VisibleIndex="10">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="خروج بدون اذن" FieldName="exit_without_permission"
                                                            ShowInCustomizationForm="True" VisibleIndex="11">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="حالات الطرد" FieldName="dismissed_cases" ShowInCustomizationForm="True"
                                                            VisibleIndex="12">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="برامج">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                <asp:SqlDataSource ID="dts_programs_codes" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                                    SelectCommand="SELECT * FROM [center_programs]"></asp:SqlDataSource>
                                                <asp:SqlDataSource ID="dts_programs" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                                    DeleteCommand="usp_orphanage_programsDelete" DeleteCommandType="StoredProcedure"
                                                    InsertCommand="usp_orphanage_programsInsert" InsertCommandType="StoredProcedure"
                                                    SelectCommand="usp_orphanage_programsSelect" SelectCommandType="StoredProcedure"
                                                    UpdateCommand="usp_orphanage_programsUpdate" UpdateCommandType="StoredProcedure">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="prog_code" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:Parameter Name="center_code" Type="Int32" />
                                                        <asp:Parameter Name="program_date" Type="DateTime" />
                                                        <asp:Parameter Name="program_type" Type="Int16" />
                                                        <asp:Parameter Name="count" Type="Int32" />
                                                        <asp:Parameter Name="period" Type="String" />
                                                        <asp:Parameter Name="cost" Type="Decimal" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="Int32" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="prog_code" Type="Int32" />
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="Int32" />
                                                        <asp:Parameter Name="program_date" Type="DateTime" />
                                                        <asp:Parameter Name="program_type" Type="Int16" />
                                                        <asp:Parameter Name="count" Type="Decimal" />
                                                        <asp:Parameter Name="period" Type="String" />
                                                        <asp:Parameter Name="cost" Type="Decimal" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dts_programs"
                                                    EnableTheming="True" KeyFieldName="prog_code" Theme="Aqua" Width="718px">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                            <EditButton Text="تعديل" Visible="True">
                                                            </EditButton>
                                                            <NewButton Text="جديد" Visible="True">
                                                            </NewButton>
                                                            <DeleteButton Text="حذف" Visible="True">
                                                            </DeleteButton>
                                                            <CancelButton Text="إلغاء">
                                                            </CancelButton>
                                                            <UpdateButton Text="خفظ">
                                                            </UpdateButton>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="الرقم الآلي" FieldName="prog_code" ReadOnly="True"
                                                            ShowInCustomizationForm="True" VisibleIndex="1">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="center_code" ShowInCustomizationForm="True"
                                                            Visible="False" VisibleIndex="2">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataDateColumn Caption="تاريخ البرنامج" FieldName="program_date" ShowInCustomizationForm="True"
                                                            VisibleIndex="3">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="نوع البرنامج" FieldName="program_type" ShowInCustomizationForm="True"
                                                            VisibleIndex="4">
                                                            <PropertiesComboBox DataSourceID="dts_programs_codes" TextField="program_name_ar"
                                                                ValueField="program_code" ValueType="System.Int16">
                                                            </PropertiesComboBox>
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataTextColumn Caption="العدد" FieldName="count_prog" ShowInCustomizationForm="True"
                                                            VisibleIndex="5">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="المدة" FieldName="period" ShowInCustomizationForm="True"
                                                            VisibleIndex="6">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="التكلفة" FieldName="cost" ShowInCustomizationForm="True"
                                                            VisibleIndex="7">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>
                                                <asp:SqlDataSource ID="dts_programs_1" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                                    DeleteCommand="usp_orphanage_programsDelete" DeleteCommandType="StoredProcedure"
                                                    InsertCommand="usp_orphanage_programsInsert" InsertCommandType="StoredProcedure"
                                                    SelectCommand="usp_orphanage_programsSelect" SelectCommandType="StoredProcedure"
                                                    UpdateCommand="usp_orphanage_programsUpdate" UpdateCommandType="StoredProcedure">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="prog_code" Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="String" />
                                                        <asp:Parameter Name="program_date" Type="DateTime" />
                                                        <asp:Parameter Name="program_type" Type="Int16" />
                                                        <asp:Parameter Name="count" Type="Decimal" />
                                                        <asp:Parameter Name="period" Type="String" />
                                                        <asp:Parameter Name="cost" Type="Decimal" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="String" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="prog_code" Type="Int32" />
                                                        <asp:Parameter Name="center_code" Type="Int32" />
                                                        <asp:Parameter Name="program_date" Type="DateTime" />
                                                        <asp:Parameter Name="program_type" Type="Int16" />
                                                        <asp:Parameter Name="count" Type="Decimal" />
                                                        <asp:Parameter Name="period" Type="String" />
                                                        <asp:Parameter Name="cost" Type="Decimal" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="البرنامج الغذائي">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                <asp:SqlDataSource ID="dts_meals" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                                    SelectCommand="SELECT * FROM [center_meals]"></asp:SqlDataSource>
                                                <asp:SqlDataSource ID="dts_meals_prog" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                                    DeleteCommand="usp_orphanage_meals_programDelete" DeleteCommandType="StoredProcedure"
                                                    InsertCommand="usp_orphanage_meals_programInsert" InsertCommandType="StoredProcedure"
                                                    SelectCommand="usp_orphanage_meals_programSelect" SelectCommandType="StoredProcedure"
                                                    UpdateCommand="usp_orphanage_meals_programUpdate" UpdateCommandType="StoredProcedure">
                                                    <DeleteParameters>
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="String" />
                                                        <asp:Parameter Name="meal" Type="Int16" />
                                                        <asp:Parameter Name="descr" Type="String" />
                                                        <asp:Parameter Name="month" Type="Int32" />
                                                        <asp:Parameter Name="year" Type="Int32" />
                                                        <asp:Parameter Name="notes" Type="String" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="String" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="program_ml_code" Type="Int32" />
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="Int32" />
                                                        <asp:Parameter Name="meal" Type="Int16" />
                                                        <asp:Parameter Name="descr" Type="String" />
                                                        <asp:Parameter Name="month" Type="Int32" />
                                                        <asp:Parameter Name="year" Type="Int32" />
                                                        <asp:Parameter Name="notes" Type="String" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                                <dx:ASPxGridView ID="grd_meals" runat="server" AutoGenerateColumns="False" DataSourceID="dts_meals_prog"
                                                    KeyFieldName="program_ml_code;center_code" Theme="Aqua" Width="761px">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                            <EditButton Text="تعديل" Visible="True">
                                                            </EditButton>
                                                            <NewButton Visible="True" Text="جديد">
                                                            </NewButton>
                                                            <DeleteButton Text="إلغاء" Visible="True">
                                                            </DeleteButton>
                                                            <CancelButton Text="إلغاء">
                                                            </CancelButton>
                                                            <UpdateButton Text="خفظ">
                                                            </UpdateButton>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="رقم الوجبة" FieldName="program_ml_code" ReadOnly="True"
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="رقم المركز" FieldName="center_code" ReadOnly="True"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="الوجبة" FieldName="meal" ShowInCustomizationForm="True"
                                                            VisibleIndex="3">
                                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_meals" EnableCallbackMode="True"
                                                                EnableClientSideAPI="True" TextField="meal_name_ar" ValueField="meal_code" ValueType="System.Int32">
                                                            </PropertiesComboBox>
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataTextColumn Caption="الوصف" FieldName="descr" ShowInCustomizationForm="True"
                                                            VisibleIndex="4">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="شهر" FieldName="month" ShowInCustomizationForm="True"
                                                            VisibleIndex="5">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="سنة" FieldName="year" ShowInCustomizationForm="True"
                                                            VisibleIndex="6">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="ملاحظات" FieldName="notes" ShowInCustomizationForm="True"
                                                            VisibleIndex="7">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="أنشطة الأيتام داخل المركز">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                <asp:SqlDataSource ID="dts_activity_type" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                                    SelectCommand="SELECT * FROM [activity_type_tab]"></asp:SqlDataSource>
                                                <asp:SqlDataSource ID="dts_center_activity" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                                    DeleteCommand="usp_orphanage_activitiesDelete" DeleteCommandType="StoredProcedure"
                                                    InsertCommand="usp_orphanage_activitiesInsert" InsertCommandType="StoredProcedure"
                                                    SelectCommand="usp_orphanage_activitiesSelect" SelectCommandType="StoredProcedure"
                                                    UpdateCommand="usp_orphanage_activitiesUpdate" UpdateCommandType="StoredProcedure">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="center_activity_code" Type="Int32" />
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="String" />
                                                        <asp:Parameter Name="activity_date" DbType="Date" />
                                                        <asp:Parameter Name="activity_type" Type="Int16" />
                                                        <asp:Parameter Name="center_activity_name" Type="String" />
                                                        <asp:Parameter Name="activity_count" Type="Int32" />
                                                        <asp:Parameter Name="notes" Type="String" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="String" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="center_activity_code" Type="Int32" />
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="Int32" />
                                                        <asp:Parameter Name="activity_date" DbType="Date" />
                                                        <asp:Parameter Name="activity_type" Type="Int16" />
                                                        <asp:Parameter Name="center_activity_name" Type="String" />
                                                        <asp:Parameter Name="activity_count" Type="Int32" />
                                                        <asp:Parameter Name="notes" Type="String" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                                <dx:ASPxGridView ID="grd_activities" runat="server" DataSourceID="dts_center_activity"
                                                    Theme="Aqua" AutoGenerateColumns="False" KeyFieldName="center_activity_code;center_code"
                                                    Width="762px">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                            <EditButton Visible="True" Text="تعديل">
                                                            </EditButton>
                                                            <NewButton Visible="True" Text="جديد">
                                                            </NewButton>
                                                            <DeleteButton Visible="True" Text="إلغاء">
                                                            </DeleteButton>
                                                            <CancelButton Text="إلغاء">
                                                            </CancelButton>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="رقم النشاط" FieldName="center_activity_code"
                                                            ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="رقم المركز" FieldName="center_code" ReadOnly="True"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="activity_date" ShowInCustomizationForm="True"
                                                            VisibleIndex="3">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataComboBoxColumn Caption="نوع النشاط" FieldName="activity_type" ShowInCustomizationForm="True"
                                                            VisibleIndex="4">
                                                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_activity_type" EnableCallbackMode="True"
                                                                EnableClientSideAPI="True" TextField="activity_name_ar" ValueField="activity_code"
                                                                ValueType="System.Int32">
                                                            </PropertiesComboBox>
                                                        </dx:GridViewDataComboBoxColumn>
                                                        <dx:GridViewDataTextColumn Caption="النشاط" FieldName="center_activity_name" ShowInCustomizationForm="True"
                                                            VisibleIndex="5">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="العدد" FieldName="activity_count" ShowInCustomizationForm="True"
                                                            VisibleIndex="6">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="ملاحظات" FieldName="notes" ShowInCustomizationForm="True"
                                                            VisibleIndex="7">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="انجازات الأيتام">
                                        <ContentCollection>
                                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                                <asp:SqlDataSource ID="dts_achievments" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                                    SelectCommand="usp_orphanage_achievmentsSelect" DeleteCommand="usp_orphanage_achievmentsDelete"
                                                    DeleteCommandType="StoredProcedure" InsertCommand="usp_orphanage_achievmentsInsert"
                                                    InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure" UpdateCommand="usp_orphanage_achievmentsUpdate"
                                                    UpdateCommandType="StoredProcedure">
                                                    <DeleteParameters>
                                                        <asp:Parameter Name="achieve_code" Type="Int32" />
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="Int32" />
                                                    </DeleteParameters>
                                                    <InsertParameters>
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="Int32" />
                                                        <asp:Parameter DbType="Date" Name="achieve_date" />
                                                        <asp:Parameter Name="achieve_descr" Type="String" />
                                                    </InsertParameters>
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="Int32" />
                                                    </SelectParameters>
                                                    <UpdateParameters>
                                                        <asp:Parameter Name="achieve_code" Type="Int32" />
                                                        <asp:ControlParameter ControlID="txt_orphanage_code" Name="center_code" PropertyName="Text"
                                                            Type="Int32" />
                                                        <asp:Parameter DbType="Date" Name="achieve_date" />
                                                        <asp:Parameter Name="achieve_descr" Type="String" />
                                                    </UpdateParameters>
                                                </asp:SqlDataSource>
                                                <dx:ASPxGridView ID="grd_achievments" runat="server" AutoGenerateColumns="False"
                                                    DataSourceID="dts_achievments" KeyFieldName="achieve_code;center_code" Theme="Aqua"
                                                    Width="746px">
                                                    <Columns>
                                                        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                            <EditButton Visible="True" Text="تعديل">
                                                            </EditButton>
                                                            <NewButton Visible="True" Text="جديد">
                                                            </NewButton>
                                                            <DeleteButton Visible="True" Text="إلغاء">
                                                            </DeleteButton>
                                                            <CancelButton Text="إلغاء">
                                                            </CancelButton>
                                                        </dx:GridViewCommandColumn>
                                                        <dx:GridViewDataTextColumn Caption="الرقم الآلي" FieldName="achieve_code" ReadOnly="True"
                                                            ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                            <EditFormSettings Visible="False" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="رقم المركز" FieldName="center_code" ReadOnly="True"
                                                            ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="achieve_date" ShowInCustomizationForm="True"
                                                            VisibleIndex="3">
                                                        </dx:GridViewDataDateColumn>
                                                        <dx:GridViewDataTextColumn Caption="الوصف" FieldName="achieve_descr" ShowInCustomizationForm="True"
                                                            VisibleIndex="4">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                </TabPages>
                            </dx:ASPxPageControl>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1" colspan="6">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
