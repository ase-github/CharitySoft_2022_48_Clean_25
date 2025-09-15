<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DonorBeneficiaries.aspx.vb"
    Inherits="DirectAid.DonorBeneficiaries" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" dir="rtl">
            <tr>
                <td align="center" style="width: 100%">
                    <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyNames="app_ser" DataSourceID="SqlDataSource_donor_orph" ShowFooter="True" meta:resourcekey="GridView1Resource1" BackColor="#CCCCCC" BorderColor="#999999" CellPadding="4"
                        Font-Name="tahoma" Font-Size="Medium" ForeColor="#0000CC"  Width="100%" Font-Names="tahoma" Caption="الايتام" CellSpacing="1" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Strikeout="False">
                        <Columns>
                            <asp:BoundField DataField="app_ser" HeaderText="الرقم" SortExpression="app_ser" ReadOnly="True" />
                            <asp:BoundField DataField="applicant_name_ar_1" HeaderText="الاسم" SortExpression="applicant_name_ar_1"></asp:BoundField>
                            <asp:BoundField DataField="nat_descrar" HeaderText="الجنسيه" SortExpression="nat_descrar" />
                            <asp:BoundField DataField="status_date" HeaderText="تاريخ القبول" SortExpression="status_date" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="src_fund" HeaderText="مصدر التمويل" SortExpression="src_fund" />
                            <asp:BoundField DataField="src_num" HeaderText="رقم الايصال" SortExpression="src_num" />
                            <asp:BoundField DataField="donor_id" HeaderText="المتبرع" SortExpression="donor_id" Visible="False" />
                        </Columns>
                        <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue"
                            Height="35px" HorizontalAlign="Center" Font-Bold="True" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="White" Font-Bold="False" Font-Names="Tahoma" Font-Size="Small" ForeColor="Black"></RowStyle>
                        <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue"
                            Height="35px" HorizontalAlign="Center" />
                        <FooterStyle HorizontalAlign="Center" BackColor="#CCCCCC"></FooterStyle>
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="Gray" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource_donor_orph" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        SelectCommand="SELECT * FROM [donor_orph] WHERE ([donor_id] = @DonorID)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="0" Name="DonorID" QueryStringField="DonorID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyNames="app_ser" DataSourceID="SqlDataSource_donor_stud" ShowFooter="True" meta:resourcekey="GridView1Resource1" BackColor="#CCCCCC" BorderColor="#999999" CellPadding="4"
                        Font-Name="tahoma" Font-Size="Medium" ForeColor="#009933"  Width="100%" Font-Names="tahoma" Caption="الطلاب" CellSpacing="1" Font-Bold="True">
                        <Columns>
                            <asp:BoundField DataField="app_ser" HeaderText="الرقم" SortExpression="app_ser" ReadOnly="True" />
                            <asp:BoundField DataField="applicant_name_ar_1" HeaderText="الاسم" SortExpression="applicant_name_ar_1"></asp:BoundField>
                            <asp:BoundField DataField="nat_descrar" HeaderText="الجنسيه" SortExpression="nat_descrar" />
                            <asp:BoundField DataField="status_date" HeaderText="تاريخ القبول" SortExpression="status_date" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="src_fund" HeaderText="مصدر التمويل" SortExpression="src_fund" />
                            <asp:BoundField DataField="src_num" HeaderText="رقم الايصال" SortExpression="src_num" />
                            <asp:BoundField DataField="donor_id" HeaderText="المتبرع" SortExpression="donor_id" Visible="False" />
                        </Columns>
                        <HeaderStyle BackColor="Black" Font-Names="Tahoma" Font-Size="10pt" ForeColor="White"
                            Height="25px" HorizontalAlign="Center" Font-Bold="True" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="White" Font-Bold="False" Font-Names="Tahoma" Font-Size="Small" ForeColor="Black"></RowStyle>
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                        <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue"
                            Height="35px" HorizontalAlign="Center" />
                        <FooterStyle HorizontalAlign="Center" BackColor="#CCCCCC"></FooterStyle>
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource_donor_stud" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        SelectCommand="SELECT * FROM [donor_stud] WHERE ([donor_id] = @DonorID)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="0" Name="DonorID" QueryStringField="DonorID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView3" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyNames="app_ser" DataSourceID="SqlDataSource_donor_dayaa" ShowFooter="True" meta:resourcekey="GridView1Resource1" BackColor="#CCCCCC" BorderColor="#999999" CellPadding="4"
                        Font-Name="tahoma" Font-Size="Small" ForeColor="#FF3300"  Width="100%" Font-Names="tahoma" Caption="الدعاه" CellSpacing="1" Font-Bold="True">
                        <Columns>
                            <asp:BoundField DataField="app_ser" HeaderText="الرقم" SortExpression="app_ser" ReadOnly="True" />
                            <asp:BoundField DataField="applicant_name_ar_1" HeaderText="الاسم" SortExpression="applicant_name_ar_1"></asp:BoundField>
                            <asp:BoundField DataField="nat_descrar" HeaderText="الدولة" SortExpression="nat_descrar" />
                            <asp:BoundField DataField="allocation_date" HeaderText="تاريخ التخصيص" SortExpression="allocation_date" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="src_fund" HeaderText="مصدر التمويل" SortExpression="src_fund" />
                            <asp:BoundField DataField="src_num" HeaderText="رقم الايصال" SortExpression="src_num" />
                            <asp:BoundField DataField="stud_qual_name_ar" HeaderText="المؤهل الدراسي" SortExpression="stud_qual_name_ar" />
                            <asp:BoundField DataField="donor_id" HeaderText="المتبرع" SortExpression="donor_id" Visible="False" />
                        </Columns>
                        <HeaderStyle BackColor="Black" Font-Names="Tahoma" Font-Size="10pt" ForeColor="White"
                            Height="25px" HorizontalAlign="Center" Font-Bold="True" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="White" Font-Bold="False" Font-Names="Tahoma" Font-Size="Small" ForeColor="Black"></RowStyle>
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                        <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue"
                            Height="35px" HorizontalAlign="Center" />
                        <FooterStyle HorizontalAlign="Center" BackColor="#CCCCCC"></FooterStyle>
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource_donor_dayaa" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        SelectCommand="SELECT * FROM [donor_dayaa] WHERE ([donor_id] = @DonorID)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="0" Name="DonorID" QueryStringField="DonorID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:GridView ID="GridView4" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        DataKeyNames="project_id" DataSourceID="SqlDataSource_view_donor_project_list" ShowFooter="True" meta:resourcekey="GridView1Resource1" BackColor="#CCCCCC" BorderColor="#999999" CellPadding="4"
                        Font-Name="tahoma" Font-Size="Small" ForeColor="#CC0000"  Width="100%" Font-Names="tahoma" Caption="المشاريع" CellSpacing="1" Font-Bold="True">
                        <Columns>
                            <asp:BoundField DataField="project_id" HeaderText="الرقم" SortExpression="project_id" ReadOnly="True" />
                            <asp:BoundField DataField="project_name_ar" HeaderText="الاسم" SortExpression="project_name_ar" />
                            <asp:BoundField DataField="nat_descrar" HeaderText="الدولة" SortExpression="nat_descrar" />
                            <asp:BoundField DataField="approve_date" HeaderText="تاريخ الاعتماد" SortExpression="approve_date" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="donation_descrar" HeaderText="التبرع" SortExpression="donation_descrar" />
                            <asp:BoundField DataField="donor_id" HeaderText="المتبرع" SortExpression="donor_id" Visible="False" />
                        </Columns>
                        <HeaderStyle BackColor="Black" Font-Names="Tahoma" Font-Size="10pt" ForeColor="White"
                            Height="25px" HorizontalAlign="Center" Font-Bold="True" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="White" Font-Bold="False" Font-Names="Tahoma" Font-Size="Small" ForeColor="Black"></RowStyle>
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
                        <HeaderStyle BackColor="SteelBlue" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue"
                            Height="35px" HorizontalAlign="Center" />
                        <FooterStyle HorizontalAlign="Center" BackColor="#CCCCCC"></FooterStyle>
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource_view_donor_project_list" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
                        SelectCommand="SELECT * FROM view_donor_project_list WHERE ([donor_id] = @DonorID)">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="0" Name="DonorID" QueryStringField="DonorID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>

    </form>
</body>
</html>
