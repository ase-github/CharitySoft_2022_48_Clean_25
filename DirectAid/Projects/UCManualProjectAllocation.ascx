<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCManualProjectAllocation.ascx.vb"
    Inherits="DirectAid.UCManualProjectAllocation" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>

<%  If (DesignMode) Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<%  End If%>

<script type="text/javascript">

    var isWorking = false;

    function Save_Begin() {
        ASPxButton_Save.SetEnabled(false);
        ASPxLoadingPanel1.Show();
        ASPxCallback_Save.PerformCallback(null);
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
            ASPxGridView_Target.Refresh();
        }
    }

    function Target_EndCallback(s, e) {
        if (s.cpIsDELETEROW) {
            s.cpIsDELETEROW = false;
            ASPxGridView_Source.Refresh();
        }
    }

   </script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
    Modal="True" Font-Bold="True">
</dx:ASPxLoadingPanel>
<table cellpadding="0" cellspacing="0" width="100%" align="center" dir="rtl">
    <tr>
        <td align="center" style="width: 16%;">
            <asp:Label ID="Label227" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="المشروع"
                Width="100%"></asp:Label>
        </td>
        <td align="center" colspan="2">
            <dx:ASPxComboBox ID="project_id" runat="server" ValueType="System.Int32" ValueField="project_id"
                Width="100%" DataSourceID="SqlDataSource_RelatedProject" CallbackPageSize="5"
                EnableCallbackMode="True" TextField="project_name_ar" AutoPostBack="True" DropDownRows="5" EnableClientSideAPI="True" FilterMinLength="1" IncrementalFilteringMode="Contains">
                <ValidationSettings ErrorDisplayMode="None" ErrorText="" SetFocusOnError="True">
                    <RequiredField ErrorText="" IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxComboBox>

        </td>
        <td align="center" style="width: 4%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">
            <dx:ASPxButton ID="ASPxButton_Save" runat="server" Text="حفظ" Width="100%" UseSubmitBehavior="False"
                AutoPostBack="False" ClientInstanceName="ASPxButton_Save" EnableClientSideAPI="True"
                Font-Bold="True" ValidateInvisibleEditors="True" ValidationContainerID="ASPxPageControl1"
                ValidationGroup="Save" Visible="False">
                <ClientSideEvents Click="function(s, e) {
	Save_Begin();
}" />
                <Image Url="~/Images/Save_16x16.png">
                </Image>
            </dx:ASPxButton>
        </td>

    </tr>
    <tr>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 4%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>
        <td align="center" style="width: 16%;">&nbsp;</td>

        <td align="center" style="width: 16%;">
            <dx:ASPxCallback ID="ASPxCallback_Save" runat="server" ClientInstanceName="ASPxCallback_Save">
                <ClientSideEvents CallbackComplete="function(s, e) {
	Save_End(e);
}"
                    CallbackError="function(s, e) {
	Save_Error(e);
}" />
            </dx:ASPxCallback>
        </td>

    </tr>
</table>
<table align="center" width="100%" dir="rtl">
    <tr>
        <td align="center" valign="top" colspan="3">
            <dx:ASPxGridView ID="ASPxGridView_Source" runat="server" AutoGenerateColumns="False"
                DataSourceID="LinqServerModeDataSource1" KeyFieldName="id"
                Width="100%" RightToLeft="True" ClientInstanceName="ASPxGridView_Source">
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
                    <dx:GridViewDataTextColumn
                        VisibleIndex="1" Visible="False" FieldName="id">
                        <Settings AutoFilterCondition="Contains" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="رقم الاستقطاع" FieldName="standing_inst_num_string" VisibleIndex="4">
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="src_num_string" Caption="الايصال" VisibleIndex="5">
                        <Settings AutoFilterCondition="Contains"></Settings>
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                        <DataItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("../Collection.aspx?ReceiptID={0}", Eval("src_num_string"))%>'
                                Text='<%# Bind("src_num_string")%>' Target="_blank"></asp:HyperLink>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="الايصال اليدوى" FieldName="reciept_num_manual" VisibleIndex="8">
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="تاريخ الايصال" FieldName="reciept_date" VisibleIndex="7">
                        <PropertiesTextEdit DisplayFormatString="yyyy-MM-dd">
                        </PropertiesTextEdit>
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="القيمه" FieldName="src_value" VisibleIndex="6">
                        <Settings AutoFilterCondition="Contains" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="اسم المتبرع" FieldName="donor_namear" VisibleIndex="3">
                        <Settings AutoFilterCondition="Contains" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="رقم المتبرع للنظام السابق" FieldName="donor_prev_id" VisibleIndex="2">
                        <Settings AutoFilterCondition="Contains" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="رقم المتبرع" FieldName="donor_id_string" VisibleIndex="2">
                        <Settings AutoFilterCondition="Contains" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                        <DataItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("../UIDonorProfileView.aspx?DonorID={0}", Eval("donor_id"))%>'
                                Text='<%# Bind("donor_id")%>' Target="_blank"></asp:HyperLink>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0">
                        <DeleteButton Visible="True">
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
                    <dx:GridViewDataCheckColumn Caption="جزئى" FieldName="partial" VisibleIndex="9">
                        <PropertiesCheckEdit DisplayTextChecked="نعم" DisplayTextUnchecked="لا">
                        </PropertiesCheckEdit>
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn Caption="مخصص" FieldName="donor_nameen" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AutoFilterRowInputDelay="30000" ConfirmDelete="True" />
                <Settings ShowFilterRow="True" ShowFooter="True" />
                <SettingsText ConfirmDelete="هل تريد الاضافه؟" />
            </dx:ASPxGridView>
        </td>

    </tr>
    <tr>
        <td align="center" style="width: 48%;" valign="top">&nbsp;</td>
        <td align="center" style="width: 4%;">&nbsp;</td>
        <td align="center" style="width: 48%;" valign="top">&nbsp;</td>

    </tr>
    <tr>
        <td align="center" valign="top" colspan="3">
            <dx:ASPxGridView ID="ASPxGridView_Target" runat="server" AutoGenerateColumns="False"
                DataSourceID="SqlDataSource_view_project_donor_receipts" KeyFieldName="receipt_id"
                Width="100%" RightToLeft="True" ClientInstanceName="ASPxGridView_Target">
                <ClientSideEvents EndCallback="function(s, e) {
	Target_EndCallback(s, e);
}"
                    BeginCallback="function(s, e) {
	        if (e.command == 'CUSTOMCALLBACK ')
            isCustomCallback = true;
}" />
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="amount" ShowInColumn="القيمه" ShowInGroupFooterColumn="القيمه" SummaryType="Sum" ValueDisplayFormat="{0:n3}" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="receipt_id" ShowInColumn="الايصال" ShowInGroupFooterColumn="الايصال" SummaryType="Count" ValueDisplayFormat="{0:n0}" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0">
                        <DeleteButton Visible="True">
                            <Image Url="~/Images/Remove_16x16.png">
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
                    <dx:GridViewDataTextColumn Caption="الايصال"
                        VisibleIndex="13" FieldName="receipt_id">
                        <Settings AutoFilterCondition="Contains" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                        <DataItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("../Collection.aspx?ReceiptID={0}", Eval("receipt_id"))%>'
                                Text='<%# Bind("receipt_id")%>' Target="_blank"></asp:HyperLink>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="المتبرع" FieldName="donor_namear" VisibleIndex="12">
                        <Settings AutoFilterCondition="Contains" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="القيمه" FieldName="amount" VisibleIndex="15">
                        <Settings AutoFilterCondition="Contains" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="رقم المتبرع" FieldName="donor_id" VisibleIndex="10">
                        <Settings AutoFilterCondition="Contains" />
                        <HeaderStyle HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                        <DataItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("../UIDonorProfileView.aspx?DonorID={0}", Eval("donor_id"))%>'
                                Text='<%# Bind("donor_id")%>' Target="_blank"></asp:HyperLink>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewCommandColumn ButtonType="Button" VisibleIndex="17" Visible="False">
                        <ClearFilterButton Visible="True">
                        </ClearFilterButton>
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="DonorReport" Text="تقرير المتبرع">
                            </dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                </Columns>
                <SettingsBehavior AutoFilterRowInputDelay="30000" ConfirmDelete="True" />
                <Settings ShowFilterRow="True" ShowFooter="True" />
                <SettingsText ConfirmDelete="هل تريد الحذف؟" />
            </dx:ASPxGridView>
        </td>

    </tr>
</table>
<asp:SqlDataSource ID="SqlDataSource_view_project_donor_receipts" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    SelectCommand="SELECT * FROM [view_project_donor_receipts] WHERE ([project_id] = @project_id)" DeleteCommand="delete from project_donor_receipts where project_id is null">
    <SelectParameters>
        <asp:ControlParameter ControlID="project_id" Name="project_id" PropertyName="Value" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSourceMain" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    InsertCommand="benf_master_donor_Update" InsertCommandType="StoredProcedure">
    <InsertParameters>
        <asp:ControlParameter ControlID="app_ser" Name="app_ser" PropertyName="Text" Type="Int32" />
        <asp:ControlParameter ControlID="tran_type" Name="tran_type" PropertyName="Value" Type="Int16" />
        <asp:ControlParameter ControlID="donor_id" Name="donor_id" PropertyName="Value" Type="Int32" />
        <asp:ControlParameter ControlID="reasons" Name="reasons" PropertyName="Value" Type="Int16" />
        <asp:ControlParameter ControlID="notes" Name="notes" PropertyName="Text" Type="String" />
        <asp:ControlParameter ControlID="src_fund" Name="src_fund" PropertyName="Value" Type="Byte" />
        <asp:ControlParameter ControlID="src_num" Name="src_num" PropertyName="Value" Type="Int32" />
    </InsertParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource_RelatedProject" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT  project_id , CAST(project_id AS VARCHAR(10)) + ' - ' + ISNULL(project_name_ar, '') AS project_name_ar , CAST(project_id AS VARCHAR(10)) + ' - ' + ISNULL(project_name_en, '') AS project_name_en FROM [project]"></asp:SqlDataSource>
<cc1:LinqServerModeDataSource ID="LinqServerModeDataSource1" runat="server" ContextTypeName="DirectAid.charitysoftEntities"
    TableName="view_project_donor_source" EnableDelete="True" />

