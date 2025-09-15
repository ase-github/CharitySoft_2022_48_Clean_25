<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="UIGenericReportList.aspx.vb" Inherits="DirectAid.UIGenericReportList" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" %>



<%@ Register src="Reporting/UCGenericReportListV1.ascx" tagname="UCGenericReportListV1" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCGenericReportListV1 ID="UCGenericReportListV11" runat="server" />
    </asp:Content>
