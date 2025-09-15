<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryAllocationV5.ascx.vb"
    Inherits="DirectAid.UCBeneficiaryAllocationV5" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>
<link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
<script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
<script type="text/javascript">

    document.onload = function () {
        instead_of_app_ser.SetEnabled(replacement.GetChecked());
        reasons.SetEnabled(replacement.GetChecked());
    }

    function Save_Begin() {
        //if (isLoaded) {
        if (ASPxClientEdit.ValidateGroup("Save")) {
            ASPxButton_Save.SetEnabled(false);
            ASPxLoadingPanel1.Show();
            ASPxCallback_Save.PerformCallback(null);
        }
        //}
        //else {
        //    alert("Loading ...");
        //}
    }

    function Save_End(e) {

        var result = e.result;

        if (!isNaN(result)) {
            alert("تم الحفظ");
            grd_donor_allocate.Refresh();
        }
        else {
            alert(result);
        }

        ASPxButton_Save.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function Save_Error(e) {
        alert(e.message);
        ASPxButton_Save.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function Source_EndCallback(s, e) {
        if (s.cpIsDELETEROW) {
            s.cpIsDELETEROW = false;
            alert("تم الحفظ");
            grd_donor_allocate.Refresh();
        }
    }

</script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<table cellpadding="0" cellspacing="0" width="100%" align="center" dir="rtl">
    <tr>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>

        <td align="center" style="width: 16%;">&nbsp;</td>

        <td align="center" style="width: 16%;">&nbsp;</td>

    </tr>
    <tr>
        <td align="center" style="width: 16%;">
            <asp:Label ID="Label227" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="نوع المستفيد"
                Width="100%"></asp:Label>
        </td>
        <td align="center" style="width: 16%;">
            <dx:ASPxComboBox runat="server" ValueType="System.Byte" DataSourceID="ObjectDataSource_app_type" TextField="NameAr" ValueField="ID" Width="100%" ID="app_type" ReadOnly="True" Enabled="False">
                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    <RequiredField IsRequired="True" ErrorText=""></RequiredField>
                </ValidationSettings>
            </dx:ASPxComboBox>

        </td>
        <td align="center" style="width: 16%;">
            <asp:Label ID="Label11" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="رقم المستفيد"
                Width="100%"></asp:Label>
        </td>
        <td align="center" style="width: 16%;">
            <dx:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ClientInstanceName="app_ser" EnableClientSideAPI="True" ID="app_ser"></dx:ASPxTextBox>

        </td>
        <td align="center" style="width: 16%;">
            <asp:Label ID="Label226" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                Text="الأسم" Width="100%"></asp:Label>
        </td>
        <td align="center" style="width: 16%;">
            <dx:ASPxTextBox runat="server" Width="100%" ReadOnly="True" ClientInstanceName="app_ser" EnableClientSideAPI="True" ID="applicant_name_ar"></dx:ASPxTextBox>

        </td>

        <td align="center" style="width: 16%;">&nbsp;</td>

    </tr>
    <tr>
        <td align="center" style="width: 16%;">
            <asp:Label ID="Label194" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                Text="التاريخ" Width="100%"></asp:Label>
        </td>
        <td align="center" style="width: 16%;">
            <dx:ASPxDateEdit ID="tran_date" runat="server" DisplayFormatString="dd/MM/yyyy"
                EditFormat="Custom" Height="16px" Width="206px">
            </dx:ASPxDateEdit>

        </td>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>

        <td align="center" style="width: 16%;">&nbsp;</td>

    </tr>
    <tr>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">
            <dx:ASPxCheckBox ID="replacement" runat="server" CheckState="Unchecked" Text="استبدال"
                Width="100%" ClientInstanceName="replacement" EnableClientSideAPI="True">
                <ClientSideEvents ValueChanged="function(s, e) {

}"
                    CheckedChanged="function(s, e) {
		instead_of_app_ser.SetEnabled(replacement.GetChecked());
	reasons.SetEnabled(replacement.GetChecked());
}" />
            </dx:ASPxCheckBox>

        </td>
        <td align="center" style="width: 16%;">
            <asp:Label ID="Label_instead_of_app_ser" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="رقم المستفيد المراد استبداله"
                Width="100%"></asp:Label>
        </td>
        <td align="center" style="width: 16%;">
            <dx:ASPxTextBox runat="server" Width="100%" ClientInstanceName="instead_of_app_ser" EnableClientSideAPI="True" ID="instead_of_app_ser" ClientEnabled="False">
                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxTextBox>

        </td>
        <td align="center" style="width: 16%;">
            <asp:Label ID="Label_reasons" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="سبب الاستبدال"
                Width="100%"></asp:Label>
        </td>
        <td align="center" style="width: 16%;">
            <dx:ASPxComboBox runat="server" ValueType="System.Int16" DataSourceID="EntityDataSource_reasons" TextField="reason_ar" ValueField="reason_code" Width="100%" ID="reasons" ClientInstanceName="reasons" EnableClientSideAPI="True" ClientEnabled="False">
                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxComboBox>

        </td>

        <td align="center" style="width: 16%;">&nbsp;</td>

    </tr>
    <tr>
        <td align="center" style="width: 16%;">
            <asp:Label ID="Label195" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                Text="ملاحظات" Width="100%"></asp:Label>
        </td>
        <td align="center" colspan="5">
            <dx:ASPxMemo runat="server" Width="100%" ID="notes">
            </dx:ASPxMemo>
        </td>

        <td align="center" style="width: 16%;">&nbsp;</td>

    </tr>
</table>

<%--<dx:ASPxGridView ID="grd_donor_allocate0" runat="server" AutoGenerateColumns="False"
    DataSourceID="LinqServerModeDataSource1" KeyFieldName="src_num"
    Width="100%" RightToLeft="True">
    <Columns>
        <dx:GridViewDataTextColumn Caption="رقم المتبرع فى النظام السابق" FieldName="donor_prev_id"
            VisibleIndex="2" Width="15%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="رقم المتبرع" FieldName="donor_id" ReadOnly="True" VisibleIndex="1" Width="15%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="المصدر" FieldName="src_fund" VisibleIndex="0" Width="10%">
            <PropertiesComboBox DataSourceID="ObjectDataSource_src_fund" TextField="NameAr" ValueField="ID" ValueType="System.Byte">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn Caption="الايصال" FieldName="src_num" VisibleIndex="9" Width="15%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="اسم المتبرع" FieldName="donor_namear" VisibleIndex="7" Width="30%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Donor" FieldName="donor_nameen" VisibleIndex="8" Visible="False" Width="30%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="القيمه" FieldName="src_value" VisibleIndex="10" Width="15%">
        </dx:GridViewDataTextColumn>
    </Columns>
    <Settings ShowFilterRow="True" />
</dx:ASPxGridView>--%><%--<asp:EntityDataSource ID="EntityDataSource_view_orphan_donor_source_all" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="view_orphan_donor_source_all">
</asp:EntityDataSource>--%><%--<cc1:LinqServerModeDataSource ID="LinqServerModeDataSource1" runat="server" ContextTypeName="DirectAid.charitysoftEntities"
        TableName="view_orphan_donor_source_all" />--%>
<dx:ASPxGridView ID="ASPxGridView_Source" runat="server" AutoGenerateColumns="False"
    DataSourceID="LinqServerModeDataSource1" KeyFieldName="id"
    Width="100%" RightToLeft="True" ClientInstanceName="ASPxGridView_Source" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
    <ClientSideEvents EndCallback="function(s, e) {
	Source_EndCallback(s, e);
}"
        BeginCallback="function(s, e) {
	        if (e.command == 'CUSTOMCALLBACK ')
            isCustomCallback = true;
}" />
    <TotalSummary>
        <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="src_value" ShowInColumn="القيمه" ShowInGroupFooterColumn="القيمه" SummaryType="Sum" ValueDisplayFormat="{0:n3}" />
        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="src_num" ShowInColumn="الايصال" ShowInGroupFooterColumn="الايصال" SummaryType="Count" ValueDisplayFormat="{0:n0}" />
    </TotalSummary>
    <Columns>
        <dx:GridViewDataComboBoxColumn Caption="المصدر" FieldName="src_fund" VisibleIndex="1" Width="10%">
            <PropertiesComboBox DataSourceID="ObjectDataSource_src_fund" TextField="NameAr" ValueField="ID" ValueType="System.Byte">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="donor_id_string" VisibleIndex="3" Caption="رقم الكافل" Width="10%">
            <Settings AutoFilterCondition="Contains" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="donor_namear" VisibleIndex="5" Caption="اسم الكافل" Width="25%">
            <Settings AutoFilterCondition="Contains" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="donor_nameen" VisibleIndex="6" Visible="False" Width="25%">
            <Settings AutoFilterCondition="Contains" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="src_num_string" VisibleIndex="8" Caption="رقم السند" Width="10%">
            <Settings AutoFilterCondition="Contains" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="src_value" VisibleIndex="10" Caption="القيمه" Width="10%">
            <Settings AutoFilterCondition="Contains" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="donor_prev_id" VisibleIndex="4" Caption="رقم الكافل السابق" Width="10%">
            <Settings AutoFilterCondition="Contains" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="app_type" VisibleIndex="7" Visible="False">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="9" Visible="False">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="السنه" FieldName="THEYEAR" VisibleIndex="2" Width="5%">
            <Settings AutoFilterCondition="Contains" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewCommandColumn ButtonType="Button" VisibleIndex="0" Width="10%">
            <DeleteButton Visible="True" Text="تخصيص">
                <Image Url="~/Images/AddToLibrary_16x16.png">
                </Image>
            </DeleteButton>
            <ClearFilterButton Visible="True">
                <Image Url="~/Images/Undo_16x16.png">
                </Image>
            </ClearFilterButton>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewCommandColumn>
    </Columns>
    <SettingsBehavior AutoFilterRowInputDelay="30000" ConfirmDelete="True" />
    <Settings ShowFilterRow="True" ShowFooter="True" />
    <SettingsText ConfirmDelete="هل تريد الحفظ؟" />
</dx:ASPxGridView>
<dx:ASPxGridView ID="grd_donor_allocate" runat="server" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource1" KeyFieldName="tran_code"
    Width="100%" RightToLeft="True" ClientInstanceName="grd_donor_allocate" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
    <Columns>
        <dx:GridViewDataTextColumn Caption="م" FieldName="tran_code" ReadOnly="True"
            VisibleIndex="0" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ العمليه" FieldName="tran_date" VisibleIndex="6" Width="10%">
            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="المصدر" FieldName="src_fund" VisibleIndex="9" Width="10%">
            <PropertiesComboBox DataSourceID="ObjectDataSource_src_fund" TextField="NameAr" ValueField="ID" ValueType="System.Byte">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn Caption="الايصال" FieldName="src_num" VisibleIndex="13" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="رقم الكافل" FieldName="donor_id" VisibleIndex="10" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الكافل" FieldName="donor_namear" VisibleIndex="11" Width="20%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Donor" FieldName="donor_nameen" VisibleIndex="12" Visible="False" Width="20%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="السبب" FieldName="reason_ar" VisibleIndex="7" Width="20%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="reason_en" Visible="False" VisibleIndex="8" Width="15%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="نوع العمليه" FieldName="allocate_descr_ar" VisibleIndex="1" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Type" FieldName="allocate_descr_en" Visible="False" VisibleIndex="5" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الموظف" FieldName="userid" VisibleIndex="15" Width="10%">
        </dx:GridViewDataTextColumn>
    </Columns>
    <Settings ShowFilterRow="True" />
</dx:ASPxGridView>
<asp:EntityDataSource ID="EntityDataSource_view_donor_allocate_tab" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="view_donor_allocate_tab" EntityTypeFilter="view_donor_allocate_tab" AutoGenerateWhereClause="True" Where="">
    <WhereParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="app_ser" QueryStringField="OrphanID" DbType="Int32" />
    </WhereParameters>
</asp:EntityDataSource>


<asp:ObjectDataSource ID="ObjectDataSource_app_type" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Load" TypeName="DirectAid.BeneficiaryType"></asp:ObjectDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [view_donor_allocate_tab] WHERE ([app_ser] = @app_ser) ORDER BY [tran_date]">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0"  Name="app_ser" QueryStringField="OrphanID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_src_fund" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Load" TypeName="DirectAid.FundSource"></asp:ObjectDataSource>




<%--    <WhereParameters>
        <asp:Parameter DefaultValue="2" Name="reason_cat" Type="Byte" />
    </WhereParameters>--%>

<%--    <WhereParameters>
        <asp:Parameter DefaultValue="2" Name="reason_cat" Type="Byte" />
    </WhereParameters>--%>








<cc1:LinqServerModeDataSource ID="LinqServerModeDataSource1" runat="server" ContextTypeName="DirectAid.Database"
    TableName="view_beneficiary_donor_source_all" EnableDelete="True" />










<asp:EntityDataSource ID="EntityDataSource_reasons" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="reason_tab" Where="" AutoGenerateWhereClause="True">
    <WhereParameters>
        <asp:Parameter DefaultValue="0" Name="reason_cat" Type="Byte" />
    </WhereParameters>
</asp:EntityDataSource>












