<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UIProjectDevelopmentList.aspx.vb" Inherits="DirectAid.UIProjectDevelopmentList" %>
<%@ Register src="~/Projects/UCProjectDevelopmentListV1.ascx" tagname="UCProjectList" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCProjectList ID="UCProjectList1" runat="server" />
</asp:Content>
