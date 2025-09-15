<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SchoolsEmployees.aspx.vb" Inherits="DirectAid.SchoolsEmployees" %>

<%@ Register Src="~/Education/UCSchoolsEmployeesV1.ascx" TagPrefix="uc1" TagName="UCSchoolsEmployeesV1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCSchoolsEmployeesV1 runat="server" ID="UCSchoolsEmployeesV1" />
</asp:Content>
