<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCIndependentEducationalInstitutesV2.ascx.vb" Inherits="DirectAid.UCIndependentEducationalInstitutesV2" %>
<script>
    function OpenRecord(recordID) {

        document.location.href = 'IndependentSchoolsMaster.aspx?scode=' + recordID;
        document.URL
    }

    function CustomButtonClick(e) {

        var gridName = "ASPxGridView1";
        var index = e.visibleIndex;
        var key = ASPxClientGridView.Cast("ASPxGridView1").GetRowKey(index);
        OpenRecord(key);
    }
</script>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
    KeyFieldName="school_code" Width="100%" ClientInstanceName="ASPxGridView1" meta:resourcekey="ASPxGridView1Resource1" RightToLeft="True" DataSourceID="SqlDataSource1" Caption="قائمة المؤسسات التابعة للجمعية">
    <ClientSideEvents CustomButtonClick="function(s, e) {
	CustomButtonClick(e);
}" />
    <TotalSummary>
        <dx:ASPxSummaryItem DisplayFormat="الاجمالى = {0:n0}" FieldName="app_ser"
            ShowInColumn="الرقم" ShowInGroupFooterColumn="الرقم" SummaryType="Count"
            ValueDisplayFormat="{0:n0}" />
    </TotalSummary>
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image"
            Width="5%">
            <ClearFilterButton Visible="True">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </ClearFilterButton>
            <CustomButtons>
                <dx:GridViewCommandColumnCustomButton>
                    <Image Url="~/Images/Edit_32x32.png">
                    </Image>
                </dx:GridViewCommandColumnCustomButton>
            </CustomButtons>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn Caption="الرقم" FieldName="school_code"
            VisibleIndex="1" Width="10%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <FooterCellStyle HorizontalAlign="Center">
            </FooterCellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="نوع المؤسسة" VisibleIndex="7" FieldName="site_type">
            <PropertiesComboBox DataSourceID="org_type_DS" TextField="org_type_ar" ValueField="org_type_code">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn Caption="الاسم بالعربيه" FieldName="school_name_ar"
            VisibleIndex="2" Width="35%">
            <Settings AutoFilterCondition="Contains" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="المدينة -(الدولة)" FieldName="country_city"
            VisibleIndex="5" Width="25%">
            <PropertiesComboBox CallbackPageSize="10" DataSourceID="cities_name"
                EnableCallbackMode="True" EnableClientSideAPI="True"
                IncrementalFilteringMode="Contains" TextField="city_name_ar"
                ValueField="city_id" ValueType="System.Int16">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn Caption="الاسم بالانجليزية" FieldName="school_name_en" VisibleIndex="3" Width="35%">
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="الدولة" FieldName="Country" VisibleIndex="4" Width="25%">
            <PropertiesComboBox DataSourceID="DS_countries" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" TextField="nat_descrar" ValueField="nat_code">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <SettingsBehavior AutoFilterRowInputDelay="10000" />
    <Settings ShowFilterRow="True" ShowFooter="True" />
</dx:ASPxGridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="select *,
(case when country_city is not null then (select nat_code from nat_tab where nat_code = (select nat_city from city where city_id = school_master.country_city)) else '' end) As Country
from school_master
where school_related_to_da = 0"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="org_type_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="Select_organization_type" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="cities_name" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>"
                            SelectCommand="SELECT city_id,'('+nat_tab.nat_descrar collate Arabic_CI_AS + ') - ' +city_name_ar as city_name_ar ,
'('+nat_tab.nat_descrar collate Arabic_CI_AS + ') - ' +city_name_en as city_name_en,nat_city,governrte FROM [city] 
inner join nat_tab on city.nat_city = nat_tab.nat_code">
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="DS_countries" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>"
                            SelectCommand="SELECT * FROM [nat_tab]">
                        </asp:SqlDataSource>
                        
                        

                        