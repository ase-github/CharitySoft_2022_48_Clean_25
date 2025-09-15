<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiarPeriodicalReports.ascx.vb"
    Inherits="DirectAid.UCBeneficiaryPeriodicalReports" %>
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
            alert("تم اضافة التقرير الدوري بنجاح.");
            ASPxGridView1.Refresh();
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
<asp:HiddenField ID="HiddenField_app_type" runat="server" Value="0"
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

                            <dx:ASPxButton runat="server" AutoPostBack="False" UseSubmitBehavior="False" ClientInstanceName="ASPxButton_Save" EnableClientSideAPI="True" Text="انشاء تقرير دوري جديد" Width="25%" Font-Bold="True" ID="ASPxButton_Save">
<ClientSideEvents Click="function(s, e) {
	Save_Begin();
}"></ClientSideEvents>

<Image Url="~/Images/Refresh_32x32.png"></Image>
</dx:ASPxButton>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
    KeyFieldName="ReportID" Width="100%" ClientInstanceName="ASPxGridView1" EnableCallbackAnimation="True" DataSourceID="SqlDataSource1">
    <Settings ShowFilterRow="True"></Settings>
    <Columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="15%" Visible="False">
            <EditButton>
                <Image Url="~/Images/Edit_32x32.png">
                </Image>
            </EditButton>
            <NewButton>
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
        <dx:GridViewDataTextColumn FieldName="attach_ser" ReadOnly="True" VisibleIndex="7"
            Caption="م" Width="10%" Visible="False">
            <EditFormSettings Visible="False" />
            <EditFormSettings Visible="False"></EditFormSettings>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="app_ser" VisibleIndex="9" Visible="False">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="AddedDate" VisibleIndex="1" Caption="تاريخ الانشاء"
            Width="15%">
            <PropertiesDateEdit DisplayFormatString="">
                <ValidationSettings ErrorText="*">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="الوصف" FieldName="DescAR" VisibleIndex="3" Width="55%">
            <PropertiesTextEdit DisplayFormatString="{0}">
            </PropertiesTextEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataColumn Caption="فتح / تنزيل" FieldName="attachment_image" VisibleIndex="7" Width="15%">
            <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Height="75px" NavigateUrl='<%# Eval("ReportPath")%>' Text="فتح / تنزيل" ImageHeight="26px" ImageUrl="~/Images/download_report_icon_26x26.png" ImageWidth="26px" Target="_blank">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
        <dx:GridViewDataTextColumn Caption="بواسطة" FieldName="AddedBy" VisibleIndex="2" Width="15%">
            <PropertiesTextEdit DisplayFormatString="d">
                <ValidationSettings ErrorText="*">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesTextEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الحالة" FieldName="ReportStatusDesc" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ الاعتماد" FieldName="ApprovedDate" VisibleIndex="5">
            <PropertiesDateEdit DisplayFormatString="">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="بواسطة" FieldName="AprovedBy" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="ReportID" Visible="False" VisibleIndex="8">
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <Settings ShowFilterRow="True" />
    <SettingsText ConfirmDelete="هل تريد الحذف ؟" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT ReportID, BeneficiaryType, BeneficiaryID, DonorID, DescAR, ReportPath, AddedDate, AddedBy, ReportStatus, ApprovedDate, AprovedBy, Notes, CASE WHEN ReportStatus = 0 THEN 'غير معتمد' ELSE 'معتمد' END AS ReportStatusDesc FROM TBL_BeneficiarPeriodicalReports WHERE (BeneficiaryID = @BeneficiaryID)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [TBL_BeneficiarPeriodicalReports] WHERE [ReportID] = @original_ReportID " OldValuesParameterFormatString="original_{0}">
    <DeleteParameters>
        <asp:Parameter Name="original_ReportID" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField_app_ser" DefaultValue="0" Name="BeneficiaryID" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>

