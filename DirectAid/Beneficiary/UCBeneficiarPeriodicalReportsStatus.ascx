<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiarPeriodicalReportsStatus.ascx.vb"
    Inherits="DirectAid.UCBeneficiarPeriodicalReportsStatus" %>
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
            alert("تم اعتماد التقرير / التقارير بنجاح.");
            ASPxGridView1.Refresh();
        }
        else {
            alert(" حدث خطأ " + result);
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

                            <dx:ASPxButton runat="server" AutoPostBack="False" UseSubmitBehavior="False" ClientInstanceName="ASPxButton_Save" EnableClientSideAPI="True" Text="اعتماد التقرير / التقارير" Width="25%" Font-Bold="True" ID="ASPxButton_Save">
<ClientSideEvents Click="function(s, e) {
	Save_Begin();
}"></ClientSideEvents>

<Image Url="~/Images/Refresh_32x32.png"></Image>
</dx:ASPxButton>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
    KeyFieldName="ReportID" Width="100%" ClientInstanceName="ASPxGridView1" EnableCallbackAnimation="True" DataSourceID="SqlDataSource1">
    <Settings ShowFilterRow="True"></Settings>
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" ShowSelectCheckbox="True">
            <ClearFilterButton Visible="True">
            </ClearFilterButton>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="attach_ser" ReadOnly="True" VisibleIndex="10"
            Caption="م" Visible="False">
            <EditFormSettings Visible="False" />
            <EditFormSettings Visible="False"></EditFormSettings>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="app_ser" VisibleIndex="13" Visible="False">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="AddedDate" VisibleIndex="5" Caption="تاريخ الانشاء"
            Width="12%">
            <PropertiesDateEdit DisplayFormatString="">
                <ValidationSettings ErrorText="*">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataColumn Caption="فتح / تنزيل" FieldName="attachment_image" VisibleIndex="11" Width="10%">
            <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Height="75px" NavigateUrl='<%# Eval("ReportPath")%>' Text="فتح / تنزيل" ImageHeight="26px" ImageUrl="~/Images/download_report_icon_26x26.png" ImageWidth="26px" Target="_blank">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
<dx:GridViewDataTextColumn FieldName="AddedBy" Width="12%" Caption="بواسطة" VisibleIndex="6">
<PropertiesTextEdit DisplayFormatString="d">
<ValidationSettings ErrorText="*">
<RequiredField IsRequired="True"></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Center"></CellStyle>
</dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الحالة" FieldName="ReportStatusDesc" VisibleIndex="7" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ الاعتماد" FieldName="ApprovedDate" VisibleIndex="8" Visible="False">
            <PropertiesDateEdit DisplayFormatString="">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="بواسطة" FieldName="AprovedBy" VisibleIndex="9" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="ReportID" Visible="False" VisibleIndex="12">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="رقم المتبرع" FieldName="DonorID" VisibleIndex="1" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="اسم المتبرع" FieldName="donor_namear" VisibleIndex="2" Width="23%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="رقم المستفيد" FieldName="BeneficiaryID" VisibleIndex="3" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="اسم المستفيد" FieldName="applicant_name_ar_1" VisibleIndex="4" Width="23%">
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <Settings ShowFilterRow="True" />
    <SettingsText ConfirmDelete="هل تريد الحذف ؟" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT TBL_BeneficiarPeriodicalReports.ReportID, TBL_BeneficiarPeriodicalReports.BeneficiaryType, TBL_BeneficiarPeriodicalReports.BeneficiaryID, TBL_BeneficiarPeriodicalReports.DonorID, TBL_BeneficiarPeriodicalReports.DescAR, TBL_BeneficiarPeriodicalReports.ReportPath, TBL_BeneficiarPeriodicalReports.AddedDate, TBL_BeneficiarPeriodicalReports.AddedBy, TBL_BeneficiarPeriodicalReports.ReportStatus, TBL_BeneficiarPeriodicalReports.ApprovedDate, TBL_BeneficiarPeriodicalReports.AprovedBy, TBL_BeneficiarPeriodicalReports.Notes, CASE WHEN ReportStatus = 0 THEN 'غير معتمد' ELSE 'معتمد' END AS ReportStatusDesc, donor_data.donor_namear, benf_master.applicant_name_ar_1 FROM benf_master RIGHT OUTER JOIN TBL_BeneficiarPeriodicalReports ON benf_master.app_ser = TBL_BeneficiarPeriodicalReports.BeneficiaryID LEFT OUTER JOIN donor_data ON TBL_BeneficiarPeriodicalReports.DonorID = donor_data.donor_id WHERE (TBL_BeneficiarPeriodicalReports.BeneficiaryType = @BeneficiaryType) AND (TBL_BeneficiarPeriodicalReports.ReportStatus = 0) ORDER BY TBL_BeneficiarPeriodicalReports.AddedDate" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [TBL_BeneficiarPeriodicalReports] WHERE [ReportID] = @original_ReportID " OldValuesParameterFormatString="original_{0}">
    <DeleteParameters>
        <asp:Parameter Name="original_ReportID" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField_app_type" DefaultValue="" Name="BeneficiaryType" PropertyName="Value" />
    </SelectParameters>
</asp:SqlDataSource>

