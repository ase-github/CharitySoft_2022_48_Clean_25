<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="UISystemReport.aspx.vb" Inherits="DirectAid.UISystemReport" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" %>


<%@ Register src="Settings/UCSystemReportV1.ascx" tagname="UCSystemReportV1" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCSystemReportV1 ID="UCSystemReportV11" runat="server" />
</asp:Content>
