<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCOrphanAllocation.ascx.vb"
    Inherits="DirectAid.UCOrphanAllocation" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
<script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
<script type="text/javascript">



    function pageLoad() {



        //           $("#txt_transaction_date").datepicker({
        //            changeMonth: true,
        //         changeYear: true,
        //      dateFormat: 'dd/mm/yy',
        //   yearRange: 'c-90:c+1'
        //  });



        $('#txt_center_code').keydown(function (event) {
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
    }







    function Search() {

        var key = event.keyCode;
        var i = document.getElementById("lnk_search_rtn");

        if (key == 13) {
            i.click();

        }

    }

    function Search_Names() {


        var i = document.getElementById("lnk_search_rtn");
        i.click();



    }

    function open_search_names_scrn() {

        var i;
        var j;
        var k;
        var floatingWindow;
        i = (event.keyCode);
        floatingWindow = open("", "", "width=700,height=700");
        floatingWindow.location.href = "search_screen_benf.aspx?searchFLAG=1";
        return false;
    }

</script>
<style type="text/css">
    .style33 {
        font-weight: 700;
    }

    a:link, a:visited {
        color: #034af3;
    }

    .style49 {
        height: 12px;
    }
    .auto-style1 {
        height: 43px;
    }
</style>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel" runat="server">
    <ContentTemplate>
        <table bgcolor="#F1F7FC" cellspacing="1" dir="rtl" style="width: 95%; height: 47px; margin-right: 62px;">
            <tr>
                <td class="auto-style1" colspan="4">&nbsp;<a id="lnk_search" runat="server">
                </a>&nbsp;<a id="lnk_save" runat="server"><img alt="" border="0" src="images/Save_32x32.png"
                    style="width: 32px; height: 32px;" />
                </a><a id="lnk_Delete" runat="server">&nbsp;</a><asp:Literal ID="Literal1" runat="server"
                    Visible="False"></asp:Literal>
                    <a id="lnk_search_rtn" runat="server" visible="True"></a><a id="lnk_Get_Fayher_name"
                        runat="server" visible="True"></a>&nbsp; &nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style50">
                    <asp:Label ID="Label227" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="نوع المستفيد"
                        Width="100%"></asp:Label>
                </td>
                <td class="style33">
                    <asp:DropDownList ID="ddl_benf_type" runat="server" Height="21px" Width="177px" AutoPostBack="True"
                        Enabled="False">
                        <asp:ListItem>يتيم</asp:ListItem>
                        <asp:ListItem>طالب</asp:ListItem>
                        <asp:ListItem>داعية</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                </td>
            </tr>
            <tr>
                <td class="style50">
                    <asp:Label ID="Label11" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="رقم المستفيد"
                        Width="100%"></asp:Label>
                </td>
                <td class="style33">
                    <asp:TextBox runat="server" BackColor="#FFFFCC" BorderColor="#CEE6FF" BorderWidth="1px"
                        BorderStyle="Solid" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="173px"
                        ClientIDMode="Static" ID="txt_app_ser"></asp:TextBox>
                </td>
                <td>
                    <asp:Label ID="Label226" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                        Text="الأسم" Width="100%"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_orphan_name" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                        BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="197px"
                        BackColor="#FFFFCC" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style50">
                    <asp:Label ID="Label190" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                        Text="نوع العملية" Width="100%"></asp:Label>
                </td>
                <td class="style33">
                    <asp:DropDownList ID="ddl_trans_type" runat="server" Height="21px" Width="177px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="Label194" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                        Text="التاريخ" Width="100%"></asp:Label>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="txt_transaction_date" runat="server" DisplayFormatString="dd/MM/yyyy"
                        EditFormat="Custom" Height="16px" Theme="Aqua" Width="206px">
                    </dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td class="style50">
                    <asp:Label ID="Label192" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                        Text="السبب" Width="100%"></asp:Label>
                </td>
                <td class="style33">
                    <asp:DropDownList ID="ddl_reasons" runat="server" Height="21px" Width="177px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Label ID="Label193" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                        Text="اسم المتبرع" Width="100%"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddl_donor_name" runat="server" Height="21px" Width="203px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style50">
                    <asp:Label ID="Label195" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                        Text="ملاحظات" Width="100%"></asp:Label>
                </td>
                <td class="style33" colspan="3">
                    <asp:TextBox ID="txt_notes" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                        BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px" Width="100%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style49" colspan="4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style49" colspan="4">
                    <dx:ASPxGridView ID="grd_donor_allocate" runat="server" AutoGenerateColumns="False"
                        DataSourceID="dts_donor_allocate" KeyFieldName="tran_code;app_ser" Theme="Aqua"
                        Width="100%">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="الرقم الآلي" FieldName="tran_code" ReadOnly="True"
                                VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="رقم اليتيم" FieldName="app_ser" ReadOnly="True"
                                VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="تاريخ العملية" FieldName="tran_date" VisibleIndex="2">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataComboBoxColumn Caption="نوع العملية" FieldName="tran_type" VisibleIndex="3">
                                <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_allocation_trans_cat"
                                    EnableCallbackMode="True" EnableClientSideAPI="True" TextField="allocate_descr_ar"
                                    ValueField="allocate_code" ValueType="System.Int32">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="اسم الكفيل" FieldName="donor_id" VisibleIndex="4">
                                <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_donor" EnableCallbackMode="True"
                                    EnableClientSideAPI="True" TextField="donor_namear" ValueField="donor_id" ValueType="System.Int32">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="الأسباب" FieldName="reasons" VisibleIndex="5">
                                <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_reasons" EnableCallbackMode="True"
                                    EnableClientSideAPI="True" TextField="reason_ar" ValueField="reason_code" ValueType="System.Int32">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn Caption="ملاحظات" FieldName="notes" VisibleIndex="6" Width="250">
                                <PropertiesTextEdit Width="250px">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFilterRow="True" />
                    </dx:ASPxGridView>
                </td>
            </tr>
            <tr>
                <td class="style50" colspan="4">
                    <asp:SqlDataSource ID="dts_allocation_trans_cat" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                        SelectCommand="SELECT * FROM [allocation_trans_cat]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="dts_reasons" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                        SelectCommand="GetAllocationReasons" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="dts_donor" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                        SelectCommand="SELECT top 10 [donor_id], [donor_namear], [donor_nameen] FROM [donor_data]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="dts_donor_allocate" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                        SelectCommand="GetDonorAllocate" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser" PropertyName="Text"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style50" colspan="4">&nbsp;
                </td>
            </tr>
            <tr>
                <td class="style50" colspan="4" style="border: thin solid #C0C0C0">&nbsp;
                </td>
            </tr>
        </table>
    </ContentTemplate>
</asp:UpdatePanel>

