<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="UIBankDisk.aspx.vb" Inherits="DirectAid.UIBankDisk" Culture="auto"
    meta:resourcekey="PageResource1" UICulture="auto" %>


<%@ Register Src="BankDisk/UCBankDiskV3.ascx" TagName="UCBankDisk" TagPrefix="uc" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc:UCBankDisk ID="_UCBankDisk" runat="server"/>
</asp:Content>
