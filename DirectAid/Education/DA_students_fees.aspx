<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DA_students_fees.aspx.vb" 
Inherits="DirectAid.DA_students_fees" MasterPageFile="~/Site.Master"%>
 
<%@ Register assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




<%@ Register Src="~/Education/UCBeneficiaryFeesV1.ascx" TagPrefix="uc1" TagName="UCBeneficiaryFeesV1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCBeneficiaryFeesV1 runat="server" id="UCBeneficiaryFeesV1" />
</asp:Content>