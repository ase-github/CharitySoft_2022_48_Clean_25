<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UIProjectRemark.aspx.vb" Inherits="DirectAid.UIProjectRemark" %>
<%@ Register src="UCProjectRemark.ascx" tagname="UCProjectRemark" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCProjectRemark ID="UCProjectRemark1" runat="server" />
</asp:Content>
