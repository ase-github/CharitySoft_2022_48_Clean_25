<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryHeaderV1.ascx.vb"
    Inherits="DirectAid.UCBeneficiaryHeaderV1" %>



<%@ Register Namespace="DevExpress.XtraCharts.Web" TagPrefix="Web" %>
<%@ Register Assembly="DevExpress.XtraCharts.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.XtraCharts.v25.1.Web, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>



<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<script type="text/javascript">
    function Print_Begin() {
        ASPxButton_Print.SetEnabled(false);
        ASPxLoadingPanel1.Show();
        ASPxCallback_Print.PerformCallback(null);
    }

    function Print_End(e) {

        var result = e.result;

        if (result == "OK") {
            window.open("ReportViewer.aspx?popup=1", "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600");
        }
        else {
            alert(result);
        }

        ASPxButton_Print.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function Print_Error(e) {
        alert(e.message);
        ASPxButton_Print.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function ButtonEditClickByEnter(s, e) {
        if (e.htmlEvent.keyCode == 13) {
            ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
            s.GetButton(0).click();
        }
    }

</script>

<table width="100%" align="center">
    <tr>
        <td align="center" style="width: 100%">
            <dx:ASPxRoundPanel ID="ASPxRoundPanel_Data" runat="server"
                Width="100%" meta:resourcekey="ASPxRoundPanel_Content" RightToLeft="True" Font-Bold="True" HeaderText="بيانات المستفيد">
                <HeaderStyle HorizontalAlign="Center" />
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True" meta:resourcekey="PanelContentResource2">
                        <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1" Font-Bold="True" Modal="True">
                        </dx:ASPxLoadingPanel>
                        <dx:ASPxCallback ID="ASPxCallback_Print" runat="server" ClientInstanceName="ASPxCallback_Print">
                            <ClientSideEvents CallbackComplete="function(s, e) {
	Print_End(e);
}"
                                CallbackError="function(s, e) {
	Print_Error(e);
}" />
                        </dx:ASPxCallback>
                        <asp:EntityDataSource ID="EntityDataSource3" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="view_report_orphan" Where="" Select="it.[beneficiary_type_namear], it.[gender_ar], it.[applicant_name_ar], it.[applicant_dob], it.[nat_descrar], it.[center_namear], it.[personal_photo_path], it.[allocation_date], it.[src_num], it.[funding_source_namear], it.[app_ser]" EntityTypeFilter="view_report_orphan">
                            <WhereParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="app_ser" QueryStringField="app_ser" Type="Int32" />
                            </WhereParameters>
                        </asp:EntityDataSource>
                        <table align="center" width="100%" border="1" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td align="center" style="width: 16%;">
                                            &nbsp;</td>
                                        <td align="center" style="width: 16%;">
                                            <dx:ASPxButtonEdit ID="ASPxButton_Print" runat="server" ClientInstanceName="ASPxButton_Print" EnableClientSideAPI="True" Font-Bold="True" UseSubmitBehavior="False" Width="100%">
                                                <ClientSideEvents ButtonClick="function(s, e) {
	Print_Begin();
}" KeyPress="function(s, e) {
	ButtonEditClickByEnter(s, e);
}" />
                                                <MaskSettings Mask="&lt;1900..3000&gt;" />
                                                <Buttons>
                                                    <dx:EditButton Position="Left">
                                                        <Image Url="~/Images/Print_32x32.png">
                                                        </Image>
                                                    </dx:EditButton>
                                                </Buttons>
                                                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                                </ValidationSettings>
                                            </dx:ASPxButtonEdit>
                                        </td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 4%;">&nbsp;</td>
                                    </tr>
                                </table>
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="EntityDataSource3" Width="100%">
                            <ItemTemplate>
                                <table align="center" width="100%" border="1" cellpadding="5" cellspacing="5">
                                    <tr>
                                        <td align="center" style="width: 16%;">&nbsp;<asp:Label ID="Label227" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='نوع المستفيد' Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">&nbsp;<asp:Label ID="Label228" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("beneficiary_type_namear") %>' Width="100%" BackColor="White"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;"></td>
                                        <td align="center" style="width: 16%;"></td>
                                        <td align="center" rowspan="10">
                                            <dx:ASPxImage ID="ASPxImage_photo" runat="server" ImageUrl='<%# Eval("personal_photo_path") %>' Width="100%" Height="290px">
                                            </dx:ASPxImage>
                                        </td>
                                        <td align="center" style="width: 4%;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label229" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الرقم" Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="app_ser" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("app_ser") %>' Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 16%;">
                                            &nbsp;</td>
                                        <td align="center" style="width: 4%;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label231" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الاسم" Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label240" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("applicant_name_ar") %>' Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 4%;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label246" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الجنس" Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label238" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("gender_ar") %>' Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 4%;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label232" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="تاريخ الميلاد" Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label235" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("applicant_dob", "{0:yyyy-MM-dd}")%>' Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 4%;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label245" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="الدوله" Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label239" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("nat_descrar") %>' Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 4%;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label243" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="المركز" Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label241" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("center_namear") %>' Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 4%;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label233" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="تاريخ التخصيص" Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label236" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("allocation_date", "{0:yyyy-MM-dd}")%>' Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 4%;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label244" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="مصدر التمويل" Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label242" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("funding_source_namear") %>' Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 4%;">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label234" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="رقم الايصال" Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">
                                            <asp:Label ID="Label237" runat="server" BackColor="White" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text='<%# Eval("src_num")%>' Width="100%"></asp:Label>
                                        </td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 16%;">&nbsp;</td>
                                        <td align="center" style="width: 4%;">&nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:FormView>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
        </td>
    </tr>
</table>
