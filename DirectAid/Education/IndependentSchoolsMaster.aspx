<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="IndependentSchoolsMaster.aspx.vb" Inherits="DirectAid.IndependentSchoolsMaster" %>

<%@ Register Src="~/Education/UCSchoolsMasterIndependentV1.ascx" TagPrefix="uc1" TagName="UCSchoolsMasterIndependentV1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCSchoolsMasterIndependentV1 runat="server" ID="UCSchoolsMasterIndependentV1" />
</asp:Content>
