<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCScholarshipExpensesV1.ascx.vb" Inherits="DirectAid.UCScholarshipExpensesV1" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>



<div>
    <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="students_scholarship_fees_DS" EnableTheming="True" Font-Size="Medium" ForeColor="#000066"
        KeyFieldName="scholarship_id;fees_type" TabIndex="2" Theme="Default" Width="100%">
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="مجموع المصاريف: {0:n3}" FieldName="fee_amount"
                ShowInColumn="القيمة" SummaryType="Sum" />
        </TotalSummary>
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Text="تعديل">
                </EditButton>
                <NewButton Text="جديد" Visible="True">
                </NewButton>
                <DeleteButton Text="الغاء" Visible="True">
                </DeleteButton>
                <ClearFilterButton Text="مسح">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="scholarship_id" ReadOnly="True"
                Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع المصاريف" FieldName="fees_type"
                VisibleIndex="2">
                <PropertiesComboBox CallbackPageSize="10" DataSourceID="fees_codes_DS" EnableCallbackMode="True"
                    EnableClientSideAPI="True" TextField="fee_name_ar" ValueField="fee_code" ValueType="System.Int64"
                    >
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="القيمة" FieldName="fee_amount"
                VisibleIndex="3">
                <PropertiesTextEdit EnableClientSideAPI="True" MaxLength="15" >
                    <ValidationSettings>
                        <RegularExpression ErrorText="برجاء ادخال قيم صحيحة" ValidationExpression="^(?=.*\d)\d*(?:\.\d{0,3})?$" />
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
        <SettingsPager PageSize="4">
            <PageSizeItemSettings Caption="عدد الصفحات : " Items="5, 10, 20, 50, 100, 200" ShowAllItem="True"
                Visible="True">
            </PageSizeItemSettings>
        </SettingsPager>
        <SettingsEditing EditFormColumnCount="3" />
        <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowFooter="True"
            ShowHeaderFilterButton="True" />
        <SettingsText CommandCancel="مسح" CommandUpdate="حفظ" />
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
    </dx:ASPxGridView>
</div>
<asp:SqlDataSource ID="fees_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="Select_fees_codes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<asp:SqlDataSource ID="students_scholarship_fees_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    DeleteCommand="Delete_students_scholarship_fees" DeleteCommandType="StoredProcedure"
    InsertCommand="Insert_students_scholarship_fees" InsertCommandType="StoredProcedure"
    SelectCommand="Select_students_scholarship_fees" SelectCommandType="StoredProcedure"
    UpdateCommand="Update_students_scholarship_fees" UpdateCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:QueryStringParameter Name="scholarship_id" QueryStringField="sid" Type="Int32" />
        <asp:Parameter Name="fees_type" Type="Int16" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter Name="scholarship_id" QueryStringField="sid" Type="Int32" />
        <asp:Parameter Name="fees_type" Type="Int16" />
        <asp:Parameter Name="fee_amount" Type="Decimal" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="scholarship_id" QueryStringField="sid" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:QueryStringParameter Name="scholarship_id" QueryStringField="sid" Type="Int32" />
        <asp:Parameter Name="fees_type" Type="Int16" />
        <asp:Parameter Name="fee_amount" Type="Decimal" />
    </UpdateParameters>
</asp:SqlDataSource>
