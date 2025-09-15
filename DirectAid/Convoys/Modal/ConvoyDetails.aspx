<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ConvoyDetails.aspx.vb" Inherits="DirectAid.ConvoyDetails" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="direction:rtl">
    
      <dx:ASPxPageControl ID="grd_ConvoyObjectives" runat="server" ActiveTabIndex="0" Height="250px"
                        Width="100%">
                        <TabPages>
                            <dx:TabPage Text="أعضاء القافلة">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="grd_ConvoyMembers" runat="server" Width="100%"
                                            AutoGenerateColumns="False" DataSourceID="DS_convoy_members" KeyFieldName="member_id">
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                    <ClearFilterButton Visible="True">
                                                    </ClearFilterButton>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="الاسم - ع" ShowInCustomizationForm="True"
                                                    VisibleIndex="1" FieldName="member_name_ar" Width="350px">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="الاسم - E" ShowInCustomizationForm="True"
                                                    VisibleIndex="2" FieldName="member_name_en" Width="350px">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="الاعمال في القافلة"
                                                    ShowInCustomizationForm="True" VisibleIndex="4" FieldName="experience">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="member_id" FieldName="member_id" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="الوظيفة" FieldName="position_id" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    <PropertiesComboBox DataSourceID="job_tab_DS" IncrementalFilteringMode="StartsWith" TextField="job_descr_ar" ValueField="job_code">
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                            </Columns>
                                            <Settings ShowFilterRow="True" />
                                            <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل" CommandNew="جديد" CommandUpdate="حفظ" EmptyDataRow="لا توجد بيانات" />
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="job_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [job_codes]"></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="DS_convoy_members" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" DeleteCommand="Delete_convoy_members" DeleteCommandType="StoredProcedure" InsertCommand="Insert_convoy_members" InsertCommandType="StoredProcedure" SelectCommand="Select_convoy_members" SelectCommandType="StoredProcedure" UpdateCommand="Update_convoy_members" UpdateCommandType="StoredProcedure">
                                            <DeleteParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="member_id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="experience" Type="String" />
                                                <asp:Parameter Name="member_name_ar" Type="String" />
                                                <asp:Parameter Name="member_name_en" Type="String" />
                                                <asp:Parameter Name="position_id" Type="Int16" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="activity_id" Type="Int32" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="member_id" Type="Int32" />
                                                <asp:Parameter Name="position_id" Type="Int16" />
                                                <asp:Parameter Name="experience" Type="String" />
                                                <asp:Parameter Name="member_name_ar" Type="String" />
                                                <asp:Parameter Name="member_name_en" Type="String" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="أهداف القافلة">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="ASPxGridView3" runat="server" Width="100%"
                                            AutoGenerateColumns="False" DataSourceID="DS_convoy_objectives" KeyFieldName="objective_id">
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0"
                                                    Width="50px">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                    <ClearFilterButton Visible="True">
                                                    </ClearFilterButton>
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="الهدف" ShowInCustomizationForm="True"
                                                    VisibleIndex="2" FieldName="description">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="الكود" FieldName="objective_id" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <Settings ShowFilterRow="True" />
                                            <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل" CommandNew="جديد" CommandUpdate="حفظ" EmptyDataRow="لا توجد بيانات" />
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="DS_convoy_objectives" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" DeleteCommand="Delete_convoy_objectives" DeleteCommandType="StoredProcedure" InsertCommand="Insert_convoy_objectives" InsertCommandType="StoredProcedure" SelectCommand="select * from convoy_objectives
where convoy_id=@convoy_id" UpdateCommand="Update_convoy_objectives" UpdateCommandType="StoredProcedure">
                                            <DeleteParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="objective_id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="description" Type="String" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="objective_id" Type="Int32" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="description" Type="String" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="أنشطة دعوية مصاحبة للحملة">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl3" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="grd_ConvoyActivities" runat="server" Width="100%"
                                            AutoGenerateColumns="False" DataSourceID="DS_convoy_activities" KeyFieldName="activity_id">
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0"
                                                    Width="50px">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                    <ClearFilterButton Visible="True">
                                                    </ClearFilterButton>
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="ملاحظـــــــــات"
                                                    ShowInCustomizationForm="True" VisibleIndex="4" FieldName="activity_desc">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="النشاط" FieldName="activity_id" ShowInCustomizationForm="True" VisibleIndex="2" Width="250px">
                                                    <PropertiesComboBox DataSourceID="DS_convoy_activities_master" TextField="activity_desc_ar" ValueField="activity_id" ValueType="System.Int32" IncrementalFilteringMode="StartsWith">
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                            </Columns>
                                            <Settings ShowFilterRow="True" />
                                            <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل" CommandNew="جديد" CommandUpdate="حفظ" EmptyDataRow="لا توجد بيانات" />
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="DS_convoy_activities_master" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [convoy_activities_master]"></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="DS_convoy_activities" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" DeleteCommand="Delete_convoy_activities" DeleteCommandType="StoredProcedure" InsertCommand="Insert_convoy_activities" InsertCommandType="StoredProcedure" SelectCommand="select * from convoy_activities
where convoy_id=@convoy_id" UpdateCommand="Update_convoy_activities" UpdateCommandType="StoredProcedure">
                                            <DeleteParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="activity_id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="activity_desc" Type="String" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="activity_id" Type="Int32" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="activity_id" Type="Int32" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="activity_desc" Type="String" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="النتائج المحققة">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl4" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="grd_ConvoyResults" runat="server" Width="100%"
                                            AutoGenerateColumns="False" DataSourceID="DS_convoy_results" KeyFieldName="result_id">
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                    <ClearFilterButton Visible="True">
                                                    </ClearFilterButton>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="الكود" ShowInCustomizationForm="True"
                                                    VisibleIndex="1" FieldName="result_id" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="الفئة العمرية"
                                                    ShowInCustomizationForm="True" VisibleIndex="2" FieldName="age_level">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="رجال" ShowInCustomizationForm="True"
                                                    VisibleIndex="5" FieldName="male_count">
                                                    <PropertiesTextEdit MaxLength="4">
                                                        <ValidationSettings>
                                                            <RegularExpression ErrorText="برجاء ادخال ارقام فقط" ValidationExpression="^(?=.*\d)\d*(?:)?$" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="نوع المرض" FieldName="disease_id" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    <PropertiesComboBox DataSourceID="DS_convoy_disease" TextField="disease_des_ar" ValueField="disease_id" IncrementalFilteringMode="StartsWith">
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn Caption="نساء" ShowInCustomizationForm="True"
                                                    VisibleIndex="4" FieldName="female_count">
                                                    <PropertiesTextEdit MaxLength="4">
                                                        <ValidationSettings>
                                                            <RegularExpression ErrorText="برجاء ادخال ارقام فقط" ValidationExpression="^(?=.*\d)\d*(?:)?$" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="اطفال" ShowInCustomizationForm="True"
                                                    VisibleIndex="6" FieldName="children_count">
                                                    <PropertiesTextEdit MaxLength="4">
                                                        <ValidationSettings>
                                                            <RegularExpression ErrorText="برجاء ادخال ارقام فقط" ValidationExpression="^(?=.*\d)\d*(?:)?$" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <Settings ShowFilterRow="True" />
                                            <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل" CommandNew="جديد" CommandUpdate="حفظ" EmptyDataRow="لا توجد بيانات" />
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="DS_convoy_disease" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [convoy_Disease_master]"></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="DS_convoy_results" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" DeleteCommand="Delete_convoy_results" DeleteCommandType="StoredProcedure" InsertCommand="Insert_convoy_results" InsertCommandType="StoredProcedure" SelectCommand="select * from convoy_results
where convoy_id=@convoy_id" UpdateCommand="Update_convoy_results" UpdateCommandType="StoredProcedure">
                                            <DeleteParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="result_id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="age_level" Type="String" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="disease_id" Type="Int32" />
                                                <asp:Parameter Name="female_count" Type="Int32" />
                                                <asp:Parameter Name="male_count" Type="Int32" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                                <asp:Parameter Name="children_count" Type="Int32" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="result_id" Type="Int32" />
                                                <asp:Parameter Name="activity_id" Type="Int32" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="age_level" Type="String" />
                                                <asp:Parameter Name="disease_id" Type="Int32" />
                                                <asp:Parameter Name="female_count" Type="Int32" />
                                                <asp:Parameter Name="male_count" Type="Int32" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                                <asp:Parameter Name="children_count" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="العلاجات المتبعة">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl5" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="grd_ConvoyMedicament" runat="server" Width="100%"
                                            AutoGenerateColumns="False" DataSourceID="DS_convoy_medecines" KeyFieldName="med_id">
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0"
                                                    Width="50px">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                    <ClearFilterButton Visible="True">
                                                    </ClearFilterButton>
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="العلاج المتبع" FieldName="med_id" ShowInCustomizationForm="True" VisibleIndex="1" Width="250px">
                                                    <PropertiesComboBox DataSourceID="DS_convoy_medicines_and_supplies" TextField="med_name_ar" ValueField="med_id">
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn Caption="ملاحظـــات"
                                                    ShowInCustomizationForm="True" VisibleIndex="2" FieldName="description">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <Settings ShowFilterRow="True" />
                                            <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل" CommandNew="جديد" CommandUpdate="حفظ" EmptyDataRow="لا توجد بيانات" />
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="DS_convoy_medicines_and_supplies" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [convoy_medicines_and_supplies_master]"></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="DS_convoy_medecines" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" DeleteCommand="Delete_convoy_medicines" DeleteCommandType="StoredProcedure" InsertCommand="Insert_convoy_medicines" InsertCommandType="StoredProcedure" SelectCommand="select * from convoy_medicines
where convoy_id=@convoy_id" UpdateCommand="Update_convoy_medicines" UpdateCommandType="StoredProcedure">
                                            <DeleteParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="med_id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="med_id" Type="Int32" />
                                                <asp:Parameter Name="description" Type="String" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="med_id" Type="Int32" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="description" Type="String" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="مصاريف القافلة">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl6" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="grd_ConvoyExpenses" runat="server" Width="100%"
                                            AutoGenerateColumns="False" DataSourceID="DS_convoy_expenses" KeyFieldName="exp_id">
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                    <ClearFilterButton Visible="True">
                                                    </ClearFilterButton>
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="قيمة المصروف"
                                                    ShowInCustomizationForm="True" VisibleIndex="2" FieldName="exp_amount">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings>
                                                            <RegularExpression ErrorText="برجاء ادخال ارقام فقط" ValidationExpression="^(?=.*\d)\d*(?:\.\d{0,3})?$" />
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="ملاحظات ع" ShowInCustomizationForm="True"
                                                    VisibleIndex="4" FieldName="exp_desc_ar" Width="25%">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="نوع المصروف" FieldName="exp_type" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    <PropertiesComboBox DataSourceID="DS_Expenses_Master" IncrementalFilteringMode="Contains" TextField="exp_name_ar" ValueField="exp_id">
                                                        <Items>
                                                            <dx:ListEditItem Text="نوع مصروف 1" Value="1" />
                                                            <dx:ListEditItem Text="نوع مصروف 2" Value="2" />
                                                        </Items>
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesComboBox>
                                                </dx:GridViewDataComboBoxColumn>
                                                <dx:GridViewDataTextColumn Caption="ملاحظات E" ShowInCustomizationForm="True"
                                                    VisibleIndex="5" FieldName="exp_desc_en" Width="25%">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataComboBoxColumn Caption="العملة" FieldName="currency_code" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                    <PropertiesComboBox DataSourceID="currency_tab_DS" TextField="currency_descrar" ValueField="currency_code">
                                                    </PropertiesComboBox>
                                                    <EditFormSettings Visible="True" />
                                                </dx:GridViewDataComboBoxColumn>
                                            </Columns>
                                            <SettingsEditing EditFormColumnCount="3" />
                                            <Settings ShowFilterRow="True" />
                                            <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل" CommandNew="جديد" CommandUpdate="حفظ" EmptyDataRow="لا توجد بيانات" />
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="DS_convoy_expenses" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" DeleteCommand="Delete_convoy_expenses" DeleteCommandType="StoredProcedure" InsertCommand="Insert_convoy_expenses" InsertCommandType="StoredProcedure" SelectCommand="select * from convoy_expenses
where convoy_id=@convoy_id" UpdateCommand="Update_convoy_expenses" UpdateCommandType="StoredProcedure">
                                            <DeleteParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="exp_id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="exp_amount" Type="Decimal" />
                                                <asp:Parameter Name="exp_desc_ar" Type="String" />
                                                <asp:Parameter Name="exp_desc_en" Type="String" />
                                                <asp:Parameter Name="exp_type" Type="Byte" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                                <asp:Parameter Name="currency_code" Type="Int16" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="exp_id" Type="Int32" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="exp_amount" Type="Decimal" />
                                                <asp:Parameter Name="exp_type" Type="Byte" />
                                                <asp:Parameter Name="exp_desc_ar" Type="String" />
                                                <asp:Parameter Name="exp_desc_en" Type="String" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                                <asp:Parameter Name="currency_code" Type="Int16" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="الايجابيات">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl7" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="grd_ConvoyAdvantages" runat="server" Width="100%"
                                            AutoGenerateColumns="False" DataSourceID="DS_convoy_advantages" KeyFieldName="adv_id">
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0"
                                                    Width="50px">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                    <ClearFilterButton Visible="True">
                                                    </ClearFilterButton>
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="الايجابيات ع" ShowInCustomizationForm="True"
                                                    VisibleIndex="1" FieldName="adv_desc_ar">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="الايجابيات E" FieldName="adv_desc_en" ShowInCustomizationForm="True" VisibleIndex="2">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="id" FieldName="adv_id" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <Settings ShowFilterRow="True" />
                                            <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل" CommandNew="جديد" CommandUpdate="حفظ" EmptyDataRow="لا توجد بيانات" />
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="DS_convoy_advantages" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" DeleteCommand="Delete_convoy_advantages" DeleteCommandType="StoredProcedure" InsertCommand="Insert_convoy_advantages" InsertCommandType="StoredProcedure" SelectCommand="select * from convoy_advantages
where convoy_id=@convoy_id" UpdateCommand="Update_convoy_advantages" UpdateCommandType="StoredProcedure">
                                            <DeleteParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="adv_id" Type="Int32" />
                                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="adv_desc_ar" Type="String" />
                                                <asp:Parameter Name="adv_desc_en" Type="String" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="adv_id" Type="Int32" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="adv_desc_ar" Type="String" />
                                                <asp:Parameter Name="adv_desc_en" Type="String" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="الاقتراحات">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl8" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="grd_ConvoySuggestions" runat="server" Width="100%"
                                            AutoGenerateColumns="False" DataSourceID="DS_convoy_suggestions" KeyFieldName="sug_id">
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0"
                                                    Width="50px">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                    <ClearFilterButton Visible="True">
                                                    </ClearFilterButton>
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="الاقتراحات ع" ShowInCustomizationForm="True"
                                                    VisibleIndex="1" FieldName="sug_desc_ar">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="id" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3" FieldName="sug_id">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="الاقتراحات E" ShowInCustomizationForm="True" VisibleIndex="2" FieldName="sug_desc_en">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <Settings ShowFilterRow="True" />
                                            <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل" CommandNew="جديد" CommandUpdate="حفظ" EmptyDataRow="لا توجد بيانات" />
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="DS_convoy_suggestions" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" DeleteCommand="Delete_convoy_suggestions" DeleteCommandType="StoredProcedure" InsertCommand="Insert_convoy_suggestions" InsertCommandType="StoredProcedure" SelectCommand="select * from convoy_suggestions
where convoy_id=@convoy_id" UpdateCommand="Update_convoy_suggestions" UpdateCommandType="StoredProcedure">
                                            <DeleteParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="sug_id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="sug_desc_ar" Type="String" />
                                                <asp:Parameter Name="sug_desc_en" Type="String" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="sug_id" Type="Int32" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="sug_desc_ar" Type="String" />
                                                <asp:Parameter Name="sug_desc_en" Type="String" />
                                                <asp:Parameter DbType="Date" Name="creation_date" />
                                                <asp:Parameter Name="user_name" Type="String" />
                                                <asp:Parameter Name="status" Type="Byte" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="رأي التخصصية">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl9" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxGridView ID="grd_ConvoySpecialists" runat="server" Width="100%"
                                            AutoGenerateColumns="False" DataSourceID="DS_specialists_decision" KeyFieldName="spec_ID">
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0"
                                                    Width="50px">
                                                    <EditButton Visible="True">
                                                    </EditButton>
                                                    <NewButton Visible="True">
                                                    </NewButton>
                                                    <DeleteButton Visible="True">
                                                    </DeleteButton>
                                                    <ClearFilterButton Visible="True">
                                                    </ClearFilterButton>
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn Caption="راي التخصصية"
                                                    ShowInCustomizationForm="True" VisibleIndex="1" FieldName="description">
                                                    <PropertiesTextEdit>
                                                        <ValidationSettings>
                                                            <RequiredField IsRequired="True" />
                                                        </ValidationSettings>
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle HorizontalAlign="Right" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="spec_ID" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <Settings ShowFilterRow="True" />
                                            <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل" CommandNew="جديد" CommandUpdate="حفظ" EmptyDataRow="لا توجد بيانات" />
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="DS_specialists_decision" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" DeleteCommand="Delete_convoys_specialists_decision" DeleteCommandType="StoredProcedure" InsertCommand="Insert_convoys_specialists_decision" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [convoys_specialists_decision] WHERE ([convoy_id] = @convoy_id)" UpdateCommand="Update_convoys_specialists_decision" UpdateCommandType="StoredProcedure">
                                            <DeleteParameters>
                                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="spec_id" Type="Int32" />
                                            </DeleteParameters>
                                            <InsertParameters>
                                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="description" Type="String" />
                                            </InsertParameters>
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                                <asp:Parameter Name="spec_ID" Type="Int32" />
                                                <asp:QueryStringParameter Name="convoy_id" QueryStringField="sid" Type="Int32" />
                                                <asp:Parameter Name="description" Type="String" />
                                            </UpdateParameters>
                                        </asp:SqlDataSource>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
    
        <asp:SqlDataSource ID="DS_Expenses_Master" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [convoy_expenses_master]"></asp:SqlDataSource>
    
        <asp:SqlDataSource ID="currency_tab_DS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
            SelectCommand="Select_currency_tab" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
