<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCScholarshipTransfersV1.ascx.vb" Inherits="DirectAid.UCScholarshipTransfersV1" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>







<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>



<div>

    <dx:ASPxGridView runat="server" KeyFieldName="scholarship_id;transfer_ser" AutoGenerateColumns="False" DataSourceID="stud_schlrshp_paymnt_DS" Theme="Default" Width="100%" Font-Size="Medium" ForeColor="#000066" ID="ASPxGridView3" EnableTheming="True">
        <TotalSummary>
            <dx:ASPxSummaryItem SummaryType="Custom" FieldName="transfer_amount" DisplayFormat="مجموع التحويلات:{0:n3}" ShowInColumn="المبلغ المحول"></dx:ASPxSummaryItem>
        </TotalSummary>
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True" Text="تعديل"></EditButton>

                <NewButton Visible="True" Text="جديد"></NewButton>

                <DeleteButton Visible="True" Text="الغاء"></DeleteButton>

                <ClearFilterButton Text="مسح"></ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="scholarship_id" ReadOnly="True" Visible="False" VisibleIndex="1"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="transfer_ser" ReadOnly="True" Visible="False" VisibleIndex="2"></dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="transfer_amount" Caption="المبلغ المحول" VisibleIndex="3">
                <PropertiesTextEdit MaxLength="15" Width="100px" EnableClientSideAPI="True">
                    <ValidationSettings>
                        <RegularExpression ValidationExpression="^(?=.*\d)\d*(?:\.\d{0,3})?$" ErrorText="برجاء ادخال مبلغ صحيح" />
                        <RequiredField IsRequired="True"></RequiredField>
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="transfer_date" Caption="تاريخ التحويل" VisibleIndex="4">
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy" EditFormatString="dd-MM-yyyy">
                    <ValidationSettings>
                        <RequiredField IsRequired="True"></RequiredField>
                    </ValidationSettings>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="transfer_recieve_date" Caption="تاريخ الاستلام" VisibleIndex="7">
                <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormatString="yyyy-MM-dd"></PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn FieldName="transfer_bank" Caption="البنك" VisibleIndex="8">
                <PropertiesComboBox DataSourceID="bank_codes_DS" TextField="bank_ar_name" ValueField="bank_code" ValueType="System.Int64" Width="100px"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="transfer_acc_num" Caption="رقم الحساب" VisibleIndex="9">
                <PropertiesTextEdit MaxLength="50" Width="100px"></PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="transfer_method" Caption="طريقة التحويل" VisibleIndex="5">
                <PropertiesComboBox DataSourceID="pay_method_DS" TextField="pay_method_ar" ValueField="pay_method_id" ValueType="System.Int64" Width="100px">
                    <ValidationSettings>
                        <RequiredField IsRequired="True"></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="transfer_status" Caption="حالة التحويل" VisibleIndex="6">
                <PropertiesComboBox ValueType="System.Int16">
                    <Items>
                        <dx:ListEditItem Text="انتظار" Value="1"></dx:ListEditItem>
                        <dx:ListEditItem Text="تم التحويل الي المالية" Value="2"></dx:ListEditItem>
                        <dx:ListEditItem Text="لم يحول" Value="3"></dx:ListEditItem>
                        <dx:ListEditItem Text="تم التحويل و الاستلام" Value="4" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataMemoColumn FieldName="transfer_bank_address" Caption="عنوان البنك" VisibleIndex="10">
                <PropertiesMemoEdit Width="150px"></PropertiesMemoEdit>
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataMemoColumn FieldName="transfer_notes" Caption="ملاحظات التحويل" VisibleIndex="11">
                <PropertiesMemoEdit Width="300px">
                    <Style Wrap="True"></Style>
                </PropertiesMemoEdit>

                <EditCellStyle Wrap="True"></EditCellStyle>

                <FilterCellStyle Wrap="True"></FilterCellStyle>

                <EditFormCaptionStyle Wrap="True"></EditFormCaptionStyle>

                <HeaderStyle Wrap="True"></HeaderStyle>

                <CellStyle Wrap="True"></CellStyle>

                <FooterCellStyle Wrap="True"></FooterCellStyle>

                <GroupFooterCellStyle Wrap="True"></GroupFooterCellStyle>
            </dx:GridViewDataMemoColumn>
            <dx:GridViewDataTextColumn Caption="المالية" VisibleIndex="36" UnboundType="String">
            <EditFormSettings Visible="False" />
            <DataItemTemplate>
                <dx:ASPxButton ID="btn_Send_To_Finance" runat="server" Text='<%# IIf((Eval("transfer_status") = 1 Or Eval("transfer_status") = 3), "ارسال الي المالية", "تم الارسال الي المالية")%>' OnCommand="btn_Send_To_Finance_Command" CommandName="transferID" CommandArgument='<%# Eval("transfer_ser")%>'
                    Enabled='<%# IIf((Eval("transfer_status") = 1 Or Eval("transfer_status") = 3), True, False)%>'>
                </dx:ASPxButton>
            </DataItemTemplate>
        </dx:GridViewDataTextColumn>
        </Columns>

        <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True"></SettingsBehavior>

        <SettingsPager PageSize="4">
            <PageSizeItemSettings ShowAllItem="True" Items="5, 10, 20, 50, 100, 200" Caption="عدد الصفحات : " Visible="True"></PageSizeItemSettings>
        </SettingsPager>

        <SettingsEditing EditFormColumnCount="3"></SettingsEditing>

        <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True" ShowFooter="True"></Settings>

        <SettingsText CommandCancel="الغاء" CommandUpdate="حفظ" CommandDelete="ازالة" CommandNew="جديد" EmptyDataRow="لا توجد بيانات"></SettingsText>

        <SettingsDetail AllowOnlyOneMasterRowExpanded="True"></SettingsDetail>
    </dx:ASPxGridView>

</div>
<asp:SqlDataSource ID="stud_schlrshp_paymnt_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    DeleteCommand="Delete_students_scholarship_payments" DeleteCommandType="StoredProcedure"
    InsertCommand="Insert_students_scholarship_payments" InsertCommandType="StoredProcedure"
    SelectCommand="Select_students_scholarship_payment" SelectCommandType="StoredProcedure"
    UpdateCommand="Update_students_scholarship_payments" UpdateCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:QueryStringParameter Name="scholarship_id" QueryStringField="sid" Type="Int32" />
        <asp:Parameter Name="transfer_ser" Type="Int16" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter Name="scholarship_id" QueryStringField="sid" Type="Int32" />
        <asp:Parameter Name="transfer_amount" Type="Decimal" />
        <asp:Parameter Name="transfer_date" Type="DateTime" />
        <asp:Parameter Name="transfer_recieve_date" Type="DateTime" />
        <asp:Parameter Name="transfer_bank" Type="Int16" />
        <asp:Parameter Name="transfer_acc_num" Type="String" />
        <asp:Parameter Name="transfer_method" Type="Int16" />
        <asp:Parameter Name="transfer_bank_address" Type="String" />
        <asp:Parameter Name="transfer_notes" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="scholarship_id" QueryStringField="sid" Type="Int32" />
        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:QueryStringParameter Name="scholarship_id" QueryStringField="sid" Type="Int32" />
        <asp:Parameter Name="transfer_ser" Type="Int16" />
        <asp:Parameter Name="transfer_amount" Type="Decimal" />
        <asp:Parameter Name="transfer_date" Type="DateTime" />
        <asp:Parameter Name="transfer_recieve_date" Type="DateTime" />
        <asp:Parameter Name="transfer_bank" Type="Int16" />
        <asp:Parameter Name="transfer_acc_num" Type="String" />
        <asp:Parameter Name="transfer_method" Type="Int16" />
        <asp:Parameter Name="transfer_bank_address" Type="String" />
        <asp:Parameter Name="transfer_notes" Type="String" />
        <asp:Parameter Name="transfer_status" Type="Byte" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="pay_method_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="Select_pay_methods" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
<asp:SqlDataSource ID="bank_codes_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="Select_banks_list" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
