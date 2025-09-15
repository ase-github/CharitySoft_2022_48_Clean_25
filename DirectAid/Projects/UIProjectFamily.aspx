<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UIProjectFamily.aspx.vb" Inherits="DirectAid.UIProjectFamily" %>

<%@ Register src="UCProjectFamily.ascx" tagname="UCProjectFamily" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:UCProjectFamily ID="UCProjectFamily1" runat="server" />

</asp:Content>
