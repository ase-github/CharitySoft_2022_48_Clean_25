<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MedInstituteComponents.aspx.vb" Inherits="DirectAid.MedInstituteComponents" %>

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
        KeyFieldName="Component_ID" ClientInstanceName="grid" RightToLeft="True" DataSourceID="DS_Components">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="الكود" VisibleIndex="5" Visible="False" FieldName="Component_ID">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="البيان" VisibleIndex="1" FieldName="decalration">
                <PropertiesComboBox DataSourceID="DS_decalrations_master" IncrementalFilteringMode="Contains" TextField="decalration_name_ar" ValueField="ID">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="المكونات و التجهيزات" VisibleIndex="2" FieldName="component">
                <PropertiesComboBox DataSourceID="DS_components_master" IncrementalFilteringMode="Contains" TextField="component_name_ar" ValueField="ID">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="التفاصيل" VisibleIndex="3" FieldName="description">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn Caption="ملاحظات" VisibleIndex="4" FieldName="notes" Visible="False">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataMemoColumn>
            
        </Columns>
        <SettingsEditing EditFormColumnCount="3" />
        <Settings ShowFilterRow="True" />
        <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل"
            CommandNew="جديد" CommandUpdate="حفظ" />
    </dx:ASPxGridView>
    
        <asp:SqlDataSource ID="DS_Components" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" InsertCommand="Insert_health_components_preparation" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [health_components_preparation] WHERE ([inst_ID] = @inst_ID)" UpdateCommand="Update_health_components_preparation" UpdateCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                <asp:QueryStringParameter Name="inst_ID" QueryStringField="app_ser" Type="Int32" />
                <asp:Parameter Name="decalration" Type="Int16" />
                <asp:Parameter Name="component" Type="Int32" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="notes" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="inst_ID" QueryStringField="app_ser" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                <asp:Parameter Name="Component_ID" Type="Int32" />
                <asp:Parameter Name="decalration" Type="Int16" />
                <asp:Parameter Name="component" Type="Int32" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="notes" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DS_decalrations_master" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [health_declarations_master]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DS_components_master" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [health_components_preparation_master]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
