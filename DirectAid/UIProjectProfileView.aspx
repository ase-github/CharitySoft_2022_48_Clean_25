<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIProjectProfileView.aspx.vb" Inherits="DirectAid.UIProjectProfileView"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" MasterPageFile="~/Site.Master" %>
<%@ Register src="Donation/UCProjectProfileViewV1.ascx" tagname="UCProjectProfileViewV1" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCProjectProfileViewV1 ID="UCProjectProfileViewV11" runat="server" />
    </asp:Content>
