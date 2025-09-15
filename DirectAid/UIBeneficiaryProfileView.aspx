<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIBeneficiaryProfileView.aspx.vb" Inherits="DirectAid.UIBeneficiaryProfileView"
    Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" MasterPageFile="~/Site.Master" %>

<%@ Register src="~/Donation/UCProjectProfileViewV1.ascx" tagname="UCDonorProfileViewV1" tagprefix="uc1" %>


<%@ Register src="Donation/UCBeneficiaryProfileViewV1.ascx" tagname="UCBeneficiaryProfileViewV1" tagprefix="uc2" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc2:UCBeneficiaryProfileViewV1 ID="UCBeneficiaryProfileViewV11" runat="server" />
    </asp:Content>
