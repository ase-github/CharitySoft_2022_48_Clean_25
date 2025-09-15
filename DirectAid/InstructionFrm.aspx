<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InstructionFrm.aspx.vb"
    Inherits="DirectAid.InstructionFrm" meta:resourcekey="PageResource1" Culture="auto"
    UICulture="auto" ClientIDMode="Static" MasterPageFile="~/Site.Master" %>

<%@ Register src="Donation/UCDeductionV1.ascx" tagname="UCDeductionV1" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCDeductionV1 ID="UCDeductionV11" runat="server" />
    </asp:Content>
