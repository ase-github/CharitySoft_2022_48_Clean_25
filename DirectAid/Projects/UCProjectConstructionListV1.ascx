<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectConstructionListV1.ascx.vb"
    Inherits="DirectAid.UCProjectConstructionListV1" %>
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

        //window.location.href = "UIProjectConstruction.aspx?project_id=" + ASPxGridView1.GetRowKey(e.visibleIndex);
        var url = "UIProjectConstruction.aspx?project_id=" + ASPxGridView1.GetRowKey(e.visibleIndex);
        window.open(url, '_blank');
    }

</script>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="LinqServerModeDataSource1" KeyFieldName="project_id" Caption="المشاريع"
    ClientInstanceName="ASPxGridView1" meta:resourcekey="ASPxGridView1Resource1" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
    <clientsideevents custombuttonclick="function(s, e) {
	OpenProject(e);
}" />
    <columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="10%">
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
                    <Image Url="~/Images/Edit_32x32.png">
                    </Image>
                </dx:GridViewCommandColumnCustomButton>
            </CustomButtons>
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewCommandColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="الدولة" FieldName="nat_code"
                                VisibleIndex="1" Width="15%">
                                <PropertiesComboBox CallbackPageSize="10" DataSourceID="SqlDataSource_Country"
                                    EnableCallbackMode="True" EnableClientSideAPI="True"
                                    IncrementalFilteringMode="Contains" TextField="nat_descrar"
                                    ValueField="nat_code" ValueType="System.Int16">
                                </PropertiesComboBox>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="refrence_no" VisibleIndex="2" Caption="المرجع" Width="10%">
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="project_id" VisibleIndex="1" Caption="الرقم" Width="10%">
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="project_name_ar" VisibleIndex="3" Caption="الاسم باللغه العربيه" Width="35%">
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
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project]"
    ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [project] WHERE [project_id] = @original_project_id">
    <DeleteParameters>
        <asp:Parameter Name="original_project_id" Type="Int32" />
    </DeleteParameters>
</asp:SqlDataSource>
<cc1:LinqServerModeDataSource ID="LinqServerModeDataSource1" runat="server" ContextTypeName="DirectAid.charitysoftEntities"
    TableName="view_project_list" />
<asp:SqlDataSource ID="SqlDataSource_Country" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoftConnectionString %>"
    SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>

