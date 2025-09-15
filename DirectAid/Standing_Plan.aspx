<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Standing_Plan.aspx.vb" Inherits="DirectAid.Standing_Plan"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" ClientIDMode="Static" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <% If DesignMode Then%>
    <script src="ASPxScriptIntelliSense.js" type="text/javascript"></script>
    <% End If%>
    <title>Direct Aid - Bank Standing Instruction</title>
    <link href="Styles/CRUXStyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="Content/jquery.jnotify-alt.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
    <script src="Scripts/jquery.jnotify.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.js" type="text/javascript"></script>
    <script src="Scripts/shortcut.js" type="text/javascript"></script>
    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                return false;

            return true;
        }

        function insertByEnterKey(buttonId) {
            //var button = document.getElementById(buttonId);


            buttonId.click();

        }

        function insertByEnterKeyEx(buttonId) {
            var button = document.getElementById(buttonId);
            var keyEvent = event.keyCode;

            if (keyEvent == 13) {
                button.click();
                return false;
            } else {
                return true;
            }
        }
    </script>
    <style type="text/css">
        .CellStyle {
            width: 12%;
        }

        .CellStyle2 {
            width: 4%;
        }

        .dxgvControl,
        .dxgvDisabled {
            border: 1px Solid #9F9F9F;
            font: 12px Tahoma, Geneva, sans-serif;
            background-color: #F2F2F2;
            color: Black;
            cursor: default;
        }

        .dxgvTable {
            -webkit-tap-highlight-color: rgba(0,0,0,0);
        }

        .dxgvTable {
            background-color: White;
            border-width: 0;
            border-collapse: separate!important;
            overflow: hidden;
            color: Black;
        }

        .dxgvHeader {
            cursor: pointer;
            white-space: nowrap;
            padding: 4px 6px 5px;
            border: 1px Solid #9F9F9F;
            background-color: #DCDCDC;
            overflow: hidden;
            font-weight: normal;
            text-align: left;
        }

        .dxgvPagerTopPanel,
        .dxgvPagerBottomPanel {
            padding-top: 4px;
            padding-bottom: 4px;
        }

        .auto-style1 {
            color: Black;
            border-left-width: 0px;
            border-top-width: 0px;
        }

        .auto-style2 {
            color: Black;
            border-left-width: 0px;
            border-right-width: 0px;
            border-top-width: 0px;
        }

        .auto-style3 {
            overflow: hidden;
            border-left-width: 0;
            border-right: 1px Solid #CFCFCF;
            border-top-width: 0;
            border-bottom: 1px Solid #CFCFCF;
            padding-left: 6px;
            padding-right: 6px;
            padding-top: 3px;
            padding-bottom: 4px;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="560">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlDeleteConfirmation" CssClass="modal" Style="display: none;" runat="server"
                DefaultButton="btnDeleteNoConfirmation"
                meta:resourcekey="pnlDeleteConfirmationResource1">
                <div class="modal-header header-label">
                    <asp:Label ID="lblDeleteConfirmationHeader" runat="server" CssClass="header-label"
                        Text="Confirmation" meta:resourcekey="lblDeleteConfirmationHeaderResource1"></asp:Label>
                </div>
                <div class="modal-body">
                    <asp:Label Text="Do you want to Delete the Plan?" ID="lblDeleteConfirmation" runat="server"
                        meta:resourcekey="lbldeleteConfirmationResource1" Font-Bold="True" Font-Names="tahoma"
                        Font-Size="Large" />
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnDeleteYesConfirmation" Text="Yes" CssClass="google-button google-button-blue"
                        runat="server" meta:resourcekey="btnConfirmSaveResource1" Font-Size="Large" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnDeleteNoConfirmation" Text="No" CssClass="google-button google-button-red"
                        runat="server" meta:resourcekey="btnCancelSaveResource1" Font-Size="Large" />
                </div>
            </asp:Panel>

            <table width="100%">
                <tr class="header-label">
                    <td>
                        <asp:Label ID="lblSearchHeader" runat="server" meta:resourcekey="lblSearchHeaderResource1"
                            CssClass="header-label" />
                    </td>
                </tr>
            </table>

            <table width="100%" cellpadding="2px">
                <tr>
                    <td></td>
                    <td></td>
                    <td class="CellStyle">
                        <asp:Button ID="btnSavePlan" runat="server" CssClass="google-button google-button-blue"
                            meta:resourcekey="btnSavePlanResource1" Height="25px" Text="Save" Width="100%"
                            TabIndex="4" UseSubmitBehavior="False" />
                    </td>
                    <td class="CellStyle">
                        <asp:Button ID="btnReset" runat="server" CssClass="google-button google-button-blue"
                            meta:resourcekey="btnResetResource1" Height="25px" Text="Reset" Width="100%"
                            TabIndex="5" UseSubmitBehavior="False" />
                    </td>
                    <td class="CellStyle">
                        <asp:Button ID="btnDelete" runat="server" CssClass="google-button google-button-blue"
                            meta:resourcekey="btndeleteResource1" Height="25px" Text="Delete" Width="100%"
                            TabIndex="5" UseSubmitBehavior="False" />
                        <asp:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server"
                            BackgroundCssClass="ModalBackground" CancelControlID="btnDeleteNoConfirmation"
                            DropShadow="True" DynamicServicePath="" Enabled="True"
                            PopupControlID="pnlDeleteConfirmation" TargetControlID="btnDelete">
                        </asp:ModalPopupExtender>
                    </td>
                    <td class="CellStyle"></td>
                    <td class="CellStyle"></td>
                </tr>
            </table>

            <table width="100%">
                <tr class="header-label">
                    <td class="style2">
                        <asp:Label ID="lblRecieptHeader" Text="Instrcution Informations" runat="server" CssClass="header-label"
                            meta:resourcekey="lblRecieptHeaderResource1" Width="100%" />
                    </td>
                </tr>
            </table>
            <table align="center" width="100%">
                <tr>
                    <td align="center" style="width: 10%;">
                        <asp:Label ID="lblRefnum" Text="Ref Num" ForeColor="#003366" CssClass="label" Font-Names="Tahoma"
                            Font-Size="8pt" for="txtrefnum" runat="server" meta:resourcekey="lblarabicResource1" />

                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:TextBox ID="txtrefnum" runat="server" Width="100%" Enabled="False" Height="22px"
                            CssClass="textbox" Style="margin-left: 0px" MaxLength="180" meta:resourcekey="txtrefnumResource2"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:Label ID="lblArabicName" runat="server" CssClass="label"
                            Font-Names="Tahoma" Font-Size="8pt" for="txtArabicName" ForeColor="#003366"
                            meta:resourcekey="lblArabicNameResource1" Text="Arabic Name" />
                    </td>
                    <td align="center">
                        <asp:TextBox ID="txtArabicName" runat="server" CssClass="textbox"
                            Enabled="False" Height="20px" MaxLength="180"
                            meta:resourcekey="txtArabicNameResource1"
                            Style="margin-left: 0px; margin-right: 0px;" Width="345px"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:Label ID="lblDnrID" runat="server" CssClass="label" Font-Names="Tahoma"
                            Font-Size="8pt" for="txtDonrIDn"
                            meta:resourcekey="lblDnrIDResource1" Text="Donor ID" />
                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:TextBox ID="txtDonrIDn" runat="server" CssClass="textbox" Enabled="False"
                            Height="19px" meta:resourcekey="txtDonrIDnResource1" Style="margin-left: 0px"
                            TabIndex="8"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <table width="100%">
                <tr class="header-label">
                    <td class="style2">
                        <asp:Label ID="lblGrdhead" Text="Instrcution Plans" runat="server" CssClass="header-label"
                            meta:resourcekey="lblGrdheadHeaderResource1" Width="100%" />
                    </td>
                </tr>
            </table>
            <asp:GridView ID="grvpln" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                DataKeyNames="ref_numb,donation_code" meta:resourcekey="grvPaymentsResource1"
                ShowHeaderWhenEmpty="True" BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue"
                CellPadding="0" Font-Size="10pt" ForeColor="DarkBlue" GridLines="None" Width="70%"
                Font-Names="tahoma">
                <Columns>
                    <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:ImageButton ID="LinkButton1" runat="server" CommandName="Update" ImageUrl="Content/images/save.png"
                                meta:resourceKey="UpdateResource1" Text="Update" />
                            &nbsp;
                            <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                ImageUrl="Content/images/cancel.png" meta:resourceKey="CancelResource1" Text="Cancel"
                                Style="height: 16px" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ID="lbtnAddDist" runat="server" ImageUrl="Content/images/add.png"
                                meta:resourceKey="AddResource1" OnClick="lbtnAddDistFooter_Click" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:ImageButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit"
                                ImageUrl="Content/images/edit.png" meta:resourceKey="EditResource1" Text="Edit" />
                            &nbsp;<asp:ImageButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Delete"
                                ImageUrl="Content/images/delete.png" meta:resourceKey="DeleteResource1" Style="margin-left: 12px; width: 16px;"
                                Text="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ref_numb" meta:resourceKey="txtrefNo" SortExpression="ref_numb"
                        Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtrefnumedit" runat="server" Text='<%# Bind("ref_numb") %>' meta:resourcekey="txtrefnumeditResource1"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtrefnum" runat="server" CssClass="textbox" meta:resourcekey="txtrefnumResource1"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text='<%# Bind("ref_numb") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Donation Name" meta:resourceKey="txtHeaderDonationArabic"
                        SortExpression="donation_descrar">
                        <EditItemTemplate>
                            <asp:Label ID="label1Edit" runat="server" meta:resourcekey="label1EditResource1"
                                Text='<%# Eval("donation_descrar") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlDonationAra" runat="server" CssClass="dropdownlist" DataSourceID="DonationTypeSDS2"
                                DataTextField="donation_descrar" DataValueField="donation_code" Width="140px"
                                meta:resourcekey="ddlDonationAraResource1" AutoPostBack="True" Font-Names="Tahoma"
                                Font-Size="8pt" OnSelectedIndexChanged="DropDownListFooterAr_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DonationTypeSDS2" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                                SelectCommand="SELECT DISTINCT donations.donation_code, donations.donation_cat, donations.donation_descrar, donations.donation_descreng, donations.donation_standard_value FROM donation_categories INNER JOIN donations ON donation_categories.waqf_donation = donations.donation_cat WHERE (donation_categories.waqf_donation = 2)"></asp:SqlDataSource>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text='<%# Bind("donation_descrar") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="100px" />
                        <FooterStyle Width="100px" />
                        <ItemStyle Width="100px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Country" meta:resourceKey="txtHeadercountry">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddl_nat" runat="server" CssClass="dropdownlist" DataSourceID="Nat_EditDS"
                                DataTextField="nat_descrar" DataValueField="nat_code" meta:resourcekey="ddl_natResource1"
                                SelectedValue="<%# Bind('nat_code') %>">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Nat_EditDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                                SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlCountryFooter" runat="server" CssClass="dropdownlist" DataSourceID="CountrySqlDataSource"
                                DataTextField="nat_descrar" DataValueField="nat_code" meta:resourcekey="ddlCountryFooterResource1"
                                Width="100px" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlCountryFooter_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="CountrySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                                SelectCommand="SELECT nat_code, nat_descrar, nat_desceng, zone_code, cntry_integ_code FROM nat_tab WHERE (zone_code IS NOT NULL)"></asp:SqlDataSource>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCountry" runat="server" meta:resourcekey="lblCountryResource1"
                                Text='<%# Eval("nat_descrar") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total Amount" meta:resourceKey="txtTotamountrescNew">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTotalEdit" runat="server" CssClass="textbox" Text='<%# Bind("totAmnt" , "{0:N3}") %>'
                                meta:resourcekey="txtTotalEditResource1"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtTotalFooter" runat="server" CssClass="textbox" MaxLength="10"
                                meta:resourcekey="txtTotalFooterResource1" Width="70px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbltotalamt" runat="server" meta:resourcekey="lbltotalamtResource1"
                                Text='<%# Bind("totAmnt" , "{0:N3}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="95%" />
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                    Height="25px" HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="AliceBlue"></AlternatingRowStyle>
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                <SelectedRowStyle BackColor="Ivory" Font-Bold="False" ForeColor="DeepPink" Font-Italic="False"
                    Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></SelectedRowStyle>
                <EditRowStyle Font-Size="X-Small" />
                <EmptyDataTemplate>
                    <tr>
                        <td style="width: 25%" align="center">
                            <asp:ImageButton ID="lbtnAddDist0" runat="server" OnClick="lbtnAddDist_Click" meta:resourcekey="lbtnAddDistResource1"
                                ImageUrl="Content/images/add.png"></asp:ImageButton>
                        </td>
                        <td style="width: 25%" align="center">
                            <asp:DropDownList ID="ddlDonationNew" runat="server" DataSourceID="DonationTypeSDS3"
                                DataTextField="donation_descrar" DataValueField="donation_code" OnSelectedIndexChanged="ddlDonationddlDonationNew_SelectedIndexChanged"
                                AutoPostBack="True" meta:resourcekey="ddlDonationNewResource1" Width="100%">
                                <asp:ListItem Value="0" meta:resourcekey="ListItemResource14" Text="Please Select Donation Type"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="DonationTypeSDS3" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                                SelectCommand="SELECT DISTINCT donations.donation_code, donations.donation_cat, donations.donation_descrar, donations.donation_descreng, donations.donation_standard_value FROM donation_categories INNER JOIN donations ON donation_categories.waqf_donation = donations.donation_cat WHERE (donation_categories.waqf_donation = 2)"></asp:SqlDataSource>
                        </td>
                        <td style="width: 25%" align="center">
                            <asp:DropDownList ID="ddlcountry" runat="server" AppendDataBoundItems="True" DataSourceID="countryDS"
                                DataTextField="nat_descrar" DataValueField="nat_code" AutoPostBack="True" meta:resourcekey="ddlcountryResource1"
                                Width="100%" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="countryDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                                SelectCommand="SELECT * FROM [nat_tab] WHERE ([zone_code] IS NOT NULL)"></asp:SqlDataSource>
                        </td>
                        <td style="width: 25%" align="center">
                            <asp:TextBox ID="txtTotal" runat="server" onkeypress="return isNumberKey(event)"
                                meta:resourcekey="txtTotalResource1" Width="100%" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                </EmptyDataTemplate>
            </asp:GridView>
            <table width="100%">
                   <tr class="header-label">
                        <td class="style2">
                            <asp:Label ID="Label2" runat="server" CssClass="header-label" Text="تفاصيـل الدفع" Width="100%" />
                        </td>
                    </tr>
               
              </table>
            <table>
                <tr>

                    <td>
                        <div style="height: 191px" dir="rtl">
                            
                            <dx:ASPxGridView ID="Grd_DOnations" runat="server" AutoGenerateColumns="False" DataSourceID="Ds_standingPlan" Width="700px">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="رقم المرجع" FieldName="ref_numb" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="مسلسل" FieldName="line_num" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="إجمالى المبلع" FieldName="total_value" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="المبلع المدفوع" FieldName="amount_paid" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="متبقي" FieldName="balance" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="نوع التبرع" FieldName="donation_code" VisibleIndex="2">
                                        <PropertiesComboBox DataSourceID="Ds_donatDescr" TextField="donation_descrar" ValueField="donation_code">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </div>

                    </td>
                   
                </tr>
                <tr>
                     <td>

                        <asp:SqlDataSource ID="Ds_standingPlan" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="Standing_Plan_tmpInsert" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:ControlParameter ControlID="txtrefnum" Name="ref_numb" PropertyName="Text" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </td>
                    <td>
                      <asp:SqlDataSource ID="Ds_donatDescr" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT [donation_descrar], [donation_code] FROM [donations]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>




        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
