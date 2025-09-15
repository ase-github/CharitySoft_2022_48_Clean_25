<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="DonorList.aspx.vb" Inherits="DirectAid.DonorList" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <% If DesignMode Then%>
    <script src="Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
    <% End If%>
    <script type="text/javascript">

        function OpenDonorForEdit(donorID) {
            var url = 'AddDonar.aspx?DonorID=' + donorID;
            //document.location.href = 'AddDonar.aspx?DonorID=' + donorID;
            window.open(url, '_blank');
        }

        function OpenDonorInfo(donorID) {

            //document.location.href = 'UIDonorProfileView.aspx?DonorID=' + donorID;
            var url = 'UIDonorProfileView.aspx?DonorID=' + donorID;
            window.open(url, '_blank');
        }

        function CustomButtonClick(e) {

            var gridName = "ASPxGridView1";
            var index = e.visibleIndex;
            var key = ASPxClientGridView.Cast("ASPxGridView1").GetRowKey(index);
            var id = e.buttonID;

            if (id == "EDIT")
            {
                OpenDonorForEdit(key);
            }
            else if (id == "INFO")
            {
                OpenDonorInfo(key);
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" width="50%">
        <tbody>
            <tr>
                <td align="center" style="width: 10%;">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="List type : " Width="100%"
                        meta:resourcekey="ASPxLabel1Resource1">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 90%;">
                    <dx:ASPxComboBox ID="ASPxComboBox_ListType" runat="server"
                        ValueType="System.Byte" AutoPostBack="True" SelectedIndex="0" Width="100%"
                        meta:resourcekey="ASPxComboBox_ListTypeResource1">
                        <Items>
                            <dx:ListEditItem Text="All Donors" Value="0"
                                meta:resourcekey="ListEditItemResource1" />
                            <dx:ListEditItem Text="Unassigned Donors" Value="1"
                                meta:resourcekey="ListEditItemResource2" />
                            <dx:ListEditItem Text="Donors not paying" Value="2"
                                meta:resourcekey="ListEditItemResource3" />
                            <dx:ListEditItem Text="Donors waiting for another assignment" Value="3"
                                meta:resourcekey="ListEditItemResource4" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
            </tr>
        </tbody>
    </table>
    <table align="center" width="100%">
        <tbody>
            <tr>
                <td align="center" style="width: 100%;">
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqServerModeDataSource1"
                        KeyFieldName="donor_id" Width="100%" ClientInstanceName="ASPxGridView1" meta:resourcekey="ASPxGridView1Resource1">
                        <ClientSideEvents CustomButtonClick="function(s, e) {
	CustomButtonClick(e);
}" />
                        <Columns>
                            <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Width="10%">
                                <ClearFilterButton Visible="True">
                                    <Image Url="~/Images/Cancel_32x32.png">
                                    </Image>
                                </ClearFilterButton>
                                <CustomButtons>
                                    <dx:GridViewCommandColumnCustomButton ID="EDIT">
                                        <Image Url="~/Images/Edit_32x32.png">
                                        </Image>
                                    </dx:GridViewCommandColumnCustomButton>
                                    <dx:GridViewCommandColumnCustomButton ID="INFO">
                                        <Image Url="~/Images/Info_32x32.png">
                                        </Image>
                                    </dx:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn Caption="الرقم" FieldName="donor_id" ReadOnly="True" VisibleIndex="1" Width="10%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="رقم النظام السابق" VisibleIndex="2" FieldName="donor_prev_id" Width="10%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="الاسم بالعربيه" FieldName="donor_namear" VisibleIndex="3" Width="20%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="الاسم الاخير" FieldName="LastNameAr" VisibleIndex="4" Width="10%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="الرقم المدنى" FieldName="donor_civilid" VisibleIndex="5" Width="10%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="نيابه عن" FieldName="donat_to" VisibleIndex="6" Width="10%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="الهواتف" FieldName="phones" VisibleIndex="7" Width="10%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="العنوان" FieldName="address"  VisibleIndex="8" Width="10%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AutoFilterRowInputDelay="10000" />
                        <Settings ShowFilterRow="True" />
                    </dx:ASPxGridView>
                </td>
            </tr>
        </tbody>
    </table>
    <cc1:LinqServerModeDataSource ID="LinqServerModeDataSource1" runat="server" ContextTypeName="DirectAid.Database" TableName="view_donor_list" />
</asp:Content>
