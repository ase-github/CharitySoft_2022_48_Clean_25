<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UIProjectBudget.aspx.vb" Inherits="DirectAid.UIProjectBudget" %>
<%@ Register src="UCProjectBudget.ascx" tagname="UCProjectBudget" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCProjectBudget ID="UCProjectBudget1" runat="server" />
</asp:Content>
