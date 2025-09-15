<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="UIProjectConstruction.aspx.vb" Inherits="DirectAid.UIProjectConstruction" %>

<%@ Register src="~/Projects/UCProjectConstructionV1.ascx" tagname="Project" tagprefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <UC:Project ID="Project1" runat="server" />
    <%--<asp:PlaceHolder runat="server" ID="PlaceHolder1"></asp:PlaceHolder>--%>

</asp:Content>
