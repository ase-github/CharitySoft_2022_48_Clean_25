<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCSchoolsEmployeesDetailsV1.ascx.vb" Inherits="DirectAid.UCSchoolsEmployeesDetailsV1" %>


<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<style type="text/css">
    a:link
    {
        color: #034af3;
    }

    .auto-style1
    {
        visibility: hidden;
        border-width: 0;
        background-image: url('mvwres://DevExpress.Web.ASPxThemes.v13.1,%20Version=13.1.5.0,%20Culture=neutral,%20PublicKeyToken=b88d1754d700e49a/DevExpress.Web.ASPxThemes.App_Themes.Aqua.GridView.sprite.png');
    }

    .auto-style2
    {
        cursor: pointer;
        border-width: 0;
        background-image: url('mvwres://DevExpress.Web.ASPxThemes.v13.1,%20Version=13.1.5.0,%20Culture=neutral,%20PublicKeyToken=b88d1754d700e49a/DevExpress.Web.ASPxThemes.App_Themes.Aqua.GridView.sprite.png');
    }

    .auto-style3
    {
        border-width: 0;
        background-image: url('mvwres://DevExpress.Web.ASPxThemes.v13.1,%20Version=13.1.5.0,%20Culture=neutral,%20PublicKeyToken=b88d1754d700e49a/DevExpress.Web.ASPxThemes.App_Themes.Aqua.Web.sprite.png');
    }
</style>

<div>

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
        DataSourceID="employees_matrix_DS" EnableTheming="True" Font-Size="9pt"
        KeyFieldName="emp_code;acad_year_code;grade_code;subject_code"
        Theme="Default" Width="100%" ForeColor="#000099">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Text="تعديل" Visible="True">
                </EditButton>
                <NewButton Text="جديد" Visible="True">
                </NewButton>
                <DeleteButton Text="الغاء" Visible="True">
                </DeleteButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="emp_code" ReadOnly="True" Visible="False"
                VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="السنة الاكاديمية "
                FieldName="acad_year_code" ReadOnly="false" VisibleIndex="2">
                <PropertiesComboBox CallbackPageSize="10" DataSourceID="acad_year_codes_DS"
                    EnableCallbackMode="True" EnableClientSideAPI="True" TextField="acad_year_name"
                    ValueField="acad_year_code" ValueType="System.Int64">

                    <ValidationSettings>

                        <RequiredField IsRequired="True" />

                    </ValidationSettings>

                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="المرحلة الدراسية "
                FieldName="grade_code" VisibleIndex="3">
                <PropertiesComboBox CallbackPageSize="10" DataSourceID="grades_setup_DS"
                    EnableCallbackMode="True" EnableClientSideAPI="True" TextField="grade_name_ar"
                    ValueField="grade_code" ValueType="System.Int64">

                    <ValidationSettings>

                        <RequiredField IsRequired="True" />

                    </ValidationSettings>

                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="المواد الدراسية"
                FieldName="subject_code" VisibleIndex="4">
                <PropertiesComboBox CallbackPageSize="10" DataSourceID="school_subject_DS"
                    EnableCallbackMode="True" EnableClientSideAPI="True"
                    TextField="subject_name_ar" ValueField="subject_code" ValueType="System.Int64">

                    <ValidationSettings>

                        <RequiredField IsRequired="True" />

                    </ValidationSettings>

                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="عدد الحصص" FieldName="periods_num"
                VisibleIndex="5">
                <PropertiesTextEdit MaxLength="2">

                    <ValidationSettings>

                        <RegularExpression ErrorText="برجاء ادخال ارقام فقط" ValidationExpression="^[0-9]+$" />

                        <RequiredField IsRequired="True" />

                    </ValidationSettings>

                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع الحصص" FieldName="subjects_flag" VisibleIndex="6">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="نصاب الحصص الاسبوعي " Value="1" />
                        <dx:ListEditItem Text="الحصص الاضافية" Value="2" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
        </Columns>
        <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
        <SettingsPager PageSize="5" RenderMode="Lightweight">
            <PageSizeItemSettings Caption="عدد الصفحات" Items="5, 10, 20, 50, 100, 200"
                ShowAllItem="True" Visible="True">
            </PageSizeItemSettings>
        </SettingsPager>
        <SettingsEditing EditFormColumnCount="3" />
        <SettingsText CommandCancel="مسح" CommandClearFilter="مسح"
            CommandDelete="الغاء" CommandEdit="تعديل" CommandNew="جديد"
            CommandSelect="اختيار" CommandUpdate="حفظ" ConfirmDelete="الغاء" />
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="employees_matrix_DS" runat="server"
        ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        DeleteCommand="Delete_school_employees_matrix"
        DeleteCommandType="StoredProcedure"
        InsertCommand="Insert_school_employees_matrix"
        InsertCommandType="StoredProcedure"
        SelectCommand="Select_school_employees_matrix"
        SelectCommandType="StoredProcedure"
        UpdateCommand="Update_school_employees_matrix"
        UpdateCommandType="StoredProcedure">
        <DeleteParameters>
            <asp:QueryStringParameter Name="emp_code" QueryStringField="sid" Type="Int16" />
            <asp:Parameter Name="acad_year_code" Type="Int16" />
            <asp:Parameter Name="grade_code" Type="Int16" />
            <asp:Parameter Name="subject_code" Type="Int16" />
        </DeleteParameters>
        <InsertParameters>
            <asp:QueryStringParameter Name="emp_code" QueryStringField="sid" Type="Int16" />
            <asp:Parameter Name="acad_year_code" Type="Int16" />
            <asp:Parameter Name="grade_code" Type="Int16" />
            <asp:Parameter Name="subject_code" Type="Int16" />
            <asp:Parameter Name="periods_num" Type="Byte" />
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:Parameter Name="subjects_flag" Type="Byte" />
        </InsertParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="emp_code" QueryStringField="sid" Type="Int16" />
        </SelectParameters>
        <UpdateParameters>
            <asp:QueryStringParameter Name="emp_code" QueryStringField="sid" Type="Int16" />
            <asp:Parameter Name="acad_year_code" Type="Int16" />
            <asp:Parameter Name="grade_code" Type="Int16" />
            <asp:Parameter Name="subject_code" Type="Int16" />
            <asp:Parameter Name="periods_num" Type="Byte" />
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:Parameter Name="subjects_flag" Type="Byte" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="acad_year_codes_DS" runat="server"
        ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="SELECT * FROM [academic_year_codes] where acad_year_code &gt;0"></asp:SqlDataSource>
    <asp:SqlDataSource ID="grades_setup_DS" runat="server"
        ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="SELECT * FROM [grades_codes] where grade_code &gt;0"></asp:SqlDataSource>
    <asp:SqlDataSource ID="school_subject_DS" runat="server"
        ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
        SelectCommand="SELECT * FROM [school_subjects_codes] where subject_code &gt; 0"></asp:SqlDataSource>

</div>
