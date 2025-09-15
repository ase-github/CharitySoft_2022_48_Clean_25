<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="search_screen_benf.aspx.vb" Inherits="DirectAid.search_screen_benf" %>

<%@ Register assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">

        	function go_back()
            {
                opener.Search_Names();
		        close();
		    }

		    function search_names() {

		        var i;
		        var j;
		        var k;
		        i = (event.keyCode);
		        if (i == 13) {

		            j = document.getElementById("A1");
		            j.click();

		        } //13
		    }
	</SCRIPT>

    <style type="text/css">

            .style4
            {
                width: 405px;
            }
            
            .style4
            {
                width: 405px;
            }
            .style2
            {
                width: 328px;
            }
            </style>

</head>
<body dir = rtl>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <table style="width:62%; font-size: xx-small; font-family: Tahoma;">
        <tr>
            <td class="style3" colspan="2">
                <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" 
                    DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="Small" 
                    ForeColor="#284E98" meta:resourcekey="Menu1Resource1" Orientation="Horizontal" 
                    StaticSubMenuIndent="10px" Width="200px">
                    <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
                    <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <DynamicMenuStyle BackColor="#B5C7DE" />
                    <DynamicSelectedStyle BackColor="#507CD1" />
                    <Items>
                        <asp:MenuItem meta:resourcekey="MenuItemResource1" Text="New" Value="New">
                        </asp:MenuItem>
                        <asp:MenuItem meta:resourcekey="MenuItemResource2" Text="|" Value="|">
                        </asp:MenuItem>
                        <asp:MenuItem meta:resourcekey="MenuItemResource3" Text="Search" Value="Search">
                        </asp:MenuItem>
                    </Items>
                    <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
                    <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                    <StaticSelectedStyle BackColor="#507CD1" />
                </asp:Menu>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
                <asp:LinkButton ID="backBut" runat="server" Font-Size="Medium" 
                    meta:resourcekey="backButResource1">Back</asp:LinkButton>
            </td>
            <td class="style2">
                <asp:TextBox ID="txt_search_lang" runat="server" BorderStyle="Solid" 
                    BorderWidth="1px" meta:resourcekey="txt_eng_fam_nameResource1" Width="181px"></asp:TextBox>
            </td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td align="left">
                <asp:LinkButton ID="A1" runat="server" ClientIDMode="Static" 
                    ForeColor="#F1F7FC" meta:resourcekey="A2Resource1" Text="A1"></asp:LinkButton>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label15" runat="server" Font-Size="X-Small" 
                    meta:resourcekey="Label15Resource1" Text="English Name" Width="120px"></asp:Label>
            </td>
            <td align="right">
                                        <asp:TextBox ID="txt_applicant_name_en_1" 
                    runat="server" BorderColor="#336699" 
                                            BorderStyle="Solid" BorderWidth="1px" 
                    Font-Names="Tahoma" Font-Size="10pt" 
                                            ForeColor="#003366" Height="23px" Width="69px"></asp:TextBox>
            </td>
            <td class="style4">
                                        <asp:TextBox ID="txt_applicant_name_en_2" 
                    runat="server" BorderColor="#336699" 
                                            BorderStyle="Solid" BorderWidth="1px" 
                    Font-Names="Tahoma" Font-Size="10pt" 
                                            ForeColor="#003366" Height="23px" Width="69px"></asp:TextBox>
                                        </td>
            <td class="style2">
                                        <asp:TextBox ID="txt_applicant_name_en_3" 
                    runat="server" BorderColor="#336699" 
                                            BorderStyle="Solid" BorderWidth="1px" 
                    Font-Names="Tahoma" Font-Size="10pt" 
                                            ForeColor="#003366" Height="23px" Width="69px"></asp:TextBox>
                                        </td>
            <td class="style2">
                                        <asp:TextBox ID="txt_applicant_name_en_4" 
                    runat="server" BorderColor="#336699" 
                                            BorderStyle="Solid" BorderWidth="1px" 
                    Font-Names="Tahoma" Font-Size="10pt" 
                                            ForeColor="#003366" Height="23px" Width="69px"></asp:TextBox>
                                        </td>
            <td class="style2">
                                        <asp:TextBox ID="txt_applicant_name_en_5" 
                    runat="server" BorderColor="#336699" 
                                            BorderStyle="Solid" BorderWidth="1px" 
                    Font-Names="Tahoma" Font-Size="10pt" 
                                            ForeColor="#003366" Height="23px" Width="69px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label16" runat="server" Font-Size="X-Small" 
                    meta:resourcekey="Label16Resource1" Text="Arabic Name" Width="120px"></asp:Label>
            </td>
            <td align="right">
                                        <asp:TextBox ID="txt_applicant_name_ar_1" 
                    runat="server" BorderColor="#336699" 
                                            BorderStyle="Solid" BorderWidth="1px" 
                    Font-Names="Tahoma" Font-Size="10pt" 
                                            Height="23px" Width="69px" ForeColor="#003366"></asp:TextBox>
            </td>
            <td class="style4">
                                        <asp:TextBox ID="txt_applicant_name_ar_2" 
                    runat="server" BorderColor="#336699" 
                                            BorderStyle="Solid" BorderWidth="1px" 
                    Font-Names="Tahoma" Font-Size="10pt" 
                                            Height="23px" Width="69px" ForeColor="#003366"></asp:TextBox>
                                        </td>
            <td class="style2">
                                        <asp:TextBox ID="txt_applicant_name_ar_3" 
                    runat="server" BorderColor="#336699" 
                                            BorderStyle="Solid" BorderWidth="1px" 
                    Font-Names="Tahoma" Font-Size="10pt" 
                                            Height="23px" Width="69px" ForeColor="#003366"></asp:TextBox>
                                        </td>
            <td class="style2">
                                        <asp:TextBox ID="txt_applicant_name_ar_4" 
                    runat="server" BorderColor="#336699" 
                                            BorderStyle="Solid" BorderWidth="1px" 
                    Font-Names="Tahoma" Font-Size="10pt" 
                                            Height="23px" Width="69px" ForeColor="#003366"></asp:TextBox>
                                        </td>
            <td class="style2">
                                        <asp:TextBox ID="txt_applicant_name_ar_5" 
                    runat="server" BorderColor="#336699" 
                                            BorderStyle="Solid" BorderWidth="1px" 
                    Font-Names="Tahoma" Font-Size="10pt" 
                                            Height="23px" Width="69px" ForeColor="#003366"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3" colspan="6">
                <asp:GridView ID="grd_search" runat="server" AllowPaging="True" 
                    AllowSorting="True" autogeneratecolumns="False" autogenerateselectbutton="True" 
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" Font-Size="X-Small" meta:resourcekey="grd_assess_histResource1" 
                    PageSize="12" Width="635px">
                    <Columns>
                        <asp:TemplateField HeaderText="app_ser" 
                           >
                            <ItemTemplate>
                                <asp:Label ID="lbl_app_ser" runat="server" 
                                   text='<%# databinder.eval(container.dataitem,"app_ser") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="250" HeaderText="benf_name_ar" >
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" 
                                    text='<%# databinder.eval(container.dataitem,"benf_name_ar") %>' Width="270px"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="250px" />
                            <ItemStyle Width="120px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-Width="250" HeaderText="benf_name_eng" 
                            meta:resourcekey="TemplateFieldResource5">
                            <ItemTemplate>
                                <asp:Label ID="Label57" runat="server" 
                                    text='<%# databinder.eval(container.dataitem,"benf_name_eng") %>' Width="270px"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="250px" />
                            <ItemStyle Width="120px" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="False" Font-Size="X-Small" 
                        ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle Font-Size="X-Small" ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#FFCCFF" Font-Bold="True" ForeColor="#993366" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
