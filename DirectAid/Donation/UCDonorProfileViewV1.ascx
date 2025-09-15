<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCDonorProfileViewV1.ascx.vb"
    Inherits="DirectAid.UCDonorProfileViewV1" %>



<%@ Register Namespace="DevExpress.XtraCharts.Web" TagPrefix="Web" %>
<%@ Register Assembly="DevExpress.XtraCharts.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.XtraCharts.v25.1.Web, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Src="~/Donation/UCDonorHeaderV1.ascx" TagName="UCDonorHeaderV1" TagPrefix="uc1" %>



<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<script type="text/javascript">

</script>

<table width="100%" align="center">
    <tr>
        <td align="center" style="width: 100%">
            <uc1:UCDonorHeaderV1 ID="UCDonorHeaderV11" runat="server" />

        </td>
    </tr>
    <tr>
        <td align="center" style="width: 100%">&nbsp;</td>
    </tr>
    <tr>
        <td align="center" style="width: 100%">
            <dx:ASPxRoundPanel ID="ASPxRoundPanel_Beneficiaries" runat="server"
                Width="100%" meta:resourcekey="ASPxRoundPanel_Content" RightToLeft="True" Font-Bold="True" HeaderText="ربط التبرعات">
                <HeaderStyle HorizontalAlign="Center" />
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True" meta:resourcekey="PanelContentResource2">
                        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="ASPxPageControl1" EnableClientSideAPI="True" Font-Bold="True" RenderMode="Lightweight" RightToLeft="True" Width="100%">
                            <TabPages>
                                <dx:TabPage Text="الايتام الحاليين">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <asp:GridView ID="GridView_donor_currrent_orphans" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" Caption="الايتام الحاليين" CellPadding="4" CellSpacing="1" DataKeyNames="app_ser" DataSourceID="SqlDataSource_view_donor_currrent_orphans" Font-Bold="True" Font-Italic="False" Font-Names="tahoma" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" ForeColor="#0000CC" meta:resourceKey="GridView1Resource1" ShowFooter="True" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="الرقم" SortExpression="app_ser">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink_project_id" runat="server" NavigateUrl='<%# String.Format("../UIBeneficiaryProfileView.aspx?app_ser={0}&DonorID={1}", Eval("app_ser"), Request.QueryString("DonorID"))%>'
                                                                Text='<%# Bind("app_ser")%>' Target="_blank"></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="applicant_name_ar_1" HeaderText="الاسم" SortExpression="applicant_name_ar_1" />
                                                    <asp:BoundField DataField="nat_descrar" HeaderText="الجنسيه" SortExpression="nat_descrar" />
                                                    <asp:BoundField DataField="allocation_date" DataFormatString="{0:yyyy-MM-dd}" HeaderText="تاريخ القبول" SortExpression="allocation_date" />
                                                    <asp:BoundField DataField="funding_source_namear" HeaderText="مصدر التمويل" SortExpression="funding_source_namear" />
                                                    <asp:BoundField DataField="src_num" HeaderText="رقم الايصال" SortExpression="src_num" />
                                                    <asp:BoundField DataField="donor_id" HeaderText="المتبرع" SortExpression="donor_id" Visible="False" />
                                                </Columns>
                                                <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="SteelBlue" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue" Height="35px" HorizontalAlign="Center" />
                                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                                <RowStyle BackColor="White" Font-Bold="False" Font-Names="Tahoma" Font-Size="Small" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="Gray" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#383838" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource_view_donor_currrent_orphans" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [view_donor_current_beneficiaries] WHERE ([donor_id] = @DonorID) AND ([app_type] = 0)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="DonorID" QueryStringField="DonorID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="الايتام السابقين">
                                    <ContentCollection>
                                        <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                                            <asp:GridView ID="GridView_donor_previous_orphans" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" Caption="الايتام السابقين" CellPadding="4" CellSpacing="1" DataKeyNames="app_ser" DataSourceID="SqlDataSource_view_donor_previous_orphans" Font-Bold="True" Font-Italic="False" Font-Names="tahoma" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" ForeColor="#0000CC" meta:resourceKey="GridView1Resource1" ShowFooter="True" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="الرقم" SortExpression="app_ser">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink_project_id" runat="server" NavigateUrl='<%# String.Format("../UIBeneficiaryProfileView.aspx?app_ser={0}&DonorID={1}", Eval("app_ser"), Request.QueryString("DonorID"))%>'
                                                                Text='<%# Bind("app_ser")%>' Target="_blank"></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="applicant_name_ar_1" HeaderText="الاسم" SortExpression="applicant_name_ar_1" />
                                                    <asp:BoundField DataField="nat_descrar" HeaderText="الجنسيه" SortExpression="nat_descrar" />
                                                    <asp:BoundField DataField="allocate_descr_ar" HeaderText="الاجراء" SortExpression="allocate_descr_ar" />
                                                    <asp:BoundField DataField="tran_date" DataFormatString="{0:yyyy-MM-dd}" HeaderText="تاريخ الاجراء" SortExpression="tran_date" />
                                                    <asp:BoundField DataField="reason_ar" HeaderText="سبب الاجراء" SortExpression="reason_ar" />
                                                    <asp:BoundField DataField="funding_source_namear" HeaderText="مصدر التمويل" SortExpression="funding_source_namear" />
                                                    <asp:BoundField DataField="src_num" HeaderText="رقم الايصال" SortExpression="src_num" />
                                                    <asp:BoundField DataField="donor_id" HeaderText="المتبرع" SortExpression="donor_id" Visible="False" />
                                                </Columns>
                                                <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="SteelBlue" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue" Height="35px" HorizontalAlign="Center" />
                                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                                <RowStyle BackColor="White" Font-Bold="False" Font-Names="Tahoma" Font-Size="Small" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="Gray" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#383838" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource_view_donor_previous_orphans" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [view_donor_previous_beneficiaries] WHERE ([donor_id] = @DonorID) AND ([app_type] = 0)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="DonorID" QueryStringField="DonorID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="الطلبه الحاليين">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <asp:GridView ID="GridView_donor_currrent_sudents" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" Caption="الطلبه الحاليين" CellPadding="4" CellSpacing="1" DataKeyNames="app_ser" DataSourceID="SqlDataSource_view_donor_currrent_sudents" Font-Bold="True" Font-Names="tahoma" Font-Size="Medium" ForeColor="#009933" meta:resourceKey="GridView1Resource1" ShowFooter="True" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="الرقم" SortExpression="app_ser">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink_project_id" runat="server" NavigateUrl='<%# String.Format("../UIBeneficiaryProfileView.aspx?app_ser={0}&DonorID={1}", Eval("app_ser"), Request.QueryString("DonorID"))%>'
                                                                Text='<%# Bind("app_ser")%>' Target="_blank"></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="applicant_name_ar_1" HeaderText="الاسم" SortExpression="applicant_name_ar_1" />
                                                    <asp:BoundField DataField="nat_descrar" HeaderText="الجنسيه" SortExpression="nat_descrar" />
                                                    <asp:BoundField DataField="allocation_date" DataFormatString="{0:yyyy-MM-dd}" HeaderText="تاريخ القبول" SortExpression="allocation_date" />
                                                    <asp:BoundField DataField="funding_source_namear" HeaderText="مصدر التمويل" SortExpression="funding_source_namear" />
                                                    <asp:BoundField DataField="src_num" HeaderText="رقم الايصال" SortExpression="src_num" />
                                                    <asp:BoundField DataField="donor_id" HeaderText="المتبرع" SortExpression="donor_id" Visible="False" />
                                                </Columns>
                                                <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="SteelBlue" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue" Height="35px" HorizontalAlign="Center" />
                                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                                <RowStyle BackColor="White" Font-Bold="False" Font-Names="Tahoma" Font-Size="Small" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="Gray" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#383838" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource_view_donor_currrent_sudents" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [view_donor_current_beneficiaries] WHERE ([donor_id] = @DonorID) AND ([app_type] = 1)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="DonorID" QueryStringField="DonorID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="الطلبه السابقين">
                                    <ContentCollection>
                                        <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                                            <asp:GridView ID="GridView_donor_previous_sudents" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" Caption="الطلبه السابقين" CellPadding="4" CellSpacing="1" DataKeyNames="app_ser" DataSourceID="SqlDataSource_view_donor_previous_sudents" Font-Bold="True" Font-Names="tahoma" Font-Size="Medium" ForeColor="#009933" meta:resourceKey="GridView1Resource1" ShowFooter="True" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="الرقم" SortExpression="app_ser">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink_project_id" runat="server" NavigateUrl='<%# String.Format("../UIBeneficiaryProfileView.aspx?app_ser={0}&DonorID={1}", Eval("app_ser"), Request.QueryString("DonorID"))%>'
                                                                Text='<%# Bind("app_ser")%>' Target="_blank"></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="applicant_name_ar_1" HeaderText="الاسم" SortExpression="applicant_name_ar_1" />
                                                    <asp:BoundField DataField="nat_descrar" HeaderText="الجنسيه" SortExpression="nat_descrar" />
                                                    <asp:BoundField DataField="allocate_descr_ar" HeaderText="الاجراء" SortExpression="allocate_descr_ar" />
                                                    <asp:BoundField DataField="tran_date" DataFormatString="{0:yyyy-MM-dd}" HeaderText="تاريخ الاجراء" SortExpression="tran_date" />
                                                    <asp:BoundField DataField="reason_ar" HeaderText="سبب الاجراء" SortExpression="reason_ar" />
                                                    <asp:BoundField DataField="funding_source_namear" HeaderText="مصدر التمويل" SortExpression="funding_source_namear" />
                                                    <asp:BoundField DataField="src_num" HeaderText="رقم الايصال" SortExpression="src_num" />
                                                    <asp:BoundField DataField="donor_id" HeaderText="المتبرع" SortExpression="donor_id" Visible="False" />
                                                </Columns>
                                                <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="SteelBlue" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue" Height="35px" HorizontalAlign="Center" />
                                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                                <RowStyle BackColor="White" Font-Bold="False" Font-Names="Tahoma" Font-Size="Small" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="Gray" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#383838" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource_view_donor_previous_sudents" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [view_donor_previous_beneficiaries] WHERE ([donor_id] = @DonorID) AND ([app_type] = 1)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="DonorID" QueryStringField="DonorID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="الدعاه الحاليين">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <asp:GridView ID="GridView_donor_currrent_daaya" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" Caption="الدعاه الحاليين" CellPadding="4" CellSpacing="1" DataKeyNames="app_ser" DataSourceID="SqlDataSource_view_donor_currrent_daaya" Font-Bold="True" Font-Names="tahoma" Font-Size="Small" ForeColor="#FF3300" meta:resourceKey="GridView1Resource1" ShowFooter="True" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="الرقم" SortExpression="app_ser">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink_project_id" runat="server" NavigateUrl='<%# String.Format("../UIBeneficiaryProfileView.aspx?app_ser={0}&DonorID={1}", Eval("app_ser"), Request.QueryString("DonorID"))%>'
                                                                Text='<%# Bind("app_ser")%>' Target="_blank"></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="applicant_name_ar_1" HeaderText="الاسم" SortExpression="applicant_name_ar_1" />
                                                    <asp:BoundField DataField="nat_descrar" HeaderText="الدولة" SortExpression="nat_descrar" />
                                                    <asp:BoundField DataField="allocation_date" DataFormatString="{0:yyyy-MM-dd}" HeaderText="تاريخ التخصيص" SortExpression="allocation_date" />
                                                    <asp:BoundField DataField="funding_source_namear" HeaderText="مصدر التمويل" SortExpression="funding_source_namear" />
                                                    <asp:BoundField DataField="src_num" HeaderText="رقم الايصال" SortExpression="src_num" />
                                                    <asp:BoundField DataField="stud_qual_name_ar" HeaderText="المؤهل الدراسي" SortExpression="stud_qual_name_ar" />
                                                    <asp:BoundField DataField="donor_id" HeaderText="المتبرع" SortExpression="donor_id" Visible="False" />
                                                </Columns>
                                                <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="SteelBlue" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue" Height="35px" HorizontalAlign="Center" />
                                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                                <RowStyle BackColor="White" Font-Bold="False" Font-Names="Tahoma" Font-Size="Small" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="Gray" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#383838" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource_view_donor_currrent_daaya" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [view_donor_current_beneficiaries] WHERE ([donor_id] = @DonorID) AND ([app_type] = 2)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="DonorID" QueryStringField="DonorID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="الدعاه السابقين">
                                    <ContentCollection>
                                        <dx:ContentControl ID="ContentControl3" runat="server" SupportsDisabledAttribute="True">
                                            <asp:GridView ID="GridView_donor_previous_daaya" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" Caption="الدعاه السابقين" CellPadding="4" CellSpacing="1" DataKeyNames="app_ser" DataSourceID="SqlDataSource_view_donor_previous_daaya" Font-Bold="True" Font-Names="tahoma" Font-Size="Small" ForeColor="#FF3300" meta:resourceKey="GridView1Resource1" ShowFooter="True" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="الرقم" SortExpression="app_ser">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink_project_id" runat="server" NavigateUrl='<%# String.Format("../UIBeneficiaryProfileView.aspx?app_ser={0}&DonorID={1}", Eval("app_ser"), Request.QueryString("DonorID"))%>'
                                                                Text='<%# Bind("app_ser")%>' Target="_blank"></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                           <asp:BoundField DataField="applicant_name_ar_1" HeaderText="الاسم" SortExpression="applicant_name_ar_1" />
                                                    <asp:BoundField DataField="nat_descrar" HeaderText="الجنسيه" SortExpression="nat_descrar" />
                                                    <asp:BoundField DataField="allocate_descr_ar" HeaderText="الاجراء" SortExpression="allocate_descr_ar" />
                                                    <asp:BoundField DataField="tran_date" DataFormatString="{0:yyyy-MM-dd}" HeaderText="تاريخ الاجراء" SortExpression="tran_date" />
                                                    <asp:BoundField DataField="reason_ar" HeaderText="سبب الاجراء" SortExpression="reason_ar" />
                                                    <asp:BoundField DataField="funding_source_namear" HeaderText="مصدر التمويل" SortExpression="funding_source_namear" />
                                                    <asp:BoundField DataField="src_num" HeaderText="رقم الايصال" SortExpression="src_num" />
                                                    <asp:BoundField DataField="donor_id" HeaderText="المتبرع" SortExpression="donor_id" Visible="False" />
                                                </Columns>
                                                <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="SteelBlue" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue" Height="35px" HorizontalAlign="Center" />
                                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                                <RowStyle BackColor="White" Font-Bold="False" Font-Names="Tahoma" Font-Size="Small" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="Gray" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#383838" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource_view_donor_previous_daaya" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM [view_donor_previous_beneficiaries] WHERE ([donor_id] = @DonorID) AND ([app_type] = 2)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="DonorID" QueryStringField="DonorID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="المشاريع">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <asp:GridView ID="GridView_donor_project_list" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" Caption="المشاريع" CellPadding="4" CellSpacing="1" DataKeyNames="project_id" DataSourceID="SqlDataSource_view_donor_project_list" Font-Bold="True" Font-Names="tahoma" Font-Size="Small" ForeColor="#CC0000" meta:resourceKey="GridView1Resource1" ShowFooter="True" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="الرقم" SortExpression="project_id">
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="HyperLink_project_id" runat="server" NavigateUrl='<%# String.Format("../UIProjectProfileView.aspx?project_id={0}&DonorID={1}", Eval("project_id"), Request.QueryString("DonorID")) %>'
                                                                Text='<%# Bind("project_id")%>' Target="_blank"></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="project_id" HeaderText="الرقم" ReadOnly="True" SortExpression="project_id" Visible="false" />
                                                    <asp:BoundField DataField="project_name_ar" HeaderText="الاسم" SortExpression="project_name_ar" />
                                                    <asp:BoundField DataField="nat_descrar" HeaderText="الدولة" SortExpression="nat_descrar" />
                                                    <asp:BoundField DataField="approve_date" DataFormatString="{0:yyyy-MM-dd}" HeaderText="تاريخ الاعتماد" SortExpression="approve_date" />
                                                    <asp:BoundField DataField="donation_descrar" HeaderText="غرض التبرع" SortExpression="donation_descrar" />
                                                    <asp:BoundField DataField="donor_id" HeaderText="المتبرع" SortExpression="donor_id" Visible="False" />
                                                    <asp:BoundField DataField="cost" HeaderText="قيمه التبرع" SortExpression="cost" Visible="true" DataFormatString="{0:n3}" />
                                                    <asp:BoundField DataField="paid" HeaderText="مدفوع من المتبرع" SortExpression="paid" Visible="true" DataFormatString="{0:n3}" />
                                                    <asp:BoundField DataField="remaining" HeaderText="المتبقى" SortExpression="remaining" Visible="true" DataFormatString="{0:n3}" />
                                                </Columns>
                                                <FooterStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                                                <HeaderStyle BackColor="SteelBlue" Font-Bold="True" Font-Names="Tahoma" Font-Size="9pt" ForeColor="AliceBlue" Height="35px" HorizontalAlign="Center" />
                                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                                <RowStyle BackColor="White" Font-Bold="False" Font-Names="Tahoma" Font-Size="Small" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="Gray" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#383838" />
                                            </asp:GridView>
                                            <asp:SqlDataSource ID="SqlDataSource_view_donor_project_list" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" SelectCommand="SELECT * FROM view_donor_project_list WHERE ([donor_id] = @DonorID)">
                                                <SelectParameters>
                                                    <asp:QueryStringParameter DefaultValue="0" Name="DonorID" QueryStringField="DonorID" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>

        </td>
    </tr>
    <tr>
        <td align="center" style="width: 100%">&nbsp;</td>
    </tr>
    <tr>
        <td align="center" style="width: 100%">
            <dx:ASPxRoundPanel ID="ASPxRoundPanel_Donations" runat="server"
                Width="100%" meta:resourcekey="ASPxRoundPanel_Content" RightToLeft="True" Font-Bold="True" HeaderText="التبرعات">
                <HeaderStyle HorizontalAlign="Center" />
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True" meta:resourcekey="PanelContentResource2">
                        <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True" DataSourceID="EntityDataSource1" Height="200px" SideBySideEqualBarWidth="True" Width="1000px">
                            <smallcharttext antialiasing="False" text="تجاوزت البيانات سعه المخطط - من فضلك قم باستعداع هذه البيانات من تبرعات المتبرع" />
                            <diagramserializable>
<cc1:XYDiagram>
<axisx visibleinpanesserializable="-1" title-text="التبرعات" title-visible="True"><range alwaysshowzerolevel="True" sidemarginsenabled="True"></range></axisx>

<axisy visibleinpanesserializable="-1" title-text="القيمه" title-visible="True"><range alwaysshowzerolevel="True" sidemarginsenabled="True"></range></axisy>
</cc1:XYDiagram>
</diagramserializable>

                            <fillstyle><optionsserializable><cc1:SolidFillOptions></cc1:SolidFillOptions></optionsserializable>
</fillstyle>
                            <legend visible="False"></legend>
                            <seriesserializable>
<cc1:Series ArgumentDataMember="donation_descrar" ArgumentScaleType="Qualitative" LegendText="التبرع" Name="Series 1" SummaryFunction="SUM([line_amount])" LabelsVisibility="True"><viewserializable><cc1:SideBySideBarSeriesView Color="0, 192, 192" ColorEach="True"><fillstyle fillmode="Solid"><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle></cc1:SideBySideBarSeriesView></viewserializable>
<labelserializable><cc1:SideBySideBarSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions></cc1:SolidFillOptions></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions></cc1:PointOptions></pointoptionsserializable></cc1:SideBySideBarSeriesLabel></labelserializable>
<legendpointoptionsserializable><cc1:PointOptions></cc1:PointOptions></legendpointoptionsserializable>
</cc1:Series>
</seriesserializable>

                            <seriestemplate><viewserializable><cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView></viewserializable>
<labelserializable><cc1:SideBySideBarSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions></cc1:SolidFillOptions></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions></cc1:PointOptions></pointoptionsserializable></cc1:SideBySideBarSeriesLabel></labelserializable>
<legendpointoptionsserializable><cc1:PointOptions></cc1:PointOptions></legendpointoptionsserializable>
</seriestemplate>

                            <crosshairoptions><commonlabelpositionserializable><cc1:CrosshairMousePosition></cc1:CrosshairMousePosition></commonlabelpositionserializable>
</crosshairoptions>

                            <tooltipoptions><tooltippositionserializable><cc1:ToolTipMousePosition></cc1:ToolTipMousePosition></tooltippositionserializable>
</tooltipoptions>
                        </dxchartsui:WebChartControl>
                        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="view_DonorCollectionHistory" EntityTypeFilter="view_DonorCollectionHistory" Select="it.[line_amount], it.[donation_descrar]" AutoGenerateWhereClause="True" Where="">
                            <WhereParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="donor_id" QueryStringField="DonorID" Type="Int32" />
                            </WhereParameters>
                        </asp:EntityDataSource>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>

        </td>
    </tr>
    <tr>
        <td align="center" style="width: 100%">&nbsp;</td>
    </tr>
    <tr>
        <td align="center" style="width: 100%">
            <dx:ASPxRoundPanel ID="ASPxRoundPanel_Content1" runat="server"
                Width="100%" meta:resourcekey="ASPxRoundPanel_Content" RightToLeft="True" Font-Bold="True" HeaderText="اخر 3 سنوات">
                <HeaderStyle HorizontalAlign="Center" />
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True" meta:resourcekey="PanelContentResource2">
                        <dxchartsui:WebChartControl ID="WebChartControl2" runat="server" CrosshairEnabled="True" DataSourceID="EntityDataSource2" Height="200px" SideBySideEqualBarWidth="True" Width="1000px">
                            <smallcharttext antialiasing="False" text="تجاوزت البيانات سعه المخطط - من فضلك قم باستعداع هذه البيانات من تبرعات المتبرع" />
                            <diagramserializable>
                                <cc1:SimpleDiagram EqualPieSize="False">
                                </cc1:SimpleDiagram>
                            </diagramserializable>
                            <fillstyle>
                                <optionsserializable><cc1:SolidFillOptions /></optionsserializable>
                            </fillstyle>
                            <legend visible="False"></legend>
                            <seriesserializable>
                                <cc1:Series Name="Series 1" LabelsVisibility="True" LegendText="2014">
                                    <viewserializable><cc1:PieSeriesView RuntimeExploding="False"><titles><cc1:SeriesTitle Text="2014" /></titles></cc1:PieSeriesView></viewserializable>
                                    <labelserializable><cc1:PieSeriesLabel LineVisible="True" Position="TwoColumns"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PiePointOptions PointView="ArgumentAndValues"><valuenumericoptions format="Percent" /></cc1:PiePointOptions></pointoptionsserializable></cc1:PieSeriesLabel></labelserializable>
                                    <legendpointoptionsserializable><cc1:PiePointOptions PointView="ArgumentAndValues"><valuenumericoptions format="Percent" /></cc1:PiePointOptions></legendpointoptionsserializable>
                                </cc1:Series>
                                <cc1:Series LabelsVisibility="True" LegendText="2013" Name="Series 2">
                                    <viewserializable><cc1:PieSeriesView RuntimeExploding="False"><titles><cc1:SeriesTitle Text="2013" /></titles></cc1:PieSeriesView></viewserializable>
                                    <labelserializable><cc1:PieSeriesLabel LineVisible="True" Position="TwoColumns"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PiePointOptions PointView="ArgumentAndValues"><valuenumericoptions format="Percent" /></cc1:PiePointOptions></pointoptionsserializable></cc1:PieSeriesLabel></labelserializable>
                                    <legendpointoptionsserializable><cc1:PiePointOptions PointView="ArgumentAndValues"><valuenumericoptions format="Percent" /></cc1:PiePointOptions></legendpointoptionsserializable>
                                </cc1:Series>
                                <cc1:Series LabelsVisibility="True" LegendText="2012" Name="Series 3">
                                    <viewserializable><cc1:PieSeriesView RuntimeExploding="False"><titles><cc1:SeriesTitle Text="2012" /></titles></cc1:PieSeriesView></viewserializable>
                                    <labelserializable><cc1:PieSeriesLabel LineVisible="True" Position="TwoColumns"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PiePointOptions PointView="ArgumentAndValues"><valuenumericoptions format="Percent" /></cc1:PiePointOptions></pointoptionsserializable></cc1:PieSeriesLabel></labelserializable>
                                    <legendpointoptionsserializable><cc1:PiePointOptions PointView="ArgumentAndValues"><valuenumericoptions format="Percent" /></cc1:PiePointOptions></legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>
                            <seriestemplate>
                                <viewserializable><cc1:PieSeriesView RuntimeExploding="False"></cc1:PieSeriesView></viewserializable>
                                <labelserializable><cc1:PieSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PiePointOptions><valuenumericoptions format="General" /></cc1:PiePointOptions></pointoptionsserializable></cc1:PieSeriesLabel></labelserializable>
                                <legendpointoptionsserializable><cc1:PiePointOptions><valuenumericoptions format="General" /></cc1:PiePointOptions></legendpointoptionsserializable>
                            </seriestemplate>
                            <crosshairoptions>
                                <commonlabelpositionserializable><cc1:CrosshairMousePosition /></commonlabelpositionserializable>
                            </crosshairoptions>
                            <tooltipoptions>
                                <tooltippositionserializable><cc1:ToolTipMousePosition /></tooltippositionserializable>
                            </tooltipoptions>
                        </dxchartsui:WebChartControl>
                        <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="view_donor_donations_periodical" AutoGenerateWhereClause="True" EntityTypeFilter="view_donor_donations_periodical" Where="">
                            <WhereParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="donor_id" QueryStringField="DonorID" Type="Int32" />
                            </WhereParameters>
                        </asp:EntityDataSource>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>

        </td>
    </tr>
</table>
