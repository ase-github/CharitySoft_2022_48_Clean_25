<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCSchoolsStudentsCountAndFeesV1.ascx.vb" Inherits="DirectAid.UCSchoolsStudentsCountAndFeesV1" %>

<table style="margin: auto 0px auto auto; padding: inherit; border: thin solid #FFFFFF; width: 97%; line-height: normal; vertical-align: middle; table-layout: auto;" border="1" cellspacing="1" dir="rtl" frame="border">
    <tr>
        <td class="style65" dir="rtl" style="border: 1px none #FFFFFF">
            <asp:Label runat="server" Text="احصائيات عدد الطلبة" Font-Bold="False" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#990033" Width="139px" ID="Label1"></asp:Label>

        </td>
        <td class="style65" dir="rtl" style="border: 1px none #FFFFFF"></td>
        <td class="style65" dir="rtl" style="border: 1px none #FFFFFF">
            <asp:Label runat="server" Text="احصائيات التكاليف" Font-Bold="False" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#990033" Width="139px" ID="Label2"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style65" colspan="2" dir="rtl" style="border: 1px none #FFFFFF">
            <dx:ASPxGridView runat="server" KeyFieldName="school_code;acad_year_code;grade_code;class_code;stud_gender;stud_category;orphan" AutoGenerateColumns="False" DataSourceID="school_statistics_DS" Theme="Default" Width="531px" EnableTheming="True" ID="GRD_school_statistics">
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0">
                        <EditButton Visible="True" Text="تعديل"></EditButton>

                        <NewButton Visible="True" Text="جديد"></NewButton>

                        <DeleteButton Visible="True" Text="الغاء"></DeleteButton>

                        <ClearFilterButton Text="مسح"></ClearFilterButton>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="school_code" ReadOnly="True" Visible="False" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="acad_year_code" Caption="السنة الدراسية " VisibleIndex="2">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="acad_year_codes_DS" TextField="acad_year_name" ValueField="acad_year_code" ValueType="System.Int64" Width="100px" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="grade_code" Caption="المرحلة الدراسية" VisibleIndex="3">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="grades_setup_DS" TextField="grade_name_ar" ValueField="grade_code" ValueType="System.Int64" Width="100px" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="class_code" Caption="الصف" VisibleIndex="4">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="class_DS" TextField="class_name_ar" ValueField="class_code" ValueType="System.Int64" Width="100px" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="stud_gender" Caption="الجنس" VisibleIndex="5">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="gender_DS" TextField="gender_name_ar" ValueField="gender_code" ValueType="System.Int64" Width="100px" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="stud_category" Caption="التصنيف الدراسي" VisibleIndex="6">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="stud_category_DS" TextField="category_name_ar" ValueField="stud_category" ValueType="System.Int64" Width="100px" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="stud_num" Caption="عدد الطلبة" VisibleIndex="7">
                        <PropertiesTextEdit MaxLength="2" Width="100px">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataSpinEditColumn FieldName="amount_val" Caption="القيمة" Visible="False" VisibleIndex="8">
                        <PropertiesSpinEdit DisplayFormatString="g" Width="100px">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesSpinEdit>
                    </dx:GridViewDataSpinEditColumn>
                    <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="notes" Visible="False" VisibleIndex="10">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataCheckColumn Caption="يتيم" FieldName="orphan" VisibleIndex="9">
                        <PropertiesCheckEdit DisplayTextChecked="يتيم" DisplayTextUnchecked="غير يتيم">
            
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
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
        <td class="style65" dir="rtl" style="border: 1px none #FFFFFF">
            <dx:ASPxGridView runat="server" KeyFieldName="school_code;acad_year_code;grade_code;stud_category;class_num" AutoGenerateColumns="False" DataSourceID="school_fees_DS" Theme="Default" ID="GRD_school_fee">
                <Columns>
                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                        <EditButton Visible="True" Text="تعديل"></EditButton>

                        <NewButton Visible="True" Text="جديد"></NewButton>

                        <DeleteButton Visible="True" Text="الغاء"></DeleteButton>

                        <ClearFilterButton Text="مسح"></ClearFilterButton>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="school_code" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="fee_ser" ShowInCustomizationForm="True" VisibleIndex="2" ReadOnly="True" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="acad_year_code" ShowInCustomizationForm="True" Caption="السنة الدراسية " VisibleIndex="3">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="acad_year_codes_DS" TextField="acad_year_name" ValueField="acad_year_code" ValueType="System.Int64" Width="100px" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="grade_code" ShowInCustomizationForm="True" Caption="المرحلة الدراسية" VisibleIndex="4">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="grades_setup_DS" TextField="grade_name_ar" ValueField="grade_code" ValueType="System.Int64" Width="100px" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="stud_category" ShowInCustomizationForm="True" Caption="التصنيف الدراسي" VisibleIndex="5">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="stud_category_DS" TextField="category_name_ar" ValueField="stud_category" ValueType="System.Int64" Width="100px" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="class_num" ShowInCustomizationForm="True" Caption="الصف" VisibleIndex="6">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="class_DS" TextField="class_name_ar" ValueField="class_code" ValueType="System.Int64" Width="100px" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="fees_amount" ShowInCustomizationForm="True" Caption="قيمة التكاليف" VisibleIndex="7">
                        <PropertiesTextEdit MaxLength="15" Width="150px" DisplayFormatString="g">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="currency_code" ShowInCustomizationForm="True" Caption="العملة" VisibleIndex="8">
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

                        <asp:SqlDataSource ID="school_statistics_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            DeleteCommand="Delete_school_statistic" InsertCommand="Insert_school_statistic"
                            SelectCommand="Select_school_statistic" UpdateCommand="Update_school_statistic"
                            DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure"
                            UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Int16" />
                                <asp:Parameter Name="class_code" Type="String" />
                                <asp:Parameter Name="stud_gender" Type="Byte" />
                                <asp:Parameter Name="stud_category" Type="Byte" />
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="orphan" Type="Boolean" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Int16" />
                                <asp:Parameter Name="class_code" Type="String" />
                                <asp:Parameter Name="stud_gender" Type="Byte" />
                                <asp:Parameter Name="stud_category" Type="Byte" />
                                <asp:Parameter Name="stud_num" Type="Byte" />
                                <asp:Parameter Name="amount_val" Type="Decimal" />
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="orphan" Type="Boolean" DefaultValue="false" />
                                <asp:Parameter Name="notes" Type="String" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Int16" />
                                <asp:Parameter Name="class_code" Type="String" />
                                <asp:Parameter Name="stud_gender" Type="Byte" />
                                <asp:Parameter Name="stud_category" Type="Byte" />
                                <asp:Parameter Name="stud_num" Type="Byte" />
                                <asp:Parameter Name="amount_val" Type="Decimal" />
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="orphan" Type="Boolean" />
                                <asp:Parameter Name="notes" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="school_fees_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            DeleteCommand="Delete_school_fees" InsertCommand="Insert_school_fees" SelectCommand="Select_school_fees"
                            UpdateCommand="Update_school_fees" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure"
                            SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                            <DeleteParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Byte" />
                                <asp:Parameter Name="stud_category" Type="Byte" />
                                <asp:Parameter Name="class_num" Type="Int16" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Int16" />
                                <asp:Parameter Name="stud_category" Type="Byte" />
                                <asp:Parameter Name="class_num" Type="Int16" />
                                <asp:Parameter Name="fees_amount" Type="Decimal" />
                                <asp:Parameter Name="currency_code" Type="Int16" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
                                    Type="Int16" />
                                <asp:Parameter Name="acad_year_code" Type="Int16" />
                                <asp:Parameter Name="grade_code" Type="Int16" />
                                <asp:Parameter Name="stud_category" Type="Byte" />
                                <asp:Parameter Name="class_num" Type="Int16" />
                                <asp:Parameter Name="fees_amount" Type="Decimal" />
                                <asp:Parameter Name="currency_code" Type="Int16" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

        <asp:SqlDataSource ID="currency_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
            SelectCommand="Select_currency_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    

                        <asp:SqlDataSource ID="acad_year_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [academic_year_codes] where acad_year_code &gt;0"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="grades_setup_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [grades_codes] where grade_code &gt; 0"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="stud_category_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [students_category]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="class_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [classes_tab] where class_code &gt;0 "></asp:SqlDataSource>
                        
                    

                        <asp:SqlDataSource ID="gender_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [gender_tab]"></asp:SqlDataSource>
                        
                        
                    

