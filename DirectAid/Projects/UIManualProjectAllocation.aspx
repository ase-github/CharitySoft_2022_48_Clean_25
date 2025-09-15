<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="UIManualProjectAllocation.aspx.vb" Inherits="DirectAid.UIManualProjectAllocation" %>

<%@ Register src="UCManualProjectAllocation.ascx" tagname="UCManualProjectAllocation" tagprefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc3:UCManualProjectAllocation ID="UCManualProjectAllocation1" runat="server" />
</asp:Content>
