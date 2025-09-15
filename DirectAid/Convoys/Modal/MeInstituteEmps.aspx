<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MeInstituteEmps.aspx.vb" Inherits="DirectAid.MeInstituteEmps" %>

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
            KeyFieldName="emp_ID" ClientInstanceName="grid" RightToLeft="True" DataSourceID="DS_health_inst_emps">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <NewButton Visible="True">
                    </NewButton>
                    <DeleteButton Visible="True">
                    </DeleteButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataComboBoxColumn Caption="الوظيفة" VisibleIndex="1" FieldName="emp_ID">
                    <PropertiesComboBox DataSourceID="DS_HR" IncrementalFilteringMode="Contains" TextField="emp_name_ar" ValueField="emp_ID">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Settings ShowFilterRow="True" />
            <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل"
                CommandNew="جديد" CommandUpdate="حفظ" />
        </dx:ASPxGridView>
    </div>
        <asp:SqlDataSource ID="DS_health_inst_emps" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" DeleteCommand="Delete_health_institution_employees" DeleteCommandType="StoredProcedure" InsertCommand="Insert_health_institution_employees" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [health_institution_employees] WHERE ([inst_ID] = @inst_ID)">
            <DeleteParameters>
                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                <asp:Parameter Name="emp_ID" Type="Int32" />
                <asp:QueryStringParameter Name="inst_ID" QueryStringField="app_ser" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                <asp:Parameter Name="emp_ID" Type="Int32" />
                <asp:QueryStringParameter Name="inst_ID" QueryStringField="app_ser" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="inst_ID" QueryStringField="app_ser" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="DS_HR" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="select emp_ID, cast(emp_ID as varchar)+' - '+emp_name_ar as emp_name_ar from health_employees" UpdateCommand="Update_health_employees" UpdateCommandType="StoredProcedure">
            <UpdateParameters>
                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                <asp:Parameter Name="emp_ID" Type="Int32" />
                <asp:Parameter Name="emp_name_ar" Type="String" />
                <asp:Parameter Name="emp_name_en" Type="String" />
                <asp:Parameter Name="position" Type="Int32" />
                <asp:Parameter Name="nat_code" Type="Int32" />
                <asp:Parameter Name="notes" Type="String" />
                <asp:Parameter Name="salary" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="joining_date" />
                <asp:Parameter DbType="Date" Name="retirement_date" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
