<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCCollectionV12.ascx.vb"
    Inherits="DirectAid.UCCollectionV12"
    ClientIDMode="Static" %>
<link href="../Styles/CRUXStyleSheet.css" rel="stylesheet" type="text/css" />
<link href="../Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="../Content/jquery.jnotify-alt.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery-1.7.2.js" type="text/javascript"></script>
<script src="../Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
<script src="../Scripts/jquery.jnotify.js" type="text/javascript"></script>
<script src="../Scripts/bootstrap.js" type="text/javascript"></script>
<script src="../Scripts/shortcut.js" type="text/javascript"></script>

<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>

<script type="text/javascript">

   


    //document.onkeydown = function (e) {
    //    var v = document.getElementById('BlockDecimalPointNew').value;
    //    if (v = true) {
    //    if (e.which == 110) {
    //        return false;
    //    }
    //}
    //}

    //function AddUsersKeyDown(e) {

    //    if (evtobj.which == 110) {
    //                return false;
    //            }

    //    //var target = evtobj.target;
    //    //if (evtobj.keyCode == 110) {
    //    //            return false;
    //    //        }

    //    //var v = document.getElementById('BlockDecimalPointNew').value;
    //    //        if (evtobj.keyCode == 110 && v == true) {
    //    //        return false;
    //    //    }
      
    //    //if (evtobj.keyCode == 75 && evtobj.ctrlKey) {
    //    //    AddUsers(target.id);

    //    //    return false;
    //    //}
    //}

    window.onload = function () {
        PatchJQuery();
    }

    var canSave = false;

    function RefreshDonations(sender) {
        PatchJQuery();
        sender.PerformCallback(null);
    }

    $(document).keypress(function (e) {
        if (e.which == "13") {
            e.preventDefault();

            if (canSave) {
                $("#btnConfirmSave").click();
                canSave = false;
                //$("#btnConfirmSave").prop('disabled', true);
            }
            else {
                //alert(canSave);
            }
        }
    });

    $(document).keyup(function(e) {
        if (e.keyCode == 27) {
            e.preventDefault();
            if (canSave) {
                $("#btnCancelSave").click();
            } else {
                //alert(canSave);
            }
        }  
    });

    function CancelButtonClick() {
        canSave = false;
    }

    function PatchJQuery() {
        if (!window.jQuery || !window.jQuery.clean)
            return;

        var original = window.jQuery.clean;
        window.jQuery.clean = function (elems, context, fragment, scripts) {
            var execResult = original.call(jQuery, elems, context, fragment, scripts);
            if (scripts && scripts.length) {
                for (var i = scripts.length - 1; i >= 0; i--) {
                    var script = scripts[i];
                    if (IsDXScript(script))
                        ArrayRemoveAt(scripts, i);
                }
            }
            return execResult;
        };
    }

    // Utils
    function IsDXScript(script) {
        alert(script && script.id && script.id.indexOf("dx") == 0);
        return script && script.id && script.id.indexOf("dx") == 0;
    }
    function ArrayRemoveAt(array, index) {
        if (index >= 0 && index < array.length) {
            for (var i = index; i < array.length - 1; i++)
                array[i] = array[i + 1];
            array.pop();
        }
    }

</script>

<script type="text/javascript">

    function pageLoad() {

        //Date picker for the Date
        //$("#txtReceiptDate").datepicker({
        //    dateFormat: 'dd/mm/yy',
        //    buttonImage: '../Content/images/calendar.png',
        //    buttonImageOnly: true,
        //    showOn: 'button',
        //    minDate: '-1M',
        //    maxDate: '+1M'
        //});

        //WAS FOR TEST AND KEPT FOR FUTURE USAGE BUT NOT USED RIGHT NOW
        function CalCulateNewLineAmount() {
            alert('');
            var qty = $("#txtQtyNew").val();
            var value = $("#txtDonationValueNew").val();

            if (value == 0) {
                var qtnew = 1;
                $("#txtQtyNew").val(qtnew);
            }
            else {
                var total = qty * value;

                if (!isNaN(total)) {
                    $("#txtLineAmountNew").val(total);
                } else {
                    $("#txtLineAmountNew").val('');
                }
            }
        }

        //WAS FOR TEST AND KEPT FOR FUTURE USAGE BUT NOT USED RIGHT NOW
        function CalCulateEditLineAmount() {
            var qty = $("#txtQtyEdit").val();
            var value = $("#txtDonationValue").val();
            var total = qty * value;

            if (!isNaN(total)) {
                $("#txtLineAmountEdit").val(total);
            }
            else {
                $("#txtLineAmountEdit").val('');
            }
        }

        //WAS FOR TEST AND KEPT FOR FUTURE USAGE BUT NOT USED RIGHT NOW
        function CalCulateFooterLineAmount() {
            var qty = $("#txtQtyFooter").val();
            var value = $("#txtDonationValueFooter").val();
            var total = qty * value;

            if (!isNaN(total)) {
                $("#txtLineAmountFooter").val(total);
            }
            else {
                $("#txtLineAmountFooter").val('');
            }
        }

        $('#txtDonationValue').keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 110
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                // let it happen, don't do anything
            }
            else {
                event.preventDefault();
            }
        });

        $('#txtDonationValueFooter').keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 110
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                // let it happen, don't do anything
            }
            else {
                event.preventDefault();
            }
        });

        $('#txtCivilID').keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                // let it happen, don't do anything
            }
            else {
                event.preventDefault();
            }
        });

        $('#txtQtyNew').keydown(function (event) {
            var v = document.getElementById('BlockDecimalPointNew').value;
            if (v == "true" || v == "True") {
                //alert("true");
                if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 190
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                    // let it happen, don't do anything
                    //alert("true_1");
                }
                else {
                    event.preventDefault();
                    //alert("true_2");
                }
            }
            else {
                //alert("false");
                if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 110
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                    // let it happen, don't do anything
                    //alert("false_1");
                }
                else {
                    event.preventDefault();
                    //alert("false_2");
                }
            }
            
        });

        $('#txtQtyEdit').keydown(function (event) {
            //if (event.keyCode == 46 || event.keyCode == 8
            //    || event.keyCode == 9 || event.keyCode == 110
            //        || (event.keyCode >= 48 && event.keyCode <= 57)
            //            || (event.keyCode >= 96 && event.keyCode <= 105)
            //                || event.keyCode == 190
            //                    || (event.keyCode >= 37 && event.keyCode <= 40)) {
            //    // let it happen, don't do anything
            //}
            //else {
            //    event.preventDefault();
            //}
            
            var v = document.getElementById('BlockDecimalPoint').value;

            if (v == "true" || v == "True") {
              
                if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 190
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                    // let it happen, don't do anything
                    
                }
                else {
                    event.preventDefault();
                   
                }
            }
            else {
                
                if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 110
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                    // let it happen, don't do anything
                   
                }
                else {
                    event.preventDefault();
        
                }
            }


        });

        $('#txtQtyFooter').keydown(function (event) {
            //if (event.keyCode == 46 || event.keyCode == 8
            //    || event.keyCode == 9 || event.keyCode == 110
            //        || (event.keyCode >= 48 && event.keyCode <= 57)
            //            || (event.keyCode >= 96 && event.keyCode <= 105)
            //                || event.keyCode == 190
            //                    || (event.keyCode >= 37 && event.keyCode <= 40)) {
            //    // let it happen, don't do anything
            //}
            //else {
            //    event.preventDefault();
            //}
           
            var v = document.getElementById('BlockDecimalPointFooter').value;
            if (v == "true" || v == "True") {
              
                if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 190
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                    // let it happen, don't do anything
                    
                }
                else {
                    event.preventDefault();
                    
                }
            }
            else {
               
                if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 110
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                    // let it happen, don't do anything
                   
                }
                else {
                    event.preventDefault();
                   
                }
            }


        });

        $('#txtLineAmountNew').keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 110
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                // let it happen, don't do anything
            }
            else {
                event.preventDefault();
            }
        });

        $('#txtLineAmountEdit').keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 110
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                // let it happen, don't do anything
            }
            else {
                event.preventDefault();
            }
        });

        $('#txtLineAmountFooter').keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 110
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                // let it happen, don't do anything
            }
            else {
                event.preventDefault();
            }
        });


        $('#txtPaymentAmountNew').keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 110
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                // let it happen, don't do anything
            }
            else {
                event.preventDefault();
            }
        });

        $('#txtPaymentAmountEdit').keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 110
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                // let it happen, don't do anything
            }
            else {
                event.preventDefault();
            }
        });

        $('#txtPaymentAmountFooter').keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8
                || event.keyCode == 9 || event.keyCode == 110
                    || (event.keyCode >= 48 && event.keyCode <= 57)
                        || (event.keyCode >= 96 && event.keyCode <= 105)
                            || event.keyCode == 190
                                || (event.keyCode >= 37 && event.keyCode <= 40)) {
                // let it happen, don't do anything
            }
            else {
                event.preventDefault();
            }
        });

        //Calculate the Donation Dist Line Amount
        //New
        $("#txtQtyNew").keyup(function () {


            var qty = $("#txtQtyNew").val();
            var value = $("#txtDonationValueNew").val().replace(",", "");

            if (value == 0) {
                var qtnew = 1;
                $("#txtQtyNew").val(qtnew);
            }
            else {
                var total = qty * value;

                if (!isNaN(total)) {
                    $("#txtLineAmountNew").val(total);
                } else {
                    $("#txtLineAmountNew").val('');
                }
            }
        });


        // Edit
        $("#txtQtyEdit").keyup(function () {


            var qty = $("#txtQtyEdit").val();
            var value = $("#txtDonationValue").val().replace(",", "");
            var total = qty * value;

            if (!isNaN(total)) {
                $("#txtLineAmountEdit").val(total);
            }
            else {
                $("#txtLineAmountEdit").val('');
            }

        });



        // Footer
        $("#txtQtyFooter").keyup(function () {


            var qty = $("#txtQtyFooter").val();
            var value = $("#txtDonationValueFooter").val().replace(",", "");
            var total = qty * value;

            if (!isNaN(total)) {
                $("#txtLineAmountFooter").val(total);
            }
            else {
                $("#txtLineAmountFooter").val('');
            }

        });



        //Put 0 when user left the quantity field empty
        $("#txtQtyNew").blur(function () {

            if ($("#txtQtyNew").val() === "") {
                $("#txtQtyNew").val("0");
            }
        });

        $("#txtQtyEdit").blur(function () {

            if ($("#txtQtyNew").val() === "") {
                $("#txtQtyNew").val("0");
            }
        });

        $("#txtQtyFooter").blur(function () {

            if ($("#txtQtyFooter").val() === "") {
                $("#txtQtyFooter").val("0");
            }
        });

        //Calculate the Donation Dist Line Qty
        //New
        $("#txtLineAmountNew").keyup(function () {


            var total = $("#txtLineAmountNew").val();
            var value = $("#txtDonationValueNew").val().replace(",", "");

            if (value == 0) {

                var qtnew = 1;
                $("#txtQtyNew").val(qtnew);

            }
            else {

                var qty = (total / value);
                var qty1 = qty; //qty.toPrecision(3);

                if (!isNaN(qty)) {
                    $("#txtQtyNew").val(qty1);
                } else {
                    $("#txtQtyNew").val('');
                }
            }
        });

        // Edit
        $("#txtLineAmountEdit").keyup(function () {


            var total = $("#txtLineAmountEdit").val();
            var value = $("#txtDonationValue").val().replace(",", "");

            if (value == 0) {

                var qtedt = 1;
                $("#txtQtyEdit").val(qtedt);

            }
            else {
                var qty = total / value;
                var qty1 = qty; //.toPrecision(5);

                if (!isNaN(total)) {
                    $("#txtQtyEdit").val(qty1);
                }
                else {
                    $("#txtQtyEdit").val('');
                }
            }
        });

        // Footer
        $("#txtLineAmountFooter").keyup(function () {


            var total = $("#txtLineAmountFooter").val();
            var value = $("#txtDonationValueFooter").val().replace(",", "");

            if (value == 0) {

                var qtedt = 1;
                $("#txtQtyFooter").val(qtedt);

            }
            else {
                var qty = total / value;
                var qty1 = qty;//qty.toPrecision(5);

                if (!isNaN(total)) {
                    $("#txtQtyFooter").val(qty1);
                }
                else {
                    $("#txtQtyFooter").val('');
                }
            }
        });


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

    function ShowDonorInfo() {
        var donorID = document.getElementById("txtDonorID").value;

        if (donorID != "") {
            var url = "UIDonorProfileView.aspx?DonorID=" + donorID;
            window.open(url, 'DonorProfileView', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600');
        }
    }

    function textboxMultilineMaxNumber(txt, maxLen) {

        if (txt.value.length > (maxLen - 1)) return false;
        else {
            return true;
        }
    }

    function CivilIdSearchValidate(oSrc, args) {

        var digaray = new Array(10);
        var cd;
        var summ = 0;
        var remainder = 0;
        var i;
        var j;
        var h;
        var CivilianIdValue;
        var s;

        h = document.getElementById("ddlSearchType").value;
        //civil id option = 1 , passport 2 , without civil 3
        if (h == 1) {
            j = document.getElementById("txtCivilID");
            CivilianIdValue = j.value;
            if (CivilianIdValue == '') return false;
            //alert (civil_id);                                                                                     
            //remainder = 0;
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
    }

    function ClearAllControls() {

        for (i = 0; i < document.forms[0].length; i++) {

            doc = document.forms[0].elements[i];

            switch (doc.type) {

                case "text":

                    doc.value = "";

                    break;

                case "checkbox":

                    doc.checked = false;

                    break;

                case "radio":

                    doc.checked = false;

                    break;

                case "select-one":

                    doc.options[doc.selectedIndex].selected = false;

                    break;

                case "select-multiple":

                    while (doc.selectedIndex != -1) {

                        indx = doc.selectedIndex;

                        doc.options[indx].selected = false;

                    }

                    doc.selected = false;

                    break;



                default:

                    break;

            }

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

        j = document.getElementById("txtCivilID");
        CivilianIdValue = j.value;
        if (CivilianIdValue == '') return false;
        //alert (civil_id);                                                                                     
        //remainder = 0;
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

    function ValidateAlpha() {
        var keyCode = window.event.keyCode;
        if ((keyCode < 65 || keyCode > 90) && (keyCode < 97 || keyCode > 123) && keyCode != 32) {
            window.event.returnValue = false;
        }
    }


    //function onBlurAlert(valueTextboxId) {
    //var value = document.getElementById(valueTextboxId.Id);
    //if (valueTextboxId != null) {
    //var culture = '<%= _culture %>';

    //if (valueTextboxId.value != '') {
    //if (culture === 'ar') {
    //alert("لقد أضفت سطر جديد هل تريد حفظه؟")
    //  } else {
    //alert("You input a value in the new row, please save it if you want!")
    //   }
    //  }
    //  }
    //  }

    shortcut.add("F2", function () {

        var resetButton = document.getElementById("btnReset");

        resetButton.click();

    });

    shortcut.add("F3", function () {

        var searchButton = document.getElementById("btnSearch");

        searchButton.click();
    });

    shortcut.add("f4", function () {

        var creatDonor = document.getElementById("btnEnableDonorProfile");

        creatDonor.click();

    });

    shortcut.add("F8", function () {

        var printButton = document.getElementById("btnPrint");

        if (!printButton.disabled) {
            canSave = true;

            printButton.focus();

            printButton.click();
        }
    });

    shortcut.add("f6", function () {

        var createdonor = document.getElementById("btnCreate");

        createdonor.click();

    });

    function PrintReceipt() {
        window.open("ReportViewer.aspx?popup=1", "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600");
    }

</script>

<asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="560">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel" runat="server">
    <ContentTemplate>
        <%--<asp:LinkButton runat="server" Text="Refresh" ID="lbtnUpdate"></asp:LinkButton>--%>
        <asp:Panel ID="pnlPartialInstructions" CssClass="modal" Style="display: none;" runat="server">
            <div class="modal-header header-label">
                <asp:Label ID="lblPartialHeader" runat="server" CssClass="header-label" Text="Donations is not fully paid"
                    meta:resourcekey="lblPartialHeaderResource1"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:GridView ID="grvPartialInstructions" runat="server" AutoGenerateColumns="False"
                    BackColor="White" BorderColor="LightSteelBlue" BorderWidth="1px" CellPadding="15"
                    DataKeyNames="ref_numb" Font-Name="tahoma" Font-Size="10pt" ForeColor="DarkBlue"
                    GridLines="None" HeaderStyle-BackColor="#aaaadd" HorizontalAlign="Center">
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="AliceBlue" />
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="Ivory" Font-Bold="False" Font-Italic="False" Font-Overline="False"
                        Font-Strikeout="False" Font-Underline="False" ForeColor="DeepPink" />
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="Select" runat="server" CausesValidation="false" CommandName="Select"
                                    ImageUrl="~/Content/images/add.png" Text="Select" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="No." meta:resourcekey="TemplateFieldResource17">
                            <ItemTemplate>
                                <asp:Label ID="lblRefNumber" runat="server" Text='<%# Bind("ref_numb") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Donation" meta:resourcekey="TemplateFieldResource18">
                            <ItemTemplate>
                                <asp:Label ID="lblDonation" runat="server" Text='<%# Bind("donation_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" meta:resourcekey="TemplateFieldResource19">
                            <ItemTemplate>
                                <asp:Label ID="lblInstructDate" runat="server" Text='<%# Bind("instruct_date","{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Value" meta:resourcekey="TemplateFieldResource20">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalValue" runat="server" Text='<%# Bind("total_deduct_value") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Remaining" meta:resourcekey="TemplateFieldResource21">
                            <ItemTemplate>
                                <asp:Label ID="lblRemaining" runat="server" Text='<%# Bind("remaining") %>'></asp:Label>
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
                <asp:Button ID="btnCloseModal" Text="New" CssClass="google-button google-button-blue"
                    runat="server" meta:resourcekey="btnCloseModalResource1"  UseSubmitBehavior="False" />
            </div>
        </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="pnlPartialInstructions_ModalPopupExtender" runat="server"
            DynamicServicePath="" Enabled="True" TargetControlID="HiddenForModel2" PopupControlID="pnlPartialInstructions"
            BackgroundCssClass="ModalBackground" DropShadow="True" CancelControlID="btnCloseModal"
            RepositionMode="RepositionOnWindowResizeAndScroll" BehaviorID="ModalBehaviour">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Button ID="HiddenForModel2" Text="" runat="server" CssClass="hide" CausesValidation="False" UseSubmitBehavior="False" />
        <asp:Panel ID="pnlSaveConfirmation" CssClass="modal" runat="server"
            DefaultButton="btnConfirmSave" Style="display: none;">
            <div class="modal-header header-label">
                <asp:Label ID="lblSaveConfirmationHeader" CssClass="header-label" runat="server"
                    Text="Confirmation" meta:resourcekey="lblSaveConfirmationHeaderResource1"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:Label Text="Are you sure you want to save the receipt?" ID="lblConfirmation"
                    runat="server" meta:resourcekey="lblConfirmationResource1" Font-Bold="True" Font-Names="tahoma"
                    Font-Size="Large" />
            </div>
            <div class="modal-footer">
                <table align="center" width="100%">
                    <tr>
                        <td align="center" style="width: 20%">
                            <asp:Button ID="btnConfirmSave" Text="Yes" 
                                runat="server" meta:resourcekey="btnConfirmSaveResource1" OnClick="btnConfirmSave_Click"
                                Font-Size="Large" Width="100%" BackColor="#009933" UseSubmitBehavior="False" />
                        </td>
                        <td align="center" style="width: 20%"></td>
                        <td align="center" style="width: 20%">
                            <asp:UpdateProgress ID="UpdateProgress2" runat="server" DisplayAfter="100">
                                <ProgressTemplate>
                                    <img class="auto-style1" src="../images/loading_icon_1.gif" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </td>
                        <td align="center" style="width: 20%"></td>
                        <td align="center" style="width: 20%">
                            <asp:Button ID="btnCancelSave" Text="No" OnClientClick="CancelButtonClick();"
                                runat="server" meta:resourcekey="btnCancelSaveResource1" Font-Size="Large" Width="100%" ForeColor="Black" BackColor="Red" UseSubmitBehavior="False" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlPrintConfirmation" CssClass="modal" Style="display: none;" runat="server"
            DefaultButton="btnConfirmPrint">
            <div class="modal-header header-label">
                <asp:Label ID="lblPrintConfirmationHeader" runat="server" CssClass="header-label"
                    Text="Confirmation" meta:resourcekey="lblPrintConfirmationHeaderResource1"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:Label Text="Do you want to print the receipt?" ID="lblPrintConfirmation" runat="server"
                    meta:resourcekey="lblPrintConfirmationResource1" Font-Bold="True" Font-Names="tahoma"
                    Font-Size="Large" />
            </div>
            <div class="modal-footer">
                <table align="center" width="100%">
                    <tr>
                        <td align="center" style="width: 20%">
                            <asp:Button ID="btnConfirmPrint" Text="Yes" CssClass="google-button google-button-blue"
                                runat="server" meta:resourcekey="btnConfirmSaveResource1" Font-Size="Large"
                                Width="100%" UseSubmitBehavior="False" />
                        </td>
                        <td align="center" style="width: 20%"></td>
                        <td align="center" style="width: 20%">
                            <asp:UpdateProgress ID="UpdateProgress3" runat="server" DisplayAfter="100">
                                <ProgressTemplate>
                                    <img class="auto-style1" src="../images/loading_icon_1.gif" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </td>
                        <td align="center" style="width: 20%"></td>
                        <td align="center" style="width: 20%">
                            <asp:Button ID="btnCancelPrint" Text="No" CssClass="google-button google-button-red"
                                runat="server" meta:resourcekey="btnCancelSaveResource1" Font-Size="Large" Width="100%" UseSubmitBehavior="False" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <asp:Button ID="HiddenForModel1" Text="" runat="server" CssClass="hide" CausesValidation="False"  UseSubmitBehavior="False" />
        <ajaxToolkit:ModalPopupExtender ID="pnlPrintConfirmation_ModalPopupExtender" runat="server"
            DynamicServicePath="" Enabled="True" TargetControlID="HiddenForModel1" PopupControlID="pnlPrintConfirmation"
            BackgroundCssClass="ModalBackground" DropShadow="True" CancelControlID="btnCancelPrint"
            RepositionMode="RepositionOnWindowResizeAndScroll">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Panel ID="pnlRePrintConfirmation" CssClass="modal" Style="display: none;" runat="server"
            DefaultButton="btnConfirmPrint">
            <div class="modal-header header-label">
                <asp:Label ID="lblRePrintConfirmationHeader" runat="server" CssClass="header-label"
                    Text="Confirmation" meta:resourcekey="lblRePrintConfirmationHeaderResource1"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:Label Text="Do you want to print the receipt?" ID="lblRePrintConfirmation" runat="server"
                    meta:resourcekey="lblRePrintConfirmationResource1" Font-Bold="True" Font-Names="tahoma"
                    Font-Size="Large" />
            </div>
            <div class="modal-footer">
                <table align="center" width="100%">
                    <tr>
                        <td align="center" style="width: 20%">
                            <asp:Button ID="btnRePrintYesConfirmation" Text="Yes" CssClass="google-button google-button-blue"
                                runat="server" meta:resourcekey="btnConfirmSaveResource1" Font-Size="Large" Width="100%" UseSubmitBehavior="False" />
                        </td>
                        <td align="center" style="width: 20%"></td>
                        <td align="center" style="width: 20%">
                            <asp:UpdateProgress ID="UpdateProgress4" runat="server" DisplayAfter="100">
                                <ProgressTemplate>
                                    <img class="auto-style1" src="../images/loading_icon_1.gif" />
                                </ProgressTemplate>
                            </asp:UpdateProgress>
                        </td>
                        <td align="center" style="width: 20%"></td>
                        <td align="center" style="width: 20%">
                            <asp:Button ID="btnRePrintNoConfirmation" Text="No" CssClass="google-button google-button-red"
                                runat="server" meta:resourcekey="btnCancelSaveResource1" Font-Size="Large" Width="100%" UseSubmitBehavior="False" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlTotalDonations" CssClass="modal" Style="display: none;" runat="server">
            <div class="modal-header header-label">
                <asp:Label ID="lblTotalDonationHeader" runat="server" CssClass="header-label" Text="Donations Details"
                    meta:resourcekey="lblTotalDonationHeaderResource1"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:GridView ID="grvTotalDonation" runat="server" AutoGenerateColumns="False" DataKeyNames="reciept_num"
                    BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue" CellPadding="25"
                    Font-Name="tahoma" Font-Size="8pt" ForeColor="DarkBlue" HeaderStyle-BackColor="#aaaadd"
                    HorizontalAlign="Center" GridLines="None">
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="AliceBlue"></AlternatingRowStyle>
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                    <SelectedRowStyle BackColor="Ivory" Font-Bold="False" ForeColor="DeepPink" Font-Italic="False"
                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></SelectedRowStyle>
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="8pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="Receipt#" meta:resourcekey="TemplateFieldResource22">
                            <ItemTemplate>
                                <asp:Label ID="lblRefNumber" runat="server" Text='<%# Bind("reciept_num") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Receipt Manaual#" meta:resourcekey="TemplateFieldResource23">
                            <ItemTemplate>
                                <asp:Label ID="lblDonation" runat="server" Text='<%# Bind("reciept_num_manual") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" meta:resourcekey="TemplateFieldResource24">
                            <ItemTemplate>
                                <asp:Label ID="lblInstructDate" runat="server" Text='<%# Bind("reciept_date","{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Value" meta:resourcekey="TemplateFieldResource25">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalValue" runat="server" Text='<%# Bind("total_amount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Currency" meta:resourcekey="TemplateFieldResource26">
                            <ItemTemplate>
                                <asp:Label ID="lblRemaining" runat="server" Text='<%# Bind("currency") %>'></asp:Label>
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
                <asp:Button ID="btnCloseModal2" Text="Close" CssClass="google-button google-button-blue"
                    runat="server" meta:resourcekey="btnCloseSearchResource1"  UseSubmitBehavior="False" />
            </div>
        </asp:Panel>
        <asp:Panel ID="pnlTotalWaqf" CssClass="modal" Style="display: none;" runat="server">
            <div class="modal-header header-label">
                <asp:Label ID="lblTotalWaqfHeader" runat="server" CssClass="header-label" Text="Waqf Details"
                    meta:resourcekey="lblTotalWaqfHeaderResource1"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:GridView ID="grvTotalWaqf" runat="server" AutoGenerateColumns="False" DataKeyNames="reciept_num"
                    BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue" CellPadding="15"
                    Font-Name="tahoma" Font-Size="10pt" ForeColor="DarkBlue" HeaderStyle-BackColor="#aaaadd"
                    HorizontalAlign="Center" GridLines="None">
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="AliceBlue"></AlternatingRowStyle>
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                    <SelectedRowStyle BackColor="Ivory" Font-Bold="False" ForeColor="DeepPink" Font-Italic="False"
                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></SelectedRowStyle>
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="Receipt#" meta:resourcekey="TemplateFieldResource22">
                            <ItemTemplate>
                                <asp:Label ID="lblRefNumber" runat="server" Text='<%# Bind("reciept_num") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Receipt Manaual#" meta:resourcekey="TemplateFieldResource23">
                            <ItemTemplate>
                                <asp:Label ID="lblDonation" runat="server" Text='<%# Bind("reciept_num_manual") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" meta:resourcekey="TemplateFieldResource24">
                            <ItemTemplate>
                                <asp:Label ID="lblInstructDate" runat="server" Text='<%# Bind("reciept_date","{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Value" meta:resourcekey="TemplateFieldResource25">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalValue" runat="server" Text='<%# Bind("total_amount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Currency" meta:resourcekey="TemplateFieldResource26">
                            <ItemTemplate>
                                <asp:Label ID="lblRemaining" runat="server" Text='<%# Bind("currency") %>'></asp:Label>
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
                <asp:Button ID="btnCloseModal3" Text="Close" CssClass="google-button google-button-blue"
                    runat="server" meta:resourcekey="btnCloseSearchResource1"  UseSubmitBehavior="False" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlDeleteConfirmation" CssClass="modal" Style="display: none;" runat="server"
            DefaultButton="btnDeleteNoConfirmation">
            <div class="modal-header header-label">
                <asp:Label ID="lblDeleteConfirmationHeader" runat="server" CssClass="header-label"
                    Text="Confirmation" meta:resourcekey="lblDeleteConfirmationHeaderResource1"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:Label Text="Do you want to Delete the receipt?" ID="lblDeleteConfirmation" runat="server"
                    meta:resourcekey="lbldeleteConfirmationResource1" Font-Bold="True" Font-Names="tahoma"
                    Font-Size="Large" />
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnDeleteYesConfirmation" Text="Yes" CssClass="google-button google-button-blue"
                    runat="server" meta:resourcekey="btnConfirmSaveResource1" Font-Size="Large" OnClick="btnVoid_Click" />
                <asp:Button ID="btnDeleteNoConfirmation" Text="No" CssClass="google-button google-button-red"
                    runat="server" meta:resourcekey="btnCancelSaveResource1" Font-Size="Large" UseSubmitBehavior="False" />
            </div>
        </asp:Panel>
        <%--Modal for Search by Name--%>
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
                                <asp:HyperLink ID="lnkDonorId" runat="server" NavigateUrl='<%# Bind("donor_id","~/Collection.aspx?DonorId={0}") %>'
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
                    runat="server" meta:resourcekey="btnCloseSearchResource1"  UseSubmitBehavior="False" />
            </div>
        </asp:Panel>
        <ajaxToolkit:ModalPopupExtender ID="pnlSreachResult_ModalPopupExtender" runat="server"
            DynamicServicePath="" Enabled="True" TargetControlID="HiddenForModel3" PopupControlID="pnlSreachResult"
            BackgroundCssClass="ModalBackground" DropShadow="True" CancelControlID="btnCloseSearchResult"
            RepositionMode="RepositionOnWindowResizeAndScroll">
        </ajaxToolkit:ModalPopupExtender>
        <asp:Button ID="HiddenForModel3" Text="" runat="server" CssClass="hide" CausesValidation="False"  UseSubmitBehavior="False" />
        <asp:Panel ID="pnlDonorPartialPayments" CssClass="modal" Style="display: none;" runat="server">
            <div class="modal-header header-label">
                <asp:Label ID="Label2" runat="server" CssClass="header-label" Text="Donations is not fully paid"
                    meta:resourcekey="lblPartialHeaderResource1"></asp:Label>
            </div>
            <div class="modal-body">
                <asp:GridView ID="grvDonorPartialPayments" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="ref_numb" BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue"
                    CellPadding="15" Font-Name="tahoma" Font-Size="10pt" ForeColor="DarkBlue" HeaderStyle-BackColor="#aaaadd"
                    HorizontalAlign="Center" GridLines="None">
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <AlternatingRowStyle BackColor="AliceBlue"></AlternatingRowStyle>
                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                    <SelectedRowStyle BackColor="Ivory" Font-Bold="False" ForeColor="DeepPink" Font-Italic="False"
                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></SelectedRowStyle>
                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                        Height="25px" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="No." meta:resourcekey="TemplateFieldResource17">
                            <ItemTemplate>
                                <asp:Label ID="lblRefNumber" runat="server" Text='<%# Bind("ref_numb") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Donation" meta:resourcekey="TemplateFieldResource18">
                            <ItemTemplate>
                                <asp:Label ID="lblDonation" runat="server" Text='<%# Bind("donation_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" meta:resourcekey="TemplateFieldResource19">
                            <ItemTemplate>
                                <asp:Label ID="lblInstructDate" runat="server" Text='<%# Bind("instruct_date","{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Value" meta:resourcekey="TemplateFieldResource20">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalValue" runat="server" Text='<%# Bind("total_deduct_value") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Remaining" meta:resourcekey="TemplateFieldResource21">
                            <ItemTemplate>
                                <asp:Label ID="lblRemaining" runat="server" Text='<%# Bind("remaining") %>'></asp:Label>
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
                <asp:Button ID="btnClosePartialPayments" Text="Close" CssClass="google-button google-button-blue"
                    runat="server" meta:resourcekey="btnCloseSearchResource1"  UseSubmitBehavior="False" />
            </div>
        </asp:Panel>


        <table align="center" width="100%">
            <tr>
                <td align="center" style="width: 10%;">
                    <asp:CheckBox ID="CheckBox_SearchMode" runat="server" Checked="false" AutoPostBack="True"
                        Text="Activate search" meta:resourcekey="chkActiveChkRes" Font-Names="Tahoma"
                        Font-Size="11px" ForeColor="#0033CC" Width="100%" />
                </td>
                <td align="center" style="width: 10%;">
                    <asp:Button ID="btnSearch" runat="server" CssClass="google-button google-button-blue"
                        meta:resourcekey="btnSearchResource1" Text="Search" ValidationGroup="civilIdValidation"
                        Visible="false" Width="100%" UseSubmitBehavior="False" Font-Bold="True" />
                </td>
                <td align="center" style="width: 10%;">
                    <asp:Button ID="btnCreate" runat="server" CssClass="google-button google-button-blue"
                        meta:resourcekey="btnCreateResource1" Text="Create" ValidationGroup="SaveDonor"
                        Width="100%" UseSubmitBehavior="False" Font-Bold="True" />
                </td>
                <td align="center" style="width: 10%;">
                    <asp:Button ID="btnEnableDonorProfile" runat="server" CssClass="google-button google-button-blue"
                        meta:resourcekey="btnEnableDonorProfileResource1" Text="Create" Width="100%" UseSubmitBehavior="False" Font-Bold="True" />
                </td>
                <td align="center" style="width: 10%;">
                    <asp:Button ID="btnOpen" runat="server" CssClass="google-button google-button-blue"
                        meta:resourcekey="btnOpenResource1" Text="Open" Width="100%" UseSubmitBehavior="False" Font-Bold="True" />
                </td>
                <td align="center" style="width: 10%;">
                    <asp:Button ID="btnRePrint" runat="server" CssClass="google-button google-button-blue"
                        meta:resourcekey="btnRePrintResource1" Enabled="true" Text="Re-Print Receipt"
                        Width="100%" Font-Bold="True" />
                    <ajaxToolkit:ModalPopupExtender ID="btnRePrint_ModalPopupExtender" runat="server"
                        BackgroundCssClass="ModalBackground" CancelControlID="btnRePrintNoConfirmation"
                        DropShadow="True" DynamicServicePath="" Enabled="True" PopupControlID="pnlRePrintConfirmation"
                        RepositionMode="RepositionOnWindowResizeAndScroll" TargetControlID="btnRePrint">
                    </ajaxToolkit:ModalPopupExtender>
                </td>
                <td align="center" style="width: 10%;">
                    <asp:Button ID="btnPrint" runat="server"
                        meta:resourcekey="btnPrintResource1" Text="Print Receipt" Width="100%" BackColor="#33CC33" Font-Bold="True"/>
                    <ajaxToolkit:ModalPopupExtender ID="pnlSaveConfirmation_ModalPopupExtender" runat="server"
                        BackgroundCssClass="ModalBackground" CancelControlID="btnCancelSave" DropShadow="True"
                        DynamicServicePath="" Enabled="True" PopupControlID="pnlSaveConfirmation" RepositionMode="RepositionOnWindowResizeAndScroll"
                        TargetControlID="btnPrint">
                    </ajaxToolkit:ModalPopupExtender>
                </td>
                <td align="center" style="width: 10%;">
                    <asp:Button ID="btnReset" runat="server" CssClass="google-button google-button-blue"
                        meta:resourcekey="btnResetResource1" Text="Reset" Width="100%" UseSubmitBehavior="False" Font-Bold="True" />
                </td>
                <td align="center" style="width: 10%;">
                    <asp:Button ID="btnPratialPayments" runat="server" CssClass="google-button google-button-blue"
                        meta:resourcekey="btnPratialPaymentsResource1" Text="Pratial Payments" Width="100%" UseSubmitBehavior="False" Font-Bold="True" />
                    <ajaxToolkit:ModalPopupExtender ID="pnlDonorPartialPayments_ModalPopupExtender" runat="server"
                        BackgroundCssClass="ModalBackground" CancelControlID="btnClosePartialPayments"
                        DropShadow="True" DynamicServicePath="" Enabled="True" PopupControlID="pnlDonorPartialPayments"
                        RepositionMode="RepositionOnWindowResizeAndScroll" TargetControlID="btnPratialPayments">
                    </ajaxToolkit:ModalPopupExtender>
                </td>
                <td align="center" style="width: 10%;">
                    <asp:Button ID="btnVoid" runat="server" meta:resourcekey="btnVoidResource1" Text="Void"
                        BorderStyle="Double" ForeColor="Red" BorderColor="Red" Width="100%" UseSubmitBehavior="False" Font-Bold="True" />
                    <ajaxToolkit:ModalPopupExtender ID="btnDelete_ModalPopupExtender" runat="server"
                        BackgroundCssClass="ModalBackground" CancelControlID="btnDeleteNoConfirmation"
                        DropShadow="True" DynamicServicePath="" Enabled="True" PopupControlID="pnlDeleteConfirmation"
                        RepositionMode="RepositionOnWindowResizeAndScroll" TargetControlID="btnVoid">
                    </ajaxToolkit:ModalPopupExtender>

                </td>

            </tr>
        </table>
        <%--<table align="center" width="100%">
                <tr>
                    <td class="header-label">
                        <asp:Label ID="lblSearchHeader" Text="Search" runat="server" CssClass="header-label"
                            meta:resourcekey="lblSearchHeaderResource1" />
                    </td>
                </tr>
                
                </table>--%>
        <table align="center" width="100%">
            <tr>
                <%--                    <td align="center" style="width: 10%;">
                        <asp:DropDownList ID="ddlSearchType" runat="server" CssClass="dropdownlist" 
                            meta:resourcekey="ddlSearchTypeResource1" AppendDataBoundItems="True" 
                            DataSourceID="TitleDS">
                            <asp:ListItem Value="0" Text="ID" meta:resourcekey="ListItemResource1" />
                            <asp:ListItem Value="1" Text="Civil ID" meta:resourcekey="ListItemResource2" />
                            <asp:ListItem Value="2" Text="Phone" meta:resourcekey="ListItemResource3" />
                            <asp:ListItem Value="3" Text="Mobile" meta:resourcekey="ListItemResource4" />
                            <asp:ListItem Value="4" Text="Arabic Name" meta:resourcekey="ListItemResource5" />
                            <asp:ListItem Value="5" Text="English Name" meta:resourcekey="ListItemResource6" />
                            <asp:ListItem Value="6" Text="Receipt ID" meta:resourcekey="ListItemResource7" />
                        </asp:DropDownList>
                      
                      </td>
                      <td align="center" style="width: 32%;">
                        <asp:TextBox ID="txtSearch" CssClass="textbox" runat="server" MaxLength="50" meta:resourcekey="txtSearchResource1"
                             onKeyDown="return insertByEnterKey('btnSearch');" Height="18px" 
                              Width="204px"></asp:TextBox>
                       
                       </td>--%>
                <td align="center" style="width: 23%;">
                    <asp:LinkButton ID="lbtnCulture" runat="server" CausesValidation="False" Font-Size="9pt"
                        meta:resourcekey="lbtnCultureResource1" Visible="false">عربي</asp:LinkButton>
                    <asp:CustomValidator ID="civilIdValidator" runat="server" ControlToValidate="txtCivilID"
                        ErrorMessage="Invalid Civil ID" ForeColor="Red" ValidationGroup="civilIdValidation"
                        ClientValidationFunction="CivilIdSearchValidate" meta:resourcekey="civilIdValidatorResource1"
                        Display="Dynamic" Font-Size="9pt"></asp:CustomValidator>
                </td>
                <td align="center" style="width: 35%;">&nbsp;</td>
            </tr>
        </table>
        <table align="center" width="100%">
            <tr>
                <td class="header-label">
                    <asp:Label ID="lblDonorInfoHeader0" Text="Donor Information" runat="server" CssClass="header-label"
                        meta:resourcekey="lblDonorInfoHeaderResource1" Width="100%" />
                </td>
            </tr>
        </table>
        <table align="center" width="100%">
            <tr>
                <td align="center" style="width: 10%;" width="10%">
                    <asp:Label ID="lblsalute" runat="server" CssClass="label" For="ddlSalute" Text="Title"
                        meta:resourcekey="lblTitleRes" Width="100%"></asp:Label>
                </td>
                <td align="center" style="width: 10%;" width="10%">
                    <asp:DropDownList ID="ddlSalute" runat="server" CssClass="dropdownlist" Width="100%"
                        AppendDataBoundItems="True" DataSourceID="DsSalute" Enabled="False" DataTextField="salut_arname"
                        DataValueField="salut_code">
                    </asp:DropDownList>
                </td>
                <td align="center" style="width: 13%;" width="10%">
                    <asp:Label ID="lblArabicName" runat="server" CssClass="label" for="txtArabicName"
                        meta:resourcekey="lblArabicNameResource1" Text="Arabic Name" Width="100%" />
                </td>
                <td align="center" colspan="3" width="10%">
                    <asp:TextBox ID="txtArabicName" runat="server" CssClass="textbox" Enabled="False"
                        MaxLength="250" meta:resourcekey="txtArabicNameResource1" Width="100%" Height="16px"></asp:TextBox>
                </td>
                <td align="center" style="width: 12%;" width="10%">
                    <asp:Label ID="lblEnglishName" runat="server" CssClass="label" for="txtEnglishName"
                        meta:resourcekey="lblEnglishNameResource1" Text="English Name" Width="100%" />
                </td>
                <td align="center" colspan="3" width="10%">
                    <asp:TextBox ID="txtEnglishName" runat="server" CssClass="textbox" Enabled="False"
                        MaxLength="250" meta:resourcekey="txtEnglishNameResource1" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 10%;" width="10%">
                    <asp:Label ID="lblDonorID" runat="server" CssClass="label" for="txtDonorID" marginleft="0"
                        meta:resourcekey="lblDonorIDResource1" Text="ID" Width="100%" />
                </td>
                <td align="center" style="width: 10%;" width="10%">
                    <asp:TextBox ID="txtDonorID" runat="server" CssClass="textbox" marginleft="0" Width="100%" Enabled="False" ClientIDMode="Static" />
                </td>
                <td align="center" style="width: 13%;" width="10%">
                    <asp:Label ID="Label1" runat="server" CssClass="label" for="ddlDonorType" meta:resourcekey="lblDonerTypeResource1"
                        Text="Donor Type" Width="100%" />
                </td>
                <td align="center" style="width: 08%;" width="10%">
                    <asp:DropDownList ID="ddlDonorType" runat="server" CssClass="dropdownlist" Enabled="False"
                        meta:resourcekey="ddlDonorTypeResource1" Width="100%">
                        <asp:ListItem meta:resourcekey="ListItemResource8" Value="0">Individual</asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemResource9" Value="1">Company</asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemResource10" Value="2">Charity Firm</asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListItemResource11" Value="3">Other</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="center" style="width: 09%;" width="10%">
                    <asp:Label ID="lblCivilID0" runat="server" CssClass="label" for="txtCivilID" meta:resourcekey="lblCivilIDResource1"
                        Text="Civil ID" Width="100%" />
                </td>
                <td align="center" style="width: 10%;" width="10%">
                    <asp:TextBox ID="txtCivilID" runat="server" CssClass="textbox" Enabled="False" MaxLength="12"
                        meta:resourcekey="txtCivilIDResource1" Width="100%"></asp:TextBox>
                    <asp:CustomValidator ID="civilIdValidator0" runat="server" ClientValidationFunction="CivilIdValidate"
                        ControlToValidate="txtCivilID" Display="Dynamic" ErrorMessage="Invalid Civil ID"
                        Font-Size="9pt" ForeColor="Red" meta:resourcekey="civilIdValidatorResource1"
                        ValidationGroup="SaveDonor"></asp:CustomValidator>
                </td>
                <td align="center" style="width: 12%;" width="10%">
                    <asp:Label ID="lblPhone" runat="server" CssClass="label" for="txtPhone" meta:resourcekey="lblPhoneResource1"
                        Text="Home Phone" Width="100%" />
                </td>
                <td align="center" style="width: 9%;" width="10%">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" Enabled="False" MaxLength="15"
                        meta:resourcekey="txtPhoneResource1" Width="100%"></asp:TextBox>
                </td>
                <td align="center" style="width: 10%;" width="10%">
                    <asp:Label ID="lblMobile" runat="server" CssClass="label" for="txtMobile" meta:resourcekey="lblMobileResource1"
                        Text="Mobile" Width="100%" />
                </td>
                <td align="center" style="width: 9%;" width="10%">
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="textbox" Enabled="False" MaxLength="15"
                        meta:resourcekey="txtMobileResource1" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 10%;" width="10%">
                    <asp:HyperLink ID="lblTotalDonation" runat="server" CssClass="label" for="txtTotalDonation"
                        meta:resourcekey="lblTotalDonationResource1" Text="Total Donation" Width="100%" />
                    <ajaxToolkit:ModalPopupExtender ID="pnlTotalDonations_ModalPopupExtender" runat="server"
                        BackgroundCssClass="ModalBackground" CancelControlID="btnCloseModal2" DropShadow="True"
                        DynamicServicePath="" Enabled="True" PopupControlID="pnlTotalDonations" RepositionMode="RepositionOnWindowResizeAndScroll"
                        TargetControlID="lblTotalDonation">
                    </ajaxToolkit:ModalPopupExtender>
                </td>
                <td align="center" style="width: 10%;" width="10%">
                    <asp:TextBox ID="txtTotalDonation" runat="server" CssClass="textbox" Enabled="False"
                        meta:resourcekey="txtTotalDonationResource1" Width="100%"></asp:TextBox>
                </td>
                <td align="center" style="width: 13%;" width="10%">
                    <asp:HyperLink ID="lblTotalWaqf" runat="server" CssClass="label" for="txtTotalWaqf"
                        meta:resourcekey="lblTotalWaqfResource1" Text="Mobile" Width="100%" />
                    <ajaxToolkit:ModalPopupExtender ID="pnlTotalWaqf_ModalPopupExtender" runat="server"
                        BackgroundCssClass="ModalBackground" CancelControlID="btnCloseModal3" DropShadow="True"
                        DynamicServicePath="" Enabled="True" PopupControlID="pnlTotalWaqf" RepositionMode="RepositionOnWindowResizeAndScroll"
                        TargetControlID="lblTotalWaqf">
                    </ajaxToolkit:ModalPopupExtender>
                </td>
                <td align="center" style="width: 8%;" width="10%">
                    <asp:TextBox ID="txtTotalWaqf" runat="server" CssClass="textbox" Enabled="False"
                        meta:resourcekey="txtTotalWaqfResource1" Width="100%"></asp:TextBox>
                    <td align="center" style="width: 10%;" width="10%">
                        <asp:Label ID="lbltotStanInstruct" runat="server" CssClass="label" for="txttotintruct"
                            meta:resourcekey="lbltotStanInstructResource1" Text="Total Stand.Instruction" Width="100%" />
                        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender_lbltotStanInstruct" runat="server"
                            BackgroundCssClass="ModalBackground" CancelControlID="btnCloseModal3" DropShadow="True"
                            DynamicServicePath="" Enabled="True" PopupControlID="Panel_TotalInstruction" RepositionMode="RepositionOnWindowResizeAndScroll"
                            TargetControlID="lbltotStanInstruct">
                        </ajaxToolkit:ModalPopupExtender>





                        <asp:Panel ID="Panel_TotalInstruction" CssClass="modal" Style="display: none;" runat="server">
                            <div class="modal-header header-label">
                                <asp:Label ID="Label3" runat="server" CssClass="header-label" Text="Waqf Details"
                                    meta:resourcekey="lblTotalWaqfHeaderResource1"></asp:Label>
                            </div>
                            <div class="modal-body">
                                <asp:GridView ID="GridView_TotalInstruction" runat="server" AutoGenerateColumns="False" DataKeyNames="ref_numb"
                                    BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue" CellPadding="15"
                                    Font-Name="tahoma" Font-Size="10pt" ForeColor="DarkBlue" HeaderStyle-BackColor="#aaaadd"
                                    HorizontalAlign="Center" GridLines="None">
                                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                                        Height="25px" HorizontalAlign="Center" />
                                    <AlternatingRowStyle BackColor="AliceBlue"></AlternatingRowStyle>
                                    <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                                    <SelectedRowStyle BackColor="Ivory" Font-Bold="False" ForeColor="DeepPink" Font-Italic="False"
                                        Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></SelectedRowStyle>
                                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                                        Height="25px" HorizontalAlign="Center" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Receipt#" meta:resourcekey="TemplateFieldResource22">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRefNumber" runat="server" Text='<%# Bind("ref_numb") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date" meta:resourcekey="TemplateFieldResource24">
                                            <ItemTemplate>
                                                <asp:Label ID="lblInstructDate" runat="server" Text='<%# Bind("instruct_date","{0:dd/MM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Value" meta:resourcekey="TemplateFieldResource25">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTotalValue" runat="server" Text='<%# Bind("total_deduct_value") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bank Name" meta:resourcekey="TemplateFieldResource26">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRemaining" runat="server" Text='<%# Bind("bank_ar_name") %>'></asp:Label>
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
                                <asp:Button ID="Button1" Text="Close" CssClass="google-button google-button-blue"
                                    runat="server" meta:resourcekey="btnCloseSearchResource1"  UseSubmitBehavior="False" />
                            </div>
                        </asp:Panel>




                    </td>
                    <td align="center" style="width: 9%;" width="10%">
                        <asp:TextBox ID="txttotintruct" runat="server" CssClass="textbox" Enabled="False"
                            meta:resourcekey="txttotintructResource1" Width="100%"></asp:TextBox>
                    </td>
                    <td align="center" style="width: 12%;" width="10%">
                        <asp:Label ID="lblDifference" runat="server" CssClass="label" Font-Bold="True" Font-Size="10pt" ForeColor="#CC0000" meta:resourcekey="lblDifferenceResource1" Text="Difference :" Width="100%"></asp:Label>
                    </td>
                </td>
                <td align="center" style="width: 09%;" width="10%">
                    <asp:Label ID="lblDiff" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="label" Font-Bold="True" Font-Size="10pt" ForeColor="#CC0000" Width="100%"></asp:Label>
                </td>
                <td align="center" style="width: 10%;" width="10%">
                    <asp:Label ID="lblTotalCurency" runat="server" CssClass="label" Font-Bold="True" Font-Size="10pt" ForeColor="#006600" meta:resourcekey="lblTotalResourceCurrency" Text="Total Currency :" Width="100%"></asp:Label>
                </td>
                <td align="center" style="width: 09%;" width="10%">
                    <asp:Label ID="lblTotalCur" runat="server" BorderStyle="Solid" BorderWidth="1px" CssClass="label" Font-Bold="True" Font-Size="10pt" ForeColor="#006600" Width="100%"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <table align="center" width="100%">
            <tr>
                <td class="header-label">
                    <asp:Label ID="lblRecieptHeader" Text="Receipt" CssClass="header-label" runat="server"
                        meta:resourcekey="lblRecieptHeaderResource1" Width="100%" />
                    <%--<a href="Collection.aspx">Collection.aspx</a>--%>
                </td>
            </tr>
        </table>
        <table align="center" width="100%">
            <tr>
                <td align="center" width="10%">
                    <asp:Label ID="lblReceiptID" Text="Receipt ID" runat="server" CssClass="label" for="txtReceiptID"
                        meta:resourcekey="lblReceiptIDResource1" Width="100%" />
                </td>
                <td align="center" width="10%">
                    <asp:TextBox ID="txtReceiptID" CssClass="textbox" runat="server" Enabled="False"
                        meta:resourcekey="txtReceiptIDResource1" Width="100%"></asp:TextBox>
                </td>
                <td align="center" width="10%">
                    <asp:Label ID="lblReceiptManaual" Text="Receipt Manual#" runat="server" CssClass="label"
                        for="txtReceiptManaual" meta:resourcekey="lblReceiptManaualDResource1" Width="100%" />
                </td>
                <td align="center" width="10%">
                    <asp:TextBox ID="txtReceiptManaual" CssClass="textbox" runat="server" Enabled="True"
                        meta:resourcekey="txtReceiptManaualResource1" MaxLength="15" Width="100%"></asp:TextBox>
                </td>
                <td align="center" width="10%">
                    <asp:Label ID="lblReceiptDate" Text="Date" runat="server" CssClass="label" for="txtReceiptDate"
                        meta:resourcekey="lblReceiptDateResource1" Width="100%" />
                </td>
                <td align="center" width="10%">
                    <dx:ASPxDateEdit ID="txtReceiptDate" runat="server" ClientInstanceName="txtReceiptDate" EnableClientSideAPI="True" Width="100%">
                        <ValidationSettings ErrorDisplayMode="None" ErrorText="" >
                            <RequiredField ErrorText="" IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                    <%--<img alt="cal" id="imgcal" class="style11" 
                            src="Content/images/calendar.png" />--%>
                </td>
                <td align="center" width="10%">
                    <asp:Label ID="lblCurrency" Text="Currency" runat="server" CssClass="label" for="ddlCurrency"
                        meta:resourcekey="lblCurrencyResource1" Width="100%" />
                </td>
                <td align="center" width="10%">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlCurrency" runat="server" DataSourceID="CurrencySDS" DataTextField="currency_desceng"
                                DataValueField="currency_code" Width="100%" AppendDataBoundItems="True" meta:resourcekey="ddlCurrencyResource1"
                                CssClass="dropdownlist" AutoPostBack="True" TabIndex="-1">
                            </asp:DropDownList>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlCurrency" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td align="center" width="10%">
                    <asp:Label ID="lblCampaign" Text="Campaign" runat="server" Width="100%" CssClass="label"
                        for="ddlcampaign" meta:resourcekey="lblCampaignResource1" />
                </td>
                <td align="center" width="10%">
                    <asp:DropDownList ID="ddlcampaign" runat="server" DataSourceID="CampaignSDS" DataTextField="campaign_desceng"
                        DataValueField="campaign_code" AppendDataBoundItems="True" CssClass="dropdownlist"
                        Width="100%" meta:resourcekey="ddlcampaignResource1" TabIndex="-1">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="center" width="10%">
                    <asp:Label ID="lblDonationCat" runat="server" CssClass="label" for="ddlWaqfColDonation"
                        meta:resourcekey="lblDonationCatResource1" Text="Donation Type" Width="100%" />
                </td>
                <td align="center" width="10%">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="ddlWaqfColDonation" runat="server" AppendDataBoundItems="True"
                                AutoPostBack="True" CssClass="dropdownlist" Font-Names="Tahoma" Font-Size="8pt"
                                Height="23px" margin-left="4px" meta:resourcekey="ddlWaqfColDonationSrcResource1"
                                Style="margin-left: 0px" Width="100%" TabIndex="-1">
                                <asp:ListItem meta:resourcekey="ListItemWaqfcolResource1" Text="Donations" Value="1"></asp:ListItem>
                                <asp:ListItem meta:resourcekey="ListItemWaqfcolResource3" Text="Waqf" Value="2"></asp:ListItem>
                                <asp:ListItem meta:resourcekey="ListItemWaqfcolResource2" Text="Zakat" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="ddlWaqfColDonation" EventName="SelectedIndexChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
                <td align="center" width="10%">
                    <asp:Label ID="lblGroup" runat="server" CssClass="label" for="ddlWaqfColDonation"
                        meta:resourcekey="lblDonationGroupResource1" Text="Donation Group" Width="100%" />
                </td>
                <td align="center" width="10%">
                    <asp:DropDownList ID="ddlDontationGroup" runat="server" CssClass="dropdownlist" Width="100%"
                        DataSourceID="DonationsGroupSDS" DataTextField="group_desc_eng" DataValueField="group_id"
                        meta:resourcekey="ddlDontationGroupResource1" TabIndex="-1">
                    </asp:DropDownList>
                </td>
                <td align="center" width="10%">
                    <asp:Label ID="lbl_ExchRate" runat="server" CssClass="label" Fore="txt_ExchRate"
                        Width="100%" meta:resourcekey="lbl_ExchRateResc1" Text="Exch: Rate"></asp:Label>
                </td>
                <td align="center" width="10%">
                    <asp:TextBox ID="txt_ExchRate" runat="server" CssClass="textbox" Enabled="false"
                        left-margin="0px" Width="100%" TabIndex="-1"></asp:TextBox>
                </td>
                <td align="center" width="10%">
                    <asp:Label ID="lbl_KDamt" runat="server" CssClass="label" Fore="txt_amtKD"
                        Width="100%" meta:resourcekey="lbl_KDamtResouce" Text="Amount K.D"></asp:Label>
                </td>
                <td align="center" width="10%">
                    <asp:TextBox ID="txt_amtKD" runat="server" CssClass="textbox" Enabled="false"
                        left-margin="0px" Width="100%" TabIndex="-1"></asp:TextBox>
                </td>
                <td align="center" width="10%">
                    &nbsp;</td>
                <td align="center" width="10%">
                    <asp:TextBox ID="phone_3" runat="server" CssClass="textbox" Enabled="False" MaxLength="15" meta:resourcekey="txtMobileResource1" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" width="10%">
                    <asp:Label ID="lblinfavourof0" runat="server" CssClass="label"  Text="رقم دفتر الشئون" Visible="true" Width="100%" />
                </td>
                <td align="center" width="10%">
                    <asp:TextBox ID="txtMOSALBookNumber" runat="server" CssClass="textbox" Enabled="True" MaxLength="15" meta:resourcekey="txtReceiptManaualResource1" Width="100%"></asp:TextBox>
                </td>
                <td align="center" width="10%">
                    <asp:Label ID="lblinfavourof1" runat="server" CssClass="label" Text="رقم سند الشئون" Width="100%" />
                </td>
                <td align="center" width="10%">
                    <asp:TextBox ID="txtMOSALReceiptNumber" runat="server" CssClass="textbox" Enabled="True" MaxLength="15" meta:resourcekey="txtReceiptManaualResource1" Width="100%"></asp:TextBox>
                </td>
                <td align="center" width="10%">
                    <asp:Label ID="lblinfavourof" runat="server" CssClass="label" for="txtfavourof" meta:resourcekey="lblinfavourofResource1" Text=" In Favour Of" Visible="False" Width="100%" />
                </td>
                <td align="center" width="10%">
                    <asp:TextBox ID="txtfavourof" runat="server" CssClass="textbox" MaxLength="100" meta:resourcekey="txtfavourofResource1" TabIndex="-1" Visible="false" Width="100%"></asp:TextBox>
                </td>
                <td align="center" width="10%">&nbsp;</td>
                <td align="center" width="10%">&nbsp;</td>
                <td align="center" width="10%">&nbsp;</td>
                <td align="center" width="10%">&nbsp;</td>
            </tr>
        </table>
        <table align="center" width="100%">
            <tr>
                <td class="header-label">
                    <asp:Label ID="lblDonationHeader" runat="server" CssClass="header-label" meta:resourcekey="lblDonationHeaderResource1" Text="Donations" Width="100%" />
                </td>
            </tr>
        </table>
        <table align="center" width="100%">
            <tr>
                <td>
                    <asp:GridView ID="grvDonationDist" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                        DataKeyNames="reciept_num,donation_code" meta:resourcekey="grvDonationDistResource1"
                        ShowHeaderWhenEmpty="True" BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue"
                        CellPadding="0" Font-Name="tahoma" Font-Size="10pt" ForeColor="DarkBlue" HeaderStyle-BackColor="#aaaadd"
                        GridLines="None" Font-Names="tahoma" Width="100%">
                        <EmptyDataTemplate>
                            <asp:Label CssClass="label" ID="lblEmptyDonationDist" runat="server" Text="No Donations"
                                meta:resourcekey="lblEmptyDonationDistResource1"></asp:Label>
                            <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                <ContentTemplate>
                                    <tr>
                                        <td align="center" style="width: 5%;">
                                            <asp:ImageButton ID="lbtnAdd" runat="server" OnClick="lbtnAdd_Click" meta:resourcekey="AddResource1"
                                                ImageUrl="~/Content/images/add.png" TabIndex="-1"></asp:ImageButton>
                                        </td>
                                        <td align="center" style="width: 20%;">
                                            <%--<asp:DropDownList ID="ddlNewDonationPurposeType" runat="server" DataTextField="donation_descrar"
                                DataValueField="donation_code" DataSourceID="DonationsForInsertSqlDataSource"
                                AppendDataBoundItems="True" AutoPostBack="True" meta:resourcekey="ddlNewDonationPurposeTypeResource1"
                                OnSelectedIndexChanged="ddlNewDonationPurposeType_SelectedIndexChangedEmpty"
                                CssClass="dropdownlist" OnDataBinding="ddlDonationPurposeType_DataBinding" Width="95%">
                                <asp:ListItem Value="0" meta:resourcekey="ListItemResource14" Selected="True">Please Select Donation Type</asp:ListItem>
                            </asp:DropDownList>--%>

                                            <dx:ASPxComboBox ID="donation_code_New" runat="server" AutoPostBack="True" CallbackPageSize="5" DataSourceID="DonationsForInsertSqlDataSource0" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" OnSelectedIndexChanged="donation_code_New_SelectedIndexChanged" TextField="donation_descrar" ValueField="donation_code" ValueType="System.Int16" Width="95%" DropDownRows="5">
                                                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>

                                        </td>
                                        <td align="center" style="width: 10%;">
                                            <%--                            <asp:UpdatePanel runat="server" ID="UpdatePanel1" ChildrenAsTriggers="true" UpdateMode="Conditional">
                                <ContentTemplate>--%>
                                            <asp:DropDownList ID="ddlCountryNew" runat="server" AppendDataBoundItems="True"
                                                DataSourceID="CountrySqlDataSource0" DataTextField="nat_descrar" DataValueField="nat_code"
                                                CssClass="dropdownlist" AutoPostBack="True"
                                                OnSelectedIndexChanged="ddlCountryNew_SelectedIndexChanged" Width="95%">
                                            </asp:DropDownList>
                                            <%--                                </ContentTemplate>
                            </asp:UpdatePanel>--%>
                                        </td>
                                        <td align="center" style="width: 10%;">
                                            <asp:TextBox ID="txtDonationValueNew" CssClass="textbox" Width="95%" runat="server"
                                                meta:resourcekey="txtDonationValueResource1" MaxLength="15" Enabled="False"></asp:TextBox>
                                            <asp:HiddenField ID="BlockDecimalPointNew" runat="server" />
                                        </td>
                                        <td align="center" style="width: 10%;">
                                            <asp:TextBox ID="txtQtyNew" onkeydown="AddUsersKeyDown(event)"  CssClass="textbox" Width="95%" runat="server" MaxLength="15"></asp:TextBox>
                                        </td>
                                        <td align="center" style="width: 10%;">
                                            <asp:TextBox ID="txtLineAmountNew" CssClass="textbox" Width="95%" runat="server"
                                                Enabled="True" MaxLength="15"></asp:TextBox>
                                        </td>
                                        <td align="center" style="width: 5%;">
                                            <asp:CheckBox ID="chkPartialNew" runat="server" Width="95%" Enabled="true" AutoPostBack="True"
                                                OnCheckedChanged="chkPartialNew_CheckedChanged" />
                                        </td>
                                        <td align="center" style="width: 10%;">
                                            <asp:TextBox ID="lblStandInstructNew" runat="server" CssClass="textbox" MaxLength="6"
                                                Width="50%" Enabled="False"></asp:TextBox>
                                            <asp:LinkButton Text="Select" runat="server" ID="lbtnShowInstructionNew" OnClick="lbtnShowInstructionNew_Click"
                                                meta:resourcekey="SelectBankInstruction" Width="45%" />
                                        </td>
                                        <td align="center" style="width: 20%;">
                                            <asp:TextBox ID="txtDonationNotesFooter" CssClass="textbox" runat="server" meta:resourcekey="txtDonationNotesResource1"
                                                onKeyDown="return insertByEnterKey('lbtnAdd');" onBlur="onBlurAlert(txtDonationValueNew);"
                                                Width="95%" MaxLength="150"></asp:TextBox>
                                        </td>
                                    </tr>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="donation_code_New" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="ddlCountryNew" EventName="SelectedIndexChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="chkPartialNew" EventName="CheckedChanged" />
                                    <asp:AsyncPostBackTrigger ControlID="lbtnShowInstructionNew" EventName="Click" />
                                    <asp:AsyncPostBackTrigger ControlID="lbtnAdd" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </EmptyDataTemplate>
                        <Columns>
                            <asp:TemplateField FooterText="Total" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="LinkButton3" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" meta:resourcekey="UpdateResource1" ImageUrl="~/Content/images/save.png"></asp:ImageButton>
                                    <asp:ImageButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancel" meta:resourcekey="CancelResource1" ImageUrl="~/Content/images/cancel.png"></asp:ImageButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="LinkButton5" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="Edit" meta:resourcekey="EditResource1" ImageUrl="~/Content/images/edit.png"></asp:ImageButton>
                                    <asp:ImageButton ID="LinkButton6" runat="server" CausesValidation="False" CommandName="Delete"
                                        Text="Delete" meta:resourcekey="DeleteResource1" ImageUrl="~/Content/images/delete.png"></asp:ImageButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:ImageButton ID="lbtnAdd" runat="server" OnClick="lbtnAddFromFooter_Click" meta:resourcekey="AddResource1"
                                        ImageUrl="~/Content/images/add.png" TabIndex="-1"></asp:ImageButton>
                                </FooterTemplate>
                                <ItemStyle Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Donation" SortExpression="donation_name" meta:resourcekey="TemplateFieldResource1">
                                <EditItemTemplate>
                                    <%-- <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                        <ContentTemplate>--%>
                                    <asp:Label ID="lblDonationEdit" runat="server" Text='<%# Eval("donation_name") %>'
                                        meta:resourcekey="lblDonationResource1" CssClass="label" Visible="False"></asp:Label>
                                    <dx:ASPxComboBox ID="donation_code_update" runat="server" AutoPostBack="True" CallbackPageSize="5" DataSourceID="DonationsForInsertSqlDataSource0" DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" OnSelectedIndexChanged="donation_code_update_SelectedIndexChanged" TextField="donation_descrar" Value='<%# Bind("donation_code") %>' ValueField="donation_code" ValueType="System.Int16" Width="95%">
                                        <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:Label ID="lblDonationCodeEdit" CssClass="hide" runat="server" Text='<%# Eval("donation_code") %>'
                                        meta:resourcekey="lblDonationResource2"></asp:Label>
                                    <%--                                       </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="donation_code_update" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>--%>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDonation" CssClass="label" runat="server" Text='<%# Eval("donation_name") %>'
                                        meta:resourcekey="lblDonationResource2"></asp:Label>
                                    <asp:Label ID="lblDonationCode" CssClass="hide" runat="server" Text='<%# Eval("donation_code") %>'
                                        meta:resourcekey="lblDonationResource2"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <%--               <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                        <ContentTemplate>--%>
                                    <dx:ASPxComboBox ID="donation_code_edit" runat="server" AutoPostBack="True" CallbackPageSize="5" DataSourceID="DonationsForInsertSqlDataSource0" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains" OnSelectedIndexChanged="donation_code_edit_SelectedIndexChanged" TextField="donation_descrar" ValueField="donation_code" ValueType="System.Int16" Width="95%" DropDownRows="5">
                                        <ClientSideEvents ButtonClick="function(s, e) {
	RefreshDonations(s);
}" CallbackError="function(s, e) {
	RefreshDonations(s);
}" />
                                        <Buttons>
                                            <dx:EditButton Text="x">
                                            </dx:EditButton>
                                        </Buttons>
                                        <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <%--<asp:DropDownList ID="ddlNewDonationPurposeType" runat="server" DataTextField="donation_descrar"
                                DataValueField="donation_code" DataSourceID="DonationsForInsertSqlDataSource0"
                                AppendDataBoundItems="True" OnDataBinding="ddlDonationPurposeType_DataBinding"
                                meta:resourcekey="ddlNewDonationPurposeTypeResource1" OnSelectedIndexChanged="ddlNewDonationPurposeType_SelectedIndexChanged"
                                CssClass="dropdownlist" Width="95%" AutoPostBack="True">
                                <asp:ListItem Value="0" meta:resourcekey="ListItemResource14" Selected="True">Please Select Donation Type</asp:ListItem>
                            </asp:DropDownList>--%>
                                    <%--                             </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="donation_code_edit" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>--%>
                                </FooterTemplate>
                                <ItemStyle Width="20%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Country" meta:resourcekey="TemplateFieldResource15">
                                <EditItemTemplate>
                                    <%--                   <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                        <ContentTemplate>--%>
                                    <asp:DropDownList ID="ddlCountryEdit" runat="server" AppendDataBoundItems="True"
                                        DataSourceID="CountrySqlDataSource0" DataTextField="nat_descrar" CssClass="dropdownlist"
                                        DataValueField="nat_code" SelectedValue='<%# Bind("country_code") %>' Width="95%" AutoPostBack="True" OnSelectedIndexChanged="ddlCountryEdit_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    <%--                     </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlCountryEdit" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>--%>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCountry" CssClass="label" Text='<%# Eval("country_name") %>' runat="server"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <%--                    <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                        <ContentTemplate>--%>
                                    <asp:DropDownList ID="ddlCountryFooter" runat="server" AppendDataBoundItems="True"
                                        DataSourceID="CountrySqlDataSource0" CssClass="dropdownlist" DataTextField="nat_descrar"
                                        DataValueField="nat_code" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlCountryFooter_SelectedIndexChanged" Width="95%">
                                    </asp:DropDownList>
                                    <%--              </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="ddlCountryFooter" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>--%>
                                </FooterTemplate>
                                <ItemStyle Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Value" SortExpression="donation_value" meta:resourcekey="TemplateFieldResource2">
                                <EditItemTemplate>

                                    <%--        <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                        <ContentTemplate>--%>
                                    <asp:TextBox ID="txtDonationValue" CssClass="textbox" runat="server" Text='<%# Bind("donation_value","{0:N3}") %>'
                                        meta:resourcekey="txtDonationValueResource1" Enabled="False" MaxLength="15" Width="95%"></asp:TextBox>
                                    <%--         </ContentTemplate>
                                    </asp:UpdatePanel>--%>
                                    <asp:HiddenField ID="BlockDecimalPoint" runat="server" />
                                    <br />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDonationValue" runat="server" CssClass="label" Text='<%# Bind("donation_value","{0:N3}") %>'
                                        meta:resourcekey="lblDonationValueResource1"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <%--        <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                        <ContentTemplate>--%>
                                    <asp:TextBox ID="txtDonationValueFooter" CssClass="textbox" Width="95%" runat="server"
                                        meta:resourcekey="txtDonationValueResource1" MaxLength="15" Enabled="False"></asp:TextBox>
                                    <%--           </ContentTemplate>
                                    </asp:UpdatePanel>--%>
                                    <asp:HiddenField ID="BlockDecimalPointFooter" runat="server" />
                                    <br />
                                </FooterTemplate>
                                <ItemStyle Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Qty" SortExpression="Qty" meta:resourcekey="TemplateFieldResource31">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtQtyEdit" CssClass="textbox" runat="server" Text='<%# Bind("Qty") %>'
                                        MaxLength="15" Width="95%"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblQty" runat="server" CssClass="label" Text='<%# Bind("Qty") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtQtyFooter" CssClass="textbox" Width="95%" runat="server" MaxLength="15"></asp:TextBox>
                                </FooterTemplate>
                                <ItemStyle Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total" SortExpression="line_amount" meta:resourcekey="TemplateFieldResource32">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtLineAmountEdit" Enabled="True" CssClass="textbox" runat="server"
                                        Text='<%# Bind("line_amount") %>' MaxLength="15" Width="95%"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblLineAmount" runat="server" CssClass="label" Text='<%# Bind("line_amount") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtLineAmountFooter" Enabled="True" Width="95%" CssClass="textbox"
                                        runat="server" MaxLength="15"></asp:TextBox>
                                </FooterTemplate>
                                <ItemStyle Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Partial" meta:resourcekey="TemplateFieldResource16">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="chkPartial" runat="server" Checked='<%# Bind("partial") %>' OnCheckedChanged="chkPartialEdit_CheckedChanged"
                                        AutoPostBack="True" Width="95%" />
                                    <%--  <asp:CheckBox ID="chkPartialEdit" runat="server" 
                                        Checked='<%# Bind("partial") %>' e AutoPostBack="True" />--%>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <%-- ' <asp:CheckBox ID="chkPartial0" runat="server" Checked='<%# Bind("partial") %>' OnCheckedChanged="chkPartialEdit_CheckedChanged"
                                Enabled="False" AutoPostBack="True" />--%>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:CheckBox ID="chkPartialFooter" runat="server" Enabled="true" AutoPostBack="True" Width="95%"
                                        OnCheckedChanged="chkPartialFooter_CheckedChanged" />
                                </FooterTemplate>
                                <ItemStyle Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField Visible="True" HeaderText="Bank Instruction#" meta:resourcekey="TemplateFieldResource30">
                                <EditItemTemplate>
                                    <asp:TextBox ID="lblStandInstructEdit" CssClass="textbox" runat="server" Text='<%# Bind("standing_inst_num")%>'
                                        MaxLength="6" Enabled="False" Width="50%"></asp:TextBox>
                                    <asp:LinkButton ID="lbtnShowInstructionEdit" Text="Select" runat="server" OnClick="lbtnShowInstructionEdit_Click"
                                        meta:resourcekey="SelectBankInstruction" Width="45%"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblStandInstruct" CssClass="label" runat="server" Text='<%# Bind("standing_inst_num") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="lblStandInstructFooter" CssClass="textbox" Enabled="False" Width="50%"
                                        runat="server" MaxLength="6"></asp:TextBox>
                                    <asp:LinkButton ID="lbtnShowInstructionFooter" Text="Select" runat="server" OnClick="lbtnShowInstructionFooter_Click"
                                        meta:resourcekey="SelectBankInstruction" Width="45%"></asp:LinkButton>
                                </FooterTemplate>
                                <ItemStyle Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notes" SortExpression="distribution_remrks" meta:resourcekey="TemplateFieldResource3">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDonationNotes" CssClass="textbox" runat="server" Text='<%# Bind("distribution_remrks") %>'
                                        meta:resourcekey="txtDonationNotesResource1" onKeyDown="return insertByEnterKey('LinkButton3');"
                                        MaxLength="150" Width="95%"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblDonationNotes" CssClass="label" runat="server" Text='<%# Bind("distribution_remrks") %>'
                                        meta:resourcekey="lblDonationNotesResource1"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDonationNotesFooter" CssClass="textbox" runat="server" meta:resourcekey="txtDonationNotesResource1"
                                        onKeyDown="return insertByEnterKey('lbtnAdd');" onBlur="onBlurAlert(txtDonationValueFooter);"
                                        MaxLength="150" Width="95%"></asp:TextBox>
                                </FooterTemplate>
                                <ItemStyle Width="20%" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                            Height="25px" HorizontalAlign="Center" />
                        <AlternatingRowStyle BackColor="AliceBlue"></AlternatingRowStyle>
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                        <SelectedRowStyle BackColor="Ivory" Font-Bold="False" ForeColor="DeepPink" Font-Italic="False"
                            Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></SelectedRowStyle>
                        <FooterStyle HorizontalAlign="Center"></FooterStyle>
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </td>
            </tr>
        </table>

        <table align="center" width="100%">
            <tr>
                <td align="center" style="width: 50%;"></td>
                <td align="center" style="width: 5%;"></td>
                <td align="center" style="width: 40%;"></td>
            </tr>
            <tr>
                <td align="center" class="header-label" style="width: 50%;">
                    <asp:Label ID="Label5" runat="server" CssClass="header-label" meta:resourcekey="lblPaymentMethodHeaderResource1" Text="Payment Methods" Width="100%" />
                </td>
                <td align="center" style="width: 5%;">
                    <dx:ASPxButton ID="ASPxButton_DonorInfo" runat="server" Width="100%" UseSubmitBehavior="False"
                        ClientInstanceName="ASPxButton_DonorInfo" EnableClientSideAPI="True" Font-Bold="True" AutoPostBack="False" CausesValidation="False">
                        <ClientSideEvents Click="function(s, e) {
	ShowDonorInfo();
}" />
                        <Image Url="~/Images/Info_32x32.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td align="center" class="header-label" style="width: 40%;">
                    <asp:Label ID="Label6" runat="server" CssClass="header-label" Text="ملاحظات" Width="100%" />
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 50%;" valign="top">
                    <asp:GridView ID="grvPayments" runat="server" AutoGenerateColumns="False" ShowFooter="True"
                        DataKeyNames="reciept_ser_det" meta:resourcekey="grvPaymentsResource1" ShowHeaderWhenEmpty="True"
                        BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue" CellPadding="0"
                        Font-Name="tahoma" Font-Size="8pt" ForeColor="DarkBlue" HeaderStyle-BackColor="#aaaadd"
                        Font-Names="tahoma" GridLines="None" Width="100%">
                        <EmptyDataTemplate>
                            <asp:Label ID="lblPaymentEmpty" runat="server" CssClass="label" Text="No Payments"
                                meta:resourcekey="lblPaymentEmptyResource1" Width="100%"></asp:Label>
                            <asp:UpdatePanel runat="server" ID="UpdatePanel6">
                                <ContentTemplate>
                                    <table width="100%" align="center" cellpadding="1px">
                                        <tr>
                                            <td>
                                                <asp:ImageButton ID="lbtnAddPaymentNew" runat="server" Text="Add" meta:resourcekey="AddResource1"
                                                    OnClick="lbtnAddPaymentNew_Click" ImageUrl="~/Content/images/add.png" TabIndex="-1"></asp:ImageButton>
                                            </td>
                                            <td width="20%">
                                                <asp:DropDownList ID="ddlPaymentMethodNew" runat="server" DataTextField="pay_method_en"
                                                    DataValueField="pay_method_id" DataSourceID="PaymentSqlDataSource0" AppendDataBoundItems="True"
                                                    meta:resourcekey="ddlPaymentMethodNewResource1" CssClass="dropdownlist" OnSelectedIndexChanged="ddlPaymentMethodNew_SelectedIndexChanged"
                                                    AutoPostBack="True" Width="100%">
                                                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource15">Please Select Donation Type</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td width="20%">
                                                <asp:TextBox ID="txtPaymentAmountNew" runat="server" CssClass="textbox" MaxLength="15"
                                                    meta:resourcekey="txtPaymentAmountEditResource1" Width="100%"></asp:TextBox>
                                            </td>
                                            <td width="20%">
                                                <asp:DropDownList ID="ddlBankNew" runat="server" CssClass="dropdownlist" DataSourceID="BanksSqlDataSource"
                                                    DataTextField="bank_ar_name" DataValueField="bank_code" meta:resourcekey="ddlBankEditResource1" Width="100%">
                                                </asp:DropDownList>
                                            </td>
                                            <td width="20%">
                                                <asp:TextBox ID="txtAccountNumberNew" runat="server" CssClass="textbox" meta:resourcekey="txtAccountNumberEditResource1"
                                                    MaxLength="25" Width="100%"></asp:TextBox>
                                            </td>
                                            <td width="20%">
                                                <asp:TextBox ID="txtAuthorizationNumberNew" runat="server" CssClass="textbox" onKeyDown="return insertByEnterKey('lbtnAddPaymentNew');"
                                                    meta:resourcekey="txtAuthorizationNumberEditResource1" onBlur="onBlurAlert(txtPaymentAmountNew);"
                                                    MaxLength="40" Width="100%"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>

                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="ddlPaymentMethodNew" EventName="SelectedIndexChanged" />
                                </Triggers>

                            </asp:UpdatePanel>

                        </EmptyDataTemplate>
                        <Columns>
                            <asp:TemplateField FooterText="Total" ShowHeader="False">
                                <%--<FooterStyle Font-Bold="True" ForeColor="Red" />--%>
                                <ItemTemplate>
                                    <asp:ImageButton ID="LinkButton7" runat="server" CausesValidation="False" CommandName="Edit"
                                        Text="Edit" meta:resourcekey="EditResource1" ImageUrl="~/Content/images/edit.png"></asp:ImageButton>
                                    <asp:ImageButton ID="LinkButton8" runat="server" CausesValidation="False" CommandName="Delete"
                                        Text="Delete" meta:resourcekey="DeleteResource1" ImageUrl="~/Content/images/delete.png"></asp:ImageButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:ImageButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                                        Text="Update" meta:resourcekey="UpdateResource1" ImageUrl="~/Content/images/save.png"></asp:ImageButton>
                                    <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                        Text="Cancel" meta:resourcekey="CancelResource1" ImageUrl="~/Content/images/cancel.png"></asp:ImageButton>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:ImageButton ID="lbtnAddPaymentFooter" runat="server" Text="Add" meta:resourcekey="AddResource1"
                                        OnClick="lbtnAddPaymentFooter_Click" ImageUrl="~/Content/images/add.png" TabIndex="-1"></asp:ImageButton>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment Method" SortExpression="pay_method_en" meta:resourcekey="TemplateFieldResource4">
                                <EditItemTemplate>
                                    <asp:Label ID="lblPaymentMethodEdit" runat="server" Text='<%# Bind("pay_method_name") %>'
                                        meta:resourcekey="lblPaymentMethodEditResource1" CssClass="label"></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPaymentMethodItem" runat="server" Text='<%# Bind("pay_method_name") %>'
                                        meta:resourcekey="lblPaymentMethodItemResource1" CssClass="label"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddlPaymentMethodFooter" runat="server" DataTextField="pay_method_en"
                                        DataValueField="pay_method_id" DataSourceID="PaymentSqlDataSource0" AppendDataBoundItems="True"
                                        meta:resourcekey="ddlPaymentMethodFooterResource1" CssClass="dropdownlist" AutoPostBack="True"
                                        OnSelectedIndexChanged="ddlPaymentMethodFooter_SelectedIndexChanged" Width="100%">
                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource15">Please Select Pay Mathod</asp:ListItem>
                                    </asp:DropDownList>
                                </FooterTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount" SortExpression="pay_amnt" meta:resourcekey="TemplateFieldResource5">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPaymentAmountEdit" runat="server" Text='<%# Bind("pay_amnt") %>'
                                        meta:resourcekey="txtPaymentAmountEditResource1" MaxLength="15" CssClass="textbox"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPaymentAmountItem" runat="server" Text='<%# Bind("pay_amnt","{0:N3}") %>'
                                        meta:resourcekey="lblPaymentAmountItemResource1" CssClass="label"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtPaymentAmountFooter" runat="server" meta:resourcekey="txtPaymentAmountEditResource1"
                                        CssClass="textbox" MaxLength="15" Width="100%"></asp:TextBox>
                                    <%--<asp:Label ID="lblPaymentAmountFooter" runat="server"></asp:Label>--%>
                                </FooterTemplate>
                                <FooterStyle Font-Bold="True" ForeColor="Red" />
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Bank" SortExpression="bank_eng_name" meta:resourcekey="TemplateFieldResource6">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlBankEdit" runat="server" DataSourceID="BanksSqlDataSource"
                                        DataTextField="bank_ar_name" DataValueField="bank_code" CssClass="dropdownlist"
                                        meta:resourcekey="ddlBankEditResource1" SelectedValue='<%# Bind("bank_code") %>' Width="100%">
                                    </asp:DropDownList>
                                    <%-- <asp:Label ID="lblBankCodeEdit" runat="server" Text="<%# Eval("bank_code") %>" CssClass="hide"></asp:Label>--%>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblBankItem" runat="server" Text='<%# Bind("bank_name") %>' CssClass="label"
                                        meta:resourcekey="lblBankItemResource1"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddlBankFooter" runat="server" DataSourceID="BanksSqlDataSource"
                                        DataTextField="bank_ar_name" DataValueField="bank_code" CssClass="dropdownlist"
                                        meta:resourcekey="ddlBankEditResource1" Width="100%">
                                    </asp:DropDownList>
                                </FooterTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Account#" SortExpression="acc_num" meta:resourcekey="TemplateFieldResource7">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAccountNumberEdit" runat="server" Text='<%# Bind("acc_num") %>'
                                        meta:resourcekey="txtAccountNumberEditResource1" MaxLength="25" CssClass="textbox"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAccountNumberItem" runat="server" Text='<%# Bind("acc_num") %>'
                                        meta:resourcekey="lblAccountNumberItemResource1" CssClass="label"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtAccountNumberFooter" CssClass="textbox" runat="server" meta:resourcekey="txtAccountNumberEditResource1"
                                        MaxLength="25" Width="100%"></asp:TextBox>
                                </FooterTemplate>
                                <ItemStyle Width="180px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Authorization#" SortExpression="authorization_code"
                                meta:resourcekey="TemplateFieldResource8">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAuthorizationNumberEdit" runat="server" Text='<%# Bind("authorization_code") %>'
                                        meta:resourcekey="txtAuthorizationNumberEditResource1" CssClass="textbox" onKeyDown="return insertByEnterKey('LinkButton1');"
                                        MaxLength="40"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAuthorizationNumberItem" runat="server" Text='<%# Bind("authorization_code") %>'
                                        meta:resourcekey="lblAuthorizationNumberItemResource1" CssClass="label"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtAuthorizationNumberFooter" CssClass="textbox" runat="server"
                                        onKeyDown="return insertByEnterKey('lbtnAddPaymentFooter');" meta:resourcekey="txtAuthorizationNumberEditResource1"
                                        onBlur="onBlurAlert(txtPaymentAmountFooter);" MaxLength="40" Width="100%"></asp:TextBox>
                                </FooterTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField SortExpression="reciept_ser_det" Visible="False" meta:resourcekey="TemplateFieldResource9">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRecieptSerialEdit" runat="server" Text='<%# Bind("reciept_ser_det") %>'
                                        meta:resourcekey="txtRecieptSerialEditResource1" CssClass="textbox"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRecieptSerialItem" runat="server" Text='<%# Bind("reciept_ser_det") %>'
                                        meta:resourcekey="lblRecieptSerialItemResource1" CssClass="label"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                            Height="25px" HorizontalAlign="Center" />
                        <AlternatingRowStyle BackColor="AliceBlue"></AlternatingRowStyle>
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle"></RowStyle>
                        <SelectedRowStyle BackColor="Ivory" Font-Bold="False" ForeColor="DeepPink" Font-Italic="False"
                            Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></SelectedRowStyle>
                        <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" ForeColor="AliceBlue"
                            Height="25px" HorizontalAlign="Center" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </td>
                <%--                    <td align="center" style="width: 8%;">
                        <asp:Label ID="lblNotes" Text="Notes" runat="server" CssClass="label" for="txtNotes"
                            meta:resourcekey="lblNotesResource1" Width="100%" />
                    </td>--%>
                <td align="center" style="width: 5%;" valign="top">
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DisplayAfter="100">
                        <ProgressTemplate>
                            <img class="auto-style1" src="../Images/loading_icon_1.gif" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
                <td align="center" style="width: 45%;" valign="top">
                    <asp:TextBox ID="txtNotes" runat="server" Height="60px" meta:resourcekey="txtNotesResource1"
                        TextMode="MultiLine" onkeypress="return textboxMultilineMaxNumber(this,250);"
                         Width="100%"></asp:TextBox>
                </td>
            </tr>
        </table>

        <%--           <table align="center" width="100%">
                <tr>
                    <td align="center" style="width: 8%;"></td>
                    <td align="center" style="width: 72%;"></td>
                    <td align="center" style="width: 20%;">&nbsp;</td>
                </tr>
            </table>--%>
        <%--<div class="navbar">
                <asp:Label ID="lblBrand" runat="server" Text="Direct Aid" CssClass="brand" meta:resourcekey="lblBrandResource1"></asp:Label>
                <div class="navbar-inner">
                    <div class="container">
                        <ul class="nav">
                            <li>
                                <asp:HyperLink ID="lnkFirstScreen" runat="server" Text="Main Screen" NavigateUrl="openscreen.aspx"
                                    meta:resourcekey="lnkFirstScreenResource1"></asp:HyperLink>
                            </li>
                            <li class="active">
                                <asp:HyperLink ID="lnkCollection" runat="server" Text="Collection" NavigateUrl="Collection.aspx"
                                    meta:resourcekey="lnkCollectionResource1"></asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="lnkDonorProfile" runat="server" Text="Donor Profile" NavigateUrl="AddDonar.aspx"
                                    meta:resourcekey="lnkDonorProfileResource1"></asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="lnkDeduction" runat="server" Text="Deduction" NavigateUrl="StandInst.aspx"
                                    meta:resourcekey="lnkDeductionResource1"></asp:HyperLink>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>--%>
        <div class="container">
            <%--<asp:Panel ID="pnlSearchByNameResults" CssClass="modal" runat="server">
                    <asp:GridView ID="grvSearchByName" runat="server" CssClass="table table-striped table-bordered table-condensed"
                        AutoGenerateColumns="False" DataKeyNames="donor_id">
                        <Columns>
                            <asp:TemplateField HeaderText="ID" meta:resourcekey="TemplateFieldResource10">
                                <ItemTemplate>
                                    <asp:HyperLink ID="lnkDonorID" NavigateUrl='<%# Eval("donor_id","~/Collection.aspx?DonorID={0}") %>'
                                        runat="server" Text='<%# Eval("donor_id") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Arabic Name" meta:resourcekey="TemplateFieldResource11">
                                <ItemTemplate>
                                    <asp:Label ID="lblDonorArabicName" Text='<%# Bind("donor_namear") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="English Name" meta:resourcekey="TemplateFieldResource12">
                                <ItemTemplate>
                                    <asp:Label ID="lblDonorEnglishName" Text='<%# Bind("donor_nameen") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Civil ID" meta:resourcekey="TemplateFieldResource13">
                                <ItemTemplate>
                                    <asp:Label ID="lblDonorCivilID" Text='<%# Bind("donor_civilid") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Primary Phone" meta:resourcekey="TemplateFieldResource14">
                                <ItemTemplate>
                                    <asp:Label ID="lblDonorPhone" Text='<%# Bind("primary_phone") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:Button ID="btnCloseSearch" Text="Close" CssClass="btn btn-danger" runat="server"
                        meta:resourcekey="btnCloseSearchResource1" />
                </asp:Panel>
                <ajaxToolkit:ModalPopupExtender ID="pnlSearchByNameResults_ModalPopupExtender" runat="server"
                    DynamicServicePath="" Enabled="True" TargetControlID="HiddenForModal" PopupControlID="pnlSearchByNameResults"
                    BackgroundCssClass="ModalBackground" DropShadow="True" CancelControlID="btnCloseSearch"
                    RepositionMode="RepositionOnWindowResizeAndScroll">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Button ID="HiddenForModal" Text="" runat="server" CssClass="hide" />--%>

            <%-- ' <asp:CheckBox ID="chkPartial0" runat="server" Checked='<%# Bind("partial") %>' OnCheckedChanged="chkPartialEdit_CheckedChanged"
                                Enabled="False" AutoPostBack="True" />--%>
        </div>
        <asp:SqlDataSource ID="CountrySqlDataSource0" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [nat_tab] WHERE ([zone_code] IS NOT NULL)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="BanksSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
            SelectCommand="SELECT * FROM [banks_list]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DonationsForInsertSqlDataSource0" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT donation_code , donation_cat , donation_descrar , donation_descreng FROM donations WHERE (donation_cat = @waqf_donation) AND (ISNULL(Active, 0) = 1) ORDER BY SortOrder;">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlWaqfColDonation" Name="waqf_donation" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DonationDistSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
            DeleteCommand="DELETE FROM dont_dist WHERE (reciept_num = @reciept_num) AND (donation_code = @donation_code)"
            SelectCommand="SELECT dont_dist.donation_value, dont_dist.donation_code, dont_dist.distribution_remrks, donations.donation_descrar, donations.donation_descreng, dont_dist.reciept_num FROM dont_dist INNER JOIN donations ON dont_dist.donation_code = donations.donation_code WHERE (dont_dist.reciept_num = @reciept_num)"
            UpdateCommand="UPDATE dont_dist SET donation_value = @donation_value, distribution_remrks = @distribution_remrks WHERE (donation_code = @donation_code) AND (reciept_num = @reciept_num)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="txtReceiptID" Name="reciept_num" PropertyName="Text" />
                <asp:ControlParameter ControlID="grvDonationDist" Name="donation_code" PropertyName="SelectedValue" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtReceiptID" Name="reciept_num" PropertyName="Text"
                    DefaultValue="0" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="donation_value" />
                <asp:Parameter Name="distribution_remrks" />
                <asp:Parameter Name="donation_code" />
                <asp:ControlParameter ControlID="lblReceiptID" DefaultValue="0" Name="reciept_num"
                    PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="CurrencySDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [currency_tab]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DonationsGroupSDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [donations_group]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="PaymentsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
            DeleteCommand="DELETE FROM pay_method_dist WHERE (reciept_ser_det = @reciept_ser_det) AND (reciept_num = @reciept_num)"
            SelectCommand="SELECT pay_method_dist.pay_amnt, pay_method_dist.acc_num, pay_method_dist.authorization_code, banks_list.bank_ar_name, banks_list.bank_eng_name, pay_methods.pay_method_ar, pay_methods.pay_method_en, pay_method_dist.reciept_ser_det FROM pay_methods INNER JOIN pay_method_dist ON pay_methods.pay_method_id = pay_method_dist.pay_method_id LEFT OUTER JOIN banks_list ON pay_method_dist.bank_code = banks_list.bank_code WHERE (pay_method_dist.reciept_num = @reciept_num)"
            UpdateCommand="UPDATE pay_method_dist SET pay_amnt = @pay_amnt, acc_num = @acc_num, authorization_code = @authorization_code, bank_code = @bank_code 
WHERE (reciept_ser_det = @reciept_ser_det) AND (reciept_num = @reciept_num)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="grvPayments" Name="reciept_ser_det" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="txtReceiptID" Name="reciept_num" PropertyName="Text" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txtReceiptID" DefaultValue="0" Name="reciept_num"
                    PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="pay_amnt" />
                <asp:Parameter Name="acc_num" />
                <asp:Parameter Name="authorization_code" />
                <asp:Parameter Name="bank_code" />
                <asp:Parameter Name="reciept_ser_det" />
                <asp:ControlParameter ControlID="txtReceiptID" Name="reciept_num" PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="CampaignSDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [campaign_tab] WHERE (Visible = 1)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="TitleDS" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
            SelectCommand="SELECT * FROM [salut_tab]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DsSalute" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
            SelectCommand="SELECT * FROM [salut_tab]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="PaymentSqlDataSource0" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [pay_methods]"></asp:SqlDataSource>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="grvDonationDist" EventName="RowDeleted" />
        <asp:AsyncPostBackTrigger ControlID="grvDonationDist" EventName="RowUpdated" />
        <asp:AsyncPostBackTrigger ControlID="grvDonationDist" EventName="RowCreated" />
    </Triggers>
</asp:UpdatePanel>
