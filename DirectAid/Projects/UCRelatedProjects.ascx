<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCRelatedProjects.ascx.vb"
    Inherits="DirectAid.UCRelatedProjects" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<%@ Register Src="UCProjectDetail.ascx" TagName="UCProjectDetail" TagPrefix="uc1" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>
<%  If (DesignMode) Then%>
<script src="ASPxScriptIntelliSense.js" type="text/javascript"></script>
<%  End If%>
<script type="text/javascript">

    function OpenProject(e) {

        //        window.open("UIProject.aspx?GUID=" + ASPxGridView1.GetRowKey(e.visibleIndex), "", "", "");

        // window.open("UIProject.aspx?GUID=" + ASPxGridView1.GetRowKey(e.visibleIndex), 'Popup', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=600');

        window.location.href = "UIProjectConstruction.aspx?project_id=" + ASPxGridView1.GetRowKey(e.visibleIndex);
    }

</script>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource_Project" KeyFieldName="project_id" Caption="مشاريع مشتركة في الموقع"
    ClientInstanceName="ASPxGridView1" meta:resourcekey="ASPxGridView1Resource1" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
    <clientsideevents custombuttonclick="function(s, e) {
	OpenProject(e);
}" />
    <columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="20%">
            <EditButton>
                <Image Url="~/Images/Edit_32x32.png">
                </Image>
            </EditButton>
            <NewButton>
                <Image Url="~/Images/New_32x32.png">
                </Image>
            </NewButton>
            <DeleteButton>
                <Image Url="~/Images/Delete_32x32.png">
                </Image>
            </DeleteButton>
            <CancelButton Visible="True">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </CancelButton>
            <UpdateButton Visible="True">
                <Image Url="~/Images/Save_32x32.png">
                </Image>
            </UpdateButton>
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
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="refrence_no" VisibleIndex="2" Caption="المرجع" Width="20%">
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="project_id" VisibleIndex="1" Caption="الرقم" Width="20%">
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="project_name_ar" VisibleIndex="3" Caption="الاسم باللغه العربيه" Width="20%">
            <EditFormSettings ColumnSpan="3" />
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="project_name_en" VisibleIndex="4" Caption="الاسم باللغه الانجليزيه" Width="20%">
            <EditFormSettings ColumnSpan="3" />
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
    </columns>
    <settingsbehavior confirmdelete="True" enablecustomizationwindow="True" />
    <settingspager>
        <PageSizeItemSettings ShowAllItem="True" Visible="True" Items="5, 10, 20, 50, 100, 200">
        </PageSizeItemSettings>
    </settingspager>
    <settingsediting editformcolumncount="3" />
    <settings showfilterrow="True" />
    <settingstext confirmdelete="هل تريد حذف المشروع ؟" />
    <settingsdetail allowonlyonemasterrowexpanded="True" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource_Project" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SP_SELECT_RelatedProjects"
    ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [project] WHERE [project_id] = @original_project_id" SelectCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:Parameter Name="original_project_id" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="project_id" QueryStringField="project_id" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>


