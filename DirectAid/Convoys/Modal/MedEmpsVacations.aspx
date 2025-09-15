<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MedEmpsVacations.aspx.vb" Inherits="DirectAid.MedEmpsVacations" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <dx:ASPxGridView ID="grd_ConvoysList" runat="server" Width="100%"
            AutoGenerateColumns="False"
            KeyFieldName="ID" ClientInstanceName="grid" RightToLeft="True" DataSourceID="DS_emps_vacation">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <EditButton Visible="True">
                    </EditButton>
                    <NewButton Visible="True">
                    </NewButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataDateColumn Caption="بداية الاجازة" FieldName="vac_start_date" VisibleIndex="1">
                    <PropertiesDateEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="نهاية الاجازة" FieldName="vac_end_date" VisibleIndex="2">
                    <PropertiesDateEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn VisibleIndex="4" Visible="False" FieldName="ID">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn Caption="ملاحظات" VisibleIndex="5" FieldName="notes">
                </dx:GridViewDataMemoColumn>

                <dx:GridViewDataTextColumn Caption="عدد الايام" VisibleIndex="3" FieldName="num_of_days" ReadOnly="True">
                    <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsEditing EditFormColumnCount="3" />
            <Settings ShowFilterRow="True" />
            <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل"
                CommandNew="جديد" CommandUpdate="حفظ" />
        </dx:ASPxGridView>
    </div>
        <asp:SqlDataSource ID="DS_emps_vacation" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" InsertCommand="Insert_health_emps_vacations" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [health_emps_vacations] WHERE ([emp_id] = @emp_id)" UpdateCommand="Update_health_emps_vacations" UpdateCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                <asp:QueryStringParameter Name="emp_id" QueryStringField="app_ser" Type="Int32" />
                <asp:Parameter DbType="Date" Name="vac_start_date" />
                <asp:Parameter DbType="Date" Name="vac_end_date" />
                <asp:Parameter Name="notes" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="emp_id" QueryStringField="app_ser" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                <asp:Parameter Name="ID" Type="Int32" />
                <asp:Parameter DbType="Date" Name="vac_start_date" />
                <asp:Parameter DbType="Date" Name="vac_end_date" />
                <asp:Parameter Name="notes" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
