<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectPhaseDetail.ascx.vb"
    Inherits="DirectAid.UCProjectPhaseDetail" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0"
    Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="UCProjectPhasePhoto.ascx" TagName="UCProjectPhasePhoto" TagPrefix="uc4" %>
<%@ Register src="UCProjectPhaseDocument.ascx" tagname="UCProjectPhaseDocument" tagprefix="uc1" %>
<%@ Register src="UCProjectPhaseNeed.ascx" tagname="UCProjectPhaseNeed" tagprefix="uc2" %>
<%@ Register src="UCProjectPhaseTransfer.ascx" tagname="UCProjectPhaseTransfer" tagprefix="uc3" %>
<dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" 
    Width="100%" meta:resourcekey="ASPxPageControl1Resource1">
    <TabPages>
        <dx:TabPage Text="Photos" meta:resourcekey="TabPageResource1">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True" 
                    meta:resourcekey="ContentControlResource1">
                    <uc4:UCProjectPhasePhoto ID="UCProjectPhasePhoto1" runat="server" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="Documents" meta:resourcekey="TabPageResource2">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True" 
                    meta:resourcekey="ContentControlResource2">
                    <uc1:UCProjectPhaseDocument ID="UCProjectPhaseDocument1" runat="server" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="Needs" meta:resourcekey="TabPageResource3">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True" 
                    meta:resourcekey="ContentControlResource3">
                    <uc2:UCProjectPhaseNeed ID="UCProjectPhaseNeed1" runat="server" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="التحويلات">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                    <uc3:UCProjectPhaseTransfer ID="UCProjectPhaseTransfer1" runat="server" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
    </TabPages>
</dx:ASPxPageControl>
