<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Orphan_images.aspx.vb"
    Inherits="DirectAid.Orphan_images" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.7.2.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui-1.8.20.js" type="text/javascript"></script>
    <script type="text/javascript">

        function onCallback_ShowPhoto(photo_path) {

            photo_path = photo_path.replace("~", "");
            window.open(photo_path, "amani", 'toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=300');
        }

        function ShowPhoto(e) {
            ASPxClientGridView.Cast("ASPxGridView_project_photos").GetRowValues(e.visibleIndex, "attachment_image", onCallback_ShowPhoto);
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
        .style33
        {
            font-weight: 700;
        }
        .style92
        {
            width: 327px;
        }
        .style51
        {
            height: 22px;
        }
        .style45
        {
            height: 22px;
            width: 57px;
        }
        .style93
        {
            width: 87px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel" runat="server">
        <ContentTemplate>
            <div>
                <table bgcolor="#F1F7FC" cellspacing="1" dir="rtl" style="width: 92%; height: 47px;
                    margin-right: 62px;">
                    <tr>
                        <td class="style50">
                            &nbsp;
                        </td>
                        <td class="style93">
                            <a id="lnk_search" runat="server">
                                <img alt="" border="0" src="images/Find_32x32.png" style="height: 32px; width: 32px;" />
                            </a><a id="lnk_search_rtn" runat="server" visible="True"></a>
                        </td>
                        <td class="style33">
                            &nbsp;
                        </td>
                        <td class="style92" colspan="2">
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style50">
                            &nbsp;
                        </td>
                        <td class="style93">
                            <asp:Label ID="Label216" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="16px"
                                Text="رقم اليتيم" Width="59px"></asp:Label>
                        </td>
                        <td class="style33">
                            <asp:TextBox ID="txt_app_ser" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px"
                                Width="153px"></asp:TextBox>
                        </td>
                        <td class="style92">
                            <span>
                                <img alt="Search by names" border="0" height="24" src="images/Find_32x32.png" style="visibility: visible;
                                    width: 24px; height: 22px" onclick="open_search_names_scrn();" />
                            </span>
                        </td>
                        <td class="style92">
                            <asp:Label ID="Label217" runat="server" Font-Names="Tahoma" Font-Size="8pt" Text="اسم اليتيم"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_orphan_name" runat="server" BackColor="#FFFFE6" BorderColor="#CEE6FF"
                                BorderStyle="Solid" BorderWidth="1px" Font-Names="Tahoma" Font-Size="9pt" Height="21px"
                                Width="252px"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style50">
                            &nbsp;
                        </td>
                        <td class="style93">
                            <asp:Label ID="Label218" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="16px"
                                Text="نوع المرفق" Width="59px"></asp:Label>
                        </td>
                        <td class="style33">
                            <asp:DropDownList ID="ddl_attach_type" runat="server" Height="22px" TabIndex="13"
                                Width="160px" AppendDataBoundItems="True">
                            </asp:DropDownList>
                        </td>
                        <td class="style92">
                            &nbsp;
                        </td>
                        <td class="style92">
                            <asp:Label ID="Label219" runat="server" Font-Names="Tahoma" Font-Size="8pt" Height="16px"
                                Text="تاريخ المرفق" Width="59px"></asp:Label>
                        </td>
                        <td>
                            <dx:ASPxDateEdit ID="dt_attach_date" runat="server" DisplayFormatString="dd/MM/yyyy"
                                EditFormat="Custom" TabIndex="12" Theme="Aqua">
                            </dx:ASPxDateEdit>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style51" dir="rtl">
                            &nbsp;
                        </td>
                        <td class="style51" colspan="5" dir="rtl">
                            <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ClientInstanceName="ASPxUploadControl1"
                                meta:resourcekey="ASPxUploadControl1Resource1" ShowProgressPanel="True" ShowUploadButton="True"
                                UploadMode="Advanced" Width="100%">
                                <ClientSideEvents FilesUploadComplete="function(s, e) {ASPxGridView_project_photos.Refresh();}"
                                    FileUploadComplete="function(s, e) {ASPxGridView_project_photos.Refresh();}" />
                                <AdvancedModeSettings EnableMultiSelect="True" />
                                <ClientSideEvents FilesUploadComplete="function(s, e) {ASPxGridView_project_photos.Refresh();}"
                                    FileUploadComplete="function(s, e) {ASPxGridView_project_photos.Refresh();}" />
                                <AdvancedModeSettings EnableMultiSelect="True" />
                                <ClientSideEvents FilesUploadComplete="function(s, e) {ASPxGridView_project_photos.Refresh();}"
                                    FileUploadComplete="function(s, e) {ASPxGridView_project_photos.Refresh();}" />
                                <AdvancedModeSettings EnableMultiSelect="True" />
                                <ClientSideEvents FilesUploadComplete="function(s, e) {ASPxGridView_project_photos.Refresh();}"
                                    FileUploadComplete="function(s, e) {ASPxGridView_project_photos.Refresh();}" />
                                <AdvancedModeSettings EnableMultiSelect="True" />
                            </dx:ASPxUploadControl>
                        </td>
                        <td class="style45">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="style51" dir="rtl">
                            &nbsp;
                        </td>
                        <td class="style51" colspan="5" dir="rtl">
                            <asp:SqlDataSource ID="dts_type" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                SelectCommand="SELECT * FROM [application_attach_type]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="dts_pic" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                                DeleteCommand="usp_application_attachDelete" DeleteCommandType="StoredProcedure"
                                InsertCommand="usp_application_attachInsert" InsertCommandType="StoredProcedure"
                                SelectCommand="usp_application_attachSelect" SelectCommandType="StoredProcedure"
                                UpdateCommand="usp_application_attachUpdate" UpdateCommandType="StoredProcedure">
                                <DeleteParameters>
                                    <asp:Parameter Name="attach_ser" Type="Int16" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser" PropertyName="Text"
                                        Type="Int32" />
                                    <asp:Parameter Name="attach_code" Type="Byte" />
                                    <asp:Parameter Name="attachment_image" Type="String" />
                                    <asp:Parameter DbType="Date" Name="attach_date" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser" PropertyName="Text"
                                        Type="Int32" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="attach_ser" Type="Int16" />
                                    <asp:ControlParameter ControlID="txt_app_ser" Name="app_ser" PropertyName="Text"
                                        Type="Int32" />
                                    <asp:Parameter Name="attach_code" Type="Byte" />
                                    <asp:Parameter Name="attachment_image" Type="String" />
                                    <asp:Parameter DbType="Date" Name="attach_date" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView_project_photos"
                                DataSourceID="dts_pic" EnableTheming="True" KeyFieldName="attach_ser" Width="100%"
                                Theme="Aqua">
                                <ClientSideEvents CustomButtonClick="function(s, e) {ShowPhoto(e);}" />
                                <ClientSideEvents CustomButtonClick="function(s, e) {ShowPhoto(e);}" />
                                <Columns>
                                    <dx:GridViewCommandColumn VisibleIndex="0">
                                        <EditButton Visible="True">
                                        </EditButton>
                                        <DeleteButton Visible="True">
                                        </DeleteButton>
                                        <CustomButtons>
                                            <dx:GridViewCommandColumnCustomButton ID="ShowPhoto" Text="عرض الصورة">
                                                <Image Url="~/images/Open_32x32.png">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                        </CustomButtons>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Caption="الرقم الآلي" FieldName="attach_ser" ReadOnly="True"
                                        VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="app_ser" Visible="False" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="نوع الملحق" FieldName="attach_code" VisibleIndex="3">
                                        <PropertiesComboBox CallbackPageSize="10" EnableCallbackMode="True" DataSourceID="dts_type"
                                            TextField="type_name" ValueField="type_id" ValueType="System.Int32" EnableClientSideAPI="True">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn Caption="مكان الملحق" FieldName="attachment_image" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn FieldName="attach_date" VisibleIndex="4" Caption="تاريخ المرفق">
                                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                        </PropertiesDateEdit>
                                    </dx:GridViewDataDateColumn>
                                </Columns>
                                <SettingsPager AlwaysShowPager="True">
                                </SettingsPager>
                                <SettingsText CommandDelete="حذف" CommandEdit="تعديل" />
                                <SettingsText CommandDelete="حذف" CommandEdit="تعديل" />
                            </dx:ASPxGridView>
                        </td>
                        <td class="style45">
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
