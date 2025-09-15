<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainData.Master"
    CodeBehind="UIHobby.aspx.vb" Inherits="DirectAid.UIHobby" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" %>
<%@ Register src="~/MainData/UCHobbyV1.ascx" tagname="UCHobbyV1" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:UCHobbyV1 ID="UCHobbyV11" runat="server" />

</asp:Content>
