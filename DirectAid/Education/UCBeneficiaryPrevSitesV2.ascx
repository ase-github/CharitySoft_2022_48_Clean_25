<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryPrevSitesV2.ascx.vb" Inherits="DirectAid.UCBeneficiaryPrevSitesV2" %>
<%@ Register assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
    EnableCallBacks="False" Font-Size="Medium" ForeColor="#000066"
    Theme="Default" Width="100%" DataSourceID="ESMDS_students_previous_sites" ClientInstanceName="grid" EnableTheming="True" KeyFieldName="trx_ser">
    <ClientSideEvents SelectionChanged="ASPxGridView1_SelectionChanged" />
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0">
            <EditButton Visible="True">
            </EditButton>
            <NewButton Visible="True">
            </NewButton>
            <DeleteButton Visible="True">
            </DeleteButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="app_ser"
            Visible="False" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="trx_ser" Visible="False" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="عدد السنوات" FieldName="years_num" VisibleIndex="5">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ErrorText="*" ValidationExpression="^(?=.*\d)\d*(?:)?$" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ الشهادة" FieldName="certifictae_date" VisibleIndex="7">
            <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="اسم المؤسسة التعليمية" FieldName="org_name" VisibleIndex="4">
            <PropertiesComboBox DataSourceID="DS_GetSchools" EnableCallbackMode="True" IncrementalFilteringMode="Contains" TextField="school_name_ar" ValueField="school_code">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="نوع الشهادة" FieldName="certifictae_type" VisibleIndex="6">
            <PropertiesComboBox DataSourceID="DS_certificate" EnableCallbackMode="True" IncrementalFilteringMode="Contains" TextField="cert_descr_ar" ValueField="cert_id">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="التقدير" FieldName="result_1" VisibleIndex="8">
            <PropertiesComboBox EnableCallbackMode="True" IncrementalFilteringMode="Contains">
                <Items>
                    <dx:ListEditItem Text="مقبول" Value="1" />
                    <dx:ListEditItem Text="جيد" Value="2" />
                    <dx:ListEditItem Text="جيد جداً" Value="3" />
                    <dx:ListEditItem Text="ممتاز" Value="4" />
                    <dx:ListEditItem Text="ضعيف" Value="5" />
                    <dx:ListEditItem Text="ضعيف جداً" Value="6" />
                    <dx:ListEditItem Text="راسب" Value="7" />
                </Items>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="الكلية" FieldName="faculty" VisibleIndex="12">
            <PropertiesComboBox DataSourceID="DS_Education_Faculties_master" EnableCallbackMode="True" IncrementalFilteringMode="Contains" TextField="name_ar" ValueField="id">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="التخصص" FieldName="prof_type" VisibleIndex="14">
            <PropertiesComboBox DataSourceID="stud_prof_types_codes_DS" EnableCallbackMode="True" IncrementalFilteringMode="Contains" ValueField="stud_prof_type_code" TextField="stud_prof_name_ar">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="notes" Visible="False" VisibleIndex="15">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataComboBoxColumn Caption="العام الدراسي" FieldName="academic_year" VisibleIndex="3">
            <PropertiesComboBox DataSourceID="acad_year_codes_DS" EnableCallbackMode="True" IncrementalFilteringMode="Contains" TextField="acad_year_name" ValueField="acad_year_code">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>

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
    <SettingsText CommandCancel="الغاء" CommandUpdate="حفظ" CommandEdit="تعديل" CommandNew="جديد" EmptyDataRow="لا توجد بيانات" CommandDelete="ازالة" />
    <SettingsLoadingPanel Text="برجاء الانتظار&amp;hellip;" />
    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
</dx:ASPxGridView>

<asp:EntityDataSource ID="ESMDS_students_previous_sites" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="students_previous_sites" EntityTypeFilter="students_previous_sites" Where="" AutoGenerateWhereClause="True" Select="">
    <WhereParameters>
        <asp:QueryStringParameter Name="app_ser" QueryStringField="app_ser" DbType="Int32" />
    </WhereParameters>
</asp:EntityDataSource>
<asp:SqlDataSource ID="DS_Education_Faculties_master" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="select id,name_ar,name_en from education_Faculties_master"></asp:SqlDataSource>
<asp:SqlDataSource ID="stud_prof_types_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_stud_prof_types_codes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


<asp:SqlDataSource ID="DS_GetSchools" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="select distinct school_code,
	cast(school_code as nvarchar)+' - '+cast(isnull(school_name_ar,'') as nvarchar) +'  - ('+isnull(nat_tab.nat_descrar,'غير معرف') collate Arabic_CI_AS +')'  as school_name_ar,
	cast(school_code as nvarchar)+' - '+cast(isnull(school_name_en,'') as nvarchar) +'  - ('+isnull(nat_tab.nat_descrar,'not defined') collate Arabic_CI_AS +')'  as school_name_en
from school_master
left outer join city on  school_master.country_city = city.city_id
left outer join nat_tab on city.nat_city = nat_tab.nat_code


">
    </asp:SqlDataSource>
<asp:SqlDataSource ID="acad_year_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="Select_academic_year_codes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

<asp:SqlDataSource ID="DS_certificate" runat="server"
                    ConnectionString="<%$ ConnectionStrings:charitysoft %>"
                    SelectCommand="Select_certificate_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>