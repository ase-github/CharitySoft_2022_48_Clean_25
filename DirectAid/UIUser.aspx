<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="UIUser.aspx.vb" Inherits="DirectAid.UIUser" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>



<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <% If DesignMode Then%>
    <script src="Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
    <% End If%>
    <script type="text/javascript">

        var recordIDForPasswordReset = null;

        function ResetPassword(recordID) {
            ASPxTextBox_NewPassword.SetValue(null);
            recordIDForPasswordReset = recordID;
            ASPxClientPopupControl.Cast("ASPxPopupControl1").Show();
        }

        function CustomButtonClick(e) {

            var gridName = "ASPxGridView1";
            var index = e.visibleIndex;
            var key = ASPxClientGridView.Cast("ASPxGridView1").GetRowKey(index);

            ResetPassword(key);
        }

        function ResetPassword_Begin() {
            if (ASPxClientEdit.ValidateGroup("ResetPassword")) {
                ASPxButton_ResetPassword.SetEnabled(false);
                ASPxLoadingPanel1.Show();
                ASPxCallback_ResetPassword.PerformCallback(recordIDForPasswordReset);
            }
        }

        function ResetPassword_End(e) {

            var result = e.result;

            if (result == "OK") {
                recordIDForPasswordReset = null;
                ASPxClientPopupControl.Cast("ASPxPopupControl1").Hide();
                alert("تم تغيير كلمة المرور بنجاح برجاء ابلاغ المستخدم بهذا التغيير");
            }
            else {
                alert(result);
            }

            ASPxButton_ResetPassword.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

        function ResetPassword_Error(e) {
            alert(e.message);
            ASPxButton_ResetPassword.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

    </script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource_Main" Width="100%" ClientInstanceName="ASPxGridView1" KeyFieldName="collect_id" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
        <ClientSideEvents CustomButtonClick="function(s, e) {
	CustomButtonClick(e);
}" />
        <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Width="15%">
            <EditButton Visible="True" Text="تعديل">
                <Image Url="~/Images/Edit_32x32.png">
                </Image>
            </EditButton>
            <NewButton Visible="True" Text="جديد">
                <Image Url="~/Images/New_32x32.png">
                </Image>
            </NewButton>
            <DeleteButton Visible="True" Text="حذف">
                <Image Url="~/Images/Delete_32x32.png">
                </Image>
            </DeleteButton>
            <CancelButton Text="الغاء">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </CancelButton>
            <UpdateButton>
                <Image Url="~/Images/Save_32x32.png">
                </Image>
            </UpdateButton>
            <ClearFilterButton Visible="True" Text="الغاء">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </ClearFilterButton>
            <CustomButtons>
                <dx:GridViewCommandColumnCustomButton ID="RESETPASSWORD" Text="تغيير كلمه المرور">
                    <Image Url="~/Images/Action_ResetPassword_32x32.png">
                    </Image>
                </dx:GridViewCommandColumnCustomButton>
            </CustomButtons>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="collect_id" VisibleIndex="1" Caption="المستخدم" Width="15%">
                <PropertiesTextEdit>
                    <ValidationSettings CausesValidation="True" ErrorText="">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
<%--                <EditItemTemplate>
                    <table width="100%">
                        <tr>
                            <td style="width:25%"><dx:ASPxLabel runat="server" ID="ASPxLabel1" Text="اسم المستخدم" Width="100%"></dx:ASPxLabel></td>
                            <td style="width:25%">
                                <dx:ASPxTextBox runat="server" ID="ASPxTextBox_collect_id" Value='<%# Bind("collect_id") %>' Width="100%">
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td style="width:25%"><dx:ASPxLabel runat="server" ID="ASPxLabel_password" Text="كلمة المرور" Width="100%"></dx:ASPxLabel></td>
                            <td style="width:25%">
                                <dx:ASPxTextBox runat="server" ID="ASPxTextBox_password" Password="True" Width="100%">
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" >
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>--%>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="collect_namear" VisibleIndex="3" Caption="الاسم - عربى" Width="20%">
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>                <PropertiesTextEdit>
                    <ValidationSettings CausesValidation="True" ErrorText="">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="collect_nameng" VisibleIndex="4" Caption="الاسم - انجليزى" Width="20%">
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>                <PropertiesTextEdit>
                    <ValidationSettings CausesValidation="True" ErrorText="">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="مدير النظام" FieldName="super_visor" VisibleIndex="5" Width="15%" Visible="False">
                <PropertiesCheckEdit ValueChecked="1" ValueType="System.Byte" ValueUnchecked="0">
                </PropertiesCheckEdit>
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataCheckColumn>

                        <dx:GridViewDataCheckColumn Caption="فعال" FieldName="enabled" VisibleIndex="6" Width="15%">
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataCheckColumn>

            <dx:GridViewDataComboBoxColumn Caption="الفرع" FieldName="branch_id" VisibleIndex="7" Width="20%">
                <PropertiesComboBox DataSourceID="EntityDataSource_Branch" TextField="branch_descar" ValueField="branch_id" ValueType="System.Byte">
                    <ValidationSettings CausesValidation="True" ErrorText="">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
                <HeaderStyle HorizontalAlign="Center" />
                <CellStyle HorizontalAlign="Center">
                </CellStyle>

            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn UnboundType="String" Visible="False" VisibleIndex="2" Caption="كلمة المرور" FieldName="password">
                <PropertiesTextEdit Password="True">
                    <ValidationSettings CausesValidation="True" ErrorText="">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior ConfirmDelete="True" />
        <SettingsPager AlwaysShowPager="True">
        </SettingsPager>
        <Settings ShowFilterRow="True" />
        <SettingsText ConfirmDelete="هل تريد الحذف؟" />
    </dx:ASPxGridView>


<dx:ASPxPopupControl runat="server" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AutoUpdatePosition="True" Modal="True" AllowDragging="True" AllowResize="True" ClientInstanceName="ASPxPopupControl1" EnableClientSideAPI="True" HeaderText="" RenderMode="Lightweight" ID="ASPxPopupControl1" FooterText="" ShowFooter="True" Width="350px" EnableCallbackAnimation="True">
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
            <table width="100%">
                <tbody>
                    <tr>
                        <td align="center" style="width: 75%;">
                            <dx:ASPxLabel ID="ASPxLabel_app_ser43" runat="server" Font-Bold="True" Text="كلمة المرور الجديده" Width="100%">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 75%;">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 75%;">
                            <dx:ASPxTextBox ID="ASPxTextBox_NewPassword" runat="server" EnableClientSideAPI="True" MaxLength="128" Password="True" Width="100%" ClientInstanceName="ASPxTextBox_NewPassword">
                                <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="ResetPassword">
                                    <RequiredField ErrorText="" IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 75%;"></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 75%;">
                            <dx:ASPxButton ID="ASPxButton_ResetPassword" runat="server" AutoPostBack="False" ClientInstanceName="ASPxButton_ResetPassword" EnableClientSideAPI="True" Font-Bold="True" Text="تغيير كلمة المرور" UseSubmitBehavior="False" ValidateInvisibleEditors="True" ValidationContainerID="ASPxPageControl1" ValidationGroup="ResetPassword" Width="100%">
                                <ClientSideEvents Click="function(s, e) {
	ResetPassword_Begin();
}" />
                                <Image Url="~/Images/Action_ResetPassword_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </tbody>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>



    <asp:EntityDataSource ID="EntityDataSource_Main" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="collectors_tab" EntityTypeFilter="collectors_tab">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSource_Branch" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="branches" EntityTypeFilter="branch">
    </asp:EntityDataSource>

<dx:ASPxLoadingPanel runat="server" Modal="True" ClientInstanceName="ASPxLoadingPanel1" Font-Bold="True" ID="ASPxLoadingPanel1"></dx:ASPxLoadingPanel>

<dx:ASPxCallback runat="server" ClientInstanceName="ASPxCallback_ResetPassword" ID="ASPxCallback_ResetPassword">
    <ClientSideEvents CallbackComplete="function(s, e) {
	ResetPassword_End(e);
}"
        CallbackError="function(s, e) {
	ResetPassword_Error(e);
}"></ClientSideEvents>
</dx:ASPxCallback>


</asp:Content>
