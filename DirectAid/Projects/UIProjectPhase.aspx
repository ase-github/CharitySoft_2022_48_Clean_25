<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UIProjectPhase.aspx.vb" Inherits="DirectAid.UIProjectPhase" %>
<%@ Register src="UCProjectPhase.ascx" tagname="UCProjectPhase" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCProjectPhase ID="UCProjectPhase1" runat="server" />
</asp:Content>
