<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="UIProjectPlan.aspx.vb" Inherits="DirectAid.UIProjectPlan" %>

<%@ Register Src="UCProjectTemplate.ascx" TagName="UCProjectTemplate" TagPrefix="uc1" %>
<%@ Register src="UCProjectPlan.ascx" tagname="UCProjectPlan" tagprefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc2:UCProjectPlan ID="UCProjectPlan1" runat="server" />
</asp:Content>
