<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCDeductionV1.ascx.vb"
    Inherits="DirectAid.UCDeductionV1"
    ClientIDMode="Static" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
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

    function PrintOut()
    {
        var id = $("#txtReceiptID").val();
        //alert(id);

        if (id != "") {
            var url = "UIGenericReportViewer.aspx?REPORTFILENAME=DeductionPrintDoubleV1&SELECTIONFORMULA={view_deduction_print.ref_numb}=" + id;
            window.open(url, 'UIGenericReportViewer', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600');
        }
    }

    function ShowCollectionHistory() {

        //ctl00$ASPxRoundPanel_Content$ContentPlaceHolder1$txtDonrIDn
        var donorID = $("#txtDonrIDn").val();
        if (donorID != "") {
            var url = "DonorCollectionHistory.aspx?DonorID=" + donorID;
            window.open(url, 'CollectionHistory', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600');
        }
    }

    function OpenPlan() {

        var refNum = $("#txtReceiptID").val();

        if (refNum != "") {
            //alert($("#txtReceiptID").val());
            window.open("Standing_Plan.aspx?refnumb=" + refNum, "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600");
        }
    }

    function pageLoad() {
        //Date picker for the Date
        $("#txtReceiptDate").datepicker({
            buttonImage: 'Content/images/calendar.png',
            buttonImageOnly: true,
            showOn: 'button',
            dateFormat: 'dd/mm/yy',
            minDate: '-1M',
            maxDate: '+1M'
        });


        $("#txtStartDt").datepicker({
            buttonImage: 'Content/images/calendar.png',
            buttonImageOnly: true,
            showOn: 'button',
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy'

        });

        // $("#txtEndDate").datepicker({
        //   buttonImage: 'Content/images/calendar.png',
        //    buttonImageOnly: true,
        //    showOn: 'button',
        //    changeMonth: true,
        //    changeYear: true,
        //     dateFormat: 'dd/mm/yy'
        // });



        // ******************
        $("#txtmonthNum").blur(function () {


            var date1 = $("#txtStartDate").datepicker({
                dateFormat: 'dd/mm/yyyy'
            });
            var mnumb = $("#txtmonthNum").val();

            if (mnumb > 0) {
                //alert(mnumb);

                // var d = new Date();
                // d.setMonth(d.getMonth() + mnumb);
                //  $('#txtEndDate').val("SetDate", "+1M");

                //$("#txtEndDate").val(d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate());
            }
            else {
                // alert(mnumb);
                //  $("#txtEndDate").datepicker = date1;

            }
        });



        //*** ENd 

        //New
        $("#txtquant").keyup(function () {


            var qty = $("#txtquant").val();
            var value = $("#txtDistValue").val();
            var total = qty * value;


            if (!isNaN(total)) {
                $("#txtTotal").val(total);
                $("#TxtTotDeduct").val(total);
                $("#txtpaymentval").val(total);
            } else {
                $("#txtTotal").val('');
                $("#TxtTotDeduct").val('');
                $("#txtpaymentval").val('');
            }

        });

        //Total amount New

        $("#txtpaymentval").keyup(function () {
            var totval = $("#txtpaymentval").val();
            var value = $("#txtDistValue").val();
            if (value == 0) {
                var qtnew = 1;
                $("#txtquant").val(qtnew);
                $("#txtTotal").val(totval);


            }
            else {


                if (!isNaN(value)) {
                    var qty1 = totval / value;
                    var qty2 = qty1.toPrecision(5);
                    $("#txtquant").val(qty2);
                    $("#txtTotal").val(totval);
                }
                else {
                    var qty1 = totval / totval;
                    var qty2 = qty1.toPrecision(5);
                    $("#txtquant").val(qty2);
                    $("#txtTotal").val(totval);
                }
            }
        });


        // Edit payment

        $("#txtpaymentedit").keyup(function () {
            var totvalE = $("#txtpaymentedit").val();
            var valueE = $("#txtDistValueEdit").val();
            if (valueE == 0) {
                var qtEdit = 1;

                $("#txtTotalEdit").val(totvalE);
                $("#txtquantEdit").val(qtEdit);

            }
            else {

                if (!isNaN(valueE)) {
                    var qty1E = totvalE / valueE;
                    var qty2E = qty1E.toPrecision(5);
                    $("#txtquantEdit").val(qty2E);
                    $("#txtTotalEdit").val(totvalE);

                }
                else {
                    var qty1E = totvalE / totvalE;
                    var qty2E = qty1E.toPrecision(5);
                    $("#txtquantEdit").val(qty2E);
                    $("#txtTotalEdit").val(totvalE);
                }

            }

        });


        $("#txtquantEdit").keyup(function () {


            var qty = $("#txtquantEdit").val();
            var value = $("#txtDistValueEdit").val();
            var total = qty * value;

            if (!isNaN(total)) {
                $("#txtTotalEdit").val(total);
                $("#txtpaymentedit").val(total);
            }
            else {
                $("#txtTotalEdit").val('');
                $("#txtpaymentedit").val('');
            }

        });

        //           $("#txtCivilID").keyup(function () {

        //                var evt = (e) ? e : window.event;
        //                var key = (evt.keyCode) ? evt.keyCode : evt.which;
        //                if (key != null) {
        //                    key = parseInt(key, 10);
        //                    if ((key < 48 || key > 57) && (key < 96 || key > 105)) {
        //                        if (!jsIsUserFriendlyChar(key, "Decimals")) {
        //                            return false;
        //                        }
        //                    }
        //                    else {
        //                        if (evt.shiftKey) {
        //                            return false;
        //                        }
        //                    }
        //                }
        //                return true;
        //            }

        function Digitonly() {
            if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105)) return true;
            else

                return false;

        }




        //Total amount Footer

        $("#txtpaymentfooter").keyup(function () {
            var totvalF = $("#txtpaymentfooter").val();
            var valueF = $("#txtDistValuefooter").val();
            if (valueF == 0) {
                var qtFoot = 1;
                $("#txtquantfooter").val(qtFoot);
                $("#txtTotalFooter").val(totvalF);

            }
            else {
                if (!isNaN(valueF)) {
                    var qty1F = totvalF / valueF;
                    var qty2F = qty1F.toPrecision(5);
                    $("#txtquantfooter").val(qty2F);
                    $("#txtTotalFooter").val(totvalF);

                }
                else {
                    var qty1F = totvalF / totvalF;
                    var qty2F = qty1F.toPrecision(5);
                    $("#txtquantfooter").val(qty2F);
                    $("#txtTotalFooter").val(totvalF);
                }
            }
        });



        $("#txtquantfooter").keyup(function () {


            var qty = $("#txtquantfooter").val();
            var value = $("#txtDistValuefooter").val();
            var total = qty * value;

            if (!isNaN(total)) {
                $("#txtTotalFooter").val(total);
                $("#txtpaymentfooter").val(total);
            }
            else {
                $("#txtTotalFooter").val('');
                $("#txtpaymentfooter").val('');
            }

        });

        //Calculate Total Amount

        $("#txtinstAmt").blur(function () {
            var inst1 = 0;
            var _MonthNum = 0;
            var _total = 0;
            var inst1 = $("#txtinstAmt").val();
            var _MonthNum = $("#txtmonthNo").val();

            _total = inst1 * _MonthNum;


            if (!isNaN(_total)) {
                $("#txtTotalDeduct").val(_total);
            }
            else {
                $("#txtTotalDeduct").val('');
            }

        });
        //datefiffernt

        //  $("#txtTotalDeduct").blur(function () {
        //   var days = 0;
        //   var tot1 = 0;
        //   var intmnt = 0;
        //    var inst = 0;

        //   var tot1 = $("#txtTotalDeduct").val();

        //   var d1 = $("#txtStartDate").datepicker({
        //       dateFormat: 'dd/mm/yyyy'
        //    });
        //   var d2 = $("#txtEndDate").datepicker({
        //       dateFormat: 'dd/mm/yyyy'
        //   });

        //    var start = $('#txtStartDt').datepicker('getDate');
        //   var end = $('#txtEndDate').datepicker('getDate');

        //   if (((end - start) == 0) || ((end - start) <= 30)) {
        //      intmnt = tot1;
        //       $("#txtinstAmt").val(intmnt);
        //   }
        //   else {

        //    var days = (end - start) / 1000 / 60 / 60 / 24;

        //    var months = Math.round(days / 30);

        //   inst = tot1 / (months)
        //    inst = (inst * 1000.000) / 1000.000
        //    var instNew = Math.round(inst);
        //  $("#txtinstAmt").val(instNew);
        // }
        //                    if (!isNaN(months)) {
        //                     $("#txtinstAmt").val(intmnt);
        //                    }

        //                    else {
        //                    $("#txtinstAmt").val('0');
        //                    }

        //  });

    }

    shortcut.add("F2", function () {

        var btn = document.getElementById("btnReset");

        btn.click();

    });

    shortcut.add("F8", function () {

        var btn = document.getElementById("btnsaveInstruct");

        btn.click();

    });

    function hide_panel() {
        var i;
        var j;
        var k;
        var l;
        i = (event.keyCode);

        //if ( i==13 )
        {
            //k= document.getElementById("panel2").style.visibility;
            //alert(k);
            //if (k== true)
            {
                j = document.getElementById("lnk_hide_panel");
                j.click();
                l = document.getElementById("A1");
                //l.focus();
                l = click();
            }

        }

    }
    //civilid
    function CivilIdValidate() {
        var digaray = new Array(10);
        var cd;
        var summ;
        var remainder;
        var i;
        var j;
        var civil_id;

        j = document.all.item("txtCivilID");
        civil_id = j.value;
        if (civil_id == '') return false;

        //alert (civil_id);					       

        remainder = 0;
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

        summ = 0;
        for (i = 0; i < 11; i++) {
            summ += parseInt(civil_id.substr(i, 1)) * digaray[i];
        }
        remainder = summ % 11;

        if (parseInt(civil_id.substr(11, 1)) == (11 - remainder)) {
            //arguments.IsValid = true;	
            return 1;
        }
        else {
            //arguments.IsValid = false;
            //j.focus();
            alert("رقم البطاقة غير صحيح");
            j.focus();
            return 2;
        }

    }

    function textboxMultilineMaxNumber(txt, maxLen) {

        if (txt.value.length > (maxLen - 1)) return false;
        else {
            return true;
        }
    }

    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    }

    function OnlyNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode < 46 || charCode > 57)
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
    input[type="text"]:disabled
    {
        color:blue;
        font-weight:bolder;
        
    }
    .deleted
    {
        background-color:black;
        color:white;
    }
        .deleted span
        {
            color:white;
            padding:2px;
        }
        .deleted a
        {
            color:white;
            padding:2px;
            text-decoration:none;
        }
</style>

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<table width="100%">
    <tr>
        <td>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    Loading ...
                </ProgressTemplate>
            </asp:UpdateProgress>
        </td>
    </tr>
</table>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <%--  dono nME DISPLY--%>
        <asp:Panel ID="pnlSreachResult" CssClass="modal" Style="display: none;" runat="server">
            <div class="modal-header header-label" style="background-color:black">
                <asp:Label ID="lblSearchResultHeader" runat="server" CssClass="header-label" Text="Search Result"
                    meta:resourcekey="lblSearchResultHeaderResource1"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:GridView ID="grvSearchResult" runat="server" AutoGenerateColumns="False" DataKeyNames="donor_id"
                    BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue" CellPadding="15"
                    Width="600px" Font-Name="tahoma" RowStyle-Height="12px" Font-Size="9pt" ForeColor="DarkBlue"
                    HeaderStyle-BackColor="#aaaadd" HorizontalAlign="Center" GridLines="None">
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue"
                        Height="20px" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="AliceBlue"></AlternatingRowStyle>
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                    <SelectedRowStyle BackColor="Ivory" Font-Bold="False" ForeColor="DeepPink" Font-Italic="False"
                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></SelectedRowStyle>
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="Id" meta:resourcekey="TemplateFieldResource40">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkDonorId" runat="server" Text='<%# Bind("donor_id") %>' NavigateUrl='<%# Bind("donor_id","~/InstructionFrm.aspx?DonorId={0}") %>'></asp:HyperLink>
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
        <%--   DONOR NME END--%>
        <%--ReportScreen--%>
        <asp:Panel ID="pnlRep" CssClass="modal" Style="display: none;" runat="server">
            <div class="modal-header header-label">
                <asp:Label ID="lblSearchrep" runat="server" CssClass="header-label" Text="Search Result"
                    meta:resourcekey="lblSearchResultHeaderResource1"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:GridView ID="grdReport" runat="server" AutoGenerateColumns="False" Height="75px"
                    Width="750px" BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue"
                    CellPadding="10" Font-Name="tahoma" Font-Size="9pt" ForeColor="DarkBlue" HeaderStyle-BackColor="#aaaadd"
                    HorizontalAlign="Center" GridLines="None">
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="AliceBlue"></AlternatingRowStyle>
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="RefNo">
                            <ItemTemplate>
                                <asp:Label ID="lblgrdRefNo" runat="server" Font-Size="9px" Text='<%# Bind("ref_numb") %>'> </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <asp:Label ID="lblgedDate" runat="server" Font-Size="9px" Text='<%# Bind("instruct_date" ,"{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Bank Ref">
                            <ItemTemplate>
                                <asp:Label ID="lblgrdBankref" runat="server" Font-Size="9px" Text='<%# Bind("bank_ref_num") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Bank">
                            <ItemTemplate>
                                <asp:Label ID="lblgrdBnk" runat="server" Width="150px" Font-Size="9px" Text='<%# Bind("bank_ar_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Account Num">
                            <ItemTemplate>
                                <asp:Label ID="lblgrdAcNum" runat="server" Width="150px" Font-Size="9px" Text='<%# Bind("account_num") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblgrdstat" runat="server" Font-Size="9px" Text='<%# Bind("standing_status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Start">
                            <ItemTemplate>
                                <asp:Label ID="lblgrdstart" runat="server" Font-Size="9px" Text='<%# Bind("start_date","{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="End">
                            <ItemTemplate>
                                <asp:Label ID="lblgrdend" runat="server" Font-Size="9px" Text='<%# Bind("end_date" ,"{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Amount">
                            <ItemTemplate>
                                <asp:Label ID="lblgrdamount" runat="server" Font-Size="9px" Text='<%# Bind("total_deduct_value", "{0:N3}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Inst.Amt">
                            <ItemTemplate>
                                <asp:Label ID="lblgrdintamt" runat="server" Font-Size="9px" Text='<%# Bind("installment_value" , "{0:N3}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnCloseprintResult" Text="Close" CssClass="google-button google-button-blue"
                    runat="server" meta:resourcekey="btnCloseprintResult1" />
            </div>
        </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="pnlreport_ModalPopupExtender" runat="server"
            DynamicServicePath="" Enabled="True" TargetControlID="HiddenForModelRep" PopupControlID="pnlRep"
            BackgroundCssClass="ModalBackground" DropShadow="True" CancelControlID="btnCloseprintResult"
            RepositionMode="RepositionOnWindowResizeAndScroll">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Button ID="HiddenForModelRep" Text="" runat="server" CssClass="hide" CausesValidation="False" />
        <%--REpend--%>
        <%--Total Instruction Display--%>
        <asp:Panel ID="pnlTotalDeduction" CssClass="modal" Style="display: none;" runat="server">
            <div class="modal-header header-label">
                <asp:Label ID="lblTotalDeductionHeader" runat="server" CssClass="header-label" Text="Deduction Details"
                    meta:resourcekey="lblTotalDeductionHeaderResource1"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:GridView ID="grdDetails" runat="server" AutoGenerateColumns="False" Height="75px"
                    Width="750px" BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue"
                    CellPadding="10" Font-Name="tahoma" Font-Size="9pt" ForeColor="DarkBlue" HeaderStyle-BackColor="#aaaadd"
                    HorizontalAlign="Center" GridLines="None">
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="AliceBlue"></AlternatingRowStyle>
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="Receipt No">
                            <ItemTemplate>
                                <asp:Label ID="lblgrdrecepit" runat="server" Font-Size="9px" Text='<%# Bind("reciept_num") %>'> </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Receipt Date">
                            <ItemTemplate>
                                <asp:Label ID="lblDetgrddate" runat="server" Font-Size="9px" Text='<%# Bind("reciept_date") %>'> </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Amount">
                            <ItemTemplate>
                                <asp:Label ID="lblDetgrdvalue" runat="server" Font-Size="9px" Text='<%# Bind("donation_value") %>'> </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Donation Type">
                            <ItemTemplate>
                                <asp:Label ID="lblDetgrdtype" runat="server" Font-Size="9px" Text='<%# Bind("donation_descrar") %>'> </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Donor Id">
                            <ItemTemplate>
                                <asp:Label ID="lblDetgrddonorid" runat="server" Font-Size="9px" Text='<%# Bind("donor_id") %>'> </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btndetailclose" Text="Close" CssClass="google-button google-button-blue"
                    runat="server" meta:resourcekey="btndetailcloseResult1" />
            </div>
        </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="pnldetail_ModalPopupExtender" runat="server"
            DynamicServicePath="" Enabled="True" TargetControlID="HiddenForModeldetail" PopupControlID="pnlTotalDeduction"
            BackgroundCssClass="ModalBackground" DropShadow="True" CancelControlID="btndetailclose"
            RepositionMode="RepositionOnWindowResizeAndScroll">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Button ID="HiddenForModeldetail" Text="" runat="server" CssClass="hide" CausesValidation="False" />
        <table width="100%">
            <tr class="header-label" runat="server"  id="tr_header">
                <td>
                    <asp:Label ID="lblSearchHeader" Text="Search" runat="server" meta:resourcekey="lblSearchHeaderResource1"
                         Width="100%" />
                </td>
                <td>
                    <asp:Label ID="LblLastIntruction" Text="Last Instruct" runat="server" meta:resourcekey="lLblLastIntructionResource1"
                         Width="100%" />
                </td>
                <td>
                    <asp:Label ID="lblLastInstructValue" runat="server"
                        Width="100%" />
                </td>
                <td>

                    <asp:Label ID="LblLastIntructionAmount" runat="server" meta:resourcekey="LblLastIntructionAmountResource" Text="تاريخ اخر استقطاع"  Width="100%" />

                </td>
                <td>

                    <asp:Label ID="lblLastInstructAmountValue" runat="server" Width="100%" />

                </td>

            </tr>
        </table>
        <table width="100%" cellpadding="2px">
            <tr>
                <td class="CellStyle">
                    <asp:DropDownList ID="ddlSearchType" runat="server" CssClass="dropdownlist" meta:resourcekey="ddlSearchTypeResource1"
                        Height="25px" Width="100%">
                        <asp:ListItem Value="0" Text="ID" meta:resourcekey="ListItemResource1" />
                        <asp:ListItem Value="1" Text="Civil ID" meta:resourcekey="ListItemResource2" />
                        <asp:ListItem Value="2" Text="Phone" meta:resourcekey="ListItemResource3" />
                        <asp:ListItem Value="3" Text="Mobile" meta:resourcekey="ListItemResource4" />
                        <asp:ListItem Value="4" Text="Arabic Name" meta:resourcekey="ListItemResource5" />
                        <asp:ListItem Value="5" Text="English Name" meta:resourcekey="ListItemResource6" />
                        <asp:ListItem Value="6" Text="Ref Number" meta:resourcekey="ListItemResource7" />
                        <asp:ListItem Value="7" Text="Account No" meta:resourcekey="ListItemResourceAcno" />
                    </asp:DropDownList>
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="textbox" Height="23px"
                        MaxLength="50" meta:resourcekey="txtSearchResource1" TabIndex="1" Width="100%"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Button ID="btnSearch" runat="server"
                        CssClass="google-button google-button-blue"
                        meta:resourcekey="btnSearchResource1" TabIndex="2" Text="Search"
                        UseSubmitBehavior="False" Width="90%" Font-Bold="True" />
                </td>
                <td class="CellStyle">

                    <asp:Button ID="btnPrntReport" runat="server"
                        CssClass="google-button google-button-blue"
                        meta:resourcekey="btnPrntReporttResource1" TabIndex="4" Text="Report"
                        UseSubmitBehavior="False" Width="100%" Font-Bold="True" />

                </td>
                <td class="CellStyle">
                    <%--<asp:Button ID="btnBnkRep" runat="server"
                        CssClass="google-button google-button-blue"
                        meta:resourcekey="btnBnkRepResource1" TabIndex="5" Text="Bank Instruct"
                        UseSubmitBehavior="False" Width="100%" Font-Bold="True" OnClientClick="PrintOut();"/>--%>
                    <dx:ASPxButton ID="ASPxButton_Print" runat="server" AutoPostBack="False" ClientInstanceName="ASPxButton_Print" Font-Bold="True" Text="طباعه" Width="100%">
                        <ClientSideEvents Click="function(s, e) {
	PrintOut();
}" />
                    </dx:ASPxButton>
                </td>
                <td class="CellStyle">
                    <asp:Button ID="btnReset" runat="server" ClientIDMode="Static"
                        CssClass="google-button google-button-blue"
                        meta:resourcekey="btnResetResource1" TabIndex="6" Text="Reset"
                        UseSubmitBehavior="False" Width="100%" Font-Bold="True" />
                </td>
                <td class="CellStyle">
                    <asp:Button ID="btnsaveInstruct" runat="server" ClientIDMode="Static"
                        meta:resourcekey="btnsaveInstructResource1" TabIndex="7" Text="Save"
                        UseSubmitBehavior="False" Width="100%" BackColor="#33CC33" Font-Bold="True" />
                </td>
                <td class="CellStyle">
                    <asp:Button ID="Cmd_Standing_Plan" runat="server" CssClass="google-button google-button-blue"
                        meta:resourcekey="Cmd_Standing_PlanResource1" Text="Plan" Width="100%"
                        OnClientClick="OpenPlan();" Font-Bold="True" />
                </td>
                <td class="CellStyle">&nbsp;</td>

            </tr>
        </table>
        <table width="100%">
            <tr class="header-label" runat="server" id="tr_moreinfo">
                <td class="style19">
                    <asp:LinkButton ID="lblDonorInfoHeader" runat="server"  Height="22px"
                        meta:resourcekey="lblDonorInfoHeaderResource1" Text="More Donor Information" ForeColor="White"></asp:LinkButton>
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="2px">
            <tr>
                <td class="CellStyle">
                    <asp:Label ID="lblDnrID" Text="Donor ID" Font-Names="Tahoma" Font-Size="8pt" CssClass="label"
                        for="txtDonrIDn" runat="server" ForeColor="Red" meta:resourcekey="lblDnrIDResource1"
                        Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtDonrIDn" runat="server" Width="100%" Enabled="False" meta:resourcekey="txtDonrIDnResource1"
                        Height="19px" CssClass="textbox" Style="margin-left: 0px" TabIndex="8"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Label CssClass="label" for="ddlDonorType" ID="Label1" Text="Donor Type" runat="server"
                        Font-Names="Tahoma" Font-Size="8pt" ForeColor="#003366" meta:resourcekey="lblDonerTypeResource1"
                        Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:DropDownList ID="ddlDonorType" runat="server" Font-Names="Tahoma" Style="margin-left: 0px"
                        Font-Size="8pt" ForeColor="#003366" CssClass="dropdownlist" meta:resourcekey="ddlDonorTypeResource1"
                        Height="22px" Width="100%" TabIndex="9">
                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource8" Text="Individual"></asp:ListItem>
                        <asp:ListItem Value="1" meta:resourcekey="ListItemResource9" Text="Company"></asp:ListItem>
                        <asp:ListItem Value="2" meta:resourcekey="ListItemResource10" Text="Charity Firm"></asp:ListItem>
                        <asp:ListItem Value="3" meta:resourcekey="ListItemResource11" Text="Other"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblCivilID" runat="server" CssClass="label" Font-Names="Tahoma" Font-Size="8pt"
                        for="txtCivilID" ForeColor="#003366" meta:resourcekey="lblCivilIDResource1" Text="Civil ID"
                        Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtCivilID" runat="server" CssClass="textbox" Enabled="False" Height="19px"
                        MaxLength="12" meta:resourcekey="txtCivilIDResource1" Style="margin-left: 0px"
                        onkeypress="return isNumberKey(event)" onblur="return CivilIdValidate(event)"
                        Width="100%"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblPhone" runat="server" color="blue" CssClass="label" Font-Names="Tahoma"
                        Font-Size="8pt" for="txtPhone" ForeColor="#003366" meta:resourcekey="lblPhoneResource1"
                        Text="Home Phone" Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" Enabled="False" Height="19px"
                        MaxLength="10" meta:resourcekey="txtPhoneResource1" Style="margin-left: 0px"
                        onkeypress="return isNumberKey(event)" Width="100%"></asp:TextBox>
                </td>
                <td class="CellStyle2"></td>
            </tr>
        </table>
        <table width="100%" cellpadding="2px">
            <tr>
                <td class="CellStyle">
                    <asp:Label ID="lblArabicName" Text="Arabic Name" ForeColor="#003366" CssClass="label"
                        Font-Names="Tahoma" Font-Size="8pt" for="txtArabicName" runat="server" meta:resourcekey="lblArabicNameResource1"
                        Width="100%" />
                </td>
                <td>
                    <asp:TextBox ID="txtArabicName" runat="server" Width="100%" Enabled="False" meta:resourcekey="txtArabicNameResource1"
                        Height="22px" CssClass="textbox" Style="margin-left: 0px" MaxLength="180"></asp:TextBox>
                </td>
                <%--           <td class="CellStyle">
                        &nbsp;</td>
                    <td class="CellStyle">
                        &nbsp;</td>--%>
                <td class="CellStyle">
                    <asp:Label ID="lblEnglishName" runat="server" CssClass="label"
                        Font-Names="Tahoma" Font-Size="8pt" for="txtEnglishName" ForeColor="#003366"
                        meta:resourcekey="lblEnglishNameResource1" Text="English Name" Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtEnglishName" runat="server" CssClass="textbox"
                        Enabled="False" Font-Names="Tahoma" Font-Size="8pt" Height="22px"
                        MaxLength="180" meta:resourcekey="txtEnglishNameResource1"
                        Style="margin-left: 0px" TabIndex="13" Width="100%"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblMobile" runat="server" CssClass="label" Font-Names="Tahoma"
                        Font-Size="8pt" for="txtMobile" ForeColor="#003366"
                        meta:resourcekey="lblMobileResource1" Text="Mobile" Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="textbox" Enabled="False"
                        Height="19px" MaxLength="8" meta:resourcekey="txtMobileResource1"
                        onkeypress="return isNumberKey(event)" Style="margin-left: 0px" TabIndex="14"
                        Width="100%"></asp:TextBox>
                </td>
                <td class="CellStyle2"></td>
            </tr>
        </table>
        <table width="100%" cellpadding="2px">
            <tr>
                <td class="CellStyle">
                    <asp:Label ID="lblTotalDonation" runat="server" CssClass="label" Font-Names="Tahoma"
                        Font-Size="8pt" for="txtTotalDonation" ForeColor="#003366" meta:resourcekey="lblTotalDonationResource1"
                        Text="Total Donation" Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtTotalDonation" runat="server" CssClass="textbox" Enabled="False"
                        Height="18px" meta:resourcekey="txtTotalDonationResource1" Style="margin-left: 0px; margin-bottom: 0px;"
                        Width="100%" TabIndex="15"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lbltotStanInstruct" runat="server" CssClass="label" Font-Names="Tahoma"
                        Font-Size="8pt" for="txttotintruct" ForeColor="#003366" meta:resourcekey="lbltotStanInstructResource1"
                        Text="Total Instruction" Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txttotintruct" runat="server" CssClass="textbox" Enabled="False"
                        Height="20px" meta:resourcekey="txttotintructResource1" Style="margin-left: 0px"
                        Width="100%" TabIndex="16"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblTotalWaqf" runat="server" CssClass="label" Font-Names="Tahoma"
                        Font-Size="8pt" for="txtTotalWaqf" ForeColor="#003366" meta:resourcekey="lblTotalWaqfResource1"
                        Text="Total Waqf" Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtTotalWaqf" runat="server" CssClass="textbox" Enabled="False"
                        Height="19px" meta:resourcekey="txtTotalWaqfResource1" Style="margin-left: 0px"
                        Width="100%" TabIndex="17"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Button ID="btnOpen" runat="server"
                        CssClass="google-button google-button-blue" meta:resourcekey="btnOpenResource1"
                        TabIndex="19" Text="Open" UseSubmitBehavior="False" Width="90%" Height="21px" />
                </td>
                <td class="CellStyle">
                    <asp:Button ID="btnDetail" runat="server"
                        CssClass="google-button google-button-blue"
                        meta:resourcekey="btnDetailResource1" TabIndex="20" Text="Details"
                        Width="100%" UseSubmitBehavior="False" Height="21px" OnClientClick="ShowCollectionHistory();" />
                </td>
                <td class="CellStyle2"></td>
            </tr>
        </table>
        <table width="100%">
            <tr class="header-label" runat="server" id="tr_standingInstructions" >
                <td class="style2">
                    <asp:Label ID="lblRecieptHeader" Text="Standing Instructions" runat="server" 
                        meta:resourcekey="lblRecieptHeaderResource1" Width="100%" />
                </td>
            </tr>
        </table>
        <table width="100%" cellpadding="2px">
            <tr>
                <td class="CellStyle">
                    <asp:Label ID="lblWaqf" Text=" Donation Group" Font-Names="Tahoma" Font-Size="8pt"
                        runat="server" CssClass="label" for="ddlWaqfDonation" forcolor="black" meta:resourcekey="lblDonationCatResource1"
                        Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:DropDownList ID="ddlWaqfDonation" runat="server" CssClass="dropdownlist" Font-Names="Tahoma"
                        margin-left="4px" Font-Size="8pt" Height="23px" meta:resourcekey="ddlWaqfDonationSrcResource1"
                        Style="margin-left: 0px" Width="100%" AppendDataBoundItems="True" AutoPostBack="True"
                        TabIndex="21">
                        <asp:ListItem meta:resourcekey="ListItemWaqfCatResource1" Text="Donations" Value="1"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemWaqfCatResource2" Text="Zakat" Value="3"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemWaqfCatResource3" Text="Waqf" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:HyperLink ID="lblReceiptID" Text="Ref No" runat="server" CssClass="label" for="txtReceiptID"
                        meta:resourcekey="lblReceiptIDResource1" Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtReceiptID" runat="server" CssClass="textbox" Enabled="False"
                        Height="18px" meta:resourcekey="txtReceiptIDResource1" Style="margin-left: 0px; margin-bottom: 0px;"
                        Width="100%" TabIndex="22"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="Label6" runat="server" CssClass="label" Font-Names="Tahoma" Font-Size="8pt"
                        for="ddlstandStat" Text="St.Order Status" meta:resourcekey="lblStatusResource1"
                        Width="100%"></asp:Label>
                </td>
                <td class="CellStyle">
                    <asp:DropDownList ID="ddlstandStat" runat="server" CssClass="dropdownlist"
                        Font-Names="Tahoma" Font-Size="8pt" Height="23px" Style="margin-left: 0px" meta:resourcekey="ddlddlstandStatResource1"
                        Width="100%" TabIndex="23" >
                        <asp:ListItem Text="اختر الحاله ..." Value="0" ></asp:ListItem>
                        <asp:ListItem Selected="True" Text="انتظار" Value="1"></asp:ListItem>
                        <asp:ListItem Text="مرفوض من البنك" Value="2"></asp:ListItem>
                        <asp:ListItem Text="انتهاء المده" Value="3"></asp:ListItem>
                        <asp:ListItem Text="نشط" Value="4"></asp:ListItem>
                        <asp:ListItem Text="ملغى" Value="5"></asp:ListItem>
                        <asp:ListItem Text="غير معتمد" Value="6"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblStatReasn" runat="server" CssClass="label" Font-Names="Tahoma"
                        Font-Size="8pt" for="lblStatReasn" meta:resourcekey="lblStatReasnResource1" Text="Status Reason"
                        Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:DropDownList ID="ddlstatReasn" runat="server" AppendDataBoundItems="True" AutoPostBack="True"
                        DataSourceID="statReasonDs" DataTextField="stat_reason_ara" DataValueField="stat_reason_code"
                        Font-Names="Tahoma" Font-Size="8pt" Height="23px" meta:resourcekey="ddlstatReasnResource1"
                        Width="100%" TabIndex="24">
                    </asp:DropDownList>
                </td>
                <td class="CellStyle2">
                    <asp:LinkButton ID="LnkChange" runat="server" Font-Size="9pt" meta:resourcekey="lnk_buttonResource"
                        Text="Activate" Width="100%" Style="margin-left: 0px" ForeColor="#CC0099" Height="16px"
                        TabIndex="25"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="CellStyle">
                    <asp:Label ID="lblReceiptDate" Text="Instruct Date" Font-Names="Tahoma" Font-Size="8pt"
                        runat="server" CssClass="label" for="txtReceiptDate" meta:resourcekey="lblReceiptDateResource1"
                        Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtReceiptDate" runat="server" CssClass="textbox" meta:resourcekey="txtReceiptDateResource1"
                        Height="20px" Width="75%" Style="margin-left: 0px; margin-bottom: 0px;" Enabled="False"
                        TabIndex="27"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblCurrency" Text="Currency" runat="server" CssClass="label" ForeColor="Red"
                        for="ddlCurrency" Font-Names="Tahoma" Font-Size="8pt" meta:resourcekey="lblCurrencyResource1"
                        Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:DropDownList ID="ddlCurrency" runat="server" DataSourceID="CurDS1" DataTextField="currency_descrar"
                        CssClass="dropdownlist" DataValueField="currency_code" AppendDataBoundItems="True"
                        meta:resourcekey="ddlCurrencyResource1" Height="23px" Font-Names="Tahoma" Style="margin-left: 0px"
                        Font-Size="8pt" Width="100%" TabIndex="28">
                    </asp:DropDownList>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblCampaign" runat="server" CssClass="label" Font-Names="Tahoma" Font-Size="8pt"
                        for="ddlcampaign" meta:resourcekey="lblCampaignResource1" Text="Campaign" Width="100%" Visible="False" />
                </td>
                <td class="CellStyle">
                    <asp:DropDownList ID="ddlcampaign" runat="server" AppendDataBoundItems="True" CssClass="dropdownlist"
                        DataSourceID="campDS1" DataTextField="campaign_descrar" DataValueField="campaign_code"
                        Font-Names="Tahoma" Font-Size="8pt" Height="23px" meta:resourcekey="ddlcampaignResource1"
                        Style="margin-left: 0px" Width="100%" TabIndex="29" Visible="False">
                    </asp:DropDownList>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblContinue" runat="server" Text="Continued" Font-Names="Tahoma" Font-Size="8pt"
                        CssClass="label" for="chkcont" meta:resourcekey="lblContinueResc1" Width="100%"></asp:Label>
                </td>
                <td class="CellStyle">
                    <asp:CheckBox ID="chkcont" forcolor="black" runat="server" meta:resourcekey="chkcontnewResource1"
                        AutoPostBack="True" Width="100%" TabIndex="30"></asp:CheckBox>
                </td>
                <td class="CellStyle2">
                    <asp:LinkButton ID="LnkCancelled" runat="server" Font-Size="9pt" meta:resourcekey="LnkCancelledResource"
                        Text="Cancelled" Width="100%" Height="19px" ForeColor="#CC0099" TabIndex="26"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="CellStyle">
                    <asp:Label ID="lblstartDt" Text="Start Date" Font-Names="Tahoma" Font-Size="8pt"
                        ForeColor="Red" runat="server" CssClass="label" for="txtStartDt" meta:resourcekey="lblstartDtResource1"
                        Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtStartDt" runat="server" CssClass="textbox" meta:resourcekey="txtStartDtResource1"
                        Height="20px" Font-Names="Tahoma" Font-Size="8pt" Width="75%" Style="margin-left: 0px; margin-bottom: 0px;"
                        TabIndex="31"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblmonths" Text="Months" Font-Names="Tahoma" Font-Size="8pt" runat="server"
                        CssClass="label" for="txtmonthNum" meta:resourcekey="lblmonthsResource1" Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtmonthNo" runat="server" Style="margin-left: 0px; margin-bottom: 0px;"
                        CssClass="textbox" onkeypress="return OnlyNumberKey(event)" meta:resourcekey="txtmonthNoResource1"
                        Width="100%" Height="20px" onBlur="insertByEnterKey(lbtnCalNoOfMonth);" TabIndex="32" Text="0"></asp:TextBox>
                    <asp:LinkButton ID="lbtnCalNoOfMonth" runat="server" ClientIDMode="Static" CssClass="hide"
                        meta:resourcekey="lbtnCalNoOfMonthResource2">LinkButton</asp:LinkButton>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblendDt" Text="End Date" Font-Names="Tahoma" Font-Size="8pt"
                        runat="server" CssClass="label" for="txtEndDate" meta:resourcekey="lblendDtResource1"
                        Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtEndDate" runat="server" CssClass="textbox" Enabled="False" meta:resourcekey="txtEndDateResource1"
                        Font-Names="Tahoma" Style="margin-left: 0px" Font-Size="8pt" Height="17px" Width="100%"
                        TabIndex="33"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblinstVal" runat="server" CssClass="label" Font-Names="Tahoma" ForeColor="Red"
                        Font-Size="8pt" for="txtinstAmt" meta:resourcekey="lblinstValResource1"
                        Text="Inst Amount" Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtinstAmt" runat="server" CssClass="textbox" onkeypress="return OnlyNumberKey(event)"
                        Font-Names="Tahoma" Font-Size="8pt" Height="17px" MaxLength="10"
                        meta:resourcekey="txtinstAmtResource2" Style="margin-left: 0px" TabIndex="34"
                        Width="100%"></asp:TextBox>
                </td>
                <td class="CellStyle2"></td>
            </tr>
            <tr>
                <td class="CellStyle">
                    <asp:Label ID="lblTotdeduct" runat="server" CssClass="label"
                        Font-Names="Tahoma" Font-Size="8pt" for="txtTotalDeduct"
                        meta:resourcekey="llblTotdeductResource1" Text="Total Amount" Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtTotalDeduct" runat="server" CssClass="textbox"
                        Height="18px" MaxLength="10" meta:resourcekey="txtTotalDeductResource1"
                        Style="margin-left: 0px" TabIndex="35"
                        Width="100%"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblBnk" Text="Bank Name" Font-Names="Tahoma" Font-Size="8pt" runat="server"
                        CssClass="label" for="lblBnk" ForeColor="Red" meta:resourcekey="lblBnkResource1"
                        Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel_ddlBnk">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlBnk" runat="server" CssClass="dropdownlist" DataSourceID="bankSDC"
                                DataTextField="bank_ar_name" DataValueField="bank_code" AutoPostBack="True"
                                meta:resourcekey="ddlBnkResource1" Height="23px" Font-Names="Tahoma" Font-Size="8pt"
                                Width="100%" Style="margin-left: 0px" TabIndex="36">
                                <asp:ListItem Value="0" meta:resourcekey="ddlBnkResource2" Text="Please Select Bank">
                                </asp:ListItem>
                            </asp:DropDownList>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblbnkbranch" Text="Bank Branch" Font-Names="Tahoma" Font-Size="8pt"
                        runat="server" CssClass="label" for="lblbnkbranch" meta:resourcekey="lblBnkBranchResource1" />
                </td>
                <td class="CellStyle">

                    <asp:DropDownList ID="ddlnewBrn" runat="server" Height="23px" Font-Names="Tahoma"
                        Font-Size="8pt" Width="100%" CssClass="dropdownlist" Style="margin-left: 0px"
                        meta:resourcekey="ddlnewBrnResource1" DataSourceID="bankBranchSDC" DataTextField="brn_namear"
                        DataValueField="brn_code" TabIndex="37">
                    </asp:DropDownList>


                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblAccnum" runat="server" CssClass="label" Font-Names="Tahoma" Font-Size="8pt"
                        for="txtAccountNum" meta:resourcekey="lblAccnumResource1" Text="Account No" Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtAccountNum" runat="server" CssClass="textbox" Height="18px" meta:resourcekey="txtAccountNumResource1"
                        Style="margin-left: 0px" Width="100%" MaxLength="12" TabIndex="38"></asp:TextBox>
                </td>
                <td class="CellStyle2">
                    <asp:LinkButton ID="instruct" runat="server" Width="100%" meta:resourcekey="lnkinstructRescr1"
                        ForeColor="#CC0066" Visible="False" Height="17px"></asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="CellStyle">
                    <asp:Label ID="lblBnkRefNo0" runat="server" CssClass="label" Font-Names="Tahoma"
                        Font-Size="8pt" for="txtBnkRefNo" meta:resourcekey="lblBnkRefNoResource1" Text="Bank Ref No"
                        Width="100%" />
                </td>
                <td class="CellStyle">
                    <asp:TextBox ID="txtBnkRefNo" runat="server" CssClass="textbox" Height="16px" meta:resourcekey="txtBnkRefNoResource1"
                        Style="margin-left: 1px" Width="100%" MaxLength="12" TabIndex="39"></asp:TextBox>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblinstrcutSrc" runat="server" CssClass="label" Font-Names="Tahoma"
                        Font-Size="8pt" margin-left="4px" for="ddlinstrcutSrc" meta:resourcekey="lblinstrcutSrcResource1"
                        Text="Instrcut Source" Width="100%"></asp:Label>
                </td>
                <td class="CellStyle">
                    <asp:DropDownList ID="ddlinstrcutSrc" runat="server" CssClass="dropdownlist" Font-Names="Tahoma"
                        margin-left="4px" Font-Size="8pt" Height="23px" meta:resourcekey="ddlinstrcutSrcResource1"
                        Style="margin-left: 0px" Width="100%" Enabled="True" TabIndex="40">
                        <asp:ListItem meta:resourcekey="ListIteminstrcutSrcResource1" Text="Select Category"
                            Value="0"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListIteminstrcutSrcResource2" Text="Website" Value="1"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListIteminstrcutSrcResource3" Text="Bank" Value="2"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListIteminstrcutSrcResource4" Text="Internal" Selected="True"
                            Value="4"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListIteminstrcutSrcResource5" Text="Partial Payment"
                            Value="5" Enabled="False"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="CellStyle">
                    <asp:Label ID="lblinfavourof" runat="server" CssClass="label" Font-Names="Tahoma"
                        Font-Size="8pt" for="txtfavourof" meta:resourcekey="lblinfavourofResource1" Text="     In Favour Of"
                        Width="100%" />
                </td>
                <td class="CellStyle" colspan="3">
                    <asp:TextBox ID="txtfavourof" runat="server" CssClass="textbox" Height="16px" meta:resourcekey="txtfavourofResource1"
                        Style="margin-left: 0px" Width="100%" MaxLength="100" TabIndex="41"></asp:TextBox>
                </td>
                <td class="CellStyle2"></td>
            </tr>
            <tr>
                <td class="CellStyle">
                    <asp:Label ID="lblNotes" runat="server" CssClass="label" for="txtnotes" meta:resourcekey="lblNotesResource1"
                        Text="Notes" Width="100%" />
                </td>
                <td class="CellStyle" colspan="7">
                    <asp:TextBox ID="txtnotes" runat="server" CssClass="textbox" Height="25px" MaxLength="250"
                        meta:resourcekey="txtNotesResource1" onkeypress="return textboxMultilineMaxNumber(this,250);"
                        TextMode="MultiLine" Width="100%" TabIndex="42"></asp:TextBox>
                </td>
                <td class="CellStyle2"></td>
            </tr>
        </table>
        <table width="100%">
            <tr>
                <asp:GridView ID="grvInstruction" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                    DataKeyNames="ref_numb,donation_code" meta:resourcekey="grvPaymentsResource1"
                    ShowHeaderWhenEmpty="True" BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue"
                    CellPadding="0" Font-Size="10pt" ForeColor="DarkBlue" GridLines="None" Width="100%"
                    Font-Names="tahoma">
                    <Columns>
                        <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:ImageButton ID="LinkButton1" runat="server" CommandName="Update" ImageUrl="~/Content/images/save.png"
                                    meta:resourceKey="UpdateResource1" Text="Update" />
                                &nbsp;
                                    <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                        ImageUrl="~/Content/images/cancel.png" meta:resourceKey="CancelResource1" Text="Cancel"
                                        Style="height: 16px" />
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:ImageButton ID="lbtnAddDist" runat="server" ImageUrl="~/Content/images/add.png"
                                    meta:resourceKey="AddResource1" OnClick="lbtnAddDistFooter_Click" />
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:ImageButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                    ImageUrl="~/Content/images/edit.png" meta:resourceKey="EditResource1" Text="Edit" />
                                &nbsp;<asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                    ImageUrl="~/Content/images/delete.png" meta:resourceKey="DeleteResource1" Style="margin-left: 12px; width: 16px;"
                                    Text="Delete" />
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
                                    SelectCommand="SELECT donation_code , donation_cat , donation_descrar , donation_descreng FROM donations WHERE (donation_cat = @waqf_donation)  AND (ISNULL(Active, 0) = 1);">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlWaqfDonation" Name="waqf_donation" />

                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text='<%# Bind("donation_descrar") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="140px" />
                            <FooterStyle Width="120px" />
                            <HeaderStyle Width="120px" />
                            <ItemStyle Width="120px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Country" meta:resourceKey="txtHeadercountry">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_nat" runat="server" CssClass="dropdownlist" DataSourceID="Nat_EditDS"
                                    DataTextField="nat_descrar" DataValueField="nat_code" meta:resourcekey="ddl_natResource1" SelectedValue="<%# Bind('nat_code')%>">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="Nat_EditDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                                    SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddlCountryFooter" runat="server" CssClass="dropdownlist" DataSourceID="CountrySqlDataSource"
                                    DataTextField="nat_descrar" DataValueField="nat_code" meta:resourcekey="ddlCountryFooterResource1"
                                    Width="120px" AppendDataBoundItems="True" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlCountryFooter_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="CountrySqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                                    SelectCommand="SELECT * FROM [nat_tab] WHERE ([zone_code] IS NOT NULL)"></asp:SqlDataSource>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblCountry" runat="server" meta:resourcekey="lblCountryResource1"
                                    Text='<%# Eval("nat_descrar") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="90px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Value" meta:resourceKey="txtHeadervalue" SortExpression="instruct_value">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDistValueEdit" runat="server" CssClass="textbox" meta:resourcekey="txtDistValueEditResource1"
                                    Text='<%# Bind("donation_standard_value") %>' Enabled="False"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtDistValuefooter" runat="server" onkeypress="return isNumberKey(event)"
                                    CssClass="textbox" meta:resourcekey="txtDistValuefooterResource1" Enabled="False"
                                    MaxLength="10"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("donation_standard_value", "{0:N3}") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="55px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ref_numb" meta:resourceKey="txtrefNo" SortExpression="ref_numb"
                            Visible="False">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtrefnumedit" runat="server" Text='<%# Bind("ref_numb") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtrefnum" runat="server" CssClass="textbox" meta:resourcekey="txtrefnumResource1"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text='<%# Bind("ref_numb") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Payment" meta:resourcekey="txtpaymentResc">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtpaymentedit" runat="server" CssClass="textbox" Text='<%# Bind("totAmnt" , "{0:N3}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtpaymentfooter" runat="server" onkeypress="return isNumberKey(event)"
                                    CssClass="textbox" meta:resourcekey="txtpaymentfooterresource1" MaxLength="10"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblpayment" runat="server" meta:resourcekey="lblpaymentResc1" Text='<%# Bind("totAmnt" , "{0:N3}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity" meta:resourceKey="txtHeaderqty" SortExpression="quantity">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtquantEdit" runat="server" CssClass="textbox" Text='<%# Bind("quantity", "{0:N2}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtquantfooter" runat="server" onkeypress="return isNumberKey(event)"
                                    CssClass="textbox" meta:resourcekey="txtquantfooterResource1" MaxLength="10"
                                    onKeyDown="return insertByEnterKeyEx('lbtnAddDist');"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text='<%# Bind("quantity", "{0:N2}") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="50px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Amount" meta:resourceKey="txtTotamountrescNew">
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTotalEdit" runat="server" Enabled="False" CssClass="textbox"
                                    Text='<%# Bind("totAmnt" , "{0:N3}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtTotalFooter" runat="server" Enabled="False" CssClass="textbox"
                                    MaxLength="10" meta:resourcekey="txtTotalFooterResource1"></asp:TextBox>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbltotalamt" runat="server" meta:resourcekey="lbltotalamtResource1"
                                    Text='<%# Bind("totAmnt" , "{0:N3}") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle Width="75px" />
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
                        <asp:Label ID="lblPaymentEmpty" runat="server" Text="No Instructions" meta:resourcekey="lblPaymentEmptyResource1"></asp:Label>
                        <tr>
                            <td style="width: 100px">
                                <asp:ImageButton ID="lbtnAddDist" runat="server" OnClick="lbtnAddDist_Click" meta:resourcekey="lbtnAddDistResource1"
                                    ImageUrl="~/Content/images/add.png"></asp:ImageButton>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDonationNew" runat="server" DataSourceID="DonationTypeSDS3"
                                    DataTextField="donation_descrar" DataValueField="donation_code" OnSelectedIndexChanged="ddlDonationddlDonationNew_SelectedIndexChanged"
                                    AutoPostBack="True" meta:resourcekey="ddlDonationNewResource1" Width="140px">
                                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource14" Text="Please Select Donation Type"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="DonationTypeSDS3" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                                    SelectCommand="SELECT donation_code , donation_cat , donation_descrar , donation_descreng FROM donations WHERE (donation_cat = @waqf_donation)  AND (ISNULL(Active, 0) = 1);">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlWaqfDonation" Name="waqf_donation" PropertyName="SelectedValue" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlcountry" runat="server" AppendDataBoundItems="True" DataSourceID="countryDS"
                                    DataTextField="nat_descrar" DataValueField="nat_code" AutoPostBack="True" meta:resourcekey="ddlcountryResource1"
                                    Width="100px" OnSelectedIndexChanged="ddlcountry_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="countryDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                                    SelectCommand="SELECT * FROM [nat_tab] WHERE ([zone_code] IS NOT NULL)"></asp:SqlDataSource>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDistValue" runat="server" onkeypress="return isNumberKey(event)"
                                    meta:resourcekey="txtDistValueResource1" Enabled="False" MaxLength="10"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtpaymentval" runat="server" onkeypress="return isNumberKey(event)"
                                    meta:resourcekey="txtpaymentvalResrc1"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtquant" runat="server" onkeypress="return isNumberKey(event)"
                                    meta:resourcekey="txtquantResource1" MaxLength="10" onKeyDown="return insertByEnterKeyEx('lbtnAddDist');"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtTotal" runat="server" onkeypress="return isNumberKey(event)"
                                    meta:resourcekey="txtTotalResource1" Enabled="False" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                    </EmptyDataTemplate>
                </asp:GridView>
            </tr>
        </table>
        <table>
            <caption>
                <l>
                        </l>
            </caption>
        </table>
        <table>
        </table>
        <table class="style12">
            <tr>
                <td class="style13">
                    <asp:SqlDataSource ID="DOn_TpDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        SelectCommand="SELECT * FROM [donation_categories]"></asp:SqlDataSource>
                </td>
                <td class="style14">
                    <asp:SqlDataSource ID="campDS1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        SelectCommand="SELECT * FROM [campaign_tab]"></asp:SqlDataSource>
                </td>
                <td class="style15">
                    <asp:SqlDataSource ID="CurDS1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        SelectCommand="SELECT * FROM [currency_tab]"></asp:SqlDataSource>
                </td>
                <td class="style16">
                    <asp:SqlDataSource ID="statReasonDs" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        SelectCommand="SELECT * FROM [stat_reason_tab]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="bankSDC" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        SelectCommand="SELECT * FROM [banks_list]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style13">
                    <asp:SqlDataSource ID="bankBranchSDC" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        SelectCommand="SELECT bnk_code, brn_code, brn_namear, brn_nameng FROM bnk_brnchtab AS bnk_brnchtab_1 WHERE (bnk_code = @bnk_code) ORDER BY brn_namear">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlBnk" DefaultValue="0" Name="bnk_code" PropertyName="SelectedValue"
                                Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="style14">
                    <asp:SqlDataSource ID="SqlDataSource_DeductionStatus" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [DeductionStatus]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        SelectCommand="SearchArName" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtSearch" Name="ArName" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="InstDetailsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        DeleteCommand="DELETE FROM instruction_dist WHERE (ref_numb = @ref_numb) AND (donation_code = @donation_code)"
                        SelectCommand="SELECT instruction_dist.instruct_value, donations.donation_descrar, donations.donation_descreng, instruction_dist.ref_numb, instruction_dist.donation_code, instruction_dist.quantity, instruction_dist.nat_code, nat_tab.nat_descrar FROM donations INNER JOIN instruction_dist ON donations.donation_code = instruction_dist.donation_code LEFT OUTER JOIN nat_tab ON instruction_dist.nat_code = nat_tab.nat_code WHERE (instruction_dist.ref_numb = @ref_numb)"
                        UpdateCommand="UPDATE instruction_dist SET instruct_value = @instruct_value WHERE (ref_numb = @ref_numb) AND (donation_code = @donation_code)">
                        <DeleteParameters>
                            <asp:Parameter Name="ref_numb" />
                            <asp:Parameter Name="donation_code" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtReceiptID" DefaultValue="0" Name="ref_numb" PropertyName="Text" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter DefaultValue="" Name="instruct_value" />
                            <asp:ControlParameter ControlID="txtReceiptDate" Name="ref_numb" PropertyName="Text" />
                            <asp:ControlParameter ControlID="grvPayments" Name="donation_code" PropertyName="SelectedValue" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="Inst_detDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        SelectCommand="GetInstrcutionDetail" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtDonrIDn" DefaultValue="0" Name="ref_num" PropertyName="Text"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="lbtnCalNoOfMonth" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
