<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryListV1.ascx.vb"
    Inherits="DirectAid.UCBeneficiaryListV1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx1" %>


<% If DesignMode Then%>
<script src="Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<script type="text/javascript">

    function OpenRecord(recordID) {

        var url = 'Beneficiary.aspx?app_ser=' + recordID;
        //document.location.href = url;
        window.open(url, '_blank');
    }

    function CustomButtonClick(e) {

        var gridName = "ASPxGridView1";
        var index = e.visibleIndex;
        var key = ASPxClientGridView.Cast("ASPxGridView1").GetRowKey(index);
        OpenRecord(key);
    }

    function Print_Begin(printTypeID) {
        ASPxButton_Print.SetEnabled(false);
        ASPxLoadingPanel1.Show();
        ASPxCallback_Print.PerformCallback(printTypeID);
    }

    function Print_End(e) {

        var result = e.result;

        if (result == "OK") {
            window.open("ReportViewer.aspx?popup=1", "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600");
        }
        else {
            alert(result);
        }

        ASPxButton_Print.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function Print_Error(e) {
        alert(e.message);
        ASPxButton_Print.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function ButtonEditClickByEnter(s, e) {
        if (e.htmlEvent.keyCode == 13) {
            ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
            s.GetButton(0).click();
        }
    }

</script>
<table align="center" width="100%">
    <tbody>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="الحاله" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxComboBox ID="ASPxComboBox_ListType" runat="server"
                    ValueType="System.Byte" AutoPostBack="True" Width="100%"
                    meta:resourcekey="ASPxComboBox_ListTypeResource1" DataSourceID="ObjectDataSource_Status" TextField="NameAr" ValueField="ID">
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="التخصيص" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxComboBox ID="ASPxComboBox_Allocation" runat="server"
                    ValueType="System.Byte" AutoPostBack="True" Width="100%"
 TextField="NameAr" ValueField="ID" SelectedIndex="0"  >
                    <Items>
                        <dx:ListEditItem Selected="True" Text="الكل" Value="0" />
                        <dx:ListEditItem Text="مخصص" Value="1" />
                        <dx:ListEditItem Text="غير مخصص" Value="2" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButton ID="ASPxButton_AllocationLetter" runat="server" Text="خطاب التخصيص" Width="100%" UseSubmitBehavior="False"
                    AutoPostBack="False" ClientInstanceName="ASPxButton_AllocationLetter" EnableClientSideAPI="True"
                    Font-Bold="True" Visible="False">
                    <ClientSideEvents Click="function(s, e) {
	Print_Begin(12);
}" />
                    <Image Url="~/Images/Print_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxButtonEdit ID="ASPxButton_Print" runat="server" Width="100%" UseSubmitBehavior="False" ClientInstanceName="ASPxButton_Print" EnableClientSideAPI="True"
                    Font-Bold="True">
                    <ClientSideEvents ButtonClick="function(s, e) {
	Print_Begin(11);
}"
                        KeyPress="function(s, e) {
	ButtonEditClickByEnter(s, e);
}" />
                    <MaskSettings Mask="&lt;1900..3000&gt;" />
                    <Buttons>
                        <dx:EditButton Text="التقرير السنوى لعام" Position="Left">
                            <Image Url="~/Images/Print_32x32.png">
                            </Image>
                        </dx:EditButton>
                    </Buttons>
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    </ValidationSettings>
                </dx:ASPxButtonEdit>
            </td>
            <td align="center" style="width: 4%;"></td>
        </tr>
    </tbody>
</table>
<table align="center" width="100%">
    <tbody>
        <tr>
            <td align="center" style="width: 100%;">

                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqServerModeDataSource1"
                    KeyFieldName="app_ser_string" Width="100%" ClientInstanceName="ASPxGridView1" meta:resourcekey="ASPxGridView1Resource1" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
                    <ClientSideEvents CustomButtonClick="function(s, e) {
	CustomButtonClick(e);
}" />
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="الاجمالى = {0:n0}" FieldName="app_ser"
                            ShowInColumn="الرقم" ShowInGroupFooterColumn="الرقم" SummaryType="Count"
                            ValueDisplayFormat="{0:n0}" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image"
                            Width="5%" ShowSelectCheckbox="True">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            <HeaderTemplate>
                                <dx:ASPxCheckBox ID="SelectAllCheckBox" runat="server" ToolTip="Select/Unselect all rows on the page"
                                    ClientSideEvents-CheckedChanged="function(s, e) { ASPxGridView1.SelectAllRowsOnPage(s.GetChecked()); }" />
                            </HeaderTemplate>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image"
                            Width="5%">
                            <ClearFilterButton Visible="True">
                                <Image Url="~/Images/Cancel_32x32.png">
                                </Image>
                            </ClearFilterButton>
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton>
                                    <Image Url="~/Images/Edit_32x32.png">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="الرقم" FieldName="app_ser_string"
                            VisibleIndex="3" Width="5%">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            <FooterCellStyle HorizontalAlign="Center">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="الاسم بالعربيه" FieldName="applicant_name_ar"
                            VisibleIndex="4" Width="20%" Visible="false">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="الاسم بالانجليزيه" FieldName="applicant_name_en"
                            VisibleIndex="5" Width="10%" Visible="false">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn Caption="الدولة" FieldName="country"
                            VisibleIndex="1" Width="10%">
                            <PropertiesComboBox CallbackPageSize="10" DataSourceID="SqlDataSource_Country"
                                EnableCallbackMode="True" EnableClientSideAPI="True"
                                IncrementalFilteringMode="Contains" TextField="nat_descrar"
                                ValueField="nat_code" ValueType="System.Int16">
                            </PropertiesComboBox>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn Caption="رقم النظام السابق" VisibleIndex="2" Width="10%" FieldName="legacy_num">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="رقم المتبرع-النظام السابق" FieldName="donor_prev_id"
                            VisibleIndex="6" Width="10%">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            <FooterCellStyle HorizontalAlign="Center">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>


                        <dx:GridViewDataTextColumn Caption="رقم المتبرع" FieldName="donor_id_string"
                            VisibleIndex="7" Width="10%">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            <FooterCellStyle HorizontalAlign="Center">
                            </FooterCellStyle>
                            <DataItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("../UIDonorProfileView.aspx?DonorID={0}", Eval("donor_id"))%>'
                                    Text='<%# Bind("donor_id")%>' Target="_blank"></asp:HyperLink>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn Caption="اسم المتبرع" FieldName="donor_namear"
                            VisibleIndex="8" Width="15%" Visible="false">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Donor Name" FieldName="donor_nameen"
                            VisibleIndex="9" Width="15%" Visible="false">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="تاريخ التخصيص" FieldName="allocation_date" VisibleIndex="10" Width="10%">
                            <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd">
                            </PropertiesDateEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataDateColumn>
                    </Columns>
                    <SettingsBehavior AutoFilterRowInputDelay="10000" />
                    <Settings ShowFilterRow="True" ShowFooter="True" />
                </dx:ASPxGridView>
            </td>
        </tr>
    </tbody>
</table>
<cc1:LinqServerModeDataSource ID="LinqServerModeDataSource1" runat="server" ContextTypeName="DirectAid.charitysoftEntities"
    TableName="view_beneficiary_list" />
<asp:SqlDataSource ID="SqlDataSource_Country" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_Status" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Load" TypeName="DirectAid.OrphanRequestStatus"></asp:ObjectDataSource>
<dx:ASPxCallback ID="ASPxCallback_Print" runat="server"
    ClientInstanceName="ASPxCallback_Print">
    <ClientSideEvents CallbackComplete="function(s, e) {
	Print_End(e);
}"
        CallbackError="function(s, e) {
	Print_Error(e);
}" />
</dx:ASPxCallback>
<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
    Modal="True" Font-Bold="True">
</dx:ASPxLoadingPanel>

