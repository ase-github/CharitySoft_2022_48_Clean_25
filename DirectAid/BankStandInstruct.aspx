<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="BankStandInstruct.aspx.vb" Inherits="DirectAid.BankStandInstruct"
Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" ClientIDMode="Static" MaintainScrollPositionOnPostback="true" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" id="header">
    <title>Direct Aid - Bank Standing Instruction</title>
    <link href="Styles/CRUXStyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="Content/jquery.jnotify-alt.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
    <script src="Scripts/jquery.jnotify.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.js" type="text/javascript"></script>
    <script type="text/javascript"> 

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

            $("#txtEndDate").datepicker({
                buttonImage: 'Content/images/calendar.png',
                buttonImageOnly: true,
                showOn: 'button', 
                changeMonth: true,
                changeYear: true,
                dateFormat: 'dd/mm/yy'
            });



            // ******************
            $("#txtmonthNo").blur(function () {


                var date1 = $("#txtStartDt").datepicker({
                    dateFormat: 'dd/mm/yyyy'
                });
                var mnumb = $("#txtmonthNo").val();

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

                if (!isNaN(value)) {
                    var qty1 = totval / value;
                    $("#txtquant").val(qty1);
                   $("#txtTotal").val(totval);
                }
                else {
                    var qty1 = totval / totval;
                    $("#txtquant").val(qty1);
                   $("#txtTotal").val(totval);
                }
            });

           
            // Edit payment

            $("#txtpaymentedit").keyup(function () {
                var totvalE = $("#txtpaymentedit").val();
                var valueE = $("#txtDistValueEdit").val();

                if (!isNaN(valueE)) {
                    var qty1E = totvalE / valueE;
                    $("#txtquantEdit").val(qty1E);
                    $("#txtTotalEdit").val(totvalE);

                }
                else {
                    var qty1E = totvalE / totvalE;
                    $("#txtquantEdit").val(qty1E);
                    $("#txtTotalEdit").val(totvalE);
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

                if (!isNaN(valueF)) {
                    var qty1F = totvalF / valueF;
                    $("#txtquantfooter").val(qty1F);
                    $("#txtTotalFooter").val(totvalF);
                }
                else {
                    var qty1F = totvalF / totvalF;
                    $("#txtquantfooter").val(qty1F);
                    $("#txtTotalFooter").val(totvalF);
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

            //datefiffernt
            $("#txtTotalDeduct").blur(function () {
                var days = 0;
                var tot1 = 0;
                var intmnt = 0;
                var inst = 0;

                var tot1 = $("#txtTotalDeduct").val();

                var d1 = $("#txtStartDt").datepicker({
                    dateFormat: 'dd/mm/yyyy'
                });
                var d2 = $("#txtEndDate").datepicker({
                    dateFormat: 'dd/mm/yyyy'
                });

                var start = $('#txtStartDt').datepicker('getDate');
                var end = $('#txtEndDate').datepicker('getDate');

                if (((end - start)== 0) || ((end - start) <= 30)) {
                    intmnt = tot1;
                    $("#txtinstAmt").val(intmnt);
                }
                else  {

                    var days = (end - start) / 1000 / 60 / 60 / 24;

                    var months = Math.round(days / 30);

                    inst = tot1 / (months)
                    inst = (inst*1000.000)/1000.000
                    $("#txtinstAmt").val(inst);
                }
                //                    if (!isNaN(months)) {
                //                     $("#txtinstAmt").val(intmnt);
                //                    }

                //                    else {
                //                    $("#txtinstAmt").val('0');
                //                    }

            });

        }

       
         


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
                    l= document.getElementById("A1");
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
 
          if (txt.value.length > (maxLen-1)) return false;
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

        function insertByEnterKey(buttonId) {
            //var button = document.getElementById(buttonId);


            buttonId.click();

        }

    </script>

    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 27px;
        }
        .style5
        {
            width: 389px;
            height: 31px;
        }
        .style6
        {
            width: 137px;
            height: 34px;
        }
        .style7
        {
            width: 100%;
            height: 36px;
        }
        .style14
        {
            width: 100%;
            height: 32px;
        }
        .style16
        {
            width: 158px;
            height: 11px;
        }
        .style28
        {
            width: 141px;
        }
        .btn-inverse
        {}
        .btn-primary
        {}
        #form1
        {
            
            margin-left: 0px;
        }
        .style49
        {
            width: 221px;
        }
        .style50
        {
            width: 100%;
            height: 39px;
            margin-top: 0px;
        }
        .style80
        {
            width: 100%;
            height: 35px;
            margin-bottom: 0px;
        }
        .navbar
        {
            height: 122px;
        }
        .label
        {
            margin-left: 0px;
        }
        .style92
        {
          
            height: 104px;
        }
        .table-condensed
        {
            margin-top: 0px;
        }
        .style94
        {
            width: 660px;
        }
        .style96
        {
            width: 68px;
        }
        .style97
        {
            width: 120px;
        }
        .style101
        {
            width: 69px;
        }
        .style129
        {
            width: 145px;
            right: 0px;
            left: 0px;
            height: 25px;
        }
        .style135
        {
            width: 71px;
        }
        .style158
        {
            width: 59px;
        }
        .style171
        {
            width: 132px;
        }
        .style174
        {
            width: 174px;
            height: 34px;
        }
        .style176
        {
            width: 335px;
            height: 34px;
        }
        .style177
        {
            width: 126px;
        }
        .style178
        {
            width: 103px;
        }
        .style207
        {
            width: 79px;
        }
        .style214
        {
            width: 43px;
        }
        .style226
        {
            width: 124px;
        }
        .style239
        {
            width: 75px;
        }
        .style255
        {
            width: 156px;
        }
        .style256
        {
            width: 30px;
        }
        .style271
        {
            width: 15px;
        }
        .style273
        {
            width: 1px;
        }
        .style276
        {
            width: 22px;
        }
        .style281
        {
            width: 44px;
        }
        .style284
        {
            width: 63px;
        }
        .style306
        {
            width: 191px;
        }
        .style308
        {
            width: 163px;
        }
        .style309
        {
            <%--width: 1031px;--%>;
            width: 192px;
        }
        .style328
        {
            width: 783px;
        }
        .style330
        {
            width: 5px;
        }
        .style332
        {
            width: 371px;
        }
        .style335
        {
            width: 72px;
        }
        .style336
        {
            width: 66px;
        }
        .style343
        {
            width: 157px;
        }
        .style344
        {
            width: 284px;
        }
        .style345
        {
            width: 41px;
        }
        .style350
        {
            width: 328px;
        }
        .style384
        {
            width: 84px;
        }
        .style385
        {
            width: 78px;
        }
        .style395
        {
            width: 131px;
        }
        .style460
        {
            width: 136px;
        }
        .style490
        {
            width: 70px;
        }
        .style494
        {
            width: 81px;
        }
        .style495
        {
            width: 74px;
        }
        .style502
        {
            width: 117px;
        }
        .style517
        {
            width: 13px;
        }
        .style520
        {
            width: 34px;
        }
        .style521
        {
            width: 20px;
        }
        .style524
        {
            width: 6px;
        }
        .style525
        {
            width: 60px;
        }
        .style528
        {
            width: 123px;
            height: 25px;
        }
        .style532
        {
            width: 124px;
            height: 25px;
        }
        .style533
        {
            width: 54px;
            height: 25px;
        }
        .style534
        {
            width: 67px;
            height: 25px;
        }
        .style537
        {
            width: 108px;
            height: 25px;
        }
        .style538
        {
            width: 127px;
        }
        .style540
        {
            width: 45px;
        }
        .style548
        {
            width: 99px;
        }
        .style554
        {
            width: 90px;
        }
        .style556
        {
            width: 174px;
        }
        .style557
        {
            width: 21px;
        }
        .style559
        {
            width: 67px;
        }
        .style560
        {
            width: 121px;
        }
        .style561
        {
            width: 12px;
        }
        .style563
        {
            width: 7px;
        }
        .style565
        {
            width: 4px;
        }
        .style567
        {
            width: 129px;
        }
        .style568
        {
            width: 536px;
        }
        .style569
        {
            width: 164px;
        }
        .style570
        {
            width: 47px;
        }
        .style571
        {
            width: 37px;
        }
        .style572
        {
            width: 88px;
            height: 25px;
        }
    </style>
</head>
<body style="font-size:8; color:navy; " >

                               
     <form id="form1" runat="server" class="form-horizontal" 
     dir="<%$ Resources: PageDir %>" 
     style="background-color: #f1f7fc; ">
     <asp:UpdatePanel ID="UpdatePanel" runat="server">
                                 <ContentTemplate>
    <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="560">
    </asp:ScriptManager>
   <asp:Panel ID="Panel1" runat="server" BorderColor="SteelBlue" BorderStyle="Solid"
            BorderWidth="1px" Style="z-index: 101; position: absolute;
            left: 25px;" 
         meta:resourcekey="Panel1Resource1">          
     <table class="style1">
         <tr class="header-label">
            <td class="style5">

                        <asp:Label ID="lblSearchHeader" Text="Search" runat="server"                     
                            meta:resourcekey="lblSearchHeaderResource1" CssClass="header-label" />

            </td> 
            
         </tr>
         </table>
        
        
                 
        
         <table>
         
         
         <tr>
             <td class="style6">
                            <asp:DropDownList ID="ddlSearchType" runat="server" CssClass="dropdownlist"
                                meta:resourcekey="ddlSearchTypeResource1">
                                <asp:ListItem Value="0" Text="ID" meta:resourcekey="ListItemResource1" />
                                <asp:ListItem Value="1" Text="Civil ID" meta:resourcekey="ListItemResource2" />
                                <asp:ListItem Value="2" Text="Phone" meta:resourcekey="ListItemResource3" />
                                <asp:ListItem Value="3" Text="Mobile" meta:resourcekey="ListItemResource4" />
                                <asp:ListItem Value="4" Text="Arabic Name" 
                                    meta:resourcekey="ListItemResource5" />
                                <asp:ListItem Value="5" Text="English Name" 
                                    meta:resourcekey="ListItemResource6" />
                                <asp:ListItem Value="6" Text="Ref Number" 
                                    meta:resourcekey="ListItemResource7" />
                            </asp:DropDownList>
                            </td>
             <td class="style174">
                            <asp:TextBox ID="txtSearch" runat="server" MaxLength="50" 
                                meta:resourcekey="txtSearchResource1" CssClass="textbox" 
                     Width="155px"></asp:TextBox>
                            </td>
             
             <td class="style176">

                            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="google-button google-button-blue"
                                meta:resourcekey="btnSearchResource1" Width="93px" />
                        

             </td> 
             <td>
                 <asp:Label ID="lblLang" runat="server" Text="Change Language" visible="false" meta:resourcekey="langCode"></asp:Label>
             </td>
             <td class="style385">
             
                 <asp:DropDownList ID="ddlLang" runat="server" Height="22px" Width="79px" Visible="False" style="margin-left: 0px" CssClass="dropdownlist">
                 <asp:ListItem Value="0" Text="Arabic" meta:resourcekey="LangArabicResource" ></asp:ListItem>
                 <asp:ListItem Value="1" Text="English" meta:resourcekey="LangEnglishResorce"></asp:ListItem>
                 </asp:DropDownList>
             
             </td>
             <td>
             <asp:Button ID="btnchngLang" runat="server" CssClass="google-button google-button-blue" Visible="False"
                                 Height="25px" meta:resourcekey="btnchngLangResource1" Text="OK" Width="33px" />
             </td>
             <td>
             <asp:LinkButton ID="lbtnCulture" runat="server" CausesValidation="False" 
                            Font-Size="9pt" meta:resourcekey="lbtnCultureResource1" 
                     ></asp:LinkButton>
             </td>
             <td>
             <asp:SqlDataSource ID="bankBranchSDC" runat="server" 
                                   ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                   
                     SelectCommand="SELECT bnk_code, brn_code, brn_namear, brn_nameng FROM bnk_brnchtab AS bnk_brnchtab_1 WHERE (bnk_code = @bnk_code)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlBnk" DefaultValue="0" Name="bnk_code" 
                                            PropertyName="SelectedValue" Type="Int16" />
                                    </SelectParameters>
                               </asp:SqlDataSource>
             </td>
             <td>
             
                 <asp:SqlDataSource ID="BrnDS" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                     SelectCommand="SELECT bnk_brnchtab.bnk_code, bnk_brnchtab.brn_code, bnk_brnchtab.brn_namear, bnk_brnchtab.brn_nameng FROM banks_list INNER JOIN bnk_brnchtab ON banks_list.bank_code = bnk_brnchtab.bnk_code AND banks_list.bank_code = @bank_code">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="ddlBnk" DefaultValue="" Name="bank_code" 
                             PropertyName="SelectedValue" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             
             </td>
             <td class="style569">
             
                 <asp:SqlDataSource ID="Inst_detDS" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                     SelectCommand="GetInstrcutionDetail" SelectCommandType="StoredProcedure">
                     <SelectParameters>
                         <asp:ControlParameter ControlID="txtDonrIDn" DefaultValue="0" Name="ref_num" 
                             PropertyName="Text" Type="Int32" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             
             </td>
         </tr>
         
     </table>
       
        <asp:Panel ID="Panel2" runat="server" BorderColor="SteelBlue" 
                                BorderStyle="Solid" BorderWidth="1px" 
                                
           
           
           
           style="z-index: 102; position: absolute; top: 76px; height: 156px; width: 400px;">
                                <table class="style7"  border="0"
                                 <%--border="#ffffff" bordercolordark="#ffffff" 
                                    bordercolorlight="#f1f7fc" --%>
                                    dir="rtl" style="width: 384px; ">
                                    <tr>
                                        <td>
                                            <a ID="lnk_hide_panel" runat="server" 
                                                style="width: 15px; height: 18px; left: 333px; top: 694px; z-index: 103; color: white; background-color:Silver;" 
                                                visible="true">X </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DataGrid ID="deals_grid" runat="server" AllowPaging="True" 
                                                AutoGenerateColumns="False" BackColor="White" BorderColor="LightSteelBlue" 
                                                BorderStyle="Solid" BorderWidth="1px" CellPadding="0" 
                                                DataSourceID="SqlDataSource1" Font-Name="tahoma" Font-Names="tahoma" 
                                                Font-Size="10pt" ForeColor="DarkBlue" HeaderStyle-BackColor="#aaaadd" 
                                                ShowFooter="True" Style="z-index: 101; left: 15px; top: 50px; margin-right: 0px;" 
                                                Width="16px" Height="16px">
                                                <SelectedItemStyle BackColor="Ivory" Font-Bold="True" ForeColor="DeepPink" />
                                                <PagerStyle Mode="NumericPages" />
                                                <AlternatingItemStyle BackColor="AliceBlue" />
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <Columns>
                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <asp:imageButton ID="Linkbutton3" CausesValidation="false" 
                                                                CommandName="select" NAME="Linkbutton1" columnwidth="40"
                                                                ImageUrl="~/Content/images/add.png"
                                                                PostbackUrl='<%# Eval("donor_id","~/BankStandInstruct.aspx?DonorID={0}" )%>'
                                                                 runat="server" Text='<%# Eval("donor_id") %>' 
                                                                onclick="Linkbutton3_Click" style="height: 16px">
                                                                </asp:imageButton>
                                                         
                                                         </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn HeaderText="Id " meta:resourcekey= "GrdHeaderNumber" >
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Donor_id" runat="server"  
                                                           Text='<%#databinder.eval(container.dataitem,"donor_id")%>' Width="30">
														</asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn HeaderText="Arabic Name" meta:resourcekey="GrdHeaderArbName">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Arabic_Name" runat="server" 
                                                        
                                                                Text='<%#databinder.eval(container.dataitem,"donor_namear")%>' 
                                                                Width="150">
														</asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn HeaderText="English Name" meta:resourcekey="GrdHeaderEngName">
                                                 
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_Eng_Name" runat="server" 
                                                                Text='<%#databinder.eval(container.dataitem,"donor_nameen")%>' Width="150">
														</asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn HeaderText="Civil ID" meta:resourcekey="GrdHeaderCivilId">
                                                   
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_civilid" runat="server" 
                                                                Text='<%#databinder.eval(container.dataitem,"donor_civilid")%>' Width="80">
														</asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                     <asp:TemplateColumn HeaderText="Phone" meta:resourcekey="GrdHeaderPhone">
                                                     
                                                        <ItemTemplate>
                                                            <asp:Label ID="elbl_telephone" runat="server" 
                                                                Text='<%#databinder.eval(container.dataitem,"primary_phone")%>' Width="70">
														</asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                  <%-- <asp:ButtonColumn CommandName="Delete" 
                                                        Text="&lt;img border=0 align=absmiddle src=images\delete.ico&gt;" 
                                                        Visible="False"></asp:ButtonColumn>--%>
                                                </Columns>
                                                <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" 
                                                    ForeColor="AliceBlue" Height="25px" HorizontalAlign="Center" />
                                                <FooterStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="10pt" 
                                                    ForeColor="AliceBlue" Height="25px" HorizontalAlign="Center" />
                                            </asp:DataGrid>
                                        </td>

                                    </tr>
                                </table>
                            </asp:Panel>
            


            <asp:Panel ID="pnlinstructDetail" runat="server" BorderColor="SteelBlue" 
                                BorderStyle="Solid" BorderWidth="1px"  
                                
              style="z-index: 102; position: absolute; top: 95px; width: 605px; left: 125px;">

        <table class="style7"  border="0"
                                 <%--border="#ffffff" bordercolordark="#ffffff" 
                                    bordercolorlight="#f1f7fc" --%>
                                    dir="rtl" style="width: 384px; ">
                                    <tr>
                                        <td>
                                            <a ID="lnk_hide_panel2" runat="server" 
                                                style="width: 15px; height: 18px; left: 333px; top: 694px; z-index: 103; color: white; background-color:Silver;" 
                                                visible="true">X </a>
                                        </td>
                                    </tr>
                     
                         

           
                                    <tr>
                                        <td class="style16 header-label">
                                            <asp:Label ID="lblDonorInstructions" runat="server" CssClass="header-label" 
                                                meta:resourcekey="lblDonorInstructionResource1" Text="Instruction Details" Width="605px" />
                                        </td>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GrdInstructDet" runat="server" AllowPaging="True" 
                                                    AutoGenerateColumns="False" BackColor="White" BorderColor="green" 
                                                    BorderStyle="Solid" BorderWidth="1px" CellPadding="0" DataKeyNames="ref_numb" 
                                                    DataSourceID="Inst_detDS" Font-Name="tahoma" Font-Names="tahoma" 
                                                    Font-Size="8pt" Font-style="normal" ForeColor="DarkBlue" HeaderStyle-BackColor="#aaaadd" 
                                                    ShowFooter="True" Style="z-index: 101;" Width="605px" Height="200px">
                                                    <Columns >
                                                        <asp:TemplateField HeaderText="RefNo" meta:resourcekey="GrdRefNoResc1" SortExpression="ref_numb">
                                                            <EditItemTemplate>
                                                                <asp:Label ID="lbl_RefNo" runat="server" Text='<%# Eval("ref_numb") %>'></asp:Label>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_RefNo1" runat="server" Text='<%# Bind("ref_numb") %>' width="50px" ></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Date" meta:resourcekey="GrdDateResc1" SortExpression="instruct_date">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtInstructDt" runat="server" 
                                                                    Text='<%# Bind("instruct_date") %>' ></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_instructDt" runat="server" 
                                                                    Text='<%# Bind("instruct_date" ,"{0:dd/MM/yyyy}") %>' Width ="60"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Bank Ref" meta:resourcekey="GrdBnkRefResc1" SortExpression="bank_ref_num">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtBankRef" runat="server" Text='<%# Bind("bank_ref_num") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="Lbl_Bankref" runat="server" Text='<%# Bind("bank_ref_num") %>' Width="60"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Bank" meta:resourcekey="GrdBnkResc1" SortExpression="bank_ar_name">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="TxtBnk" runat="server" Text='<%# Bind("bank_ar_name") %>' ></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_bnk_name" runat="server" Text='<%# Bind("bank_ar_name") %>' Width ="80"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Status"  meta:resourcekey="GrdstResc1" SortExpression="standing_status">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtStat" runat="server" Text='<%# Bind("standing_status") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_status" runat="server" Text='<%# Bind("standing_status") %>' Width ="45"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Start" meta:resourcekey="GrdStartResc1" SortExpression="start_date">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtFromdt" runat="server" Text='<%# Bind("start_date" ,"{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_from_dt" runat="server" Text='<%# Bind("start_date","{0:dd/MM/yyyy}") %>' Width="60"> </asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="End" meta:resourcekey="Grdendresc1" SortExpression="end_date">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtEnd_dt" runat="server" Text='<%# Bind("end_date" ,"{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_End_dt" runat="server" Text='<%# Bind("end_date","{0:dd/MM/yyyy}") %>' Width="60"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Amount" meta:resourcekey="GrdAmtResc1" SortExpression="total_deduct_value">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtAmnt" runat="server" 
                                                                    Text='<%# Bind("total_deduct_value" , "{0:N3}") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_amnt" runat="server" 
                                                                    Text='<%# Bind("total_deduct_value", "{0:N3}") %>' Width="60"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Inst.Amt" meta:resourcekey="GrdinstResc1" SortExpression="installment_value">
                                                            <EditItemTemplate>
                                                                <asp:TextBox ID="txtInstamt" runat="server" 
                                                                    Text='<%# Bind("installment_value" , "{0:N3}") %>'></asp:TextBox>
                                                            </EditItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbl_instamnt" runat="server" 
                                                                    Text='<%# Bind("installment_value", "{0:N3}")  %>' Width="60"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="8pt" 
                                                        ForeColor="AliceBlue" Height="25px" HorizontalAlign="Center" />
                                                    <FooterStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="9pt" 
                                                        ForeColor="AliceBlue" Height="25px" HorizontalAlign="Center" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </tr>
                                </table>
           
           
            </asp:Panel>
      <table class="style80">
                     <tr>
                         <td class="style384">
                             <asp:Button ID="btnPrint" runat="server" CssClass="google-button google-button-blue" 
                                 meta:resourcekey="btnPrintResource1" Height="25px" Text="NEW DONOR" 
                                 Width="93px" />
                         </td>
                         <td class="style96">
                             <asp:Button ID="btnPrntReport" runat="server" CssClass="google-button google-button-blue" 
                                 meta:resourcekey="btnPrntReporttResource1" Height="25px" Text="Report" 
                                 Width="93px" />
                         </td>
                         <td class="style97">
                             <asp:Button ID="btnBnkRep" runat="server" CssClass="google-button google-button-blue" 
                                 meta:resourcekey="btnBnkRepResource1" Height="25px" Text="Bank Instruct" 
                                 Width="120px" />
                         </td>
                         <td class="style158">
                             <asp:Button ID="btnReset" runat="server" CssClass="google-button google-button-blue" 
                                 meta:resourcekey="btnResetResource1" Height="25px" Text="Reset" Width="93px"/>
                         </td>
                         <td class="style568">
                         
                             <asp:Button ID="btnsaveInstruct" runat="server" CssClass="google-button google-button-blue"
                                 Height="25px" meta:resourcekey="btnsaveInstructResource1" Text="Save" Width="93px" />
                         
                         </td>
                         <td>
                          <asp:LinkButton ID="instruct" runat="server" Width="155px" 
                                 meta:resourcekey="lnkinstructRescr1" ForeColor="#CC0066" Visible="False"></asp:LinkButton>
                         </td>
                                
                     </tr>
                 </table>
     
     <table class="style7" >
         <tr>
                 <td class="style16 header-label">
                        <asp:Label ID="lblDonorInfoHeader" Text="Donor Information" 
                     runat="server" CssClass="header-label"
                              meta:resourcekey="lblDonorInfoHeaderResource1" 
                             />
                    
                    </td>
             
         </tr>

   </table>
       <table style=" height: 29px;">
         <tr>
             <td class="style135">
                            <asp:Label ID="lblDnrID" Text="Donor ID" Font-Names="Tahoma" font-size="8pt" 
                                CssClass="label" for="txtDonrIDn"
                                runat="server" ForeColor ="#003366" meta:resourcekey="lblDnrIDResource1" />
                            </td>
             <td class="style276">
                                <asp:TextBox ID="txtDonrIDn" runat="server" Width="135px" Enabled="False" 
                                    meta:resourcekey="txtDonrIDnResource1" Height="19px" CssClass="textbox" style="margin-left: 0px"
                                    ></asp:TextBox>
                            </td>
             <td class="style336">
                            <asp:Label CssClass="label" for="ddlDonorType" ID="Label1" Text="Donor Type"
                                runat="server" Font-Names="Tahoma" font-size="8pt" ForeColor="#003366" 
                                meta:resourcekey="lblDonerTypeResource1" />
                            </td>
             <td class="style343">
                                <asp:DropDownList ID="ddlDonorType" runat="server" Font-Names="Tahoma" style="margin-left: 0px" 
                                    font-size="8pt" ForeColor ="#003366" CssClass="dropdownlist"
                                    meta:resourcekey="ddlDonorTypeResource1" Height="22px" Width="144px" >
                                    <asp:ListItem Value="0" meta:resourcekey="ListItemResource8" Text="Individual"></asp:ListItem>
                                    <asp:ListItem Value="1" meta:resourcekey="ListItemResource9" Text="Company"></asp:ListItem>
                                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource10" 
                                        Text="Charity Firm"></asp:ListItem>
                                    <asp:ListItem Value="3" meta:resourcekey="ListItemResource11" Text="Other"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                    <td class="style214">
                    
                        <asp:Label ID="lblCivilID" runat="server" CssClass="label" Font-Names="Tahoma" 
                            font-size="8pt" for="txtCivilID" ForeColor="#003366" 
                            meta:resourcekey="lblCivilIDResource1" Text="Civil ID" />
                    
                    </td>
                    <td class="style226">
                    
                        <asp:TextBox ID="txtCivilID" runat="server" CssClass="textbox" Enabled="False" 
                            height="19px" MaxLength="12" meta:resourcekey="txtCivilIDResource1" 
                            style="margin-left: 0px" onkeypress="return isNumberKey(event)"
                             onblur="return CivilIdValidate(event)" Width="115px"></asp:TextBox>
                    
                    </td>
                    <td class="style273">
                    
                        <asp:Label ID="lblPhone" runat="server" color="blue" CssClass="label" 
                            Font-Names="Tahoma" font-size="8pt" for="txtPhone" ForeColor="#003366" 
                            meta:resourcekey="lblPhoneResource1" Text="Home Phone" />
                    
                    </td>
                    <td class="style330">
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" Enabled="False" 
                            height="19px" MaxLength="10" meta:resourcekey="txtPhoneResource1" style="margin-left: 0px" onkeypress="return isNumberKey(event)"
                            Width="101px"></asp:TextBox>
                    </td>

                    <td class="style271">
                       <asp:Label ID="lblMobile" runat="server" CssClass="label" Font-Names="Tahoma" 
                            font-size="8pt" for="txtMobile" ForeColor="#003366" 
                            meta:resourcekey="lblMobileResource1" Text="Mobile" />
                      </td>
                    <td class="style207">
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="textbox" Enabled="False" 
                            height="19px" MaxLength="8" meta:resourcekey="txtMobileResource1" style="margin-left: 0px" onkeypress="return isNumberKey(event)"
                            Width="101px"></asp:TextBox>
                    </td>
         </tr>
         </table>
     <table class="style14">
         <tr>
             <td class="style490">
                            <asp:Label ID="lblArabicName" Text="Arabic Name" ForeColor ="#003366"
                     CssClass="label" Font-Names="Tahoma" font-size="8pt" for="txtArabicName"
                                runat="server" meta:resourcekey="lblArabicNameResource1" />
                            </td>
             <td class="style332">
                                <asp:TextBox ID="txtArabicName" runat="server" Width="354px" Enabled="False" 
                                    meta:resourcekey="txtArabicNameResource1" Height="20px" CssClass="textbox" 
                                    style="margin-left: 0px" MaxLength="180"></asp:TextBox>
                            </td>
             <td class="style281">
                            <asp:Label ID="lblEnglishName" Text="English Name" ForeColor ="#003366"
                     CssClass="label" Font-Names="Tahoma" font-size="8pt" for="txtEnglishName"
                                runat="server" meta:resourcekey="lblEnglishNameResource1" />
                            </td>
             <td class="style344">
                                <asp:TextBox ID="txtEnglishName" runat="server" Width="424px" Enabled="False" 
                                    meta:resourcekey="txtEnglishNameResource1" Font-Names="Tahoma" 
                                    CssClass="textbox"  style="margin-left: 0px"
                                    font-size="8pt" Height="18px" MaxLength="180" ></asp:TextBox>
                            </td>
             <td>
                 </td>
         </tr>
     </table>
            
     <table class="style14">
         <tr>
             <td class="style335">
                            <asp:Label ID="lblTotalDonation" runat="server" CssClass="label" 
                                Font-Names="Tahoma" font-size="8pt" for="txtTotalDonation" ForeColor="#003366" 
                                meta:resourcekey="lblTotalDonationResource1" Text="Total Donation" />
                              
             </td>
             <td class="style28">
                                <asp:TextBox ID="txtTotalDonation" runat="server" CssClass="textbox" 
                                    Enabled="False" Height="18px" meta:resourcekey="txtTotalDonationResource1" 
                                    style="margin-left: 0px" Width="135px"></asp:TextBox>
             </td>
             <td class="style284">
                            <asp:Label ID="lbltotStanInstruct" runat="server" CssClass="label" 
                                Font-Names="Tahoma" font-size="8pt" for="txttotintruct" ForeColor="#003366" 
                                meta:resourcekey="lbltotStanInstructResource1" Text="Total Instruction" />
                            </td>
             <td class="style308">
                                <asp:TextBox ID="txttotintruct" runat="server" CssClass="textbox" 
                                    Enabled="False" Height="20px" meta:resourcekey="txttotintructResource1"  style="margin-left: 0px"
                                    Width="141px"></asp:TextBox>
                            </td>
             <td class="style345">
                            <asp:Label ID="lblTotalWaqf" runat="server" CssClass="label" 
                                Font-Names="Tahoma" font-size="8pt" for="txtTotalWaqf" ForeColor="#003366" 
                                meta:resourcekey="lblTotalWaqfResource1" Text="Total Waqf" />
                            </td>
             <td class="style255">
                                <asp:TextBox ID="txtTotalWaqf" runat="server" CssClass="textbox" 
                                    Enabled="False" Height="19px" meta:resourcekey="txtTotalWaqfResource1"  style="margin-left: 0px" 
                                    Width="118px"></asp:TextBox>
                            </td>
                        
             <td class="style256">
                            &nbsp;</td>
             <td class="style239">
                               <asp:Button ID="btnCreate" runat="server" 
                                   CssClass="google-button google-button-blue" Height="25px" 
                                   meta:resourcekey="btnCreateResource1" Text="Create" Width="71px" />
                               </td>
                               <td>
                               
                                   <asp:Button ID="btnOpen" runat="server" 
                                       CssClass="google-button google-button-blue" meta:resourcekey="btnOpenResource1" 
                                       Text="Open" Height="25px" Width="71px" />
                               
                               </td>
                               <td>
                                  
             </td>
       
         </tr>
     </table>
            
     
            
     <table class="style14"  width="20px">
         <tr>
             <td class="style49 header-label"> 
                        <asp:Label ID="lblRecieptHeader" Text="Standing Instructions" 
                     runat="server" CssClass="header-label"
                             meta:resourcekey="lblRecieptHeaderResource1"/> 
                             
                    </td>
                

                
         </tr>
        
     </table>
     <table class="style50">
         <tr>
             <td class="style178">
                            <asp:Label ID="lblWaqf" Text=" Waqf" Font-Names="Tahoma" font-size="8pt" runat="server" 
                     CssClass="label" for="chkWaqf" forcolor="black"
                            meta:resourcekey="lblWaqfResource1"/>
                            </td>
             <td class="style309">
                                <asp:CheckBox ID="chkWaqf" forcolor ="black" runat="server" 
                                    meta:resourcekey="chkWaqfResource1" AutoPostBack="True">
                                </asp:CheckBox>
                            </td>
             <td class="style495">
                            <asp:Label ID="lblReceiptID" Text="Ref No" Font-Names="Tahoma" font-size="8pt" 
                                runat="server" CssClass="label"
                                for="txtReceiptID" meta:resourcekey="lblReceiptIDResource1" />
                            </td>
             <td class="style460">
                                <asp:TextBox ID="txtReceiptID" runat="server" Enabled="False" style="margin-left: 0px; margin-bottom: 0px;" 
                                    CssClass="textbox" meta:resourcekey="txtReceiptIDResource1"  Width="108px" 
                                    Height="18px"></asp:TextBox>
                            </td>
             <td class="style494">
                            <asp:Label ID="Label6" runat="server" CssClass="label" 
                                Font-Names="Tahoma" font-size="8pt" for="ddlstandStat" 
                                Text="St.Order Status" 
                     meta:resourcekey="lblStatusResource1"></asp:Label>
                            &nbsp;
                            </td>

                            <td class="style395">
                            
                            
                                <asp:DropDownList ID="ddlstandStat" runat="server" CssClass="dropdownlist" 
                                    Enabled="false" Font-Names="Tahoma" font-size="8pt" Height="23px" style="margin-left: 0px"
                                    meta:resourcekey="ddlddlstandStatResource1" Width="130px">
                                    <asp:ListItem meta:resourcekey="ListItemResource1Sts" Text="Select Category" 
                                        Value="0"></asp:ListItem>
                                    <asp:ListItem  meta:resourcekey="ListItemResource2Sts" 
                                        Selected="True" Text="Pending" Value="1"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource3Sts" Text="Suspend" Value="2"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource4Sts" Text="Closed" Value="3"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource5Sts" Text="Active" Value="4"></asp:ListItem>
                                    <asp:ListItem meta:resourcekey="ListItemResource6Sts" Text="Cancelled" 
                                        Value="5"></asp:ListItem>
                                </asp:DropDownList>
                            
                            
                            </td>
             
             <td class="style502" 
                 
                 style="padding: inherit; border-style: none; border-width: inherit; border-color: #FFFFFF;">
                 &nbsp;&nbsp;<asp:Label ID="lblStatReasn" runat="server" CssClass="label" 
                     Font-Names="Tahoma" font-size="8pt" for="lblStatReasn" 
                     meta:resourcekey="lblStatReasnResource1" Text="Status Reason" />
             </td>
             <td class="style306" 
                 style="border-style: none; border-width: inherit; border-color: #FFFFFF">
                           <asp:DropDownList ID="ddlstatReasn" runat="server" AppendDataBoundItems="True" 
                               AutoPostBack="True" DataSourceID="statReasonDs" DataTextField="stat_reason_ara" 
                               DataValueField="stat_reason_code"  Font-Names="Tahoma" 
                               font-size="8pt" Height="23px" meta:resourcekey="ddlstatReasnResource1" 
                               Width="127px">
                           </asp:DropDownList>
                            </td>
            <td class="style563">
            
                <asp:LinkButton ID="LnkChange" runat="server" font-size="9pt" 
                    meta:resourcekey="lnk_buttonResource" Text="Activate" Width="67px" 
                    style="margin-left: 0px" ForeColor="#CC0099" Height="16px"></asp:LinkButton>
            
            </td>
            <td class="style561">
                <asp:LinkButton ID="LnkCancelled" runat="server" font-size="9pt" 
                    meta:resourcekey="LnkCancelledResource" Text="Cancelled" Width="62px" 
                    Height="19px" ForeColor="#CC0099"></asp:LinkButton>
            </td>
                       
         </tr>
     </table>
            
     <table class="style50">
         <tr>
             <td class="style559">
                            <asp:Label ID="lblReceiptDate" Text="Instruct Date" Font-Names="Tahoma" 
                                font-size="8pt" runat="server" CssClass="label"
                                for="txtReceiptDate" 
                     meta:resourcekey="lblReceiptDateResource1" />
                            </td>
             <td class="style560">
                                <asp:TextBox ID="txtReceiptDate" runat="server" 
                                    CssClass="textbox" meta:resourcekey="txtReceiptDateResource1" 
                                    Height="20px" Width="65px" 
                                    style="margin-left: 0px" Enabled="False"></asp:TextBox>
                            </td>
             <td class="style540">
                            <asp:Label ID="lblCurrency" Text="Currency" runat="server" CssClass="label" ForeColor ="Red"
                                for="ddlCurrency" Font-Names="Tahoma" font-size="8pt" 
                                meta:resourcekey="lblCurrencyResource1" />
                            </td>
             <td class="style524">
                                <asp:DropDownList ID="ddlCurrency" runat="server" DataSourceID="CurDS1"
                                    DataTextField="currency_descrar"  CssClass="dropdownlist" 
                     DataValueField="currency_code" AppendDataBoundItems="True"
                                    meta:resourcekey="ddlCurrencyResource1" Height="23px" Font-Names="Tahoma" style="margin-left: 0px"
                                    font-size="8pt" Width="113px">
                                    <%--<asp:ListItem Value="0" meta:resourcekey="ListItemResource12" 
                                        Text="Please Select Currency"></asp:ListItem>--%>
                                </asp:DropDownList>
                                </td>
             <td class="style565" >
                        <asp:Label ID="lblDonationCat" Text="Donation Type" Font-Names="Tahoma" ForeColor ="Red"
                            font-size="8pt" runat="server" 
                     width ="72px" CssClass="label"
                            for="ddlDontationCat" meta:resourcekey="lblDonationCatResource1" 
                            Height="21px" />
                        </td>
             <td class="style525">
                            <asp:DropDownList ID="ddlDontationCat" runat="server" DataSourceID="DOn_TpDS"
                                DataTextField="donation_descrar" DataValueField="donation_cat" AppendDataBoundItems="True"
                                AutoPostBack="True" meta:resourcekey="ddlDontationCatResource1" CssClass="dropdownlist"
                     Height="22px" Font-Names="Tahoma" font-size="8pt"  Width="130px" 
                                style="margin-left: 0px">
                                <asp:ListItem Value="0" meta:resourcekey="ListItemResource13"  
                                    Text="Please Select Donation Type" ></asp:ListItem>
                            </asp:DropDownList>
                            </td>
             <td class="style96">

                           <asp:Label ID="lblCampaign" runat="server" CssClass="label" 
                               Font-Names="Tahoma" font-size="8pt" for="ddlcampaign" 
                               meta:resourcekey="lblCampaignResource1" Text="Campaign" />
             </td>
             <td class="style521">
                           
                            <asp:DropDownList ID="ddlcampaign" runat="server" AppendDataBoundItems="True" 
                                CssClass="dropdownlist" DataSourceID="campDS1" 
                                DataTextField="campaign_descrar" DataValueField="campaign_code" 
                                Font-Names="Tahoma" font-size="8pt" Height="23px" 
                                meta:resourcekey="ddlcampaignResource1" style="margin-left: 0px" 
                                Width="129px">
                                <asp:ListItem meta:resourcekey="ddlcampaignResource2" 
                                    Text="Please Select Campaign" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                              </td>
               <td class="style520">
               
                   <asp:Label ID="lblinstrcutSrc" runat="server" CssClass="label" 
                       Font-Names="Tahoma" font-size="8pt" for="ddlinstrcutSrc" 
                       meta:resourcekey="lblinstrcutSrcResource1" Text="Instrcut Source"></asp:Label>
               
               </td>
               <td class="style517">
              
                   <asp:DropDownList ID="ddlinstrcutSrc" runat="server" CssClass="dropdownlist" 
                       Font-Names="Tahoma" font-size="8pt" Height="23px" 
                       meta:resourcekey="ddlinstrcutSrcResource1" style="margin-left: 0px" 
                       Width="116px" Enabled="False">
                       <asp:ListItem meta:resourcekey="ListIteminstrcutSrcResource1" 
                           Text="Select Category" Value="0"></asp:ListItem>
                       <asp:ListItem meta:resourcekey="ListIteminstrcutSrcResource2"
                           Text="Website" Value="1"></asp:ListItem>
                       <asp:ListItem meta:resourcekey="ListIteminstrcutSrcResource3" Text="Bank" 
                           Value="2"></asp:ListItem>
                       <asp:ListItem meta:resourcekey="ListIteminstrcutSrcResource4" Text="Internal" 
                            Selected="True" Value="4"></asp:ListItem>
                        <asp:ListItem meta:resourcekey="ListIteminstrcutSrcResource5" Text="Partial Payment" 
                           Value="5"></asp:ListItem>
                   </asp:DropDownList>
              
               </td>
         </tr>
     </table>
     <table class="style50">
         <tr>
                        <td class="style572">
                            <asp:Label ID="lblstartDt" Text="Start Date" Font-Names="Tahoma" 
                                font-size="8pt" ForeColor ="Red" runat="server" CssClass="label"
                                for="txtStartDt" meta:resourcekey="lblstartDtResource1" />
                            </td>
             <td class="style537">
                                <asp:TextBox ID="txtStartDt" runat="server" 
                                    CssClass="textbox" meta:resourcekey="txtStartDtResource1" Height="20px" Font-Names="Tahoma" 
                                    font-size="8pt" Width="65px" 
                                    style="margin-left: 0px; margin-bottom: 0px;" Enabled="False"></asp:TextBox>
                            </td>
              <td class="style570">
              <asp:Label ID="lblmonths" Text="Months" Font-Names="Tahoma" font-size="8pt" 
                                runat="server" CssClass="label"
                                for="txtmonthNo" meta:resourcekey="lblmonthsResource1" />
              </td>
              <td class="style571">
              <asp:TextBox ID="txtmonthNo" runat="server"  style="margin-left: 0px; margin-bottom: 0px;" 
                                    CssClass="textbox" onkeypress="return isNumberKey(event)" meta:resourcekey="txtmonthNoResource1"  Width="45px" 
                                    Height="20px" onBlur="insertByEnterKey(lbtnCalNoOfMonth);"></asp:TextBox>
                  <asp:LinkButton ID="lbtnCalNoOfMonth" runat="server" ClientIDMode="Static" 
                      CssClass="hide">LinkButton</asp:LinkButton>
              </td>
             <td class="style239">
                            <asp:Label ID="lblendDt" Text="End Date" Font-Names="Tahoma" font-size="8pt" ForeColor ="Red"
                                runat="server" CssClass="label"
                                for="txtEndDate" meta:resourcekey="lblendDtResource1" />
                            </td>
             <td class="style532" >
                                <asp:TextBox ID="txtEndDate" runat="server" 
                                   CssClass="textbox" enabled="false" meta:resourcekey="txtEndDateResource1"  
                                    Font-Names="Tahoma" style="margin-left: 0px" 
                                    font-size="8pt" Height="17px" Width="85px" ></asp:TextBox>
                            </td>
             <td class="style533">
                            <asp:Label ID="lblTotdeduct" runat="server" CssClass="label" ForeColor ="Red" 
                                for="txtTotalDeduct" Font-Names="Tahoma" font-size="8pt" meta:resourcekey="llblTotdeductResource1" 
                                Text="Total Amount" />
             </td>
             <td class="style528">
                                <asp:TextBox ID="txtTotalDeduct" runat="server" 
                                    CssClass="textbox" meta:resourcekey="txtTotalDeductResource1" 
                                    style="margin-left: 0px" onkeypress="return isNumberKey(event)"
                                    Height="18px" Width="97px" MaxLength="10"></asp:TextBox>
             </td>
             <td class="style534">
             
                 <asp:Label ID="lblinstVal" runat="server" CssClass="label" 
                     for="txtinstAmt" Font-Names="Tahoma" font-size="8pt" 
                     meta:resourcekey="lblinstValResource1" Text="Inst Amount" />
             
             </td>
             <td class="style129" style="letter-spacing: normal;">
             
                 <asp:TextBox ID="txtinstAmt" runat="server" Height="16px" 
                     CssClass="textbox"
                     Font-Names="Tahoma"
                     font-size="8pt" Width="123px" style="margin-left: 0px" 
                     EnableTheming="True" EnableViewState="False" Enabled="False" 
                     MaxLength="10"></asp:TextBox>
             
             </td>
             <td class="style540">
                 <asp:Label ID="lblBnkRefNo0" runat="server" CssClass="label" 
                     Font-Names="Tahoma" font-size="8pt" for="txtBnkRefNo" 
                     meta:resourcekey="lblBnkRefNoResource1" Text="Bank Ref No" />
             </td>
             <td class="style538">
                 <asp:TextBox ID="txtBnkRefNo" runat="server" CssClass="textbox" Height="16px" 
                     meta:resourcekey="txtBnkRefNoResource1" style="margin-left: 1px" 
                     Width="107px" MaxLength="12"></asp:TextBox>
             </td>
         </tr>
     </table>
            
     <table class="style50">
         <tr>
             <td class="style548">
                            <asp:Label ID="lblBnk" Text="Bank Name" Font-Names="Tahoma" font-size="8pt" runat="server" 
                     CssClass="label" for="lblBnk" ForeColor ="Red"
                                meta:resourcekey="lblBnkResource1" />
                            </td>
             <td class="style567">
                                <asp:DropDownList ID="ddlBnk" runat="server" CssClass="dropdownlist"
                     DataSourceID="bankSDC" DataTextField="bank_ar_name"
                                    DataValueField="bank_code" 
                                    AutoPostBack="True" EnableViewState="False"
                                     meta:resourcekey="ddlBnkResource1" Height="23px" Font-Names="Tahoma" 
                                    font-size="8pt" Width="111px" style="margin-left: 0px">
                                    <asp:ListItem Value="0" meta:resourcekey="ddlBnkResource2" 
                                        Text="Please Select Bank"></asp:ListItem>
                                </asp:DropDownList>
                              
                                </td>
             <td class="style384">

                          <asp:Label ID="lblbnkbranch" Text="Bank Branch" Font-Names="Tahoma" 
                              font-size="8pt" runat="server" 
                               CssClass="label" for="lblbnkbranch"
                            meta:resourcekey="lblBnkBranchResource1"/>
                               
                            </td>
             <td class="style308">
                               
                               <asp:DropDownList ID="ddlnewBrn" runat="server" Height="23px"
                                   Font-Names="Tahoma" font-size="8pt" Width="113px" CssClass="dropdownlist" style="margin-left: 0px"
                                   meta:resourcekey="ddlnewBrnResource1" DataSourceID="bankBranchSDC" 
                                   DataTextField="brn_namear" DataValueField="brn_code">
                               </asp:DropDownList>
                               
                                </td>
             <td class="style554">
                            <asp:Label ID="lblAccnum" runat="server" CssClass="label" Font-Names="Tahoma" 
                                font-size="8pt" for="txtAccountNum" meta:resourcekey="lblAccnumResource1" 
                                Text="Account No" />
                                                                                 
                            </td>
             <td class="style556">
                                              <asp:TextBox ID="txtAccountNum" runat="server" CssClass="textbox" 
                                    Height="18px" meta:resourcekey="txtAccountNumResource1" 
                                    style="margin-left: 0px" Width="127px" MaxLength="50"></asp:TextBox>
             </td>
             <td class="style495">
                            <asp:Label ID="lblinfavourof" runat="server" CssClass="label" 
                                Font-Names="Tahoma" font-size="8pt" for="txtfavourof" 
                                meta:resourcekey="lblinfavourofResource1" Text=" In Favour Of" />
                            </td>
             <td class="style350">
                                <asp:TextBox ID="txtfavourof" runat="server" CssClass="textbox" Height="21px" 
                                    meta:resourcekey="txtfavourofResource1" style="margin-left: 0px" 
                                    Width="295px" MaxLength="35"></asp:TextBox>
                                </td>
                                
                                
         </tr>
     </table>
            
             <table>
                <tr>
                    <td class="style328" >
        <asp:GridView ID="grvInstruction" runat="server" AutoGenerateColumns="False" 
                        ShowFooter="True" DataKeyNames="ref_numb,donation_code"
                         meta:resourcekey="grvPaymentsResource1" 
                             ShowHeaderWhenEmpty="True" BorderWidth="1px" BackColor="White" BorderColor="LightSteelBlue"
                            CellPadding="0" Font-Name="tahoma" Font-Size="10pt" ForeColor="DarkBlue" HeaderStyle-BackColor="#aaaadd"
                            GridLines="None" Width="660px" Font-Names="tahoma">
                        <Columns>
                            <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:ImageButton ID="LinkButton1" runat="server" CommandName="Update" 
                                        ImageUrl="Content/images/save.png" meta:resourceKey="UpdateResource1" 
                                        Text="Update" />
                                    &nbsp;
                                    <asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Cancel" ImageUrl="Content/images/cancel.png" 
                                        meta:resourceKey="CancelResource1" Text="Cancel" />
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:ImageButton ID="lbtnAddDist" runat="server" 
                                        ImageUrl="Content/images/add.png" meta:resourceKey="AddResource1" 
                                        OnClick="lbtnAddDistFooter_Click" />
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                        CommandName="Edit" ImageUrl="Content/images/edit.png" 
                                        meta:resourceKey="EditResource1" Text="Edit" />
                                    &nbsp;<asp:ImageButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Delete" ImageUrl="Content/images/delete.png" 
                                        meta:resourceKey="DeleteResource1" style="margin-left: 12px" Text="Delete" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Donation Name" 
                                meta:resourceKey="txtHeaderDonationArabic" SortExpression="donation_descrar">
                                <EditItemTemplate>
                                    <asp:Label ID="label1Edit" runat="server" 
                                        meta:resourcekey="label1EditResource1" Text='<%# Eval("donation_descrar") %>'></asp:Label>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddlDonationAra" runat="server" CssClass="dropdownlist" 
                                        AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="DonationTypeSDS2" 
                                        DataTextField="donation_descrar" DataValueField="donation_code" 
                                        Font-Names="Tahoma" Font-Size="8pt" meta:resourcekey="ddlDonationAraResource1" 
                                        OnSelectedIndexChanged="DropDownListFooterAr_SelectedIndexChanged" 
                                        Width="140px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="DonationTypeSDS2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                        SelectCommand="SELECT donations.donation_code, donations.donation_descrar, donations.donation_descreng, donations.donation_standard_value FROM donations INNER JOIN [donation categories] ON donations.donation_cat = [donation categories].donation_cat WHERE ([donation categories].waqf_donation = @waqf_donation)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="chkWaqf" Name="waqf_donation" 
                                                PropertyName="Checked" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" 
                                        Text='<%# Bind("donation_descrar") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="140px" />
                                <FooterStyle Width="120px" />
                                <HeaderStyle Width="120px" />
                                <ItemStyle Width="120px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Value" meta:resourceKey="txtHeadervalue" 
                                SortExpression="instruct_value">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDistValueEdit" runat="server" 
                                       CssClass="textbox" meta:resourcekey="txtDistValueEditResource1" 
                                        Text='<%# Bind("instruct_value") %>' Enabled="False"></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtDistValuefooter" runat="server" onkeypress="return isNumberKey(event)" 
                                       CssClass="textbox" meta:resourcekey="txtDistValuefooterResource1" 
                                        Enabled="False" MaxLength="10"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" 
                                        Text='<%# Bind("instruct_value", "{0:N3}") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="55px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ref_numb" meta:resourceKey="txtrefNo" 
                                SortExpression="ref_numb" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtrefnumedit" runat="server" 
                                        meta:resourcekey="txtrefnumeditResource1" Text='<%# Bind("ref_numb") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtrefnum" runat="server" 
                                       CssClass="textbox" meta:resourcekey="txtrefnumResource1"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" 
                                        Text='<%# Bind("ref_numb") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                          
                           <asp:TemplateField HeaderText="Payment" meta:resourcekey="txtpaymentResc">
                                <EditItemTemplate >
                                  <asp:TextBox ID="txtpaymentedit" runat ="server"
                                  CssClass="textbox" meta:resourcekey="txtpaymentRessoure1" 
                                        Text ='<%# Bind("totAmnt" , "{0:N3}") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate >
                                <asp:TextBox ID="txtpaymentfooter" runat="server" onkeypress="return isNumberKey(event)"
                                  CssClass="textbox" meta:resourcekey="txtpaymentfooterresource1" MaxLength="10"></asp:TextBox>
                                </FooterTemplate>
                                 
                                <ItemTemplate >
                                <asp:Label ID="lblpayment" runat="server" meta:resourcekey="lblpaymentResc1"
                                Text='<%# Bind("totAmnt" , "{0:N3}") %>'> </asp:Label>
                                                             
                                </ItemTemplate>
                           </asp:TemplateField>

                            <asp:TemplateField HeaderText="Quantity" meta:resourceKey="txtHeaderqty" 
                                SortExpression="quantity">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtquantEdit" runat="server" 
                                       CssClass="textbox" meta:resourcekey="txtquantEditResource1" 
                                        Text='<%# Bind("quantity", "{0:N2}") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtquantfooter" runat="server"  onkeypress="return isNumberKey(event)"
                                       CssClass="textbox" meta:resourcekey="txtquantfooterResource1" 
                                        MaxLength="10"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" 
                                        Text='<%# Bind("quantity", "{0:N2}") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Amount" meta:resourceKey="txtTotamount">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtTotalEdit" runat="server" Enabled="False" 
                                       CssClass="textbox" Text='<%# Bind("totAmnt" , "{0:N3}") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtTotalFooter" runat="server" Enabled="False" 
                                       CssClass="textbox" MaxLength="10"></asp:TextBox>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbltotalamt" runat="server" 
                                         Text='<%# Bind("totAmnt" , "{0:N3}") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="75px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Country" meta:resourceKey="txtHeadercountry">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_nat" runat="server" DataSourceID="Nat_EditDS" 
                                       CssClass="dropdownlist" DataTextField="nat_descrar" DataValueField="nat_code" 
                                        meta:resourcekey="ddl_natResource1">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="Nat_EditDS" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                        SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddlCountryFooter" runat="server" CssClass="dropdownlist" 
                                        AppendDataBoundItems="True" DataSourceID="CountrySqlDataSource" 
                                        DataTextField="nat_descrar" DataValueField="nat_code" Width="120px" 
                                        meta:resourcekey="ddlCountryFooterResource1">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="CountrySqlDataSource" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                        SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblCountry" runat="server" 
                                        meta:resourcekey="lblCountryResource1" Text='<%# Eval("nat_descrar") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="90px" />
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
                                    <asp:ImageButton ID="lbtnAddDist" runat="server" 
                                        OnClick="lbtnAddDist_Click" meta:resourcekey="lbtnAddDistResource1" ImageUrl="Content/images/add.png"></asp:ImageButton>
                                </td>
                                
                                <td>
                                    <asp:DropDownList ID="ddlDonationNew" runat="server" DataSourceID="DonationTypeSDS3"
                                        DataTextField="donation_descrar" DataValueField="donation_code" 
                                        OnSelectedIndexChanged="ddlDonationddlDonationNew_SelectedIndexChanged" 
                                        AutoPostBack="True" meta:resourcekey="ddlDonationNewResource1" 
                                        Width="140px">
                                        <asp:ListItem Value="0" meta:resourcekey="ListItemResource14" Text="Please Select Donation Type"></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="DonationTypeSDS3" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                                        SelectCommand="SELECT donations.donation_code, donations.donation_descrar, donations.donation_descreng, donations.donation_standard_value FROM donations INNER JOIN [donation categories] ON donations.donation_cat = [donation categories].donation_cat WHERE ([donation categories].waqf_donation = @waqf_donation)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="chkWaqf" Name="waqf_donation" 
                                                PropertyName="Checked" DefaultValue="" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                 <td>
                                 
                                    <asp:TextBox ID="txtDistValue" runat="server" onkeypress="return isNumberKey(event)"
                                         meta:resourcekey="txtDistValueResource1" Enabled="False" MaxLength="10"></asp:TextBox>
                               </td> 
                               <td>
                                <asp:TextBox ID="txtpaymentval" runat ="server" onkeypress="return isNumberKey(event)" meta:resourcekey="txtpaymentvalResrc1"></asp:TextBox>
                               </td>
                               <td>
                                   <asp:TextBox ID="txtquant" runat="server"  
                                       onkeypress="return isNumberKey(event)" 
                                       meta:resourcekey="txtquantResource1" MaxLength="10" 
                                       ></asp:TextBox>
                                  
                                </td>
                               
                               <td>
                                  <asp:TextBox ID="txtTotal" runat="server"  onkeypress="return isNumberKey(event)"
                                       meta:resourcekey="txtTotalResource1" Enabled="False" MaxLength="10"></asp:TextBox>
                                    
                                   
                                </td>
                                <td>

                                <asp:DropDownList ID="ddlcountry" runat="server" AppendDataBoundItems="True" 
                                        DataSourceID="countryDS" DataTextField="nat_descrar" 
                                        DataValueField="nat_code" AutoPostBack="True" 
                                        meta:resourcekey="ddlcountryResource1"  Width="100px">
                                     
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="countryDS" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                        SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
                               
                                </td>
                               
                              
                            </tr>
                        </EmptyDataTemplate>
                        
                    </asp:GridView>

                    </td>
                    </tr> 
                    </table>
       
        <table>
         <tr>
           
             <td class="style92">
               
                 <table class="style80">
                     <tr>
                         <td class="style557">
                             <asp:Label ID="lblNotes" runat="server" CssClass="label" for="txtNotes" 
                                 meta:resourcekey="lblNotesResource1" Text="Notes" />
                         </td>
                         <td class="style94">
                             <asp:TextBox ID="txtNotes" runat="server" Height="28px" 
                                 CssClass="textbox" meta:resourcekey="txtNotesResource1" 
                                 TextMode="MultiLine" Width="650px" MaxLength="250"  onkeypress="return textboxMultilineMaxNumber(this,250);"> ></asp:TextBox>
                         </td>
                         
                     </tr>
                 </table>
               
                
                     <tr>
                         <td class="style171">
                             
                         
                             <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                 SelectCommand="SearchArName" SelectCommandType="StoredProcedure">
                                 <SelectParameters>
                                     <asp:ControlParameter ControlID="txtSearch" Name="ArName" PropertyName="Text" 
                                         Type="String" />
                                 </SelectParameters>
                             </asp:SqlDataSource>
                         </td>
                         <td>

                             <asp:SqlDataSource ID="DOn_TpDS" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                 SelectCommand="SELECT * FROM [donation categories]"></asp:SqlDataSource>

                         </td>
                         <td>

                             <asp:SqlDataSource ID="campDS1" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                 SelectCommand="SELECT * FROM [campaign_tab]"></asp:SqlDataSource>

                         <td>

                          <asp:SqlDataSource ID="InstDetailsSqlDataSource" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                 DeleteCommand="DELETE FROM instruction_dist WHERE (ref_numb = @ref_numb) AND (donation_code = @donation_code)" 
                                 SelectCommand="SELECT instruction_dist.instruct_value, donations.donation_descrar, donations.donation_descreng, instruction_dist.ref_numb, instruction_dist.donation_code, instruction_dist.quantity, instruction_dist.nat_code, nat_tab.nat_descrar FROM donations INNER JOIN instruction_dist ON donations.donation_code = instruction_dist.donation_code LEFT OUTER JOIN nat_tab ON instruction_dist.nat_code = nat_tab.nat_code WHERE (instruction_dist.ref_numb = @ref_numb)" 
                                 UpdateCommand="UPDATE instruction_dist SET instruct_value = @instruct_value WHERE (ref_numb = @ref_numb) AND (donation_code = @donation_code)">
                                 <DeleteParameters>
                                     <asp:Parameter Name="ref_numb" />
                                     <asp:Parameter Name="donation_code" />
                                 </DeleteParameters>
                                 <SelectParameters>
                                     <asp:ControlParameter ControlID="txtReceiptID" DefaultValue="0" Name="ref_numb" 
                                         PropertyName="Text" />
                                 </SelectParameters>
                                 <UpdateParameters>
                                     <asp:Parameter DefaultValue="" Name="instruct_value" />
                                     <asp:ControlParameter ControlID="txtReceiptDate" Name="ref_numb" 
                                         PropertyName="Text" />
                                     <asp:ControlParameter ControlID="grvPayments" Name="donation_code" 
                                         PropertyName="SelectedValue" />
                                 </UpdateParameters>
                             </asp:SqlDataSource>   

                         </td>
                         </td>
                         <td class="style177">
                           
                             <asp:SqlDataSource ID="CurDS1" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                 SelectCommand="SELECT * FROM [currency_tab]"> </asp:SqlDataSource>
                         </td>
                         <td class="style101">
                             <asp:SqlDataSource ID="statReasonDs" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                 SelectCommand="SELECT * FROM [stat_reason_tab]"></asp:SqlDataSource>
                         </td>
                         <td class="style178">

                           
                             <asp:SqlDataSource ID="bankSDC" runat="server" 
                                 ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                 SelectCommand="SELECT * FROM [banks_list]"></asp:SqlDataSource>
                         </td>
                     </tr>
                 </table>
               
             </td>
           
         </tr>
     </table>
      </asp:Panel>
              &nbsp;       
               </ContentTemplate>
                             </asp:UpdatePanel>
    </form>
     
</body>
</html>
