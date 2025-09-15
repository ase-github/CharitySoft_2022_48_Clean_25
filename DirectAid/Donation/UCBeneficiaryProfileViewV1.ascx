<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryProfileViewV1.ascx.vb"
    Inherits="DirectAid.UCBeneficiaryProfileViewV1" %>



<%@ Register Namespace="DevExpress.XtraCharts.Web" TagPrefix="Web" %>
<%@ Register Assembly="DevExpress.XtraCharts.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.XtraCharts.v25.1.Web, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>


<%@ Register src="UCDonorHeaderV1.ascx" tagname="UCDonorHeaderV1" tagprefix="uc2" %>
<%@ Register src="../Projects/UCProjectPhaseDetail.ascx" tagname="ucprojectphasedetail" tagprefix="uc1" %>
<%@ Register src="UCProjectHeaderV1.ascx" tagname="UCProjectHeaderV1" tagprefix="uc3" %>
<%@ Register src="UCBeneficiaryHeaderV1.ascx" tagname="UCBeneficiaryHeaderV1" tagprefix="uc4" %>
<style type="text/css">
.dxgvControl,
.dxgvDisabled
{
	border: 1px Solid #9F9F9F;
	font: 12px Tahoma, Geneva, sans-serif;
	background-color: #F2F2F2;
	color: Black;
	cursor: default;
}
.dxgvTable
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxgvTable
{
	background-color: White;
	border-width: 0;
	border-collapse: separate!important;
	overflow: hidden;
	color: Black;
}
.dxgvHeader
{
	cursor: pointer;
	white-space: nowrap;
	padding: 4px 6px 5px;
	border: 1px Solid #9F9F9F;
	background-color: #DCDCDC;
	overflow: hidden;
	font-weight: normal;
	text-align: left;
}
.dxgvFilterRow
{
	background-color: #E7E7E7;
}
.dxgvCommandColumn
{
	padding: 2px;
}
.dxeTrackBar, 
.dxeIRadioButton, 
.dxeButtonEdit, 
.dxeTextBox, 
.dxeRadioButtonList, 
.dxeCheckBoxList, 
.dxeMemo, 
.dxeListBox, 
.dxeCalendar, 
.dxeColorTable
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxeTextBox,
.dxeButtonEdit,
.dxeIRadioButton,
.dxeRadioButtonList,
.dxeCheckBoxList
{
    cursor: default;
}

.dxeTextBox,
.dxeMemo
{
	background-color: white;
	border: 1px solid #9f9f9f;
}

.dxeTextBoxSys, 
.dxeMemoSys 
{
    border-collapse:separate!important;
}

*[dir="rtl"].dxeTextBoxSys .dxeEditAreaSys 
{
    *padding-right: 2px;
}

.dxeTextBox .dxeEditArea
{
	background-color: white;
}
noindex:-o-prefocus, *[dir="rtl"] .dxeEditAreaSys 
{
    padding-right: 1px;
}

    *[dir="rtl"] .dxeEditAreaSys 
    {
        padding-right: 1px;
    }
    *[dir="rtl"] .dxeEditAreaSys 
{
    padding-right: 1px\0/;
}

.dxeEditArea
{
	font: 12px Tahoma, Geneva, sans-serif;
	border: 1px solid #A0A0A0;
}
.dxeEditAreaSys 
{
    height: 14px;
    line-height: 14px;
    border: 0px!important;
	padding: 0px 1px 0px 0px; /* B146658 */
    background-position: 0 0; /* iOS Safari */
}
.dxgvFooter
{
	background-color: #D7D7D7;
	white-space: nowrap;
}

.dxgvPagerTopPanel,
.dxgvPagerBottomPanel
{
	padding-top: 4px;
	padding-bottom: 4px;
}

    </style>


<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<script type="text/javascript">

</script>

<table width="100%" align="center">
    <tr>
        <td align="center" style="width: 100%">
            <uc2:UCDonorHeaderV1 ID="UCDonorHeaderV11" runat="server" />

        </td>
    </tr>
    <tr>
        <td align="center" style="width: 100%"></td>
    </tr>
    <tr>
        <td align="center" style="width: 100%">
            <uc4:UCBeneficiaryHeaderV1 ID="UCBeneficiaryHeaderV11" runat="server" />
        </td>
    </tr>
    <tr>
        <td align="center" style="width: 100%">&nbsp;</td>
    </tr>
    <tr>
        <td align="center" style="width: 100%">
            &nbsp;</td>
    </tr>
    </table>
