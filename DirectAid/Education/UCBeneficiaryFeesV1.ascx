<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryFeesV1.ascx.vb" Inherits="DirectAid.UCBeneficiaryFeesV1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>








<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>




<link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
<script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>

<script type="text/javascript">
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
        //Date picker for the Date

        $("#txt_applicant_dob").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy/mm/dd'
        });

        $("#txt_nominated_site_join_date").datepicker({
            changeMonth: true,
            changeYear: true,
            dateFormat: 'yy/mm/dd'
        });

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
        floatingWindow.location.href = "search_screen_benf.aspx?searchFLAG=1";
        return false;
    }

    function Get_school_info() {

        var j;

        //document.getElementById("txt_search_flag").value = '5';
        j = document.getElementById("A2");
        j.click();

    }


</script>
<style type="text/css">
    a:link
    {
        color: #034af3;
    }

    .style1
    {
        width: 220px;
    }

    .style2
    {
        width: 170px;
    }
</style>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
    DataSourceID="students_fees_DS" KeyFieldName="app_ser;trx_ser"
    Width="900px" EnableTheming="True" Theme="Default" ForeColor="#003366">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0">
            <EditButton Visible="True" Text="تعديل">
            </EditButton>
            <NewButton Visible="True" Text="جديد">
            </NewButton>
            <DeleteButton Visible="True" Text="الغاء">
            </DeleteButton>
            <ClearFilterButton Text="مسح">
            </ClearFilterButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="app_ser" ReadOnly="True" Visible="False"
            VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="trx_ser" ReadOnly="True" Visible="False"
            VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn FieldName="academic_year" VisibleIndex="3"
            Caption="السنة الدراسية">
            <PropertiesComboBox CallbackPageSize="10" DataSourceID="acad_year_codes_DS"
                EnableCallbackMode="True" EnableClientSideAPI="True" TextField="acad_year_name"
                ValueField="acad_year_code" ValueType="System.Int64" Width="150px">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn FieldName="fee_type" VisibleIndex="4"
            Caption="نوع الرسوم">
            <PropertiesComboBox CallbackPageSize="10" DataSourceID="fees_codes_DS"
                EnableCallbackMode="True" EnableClientSideAPI="True" TextField="fee_name_ar"
                ValueField="fee_code" ValueType="System.Int64" Width="150px">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn Caption="قيمة الرسوم" FieldName="fee_value"
            VisibleIndex="5" Width="100px">
            <PropertiesTextEdit DisplayFormatString="g" MaxLength="15">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn FieldName="fee_currency" VisibleIndex="6"
            Caption="العملة المستخدمة" Width="150px">
            <PropertiesComboBox CallbackPageSize="10" DataSourceID="currency_codes_DS"
                EnableCallbackMode="True" EnableClientSideAPI="True" TextField="currency_descrar"
                ValueField="currency_code" ValueType="System.Int64">
            </PropertiesComboBox>

        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
    <SettingsPager PageSize="5">
        <PageSizeItemSettings Caption="عدد الصفحات : " Items="5, 10, 20, 50, 100, 200"
            ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" />
    <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True"
        ShowHeaderFilterButton="True" />
    <SettingsText CommandCancel="مسح" CommandUpdate="حفظ" />
    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
</dx:ASPxGridView>
<div style="display:none">
    <table style="width: 100%; height: 18px; background-color: #ECF5FF;" dir="rtl">

        <tr>
            <td bgcolor="#E6EEFF" class="style50" dir="rtl">
                <a id="A5" runat="server">
                    <img alt="" border="0" src="../images/Find_32x32.png" style="height: 32px; width: 32px;" />
                </a>

                <a id="lnk_new" runat="server" href="" style="width: 72px; height: 24px; visibility: hidden;">
                    <img alt="" border="0" src="../images/new.jpg" />
                </a><a id="lnk_save" runat="server" onclick=""
                    style="visibility: hidden; width: 72px; height: 1px">
                    <img alt="" border="0" src="../images/save.jpg" />
                </a><a id="lnk_delete" runat="server"
                    style="visibility: hidden; width: 72px; height: 1px">
                    <img alt="" border="0" src="../images/delete.jpg" />
                </a>
            </td>
        </tr>
    </table>

    <table style="width: 100%; height: 139px; background-color: #ECF5FF;" dir="rtl">
        <tr>
            <td bgcolor="#E6EEFF" class="style50" dir="rtl">

                <table style="width: 0px; visibility: collapse; height: 0px">
                    <tr>
                        <td class="style1">
                            <asp:Label ID="Label11" runat="server" Font-Names="Tahoma" Font-Size="10pt"
                                Text="رقم الطالب" ForeColor="#003366"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_app_ser" runat="server" BackColor="#FFFFCC"
                                BorderColor="#336699" BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma"
                                Font-Size="10pt" Height="23px" Width="90px" ForeColor="#003366"
                                MaxLength="4" Visible="False"></asp:TextBox>
                        </td>
                        <td>
                            <asp:LinkButton ID="A_search" runat="server" CssClass="hide"></asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="A2" runat="server" CssClass="hide"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            <asp:Label ID="Label230" runat="server" Font-Names="Tahoma" Font-Size="10pt"
                                ForeColor="#003366" Text="اسم الطالب باللغة العربية" Width="180px"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:TextBox ID="txt_applicant_name_ar" runat="server" BorderColor="#336699"
                                BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="10pt"
                                ForeColor="#003366" Height="23px" Width="335px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <span>
                                <img id="btn_search" alt="Search by names" border="0" height="0" src="../images/Search-icon.png" style="visibility: hidden; width: 0px; height: 0px"
                                    onclick="//open_search_names_scrn();" /></span></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="style1">
                            <asp:Label ID="Label231" runat="server" Font-Names="Tahoma" Font-Size="10pt"
                                Text="اسم الطالب باللغة االانجليزية" Width="180px"></asp:Label>
                        </td>
                        <td colspan="3" style="margin-right: 40px">
                            <asp:TextBox ID="txt_applicant_name_en" runat="server" BorderColor="#336699"
                                BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="10pt"
                                ForeColor="#003366" Height="23px" Width="335px" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <table style="width: 100%; height: 139px; background-color: #ECF5FF;">
                    <tr>
                        <td colspan="10">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style1">&nbsp;</td>
                        <td colspan="5">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>

                <br />
                <asp:SqlDataSource ID="students_fees_DS" runat="server"
                    ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    DeleteCommand="Delete_students_fees" DeleteCommandType="StoredProcedure"
                    InsertCommand="Insert_students_fees" InsertCommandType="StoredProcedure"
                    SelectCommand="Select_students_fees" SelectCommandType="StoredProcedure"
                    UpdateCommand="Update_students_fees" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser"
                            PropertyName="Text" Type="Int32" />
                        <asp:Parameter Name="trx_ser" Type="Int16" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser"
                            PropertyName="Text" Type="Int32" />
                        <asp:Parameter Name="academic_year" Type="Int16" />
                        <asp:Parameter Name="fee_type" Type="Int16" />
                        <asp:Parameter Name="fee_value" Type="Decimal" />
                        <asp:Parameter Name="fee_currency" Type="Int16" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser"
                            PropertyName="Text" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser"
                            PropertyName="Text" Type="Int32" />
                        <asp:Parameter Name="trx_ser" Type="Int16" />
                        <asp:Parameter Name="academic_year" Type="Int16" />
                        <asp:Parameter Name="fee_type" Type="Int16" />
                        <asp:Parameter Name="fee_value" Type="Decimal" />
                        <asp:Parameter Name="fee_currency" Type="Int16" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="acad_year_codes_DS" runat="server"
                    ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="Select_academic_year_codes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="fees_codes_DS" runat="server"
                    ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="Select_fees_codes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="currency_codes_DS" runat="server"
                    ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="Select_currency_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />
                <br />

                <br />
                <br />

            </td>
        </tr>
        <tr>
            <td bgcolor="#E6EEFF" class="style50" dir="rtl">&nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#E6EEFF" class="style50" dir="rtl">&nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#E6EEFF" class="style50" dir="rtl">&nbsp;</td>
        </tr>
    </table>

</div>
<dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" AllowDragging="True" AllowResize="True"
    CloseAction="CloseButton" ClientInstanceName="ASPxPopupControl1" EnableViewState="False"
    PopupElementID="btn_search" PopupHorizontalAlign="WindowCenter" Modal="True"
    PopupVerticalAlign="WindowCenter" ShowFooter="True" Width="1000px" Height="500px"
    FooterText="" Theme="Office2010Blue" HeaderText="بحث الطلاب" EnableHierarchyRecreation="True"
    RightToLeft="True">
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
            <%-- <dx:ASPxButton ID="ASPxButton1" runat="server" Text="ASPxButton">
                        <ClientSideEvents Click="function(s, e) { ASPxPopupControl1.Hide(); }" />
                        </dx:ASPxButton>--%>
            <div style="direction: rtl">
                <h2>اختر</h2>
                <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" EnableTheming="True"
                    Theme="Office2010Blue" DataSourceID="DS_Select_students" EnableViewState="true"
                    KeyFieldName="app_ser"
                    OnRowCommand="ASPxGridView1_RowCommand">
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
                                <asp:LinkButton runat="server" ID="ddd" Text='<%# Eval("Name")%>' CommandName="stud"
                                    CommandArgument='<%# Eval("app_ser") %>' OnClientClick="configureLoadingForSearchPopup();">
                                            
                                            
                                            
                                </asp:LinkButton>
                            </DataItemTemplate>
                        </dx:GridViewDataHyperLinkColumn>
                        <dx:GridViewDataHyperLinkColumn Caption="رقم الطالب" ShowInCustomizationForm="True"
                            VisibleIndex="1" FieldName="app_ser">
                            <DataItemTemplate>
                                <asp:LinkButton runat="server" ID="ddd" Text='<%# Eval("app_ser") %>' CommandName="stud"
                                    CommandArgument='<%# Eval("app_ser") %>' OnClientClick="configureLoadingForSearchPopup();">
                                            
                                            
                                            
                                </asp:LinkButton>
                            </DataItemTemplate>
                        </dx:GridViewDataHyperLinkColumn>
                    </Columns>
                    <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                    <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                    <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                    <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
                    <SettingsText EmptyDataRow="لا توجد بيانات" />
                </dx:ASPxGridView>
                <cc1:LinqServerModeDataSource ID="LinqDS_Schools" runat="server"
                    ContextTypeName="DirectAid.charitysoftEntities"
                    TableName="benf_master" />

                <asp:SqlDataSource ID="DS_Select_students" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>">
                    <SelectParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

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
