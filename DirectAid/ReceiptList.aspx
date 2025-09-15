<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="ReceiptList.aspx.vb" Inherits="DirectAid.ReceiptList" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <% If DesignMode Then%>
    <script src="Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
    <% End If%>
    <script type="text/javascript">

        function OpenRecord(recordID) {

            //document.location.href = 'Collection.aspx?ReceiptID=' + recordID;
            var url = 'Collection.aspx?ReceiptID=' + recordID;
            window.open(url, '_blank');
        }

        function CustomButtonClick(e) {

            var gridName = "ASPxGridView1";
            var index = e.visibleIndex;
            var key = ASPxClientGridView.Cast("ASPxGridView1").GetRowKey(index);
            OpenRecord(key);
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" width="100%">
        <tbody>
            <tr>
                <td align="center" style="width: 100%;">

                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqServerModeDataSource1"
                        KeyFieldName="reciept_num" Width="100%" ClientInstanceName="ASPxGridView1" meta:resourcekey="ASPxGridView1Resource1">
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
                            <dx:GridViewDataDateColumn Caption="تاريخ السند" FieldName="reciept_date" VisibleIndex="2" Width="10%">
                                <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd">
                                </PropertiesDateEdit>
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Center">
                                </FooterCellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="القيمة" FieldName="total_amount" VisibleIndex="6" Width="10%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="العملة" FieldName="currency_descrar" VisibleIndex="7" Width="10%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn Caption="مطبوع" FieldName="printed" VisibleIndex="8" Width="5%">
                                <PropertiesCheckEdit DisplayTextChecked="نعم" DisplayTextUnchecked="لا">
                                </PropertiesCheckEdit>
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataTextColumn Caption="رقم السند" VisibleIndex="1" Width="10%" FieldName="reciept_num_string" SortIndex="0" SortOrder="Descending">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="الرقم اليدوى" VisibleIndex="1" Width="10%" FieldName="reciept_num_manual">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="رقم المتبرع" FieldName="donor_id_string"
                                VisibleIndex="3" Width="10%">
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
                                VisibleIndex="4" Width="20%" Visible="False">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn Caption="Donor Name" FieldName="donor_nameen"
                                VisibleIndex="5" Width="25%" Visible="false">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="مرات الطباعة" FieldName="print_count" VisibleIndex="10" Width="10%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AutoFilterRowInputDelay="10000" />
                        <Settings ShowFilterRow="True" ShowFooter="True" />
                    </dx:ASPxGridView>
                </td>
            </tr>
        </tbody>
    </table>
    <cc1:LinqServerModeDataSource ID="LinqServerModeDataSource1" runat="server" ContextTypeName="DirectAid.charitysoftEntities"
        TableName="view_receipt_list" />
    </asp:Content>
