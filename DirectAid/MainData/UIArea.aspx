<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainData.Master"
    CodeBehind="UIArea.aspx.vb" Inherits="DirectAid.UIArea" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" %>

<%@ Register src="~/MainData/UCAreaV1.ascx" tagname="UCAreaV1" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:UCAreaV1 ID="UCAreaV11" runat="server" />

</asp:Content>
