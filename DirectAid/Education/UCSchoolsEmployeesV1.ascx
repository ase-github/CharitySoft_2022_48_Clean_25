<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCSchoolsEmployeesV1.ascx.vb" Inherits="DirectAid.UCSchoolsEmployeesV1" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>














<script type="text/javascript">
    function openDetails(url, options) {
        var floatingWindow;
        floatingWindow = open("", "", options);
        floatingWindow.location.href = url;
        return false;
    }
</script>


<div style="width: 100%; text-align: right; margin-top: 15px; margin-bottom: 15px; display: none;">
    <div style="float: right">
        <dx:ASPxTextBox ID="txt_queryName" runat="server" Width="350px" Height="30px" NullText="استعلم عن موظف جديد">
        </dx:ASPxTextBox>
    </div>
    <div style="float: right">
        <dx:ASPxButton ID="btn_query" runat="server" Text="استعلام" Height="30px">
        </dx:ASPxButton>
    </div>
    <div style="float: right">
        <dx:ASPxButton ID="btn_clear" runat="server" Text="الغاء الاستعلام" Height="30px">
        </dx:ASPxButton>
    </div>
</div>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Width="100%" DataSourceID="DS_Select_employees_V2" KeyFieldName="emp_code" ClientInstanceName="grid">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0">
            <EditButton Visible="True">
            </EditButton>
            <NewButton Visible="True">
            </NewButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn Caption="رقم الموظف" FieldName="emp_code" ReadOnly="True" VisibleIndex="1" Width="50px">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="اسم الموظف - ع" FieldName="emp_name_ar" VisibleIndex="3" Width="250px">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="اسم الموظف - E" FieldName="emp_name_eng" VisibleIndex="4" Width="250px">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ الميلاد" FieldName="emp_dob" VisibleIndex="6" Width="80px">
            <PropertiesDateEdit EditFormatString="dd/MM/yyyy">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ العمل" FieldName="emp_working_date" Visible="False" VisibleIndex="8">
            <PropertiesDateEdit EditFormatString="dd/MM/yyyy">
            </PropertiesDateEdit>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ الالتحاق بالمؤسسة التعليمية" FieldName="emp_join_date" Visible="False" VisibleIndex="11">
            <PropertiesDateEdit EditFormatString="dd/MM/yyyy">
            </PropertiesDateEdit>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ التخرج" FieldName="emp_qualification_date" Visible="False" VisibleIndex="17">
            <PropertiesDateEdit EditFormatString="dd/MM/yyyy">
            </PropertiesDateEdit>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="سنوات الخبرة بالمؤسسة التعليمية" FieldName="emp_exp_yr_internal" Visible="False" VisibleIndex="18">
            <PropertiesTextEdit MaxLength="2">
                <ValidationSettings>
                    <RegularExpression ValidationExpression="^(?=.*\d)\d*(?:)?$" ErrorText="برجاء ادخال ارقام" />
                </ValidationSettings>
            </PropertiesTextEdit>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="سنوات الخبرة خارج المؤسسة" FieldName="emp_exp_yr_external" Visible="False" VisibleIndex="19">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ValidationExpression="^(?=.*\d)\d*(?:)?$" ErrorText="برجاء ادخال ارقام" />
                </ValidationSettings>
            </PropertiesTextEdit>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الراتب الشهري" FieldName="emp_monthly_sal" Visible="False" VisibleIndex="20">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ValidationExpression="^(?=.*\d)\d*(?:\.\d{0,3})?$" ErrorText="برجاء ادخال قيمة صحيحة" />
                </ValidationSettings>
            </PropertiesTextEdit>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الراتب السنوي" FieldName="emp_yearly_sal" VisibleIndex="21">
            <PropertiesTextEdit>
                <ValidationSettings>
                    <RegularExpression ValidationExpression="^(?=.*\d)\d*(?:\.\d{0,3})?$" ErrorText="برجاء ادخال قيمة صحيحة" />
                </ValidationSettings>
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="تصنيف الموظف" FieldName="emp_type" VisibleIndex="5">
            <PropertiesComboBox DataSourceID="job_class_DS" TextField="job_class_name_ar" ValueField="job_class_code" CallbackPageSize="10" EnableCallbackMode="True" IncrementalFilteringMode="Contains">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="الجنسية" FieldName="emp_nat" VisibleIndex="7">
            <PropertiesComboBox DataSourceID="nat_tab_DS" TextField="nat_descrar" ValueField="nat_code" CallbackPageSize="10" EnableCallbackMode="True" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="نوع التوظيف" FieldName="employment_type" Visible="False" VisibleIndex="12">
            <PropertiesComboBox DataSourceID="employment_type_DS" TextField="employment_type_ar" ValueField="employment_type_code" CallbackPageSize="10" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="الوظيفة" FieldName="emp_job" VisibleIndex="13">
            <PropertiesComboBox DataSourceID="job_tab_DS" TextField="job_descr_ar" ValueField="job_code" CallbackPageSize="10" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="المؤهل العلمي" FieldName="emp_qualification" Visible="False" VisibleIndex="14">
            <PropertiesComboBox DataSourceID="qualifications_DS" TextField="qualification_name_ar" ValueField="qualification_code" CallbackPageSize="10" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="التقدير" FieldName="emp_qualification_result" Visible="False" VisibleIndex="15">
            <PropertiesComboBox DataSourceID="assessment_DS" TextField="assesment_namear" ValueField="assesment_code" CallbackPageSize="10" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="التخصص" FieldName="emp_qualification_prof" Visible="False" VisibleIndex="16">
            <PropertiesComboBox DataSourceID="job_proffession_DS" TextField="job_prof_name_ar" ValueField="job_prof_code" CallbackPageSize="10" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="العملة" FieldName="emp_currency" VisibleIndex="29">
            <PropertiesComboBox DataSourceID="currency_DS" TextField="currency_descrar" ValueField="currency_code" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="notes_1" Visible="False" VisibleIndex="31">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataTextColumn Caption="التفاصيل" UnboundType="String" VisibleIndex="33">
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="hyperLink_details" runat="server" OnInit="hyperLink_details_Init" Text="التفاصيل">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ نهاية العمل" FieldName="termination_date" Visible="False" VisibleIndex="9">
            <PropertiesDateEdit EditFormatString="dd/MM/yyyy">
            </PropertiesDateEdit>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="سبب ترك الوظيفة" FieldName="termination_reason" Visible="False" VisibleIndex="10">
            <PropertiesComboBox DataSourceID="reasons_tab_DS" TextField="reason_ar" ValueField="reason_code" CallbackPageSize="10" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains">
            </PropertiesComboBox>
            <EditFormSettings Visible="True" />
        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <SettingsEditing EditFormColumnCount="4" />
    <Settings ShowFilterRow="True" />
    <SettingsText CommandCancel="الغاء" CommandEdit="تعديل" CommandNew="جديد" CommandUpdate="حفظ" />
</dx:ASPxGridView>

<asp:SqlDataSource ID="DS_Select_employees_V2" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" InsertCommand="Insert_school_employees_V2" InsertCommandType="StoredProcedure" SelectCommand="Select_school_employees_V2" SelectCommandType="StoredProcedure" UpdateCommand="Update_school_employees_V2" UpdateCommandType="StoredProcedure">
    <InsertParameters>
        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int32" />
        <asp:Parameter Name="emp_type" Type="Byte" />
        <asp:Parameter Name="emp_name_ar" Type="String" />
        <asp:Parameter Name="emp_name_eng" Type="String" />
        <asp:Parameter Name="emp_dob" Type="DateTime" />
        <asp:Parameter Name="emp_nat" Type="Int16" />
        <asp:Parameter Name="emp_working_date" Type="DateTime" />
        <asp:Parameter Name="emp_join_date" Type="DateTime" />
        <asp:Parameter Name="employment_type" Type="Byte" />
        <asp:Parameter Name="emp_job" Type="Int16" />
        <asp:Parameter Name="emp_qualification" Type="Int16" />
        <asp:Parameter Name="emp_qualification_result" Type="Byte" />
        <asp:Parameter Name="emp_qualification_prof" Type="Int16" />
        <asp:Parameter Name="emp_qualification_date" Type="DateTime" />
        <asp:Parameter Name="emp_exp_yr_internal" Type="Byte" />
        <asp:Parameter Name="emp_exp_yr_external" Type="Byte" />
        <asp:Parameter Name="emp_monthly_sal" Type="Decimal" />
        <asp:Parameter Name="emp_yearly_sal" Type="Decimal" />
        <asp:Parameter Name="emp_currency" Type="Int16" />
        <asp:Parameter Name="notes_1" Type="String" />
        <asp:Parameter Direction="InputOutput" Name="emp_code" Type="Int16" />
        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
        <asp:Parameter DbType="Date" Name="termination_date" />
        <asp:Parameter Name="termination_reason" Type="Int16" />
    </InsertParameters>
    <SelectParameters>
        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:QueryStringParameter Name="school_code" QueryStringField="SchoolID" Type="Int32" />
        <asp:Parameter Name="emp_code" Type="Int16" />
        <asp:Parameter Name="emp_type" Type="Byte" />
        <asp:Parameter Name="emp_name_ar" Type="String" />
        <asp:Parameter Name="emp_name_eng" Type="String" />
        <asp:Parameter Name="emp_dob" Type="DateTime" />
        <asp:Parameter Name="emp_nat" Type="Int16" />
        <asp:Parameter Name="emp_working_date" Type="DateTime" />
        <asp:Parameter Name="emp_join_date" Type="DateTime" />
        <asp:Parameter Name="employment_type" Type="Byte" />
        <asp:Parameter Name="emp_job" Type="Int16" />
        <asp:Parameter Name="emp_qualification" Type="Int16" />
        <asp:Parameter Name="emp_qualification_result" Type="Byte" />
        <asp:Parameter Name="emp_qualification_prof" Type="Int16" />
        <asp:Parameter Name="emp_qualification_date" Type="DateTime" />
        <asp:Parameter Name="emp_exp_yr_internal" Type="Byte" />
        <asp:Parameter Name="emp_exp_yr_external" Type="Byte" />
        <asp:Parameter Name="emp_monthly_sal" Type="Decimal" />
        <asp:Parameter Name="emp_yearly_sal" Type="Decimal" />
        <asp:Parameter Name="emp_currency" Type="Int16" />
        <asp:Parameter Name="notes_1" Type="String" />
        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
        <asp:Parameter DbType="Date" Name="termination_date" />
        <asp:Parameter Name="termination_reason" Type="Int16" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="nat_tab_DS" runat="server"
    ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
<asp:SqlDataSource ID="job_class_DS" runat="server"
    ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="SELECT * FROM [job_class]"></asp:SqlDataSource>
<asp:SqlDataSource ID="employment_type_DS" runat="server"
    ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="SELECT * FROM [employment_type]"></asp:SqlDataSource>
<asp:SqlDataSource ID="job_tab_DS" runat="server"
    ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="SELECT * FROM [job_codes]"></asp:SqlDataSource>
<asp:SqlDataSource ID="qualifications_DS" runat="server"
    ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="SELECT * FROM [qualifications_codes]"></asp:SqlDataSource>
<asp:SqlDataSource ID="assessment_DS" runat="server"
    ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="SELECT * FROM [general_assesment_tab]"></asp:SqlDataSource>
<asp:SqlDataSource ID="job_proffession_DS" runat="server"
    ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="SELECT * FROM [job_proffession]"></asp:SqlDataSource>
<asp:SqlDataSource ID="currency_DS" runat="server"
    ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="SELECT * FROM [currency_tab]"></asp:SqlDataSource>

<asp:SqlDataSource ID="reasons_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="Select_reason_tab" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter DefaultValue="12" Name="reason_cate" Type="Int16" />
    </SelectParameters>
</asp:SqlDataSource>

