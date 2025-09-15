<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCSchoolsBasicInfoDetailsV1.ascx.vb" Inherits="DirectAid.UCSchoolsBasicInfoDetailsV1" %>


    <script type="text/javascript">
        function GetDateDifference() {

            var startDate = ASPxClientDateEdit.Cast("StartDate").GetDate();
            var endDate = ASPxClientDateEdit.Cast("EndDate").GetDate();
            var days = null;

            if (startDate != null && endDate != null) {
                var millisecondsPerDay = 1000 * 60 * 60 * 24;
                var millisBetween = endDate - startDate;
                days = millisBetween / millisecondsPerDay;
            }

            //ASPxClientMemo.Cast("dateDifferenceResult").SetValue(days);
            //ASPxTextBox.Cast("dateDifferenceResult").SetValue(days);
            dateDifferenceResult.SetValue(days);
        }
    </script>

<table style="width: 100%;direction:rtl">
    <tr>
        <td>
            <asp:Label runat="server" Text="عدد الفصول لكل مرحلة" Font-Bold="False" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#990033" Width="139px" ID="Label335"></asp:Label>

        </td>
        <td>
            <asp:Label runat="server" Text="العطل الرسمية" Font-Bold="False" Font-Names="Tahoma" Font-Size="10pt" ForeColor="#990033" Width="139px" ID="Label336"></asp:Label>

        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView runat="server" KeyFieldName="school_code;academic_year;grade_code" AutoGenerateColumns="False" DataSourceID="school_grades_DS" Theme="Default" Width="511px" EnableTheming="True" Font-Names="Tahoma" TabIndex="29" ID="school_grades_GRD">
                <Columns>
                    <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                        <EditButton Visible="True" Text="تعديل"></EditButton>

                        <NewButton Visible="True" Text="جديد"></NewButton>

                        <DeleteButton Visible="True" Text="الغاء"></DeleteButton>

                        <ClearFilterButton Text="مسح"></ClearFilterButton>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="school_code" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="trx_ser" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="academic_year" ShowInCustomizationForm="True" Caption="السنة الدراسية " VisibleIndex="3">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="acad_year_codes_DS" TextField="acad_year_name" ValueField="acad_year_code" ValueType="System.Int64" EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>

                        <EditFormSettings Visible="True"></EditFormSettings>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="grade_code" ShowInCustomizationForm="True" Caption="المرحلة الدراسية " VisibleIndex="4">
                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="grades_setup_DS" TextField="grade_name_ar" ValueField="grade_code" ValueType="System.Int64"  EnableClientSideAPI="True">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn FieldName="class_num" ShowInCustomizationForm="True" Caption="عدد الفصول" VisibleIndex="5">
                        <PropertiesTextEdit MaxLength="2" >
                            <ValidationSettings ErrorText="">
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="عدد الفصول الغير عاملة" VisibleIndex="6" FieldName="class_num_idle">
                        <PropertiesTextEdit MaxLength="2">
                            <ValidationSettings ErrorText="">
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>

                <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True"></SettingsBehavior>

                <SettingsPager PageSize="5">
                    <PageSizeItemSettings ShowAllItem="True" Items="5, 10, 20, 50, 100, 200" Caption="عدد الصفحات : " Visible="True"></PageSizeItemSettings>
                </SettingsPager>

                <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True"></Settings>

                <SettingsText CommandCancel="مسح" CommandUpdate="حفظ"></SettingsText>

                <SettingsDetail AllowOnlyOneMasterRowExpanded="True"></SettingsDetail>
            </dx:ASPxGridView>

        </td>
        <td>
            <dx:ASPxGridView runat="server" KeyFieldName="school_code;acad_year_code;holiday_start_date" AutoGenerateColumns="False" DataSourceID="school_holidays_DS" Theme="Default" Width="520px" EnableTheming="True" TabIndex="30" ID="ASPxGridView2">
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
                    <dx:GridViewDataTextColumn FieldName="holiday_name" ShowInCustomizationForm="True" Caption="اسم العطلة " Visible="False" VisibleIndex="4">
                        <PropertiesTextEdit Width="100px">
                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="holiday_start_date" ShowInCustomizationForm="True" Caption="تاريخ بداية العطلة " VisibleIndex="5">
                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormatString="yyyy-MM-dd" EditFormat="Custom" Width="100px" ClientInstanceName="StartDate" EnableClientSideAPI="True">
                            <ClientSideEvents ValueChanged="function(s, e) {GetDateDifference();}"></ClientSideEvents>

                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="holiday_end_date" ShowInCustomizationForm="True" Caption="تاريخ نهاية العطلة " VisibleIndex="6">
                        <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormatString="yyyy-MM-dd" EditFormat="Custom" Width="100px" ClientInstanceName="EndDate" EnableClientSideAPI="True">
                            <ClientSideEvents ValueChanged="function(s, e) {GetDateDifference();}"></ClientSideEvents>

                            <ValidationSettings>
                                <RequiredField IsRequired="True"></RequiredField>
                            </ValidationSettings>
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="holiday_days_num" ReadOnly="True" ShowInCustomizationForm="True" Caption="عدد ايام العطلة " VisibleIndex="7">
                        <PropertiesTextEdit ClientInstanceName="dateDifferenceResult" EnableClientSideAPI="True">
                            <ClientSideEvents Init="function(s, e) {
	GetDateDifference();
}" />
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn FieldName="notes_1" ShowInCustomizationForm="True" Caption="ملاحظات " VisibleIndex="8">
                        <PropertiesMemoEdit Width="500px"></PropertiesMemoEdit>

                        <EditFormSettings ColumnSpan="3"></EditFormSettings>
                    </dx:GridViewDataMemoColumn>
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

<asp:SqlDataSource ID="school_grades_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    DeleteCommand="Delete_school_grades" InsertCommand="Insert_school_grades" SelectCommand="Select_school_grades"
    UpdateCommand="Update_school_grades" DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure"
    SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
            Type="Int16" />
        <asp:Parameter Name="academic_year" Type="Int16" />
        <asp:Parameter Name="grade_code" Type="Byte" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
            Type="Int16" />
        <asp:Parameter Name="academic_year" Type="Int16" />
        <asp:Parameter Name="grade_code" Type="Byte" />
        <asp:Parameter Name="class_num" Type="Byte" />
        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
        <asp:Parameter Name="class_num_idle" Type="Byte" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
            Type="Int16" />
        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
            Type="Int16" />
        <asp:Parameter Name="academic_year" Type="Int16" />
        <asp:Parameter Name="grade_code" Type="Byte" />
        <asp:Parameter Name="class_num" Type="Byte" />
        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
        <asp:Parameter Name="class_num_idle" Type="Byte" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="school_holidays_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    DeleteCommand="Delete_school_holidays" InsertCommand="Insert_school_holidays"
    SelectCommand="Select_school_holidays" UpdateCommand="Update_school_holidays"
    DeleteCommandType="StoredProcedure" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure"
    UpdateCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
            Type="Int16" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
            Type="Int16" />
        <asp:Parameter Name="acad_year_code" Type="Int16" />
        <asp:Parameter Name="holiday_name" Type="String" />
        <asp:Parameter Name="holiday_start_date" Type="DateTime" />
        <asp:Parameter Name="holiday_end_date" Type="DateTime" />
        <asp:Parameter Name="holiday_days_num" Type="Int16" />
        <asp:Parameter Name="notes_1" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
            Type="Int16" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="txt_school_code" Name="school_code" PropertyName="Text"
            Type="Int16" />
        <asp:Parameter Name="acad_year_code" Type="Int16" />
        <asp:Parameter Name="holiday_name" Type="String" />
        <asp:Parameter Name="holiday_start_date" Type="DateTime" />
        <asp:Parameter Name="holiday_end_date" Type="DateTime" />
        <asp:Parameter Name="holiday_days_num" Type="Int16" />
        <asp:Parameter Name="notes_1" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>

        <asp:SqlDataSource ID="currency_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
            SelectCommand="Select_currency_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="acad_year_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [academic_year_codes] where acad_year_code &gt;0"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="grades_setup_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            SelectCommand="SELECT * FROM [grades_codes] where grade_code &gt; 0"></asp:SqlDataSource>
<p style="display: none">
    <asp:TextBox ID="txt_school_code" runat="server" BackColor="#FFFFCC"
        ClientIDMode="Static" Font-Names="Tahoma"
        Font-Size="9pt" ForeColor="#CEE6FF" Height="23px" MaxLength="4" Width="150px"></asp:TextBox>
</p>


