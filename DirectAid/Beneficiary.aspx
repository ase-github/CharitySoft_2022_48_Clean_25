<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="Beneficiary.aspx.vb" Inherits="DirectAid.Beneficiary" %>

<%@ Register Src="~/Beneficiary/UCBeneficiaryV2.ascx" TagPrefix="UC" TagName="UCBeneficiary" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <UC:UCBeneficiary ID="_UCBeneficiary" runat="server" />
</asp:Content>


