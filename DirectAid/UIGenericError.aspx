<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="UIGenericError.aspx.vb" Inherits="DirectAid.UIGenericError" %>

<%@ Register src="UCGenericError.ascx" tagname="UCGenericError" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:UCGenericError ID="UCGenericError1" runat="server" />

</asp:Content>
