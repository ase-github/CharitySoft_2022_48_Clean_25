<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="NewDonationsMaster.aspx.vb" Inherits="DirectAid.NewDonationsMaster" %>

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
                    ValidationGroup="Save" Style="height: 43px">
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
            <td align="center" width="4%">&nbsp;</td>
        </tr>

        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDOnationCod" runat="server" Font-Bold="True" Text=" رقم التبرعات " Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" align="center" style="width: 15%;" width="16%">
                <dx:ASPxTextBox ID="txtdonCode" runat="server" AutoPostBack="True" Width="100%" ReadOnly="True">
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
                    ValueType="System.Byte" Width="100%">
                </dx:ASPxComboBox>
            </td>
            <td align="center" width="16%">&nbsp;</td>
            <td align="center" width="16%">
                <dx:ASPxCheckBox ID="ASPxCheckBox_ApplyCurrencyConversion" runat="server" CheckState="Unchecked" Text="يطبق عليه تحويل العملات"
                    Width="100%">
                </dx:ASPxCheckBox>
            </td>
            <td align="center" width="4%">&nbsp;</td>
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
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxCheckBox ID="ASPxCheckBox_Active" runat="server" CheckState="Unchecked" Text="فعال"
                    Width="100%">
                </dx:ASPxCheckBox>
            </td>
            <td align="center" style="width: 15%;" width="4%">&nbsp;</td>
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
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">
                <asp:EntityDataSource ID="EntityDataSource_dimension5" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="dimension5">
                </asp:EntityDataSource>
            </td>
            <td align="center" style="width: 15%;" width="4%">&nbsp;</td>
        </tr>

        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblBasicValue1" runat="server" Font-Bold="True" Text="نوع الحساب" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" align="center" style="width: 15%;" width="16%">
                <dx:ASPxComboBox ID="ASPxComboBox_AccounType" runat="server" IncrementalFilteringMode="Contains" Width="100%" AutoPostBack="True">

                    <Items>
                        <dx:ListEditItem Text="ايرادات" Value="4" />
                        <dx:ListEditItem Text="خصوم" Value="2" />
                    </Items>

                </dx:ASPxComboBox>
            </td>
            <td align="center" align="center" style="width: 11%;" width="16%">
                <dx:ASPxLabel ID="lblBasicValue0" runat="server" Font-Bold="True" Text="رقم الحساب" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxComboBox ID="cmbAccNum" runat="server" DataSourceID="DsAccountNum" IncrementalFilteringMode="Contains" TextField="MAINACCOUNTID" ValueField="MAINACCOUNTID" Width="100%">
                    <Columns>
                        <dx:ListBoxColumn FieldName="MAINACCOUNTID" Caption="رقم الحساب" Width="100%" />
                    </Columns>

                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDim6" runat="server" Font-Bold="True" Text="Dimension 2" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxComboBox ID="cmbDim2" runat="server" DataSourceID="Dsdim2" TextField="VALUE" ValueField="VALUE" Width="100%">
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 15%;" width="4%">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDim7" runat="server" Font-Bold="True" Text="Dimension 1" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" align="center" style="width: 15%;" width="16%">
                <dx:ASPxComboBox ID="cmbDim1" runat="server" DataSourceID="Dsdim1" TextField="VALUE" ValueField="VALUE" Width="100%">
                </dx:ASPxComboBox>
            </td>
            <td align="center" align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDim4" runat="server" Font-Bold="True" Text="تصنيف 4" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxComboBox ID="cmbDim4" runat="server" Width="100%">
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDim5" runat="server" Font-Bold="True" Text="تصنيف 5" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxComboBox ID="cmbDIm5" runat="server" Width="100%" DataSourceID="EntityDataSource_dimension5" TextField="NameAr" ValueField="ID">
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 15%;" width="4%">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
                    Modal="True" Font-Bold="True">
                </dx:ASPxLoadingPanel>
            </td>
            <td align="center" align="center" style="width: 15%;" width="16%">

                <asp:SqlDataSource ID="dontCateg" runat="server" ConnectionString="<%$ ConnectionStrings:Con %>" SelectCommand="SELECT donation_cat, donation_descrar, donation_descreng, waqf_donation, donation_standard_value FROM donation_categories WHERE (donation_cat &gt; 0)"></asp:SqlDataSource>

            </td>
            <td align="center" align="center" style="width: 15%;" width="16%">

                <asp:SqlDataSource ID="DsAccountNum" runat="server" ConnectionString="<%$ ConnectionStrings:DynamicsAXConnectionString %>" SelectCommand="SELECT DynamicsAX.dbo.MAINACCOUNT.MAINACCOUNTID FROM DynamicsAX.dbo.MAINACCOUNT INNER JOIN DynamicsAX.dbo.MAINACCOUNTCATEGORY ON DynamicsAX.dbo.MAINACCOUNT.ACCOUNTCATEGORYREF = DynamicsAX.dbo.MAINACCOUNTCATEGORY.ACCOUNTCATEGORYREF WHERE (DynamicsAX.dbo.MAINACCOUNT.ACCOUNTCATEGORYREF IN (14, 15, 16,22 ))
AND (LEFT(DynamicsAX.dbo.MAINACCOUNT.MAINACCOUNTID, 1) = @ACCOUNTTYPE)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ASPxComboBox_AccounType" DbType="String" DefaultValue="0" Name="ACCOUNTTYPE" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="center" style="width: 15%;" width="16%">
                <asp:SqlDataSource ID="Dsdim1" runat="server" ConnectionString="<%$ ConnectionStrings:DynamicsAXConnectionString %>" SelectCommand=" SELECT * FROM DynamicsAX..DIMENSIONFINANCIALTAG WHERE FINANCIALtagCATEGORY IN('5637144826')"></asp:SqlDataSource>

            </td>
            <td align="center" style="width: 15%;" width="16%">

                <asp:SqlDataSource ID="Dsdim2" runat="server" ConnectionString="<%$ ConnectionStrings:DynamicsAXConnectionString %>" SelectCommand=" SELECT * FROM DynamicsAX..DIMENSIONFINANCIALTAG WHERE FINANCIALtagCATEGORY IN('5637144828')"></asp:SqlDataSource>

            </td>
            <td align="center" style="width: 15%;" width="16%">

                <asp:SqlDataSource ID="DsSearchID" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="  select cast(donation_code as varchar)+ ' - ' + donation_descrar  as name, donation_code  from donations "></asp:SqlDataSource>

            </td>
            <td align="center" style="width: 15%;" width="4%">&nbsp;</td>
        </tr>
    </table>
</asp:Content>



<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>

