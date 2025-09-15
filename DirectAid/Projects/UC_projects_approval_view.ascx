<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UC_projects_approval_view.ascx.vb"
    Inherits="DirectAid.UC_projects_approval_view" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx1" %>


<%  If (DesignMode) Then%>
<script src="ASPxScriptIntelliSense.js" type="text/javascript"></script>
<%  End If%>
<script type="text/javascript">

    function OK_Begin() {
        ASPxLoadingPanel1.Show();
        ASPxCallback_OK.PerformCallback(null);
    }

    function OK_End(e) {
        ASPxLoadingPanel1.Hide();
        if (e.result == "True") {
            ASPxRoundPanel3_ContentPlaceHolder1_ASPxRoundPanel5_ASPxPopupControl1.Hide();
        }
    }

    function Cancel_Begin() {
        ASPxLoadingPanel1.Show();
        ASPxCallback_OK.PerformCallback(null);
    }

    function Cancel_End(e) {
        ASPxLoadingPanel1.Hide();
        if (e.result == "True") {
            ASPxRoundPanel3_ContentPlaceHolder1_ASPxRoundPanel5_ASPxPopupControl1.Hide();
        }
    }



</script>
<table width="100%">
    <tbody>
        <tr>
            <td align="center" style="width: 50%;">
                <dx1:ASPxButton ID="ASPxButton_OK" runat="server" Text="موافق" Width="50%" AutoPostBack="False"
                    CommandName="ASPxButton_OK" EnableClientSideAPI="True" UseSubmitBehavior="False">
                    <ClientSideEvents Click="function(s, e) {
	OK_Begin();
}" />
                    <Image Url="~/Images/ActiveRents_32x32.png">
                    </Image>
                </dx1:ASPxButton>
                <dx:ASPxCallback ID="ASPxCallback_OK" runat="server" ClientInstanceName="ASPxCallback_OK">
                    <ClientSideEvents CallbackComplete="function(s, e) {
	OK_End(e);
}" />
                </dx:ASPxCallback>
<asp:SqlDataSource ID="SqlDataSource_OK" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    InsertCommandType="StoredProcedure" InsertCommand="alocate_approved_projects"
    UpdateCommandType="Text" UpdateCommand="UPDATE waqf_proj_aloc_temp SET approved = @approved , over_reason = @over_reason WHERE ( project_id = @project_id ) AND ( current_flag = @current_flag );">
    <InsertParameters>
        <asp:SessionParameter Name="aloc_bat" Type="String" SessionField="batch_id" />
        <asp:SessionParameter Name="current_flag" Type="Int32" SessionField="current_flag" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="project_id" Type="Int32" />
        <asp:Parameter Name="approved" Type="Boolean" />
        <asp:Parameter Name="over_reason" Type="String" />
        <asp:SessionParameter Name="current_flag" Type="Int32" SessionField="current_flag" />
    </UpdateParameters>
</asp:SqlDataSource>
            </td>
            <td align="center" style="width: 50%;">
                <dx1:ASPxButton ID="ASPxButton_Cancel" runat="server" Text="الغاء" Width="50%" AutoPostBack="False"
                    CommandName="ASPxButton_Cancel" EnableClientSideAPI="True" UseSubmitBehavior="False">
                    <ClientSideEvents Click="function(s, e) {
	Cancel_Begin();
}" />
                    <Image Url="~/Images/Remove_32x32.png">
                    </Image>
                </dx1:ASPxButton>
                <dx:ASPxCallback ID="ASPxCallback_Cancel" runat="server" ClientInstanceName="ASPxCallback_Cancel">
                    <ClientSideEvents CallbackComplete="function(s, e) {
	Cancel_End(e);
}" />
                </dx:ASPxCallback>
<asp:SqlDataSource ID="SqlDataSource_Cancel" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    InsertCommandType="StoredProcedure" InsertCommand="cancel_alocate_project"></asp:SqlDataSource>
            </td>
        </tr>
    </tbody>
</table>
<table width="100%">
    <tbody>
        <tr>
            <td align="center" style="width: 100%;">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView1"
                    Width="100%" DataSourceID="SqlDataSource1" RightToLeft="True">
                    <Columns>
                        <dx:GridViewDataCheckColumn FieldName="over_plan" VisibleIndex="1" Caption="خارج الخطه"
                            Width="7%">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataCheckColumn FieldName="approved" VisibleIndex="2" Caption="اعتماد"
                            Width="7%" Name="approved">
                            <DataItemTemplate>
                                <dx:ASPxCheckBox ID="approved" runat="server" Checked="true">
                                </dx:ASPxCheckBox>
                            </DataItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataTextColumn FieldName="nat_descrar" ReadOnly="false" VisibleIndex="3"
                            Caption="الدوله" Width="25%">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="zone_code" VisibleIndex="6" Visible="False">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="nat_group" VisibleIndex="7" Visible="False">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Project Value" VisibleIndex="4" Caption="قيمه المشروع"
                            Width="10%">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="donation_cat" VisibleIndex="8" Visible="False">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="donation_descrar" VisibleIndex="5" Caption="نوع التبرع"
                            Width="25%">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="current_flag" VisibleIndex="9" Visible="False">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="السبب" UnboundType="String" VisibleIndex="0"
                            Width="26%" FieldName="over_reason" Name="over_reason">
                            <DataItemTemplate>
                                <dx:ASPxTextBox ID="over_reason" runat="server" Width="100%">
                                </dx:ASPxTextBox>
                            </DataItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True"></SettingsBehavior>
                    <SettingsPager>
                        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <SettingsEditing EditFormColumnCount="1" Mode="EditForm" />
                    <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True"
                        ShowFilterRow="True" />
                    <SettingsEditing EditFormColumnCount="1" Mode="EditForm"></SettingsEditing>
                </dx:ASPxGridView>
            </td>
        </tr>
    </tbody>
</table>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [projects_approval_view] WHERE ([current_flag] = @current_flag)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="current_flag" SessionField="current_flag"
            Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
    Modal="True">
</dx:ASPxLoadingPanel>

