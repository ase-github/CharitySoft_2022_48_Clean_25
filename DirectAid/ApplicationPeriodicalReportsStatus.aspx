<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ApplicationPeriodicalReportsStatus.aspx.vb" Inherits="DirectAid.ApplicationPeriodicalReportsStatus" %>

<%@ Register src="Beneficiary/UCBeneficiarPeriodicalReportsStatus.ascx" tagname="UCBeneficiarPeriodicalReportsStatus" tagprefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <UC:UCBeneficiarPeriodicalReportsStatus ID="_UCBeneficiarPeriodicalReportsStatus" runat="server" />
</asp:Content>
