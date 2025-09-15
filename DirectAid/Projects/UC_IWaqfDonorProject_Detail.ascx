<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UC_IWaqfDonorProject_Detail.ascx.vb"
    Inherits="DirectAid.UC_IWaqfDonorProject_Detail" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>



<%@ Register Src="UCProjectPhase.ascx" TagName="UCProjectPhase" TagPrefix="uc1" %>
<%@ Register Src="UCProjectRemark.ascx" TagName="UCProjectRemark" TagPrefix="uc2" %>
<%@ Register Src="UCProjectResponsible.ascx" TagName="UCProjectResponsible" TagPrefix="uc3" %>
<%@ Register Src="UC_VIEW_WaqfDonorList.ascx" TagName="UC_VIEW_WaqfDonorList" TagPrefix="uc4" %>
<%@ Register Src="UC_VIEW_WaqfProjectsNamesList.ascx" TagName="UC_VIEW_WaqfProjectsNamesList"
    TagPrefix="uc5" %>
    <%@ Register Src="UC_waqf_rev.ascx" TagName="UC_waqf_rev"
    TagPrefix="uc6" %>
<dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%"
    meta:resourcekey="ASPxPageControl1Resource1">
    <TabPages>
        <dx:TabPage Text="المتبرعين" meta:resourcekey="TabPageResource1">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True" meta:resourcekey="ContentControlResource1">
                    <uc4:UC_VIEW_WaqfDonorList ID="UC_VIEW_WaqfDonorList1" runat="server" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="اسماء المشاريع" meta:resourcekey="TabPageResource2">
            <ContentCollection>
                <dx:ContentControl runat="server" SupportsDisabledAttribute="True" meta:resourcekey="ContentControlResource2">
                    <uc5:UC_VIEW_WaqfProjectsNamesList ID="UC_VIEW_WaqfProjectsNamesList1" runat="server" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="عوائد الوقف">
            <ContentCollection>
                <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                    <uc6:UC_waqf_rev ID="UC_waqf_rev1" runat="server" />
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
    </TabPages>
</dx:ASPxPageControl>
