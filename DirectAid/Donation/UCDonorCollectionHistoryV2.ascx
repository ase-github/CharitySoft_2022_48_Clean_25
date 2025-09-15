<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCDonorCollectionHistoryV2.ascx.vb"
    Inherits="DirectAid.UCDonorCollectionHistoryV2" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<% If DesignMode Then%>
<script src="Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<script type="text/javascript">

    function OpenRecord(recordID) {

        document.location.href = 'Collection.aspx?ReceiptID=' + recordID;
        document.URL
    }

    function CustomButtonClick(e) {

        var gridName = "ASPxGridView1";
        var index = e.visibleIndex;
        var key = ASPxClientGridView.Cast("ASPxGridView1").GetRowKey(index);
        OpenRecord(key);
    }

</script>
<dx:ASPxGridView runat="server" AutoGenerateColumns="False" DataSourceID="GrdDs" Width="100%" ID="ASPxGridView1" KeyFieldName="reciept_num" Caption="تبرعات المتبرع" ClientInstanceName="ASPxGridView1" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">

    <ClientSideEvents CustomButtonClick="function(s, e) {
	CustomButtonClick(e);
}" />

    <TotalSummary>
        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="reciept_num"
            ShowInColumn="رقم السند" ShowInGroupFooterColumn="رقم السند" SummaryType="Count"
            ValueDisplayFormat="{0:n0}" />
        <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="line_amount"
            ShowInColumn="القيمه" ShowInGroupFooterColumn="القيمه" SummaryType="Sum"
            ValueDisplayFormat="{0:n3}" />
    </TotalSummary>

    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Width="5%">
            <CustomButtons>
                <dx:GridViewCommandColumnCustomButton>
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:GridViewCommandColumnCustomButton>
            </CustomButtons>
            <ClearFilterButton Visible="True">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </ClearFilterButton>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <FooterCellStyle HorizontalAlign="Center">
            </FooterCellStyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="reciept_num" ReadOnly="True" VisibleIndex="1" Caption="رقم السند" Width="10%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <FooterCellStyle HorizontalAlign="Center">
            </FooterCellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="reciept_num_manual" VisibleIndex="2" Caption="الرقم اليدوى" Width="10%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <FooterCellStyle HorizontalAlign="Center">
            </FooterCellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="reciept_date" VisibleIndex="3" Caption="تاريخ السند" Width="10%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <FooterCellStyle HorizontalAlign="Center">
            </FooterCellStyle>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="remarks" VisibleIndex="4" Caption="ملاحظات" Width="15%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <FooterCellStyle HorizontalAlign="Center">
            </FooterCellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="currency_descrar" VisibleIndex="6" Caption="العمله" Width="10%">
            <Settings AllowHeaderFilter="True" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <FooterCellStyle HorizontalAlign="Center">
            </FooterCellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="donor_id" Visible="False" VisibleIndex="11">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <FooterCellStyle HorizontalAlign="Center">
            </FooterCellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="donation_descrar" VisibleIndex="8" Caption="التبرع" Width="10%">
            <Settings AllowHeaderFilter="True" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <FooterCellStyle HorizontalAlign="Center">
            </FooterCellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="line_amount" VisibleIndex="9" Caption="القيمه" Width="10%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <FooterCellStyle HorizontalAlign="Center">
            </FooterCellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="payment_source" ReadOnly="True" VisibleIndex="10" Caption="مصدر التمويل" Width="10%">
            <Settings AllowHeaderFilter="True" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <FooterCellStyle HorizontalAlign="Center">
            </FooterCellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="رقم الاستقطاع" FieldName="standing_inst_num" VisibleIndex="12" Width="10%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
    </Columns>

    <SettingsPager AlwaysShowPager="True"></SettingsPager>

    <Settings ShowFilterRow="True" ShowFooter="True" />

    <SettingsText CommandEdit="تعديل" CommandNew="جديد" CommandDelete="إلغاء" CommandCancel="خروج" CommandUpdate="حفظ"></SettingsText>
</dx:ASPxGridView>

<asp:SqlDataSource ID="GrdDs" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="SELECT * FROM view_DonorCollectionHistory WHERE (donor_id = @donor_id) order by reciept_date DESC"
    ConflictDetection="CompareAllValues">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="donor_id" QueryStringField="DonorId" />
    </SelectParameters>
</asp:SqlDataSource>


