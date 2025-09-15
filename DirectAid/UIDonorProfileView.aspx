<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIDonorProfileView.aspx.vb" Inherits="DirectAid.UIDonorProfileView"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" MasterPageFile="~/Site.Master" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>
<%@ Register src="Donation/UCDonorV2.ascx" tagname="UCDonor" tagprefix="UC" %>

<%@ Register src="Donation/UCDonorProfileViewV1.ascx" tagname="UCDonorProfileViewV1" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCDonorProfileViewV1 ID="UCDonorProfileViewV11" runat="server" />
    </asp:Content>
