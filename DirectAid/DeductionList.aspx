<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="DeductionList.aspx.vb" Inherits="DirectAid.DeductionList" Culture="auto"
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

            //document.location.href = 'InstructionFrm.aspx?RefNum=' + recordID;
            var url = 'InstructionFrm.aspx?RefNum=' + recordID;
            window.open(url, '_blank');
        }

        function OpenDistribution(recordID)
        {
            var url = 'DeductionDistribution.aspx?RefNum=' + recordID;
            window.open(url, '_blank');
        }

        function CustomButtonClick(e) {

            var gridName = "ASPxGridView1";
            var index = e.visibleIndex;
            var id = e.buttonID;
            var key = ASPxClientGridView.Cast("ASPxGridView1").GetRowKey(index);

            if (id == "DIST") {
                OpenDistribution(key);
            }
            else {
                OpenRecord(key);
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" width="100%">
        <tbody>
            <tr>
                <td align="center" style="width: 100%;">

                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LinqServerModeDataSource1"
                        KeyFieldName="ref_numb" Width="100%" ClientInstanceName="ASPxGridView1" meta:resourcekey="ASPxGridView1Resource1">
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
                                Width="10%">
                                <ClearFilterButton Visible="True">
                                    <Image Url="~/Images/Cancel_32x32.png">
                                    </Image>
                                </ClearFilterButton>
                                <CustomButtons>
                                    <dx:GridViewCommandColumnCustomButton ID="DEDU">
                                        <Image Url="~/Images/Edit_32x32.png">
                                        </Image>
                                    </dx:GridViewCommandColumnCustomButton>
                                    <dx:GridViewCommandColumnCustomButton ID="DIST">
                                        <Image Url="~/Images/Revenue_32x32.png">
                                        </Image>
                                    </dx:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="instruct_date" VisibleIndex="10" Width="10%" Visible="False">
                                <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd">
                                </PropertiesDateEdit>
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <FooterCellStyle HorizontalAlign="Center">
                                </FooterCellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="القيمة" FieldName="installment_value" VisibleIndex="7" Width="5%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="المسدد" FieldName="tot_paid" VisibleIndex="8" Width="5%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="رقم الحساب" FieldName="account_num" VisibleIndex="5" Width="10%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="رقم الاستقطاع" VisibleIndex="1" Width="10%" FieldName="ref_numb_string" SortIndex="0" SortOrder="Descending">
                                <PropertiesTextEdit EnableFocusedStyle="False">
                                </PropertiesTextEdit>
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="رقم المتبرع" FieldName="donor_id_string"
                                VisibleIndex="2" Width="10%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
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
                            <dx:GridViewDataTextColumn Caption="الرقم المدنى" FieldName="donor_civilid"
                                VisibleIndex="3" Width="10%">
                                <Settings AutoFilterCondition="BeginsWith" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="اسم المتبرع" FieldName="donor_namear_begins_with"
                                VisibleIndex="3" Width="15%">
                                <Settings AutoFilterCondition="BeginsWith" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="اسم المتبرع - جزء من الاسم" FieldName="donor_namear"
                                VisibleIndex="4" Width="15%">
                                <Settings AutoFilterCondition="Contains" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="البنك" FieldName="bank_ar_name"
                                VisibleIndex="6" Width="10%">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="الحاله" FieldName="standing_status" VisibleIndex="9" Width="5%">
                                <PropertiesComboBox DataSourceID="EntityDataSource_DeductionStatus" TextField="NameAr" ValueField="ID" ValueType="System.Byte">
                                </PropertiesComboBox>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataComboBoxColumn>
                        </Columns>
                        <SettingsBehavior AutoFilterRowInputDelay="10000" />
                        <Settings ShowFilterRow="True" ShowFooter="True" />
                    </dx:ASPxGridView>
                </td>
            </tr>
        </tbody>
    </table>
                <asp:EntityDataSource ID="EntityDataSource_DeductionStatus" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="DeductionStatus" EntityTypeFilter="DeductionStatu">
    </asp:EntityDataSource>
    <cc1:LinqServerModeDataSource ID="LinqServerModeDataSource1" runat="server" ContextTypeName="DirectAid.charitysoftEntities"
        TableName="view_stand_instruction_list" />
            </asp:Content>
