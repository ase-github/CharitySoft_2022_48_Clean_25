<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="ChangePassword.aspx.vb" Inherits="DirectAid.ChangePassword" %>

<%@ Register assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <% If DesignMode Then%>
    <script src="Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
    <% End If%>

<script type="text/javascript">
    function ChangePassword_Begin() {
        if (ASPxClientEdit.AreEditorsValid()) {
            ASPxButton_ChangePassword.SetEnabled(false);
            ASPxCallback_ChangePassword.PerformCallback(null);
        }
    }

    function ChangePassword_End(e) {

        switch (e.result) {
            case "INVALID_CURRENT_PASSWORD":
                {
                    alert("كلمه المرور الحاليه غير صحيحه");
                    ASPxClientTextBox.Cast("ASPxTextBox_CurrentPassword").SetIsValid(false);
                    break;
                }

            case "INVALID_CONFIRM_NEW_PASSWORD":
                {
                    alert("كلمه المرور الجديده والتأكيد غير متطابقان");
                    ASPxClientTextBox.Cast("ASPxTextBox_ConfirmNewPassword").SetIsValid(false);
                    break;
                }

            case "OK":
                {
                    alert("تم تغيير كلمه المرور بنجاح");
                    window.location.href = "Default.aspx";
                    ASPxTextBox_CurrentPassword.SetValue(null);
                    ASPxTextBox_NewPassword.SetValue(null);
                    ASPxTextBox_ConfirmNewPassword.SetValue(null);
                    break;
                }

            default:
                {
                    alert(e.result);
                    break;
                }
        }

        ASPxButton_ChangePassword.SetEnabled(true);
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table width="50%" align="center">
        <tr>
            <td align="center" style="width: 25%;">
                &nbsp;</td>
            <td align="center" style="width: 75%;">
                <dx:ASPxLabel ID="ASPxLabel_MSG" runat="server" Width="100%" Font-Bold="True" ForeColor="Red">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="كلمه المرور الحاليه" Width="100%" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 75%;">
                <dx:ASPxTextBox ID="ASPxTextBox_CurrentPassword" runat="server" Width="100%" 
                    Password="true" ClientInstanceName="ASPxTextBox_CurrentPassword" 
                    EnableClientSideAPI="True">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" 
                        ValidationGroup="ChangePassword">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="كلمه المرور الجديده" Width="100%" Font-Bold="True">
                </dx:ASPxLabel></td>
            <td align="center" style="width: 75%;">
                            <dx:ASPxTextBox ID="ASPxTextBox_NewPassword" runat="server" Width="100%" 
                                Password="true" ClientInstanceName="ASPxTextBox_NewPassword" 
                                EnableClientSideAPI="True">
                                <ValidationSettings ErrorDisplayMode="None" ErrorText="" 
                                    ValidationGroup="ChangePassword">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                </dx:ASPxTextBox>
                </td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="تأكيد كلمه المرور الجديده" Width="100%" Font-Bold="True">
                </dx:ASPxLabel></td>
            <td align="center" style="width: 75%;">
                            <dx:ASPxTextBox ID="ASPxTextBox_ConfirmNewPassword" runat="server" Width="100%" 
                                Password="true" ClientInstanceName="ASPxTextBox_ConfirmNewPassword" 
                                EnableClientSideAPI="True">
                                <ValidationSettings ErrorDisplayMode="None" ErrorText="" 
                                    ValidationGroup="ChangePassword">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                </dx:ASPxTextBox>
                </td>
        </tr>
        <tr>
            <td align="center" style="width: 25%;">
                <dx:ASPxCallback ID="ASPxCallback_ChangePassword" runat="server" 
                    ClientInstanceName="ASPxCallback_ChangePassword">
                    <ClientSideEvents CallbackComplete="function(s, e) {
	ChangePassword_End(e);
}" />
                </dx:ASPxCallback>
               </td>
            <td align="center" style="width: 75%;">
                <dx:ASPxButton ID="ASPxButton_ChangePassword" runat="server" 
                    Text="تغيير كلمه المرور" Width="50%" AutoPostBack="False" 
                    ClientInstanceName="ASPxButton_ChangePassword" EnableClientSideAPI="True" 
                    ValidationGroup="ChangePassword" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	ChangePassword_Begin();
}" />
                    <Image Url="~/Images/Action_ResetPassword_32x32.png">
                    </Image>
                </dx:ASPxButton>
                </td>
        </tr>
    </table>
</asp:Content>
