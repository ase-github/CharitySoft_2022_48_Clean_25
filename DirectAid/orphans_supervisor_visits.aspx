<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="orphans_supervisor_visits.aspx.vb" Inherits="DirectAid.orphans_supervisor_visits" %>

<%@ Register assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

        <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
    <script type="text/javascript">







        function pageLoad() {
            //Date picker for the Date

            $("#txt_visit_date").datepicker({
                dateFormat: 'dd/mm/yy'
            });


            //  $("#txt_nominated_site_join_date").datepicker({
            //      dateFormat: 'dd/mm/yy'
            //  });



        }

        function Search() {

            var key = event.keyCode;
            var i = document.getElementById("lnk_search_rtn");

            if (key == 13) {
                i.click();

            }

        }



      


	</script>



    <style type="text/css">

    .style41
    {
        height: 22px;
    }
        .style61
        {
            height: 22px;
        }
        
a:link, a:visited
{
    color: #034af3;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                        <table bgcolor="#F1F7FC" cellspacing="1" dir="rtl" 
                            style="width: 97%; height: 163px; margin-right: 74px;">
                            <tr>
                                <td class="style41" colspan="6">
                    <a ID="lnk_new" runat="server" 
                        >
                         <img alt="" border="0" src="images/new.jpg" style="height: 22px"  />
                        </a>
                           
                    <a ID="lnk_search" runat="server"
                        >
                        <img alt="" border="0" src="images/search.jpg" style="height: 22px"  />
                        </a>
                           
                    <a ID="lnk_save" runat="server" 
                       >
                        <img alt="" border="0" src="images/save.jpg" style="width: 67px" />
                        </a>
                           
                    <a  ID="lnk_Delete" runat="server" 
                       >
                        <img alt="" border="0" src="images/delete.jpg" />
                        </a>
                           
               
                      
                    <asp:Literal ID="Literal1" runat="server" Visible="False"></asp:Literal>


                      <a ID="lnk_search_rtn" runat="server" visible="True"></a>      
                      <a ID="lnk_Get_Fayher_name" runat="server" visible="True"></a>      

                                                </td>
                            </tr>
                            <tr>
                                <td class="style41">
                                                    &nbsp;</td>
                                <td class="style41">
                                                    &nbsp;</td>
                                <td class="style41">
                                                    &nbsp;</td>
                                <td class="style61">
                                                    &nbsp;</td>
                                <td class="style41">
                                                    &nbsp;</td>
                                <td class="style41">
                                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style41">
                                                    <asp:Label ID="lbl_visit_no" runat="server" Font-Names="Tahoma" Font-Size="8pt" 
                                                        Height="16px" Text="رقم الزيارة" Width="71px"></asp:Label>
                                                </td>
                                <td class="style41">
                                                    <asp:TextBox ID="txt_visit_no" runat="server" BorderColor="#CEE6FF" 
                                                        BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" 
                                                        Height="21px" Width="90px" BackColor="#FFFFCC"></asp:TextBox>
                                                </td>
                                <td class="style41">
                                                    <asp:Label ID="Label265" runat="server" Font-Names="Tahoma" Font-Size="8pt" 
                                                        Text="اسم المشرف" Width="80px"></asp:Label>
                                                </td>
                                <td class="style61">
                                                    <asp:DropDownList ID="ddl_supervisior_name" runat="server" Height="23px" 
                                                        Width="213px" Font-Names="Tahoma" Font-Size="8pt" AutoPostBack="True">
                                                    </asp:DropDownList>
                                                </td>
                                <td class="style41">
                                                    <asp:Label ID="Label277" runat="server" Font-Names="Tahoma" Font-Size="8pt" 
                                                        Text="تاريخ الزيارة" Width="54px"></asp:Label>
                                                </td>
                                <td class="style41">
                                                    <asp:TextBox ID="txt_visit_date" runat="server" BorderColor="#CEE6FF" 
                                                        BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" 
                                                        Height="21px" Width="90px"></asp:TextBox>
                                                </td>
                            </tr>
                            <tr>
                                <td class="style41">
                                                    <asp:Label ID="Label267" runat="server" Font-Names="Tahoma" Font-Size="8pt" 
                                                        Text="عدد الزيارات"></asp:Label>
                                                </td>
                                <td class="style41">
                                                    <asp:TextBox ID="txt_school_reg_date4" runat="server" BorderColor="#CEE6FF" 
                                                        BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" 
                                                        Height="21px" Width="90px"></asp:TextBox>
                                                </td>
                                <td class="style41">
                                                    <asp:Label ID="Label278" runat="server" Font-Names="Tahoma" Font-Size="8pt" 
                                                        Text="ملاحظات الزيارة"></asp:Label>
                                                </td>
                                <td class="style61" colspan="3">
                                                    <asp:TextBox ID="txt_visit_notes" runat="server" BorderColor="#CEE6FF" 
                                                        BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" 
                                                        Height="21px" Width="398px"></asp:TextBox>
                                                </td>
                            </tr>
                            <tr>
                                <td class="style41" colspan="6">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style41" colspan="6">
                                                    <asp:Label ID="Label279" runat="server" Font-Names="Tahoma" Font-Size="8pt" 
                                                        Height="22px" Text="الزيارات السابقة" Width="235px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style24" colspan="6">
                                                    <dx:ASPxGridView ID="grd_visits" runat="server" Theme="Aqua">
                                                    </dx:ASPxGridView>
                                                    <asp:SqlDataSource ID="dts_supervisior_visits" runat="server">
                                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
    
    </div>
    </form>
</body>
</html>
