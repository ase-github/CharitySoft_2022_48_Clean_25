<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectDetail.ascx.vb"
    Inherits="DirectAid.UCProjectDetail" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0"
    Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register src="UCProjectPhase.ascx" tagname="UCProjectPhase" tagprefix="uc1" %>
<%@ Register src="UCProjectRemark.ascx" tagname="UCProjectRemark" tagprefix="uc2" %>
<%@ Register src="UCProjectResponsible.ascx" tagname="UCProjectResponsible" tagprefix="uc3" %>
<dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" 
    Width="100%" meta:resourcekey="ASPxPageControl1Resource1">
    <TabPages>
        <dx:TabPage Text="Phases" meta:resourcekey="TabPageResource1">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True" 
                    meta:resourcekey="ContentControlResource1">
                    <uc1:UCProjectPhase ID="UCProjectPhase1" runat="server" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="Remarks" meta:resourcekey="TabPageResource2">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True" 
                    meta:resourcekey="ContentControlResource2">
                    <uc2:UCProjectRemark ID="UCProjectRemark1" runat="server" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="Responsibles" meta:resourcekey="TabPageResource3">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True" 
                    meta:resourcekey="ContentControlResource3">
                    <uc3:UCProjectResponsible ID="UCProjectResponsible1" runat="server" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
    </TabPages>
</dx:ASPxPageControl>

