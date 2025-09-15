<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCDonorV3.ascx.vb"
    Inherits="DirectAid.UCDonorV3" %>



<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>


<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<link href="../Content/jquery.jnotify-alt.css" rel="stylesheet" type="text/css" />
<link href="../Styles/CRUXStyleSheet.css" rel="stylesheet" type="text/css" />
<link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.7.2.js" type="text/javascript"></script>
<script src="../Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
<script src="../Scripts/bootstrap.js" type="text/javascript"></script>
<script src="../Scripts/jquery.jnotify.js" type="text/javascript"></script>
<script src="../Scripts/bootstrap.js" type="text/javascript"></script>
<script src="../Scripts/shortcut.js" type="text/javascript"></script>
<script type="text/javascript">

    function ShowCollectionHistory() {

        var donorID = document.getElementById("txtDonor").value;
        if (donorID != "") {
            var url = "DonorCollectionHistory.aspx?DonorID=" + donorID;
            window.open(url, 'CollectionHistory', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600');
        }
    }

    function ShowDonorBeneficiaries() {

        var donorID = document.getElementById("txtDonor").value;
        if (donorID != "") {
            var url = "DonorBeneficiaries.aspx?DonorID=" + donorID;
            window.open(url, 'DonorBeneficiaries', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600');
        }
    }

    function CivilIdValidate(oSrc, args) {

        var digaray = new Array(10);
        var cd;
        var summ = 0;
        var remainder = 0;
        var i;
        var j;
        var h;
        var CivilianIdValue;
        var s;

        //- h = document.getElementById("ddlSearchType").value;
        //civil id option = 1 , passport 2 , without civil 3
        //- if (h == 1) {
        //-  j = document.getElementById("txtSearch");
        //-  CivilianIdValue = j.value;
        //-  if (CivilianIdValue == '') return false;
        //alert (civil_id);                                                                                     
        //remainder = 0;
        j = document.getElementById("txtCivilid");
        CivilianIdValue = j.value;
        if (CivilianIdValue == '') return false;
        digaray[0] = 2;
        digaray[1] = 1;
        digaray[2] = 6;
        digaray[3] = 3;
        digaray[4] = 7;
        digaray[5] = 9;
        digaray[6] = 10;
        digaray[7] = 5;
        digaray[8] = 8;
        digaray[9] = 4;
        digaray[10] = 2;
        //summ = 0;

        for (i = 0; i < 11; i++) {
            summ += parseInt(CivilianIdValue.substr(i, 1)) * digaray[i];
        }
        remainder = summ % 11;
        if (parseInt(CivilianIdValue.substr(11, 1)) == (11 - remainder)) {
            args.IsValid = true;

        }
        else {
            args.IsValid = false;

            //                    s = document.getElementById("txt_stude_idnum");
            //                    s.click();
            //                    s.focus();
            //s.value = '';

        }
    }

    function insertByEnterKey(buttonId) {
        var button = document.getElementById(buttonId);
        var keyEvent = event.keyCode;

        if (keyEvent == 13) {
            button.click();
            return false;
        } else {
            return true;
        }
    }

    shortcut.add("F2", function () {

        var resetButtonDr = document.getElementById("CmdClear");

        resetButtonDr.click();

    });

    shortcut.add("F3", function () {

        var btnDonrSearch = document.getElementById("btnDonrSearch");

        btnDonrSearch.click();

    });

    shortcut.add("F8", function () {

        var SaveButtonDr = document.getElementById("CmdSave");

        SaveButtonDr.click();


    });

    shortcut.add("Insert", function () {

        var btn = document.getElementById("lnkNewReceipt");

        btn.click();


    });

</script>

<style type="text/css">
    .auto-style1 {
        width: 12%;
    }
</style>

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel" runat="server">
    <ContentTemplate>
        <div class="container">
            <asp:Panel ID="pnlSreachResult" CssClass="modal" Style="display: none;" runat="server">
                <div class="modal-header header-label">
                    <asp:Label ID="lblSearchResultHeader" runat="server" CssClass="header-label" Text="Search Result"
                        meta:resourcekey="lblSearchResultHeaderResource1"></asp:Label>
                </div>
                <div class="modal-body">
                    <asp:GridView ID="grvSearchResult" runat="server" AutoGenerateColumns="False" BackColor="White"
                        BorderColor="LightSteelBlue" BorderWidth="1px" CellPadding="15" DataKeyNames="donor_id"
                        Font-Name="tahoma" Font-Size="10pt" ForeColor="DarkBlue" GridLines="None" HeaderStyle-BackColor="#aaaadd"
                        HorizontalAlign="Center">
                        <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                            Height="25px" HorizontalAlign="Center" />
                        <AlternatingRowStyle BackColor="AliceBlue" />
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <SelectedRowStyle BackColor="Ivory" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                            Font-Strikeout="False" Font-Underline="False" ForeColor="DeepPink" />
                        <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                            Height="25px" HorizontalAlign="Center" />
                        <Columns>
                            <asp:TemplateField HeaderText="Id" meta:resourcekey="TemplateFieldResource40">
                                <ItemTemplate>
                                    <asp:HyperLink ID="lnkDonorId" runat="server" NavigateUrl='<%# Bind("donor_id","~/AddDonar.aspx?DonorId={0}") %>'
                                        Text='<%# Bind("donor_id") %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Arabic Name" meta:resourcekey="TemplateFieldResource41">
                                <ItemTemplate>
                                    <asp:Label ID="lblDonorNameAra" runat="server" Text='<%# Bind("donor_namear") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="English Name" meta:resourcekey="TemplateFieldResource42">
                                <ItemTemplate>
                                    <asp:Label ID="lblDonorNameEng" runat="server" Text='<%# Bind("donor_nameen") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Favour Of" meta:resourcekey="FavourResource41">
                                <ItemTemplate>
                                    <asp:Label ID="lblFavourName" runat="server" Text='<%# Bind("donat_to") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Civil Id" meta:resourcekey="TemplateFieldResource43">
                                <ItemTemplate>
                                    <asp:Label ID="lblCivilId" runat="server" Text='<%# Bind("donor_civilid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Home Phone" meta:resourcekey="TemplateFieldResource44">
                                <ItemTemplate>
                                    <asp:Label ID="lblPrimaryPhone" runat="server" Text='<%# Bind("primary_phone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnCloseSearchResult" Text="Close" CssClass="google-button google-button-blue"
                        runat="server" meta:resourcekey="btnCloseSearchResource1" />
                </div>
            </asp:Panel>
            <ajaxToolkit:ModalPopupExtender ID="pnlSreachResult_ModalPopupExtender" runat="server"
                DynamicServicePath="" Enabled="True" TargetControlID="HiddenForModel3" PopupControlID="pnlSreachResult"
                BackgroundCssClass="ModalBackground" DropShadow="True" CancelControlID="btnCloseSearchResult"
                RepositionMode="RepositionOnWindowResizeAndScroll">
            </ajaxToolkit:ModalPopupExtender>
            <asp:Button ID="HiddenForModel3" Text="" runat="server" CssClass="hide" CausesValidation="False" />
            <table align="center" width="100%">
                <tr>
                    <td align="center" style="width: 10%;">
                        <asp:CheckBox ID="CheckBox_DonrSrchMod" runat="server" Checked="false" AutoPostBack="True"
                            Text="Activate search" meta:resourcekey="CheckBox_DonrSrchRes" Font-Names="Tahoma"
                            Font-Size="11px" ForeColor="#0033CC" Width="100%" />
                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:Button ID="btnDonrSearch" runat="server" CssClass="google-button google-button-blue"
                            meta:resourcekey="btnDonrSearchResource1" Text="Search" Width="100%" ValidationGroup="civilIdValidation"
                            Visible="false" ClientIDMode="Static" UseSubmitBehavior="False"/>
                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:Button ID="CmdSave" runat="server"
                            meta:resourcekey="CmdSaveResource1" ValidationGroup="SaveDonor" Text="Save" Width="100%" ClientIDMode="Static" BackColor="#33CC33" UseSubmitBehavior="False" />
                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:Button ID="btnEnableDonorProfile" runat="server" CssClass="google-button google-button-blue"
                            meta:resourcekey="btnEnableDonorProfileResource1" Text="New Donor" Width="100%" UseSubmitBehavior="False" />
                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:Button ID="CmdClear" runat="server" CssClass="google-button google-button-blue"
                            meta:resourcekey="CmdClearResource1" Text="Clear" Width="100%" ClientIDMode="Static" UseSubmitBehavior="False" />
                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:Button ID="lnkNewReceipt" runat="server" CssClass="google-button google-button-blue"
                            meta:resourcekey="lnkNewReceiptResource1" Text="New Receipt (Insert)" Width="100%" ClientIDMode="Static" UseSubmitBehavior="False"/>
                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:Button ID="Cmd_Col_History" runat="server" CssClass="google-button google-button-blue"
                            meta:resourcekey="Cmd_Col_HistoryResource1" Text="Colection History" Width="100%"
                            OnClientClick="ShowCollectionHistory();" UseSubmitBehavior="False" />
                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:Button ID="Cmd_DonAllocat" runat="server" CssClass="google-button google-button-blue"
                            meta:resourcekey="Cmd_DonAllocatResource1" Text="Donation Allocation" Width="100%" OnClientClick="ShowDonorBeneficiaries();" UseSubmitBehavior="False" />
                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:Button ID="Cmd_Collection" runat="server" CssClass="google-button google-button-blue"
                            meta:resourcekey="Cmd_CollectionResource1" Text="Report" Width="100%" UseSubmitBehavior="False" />
                    </td>
                    <td align="center" style="width: 10%;">
                        <asp:Button ID="Button_Deduction" runat="server" CssClass="google-button google-button-blue"
                            meta:resourcekey="Button_Deduction" Text="Deduction" Width="100%" UseSubmitBehavior="False" />
                    </td>
                </tr>
            </table>
            <table align="center" width="100%">
                <tr>
                    <td class="header-label" align="center">
                        <asp:Label ID="lbl_DonorHeader" Text="Donor Information" runat="server" CssClass="header-label"
                            meta:resourcekey="lbl_DonorHeaderResource1" Width="100%" />
                    </td>
                </tr>
            </table>
            <table align="center" width="100%" cellpadding="3px">
                <tr>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblsaluteDonor" runat="server" for="ddlTitleDonor"
                            Text="Title" meta:resourcekey="lblsaluteDonorRes1"></asp:Label>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:DropDownList ID="ddlTitleDonor" runat="server" CssClass="dropdownlist" DataSourceID="TitleDSDonor"
                            DataTextField="salut_arname" DataValueField="salut_code" meta:resourcekey="ddlTitleDonorResc1"
                            Width="100%">
                        </asp:DropDownList>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblArabicName" runat="server" for="txtArabicName"
                            meta:resourcekey="lblArabicNameResource1" Text="Donor Name Arabic"></asp:Label>
                    </td>
                    <td align="center" colspan="2">
                        <asp:TextBox ID="txtArabicName" runat="server" CssClass="textbox" meta:resourcekey="txtArabicNameResource1"
                            Width="100%"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblEnglishName" runat="server" for="txtDon_nameng"
                            meta:resourcekey="lblEnglishNameResource1" Text="Donor Name English"></asp:Label>
                    </td>
                    <td align="center" colspan="2">
                        <asp:TextBox ID="txtDon_nameng" runat="server" CssClass="textbox" meta:resourcekey="txtDon_namengResource1"
                            Width="100%"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 4%;"></td>
                </tr>
                <tr>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblBehalf" runat="server" for="txtBehaf" meta:resourcekey="txtBehafResc1"
                            Text="Be half Of" Width="100%"></asp:Label>
                    </td>
                    <td align="center" colspan="3" style="width: 32%;">
                        <asp:TextBox ID="txtBehaf" runat="server" CssClass="textbox" BackColor="White" Width="100%"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblLocalphone" runat="server" for="txtLocphone" meta:resourcekey="lblLocalphoneResource1"
                            Text="Local Phone" Width="100%"></asp:Label>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:TextBox ID="txtLocphone" runat="server" CssClass="textbox" Width="100%" meta:resourcekey="txtLocphoneResource1"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblMobile" runat="server" for="txtmob" Width="100%"
                            meta:resourcekey="lblMobileResource2" Text="Mobile Phone"></asp:Label>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:TextBox ID="txtmob" runat="server" CssClass="textbox" Enabled="true" Width="100%"
                            meta:resourcekey="txtMobileResource1"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 4%;"></td>
                </tr>
                <tr>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblDonorId" runat="server" for="txtDonor" meta:resourcekey="lblDonorIdResource1"
                            Text="Donor ID" Width="100%"></asp:Label>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:TextBox ID="txtDonor" runat="server" CssClass="textbox" Enabled="False" meta:resourcekey="txtDonorResource1"
                            Width="100%" ClientIDMode="Static"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="ddlDonorType" runat="server" for="ddlDonr_tp" meta:resourcekey="ddlDonorTypeResource1"
                            Text="Donor Type" Width="100%"></asp:Label>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:DropDownList ID="ddlDonr_tp" runat="server" CssClass="dropdownlist" meta:resourcekey="ddlDonr_tpResource1"
                            Width="100%">
                            <asp:ListItem meta:resourcekey="ListItemResource2" Text="Individual" Value="1"></asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource3" Text="Company" Value="2"></asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource4" Text="Charity Org" Value="3"></asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource5" Text="Ministry" Value="4"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblPhone4" runat="server" for="txtphone3" meta:resourcekey="lblPhone4Resource1"
                            Text="Other Phone" Width="100%"></asp:Label>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:TextBox ID="txtphone" runat="server" CssClass="textbox" meta:resourcekey="txtphone3Resource1"
                            Width="100%"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblPreviousId" runat="server" for="txtPrvId" meta:resourcekey="lblPreviousIdResource1"
                            Text="Previous ID" Width="100%"></asp:Label>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:TextBox ID="txtPrvId" runat="server" CssClass="textbox" meta:resourcekey="txtPrvIdResource1"
                            Width="100%"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 4%;"></td>
                </tr>
                <tr>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblCivilId0" runat="server" for="txtCivilid" meta:resourcekey="lblCivilIdResource1"
                            Text="Civil ID"></asp:Label>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:TextBox ID="txtCivilid" runat="server" CssClass="textbox" Width="100%" meta:resourcekey="txtCivilidResource1"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblGendar" runat="server" for="ddlGender" meta:resourcekey="lblGendarResource1"
                            Text="Gender" Width="100px"></asp:Label>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="dropdownlist" meta:resourcekey="ddlGenderResource1"
                            Width="100%">
                            <asp:ListItem meta:resourcekey="ListItemResource6" Text="Select Gender Type" Value="0" Selected="True"></asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource7" Text="Male" Value="1"></asp:ListItem>
                            <asp:ListItem meta:resourcekey="ListItemResource8" Text="Female" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblEmail" runat="server" for="txtEmail" meta:resourcekey="lblEmailResource1"
                            Text="Email" Width="100%"></asp:Label>
                    </td>
                    <td align="center" colspan="2">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" meta:resourcekey="txtEmailResource1"
                            Width="100%"></asp:TextBox>
                        <%--<asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="*"></asp:RegularExpressionValidator>--%>
                    </td>
                    <td align="center" style="width: 12%;">
                        <%--<asp:CustomValidator ID="civilIdValidatorDnr" runat="server" ClientValidationFunction="CivilIdValidate" ControlToValidate="txtCivilid" Display="Dynamic" ErrorMessage="Invalid Civil ID" Font-Size="9pt" ForeColor="Red" meta:resourcekey="civilIdValidatorResource1" ValidationGroup="SaveDonor"></asp:CustomValidator>--%>
                        <asp:CheckBox ID="SMSEnabled" runat="server" Checked="true" Font-Bold="True" Font-Names="Tahoma" Font-Size="11px" Text="ارسال رسائل قصيره" Width="100%" />
                    </td>
                    <td align="center" style="width: 4%;"></td>
                </tr>
                <tr>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblCommunication" runat="server" for="ddlLang" meta:resourcekey="lblCommunicationResource1"
                            Text="Communication Language" Width="100%"></asp:Label>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:DropDownList ID="ddlLang" runat="server" CssClass="dropdownlist" Width="100%"
                            DataSourceID="LangDS" DataTextField="lang_descrar" DataValueField="lang_code"
                            meta:resourcekey="ddlLangResource1">
                        </asp:DropDownList>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblJob" runat="server" for="ddlJob" meta:resourcekey="lblJobResource1"
                            Text="Job Information" Width="100%"></asp:Label>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:DropDownList ID="ddlJob" runat="server" CssClass="dropdownlist" DataSourceID="JobDS"
                            DataTextField="job_descrar" DataValueField="job_code" meta:resourcekey="ddlJobResource1"
                            Width="100%">
                        </asp:DropDownList>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblNationality" runat="server" for="ddlNat" meta:resourcekey="lblNationalityResource1"
                            Text="Nationality" Width="100%"></asp:Label>
                    </td>
                    <td align="center" style="width: 12%;">
                        <asp:DropDownList ID="ddlNat" runat="server" CssClass="dropdownlist" DataSourceID="NatDS"
                            DataTextField="nat_descrar" DataValueField="nat_code" meta:resourcekey="ddlNatResource1"
                            Width="100%">
                        </asp:DropDownList>
                    </td>
                    <td align="center" style="width: 12%;">
                        <%-- <asp:LinkButton ID="lbtnMoreInfo" runat="server" 
                                meta:resourcekey="lbtnMoreInfoResource1" Text="More Information"></asp:LinkButton>--%>
                        <dx1:ASPxButton ID="ASPxButton_PrintStatementSummary" runat="server" AutoPostBack="true" ClientInstanceName="ASPxButton_PrintStatementSummary" EnableClientSideAPI="True" Font-Bold="True" Text="كشف حساب مختصر" ValidationGroup="print" Width="100%" UseSubmitBehavior="False">
                            <Image Url="~/Images/Print_16x16.png">
                            </Image>
                        </dx1:ASPxButton>
                    </td>
                    <td align="center" style="width: 12%;">
                        <dx1:ASPxButton ID="ASPxButton_Print" runat="server" AutoPostBack="true"
                            ClientInstanceName="ASPxButton_Print" EnableClientSideAPI="True"
                            Font-Bold="True" Text="كشف حساب" ValidationGroup="print" Width="100%" UseSubmitBehavior="False">
                            <Image Url="~/Images/Print_16x16.png">
                            </Image>
                        </dx1:ASPxButton>
                    </td>
                    <td align="center" style="width: 4%;"></td>
                </tr>
                <tr>
                    <td align="center" style="width: 12%;">
                        <asp:Label ID="lblDescr" runat="server" for="txtdescr" meta:resourcekey="lblDescrResource1" Text="Description" Width="100%"></asp:Label>
                    </td>
                    <td align="center" colspan="5">
                        <asp:TextBox ID="txtdescr" runat="server" CssClass="textbox" meta:resourcekey="txtdescrResource1" Width="99%"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 12%;">
                        <dx:ASPxLabel ID="ASPxLabel55" runat="server" Text="اهميه المتبرع" Width="100%">
                        </dx:ASPxLabel>
                    </td>
                    <td align="center" style="width: 12%;">
                        <dx:ASPxComboBox ID="DonorImportanceID" runat="server" DataSourceID="SqlDataSource_DonorImportance" 
                            TextField="NameAr" ValueField="ID" ValueType="System.Int16" Width="100%">
                            <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="Save">
                                <RequiredField ErrorText="" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    </td>
                    <td align="center" style="width: 4%;">&nbsp;</td>
                </tr>
                <tr>
                    <td align="center" style="width: 12%;">
                        &nbsp;</td>
                    <td align="center" colspan="7">
                        &nbsp;</td>
                    <td align="center" style="width: 4%;"></td>
                </tr>
            </table>
            <asp:Panel ID="pnlMoreInfo" runat="server" meta:resourcekey="pnlMoreInfoResource1">
                <table align="center" width="100%">
                    <tr>
                        <td class="header-label" align="center">
                            <asp:Label ID="Label34" runat="server" CssClass="header-label" meta:resourcekey="Label34Resource1"
                                Text="Address Information" Width="100%"></asp:Label>
                        </td>
                    </tr>
                </table>
                <table align="center" width="100%" cellpadding="3px">
                    <tr>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="lblArea" runat="server" for="ddlAreadcd" meta:resourcekey="lblAreaResource1" Text="Area Code" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:DropDownList ID="ddlAreadcd" runat="server" DataSourceID="SqlDataSource4" DataTextField="area_codeara" DataValueField="area_code" meta:resourcekey="ddlAreadcdResource1" Width="100%">
                            </asp:DropDownList>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="lblblk" runat="server" for="txtBlkNo" meta:resourcekey="lblblkResource1" Text="Block No" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:TextBox ID="txtBlkNo" runat="server" CssClass="textbox" meta:resourcekey="txtBlkNoResource1" Width="100%"></asp:TextBox>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="lblStreetNm" runat="server" for="txtstreet" meta:resourcekey="lblStreetNmResource1" Text="Street Name" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:TextBox ID="txtstreet" runat="server" CssClass="textbox" meta:resourcekey="txtstreetResource1" Width="100%"></asp:TextBox>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="lblGaddah" runat="server" for="txtGaddah" meta:resourcekey="lblGaddahResource1" Text="Gaddah No" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:TextBox ID="txtGaddah" runat="server" CssClass="textbox" meta:resourcekey="txtGaddahResource1" Width="100%"></asp:TextBox>
                        </td>
                        <td align="center" style="width: 4%;"></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="lblbuildNo" runat="server" For="txtBuild" meta:resourcekey="lblbuildNoResource1" Text="Building No" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:TextBox ID="txtBuild" runat="server" CssClass="textbox" meta:resourcekey="txtBuildResource1" Width="100%"></asp:TextBox>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="lblUnit" runat="server" For="txtUnit" meta:resourcekey="lblUnitResource1" Text="Unit No" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:TextBox ID="txtUnit" runat="server" CssClass="textbox" meta:resourcekey="txtUnitResource1" Width="100%"></asp:TextBox>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="lblAddress" runat="server" for="txtAdress" meta:resourcekey="lblAddressResource1" Text="Address" Width="100%"></asp:Label>
                        </td>
                        <td align="center" colspan="3">
                            <asp:TextBox ID="txtAdress" runat="server" CssClass="textbox" meta:resourcekey="txtAdressResource1" Width="100%"></asp:TextBox>
                        </td>
                        <td align="center" style="width: 4%;"></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="lblPobox" runat="server" for="txtPObox" meta:resourcekey="lblPoboxResource1" Text="P.O. Box" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:TextBox ID="txtPObox" runat="server" CssClass="textbox" meta:resourcekey="txtPOboxResource1" Width="100%"></asp:TextBox>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="lblZip" runat="server" for="txtzip" meta:resourcekey="lblZipResource1" Text="Zip Code" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:TextBox ID="txtzip" runat="server" CssClass="textbox" meta:resourcekey="txtzipResource1" Width="100%"></asp:TextBox>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="ddlResidency" runat="server" for="ddlResident" meta:resourcekey="ddlResidencyResource1" Text="Residency" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:DropDownList ID="ddlResident" runat="server" CssClass="dropdownlist" DataSourceID="NatDS" DataTextField="nat_descrar" DataValueField="nat_code" meta:resourcekey="ddlResidentResource1" Width="100%">
                            </asp:DropDownList>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="lblWork" runat="server" for="ddlWork" meta:resourcekey="lblWorkResource1" Text="Work Place" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:DropDownList ID="ddlWork" runat="server" CssClass="dropdownlist" DataSourceID="WorkDS" DataTextField="work_descrar" DataValueField="work_code" meta:resourcekey="ddlWorkResource1" Width="100%">
                            </asp:DropDownList>
                        </td>
                        <td align="center" style="width: 4%;"></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="lblMethodToSendReport" runat="server"  meta:resourcekey="lblMethodToSendReportResource1" 
                                Text="وسيلة ارسال التقرير" Width="100%"></asp:Label>
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:DropDownList ID="cmbMethodsToSendReports" runat="server" AutoPostBack="True" Width="99%">
                            </asp:DropDownList>
                            <asp:HiddenField ID="HiddenFieldSendReport" runat="server" />
                        </td>
                        <td align="center" style="width: 12%;">
                            <asp:Label ID="lblSendReportBy" runat="server" meta:resourcekey="lblSendReportByResource1" Text="يرسل عن طريق" Width="100%"></asp:Label>
                        </td>
                        <td align="center" colspan="2">
                            <asp:TextBox ID="txtSendBy" runat="server" CssClass="textbox" meta:resourcekey="txtPOboxResource1" Width="100%"></asp:TextBox>
                        </td>
                        <td align="center" style="width: 12%;">اخر تعديل للوسيلة بواسطة</td>
                        <td align="center" style="width: 12%;">
                            <dx:ASPxTextBox ID="txtMethodToSendReportByUser" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                                <ReadOnlyStyle BackColor="Silver">
                                </ReadOnlyStyle>
                            </dx:ASPxTextBox>
                        </td>
                        <td align="center" style="width: 12%;">
                            <dx:ASPxTextBox ID="txtMethodToSendReportDate" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                                <ReadOnlyStyle BackColor="Silver">
                                </ReadOnlyStyle>
                            </dx:ASPxTextBox>
                        </td>
                        <td align="center" style="width: 4%;">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 12%;">
                            <dx:ASPxLabel ID="ASPxLabel51" runat="server" Text="الاضافه بواسطه" Width="100%">
                            </dx:ASPxLabel>
                        </td>
                        <td align="center" style="width: 12%;">
                            <dx:ASPxTextBox ID="insert_userid" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                                <ReadOnlyStyle BackColor="Silver">
                                </ReadOnlyStyle>
                            </dx:ASPxTextBox>
                        </td>
                        <td align="center" class="auto-style1">
                            <dx:ASPxLabel ID="ASPxLabel52" runat="server" Text="وقت الاضافه" Width="100%">
                            </dx:ASPxLabel>
                        </td>
                        <td align="center" style="width: 12%;">
                            <dx:ASPxTextBox ID="insert_date" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                                <ReadOnlyStyle BackColor="Silver">
                                </ReadOnlyStyle>
                            </dx:ASPxTextBox>
                        </td>
                        <td align="center" style="width: 12%;">
                            <dx:ASPxLabel ID="ASPxLabel53" runat="server" Text="اخر تعديل بواسطه" Width="100%">
                            </dx:ASPxLabel>
                        </td>
                        <td align="center" style="width: 12%;">
                            <dx:ASPxTextBox ID="last_update_userid" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                                <ReadOnlyStyle BackColor="Silver">
                                </ReadOnlyStyle>
                            </dx:ASPxTextBox>
                        </td>
                        <td align="center" style="width: 12%;">
                            <dx:ASPxLabel ID="ASPxLabel54" runat="server" Text="وقت التعديل" Width="100%">
                            </dx:ASPxLabel>
                        </td>
                        <td align="center" style="width: 12%;">
                            <dx:ASPxTextBox ID="last_update_date" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                                <ReadOnlyStyle BackColor="Silver">
                                </ReadOnlyStyle>
                            </dx:ASPxTextBox>
                        </td>
                        <td align="center" style="width: 4%;">&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <%--<asp:CollapsiblePanelExtender ID="pnlMoreInfo_CollapsiblePanelExtender" runat="server"
                    Enabled="True" TargetControlID="pnlMoreInfo" CollapseControlID="lbtnMoreInfo"
                    ExpandControlID="lbtnMoreInfo" Collapsed="True" CollapsedText="More Information"
                    ExpandedText="Less Information">
                </asp:CollapsiblePanelExtender>--%>
            <asp:Panel ID="pnlDonationSearch" CssClass="modal" Style="display: none;" runat="server">
                <div class="modal-header header-label">
                    <asp:Label ID="lblDonationSearchHeader" runat="server" CssClass="header-label" Text="Search Result"
                        meta:resourcekey="lblDonationSearchHeaderResource1"></asp:Label>
                </div>
                <div class="modal-body">
                    <%--                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            DataKeyNames="reciept_num" DataSourceID="GrdDs" ShowFooter="True" meta:resourcekey="GridView1Resource1"
                            BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue" CellPadding="0"
                            Font-Name="tahoma" Font-Size="8pt" ForeColor="DarkBlue" HeaderStyle-BackColor="#aaaadd"
                            GridLines="None" Width="677px" Font-Names="tahoma">
                            <Columns>
                                <asp:TemplateField HeaderText="Reciept#" InsertVisible="False" SortExpression="reciept_num"
                                    meta:resourcekey="TemplateFieldResource1">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="lnkReceiptId" runat="server" Text='<%# Eval("reciept_num") %>'
                                            NavigateUrl='<%# Eval("reciept_num","~/Collection.aspx?ReceiptID={0}") %>' meta:resourcekey="lnkReceiptIdResource1"></asp:HyperLink>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("reciept_num") %>' meta:resourcekey="Label1Resource1"></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="reciept_num_manual" HeaderText="Reciept Manual#" SortExpression="reciept_num_manual"
                                    meta:resourcekey="BoundFieldResource1" />
                                <asp:BoundField DataField="reciept_date" HeaderText="Date " SortExpression="reciept_date"
                                    DataFormatString="{0:dd/MM/yyyy}" meta:resourcekey="BoundFieldResource2"></asp:BoundField>
                                <asp:BoundField DataField="total_amount" HeaderText="Amount   " SortExpression="total_amount "
                                    DataFormatString="{0:N3}" meta:resourcekey="BoundFieldResource3" />
                                <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks"
                                    meta:resourcekey="BoundFieldResource4" />
                                <asp:BoundField DataField="campaign_descrar" HeaderText="Campaign Arabic" SortExpression="campaign_descrar"
                                    meta:resourcekey="BoundFieldResource5" />
                                <asp:BoundField DataField="campaign_desceng" HeaderText="Campaign English" SortExpression="campaign_desceng"
                                    meta:resourcekey="BoundFieldResource6" />
                                <asp:BoundField DataField="currency_descrar" HeaderText="Currency Arabic" SortExpression="currency_descrar"
                                    meta:resourcekey="BoundFieldResource9" />
                                <asp:BoundField DataField="currency_desceng" HeaderText="Currency English" SortExpression="currency_desceng"
                                    meta:resourcekey="BoundFieldResource10" />
                            </Columns>
                            <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                                Height="25px" HorizontalAlign="Center" />
                            <AlternatingRowStyle BackColor="AliceBlue"></AlternatingRowStyle>
                            <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                            <SelectedRowStyle BackColor="Ivory" Font-Bold="False" ForeColor="DeepPink" Font-Italic="False"
                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></SelectedRowStyle>
                            <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue"
                                Height="35px" HorizontalAlign="Center" />
                            <FooterStyle HorizontalAlign="Center"></FooterStyle>
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="GrdDs" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                            OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT donation_tran.reciept_num, donation_tran.reciept_num_manual, donation_tran.reciept_date, donation_tran.total_amount, donation_tran.remarks, campaign_tab.campaign_descrar, campaign_tab.campaign_desceng, currency_tab.currency_descrar, currency_tab.currency_desceng, donation_tran.donor_id FROM donation_tran LEFT OUTER JOIN currency_tab ON donation_tran.currency_code = currency_tab.currency_code LEFT OUTER JOIN campaign_tab ON donation_tran.campaign_code = campaign_tab.campaign_code WHERE (donation_tran.donor_id = @donor_id) and 
(donation_tran.void&lt;&gt;2)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [donor_data] WHERE [donor_id] = @original_donor_id AND (([donor_namear] = @original_donor_namear) OR ([donor_namear] IS NULL AND @original_donor_namear IS NULL)) AND (([donor_nameen] = @original_donor_nameen) OR ([donor_nameen] IS NULL AND @original_donor_nameen IS NULL)) AND (([donor_civilid] = @original_donor_civilid) OR ([donor_civilid] IS NULL AND @original_donor_civilid IS NULL)) AND (([donor_gender] = @original_donor_gender) OR ([donor_gender] IS NULL AND @original_donor_gender IS NULL)) AND (([donor_nat] = @original_donor_nat) OR ([donor_nat] IS NULL AND @original_donor_nat IS NULL)) AND (([donor_residency] = @original_donor_residency) OR ([donor_residency] IS NULL AND @original_donor_residency IS NULL)) AND (([primary_phone] = @original_primary_phone) OR ([primary_phone] IS NULL AND @original_primary_phone IS NULL)) AND (([phone_2] = @original_phone_2) OR ([phone_2] IS NULL AND @original_phone_2 IS NULL)) AND (([phone_3] = @original_phone_3) OR ([phone_3] IS NULL AND @original_phone_3 IS NULL)) AND (([address_text] = @original_address_text) OR ([address_text] IS NULL AND @original_address_text IS NULL)) AND (([po_box] = @original_po_box) OR ([po_box] IS NULL AND @original_po_box IS NULL)) AND (([zip_code] = @original_zip_code) OR ([zip_code] IS NULL AND @original_zip_code IS NULL)) AND (([area_code] = @original_area_code) OR ([area_code] IS NULL AND @original_area_code IS NULL)) AND (([block_num] = @original_block_num) OR ([block_num] IS NULL AND @original_block_num IS NULL)) AND (([gadda_h] = @original_gadda_h) OR ([gadda_h] IS NULL AND @original_gadda_h IS NULL)) AND (([street_name] = @original_street_name) OR ([street_name] IS NULL AND @original_street_name IS NULL)) AND (([building_num] = @original_building_num) OR ([building_num] IS NULL AND @original_building_num IS NULL)) AND (([unit_num] = @original_unit_num) OR ([unit_num] IS NULL AND @original_unit_num IS NULL)) AND (([communication_lang] = @original_communication_lang) OR ([communication_lang] IS NULL AND @original_communication_lang IS NULL)) AND (([general_remarks] = @original_general_remarks) OR ([general_remarks] IS NULL AND @original_general_remarks IS NULL)) AND (([work_place] = @original_work_place) OR ([work_place] IS NULL AND @original_work_place IS NULL)) AND (([job_title] = @original_job_title) OR ([job_title] IS NULL AND @original_job_title IS NULL)) AND (([donor_prev_id] = @original_donor_prev_id) OR ([donor_prev_id] IS NULL AND @original_donor_prev_id IS NULL)) AND (([comp_indv] = @original_comp_indv) OR ([comp_indv] IS NULL AND @original_comp_indv IS NULL))"
                            InsertCommand="INSERT INTO [donor_data] ([donor_id], [donor_namear], [donor_nameen], [donor_civilid], [donor_gender], [donor_nat], [donor_residency], [primary_phone], [phone_2], [phone_3], [address_text], [po_box], [zip_code], [area_code], [block_num], [gadda_h], [street_name], [building_num], [unit_num], [communication_lang], [general_remarks], [work_place], [job_title], [donor_prev_id], [comp_indv]) VALUES (@donor_id, @donor_namear, @donor_nameen, @donor_civilid, @donor_gender, @donor_nat, @donor_residency, @primary_phone, @phone_2, @phone_3, @address_text, @po_box, @zip_code, @area_code, @block_num, @gadda_h, @street_name, @building_num, @unit_num, @communication_lang, @general_remarks, @work_place, @job_title, @donor_prev_id, @comp_indv)"
                            UpdateCommand="UPDATE [donor_data] SET [donor_namear] = @donor_namear, [donor_nameen] = @donor_nameen, [donor_civilid] = @donor_civilid, [donor_gender] = @donor_gender, [donor_nat] = @donor_nat, [donor_residency] = @donor_residency, [primary_phone] = @primary_phone, [phone_2] = @phone_2, [phone_3] = @phone_3, [address_text] = @address_text, [po_box] = @po_box, [zip_code] = @zip_code, [area_code] = @area_code, [block_num] = @block_num, [gadda_h] = @gadda_h, [street_name] = @street_name, [building_num] = @building_num, [unit_num] = @unit_num, [communication_lang] = @communication_lang, [general_remarks] = @general_remarks, [work_place] = @work_place, [job_title] = @job_title, [donor_prev_id] = @donor_prev_id, [comp_indv] = @comp_indv,[donor_email]=@donor_email,[salut_code]=@salut_code WHERE [donor_id] = @original_donor_id AND (([donor_namear] = @original_donor_namear) OR ([donor_namear] IS NULL AND @original_donor_namear IS NULL)) AND (([donor_nameen] = @original_donor_nameen) OR ([donor_nameen] IS NULL AND @original_donor_nameen IS NULL)) AND (([donor_civilid] = @original_donor_civilid) OR ([donor_civilid] IS NULL AND @original_donor_civilid IS NULL)) AND (([donor_gender] = @original_donor_gender) OR ([donor_gender] IS NULL AND @original_donor_gender IS NULL)) AND (([donor_nat] = @original_donor_nat) OR ([donor_nat] IS NULL AND @original_donor_nat IS NULL)) AND (([donor_residency] = @original_donor_residency) OR ([donor_residency] IS NULL AND @original_donor_residency IS NULL)) AND (([primary_phone] = @original_primary_phone) OR ([primary_phone] IS NULL AND @original_primary_phone IS NULL)) AND (([phone_2] = @original_phone_2) OR ([phone_2] IS NULL AND @original_phone_2 IS NULL)) AND (([phone_3] = @original_phone_3) OR ([phone_3] IS NULL AND @original_phone_3 IS NULL)) AND (([address_text] = @original_address_text) OR ([address_text] IS NULL AND @original_address_text IS NULL)) AND (([po_box] = @original_po_box) OR ([po_box] IS NULL AND @original_po_box IS NULL)) AND (([zip_code] = @original_zip_code) OR ([zip_code] IS NULL AND @original_zip_code IS NULL)) AND (([area_code] = @original_area_code) OR ([area_code] IS NULL AND @original_area_code IS NULL)) AND (([block_num] = @original_block_num) OR ([block_num] IS NULL AND @original_block_num IS NULL)) AND (([gadda_h] = @original_gadda_h) OR ([gadda_h] IS NULL AND @original_gadda_h IS NULL)) AND (([street_name] = @original_street_name) OR ([street_name] IS NULL AND @original_street_name IS NULL)) AND (([building_num] = @original_building_num) OR ([building_num] IS NULL AND @original_building_num IS NULL)) AND (([unit_num] = @original_unit_num) OR ([unit_num] IS NULL AND @original_unit_num IS NULL)) AND (([communication_lang] = @original_communication_lang) OR ([communication_lang] IS NULL AND @original_communication_lang IS NULL)) AND (([general_remarks] = @original_general_remarks) OR ([general_remarks] IS NULL AND @original_general_remarks IS NULL)) AND (([work_place] = @original_work_place) OR ([work_place] IS NULL AND @original_work_place IS NULL)) AND (([job_title] = @original_job_title) OR ([job_title] IS NULL AND @original_job_title IS NULL)) AND (([donor_prev_id] = @original_donor_prev_id) OR ([donor_prev_id] IS NULL AND @original_donor_prev_id IS NULL)) AND (([comp_indv] = @original_comp_indv) OR ([comp_indv] IS NULL AND @original_comp_indv IS NULL ))">
                            <DeleteParameters>
                                <asp:Parameter Name="original_donor_id" Type="Int32" />
                                <asp:Parameter Name="original_donor_namear" Type="String" />
                                <asp:Parameter Name="original_donor_nameen" Type="String" />
                                <asp:Parameter Name="original_donor_civilid" Type="String" />
                                <asp:Parameter Name="original_donor_gender" Type="Byte" />
                                <asp:Parameter Name="original_donor_nat" Type="Int16" />
                                <asp:Parameter Name="original_donor_residency" Type="Int16" />
                                <asp:Parameter Name="original_primary_phone" Type="String" />
                                <asp:Parameter Name="original_phone_2" Type="String" />
                                <asp:Parameter Name="original_phone_3" Type="String" />
                                <asp:Parameter Name="original_address_text" Type="String" />
                                <asp:Parameter Name="original_po_box" Type="String" />
                                <asp:Parameter Name="original_zip_code" Type="String" />
                                <asp:Parameter Name="original_area_code" Type="Byte" />
                                <asp:Parameter Name="original_block_num" Type="String" />
                                <asp:Parameter Name="original_gadda_h" Type="String" />
                                <asp:Parameter Name="original_street_name" Type="String" />
                                <asp:Parameter Name="original_building_num" Type="String" />
                                <asp:Parameter Name="original_unit_num" Type="String" />
                                <asp:Parameter Name="original_communication_lang" Type="Byte" />
                                <asp:Parameter Name="original_general_remarks" Type="String" />
                                <asp:Parameter Name="original_work_place" Type="Int16" />
                                <asp:Parameter Name="original_job_title" Type="Int16" />
                                <asp:Parameter Name="original_donor_prev_id" Type="String" />
                                <asp:Parameter Name="original_comp_indv" Type="Byte" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="donor_id" Type="Int32" />
                                <asp:Parameter Name="donor_namear" Type="String" />
                                <asp:Parameter Name="donor_nameen" Type="String" />
                                <asp:Parameter Name="donor_civilid" Type="String" />
                                <asp:Parameter Name="donor_gender" Type="Byte" />
                                <asp:Parameter Name="donor_nat" Type="Int16" />
                                <asp:Parameter Name="donor_residency" Type="Int16" />
                                <asp:Parameter Name="primary_phone" Type="String" />
                                <asp:Parameter Name="phone_2" Type="String" />
                                <asp:Parameter Name="phone_3" Type="String" />
                                <asp:Parameter Name="address_text" Type="String" />
                                <asp:Parameter Name="po_box" Type="String" />
                                <asp:Parameter Name="zip_code" Type="String" />
                                <asp:Parameter Name="area_code" Type="Byte" />
                                <asp:Parameter Name="block_num" Type="String" />
                                <asp:Parameter Name="gadda_h" Type="String" />
                                <asp:Parameter Name="street_name" Type="String" />
                                <asp:Parameter Name="building_num" Type="String" />
                                <asp:Parameter Name="unit_num" Type="String" />
                                <asp:Parameter Name="communication_lang" Type="Byte" />
                                <asp:Parameter Name="general_remarks" Type="String" />
                                <asp:Parameter Name="work_place" Type="Int16" />
                                <asp:Parameter Name="job_title" Type="Int16" />
                                <asp:Parameter Name="donor_prev_id" Type="String" />
                                <asp:Parameter Name="comp_indv" Type="Byte" />
                            </InsertParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="donor_id" QueryStringField="DonorId" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="donor_namear" Type="String" />
                                <asp:Parameter Name="donor_nameen" Type="String" />
                                <asp:Parameter Name="donor_civilid" Type="String" />
                                <asp:Parameter Name="donor_gender" Type="Byte" />
                                <asp:Parameter Name="donor_nat" Type="Int16" />
                                <asp:Parameter Name="donor_residency" Type="Int16" />
                                <asp:Parameter Name="primary_phone" Type="String" />
                                <asp:Parameter Name="phone_2" Type="String" />
                                <asp:Parameter Name="phone_3" Type="String" />
                                <asp:Parameter Name="address_text" Type="String" />
                                <asp:Parameter Name="po_box" Type="String" />
                                <asp:Parameter Name="zip_code" Type="String" />
                                <asp:Parameter Name="area_code" Type="Byte" />
                                <asp:Parameter Name="block_num" Type="String" />
                                <asp:Parameter Name="gadda_h" Type="String" />
                                <asp:Parameter Name="street_name" Type="String" />
                                <asp:Parameter Name="building_num" Type="String" />
                                <asp:Parameter Name="unit_num" Type="String" />
                                <asp:Parameter Name="communication_lang" Type="Byte" />
                                <asp:Parameter Name="general_remarks" Type="String" />
                                <asp:Parameter Name="work_place" Type="Int16" />
                                <asp:Parameter Name="job_title" Type="Int16" />
                                <asp:Parameter Name="donor_prev_id" Type="String" />
                                <asp:Parameter Name="comp_indv" Type="Byte" />
                                <asp:Parameter Name="donor_email" Type="string" />
                                <asp:Parameter Name="salut_code" Type="Byte" />
                                <asp:Parameter Name="original_donor_id" Type="Int32" />
                                <asp:Parameter Name="original_donor_namear" Type="String" />
                                <asp:Parameter Name="original_donor_nameen" Type="String" />
                                <asp:Parameter Name="original_donor_civilid" Type="String" />
                                <asp:Parameter Name="original_donor_gender" Type="Byte" />
                                <asp:Parameter Name="original_donor_nat" Type="Int16" />
                                <asp:Parameter Name="original_donor_residency" Type="Int16" />
                                <asp:Parameter Name="original_primary_phone" Type="String" />
                                <asp:Parameter Name="original_phone_2" Type="String" />
                                <asp:Parameter Name="original_phone_3" Type="String" />
                                <asp:Parameter Name="original_address_text" Type="String" />
                                <asp:Parameter Name="original_po_box" Type="String" />
                                <asp:Parameter Name="original_zip_code" Type="String" />
                                <asp:Parameter Name="original_area_code" Type="Byte" />
                                <asp:Parameter Name="original_block_num" Type="String" />
                                <asp:Parameter Name="original_gadda_h" Type="String" />
                                <asp:Parameter Name="original_street_name" Type="String" />
                                <asp:Parameter Name="original_building_num" Type="String" />
                                <asp:Parameter Name="original_unit_num" Type="String" />
                                <asp:Parameter Name="original_communication_lang" Type="Byte" />
                                <asp:Parameter Name="original_general_remarks" Type="String" />
                                <asp:Parameter Name="original_work_place" Type="Int16" />
                                <asp:Parameter Name="original_job_title" Type="Int16" />
                                <asp:Parameter Name="original_donor_prev_id" Type="String" />
                                <asp:Parameter Name="original_comp_indv" Type="Byte" />
                            </UpdateParameters>
                        </asp:SqlDataSource>--%>
                    <br />
                    <table>
                    </table>
                    <asp:GridView ID="GrdInstrcut" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        DataKeyNames="ref_numb" DataSourceID="Dsinstruct" ForeColor="#333333" GridLines="None"
                        BorderColor="LightSteelBlue">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="ref_numb" HeaderText="رقم المرجع" ReadOnly="True" SortExpression="ref_numb">
                                <HeaderStyle BackColor="#336699" Font-Names="Tahoma" Font-Size="X-Small" />
                                <ItemStyle Font-Size="Smaller" ForeColor="#003366" />
                            </asp:BoundField>
                            <asp:BoundField DataField="instruct_date" DataFormatString="{0:dd/MM/yyyy}" HeaderText="التاريخ"
                                SortExpression="instruct_date">
                                <HeaderStyle BackColor="#336699" Font-Names="Tahoma" Font-Size="X-Small" />
                                <ItemStyle Font-Size="Smaller" ForeColor="#003366" />
                            </asp:BoundField>
                            <asp:BoundField DataField="donor_id" HeaderText="المانحة" SortExpression="donor_id">
                                <HeaderStyle BackColor="#336699" Font-Names="Tahoma" Font-Size="X-Small" />
                                <ItemStyle Font-Size="Smaller" ForeColor="#003366" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bank_ar_name" HeaderText="بنك" SortExpression="bank_ar_name">
                                <HeaderStyle BackColor="#336699" Font-Size="Smaller" />
                                <ItemStyle Font-Size="Smaller" ForeColor="#003366" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bank_ref_num" HeaderText="الرقم المرجعي" SortExpression="bank_ref_num">
                                <HeaderStyle BackColor="#336699" Font-Names="Tahoma" Font-Size="X-Small" />
                                <ItemStyle Font-Size="Smaller" ForeColor="#003366" />
                            </asp:BoundField>
                            <asp:BoundField DataField="start_date" DataFormatString="{0:dd/MM/yyyy}" HeaderText="بداية"
                                SortExpression="start_date">
                                <HeaderStyle BackColor="#336699" Font-Names="Tahoma" Font-Size="X-Small" />
                                <ItemStyle Font-Size="Smaller" ForeColor="#003366" />
                            </asp:BoundField>
                            <asp:BoundField DataField="end_date" DataFormatString="{0:dd/MM/yyyy}" HeaderText="نهاية"
                                SortExpression="end_date">
                                <HeaderStyle BackColor="#336699" Font-Names="Tahoma" Font-Size="X-Small" />
                                <ItemStyle Font-Size="Smaller" ForeColor="#003366" />
                            </asp:BoundField>
                            <asp:BoundField DataField="total_deduct_value" HeaderText="إجمالي" SortExpression="total_deduct_value">
                                <HeaderStyle BackColor="#336699" Font-Names="Tahoma" Font-Size="X-Small" />
                                <ItemStyle Font-Size="Smaller" ForeColor="#003366" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                    </asp:GridView>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnCloseDonationSearch" Text="Close" CssClass="google-button google-button-blue"
                        runat="server" meta:resourcekey="btnCloseDonationSearchResource1" />
                </div>
            </asp:Panel>
            <ajaxToolkit:ModalPopupExtender ID="pnlDonationSearch_ModalPopupExtender" runat="server"
                DynamicServicePath="" Enabled="True" TargetControlID="HiddenForModelSearch" PopupControlID="pnlDonationSearch"
                BackgroundCssClass="ModalBackground" DropShadow="True" CancelControlID="btnCloseDonationSearch"
                RepositionMode="RepositionOnWindowResizeAndScroll">
            </ajaxToolkit:ModalPopupExtender>
            <asp:Button ID="HiddenForModelSearch" Text="" runat="server" CssClass="hide" CausesValidation="False" />
            <asp:SqlDataSource ID="SqlDataSource_DonorImportance" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [DonorImportance]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceMethodsToSendReports" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [MethodsToSendReports]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [banks_list]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DonorSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" InsertCommand="donor_data_Insert" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [donor_data] WHERE ([donor_id] = @donor_id)" UpdateCommand="donor_data_Update" UpdateCommandType="StoredProcedure">
                <InsertParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter Direction="InputOutput" Name="donor_id" Type="Int32" />
                    <asp:Parameter Name="donor_namear" Type="String" />
                    <asp:Parameter Name="donor_nameen" Type="String" />
                    <asp:Parameter Name="donor_gender" Type="Byte" />
                    <asp:Parameter Name="donor_nat" Type="Int16" />
                    <asp:Parameter Name="donor_civilid" Type="String" />
                    <asp:Parameter Name="donor_residency" Type="Int16" />
                    <asp:Parameter Name="primary_phone" Type="String" />
                    <asp:Parameter Name="phone_2" Type="String" />
                    <asp:Parameter Name="phone_3" Type="String" />
                    <asp:Parameter Name="address_text" Type="String" />
                    <asp:Parameter Name="po_box" Type="String" />
                    <asp:Parameter Name="zip_code" Type="String" />
                    <asp:Parameter Name="area_code" Type="Byte" />
                    <asp:Parameter Name="block_num" Type="String" />
                    <asp:Parameter Name="gadda_h" Type="String" />
                    <asp:Parameter Name="street_name" Type="String" />
                    <asp:Parameter Name="building_num" Type="String" />
                    <asp:Parameter Name="unit_num" Type="String" />
                    <asp:Parameter Name="communication_lang" Type="Byte" />
                    <asp:Parameter Name="general_remarks" Type="String" />
                    <asp:Parameter Name="work_place" Type="Int16" />
                    <asp:Parameter Name="job_title" Type="Int16" />
                    <asp:Parameter Name="donor_prev_id" Type="String" />
                    <asp:Parameter Name="comp_indv" Type="Byte" />
                    <asp:Parameter Name="nat_code" Type="Int16" />
                    <asp:Parameter Name="work_code" Type="Int16" />
                    <asp:Parameter Name="job_code" Type="Int16" />
                    <asp:Parameter Name="lang_code" Type="Int16" />
                    <asp:Parameter Name="donor_email" Type="String" />
                    <asp:Parameter Name="salut_code" Type="Byte" />
                    <asp:Parameter Name="donat_to" Type="String" />
                    <asp:Parameter Name="DonorImportanceID" Type="Int16" />
                    <asp:Parameter Name="SMSEnabled" Type="Boolean" />
                    <asp:Parameter Name="MethodsToSendReportID" Type="Int16" />
                    <asp:Parameter Name="SendBy" Type="String" />
                    <asp:Parameter Name="MethodsToSendReportAddedBy" Type="String" ConvertEmptyStringToNull="true" />
                    <asp:Parameter Name="MethodsToSendReportAddedDate" Type="Datetime" ConvertEmptyStringToNull="true" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="donor_id" QueryStringField="DonorID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    <asp:Parameter Name="donor_id" Type="Int32" />
                    <asp:Parameter Name="donor_namear" Type="String" />
                    <asp:Parameter Name="donor_nameen" Type="String" />
                    <asp:Parameter Name="donor_gender" Type="Byte" />
                    <asp:Parameter Name="donor_civilid" Type="String" />
                    <asp:Parameter Name="donor_nat" Type="Int16" />
                    <asp:Parameter Name="donor_residency" Type="Int16" />
                    <asp:Parameter Name="primary_phone" Type="String" />
                    <asp:Parameter Name="phone_2" Type="String" />
                    <asp:Parameter Name="phone_3" Type="String" />
                    <asp:Parameter Name="address_text" Type="String" />
                    <asp:Parameter Name="po_box" Type="String" />
                    <asp:Parameter Name="zip_code" Type="String" />
                    <asp:Parameter Name="area_code" Type="Byte" />
                    <asp:Parameter Name="block_num" Type="String" />
                    <asp:Parameter Name="gadda_h" Type="String" />
                    <asp:Parameter Name="street_name" Type="String" />
                    <asp:Parameter Name="building_num" Type="String" />
                    <asp:Parameter Name="unit_num" Type="String" />
                    <asp:Parameter Name="communication_lang" Type="Byte" />
                    <asp:Parameter Name="general_remarks" Type="String" />
                    <asp:Parameter Name="work_place" Type="Int16" />
                    <asp:Parameter Name="job_title" Type="Int16" />
                    <asp:Parameter Name="donor_prev_id" Type="String" />
                    <asp:Parameter Name="comp_indv" Type="Byte" />
                    <asp:Parameter Name="donor_email" Type="String" />
                    <asp:Parameter Name="salut_code" Type="Byte" />
                    <asp:Parameter Name="donat_to" Type="String" />
                    <asp:Parameter Name="DonorImportanceID" Type="Int16" />
                    <asp:Parameter Name="SMSEnabled" Type="Boolean" />
                    <asp:Parameter Name="MethodsToSendReportID" Type="Int16" />
                    <asp:Parameter Name="SendBy" Type="String" />
                     <asp:Parameter Name="MethodsToSendReportAddedBy" Type="String" ConvertEmptyStringToNull="true" />
                    <asp:Parameter Name="MethodsToSendReportAddedDate" Type="Datetime" ConvertEmptyStringToNull="true" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="NatDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="WorkDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [work_locations]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="LangDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [languages_tab]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="TitleDSDonor" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [salut_tab]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="JobDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT [job_code], [job_descrar], [job_desceng] FROM [jobs_tab]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [area_codes] WHERE ([area_code] &lt;&gt; @area_code) ORDER BY [area_codeara]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1" Name="area_code" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Dsinstruct" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                SelectCommand="SELECT standing_instruction.ref_numb, standing_instruction.instruct_date, standing_instruction.donor_id, banks_list.bank_ar_name, standing_instruction.bank_ref_num, standing_instruction.start_date, standing_instruction.end_date, standing_instruction.total_deduct_value, standing_instruction.installment_value FROM standing_instruction LEFT OUTER JOIN banks_list ON standing_instruction.bank_code = banks_list.bank_code LEFT OUTER JOIN currency_tab ON standing_instruction.currency_code = currency_tab.currency_code WHERE (standing_instruction.donor_id = @donor_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtDonor" Name="donor_id" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" InsertCommand="sp_insert_Donor_data" InsertCommandType="StoredProcedure" SelectCommand="sp_insert_Donor_data" SelectCommandType="StoredProcedure">
                <InsertParameters>
                    <asp:Parameter Direction="InputOutput" Name="donor_id_1" Type="Int32" />
                    <asp:Parameter Name="donor_namear" Type="String" />
                    <asp:Parameter Name="donor_nameen" Type="String" />
                    <asp:Parameter Name="donor_civilid" Type="String" />
                    <asp:Parameter Name="donor_gender" Type="Byte" />
                    <asp:Parameter Name="donor_nat" Type="Int16" />
                    <asp:Parameter Name="donor_residency" Type="Int16" />
                    <asp:Parameter Name="primary_phone" Type="String" />
                    <asp:Parameter Name="phone_2" Type="String" />
                    <asp:Parameter Name="phone_3" Type="String" />
                    <asp:Parameter Name="address_text" Type="String" />
                    <asp:Parameter Name="po_box" Type="String" />
                    <asp:Parameter Name="zip_code" Type="String" />
                    <asp:Parameter Name="area_code" Type="Byte" />
                    <asp:Parameter Name="block_num" Type="String" />
                    <asp:Parameter Name="gadda_h" Type="String" />
                    <asp:Parameter Name="street_name" Type="String" />
                    <asp:Parameter Name="building_num" Type="String" />
                    <asp:Parameter Name="unit_num" Type="String" />
                    <asp:Parameter Name="communication_lang" Type="Byte" />
                    <asp:Parameter Name="general_remarks" Type="String" />
                    <asp:Parameter Name="work_place" Type="Int16" />
                    <asp:Parameter Name="job_title" Type="Int16" />
                    <asp:Parameter Name="donor_prev_id" Type="String" />
                    <asp:Parameter Name="comp_indv" Type="Byte" />
                    <asp:Parameter Name="salut_code" Type="Byte" />
                    <asp:Parameter Name="donat_to" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Direction="InputOutput" Name="donor_id_1" Type="Int32" />
                    <asp:Parameter Name="donor_namear" Type="String" />
                    <asp:Parameter Name="donor_nameen" Type="String" />
                    <asp:Parameter Name="donor_civilid" Type="String" />
                    <asp:Parameter Name="donor_gender" Type="Byte" />
                    <asp:Parameter Name="donor_nat" Type="Int16" />
                    <asp:Parameter Name="donor_residency" Type="Int16" />
                    <asp:Parameter Name="primary_phone" Type="String" />
                    <asp:Parameter Name="phone_2" Type="String" />
                    <asp:Parameter Name="phone_3" Type="String" />
                    <asp:Parameter Name="address_text" Type="String" />
                    <asp:Parameter Name="po_box" Type="String" />
                    <asp:Parameter Name="zip_code" Type="String" />
                    <asp:Parameter Name="area_code" Type="Byte" />
                    <asp:Parameter Name="block_num" Type="String" />
                    <asp:Parameter Name="gadda_h" Type="String" />
                    <asp:Parameter Name="street_name" Type="String" />
                    <asp:Parameter Name="building_num" Type="String" />
                    <asp:Parameter Name="unit_num" Type="String" />
                    <asp:Parameter Name="communication_lang" Type="Byte" />
                    <asp:Parameter Name="general_remarks" Type="String" />
                    <asp:Parameter Name="work_place" Type="Int16" />
                    <asp:Parameter Name="job_title" Type="Int16" />
                    <asp:Parameter Name="donor_prev_id" Type="String" />
                    <asp:Parameter Name="comp_indv" Type="Byte" />
                    <asp:Parameter Name="salut_code" Type="Byte" />
                    <asp:Parameter Name="donat_to" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress" runat="server" AssociatedUpdatePanelID="UpdatePanel"
    DynamicLayout="True">
    <ProgressTemplate>
        <%--<div class="progressBackgroundFilter" />--%>
        <div class="processMessage">
            <img alt="loading" src="../Content/images/loading.gif" />
            <asp:Label ID="lblLoadingMessage" runat="server" meta:resourcekey="lblLoadingMessageResource1"></asp:Label>
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>





