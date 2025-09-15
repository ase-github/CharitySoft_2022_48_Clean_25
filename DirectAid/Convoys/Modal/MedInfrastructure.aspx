<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MedInfrastructure.aspx.vb" Inherits="DirectAid.MedInfrastructure" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            width: 100%;
        }
        .auto-style2
        {
            text-align: center;
        }
        .auto-style3
        {
            width: 102px;
        }
        .auto-style4
        {
            width: 189px;
        }
        .auto-style5
        {
            width: 111px;
        }
    .dxpControl
{
	font: 12px Tahoma, Geneva, sans-serif;
	color: black;
}
.dxpSummary
{
	white-space: nowrap;
	text-align: center;
	vertical-align: middle;
	padding: 1px 4px 0px;
}
.dxpDisabled
{
	color: #acacac;
	border-color: #808080;
	cursor: default;
}
.dxpDisabledButton
{
	text-decoration: none;
}
.dxpButton
{
	color: #394EA2;
	text-decoration: underline;
	white-space: nowrap;
	text-align: center;
	vertical-align: middle;
}
.dxpCurrentPageNumber
{
	font-weight: bold;
	text-decoration: none;
	padding: 1px 3px 0px;
	white-space: nowrap;
}
.dxpPageNumber
{
	color: #394EA2;
	text-decoration: underline;
	text-align: center;
	vertical-align: middle;
	padding: 1px 5px 0px;
}
        .auto-style6
        {
            padding: 5px 2px;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
    <div style="direction:rtl">
    <table class="auto-style1" style="border:2px solid #ccc">
        <tr>
            <td class="auto-style2"><h2>البنية التحتية الاساسية</h2>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
    <dx:ASPxGridView ID="grd_ConvoysList" runat="server" Width="100%"
        AutoGenerateColumns="False"
        KeyFieldName="inst_ID" ClientInstanceName="grid" DataSourceID="DS_institution_details" Font-Size="Medium">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataMemoColumn Caption="ملاحظات" VisibleIndex="38" Visible="False" FieldName="details_notes">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataMemoColumn>
            
            <dx:GridViewDataTextColumn FieldName="inst_ID" Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="الكمبيوتر" VisibleIndex="32" FieldName="computer">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn Caption="الاتصال بالانترنت" VisibleIndex="31" FieldName="internet">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="وسائل الاتصال" VisibleIndex="30" FieldName="communication">
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataComboBoxColumn Caption="مصدر الكهرباء" VisibleIndex="33" FieldName="electricity_source">
                <PropertiesComboBox DataSourceID="DS_power_source" IncrementalFilteringMode="Contains" TextField="name_ar" ValueField="ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="مياه الشرب" VisibleIndex="34" FieldName="water">
            </dx:GridViewDataTextColumn>
            
        </Columns>
        <SettingsEditing EditFormColumnCount="3" />
        <Settings ShowFilterRow="True" />
        <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل"
            CommandNew="جديد" CommandUpdate="حفظ" />
    </dx:ASPxGridView>
            </td>
        </tr>
        </table>
    </div>
        <asp:SqlDataSource ID="DS_institution_details" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [health_medical_institutions] WHERE ([inst_ID] = @inst_ID)" UpdateCommand="Update_health_medical_institutions_details" UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="inst_ID" QueryStringField="app_ser" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                <asp:QueryStringParameter Name="inst_ID" QueryStringField="app_ser" Type="Int32" />
                <asp:Parameter Name="water" Type="String" />
                <asp:Parameter Name="communication" Type="String" />
                <asp:Parameter Name="internet" Type="String" />
                <asp:Parameter Name="computer" Type="String" />
                <asp:Parameter Name="electricity_source" Type="Int16" />
                <asp:Parameter Name="details_notes" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DS_power_source" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [health_institution_power_source_master]"></asp:SqlDataSource>
    </form>
</body>
</html>
