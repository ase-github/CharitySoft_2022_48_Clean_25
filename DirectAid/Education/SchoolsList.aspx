<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SchoolsList.aspx.vb" Inherits="DirectAid.SchoolsList" %>
<%@ Register src="UCSchoolsListV1.ascx" tagname="UCSchoolsListV1" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCSchoolsListV1 ID="UCSchoolsListV11" runat="server" />
</asp:Content>
