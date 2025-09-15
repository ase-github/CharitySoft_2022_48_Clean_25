<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="NewDonations.aspx.vb" Inherits="DirectAid.NewDonations" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>



<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>

<%--<!DOCTYPE html>--%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <script type="text/javascript">
      
        function OpenRecord(recordID) {

            document.location.href = 'Orphan.aspx?OrphanID=' + recordID;
        }

        function CustomButtonClick(e) {

            var gridName = "ASPxGridView1";
            var index = e.visibleIndex;
            var key = ASPxClientGridView.Cast("ASPxGridView1").GetRowKey(index);
            OpenRecord(key);

        }

        function Add_Begin() {
            ASPxButton_Add.SetEnabled(false);
            ASPxLoadingPanel1.Show();
            ASPxCallback_Add.PerformCallback(null);
        }

        function Add_End(e) {

            var result = e.result;

            if (result == "OK") {
                ASPxGridView_Source.Refresh();
                ASPxGridView_Target.Refresh();
            }
            else {
                alert(result);
            }

            ASPxButton_Add.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

        function Add_Error(e) {
            alert(e.message);
            ASPxButton_Add.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

        function Remove_Begin() {
            ASPxButton_Remove.SetEnabled(false);
            ASPxLoadingPanel1.Show();
            ASPxCallback_Remove.PerformCallback(null);
        }

        function Remove_End(e) {

            var result = e.result;

            if (result == "OK") {
                ASPxGridView_Source.Refresh();
                ASPxGridView_Target.Refresh();
            }
            else {
                alert(result);
            }

            ASPxButton_Remove.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

        function Remove_Error(e) {
            alert(e.message);
            ASPxButton_Remove.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

    </script>
     
    <table align="center" width="100%" cellpadding="5px">
        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxButton ID="ASPxButton_New" runat="server" Text="جديد" Width="100%" UseSubmitBehavior="False"
                    ClientInstanceName="ASPxButton_New" EnableClientSideAPI="True" Font-Bold="True">
                    <Image Url="~/Images/New_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" align="center" style="width: 15%;" width="16%">
                <dx:ASPxButton ID="ASPxButton_Save" runat="server" Text="حفظ" Width="100%" UseSubmitBehavior="False"
                    AutoPostBack="False" ClientInstanceName="ASPxButton_Save" EnableClientSideAPI="True"
                    Font-Bold="True" ValidateInvisibleEditors="True" ValidationContainerID="ASPxPageControl1"
                    ValidationGroup="Save" style="height: 43px">
                    <Image Url="~/Images/Save_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" align="center" colspan="3">
                <dx:ASPxComboBox ID="CmbSearchId" runat="server" DataSourceID="DsSearchID"
                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                    IncrementalFilteringMode="Contains" TextField="name" ValueField="donation_code"
                    ValueType="System.Int16" Height="40px" Width="100%">
                </dx:ASPxComboBox>
            </td>

            <td align="center" width="16%">
                <dx:ASPxButton ID="Btn_Search" runat="server" Height="25px" Text="بحث" Width="100%">
                    <Image Url="~/Images/Find_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" width="4%">
                &nbsp;</td>
        </tr>
        
        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDOnationCod" runat="server" Font-Bold="True" Text=" رقم التبرعات " Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" align="center" style="width: 15%;" width="16%">
                <dx:ASPxTextBox ID="txtdonCode" runat="server" AutoPostBack="True" Width="100%">
                </dx:ASPxTextBox>
            </td>
            <td align="center" align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDonationType" runat="server" Font-Bold="True" Text="  نوع التبرعات " Width="100%">
                </dx:ASPxLabel>
            </td>

            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxComboBox ID="cmbDonType" runat="server" DataSourceID="dontCateg"
                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                    IncrementalFilteringMode="Contains" TextField="donation_descrar" ValueField="donation_cat"
                    ValueType="System.Int16" Width="100%">
                </dx:ASPxComboBox>
            </td>
            <td align="center" width="16%">
                <dx:ASPxLabel ID="lblBasicValue0" runat="server" Font-Bold="True" Text="رقم الحساب" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" width="16%">
                <dx:ASPxComboBox ID="cmbAccNum" runat="server" DataSourceID="DsAccountNum" IncrementalFilteringMode="Contains" TextField="MAINACCOUNTID" ValueField="MAINACCOUNTID" Width="100%">
                    <Columns>
                        <dx:ListBoxColumn FieldName="MAINACCOUNTID" />
                    </Columns>

                </dx:ASPxComboBox>
            </td>
            <td align="center" width="4%">
                &nbsp;</td>
        </tr>
        
        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblArabicName" runat="server" Font-Bold="True" Text=" الغرض باللغة العربية " Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" align="center" colspan="3" width="16%">
                <dx:ASPxTextBox ID="txtDonArabicName" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDim7" runat="server" Font-Bold="True" Text="Dimension 1" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxComboBox ID="cmbDim1" runat="server" DataSourceID="Dsdim1" TextField="VALUE" ValueField="VALUE" Width="100%">
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 15%;" width="4%">
                &nbsp;</td>
        </tr>
        
        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblEngName" runat="server" Font-Bold="True" Text=" الغرض باللغه الإنجليزية " Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" align="center" colspan="3" width="16%">
                <dx:ASPxTextBox ID="TxtDOnEngName" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDim6" runat="server" Font-Bold="True" Text="Dimension 2" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxComboBox ID="cmbDim2" runat="server" DataSourceID="Dsdim2" TextField="VALUE" ValueField="VALUE" Width="100%">
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 15%;" width="4%">
                &nbsp;</td>
        </tr>
        
        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblBasicValue" runat="server" Font-Bold="True" Text="القيمة" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" align="center" style="width: 15%;" width="16%">
                <dx:ASPxTextBox ID="txtBasicVal" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
            <td align="center" align="center" style="width: 11%;" width="16%">
                &nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">
                &nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDim4" runat="server" Font-Bold="True" Text="تصنيف 4" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxComboBox ID="cmbDim4" runat="server" Width="100%">
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 15%;" width="4%">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblTargetQty" runat="server" Text="الكميه المستهدفه" Font-Bold="True" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" align="center" style="width: 15%;" width="16%">
                <dx:ASPxTextBox ID="txttargetVal" runat="server" Width="100%">
                </dx:ASPxTextBox>
            </td>
            <td align="center" align="center" style="width: 15%;" width="16%">
                &nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">
                &nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDim5" runat="server" Font-Bold="True" Text="تصنيف 5" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxComboBox ID="cmbDIm5" runat="server" Width="100%">
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 15%;" width="4%">
                &nbsp;</td>
        </tr>
    </table>

    <div style="direction: rtl">
        <table align="RIGHT" width="100%" cellpadding="5px">
            <tr>
                <td align="center" style="width: 30%" valign="top">
                    <dx:ASPxGridView ID="ASPxGridView_Target" runat="server" AutoGenerateColumns="False" DataSourceID="LinqServerModeDataSource_target"
                        KeyFieldName="nat_code" Width="100%" ClientInstanceName="ASPxGridView_Target" meta:resourcekey="ASPxGridView1Resource1">
                        <ClientSideEvents CustomButtonClick="function(s, e) {
	CustomButtonClick(e);
}" />
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="app_ser"
                                ShowInColumn="الرقم" ShowInGroupFooterColumn="الرقم" SummaryType="Count"
                                ValueDisplayFormat="{0:n0}" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image"
                                Width="10%" ShowSelectCheckbox="True">
                                <ClearFilterButton Visible="True">
                                    <Image Url="~/Images/Cancel_32x32.png">
                                    </Image>
                                </ClearFilterButton>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>

                                <HeaderTemplate>
                                    <dx:ASPxCheckBox ID="SelectAllCheckBox" runat="server" ToolTip="Select/Unselect all rows on the page"
                                        ClientSideEvents-CheckedChanged="function(s, e) { ASPxGridView_Target.SelectAllRowsOnPage(s.GetChecked()); }" />
                                </HeaderTemplate>
                                <HeaderStyle HorizontalAlign="Center" />

                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="الدولة" FieldName="nat_descrar" VisibleIndex="1" Width="90%">
                                <PropertiesTextEdit EnableClientSideAPI="True">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nat_code" Visible="False" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>

                        </Columns>
                        <SettingsBehavior AutoFilterRowInputDelay="10000" />
                        <SettingsPager PageSize="15">
                        </SettingsPager>
                        <Settings ShowFilterRow="True" ShowFooter="True" ShowTitlePanel="True" />
                        <SettingsText Title="الدول المسموح بها" />
                    </dx:ASPxGridView>

                </td>
                <td align="center" style="width: 10%;" valign="top">
                    <table align="center" width="100%">
                        <tr>
                            <td align="center" style="width: 10%;">

                                <cc1:LinqServerModeDataSource ID="LinqServerModeDataSource_target" runat="server" ContextTypeName="DirectAid.charitysoftEntities"
                                    TableName="nat_tab" />

                                <asp:SqlDataSource ID="dontCateg" runat="server" ConnectionString="<%$ ConnectionStrings:Con %>" SelectCommand="SELECT donation_cat, donation_descrar, donation_descreng, waqf_donation, donation_standard_value FROM donation_categories WHERE (donation_cat &gt; 0)"></asp:SqlDataSource>

                                <asp:SqlDataSource ID="DsAccountNum" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT DynamicsAX.dbo.MAINACCOUNT.MAINACCOUNTID FROM DynamicsAX.dbo.MAINACCOUNT INNER JOIN DynamicsAX.dbo.MAINACCOUNTCATEGORY ON DynamicsAX.dbo.MAINACCOUNT.ACCOUNTCATEGORYREF = DynamicsAX.dbo.MAINACCOUNTCATEGORY.ACCOUNTCATEGORYREF WHERE (DynamicsAX.dbo.MAINACCOUNT.ACCOUNTCATEGORYREF IN (14, 15, 16 ))"></asp:SqlDataSource>
                                <asp:SqlDataSource ID="Dsdim1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand=" SELECT * FROM DynamicsAX..DIMENSIONFINANCIALTAG WHERE FINANCIALtagCATEGORY IN('5637144826')"></asp:SqlDataSource>

                                <cc1:LinqServerModeDataSource ID="LinqServerModeDataSource_source" runat="server" ContextTypeName="DirectAid.charitysoftEntities"
                                    TableName="nat_tab" />

                                <asp:SqlDataSource ID="Dsdim2" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand=" SELECT * FROM DynamicsAX..DIMENSIONFINANCIALTAG WHERE FINANCIALtagCATEGORY IN('5637144828')"></asp:SqlDataSource>

                                <asp:SqlDataSource ID="DsSearchID" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="  select cast(donation_code as varchar)+ ' - ' + donation_descrar  as name, donation_code  from donations "></asp:SqlDataSource>

                                <dx:ASPxButton ID="ASPxButton_Add" runat="server" Text="اضافه" Width="100%" UseSubmitBehavior="False"
                                    AutoPostBack="False" ClientInstanceName="ASPxButton_Add" EnableClientSideAPI="True"
                                    Font-Bold="True">
                                    <ClientSideEvents Click="function(s, e) {
	Add_Begin();
}" />
                                    <Image Url="~/Images/Action_Navigation_History_Forward_32x32.png">
                                    </Image>
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 10%;"></td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 10%;">
                                <dx:ASPxButton ID="ASPxButton_Remove" runat="server" Text="حذف" Width="100%" UseSubmitBehavior="False"
                                    AutoPostBack="False" ClientInstanceName="ASPxButton_Remove" EnableClientSideAPI="True"
                                    Font-Bold="True">
                                    <ClientSideEvents Click="function(s, e) {
	Remove_Begin();
}" />
                                    <Image Url="~/Images/Action_Navigation_History_Back_32x32.png">
                                    </Image>
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </td>
                <td align="center" style="width: 30%;" valign="top">
                    <dx:ASPxGridView ID="ASPxGridView_Source" runat="server" AutoGenerateColumns="False" DataSourceID="LinqServerModeDataSource_source"
                        KeyFieldName="nat_code" Width="100%" ClientInstanceName="ASPxGridView_Source" meta:resourcekey="ASPxGridView1Resource1">
                        <ClientSideEvents CustomButtonClick="function(s, e) {
	CustomButtonClick(e);
}" />
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="app_ser"
                                ShowInColumn="الرقم" ShowInGroupFooterColumn="الرقم" SummaryType="Count"
                                ValueDisplayFormat="{0:n0}" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image"
                                Width="10%" ShowSelectCheckbox="True">
                                <ClearFilterButton Visible="True">
                                    <Image Url="~/Images/Cancel_32x32.png">
                                    </Image>
                                </ClearFilterButton>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>

                                <HeaderTemplate>
                                    <dx:ASPxCheckBox ID="SelectAllCheckBox" runat="server" ToolTip="Select/Unselect all rows on the page"
                                        ClientSideEvents-CheckedChanged="function(s, e) { ASPxGridView_Source.SelectAllRowsOnPage(s.GetChecked()); }" />
                                </HeaderTemplate>
                                <HeaderStyle HorizontalAlign="Center" />

                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="الدولة" FieldName="nat_descrar" VisibleIndex="1" Width="90%">
                                <PropertiesTextEdit EnableClientSideAPI="True">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nat_code" Visible="False" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>

                        </Columns>
                        <SettingsBehavior AutoFilterRowInputDelay="10000" />
                        <SettingsPager AlwaysShowPager="True" PageSize="15">
                        </SettingsPager>
                        <Settings ShowFilterRow="True" ShowFooter="True" ShowTitlePanel="True" />
                        <SettingsText Title="الدول الغير مسموح بها" />
                    </dx:ASPxGridView>

                </td>

            </tr>

        </table>
        <dx:ASPxCallback ID="ASPxCallback_Add" runat="server"
            ClientInstanceName="ASPxCallback_Add">
            <ClientSideEvents CallbackComplete="function(s, e) {
	Add_End(e);
}"
                CallbackError="function(s, e) {
	Add_Error(e);
}" />
        </dx:ASPxCallback>
        <dx:ASPxCallback ID="ASPxCallback_Remove" runat="server" ClientInstanceName="ASPxCallback_Remove">
            <ClientSideEvents CallbackComplete="function(s, e) {
	Remove_End(e);
}"
                CallbackError="function(s, e) {
	Remove_Error(e);
}" />
        </dx:ASPxCallback>
        <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
            Modal="True" Font-Bold="True">
        </dx:ASPxLoadingPanel>
    </div>

</asp:Content>



<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadContent">
    </asp:Content>
 
