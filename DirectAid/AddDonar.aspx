<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AddDonar.aspx.vb" Inherits="DirectAid.AddDonor"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>
<%@ Register src="Donation/UCDonorV3.ascx" tagname="UCDonor" tagprefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <UC:UCDonor ID="_UCDonor" runat="server" />
    </asp:Content>
