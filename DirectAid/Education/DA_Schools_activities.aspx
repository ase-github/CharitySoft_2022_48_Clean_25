<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="DA_Schools_activities.aspx.vb"
    Inherits="DirectAid.DA_Schools_activities" EnableSessionState="True" MasterPageFile="~/Site.Master" %>

<%@ Register Src="~/Education/UCSchoolActivitiesV1.ascx" TagPrefix="uc1" TagName="UCSchoolActivitiesV1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <title></title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:UCSchoolActivitiesV1 runat="server" id="UCSchoolActivitiesV1" />
</asp:Content>
