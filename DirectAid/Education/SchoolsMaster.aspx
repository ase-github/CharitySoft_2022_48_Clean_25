<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SchoolsMaster.aspx.vb" Inherits="DirectAid.SchoolsMaster" %>

<%@ Register Src="~/Education/UCSchoolsMasterV1.ascx" TagPrefix="uc1" TagName="UCSchoolsMasterV1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCSchoolsMasterV1 runat="server" ID="UCSchoolsMasterV1" />
</asp:Content>
