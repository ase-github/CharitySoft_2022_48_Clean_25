<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectBudget.ascx.vb"
    Inherits="DirectAid.UCProjectBudget" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<%@ Register Src="UCProjectDetail.ascx" TagName="UCProjectDetail" TagPrefix="uc1" %>

<%@ Register Src="UCProject.ascx" TagName="UCProject" TagPrefix="uc2" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx1" %>
<%  If (DesignMode) Then%>
<script src="ASPxScriptIntelliSense.js" type="text/javascript"></script>
<%  End If%>
<script type="text/javascript">

    function OpenProject(e) {

        //        window.open("UIProject.aspx?GUID=" + ASPxGridView1.GetRowKey(e.visibleIndex), "", "", "");

        // window.open("UIProject.aspx?GUID=" + ASPxGridView1.GetRowKey(e.visibleIndex), 'Popup', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=600');

        window.location.href = "UIProject.aspx?project_id=" + ASPxGridView1.GetRowKey(e.visibleIndex);
    }

</script>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource_Project" KeyFieldName="project_id" Caption="Projects"
    ClientInstanceName="ASPxGridView1" >
    <ClientSideEvents CustomButtonClick="function(s, e) {
	OpenProject(e);
}" />
    <Columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="5%">
            <ClearFilterButton Visible="True">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </ClearFilterButton>
            <CustomButtons>
                <dx:GridViewCommandColumnCustomButton>
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:GridViewCommandColumnCustomButton>
            </CustomButtons>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="project_id" VisibleIndex="1" Caption="رقم المشروع"
            Width="10%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="project_name_ar" VisibleIndex="2" Caption="اسم المشروع"
            Width="25%">
            <EditFormSettings ColumnSpan="3" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="project_name_en" VisibleIndex="3" Caption="Name (English)"
            Visible="False">
            <EditFormSettings ColumnSpan="3" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="التكلفه الفعليه" FieldName="actaul_budget" VisibleIndex="4"
            Width="20%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="التكلفه المتوقعه" FieldName="projected_budget"
            VisibleIndex="5" Width="20%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الفارق" FieldName="difference" VisibleIndex="7"
            Width="20%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
    <SettingsPager PageSize="5">
        <PageSizeItemSettings ShowAllItem="True" Visible="True" Items="5, 10, 20, 50, 100, 200">
        </PageSizeItemSettings>
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" />
    <Settings ShowFilterRow="True" EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True"
        ShowHeaderFilterButton="True" />
    <SettingsText ConfirmDelete="هل تريد حذف المشروع ؟" />
    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" />
    <Templates>
        <DetailRow>
            <uc1:UCProjectDetail ID="UCProjectDetail1" runat="server" />
        </DetailRow>
    </Templates>
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource_Project" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [view_project_budget]">
</asp:SqlDataSource>
