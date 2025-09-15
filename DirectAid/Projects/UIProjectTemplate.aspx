<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="UIProjectTemplate.aspx.vb" Inherits="DirectAid.UIProjectTemplate" %>

<%@ Register Src="UCProjectTemplate.ascx" TagName="UCProjectTemplate" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCProjectTemplate ID="UCProjectTemplate1" runat="server" />
</asp:Content>
