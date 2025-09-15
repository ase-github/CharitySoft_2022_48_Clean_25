<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ApplicationPeriodicalReportsDonor.aspx.vb" Inherits="DirectAid.ApplicationPeriodicalReportsDonor" %>

<%@ Register src="Beneficiary/UCApplicationPeriodicalReportsDonor.ascx" tagname="UCApplicationPeriodicalReportsDonor" tagprefix="UC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <UC:UCApplicationPeriodicalReportsDonor ID="_UCApplicationPeriodicalReportsDonor" runat="server" />
</asp:Content>
