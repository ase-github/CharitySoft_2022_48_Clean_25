<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryResultsV1.ascx.vb" Inherits="DirectAid.UCBeneficiaryResultsV1" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>



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

    function LoadOrgName(s) {
        var orgType = s.GetValue();
        //alert(orgType);
        ASPxClientHiddenField.Cast("ASPxHiddenField1").Set("value", orgType);

        ASPxClientComboBox.Cast("ASPxComboBox_org_name").PerformCallback(orgType);
    }

    function SetTypeValue(s) {
        //s.SetValue(ASPxClientHiddenField.Cast("ASPxHiddenField1").Get("value"));
    }


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

    function srch_rtn() { //main
        var key = event.keyCode;
        var i = document.getElementById("A_search");

        if (key == 13) {
            i.click();
        }
    } //main

    function OnCountryChanged(orgType) {
        grid.GetEditor("org_name").PerformCallback(orgType.GetValue().toString());
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

    .style4
    {
        width: 915px;
    }
</style>

<dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="students_results_DS"
    KeyFieldName="trx_ser" ClientInstanceName="grid" Width="100%" Theme="Default" Font-Size="Medium"
    OnCellEditorInitialize="Grid_CellEditorInitialize">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0">
            <EditButton Visible="True" Text="تعديل">
            </EditButton>
            <NewButton Visible="True" Text="جديد">
            </NewButton>
            <DeleteButton Visible="True" Text="الغاء">
            </DeleteButton>
            <ClearFilterButton Visible="True" Text="مسح">
            </ClearFilterButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="scholarship_ser" Visible="False" VisibleIndex="1" Caption="scholarship_ser">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="app_ser" ReadOnly="True" Visible="False" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="النتيجة العامة" FieldName="term_1" VisibleIndex="13">
            <PropertiesComboBox>
                <Items>
                    <dx:ListEditItem Text="ممتاز" Value="1" />
                    <dx:ListEditItem Text="جيد جدا" Value="2" />
                    <dx:ListEditItem Text="جيد" Value="3" />
                    <dx:ListEditItem Text="مقبول" Value="4" />
                    <dx:ListEditItem Text="ضعيف" Value="5" />
                    <dx:ListEditItem Text="ضعيف جدا" Value="6" />
                    <dx:ListEditItem Text="راسب" Value="7" />
                    <dx:ListEditItem Text="أخرى" Value="8" />
                    <dx:ListEditItem Text="انقطاع" Value="9" />
                </Items>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="نوع النتيجة" FieldName="terms_result" VisibleIndex="11">
            <PropertiesComboBox>
                <Items>
                    <dx:ListEditItem Text="السنة الدراسية" Value="1" />
                    <dx:ListEditItem Text="الفصل الدراسي الاول" Value="2" />
                    <dx:ListEditItem Text="الفصل الدراسي الثاني" Value="3" />
                    <dx:ListEditItem Text="الفصل الدراسي الثالث" Value="4" />
                    <dx:ListEditItem Text="الفصل الدراسي الرابع" Value="5" />
                    <dx:ListEditItem Text="الفصل الدراسي الخامس" Value="6" />
                </Items>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="trx_ser" ReadOnly="True" Visible="False" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="result_score" VisibleIndex="15" Caption="المعدل العام">
            <PropertiesTextEdit MaxLength="20">
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="field_notes" VisibleIndex="17" Caption="المكتب الميداني">
            <PropertiesTextEdit MaxLength="300">
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="loal_office_notes" VisibleIndex="19" Caption="المكتب الرئيسي (القطاع الجغرافي)">
            <PropertiesTextEdit MaxLength="300">
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
<%--        <dx:GridViewDataTextColumn Caption="اسم المؤسسة" FieldName="org_namear" VisibleIndex="5">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>--%>
        <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="result_desc" VisibleIndex="21" Visible="False">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataComboBoxColumn Caption="الصف" FieldName="study_level" VisibleIndex="10">
            <PropertiesComboBox DataSourceID="DS_Grade_Codes" TextField="grade_name_ar" ValueField="grade_code">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataCheckColumn Caption="الصف الحالي" FieldName="is_current_level" VisibleIndex="4">
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ النتيجة" FieldName="result_date" VisibleIndex="5">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="العام الدراسي" FieldName="academic_year" VisibleIndex="9">
            <PropertiesComboBox DataSourceID="acad_year_codes_DS" EnableCallbackMode="True" IncrementalFilteringMode="Contains" TextField="acad_year_name" ValueField="acad_year_code">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
    <SettingsPager PageSize="5">
        <PageSizeItemSettings Caption="عدد الصفحات : " Items="5, 10, 20, 50, 100, 200" ShowAllItem="True"
            Visible="True">
        </PageSizeItemSettings>
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" />
    <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True" ShowFilterRow="True" />
    <SettingsText CommandCancel="مسح" CommandUpdate="حفظ" />
    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
</dx:ASPxGridView>


<div style="display: none">
    <table style="width: 100%; height: 17px; background-color: #ECF5FF;" dir="rtl">

        <tr>
            <td bgcolor="#E6EEFF" class="style4" dir="rtl">
                <a id="A5" runat="server">
                    <img alt="" border="0" src="../images/Find_32x32.png" style="height: 32px; width: 32px;" />
                </a><a id="lnk_new" runat="server" href="" style="width: 72px; visibility: hidden; height: 24px">
                    <img alt="" border="0" src="../images/new.jpg" />
                </a><a id="lnk_save" runat="server" onclick="" style="visibility: hidden; width: 72px; height: 1px">
                    <img alt="" border="0" src="../images/save.jpg" />
                </a><a id="lnk_delete" runat="server" style="visibility: hidden; width: 72px; height: 1px">
                    <img alt="" border="0" src="../images/delete.jpg" />
                </a>
                <dx:ASPxHiddenField ID="ASPxHiddenField1" runat="server">
                </dx:ASPxHiddenField>
                <br />
            </td>
        </tr>
    </table>
    <table style="width: 100%; height: 139px; background-color: #ECF5FF;" dir="rtl">
        <tr>
            <td bgcolor="#E6EEFF" class="style50" dir="rtl">
                <table style="width: 35%;">
                    <tr>
                        <td>
                            <asp:Label ID="Label11" runat="server" Font-Names="Tahoma" Font-Size="9pt" Text="رقم الطالب"
                                Width="150px" ForeColor="#000066"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_app_ser" runat="server" BackColor="#FFFFCC" BorderColor="#CEE6FF"
                                BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px"
                                Width="90px" MaxLength="4"></asp:TextBox>
                        </td>
                        <td>&nbsp;
                        </td>
                        <td>
                            <asp:LinkButton ID="A_search" runat="server" CssClass="hide"></asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="A2" runat="server" CssClass="hide"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label12" runat="server" Font-Names="Tahoma" Font-Size="9pt" Text="اسم الطالب باللغة العربية"
                                Width="150px" ForeColor="#000066"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txt_applicant_name_ar" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                BorderWidth="1px" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#003366" Height="23px"
                                Width="335px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <span>
                                <img id="btn_search" alt="Search by names" border="0" height="24" src="../images/Search-icon.png"
                                    style="visibility: visible; width: 24px; height: 22px" onclick="//open_search_names_scrn();" /></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label229" runat="server" Font-Names="Tahoma" Font-Size="9pt" Text="اسم الطالب باللغة االانجليزية"
                                Width="150px" ForeColor="#000066"></asp:Label>
                        </td>
                        <td colspan="3">
                            <asp:TextBox ID="txt_applicant_name_en" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                                BorderWidth="1px" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#003366" Height="23px"
                                Width="335px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>&nbsp;
                        </td>
                    </tr>
                </table>
                <table style="width: 100%; height: 139px; background-color: #ECF5FF;" dir="rtl">
                    <tr>
                        <td colspan="7">&nbsp;</td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="students_results_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    DeleteCommand="Delete_students_results" DeleteCommandType="StoredProcedure" InsertCommand="Insert_students_results"
                    InsertCommandType="StoredProcedure" SelectCommand="Select_students_results" SelectCommandType="StoredProcedure"
                    UpdateCommand="Update_students_results" UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser" PropertyName="Text"
                            Type="Int32" />
                        <asp:Parameter Name="trx_ser" Type="Int16" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser" PropertyName="Text"
                            Type="Int32" />
                        <asp:Parameter Name="academic_year" Type="Int16" />
                        <asp:Parameter Name="org_name" Type="Int16" />
                        <asp:Parameter Name="terms_result" Type="Byte" />
                        <asp:Parameter Name="study_category" Type="Int16" />
                        <asp:Parameter Name="study_level" Type="Int16" />
                        <asp:Parameter Name="study_prof" Type="Int16" />
                        <asp:Parameter Name="study_branch" Type="Int16" />
                        <asp:Parameter Name="term_1" Type="Byte" />
                        <asp:Parameter Name="result_desc" Type="String" />
                        <asp:Parameter Name="result_score" Type="Decimal" />
                        <asp:Parameter Name="field_notes" Type="String" />
                        <asp:Parameter Name="loal_office_notes" Type="String" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:QueryStringParameter Name="scholarship_ser" QueryStringField="sid" Type="Int32" />
                        <asp:Parameter Name="is_current_level" Type="Boolean" />
                        <asp:Parameter DbType="Date" Name="result_date" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser" PropertyName="Text"
                            Type="Int32" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:QueryStringParameter Name="scholarship_ser" QueryStringField="sid" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser" PropertyName="Text"
                            Type="Int32" />
                        <asp:Parameter Name="trx_ser" Type="Int16" />
                        <asp:Parameter Name="academic_year" Type="Int16" />
                        <asp:Parameter Name="org_name" Type="Int16" />
                        <asp:Parameter Name="terms_result" Type="Byte" />
                        <asp:Parameter Name="study_category" Type="Int16" />
                        <asp:Parameter Name="study_level" Type="Int16" />
                        <asp:Parameter Name="study_prof" Type="Int16" />
                        <asp:Parameter Name="study_branch" Type="Int16" />
                        <asp:Parameter Name="term_1" Type="Byte" />
                        <asp:Parameter Name="result_desc" Type="String" />
                        <asp:Parameter Name="result_score" Type="Decimal" />
                        <asp:Parameter Name="field_notes" Type="String" />
                        <asp:Parameter Name="loal_office_notes" Type="String" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:QueryStringParameter Name="scholarship_ser" QueryStringField="sid" Type="Int32" />
                        <asp:Parameter Name="is_current_level" Type="Boolean" />
                        <asp:Parameter DbType="Date" Name="result_date" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="acad_year_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="Select_academic_year_codes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="stud_prof_types_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="Select_stud_prof_types_codes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="DS_study_level" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftCon_1 %>"
                    SelectCommand="Select_study_level_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="DS_study_category" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftCon_1 %>"
                    SelectCommand="Select_study_category_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <asp:SqlDataSource ID="DS_study_branch" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftCon_1 %>"
                    SelectCommand="Select_study_branch_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                <br />
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource_OrgType" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="SELECT * FROM [organization_type]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_OrgName" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="SELECT [org_code]
      ,[org_namear]
      ,[org_nameen]
      ,[org_type] FROM [organization_tab] WHERE ([org_type] = @org_type)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="" Name="org_type" Type="Int16" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_OrgName_All" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                    SelectCommand="SELECT [org_code], [org_namear], [org_nameen], [org_type] FROM [organization_tab]
where [org_type] =isnull(@type,org_type)">
                    <SelectParameters>
                        <asp:Parameter Name="type" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>

    </table>
</div>


<asp:SqlDataSource ID="DS_Grade_Codes" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [grades_codes]"></asp:SqlDataSource>


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
                    Theme="Office2010Blue" DataSourceID="DS_Select_students" EnableViewState="true" KeyFieldName="app_ser"
                    OnRowCommand="ASPxGridView1_RowCommand">
                    <Columns>
                        <dx:GridViewCommandColumn VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataHyperLinkColumn Caption="اسم الطالب - E" FieldName="Name_EN" ShowInCustomizationForm="True"
                            VisibleIndex="3" Width="425px">
                            <DataItemTemplate>
                                <asp:LinkButton runat="server" ID="ddd" Text='<%# Eval("Name_EN") %>' CommandName="stud"
                                    CommandArgument='<%# Eval("app_ser") %>' OnClientClick="configureLoadingForSearchPopup();">
                                            
                                            
                                            
                                </asp:LinkButton>
                            </DataItemTemplate>
                        </dx:GridViewDataHyperLinkColumn>
                        <dx:GridViewDataHyperLinkColumn Caption="اسم الطالب - ع" FieldName="Name" VisibleIndex="2"
                            Width="425px">
                            <DataItemTemplate>
                                <asp:LinkButton runat="server" ID="ddd" Text='<%# Eval("Name") %>' CommandName="stud"
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
                </dx:ASPxGridView>
                <cc1:LinqServerModeDataSource ID="LinqDS_Schools" runat="server" ContextTypeName="DirectAid.charitysoftEntities"
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
    <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Hide(); }" />
</dx:ASPxCallback>
<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
    Modal="true" Text="برجاء الانتظار .." RightToLeft="True">
</dx:ASPxLoadingPanel>
