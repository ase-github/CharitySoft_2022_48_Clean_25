<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryAttachV2.ascx.vb"
    Inherits="DirectAid.UCBeneficiaryAttachV2" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<script type="text/javascript">
    function OnUpdateClick() {
        uploader.UploadFile();
    }

    function Save_Begin() {
                ASPxButton_Save.SetEnabled(false);
                ASPxLoadingPanel1.Show();
                ASPxCallback_Save.PerformCallback(null);
    }

    function Save_End(e) {

        var result = e.result;

        if (result == "OK") {
            alert("تم تحديث الصوره الرقميه.");
        }
        else {
            alert("حدث خطأ" + result);
        }

        ASPxButton_Save.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function Save_Error(e) {
        alert(e.message);
        ASPxButton_Save.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

</script>
<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<asp:HiddenField ID="HiddenField_app_ser" runat="server" Value="0"
    ViewStateMode="Enabled" />
<dx:ASPxCallback runat="server" ClientInstanceName="ASPxCallback_Save" ID="ASPxCallback_Save">
    <ClientSideEvents CallbackComplete="function(s, e) {
	Save_End(e);
}"
        CallbackError="function(s, e) {
	Save_Error(e);
}"></ClientSideEvents>
</dx:ASPxCallback>

<dx:ASPxLoadingPanel runat="server" Modal="True" ClientInstanceName="ASPxLoadingPanel1" Font-Bold="True" ID="ASPxLoadingPanel1"></dx:ASPxLoadingPanel>

                            <dx:ASPxButton runat="server" AutoPostBack="False" UseSubmitBehavior="False" ClientInstanceName="ASPxButton_Save" EnableClientSideAPI="True" Text="تحديث الصوره الرقميه" Width="25%" Font-Bold="True" ID="ASPxButton_Save">
<ClientSideEvents Click="function(s, e) {
	Save_Begin();
}"></ClientSideEvents>

<Image Url="~/Images/Refresh_32x32.png"></Image>
</dx:ASPxButton>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource1"
    KeyFieldName="attach_ser" Width="100%" ClientInstanceName="ASPxGridView1" EnableCallbackAnimation="True">
    <Settings ShowFilterRow="True"></Settings>
    <Columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="15%">
            <EditButton Visible="True">
                <Image Url="~/Images/Edit_32x32.png">
                </Image>
            </EditButton>
            <NewButton Visible="True">
                <Image Url="~/Images/New_32x32.png">
                </Image>
            </NewButton>
            <DeleteButton Visible="True">
                <Image Url="~/Images/Delete_32x32.png">
                </Image>
            </DeleteButton>
            <CancelButton>
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </CancelButton>
            <UpdateButton>
                <Image Url="~/Images/Save_32x32.png">
                </Image>
            </UpdateButton>
            <ClearFilterButton Visible="True">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </ClearFilterButton>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="attach_ser" ReadOnly="True" VisibleIndex="5"
            Caption="م" Width="10%" Visible="False">
            <EditFormSettings Visible="False" />
            <EditFormSettings Visible="False"></EditFormSettings>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="app_ser" VisibleIndex="5" Visible="False">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="النوع" FieldName="attach_code" VisibleIndex="1"
            Width="15%">
            <PropertiesComboBox DataSourceID="EntityDataSource2" TextField="type_name" ValueField="type_id"
                ValueType="System.Byte">
                <ValidationSettings ErrorText="*">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataHyperLinkColumn Caption="المرفق" FieldName="attachment_image" VisibleIndex="3" Width="55%">
            <EditFormSettings ColumnSpan="2" />
            <DataItemTemplate>
                <dx:ASPxImage ID="ASPxImage1" runat="server" Height="75px" ImageUrl='<%# Eval("attachment_image") %>' LoadingImageUrl="~/Images/Action_FileAttachment_Attach_32x32.png" ShowLoadingImage="True" Width="100px">
                    <EmptyImage Height="32px" Width="32px" AlternateText="لا توجد صوره">
                    </EmptyImage>
                </dx:ASPxImage>
            </DataItemTemplate>
            <EditItemTemplate>
                <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ClientInstanceName="uploader" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" Size="35" Width="100%">
                    <ValidationSettings MaxFileSize="4000000">
                    </ValidationSettings>
                    <ClientSideEvents FileUploadComplete="function(s, e) { if (e.isValid) { ASPxGridView1.UpdateEdit(); }}" />
                    <UploadButton Text="تحميل المرفق ثم الحفظ">
                        <Image Url="~/Images/Upload_32x32.png">
                        </Image>
                    </UploadButton>
                </dx:ASPxUploadControl>
            </EditItemTemplate>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataHyperLinkColumn>
        <dx:GridViewDataColumn Caption="فتح / تنزيل" FieldName="attachment_image" VisibleIndex="4" Width="15%">
            <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Height="75px" NavigateUrl='<%# Eval("attachment_image") %>' Text="فتح / تنزيل" ImageHeight="26px" ImageUrl="~/Images/download_report_icon_26x26.png" ImageWidth="26px" Target="_blank">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
        <dx:GridViewDataDateColumn FieldName="attach_date" VisibleIndex="2" Caption="التاريخ"
            Width="15%">
            <PropertiesDateEdit>
                <ValidationSettings ErrorText="*">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataDateColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <Settings ShowFilterRow="True" />
    <SettingsText ConfirmDelete="هل تريد الحذف ؟" />
</dx:ASPxGridView>
<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False"
    EnableInsert="True" EnableUpdate="True" EntitySetName="application_attach" AutoGenerateWhereClause="True"
    Where="">
    <WhereParameters>
        <asp:ControlParameter ControlID="HiddenField_app_ser" DefaultValue="0" Name="app_ser"
            PropertyName="Value" Type="Int32" />
    </WhereParameters>
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="application_attach_type">
</asp:EntityDataSource>
