<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Collection.aspx.vb" Inherits="DirectAid.Collection"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" ClientIDMode="Static"
    SmartNavigation="true" MasterPageFile="~/Site.Master" %>

<%@ Register src="Donation/UCCollectionV12.ascx" tagname="UCCollection" tagprefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title>Direct Aid - Collection</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <UC:UCCollection ID="_UCCollectionV" runat="server" />
</asp:Content>
