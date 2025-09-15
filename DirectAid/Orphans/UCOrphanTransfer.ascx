<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCOrphanTransfer.ascx.vb"
    Inherits="DirectAid.UCOrphanTransfer" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
<script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
<script type="text/javascript">






    function pageLoad() {
        //Date picker for the Date

        //       $("#txt_transfer_date").datepicker({
        //        changeMonth: true,
        //     changeYear: true,
        //  dateFormat: 'dd/mm/yy',
        //      yearRange: 'c-90:c+1'
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


    function Search_Names() {


        var i = document.getElementById("lnk_search_rtn");
        i.click();



    }
      


</script>
<style type="text/css">
    .style33
    {
    }
    .style36
    {
        height: 29px;
    }
    .style38
    {
        height: 31px;
    }
    .style39
    {
        width: 140px;
        height: 31px;
    }
    .style40
    {
        width: 169px;
        height: 31px;
    }
    .style41
    {
        width: 140px;
    }
    .style42
    {
        width: 169px;
    }
    #form1
    {
        width: 758px;
    }
</style>
<div style="width: 750px">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <table bgcolor="#F1F7FC" cellspacing="2" dir="rtl" style="width: 100%; height: 47px;
                margin-right: 62px;">
                <tr>
                    <td class="style50" colspan="4">
                        &nbsp;<a id="lnk_search" runat="server"><img alt="" border="0" src="images/Find_32x32.png"
                            style="height: 32px; width: 32px;" />
                        </a>&nbsp;<a id="lnk_save" runat="server"><img alt="" border="0" src="images/Save_32x32.png"
                            style="width: 32px; height: 32px;" />
                        </a>&nbsp;<asp:Literal ID="Literal1" runat="server" Visible="False"></asp:Literal>
                        <a id="lnk_search_rtn" runat="server" visible="True"></a><a id="lnk_Get_Fayher_name"
                            runat="server" visible="True"></a>&nbsp; &nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style50" colspan="4">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style38" style="width: 10%">
                        <asp:Label runat="server" Text="نوع المستفيد" Font-Names="Tahoma" Font-Size="8pt"
                            ID="Label265" Width="100%"></asp:Label>
                        <asp:Label ID="Label306" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                            Text="*"></asp:Label>
                    </td>
                    <td class="style39" style="width: 40%">
                        <asp:DropDownList ID="ddl_benf_type" runat="server" Height="21px" Width="100%" AutoPostBack="True">
                            <asp:ListItem>يتيم</asp:ListItem>
                            <asp:ListItem>طالب</asp:ListItem>
                            <asp:ListItem>داعية</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td class="style40" style="width: 10%">
                        <span>
                            <img alt="Search by names" border="0" height="24" src="images/Find_32x32.png" style="visibility: visible;
                                width: 24px; height: 22px" onclick="open_search_names_scrn();" />
                        </span>
                    </td>
                    <td class="style38" style="width: 40%">
                    </td>
                </tr>
                <tr>
                    <td class="style38" style="width: 10%">
                        <asp:Label runat="server" Text="رقم المستفيد" Font-Names="Tahoma" Font-Size="8pt"
                            ID="Label11" Width="100%"></asp:Label>
                        <asp:Label ID="Label307" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                            Text="*"></asp:Label>
                    </td>
                    <td class="style39" style="width: 40%">
                        <asp:TextBox runat="server" BackColor="#FFFFEA" BorderColor="#CEE6FF" BorderWidth="1px"
                            BorderStyle="Solid" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="100%"
                            ClientIDMode="Static" ID="txt_app_ser"></asp:TextBox>
                    </td>
                    <td class="style40" style="width: 10%">
                        &nbsp;<asp:Label ID="Label226" runat="server" Font-Names="Tahoma" Font-Size="8pt"
                            Height="20px" Text="اسم المستفيد" Width="100%"></asp:Label>
                    </td>
                    <td class="style38" style="width: 40%">
                        <asp:TextBox ID="txt_orphan_name" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                            BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="21px" Width="100%"
                            BackColor="#FFFFEA" Enabled="False" Style="margin-right: 0px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style50" style="width: 10%">
                        <asp:Label ID="Label225" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                            Text="تاريخ النقل" Width="100%"></asp:Label>
                        <asp:Label ID="Label308" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                            Text="*"></asp:Label>
                    </td>
                    <td class="style41" style="width: 40%">
                        <dx:ASPxDateEdit ID="txt_transfer_date" runat="server" DisplayFormatString="dd/MM/yyyy"
                            EditFormat="Custom" Height="16px" Theme="Aqua" Width="100%">
                        </dx:ASPxDateEdit>
                    </td>
                    <td class="style42" style="width: 10%">
                        <asp:Label ID="Label229" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                            Text="السبب" Width="100%"></asp:Label>
                        <asp:Label ID="Label309" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                            Text="*"></asp:Label>
                    </td>
                    <td style="width: 40%">
                        <asp:DropDownList ID="ddl_reasons" runat="server" Height="21px" Width="100%" Font-Names="Tahoma"
                            Font-Size="8pt">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style50" style="width: 10%">
                        <asp:Label ID="lbl_center_from0" runat="server" Font-Names="Tahoma" Font-Size="8pt"
                            Height="20px" Text="من دوله" Width="100%"></asp:Label>
                    </td>
                    <td class="style41" style="width: 40%">
                        <dx:ASPxComboBox ID="ASPxComboBox_from_country" runat="server" DataSourceID="SqlDataSource_nat_tab"
                            TextField="nat_descrar" ValueField="nat_code" ValueType="System.Int16" Width="100%">
                            <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                <RequiredField ErrorText="" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    </td>
                    <td class="style42" style="width: 10%">
                        <asp:Label ID="lbl_center_from1" runat="server" Font-Names="Tahoma" Font-Size="8pt"
                            Height="20px" Text="الى دوله" Width="100%"></asp:Label>
                    </td>
                    <td style="width: 40%">
                        <dx:ASPxComboBox ID="ASPxComboBox_to_country" runat="server" DataSourceID="SqlDataSource_nat_tab"
                            TextField="nat_descrar" ValueField="nat_code" ValueType="System.Int16" Width="100%">
                            <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                <RequiredField ErrorText="" IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="style50" style="width: 10%">
                        <asp:Label ID="lbl_center_from" runat="server" Font-Names="Tahoma" Font-Size="8pt"
                            Height="20px" Text="من مركز" Width="100%"></asp:Label>
                        <asp:Label ID="Label310" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                            Text="*"></asp:Label>
                    </td>
                    <td class="style41" style="width: 40%">
                        <asp:DropDownList ID="ddl_from_center" runat="server" AutoPostBack="True" Font-Names="Tahoma"
                            Font-Size="8pt" Height="21px" Width="100%">
                        </asp:DropDownList>
                    </td>
                    <td class="style42" style="width: 10%">
                        <asp:Label ID="lbl_center_to" runat="server" Font-Names="Tahoma" Font-Size="8pt"
                            Height="20px" Text="إلى مركز" Width="100%"></asp:Label>
                        <asp:Label ID="Label311" runat="server" Font-Names="Tahoma" Font-Size="8pt" ForeColor="Red"
                            Text="*"></asp:Label>
                    </td>
                    <td style="width: 40%">
                        <asp:DropDownList ID="ddl_to_center" runat="server" AutoPostBack="True" Font-Names="Tahoma"
                            Font-Size="8pt" Height="21px" Width="100%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style36" style="width: 10%">
                        <asp:Label ID="Label264" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="20px"
                            Text="ملاحظات" Width="100%"></asp:Label>
                    </td>
                    <td class="style36" colspan="3">
                        <asp:TextBox ID="txt_notes" runat="server" BorderColor="#CEE6FF" BorderStyle="Solid"
                            BorderWidth="1px" Font-Names="Tahoma" Font-Size="8pt" Height="26px" Width="100%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style50" style="width: 10%">
                        &nbsp;
                    </td>
                    <td class="style33" colspan="3">
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style50" colspan="4">
                        <asp:SqlDataSource ID="dts_reasons" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                            SelectCommand="SELECT * FROM [reason_tab]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dts_center" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                            SelectCommand="SELECT * FROM [center_tab]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dts_transfer_orphan" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                            SelectCommand="GetOrphansTranfersLog" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser" PropertyName="Text"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlDataSource_nat_tab" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>"
                            SelectCommand="SELECT [nat_code], [nat_descrar], [nat_desceng] FROM [nat_tab]">
                        </asp:SqlDataSource>
                        <dx:ASPxGridView ID="grd_transfer" runat="server" AutoGenerateColumns="False" DataSourceID="dts_transfer_orphan"
                            KeyFieldName="trans_code;app_ser" Width="100%" Theme="Aqua">
                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn Caption="الرقم الآلي" FieldName="trans_code" ReadOnly="True"
                                    VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn Caption="رقم اليتيم" FieldName="app_ser" ReadOnly="True"
                                    VisibleIndex="2" Visible="False">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="من دوله" FieldName="from_country" VisibleIndex="3">
                                    <PropertiesComboBox CallbackPageSize="10" DataSourceID="SqlDataSource_nat_tab" EnableCallbackMode="True"
                                        EnableClientSideAPI="True" TextField="nat_descrar" ValueField="nat_code" ValueType="System.Int16">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="الى دوله" FieldName="to_country" VisibleIndex="4">
                                    <PropertiesComboBox CallbackPageSize="10" DataSourceID="SqlDataSource_nat_tab" EnableCallbackMode="True"
                                        EnableClientSideAPI="True" TextField="nat_descrar" ValueField="nat_code" ValueType="System.Int16">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="من مركز" FieldName="form_center" VisibleIndex="5">
                                    <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_center" EnableCallbackMode="True"
                                        EnableClientSideAPI="True" TextField="center_namear" ValueField="center_code"
                                        ValueType="System.Int32">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="إلى مركز" FieldName="to_center" VisibleIndex="6">
                                    <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_center" EnableCallbackMode="True"
                                        EnableClientSideAPI="True" TextField="center_namear" ValueField="center_code"
                                        ValueType="System.Int32">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="الأسباب" FieldName="reason_code" VisibleIndex="9">
                                    <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_reasons" EnableCallbackMode="True"
                                        EnableClientSideAPI="True" TextField="reason_ar" ValueField="reason_code" ValueType="System.Int32">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataTextColumn Caption="ملاحظات" FieldName="notes" VisibleIndex="10">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </td>
                </tr>
                <tr>
                    <td class="style50" colspan="4">
                        <asp:SqlDataSource ID="dts_school" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                            SelectCommand="SELECT [school_code], [school_name_ar] FROM [school_master]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dts_transfer_student" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                            SelectCommand="GetStudentTranfersLog" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser" PropertyName="Text"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <dx:ASPxGridView ID="grd_student" runat="server" AutoGenerateColumns="False" DataSourceID="dts_transfer_student"
                            KeyFieldName="trans_code" Theme="Aqua" Width="713px">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="الرقم الآلي" FieldName="trans_code" ReadOnly="True"
                                    VisibleIndex="0" ShowInCustomizationForm="True">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="app_ser" VisibleIndex="1" Visible="False" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataComboBoxColumn Caption="من مؤسسة" FieldName="form_center" VisibleIndex="2">
                                    <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_school" EnableCallbackMode="True"
                                        EnableClientSideAPI="True" TextField="school_name_ar" ValueField="school_code"
                                        ValueType="System.Int32">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="إلى مؤسسة" FieldName="to_center" VisibleIndex="3">
                                    <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_school" EnableCallbackMode="True"
                                        EnableClientSideAPI="True" TextField="school_name_ar" ValueField="school_code"
                                        ValueType="System.Int32">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataComboBoxColumn Caption="الأسباب" FieldName="reason_code" VisibleIndex="4">
                                    <PropertiesComboBox CallbackPageSize="10" DataSourceID="dts_reasons" EnableCallbackMode="True"
                                        EnableClientSideAPI="True" TextField="reason_ar" ValueField="reason_code" ValueType="System.Int32">
                                    </PropertiesComboBox>
                                </dx:GridViewDataComboBoxColumn>
                                <dx:GridViewDataTextColumn Caption="ملاحظات" FieldName="notes" VisibleIndex="6" ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn Caption="تاريخ الحالة" FieldName="status_date" VisibleIndex="5">
                                    <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                    </PropertiesDateEdit>
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="da_orphan" Visible="False" VisibleIndex="7"
                                    ShowInCustomizationForm="True">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
