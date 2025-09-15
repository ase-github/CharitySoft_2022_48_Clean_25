<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCSchoolBuildingsV1.ascx.vb" Inherits="DirectAid.UCSchoolBuildingsV1" %>

<table style="width: 100%;direction:rtl">
    <tr>
        <td>
            <asp:Label runat="server" Text="المباني و التجهيزات" Font-Bold="False" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#990033" Width="139px" ID="Label337"></asp:Label>

        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView runat="server" KeyFieldName="school_code;trx_ser" AutoGenerateColumns="False" DataSourceID="school_building_DS" Theme="Default" Width="100%" ID="GRD_school_build" Font-Size="9pt">
                <Columns>
                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                        <EditButton Visible="True" Text="تعديل"></EditButton>

                        <NewButton Visible="True" Text="جديد"></NewButton>

                        <DeleteButton Visible="True" Text="الغاء"></DeleteButton>

                        <ClearFilterButton Text="مسح"></ClearFilterButton>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="school_code" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="acad_year_code" ShowInCustomizationForm="True" Caption="السنة الدراسية " VisibleIndex="2">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="acad_year_codes_DS" TextField="acad_year_name" ValueField="acad_year_code" ValueType="System.Int64" Width="100px" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="trx_ser" ShowInCustomizationForm="True" VisibleIndex="3" ReadOnly="True" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="unit_type" ShowInCustomizationForm="True" Caption="نوع الوحدة" VisibleIndex="4">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="unit_types_codes_DS" TextField="unit_name_ar" ValueField="unit_code" ValueType="System.Int64" Width="100px" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="unit_count" ShowInCustomizationForm="True" Caption="عدد الوحدات" VisibleIndex="5">
                        <PropertiesTextEdit MaxLength="2" Width="50px">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="unit_condition" ShowInCustomizationForm="True" Caption="حالة الوحدة" VisibleIndex="6">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="unit_cond_DS" TextField="unit_cond_name_ar" ValueField="unit_cond_code" ValueType="System.Int64" Width="50px" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataCheckColumn FieldName="under_construction" ShowInCustomizationForm="True" Caption="تحت الانشاء" VisibleIndex="7">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="construction_cost" ShowInCustomizationForm="True" Caption="تكلفة الانشاء" VisibleIndex="8">
                        <PropertiesTextEdit MaxLength="15" Width="120px" DisplayFormatString="g">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="need_maint" ShowInCustomizationForm="True" Caption="تحتاج صيانة" VisibleIndex="9">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="maint_cost" ShowInCustomizationForm="True" Caption="تكاليف الصيانة" VisibleIndex="10">
                        <PropertiesTextEdit MaxLength="15" Width="120px" DisplayFormatString="g">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="need_accomd" ShowInCustomizationForm="True" Caption="تحتاج تجهيزات" VisibleIndex="11">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="accomd_cost" ShowInCustomizationForm="True" Caption="تكلفة التجهيزات" VisibleIndex="12">
                        <PropertiesTextEdit MaxLength="15" Width="120px" DisplayFormatString="g">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn FieldName="notes_1" ShowInCustomizationForm="True" Caption="ملاحظات" VisibleIndex="14">
                        <PropertiesMemoEdit Width="500px">
                        </PropertiesMemoEdit>
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="currency_code" ShowInCustomizationForm="True" Caption="العملة" VisibleIndex="13">
                        <PropertiesComboBox DataSourceID="currency_tab_DS" TextField="currency_descrar" ValueField="currency_code">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>

                <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True"></SettingsBehavior>

                <SettingsPager PageSize="5">
                    <PageSizeItemSettings ShowAllItem="True" Items="5, 10, 20, 50, 100, 200" Caption="عدد الصفحات : " Visible="True"></PageSizeItemSettings>
                </SettingsPager>

                <SettingsEditing EditFormColumnCount="3"></SettingsEditing>

                <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True"></Settings>

                <SettingsText CommandCancel="مسح" CommandUpdate="حفظ"></SettingsText>

                <SettingsDetail AllowOnlyOneMasterRowExpanded="True"></SettingsDetail>
            </dx:ASPxGridView>

        </td>
    </tr>
</table>
<p style="display: none">
    <asp:TextBox ID="txt_school_code" runat="server" BackColor="#FFFFCC"
        ClientIDMode="Static" Font-Names="Tahoma"
        Font-Size="9pt" ForeColor="#CEE6FF" Height="23px" MaxLength="4" Width="150px"></asp:TextBox>
</p>

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
                        

                        <asp:SqlDataSource ID="acad_year_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [academic_year_codes] where acad_year_code &gt;0"></asp:SqlDataSource>

        <asp:SqlDataSource ID="currency_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
            SelectCommand="Select_currency_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="unit_types_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [unit_types_codes]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="unit_cond_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [unit_cond_codes]"></asp:SqlDataSource>

        
                        

