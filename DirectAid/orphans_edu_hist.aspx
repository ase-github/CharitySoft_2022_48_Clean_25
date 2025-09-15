<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="orphans_edu_hist.aspx.vb" Inherits="DirectAid.orphans_edu_hist" %><%@ Register assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        
a:link
{
    color: #034af3;
}

        .dxICheckBox_Aqua 
{
    cursor: default;
	display: inline-block;
	margin: auto;
	vertical-align: middle;
}
.dxWeb_edtCheckBoxGrayed_Aqua {
	background-position: -190px -33px;
}

.dxWeb_edtCheckBoxChecked_Aqua,
.dxWeb_edtCheckBoxUnchecked_Aqua,
.dxWeb_edtCheckBoxGrayed_Aqua,
.dxWeb_edtCheckBoxCheckedDisabled_Aqua,
.dxWeb_edtCheckBoxUncheckedDisabled_Aqua,
.dxWeb_edtCheckBoxGrayedDisabled_Aqua {


}

.dxpControl_Aqua
{
	font: 12px Tahoma;
	color: #C7DFFF;
}
.dxpControl_Aqua td.dxpCtrl
{
	padding: 2px;
}
.dxpSummary_Aqua
{
	color: #749BCA;
	white-space: nowrap;
	text-align: center;
	vertical-align: middle;
	padding: 0px 4px;
}
.dxpDisabled_Aqua
{
	color: #A6A6A6;
	border-color: #A6A6A6;
	cursor: default;
}
.dxpDisabledButton_Aqua
{
	color: #000000;
	text-decoration: none;
}
.dxpButton_Aqua
{
	color: #3F66A0;
	text-decoration: underline;
	white-space: nowrap;
	text-align: center;
	vertical-align: middle;
}

.dxWeb_pPrevDisabled_Aqua {
    background-position: -105px -25px;
    width: 19px;
    height: 19px;
}

.dxWeb_pPopOut_Aqua,
.dxWeb_pPopOutDisabled_Aqua,
.dxWeb_pPopOutHover_Aqua,
.dxWeb_pPopOutPressed_Aqua,
.dxWeb_pAll_Aqua,
.dxWeb_pAllDisabled_Aqua,
.dxWeb_pPrev_Aqua,
.dxWeb_pPrevDisabled_Aqua,
.dxWeb_pNext_Aqua,
.dxWeb_pNextDisabled_Aqua,
.dxWeb_pLast_Aqua,
.dxWeb_pLastDisabled_Aqua,
.dxWeb_pFirst_Aqua,
.dxWeb_pFirstDisabled_Aqua,
.dxWeb_smBullet_Aqua,
.dxWeb_tiBackToTop_Aqua
{
	display:inline;
}

.dxWeb_rpHeaderTopLeftCorner_Aqua,
.dxWeb_rpHeaderTopRightCorner_Aqua,
.dxWeb_rpBottomLeftCorner_Aqua,
.dxWeb_rpBottomRightCorner_Aqua,
.dxWeb_rpTopLeftCorner_Aqua,
.dxWeb_rpTopRightCorner_Aqua,
.dxWeb_rpGroupBoxBottomLeftCorner_Aqua,
.dxWeb_rpGroupBoxBottomRightCorner_Aqua,
.dxWeb_rpGroupBoxTopLeftCorner_Aqua,
.dxWeb_rpGroupBoxTopRightCorner_Aqua,
.dxWeb_mHorizontalPopOut_Aqua,
.dxWeb_mVerticalPopOut_Aqua,
.dxWeb_mVerticalPopOutRtl_Aqua,
.dxWeb_mSubMenuItem_Aqua,
.dxWeb_mSubMenuItemChecked_Aqua,
.dxWeb_mScrollUp_Aqua,
.dxWeb_mScrollUpDisabled_Aqua,
.dxWeb_mScrollDown_Aqua,
.dxWeb_mScrollDownDisabled_Aqua,
.dxWeb_tcScrollLeft_Aqua,
.dxWeb_tcScrollRight_Aqua,
.dxWeb_tcScrollLeftHover_Aqua,
.dxWeb_tcScrollRightHover_Aqua,
.dxWeb_tcScrollLeftPressed_Aqua,
.dxWeb_tcScrollRightPressed_Aqua,
.dxWeb_tcScrollLeftDisabled_Aqua,
.dxWeb_tcScrollRightDisabled_Aqua,
.dxWeb_nbCollapse_Aqua,
.dxWeb_nbExpand_Aqua,
.dxWeb_splVSeparator_Aqua,
.dxWeb_splVSeparatorHover_Aqua,
.dxWeb_splHSeparator_Aqua,
.dxWeb_splHSeparatorHover_Aqua,
.dxWeb_splVCollapseBackwardButton_Aqua,
.dxWeb_splVCollapseBackwardButtonHover_Aqua,
.dxWeb_splHCollapseBackwardButton_Aqua,
.dxWeb_splHCollapseBackwardButtonHover_Aqua,
.dxWeb_splVCollapseForwardButton_Aqua,
.dxWeb_splVCollapseForwardButtonHover_Aqua,
.dxWeb_splHCollapseForwardButton_Aqua,
.dxWeb_splHCollapseForwardButtonHover_Aqua,
.dxWeb_pcCloseButton_Aqua,
.dxWeb_pcSizeGrip_Aqua,
.dxWeb_pcSizeGripRtl_Aqua,
.dxWeb_pPopOut_Aqua,
.dxWeb_pPopOutDisabled_Aqua,
.dxWeb_pPopOutHover_Aqua,
.dxWeb_pPopOutPressed_Aqua,
.dxWeb_pAll_Aqua,
.dxWeb_pAllDisabled_Aqua,
.dxWeb_pPrev_Aqua,
.dxWeb_pPrevDisabled_Aqua,
.dxWeb_pNext_Aqua,
.dxWeb_pNextDisabled_Aqua,
.dxWeb_pLast_Aqua,
.dxWeb_pLastDisabled_Aqua,
.dxWeb_pFirst_Aqua,
.dxWeb_pFirstDisabled_Aqua,
.dxWeb_tiBackToTop_Aqua,
.dxWeb_smBullet_Aqua,
.dxWeb_tvColBtn_Aqua,
.dxWeb_tvColBtnRtl_Aqua,
.dxWeb_tvExpBtn_Aqua,
.dxWeb_tvExpBtnRtl_Aqua,
.dxWeb_fmFolder_Aqua,
.dxWeb_fmFolderLocked_Aqua,
.dxWeb_fmCreateButton_Aqua,
.dxWeb_fmMoveButton_Aqua,
.dxWeb_fmRenameButton_Aqua,
.dxWeb_fmDeleteButton_Aqua,
.dxWeb_fmRefreshButton_Aqua,
.dxWeb_fmDwnlButton_Aqua,
.dxWeb_fmCreateButtonDisabled_Aqua,
.dxWeb_fmMoveButtonDisabled_Aqua,
.dxWeb_fmRenameButtonDisabled_Aqua,
.dxWeb_fmDeleteButtonDisabled_Aqua,
.dxWeb_fmRefreshButtonDisabled_Aqua,
.dxWeb_fmDwnlButtonDisabled_Aqua,
.dxWeb_ucClearButton_Aqua,
.dxWeb_ucClearButtonDisabled_Aqua {
  
}
.dxpCurrentPageNumber_Aqua
{
	color: #000000;
	text-decoration: none;
	padding: 0px 3px;
	background-color: #FFE7A2;
	border: 1px solid #FFBD69;
	white-space: nowrap;
}
.dxpPageNumber_Aqua
{
	color: #3F66A0;
	text-decoration: underline;
	text-align: center;
	vertical-align: middle;
	padding: 0px 5px;
}

.dxWeb_pNextDisabled_Aqua {
    background-position: -81px -25px;
    width: 19px;
    height: 19px;
}

        .style41
    {
        height: 22px;
    }
        </style>
</head>
<body>
    <form id="form1" runat="server" clientidmode="Static">
    <div>
    
                                <table bgcolor="#F1F7FC" cellspacing="1" dir="rtl" 
                                    
            style="width: 86%; height: 163px; margin-right: 74px;">
                                    <tr>
                                        <td class="style41" colspan="2">
                                                                    <dx:ASPxGridView ID="grd_Edu_log" runat="server" AutoGenerateColumns="False" 
                                                                        DataSourceID="Dts_edu_hist" Width="835px" 
                                                                        Theme="Aqua">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="رقم اليتيم" FieldName="app_ser" 
                                                                                VisibleIndex="0">
                                                                                <EditFormSettings Visible="False" />
                                                                                <editformsettings visible="False" />
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataDateColumn Caption="تاريخ التسجيل" FieldName="school_reg_date" 
                                                                                VisibleIndex="1">
                                                                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                                                                </PropertiesDateEdit>
                                                                            </dx:GridViewDataDateColumn>
                                                                            <dx:GridViewDataTextColumn Caption="اسم المؤسسة التعليمية" 
                                                                                FieldName="school_name_ar" VisibleIndex="2">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="السنة الدراسية" FieldName="acad_year_name" 
                                                                                VisibleIndex="3">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="مرحلة التعليم" FieldName="category_name_ar" 
                                                                                VisibleIndex="4">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="الصف" FieldName="class_name_ar" 
                                                                                VisibleIndex="5">
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="التقدير العام" FieldName="assesment_namear" 
                                                                                VisibleIndex="6">
                                                                                <EditFormSettings Visible="False" />
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                        <SettingsPager AlwaysShowPager="True">
                                                                        </SettingsPager>
                                                                        <Settings ShowFilterRow="True" />

                                                                    </dx:ASPxGridView>

                                                            </td>
                                    </tr>
                                    <tr>
                                        <td class="style41">
                                            <asp:SqlDataSource ID="Dts_edu_hist" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>" 
                                                SelectCommand="GetEducationHistory" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="lbl_app_ser" Name="app_ser" 
                                                        PropertyName="Text" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </td>
                                        <td class="style41">
                                            <asp:Label ID="lbl_app_ser" runat="server" Text="12"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
    
    </div>
    </form>
</body>
</html>
