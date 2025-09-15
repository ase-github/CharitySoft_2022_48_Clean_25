<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ConvoysList.aspx.vb" Inherits="DirectAid.ConvoysList" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function openTransfers(url, options) {
            var floatingWindow;
            floatingWindow = open("", "", options);
            floatingWindow.location.href = url;
            return false;
        }
        function oncmbCountriesChanged(s) {
            grid.GetEditor("city_id").PerformCallback(cmbCountries.GetValue().toString());
        }
    </script>
    <dx:ASPxGridView ID="grd_ConvoysList" runat="server" Width="100%"
        AutoGenerateColumns="False" DataSourceID="DS_Convoy_Master"
        KeyFieldName="convoy_id" ClientInstanceName="grid">
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="المجموع = {0:n0}" FieldName="actual_cost" ShowInColumn="تكلفة فعلية" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="المجموع = {0:n0}" FieldName="budgeted_cost" ShowInColumn="تكلفة معتمدة" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="عدد القوافل = {0:n0}" FieldName="convoy_id" ShowInColumn="اسم القافلة - ع" SummaryType="Count" />
        </TotalSummary>
        <Columns>
            <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="10%">
            <EditButton Visible="True">
                <Image Url="~/Images/Edit_32x32.png">
                </Image>
            </EditButton>
            <NewButton Visible="True">
                <Image Url="~/Images/New_32x32.png">
                </Image>
            </NewButton>
            <CancelButton>
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </CancelButton>
            <UpdateButton>
                <Image Url="~/Images/Save_32x32.png">
                </Image>
            </UpdateButton>
            <ClearFilterButton Visible="True">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </ClearFilterButton>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewCommandColumn>
            <dx:GridViewDataDateColumn Caption="التاريخ" Visible="False" VisibleIndex="2"
                FieldName="creation_date">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="من" VisibleIndex="3"
                FieldName="convoy_start_date">
                <PropertiesDateEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesDateEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="الي" VisibleIndex="4"
                FieldName="convoy_end_date">
                <PropertiesDateEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesDateEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn Caption="اسم القافلة - ع" VisibleIndex="6"
                FieldName="convoy_name_ar" Width="350px">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="اسم القافله - E" VisibleIndex="7"
                FieldName="convoy_name_en" Width="350px" Visible="False">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="الدولة" VisibleIndex="8"
                FieldName="country_id">
                <PropertiesComboBox DataSourceID="DS_Countries" TextField="nat_descrar"
                    ValueField="nat_code" ClientInstanceName="cmbCountries" IncrementalFilteringMode="Contains">
                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	oncmbCountriesChanged(s);
}" />
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="المدينة" Visible="False"
                VisibleIndex="9" FieldName="city_id">
                <PropertiesComboBox DataSourceID="city_DS" TextField="city_name_ar" ValueField="city_id" IncrementalFilteringMode="Contains">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="القرية" Visible="False" VisibleIndex="10"
                FieldName="village">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="وصف المكان" Visible="False"
                VisibleIndex="11" FieldName="location_desc" Width="150px">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع الحملة" VisibleIndex="12"
                FieldName="type_id">
                <PropertiesComboBox DataSourceID="DS_Convoy_Types" TextField="type_name_ar"
                    ValueField="type_id" IncrementalFilteringMode="Contains">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="عدد الموظفين" Visible="False"
                VisibleIndex="13" FieldName="employees_count">
                <PropertiesTextEdit MaxLength="5">
                    <ValidationSettings>
                        <RegularExpression ErrorText="برجاء ادخال ارقام فقط" ValidationExpression="^(?=.*\d)\d*(?:)?$" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="عدد المستفيدين"
                VisibleIndex="14" FieldName="beneficiaries_count">
                <PropertiesTextEdit MaxLength="5">
                    <ValidationSettings>
                        <RegularExpression ErrorText="برجاء ادخال ارقام فقط" ValidationExpression="^(?=.*\d)\d*(?:)?$" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="تكلفة معتمدة" VisibleIndex="15"
                FieldName="budgeted_cost" Width="80px">
                <PropertiesTextEdit NullText="0.000">
                    <ValidationSettings>
                        <RegularExpression ErrorText="برجاء ادخال ارقام" ValidationExpression="^(?=.*\d)\d*(?:\.\d{0,3})?$" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="تكلفة فعلية" VisibleIndex="17"
                FieldName="actual_cost" Width="80px">
                <PropertiesTextEdit NullText="0.000">
                    <ValidationSettings>
                        <RegularExpression ErrorText="برجاء ادخال ارقام" ValidationExpression="^(?=.*\d)\d*(?:\.\d{0,3})?$" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="الكود" FieldName="convoy_id"
                VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="التفاصيل" UnboundType="String" VisibleIndex="32">
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="hyperLink_details" ImageUrl="~/img/menu27.png" OnInit="hyperLink_details_Init" runat="server" Text="التفاصيل">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
                <Settings AllowAutoFilter="False" AllowSort="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="العملة" FieldName="currency_code" Visible="False" VisibleIndex="30">
                <PropertiesComboBox DataSourceID="currency_tab_DS" TextField="currency_descrar" ValueField="currency_code" IncrementalFilteringMode="Contains">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="المرفقات" UnboundType="String" VisibleIndex="33">
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="hyperLink_attach" ImageUrl="~/img/opened18.png" OnInit="hyperLink_attach_Init" runat="server" Text="المرفقات">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
                <Settings AllowAutoFilter="False" AllowSort="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsPager PageSize="50">
        </SettingsPager>
        <SettingsEditing EditFormColumnCount="3" />
        <Settings ShowFilterRow="True" ShowFooter="True" />
        <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل"
            CommandNew="جديد" CommandUpdate="حفظ" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="DS_Countries" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_Convoy_Types" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [convoy_types]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_Convoy_Master" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [convoy_master]
where convoy_type = @type" InsertCommand="Insert_convoy_master" InsertCommandType="StoredProcedure" UpdateCommand="Update_convoy_master" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="convoy_name_ar" Type="String" />
            <asp:Parameter Name="convoy_name_en" Type="String" />
            <asp:Parameter Name="location_desc" Type="String" />
            <asp:Parameter DbType="Date" Name="convoy_start_date" />
            <asp:Parameter DbType="Date" Name="convoy_end_date" />
            <asp:Parameter Name="country_id" Type="Int16" />
            <asp:Parameter Name="city_id" Type="Int16" />
            <asp:Parameter Name="village" Type="String" />
            <asp:Parameter Name="type_id" Type="Int16" />
            <asp:Parameter Name="employees_count" Type="Int32" />
            <asp:Parameter Name="beneficiaries_count" Type="Int32" />
            <asp:Parameter Name="budgeted_cost" Type="Decimal" />
            <asp:Parameter Name="actual_cost" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="creation_date" />
            <asp:Parameter Name="user_name" Type="String" />
            <asp:Parameter Name="status" Type="Byte" />
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:Parameter Name="currency_code" Type="Int16" />
            <asp:QueryStringParameter Name="convoy_type" QueryStringField="type" Type="Byte" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="type" QueryStringField="type" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="convoy_id" Type="Int32" />
            <asp:Parameter Name="convoy_name_ar" Type="String" />
            <asp:Parameter Name="convoy_name_en" Type="String" />
            <asp:Parameter Name="location_desc" Type="String" />
            <asp:Parameter DbType="Date" Name="convoy_start_date" />
            <asp:Parameter DbType="Date" Name="convoy_end_date" />
            <asp:Parameter Name="country_id" Type="Int16" />
            <asp:Parameter Name="city_id" Type="Int16" />
            <asp:Parameter Name="village" Type="String" />
            <asp:Parameter Name="type_id" Type="Int16" />
            <asp:Parameter Name="employees_count" Type="Int32" />
            <asp:Parameter Name="beneficiaries_count" Type="Int32" />
            <asp:Parameter Name="budgeted_cost" Type="Decimal" />
            <asp:Parameter Name="actual_cost" Type="Decimal" />
            <asp:Parameter DbType="Date" Name="creation_date" />
            <asp:Parameter Name="user_name" Type="String" />
            <asp:Parameter Name="status" Type="Byte" />
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:Parameter Name="currency_code" Type="Int16" />
        </UpdateParameters>
    </asp:SqlDataSource>

        <asp:SqlDataSource ID="currency_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
            SelectCommand="Select_currency_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="city_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="Select_cities" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter Name="nat_city" />
                                        </SelectParameters>
    </asp:SqlDataSource>
                                    </asp:Content>
