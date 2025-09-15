<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="SearchRecpt.aspx.vb" Inherits="DirectAid.SearchRecpt" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>




<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div>

        <table align="center" width="100%" cellpadding="5px">
            <tr>
                <td align="center">
                    <table align="center" width="100%" cellpadding="5px">
                        <tr>
                            <td align="center" style="width: 16%;" width="16%">
                                <dx:ASPxLabel ID="lblDOnationCod" runat="server" Font-Bold="True" Text=" رقم السند " Width="100%">
                                </dx:ASPxLabel>
                            </td>

                            <td align="center" style="width: 16%;" width="16%">
                                <dx:ASPxTextBox ID="ASPxTextBox_reciept_num" runat="server" Width="100%" NullText="ادخل رقم السند ...">
                                    <NullTextStyle ForeColor="#999999">
                                    </NullTextStyle>
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>
                            </td>

                            <td align="center" width="16%">
                                <dx:ASPxButton ID="ASPxButton_New" runat="server" Text="جديد" Width="100%" UseSubmitBehavior="False"
                                    ClientInstanceName="ASPxButton_New" EnableClientSideAPI="True" Font-Bold="True" Visible="False">
                                    <Image Url="~/Images/New_32x32.png">
                                    </Image>
                                </dx:ASPxButton>
                                <dx:ASPxButton ID="Btn_Search" runat="server" Text="بحث" Width="100%" Font-Bold="True">
                                    <Image Url="~/Images/Find_32x32.png">
                                    </Image>
                                </dx:ASPxButton>
                            </td>

                            <td align="center" style="width: 16%;" width="16%">

                                <dx:ASPxButton ID="ASPxButton_Save" runat="server" Text="الغاء" Width="100%" UseSubmitBehavior="False"
                                    AutoPostBack="False" ClientInstanceName="ASPxButton_Save" EnableClientSideAPI="True"
                                    Font-Bold="True" Style="height: 43px" Visible="False" TabIndex="2">
                                    <ClientSideEvents Click="function(s, e) {
	e.processOnServer  = confirm('هل تريد الغاء هذا السند ؟');
}" />
                                    <Image Url="~/Images/Delete_32x32.png">
                                    </Image>
                                </dx:ASPxButton>

                            </td>
                            <td align="center" style="width: 16%;" width="16%">&nbsp;</td>

                            <td align="center" style="width: 16%;" width="16%"></td>
                            <td align="center" style="width: 4%;" width="4%"></td>
                        </tr>
                    </table>

                    <dx:ASPxGridView ID="Grd_DonorDetail" runat="server" AutoGenerateColumns="False" DataSourceID="Ds_SearchRcpt" KeyFieldName="reciept_num" Width="100%">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="اسم المتبرع" FieldName="donor_namear" VisibleIndex="0" Width="200px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="الجنسية" FieldName="nat_descrar" VisibleIndex="1" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="رقم التليفون" FieldName="primary_phone" VisibleIndex="2" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="رقم السند" FieldName="reciept_num" ReadOnly="True" VisibleIndex="3" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="رقم السند اليدوي" FieldName="reciept_num_manual" VisibleIndex="4" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="إجمالى" FieldName="total_amount" VisibleIndex="5" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="العملة" FieldName="currency_descrar" VisibleIndex="6" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="تاريخ" FieldName="reciept_date" VisibleIndex="7" Width="100px">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="نوع" FieldName="donation_descrar" VisibleIndex="10" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="الحالة" FieldName="void" VisibleIndex="8" Width="50px">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="فعال" Value="0" />
                                        <dx:ListEditItem Text="ملغي" Value="2" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                        </Columns>

                    </dx:ASPxGridView>

                </td>
            </tr>
        </table>
        <table align="center" width="100%" cellpadding="5px">
            <tr>
                <td style="width: 40%;" valign="top">
                    <dx:ASPxGridView ID="Grd_DOnations" runat="server" AutoGenerateColumns="False" DataSourceID="Ds_SearchRcptDonations" Width="100%">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="نوع" FieldName="Donation_cat" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="نوع التبرع" FieldName="donation_descrar" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="البلد" FieldName="nat_descrar" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="قيمة" FieldName="donation_value" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="عدد" FieldName="qty" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="مجموع" FieldName="line_amount" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>

                </td>
                <td style="width: 10%;">
                    <asp:SqlDataSource ID="Ds_SearchRcptDonations" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SearchRcpt_Donations" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="0" Name="Rcpt_num" QueryStringField="ReceiptID" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="Ds_SearchRcpt" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SearchRcpt" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="0" Name="Rcpt_num" QueryStringField="ReceiptID" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="Ds_SearchRcpt_paymethod" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SearchRcpt_Paymethod" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="0" Name="Rcpt_num" QueryStringField="ReceiptID" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </td>
                <td style="width: 40%;" valign="top">
                    <dx:ASPxGridView ID="Grd_PayMethods" runat="server" AutoGenerateColumns="False" DataSourceID="Ds_SearchRcpt_paymethod" Width="100%">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="طريقة الدفع" FieldName="pay_method_ar" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="القيمة" FieldName="pay_amnt" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="رقم الحساب" FieldName="acc_num" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="البنك" FieldName="bank_ar_name" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>

                </td>
            </tr>
            <tr>
                <td style="width: 40%;" valign="top">
                    <table align="center" class="auto-style1">
                        <tr>
                            <td style="width: 20%; text-align: center;">تاريخ الاضافة</td>
                            <td style="width: 30%">
                                <dx:ASPxTextBox ID="txtAddedDate" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </td>
                            <td style="width: 20%; text-align: center;">بواسطة</td>
                            <td style="width: 30%">
                                <dx:ASPxTextBox ID="txtAddedBy" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>

                </td>
                <td style="width: 10%;">
                    &nbsp;</td>
                <td style="width: 40%;" valign="top">
                    &nbsp;</td>
            </tr>
        </table>
    </div>

</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>


