<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCApplicationPeriodicalReportsDonorLog.ascx.vb"
    Inherits="DirectAid.UCApplicationPeriodicalReportsDonorLog" %>
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

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
    KeyFieldName="AUTOID" Width="100%" EnableCallbackAnimation="True" DataSourceID="SqlDataSource1" RightToLeft="True">
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
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="AUTOID" ReadOnly="True" Visible="False" VisibleIndex="8">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="ReportID" ReadOnly="True" Visible="False" VisibleIndex="7">
            <EditFormSettings CaptionLocation="None" Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="نوع الارسال" FieldName="TypeOfSend" VisibleIndex="2">
            <PropertiesComboBox DataSourceID="SqlDataSourceTypeOfSend" TextField="TypeDesc" ValueField="TypeID">
                <ValidationSettings Display="Dynamic">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn Caption="ملاحظات" FieldName="Notes" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ الارسال" FieldName="SendDate" VisibleIndex="1">
            <PropertiesDateEdit>
                <ValidationSettings Display="Dynamic">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="أرسل بواسطة" FieldName="SendBy" VisibleIndex="3">
            <PropertiesComboBox DataSourceID="SqlDataSourceSenders" IncrementalFilteringMode="Contains" TextField="collect_namear" ValueField="collect_id">
                <ValidationSettings Display="Dynamic">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ الاضافة" FieldName="AddedDate" ReadOnly="True" VisibleIndex="5">
            <PropertiesDateEdit EditFormat="DateTime">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="أضيف بواسطة" FieldName="AddedBy" ReadOnly="True" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <Settings ShowFilterRow="True" />
    <SettingsText ConfirmDelete="هل تريد الحذف ؟" />
</dx:ASPxGridView>

<asp:SqlDataSource ID="SqlDataSourceTypeOfSend" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [TBL_BeneficiarPeriodicalReports_types]" OldValuesParameterFormatString="original_{0}">
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSourceSenders" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [collectors_tab] WHERE ([enabled] = @enabled)" OldValuesParameterFormatString="original_{0}">
    <SelectParameters>
        <asp:Parameter DefaultValue="True" Name="enabled" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [TBL_BeneficiarPeriodicalReports_Log] WHERE ([ReportID] = @ReportID)" OldValuesParameterFormatString="original_{0}" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [TBL_BeneficiarPeriodicalReports_Log] WHERE [AUTOID] = @original_AUTOID AND (([ReportID] = @original_ReportID) OR ([ReportID] IS NULL AND @original_ReportID IS NULL)) AND (([TypeOfSend] = @original_TypeOfSend) OR ([TypeOfSend] IS NULL AND @original_TypeOfSend IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([SendDate] = @original_SendDate) OR ([SendDate] IS NULL AND @original_SendDate IS NULL)) AND (([SendBy] = @original_SendBy) OR ([SendBy] IS NULL AND @original_SendBy IS NULL)) AND (([AddedDate] = @original_AddedDate) OR ([AddedDate] IS NULL AND @original_AddedDate IS NULL)) AND (([AddedBy] = @original_AddedBy) OR ([AddedBy] IS NULL AND @original_AddedBy IS NULL))" InsertCommand="INSERT INTO [TBL_BeneficiarPeriodicalReports_Log] ([ReportID], [TypeOfSend], [Notes], [SendDate], [SendBy], [AddedDate], [AddedBy]) VALUES (@ReportID, @TypeOfSend, @Notes, @SendDate, @SendBy, @AddedDate, @AddedBy)" UpdateCommand="UPDATE [TBL_BeneficiarPeriodicalReports_Log] SET [ReportID] = @ReportID, [TypeOfSend] = @TypeOfSend, [Notes] = @Notes, [SendDate] = @SendDate, [SendBy] = @SendBy, [AddedDate] = @AddedDate, [AddedBy] = @AddedBy WHERE [AUTOID] = @original_AUTOID AND (([ReportID] = @original_ReportID) OR ([ReportID] IS NULL AND @original_ReportID IS NULL)) AND (([TypeOfSend] = @original_TypeOfSend) OR ([TypeOfSend] IS NULL AND @original_TypeOfSend IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([SendDate] = @original_SendDate) OR ([SendDate] IS NULL AND @original_SendDate IS NULL)) AND (([SendBy] = @original_SendBy) OR ([SendBy] IS NULL AND @original_SendBy IS NULL)) AND (([AddedDate] = @original_AddedDate) OR ([AddedDate] IS NULL AND @original_AddedDate IS NULL)) AND (([AddedBy] = @original_AddedBy) OR ([AddedBy] IS NULL AND @original_AddedBy IS NULL))">
    <DeleteParameters>
        <asp:Parameter Name="original_AUTOID" Type="Int32" />
        <asp:Parameter Name="original_ReportID" Type="Int32" />
        <asp:Parameter Name="original_TypeOfSend" Type="Int32" />
        <asp:Parameter Name="original_Notes" Type="String" />
        <asp:Parameter DbType="Date" Name="original_SendDate" />
        <asp:Parameter Name="original_SendBy" Type="String" />
        <asp:Parameter Name="original_AddedDate" Type="DateTime" />
        <asp:Parameter Name="original_AddedBy" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ReportID" Type="Int32" />
        <asp:Parameter Name="TypeOfSend" Type="Int32" />
        <asp:Parameter Name="Notes" Type="String" />
        <asp:Parameter DbType="Date" Name="SendDate" />
        <asp:Parameter Name="SendBy" Type="String" />
        <asp:Parameter Name="AddedDate" Type="DateTime" />
        <asp:Parameter Name="AddedBy" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="ReportID" QueryStringField="ReportID" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="ReportID" Type="Int32" />
        <asp:Parameter Name="TypeOfSend" Type="Int32" />
        <asp:Parameter Name="Notes" Type="String" />
        <asp:Parameter DbType="Date" Name="SendDate" />
        <asp:Parameter Name="SendBy" Type="String" />
        <asp:Parameter Name="AddedDate" Type="DateTime" />
        <asp:Parameter Name="AddedBy" Type="String" />
        <asp:Parameter Name="original_AUTOID" Type="Int32" />
        <asp:Parameter Name="original_ReportID" Type="Int32" />
        <asp:Parameter Name="original_TypeOfSend" Type="Int32" />
        <asp:Parameter Name="original_Notes" Type="String" />
        <asp:Parameter DbType="Date" Name="original_SendDate" />
        <asp:Parameter Name="original_SendBy" Type="String" />
        <asp:Parameter Name="original_AddedDate" Type="DateTime" />
        <asp:Parameter Name="original_AddedBy" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>



