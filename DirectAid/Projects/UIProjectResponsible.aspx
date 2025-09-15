<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UIProjectResponsible.aspx.vb" Inherits="DirectAid.UIProjectResponsible" %>
<%@ Register src="~/Projects/UCProjectOfficalsV1.ascx" tagname="ProjectOfficals" tagprefix="UC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <UC:ProjectOfficals ID="UCProjectOfficalsV1" runat="server" />
</asp:Content>
