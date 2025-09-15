<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="BeneficiaryList.aspx.vb" Inherits="DirectAid.BeneficiaryList" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" %>


<%@ Register src="Beneficiary/UCBeneficiaryListV1.ascx" tagname="UCBeneficiaryList" tagprefix="UC" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <UC:UCBeneficiaryList ID="_UCBeneficiaryList" runat="server" />
</asp:Content>
