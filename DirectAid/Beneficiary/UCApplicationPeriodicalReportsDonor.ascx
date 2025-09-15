<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCApplicationPeriodicalReportsDonor.ascx.vb"
    Inherits="DirectAid.UCApplicationPeriodicalReportsDonor" %>
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

    function OpenPopup(s, e) {
            if(e.buttonID == 'Details')
            {
                var rowVisibleIndex = e.visibleIndex;
                var rowKeyValue = s.GetRowKey(rowVisibleIndex);
                //alert('Row key value: ' + rowKeyValue);
                window.open("ApplicationPeriodicalReportsDonorLog.aspx?ReportID=" + rowKeyValue, "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600");
                //window.open('ApplicationPeriodicalReportsDonorLog.aspx?OrphanID=' + app_ser.GetValue() + 'APP_TYPE=' + app_type.GetValue(), &quot;&quot;, &quot;toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600&quot;);
          
            }

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
    KeyFieldName="ReportID" Width="100%" ClientInstanceName="ASPxGridView1" EnableCallbackAnimation="True" DataSourceID="SqlDataSource1">
    <Settings ShowFilterRow="True" />
    <ClientSideEvents CustomButtonClick="OpenPopup" />
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Button">
            <ClearFilterButton Visible="True">
            </ClearFilterButton>
            <CustomButtons>
                <dx:GridViewCommandColumnCustomButton ID="SMS" Text="ارسال SMS" Visibility="Invisible">
                    <Image Url="~/Images/0000023557">
                    </Image>
                </dx:GridViewCommandColumnCustomButton>
                <dx:GridViewCommandColumnCustomButton ID="Details" Text="تفاصيل">
                    <Image Url="~/Images/Action_FileAttachment_Attach_32x32.png">
                    </Image>
                </dx:GridViewCommandColumnCustomButton>
            </CustomButtons>
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
        <dx:GridViewDataTextColumn FieldName="app_ser" VisibleIndex="12" Visible="False">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="AddedDate" VisibleIndex="4" Caption="تاريخ الانشاء"
            Width="10%">
            <PropertiesDateEdit DisplayFormatString="">
                <ValidationSettings ErrorText="*">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
            </PropertiesDateEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataColumn Caption="فتح / تنزيل" FieldName="attachment_image" VisibleIndex="11">
            <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
            <DataItemTemplate>
                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Height="75px" NavigateUrl='<%# Eval("ReportPath")%>' Text="فتح / تنزيل" ImageHeight="26px" ImageUrl="~/Images/download_report_icon_26x26.png" ImageWidth="26px" Target="_blank">
                </dx:ASPxHyperLink>
            </DataItemTemplate>
        </dx:GridViewDataColumn>
<dx:GridViewDataTextColumn FieldName="AddedBy" Width="10%" Caption="بواسطة" VisibleIndex="5">
<PropertiesTextEdit DisplayFormatString="d">
<ValidationSettings ErrorText="*">
<RequiredField IsRequired="True"></RequiredField>
</ValidationSettings>
</PropertiesTextEdit>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle HorizontalAlign="Center"></CellStyle>
</dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الحالة" FieldName="ReportStatusDesc" VisibleIndex="6" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn Caption="تاريخ الاعتماد" FieldName="ApprovedDate" VisibleIndex="7" Width="10%">
            <PropertiesDateEdit DisplayFormatString="">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="بواسطة" FieldName="AprovedBy" VisibleIndex="8" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="ReportID" Visible="False" VisibleIndex="13">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="نوع المستفيد" FieldName="namear" VisibleIndex="1" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="رقم المستفيد" FieldName="BeneficiaryID" VisibleIndex="2" Width="10%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="اسم المستفيد" FieldName="applicant_name_ar_1" VisibleIndex="3" Width="15%">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="عدد مرات الارسال" FieldName="SumOfReports" VisibleIndex="9" Width="10%">
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <Settings ShowFilterRow="True"></Settings>
    <SettingsText ConfirmDelete="هل تريد الحذف ؟" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT mm.ReportID, mm.BeneficiaryType, mm.BeneficiaryID, mm.DonorID, mm.DescAR, mm.ReportPath, mm.AddedDate, mm.AddedBy, mm.ReportStatus, mm.ApprovedDate, mm.AprovedBy, mm.Notes, CASE WHEN ReportStatus = 0 THEN 'غير معتمد' ELSE 'معتمد' END AS ReportStatusDesc, donor_data.donor_namear, benf_master.applicant_name_ar_1, beneficiary_type.namear, (SELECT COUNT(ReportID) AS Expr1 FROM TBL_BeneficiarPeriodicalReports_Log WHERE (ReportID = mm.ReportID)) AS SumOfReports FROM beneficiary_type RIGHT OUTER JOIN TBL_BeneficiarPeriodicalReports AS mm ON beneficiary_type.id = mm.BeneficiaryType LEFT OUTER JOIN benf_master ON mm.BeneficiaryID = benf_master.app_ser LEFT OUTER JOIN donor_data ON mm.DonorID = donor_data.donor_id WHERE (mm.ReportStatus = 1) AND (mm.DonorID = @DonorID) ORDER BY mm.AddedDate" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [TBL_BeneficiarPeriodicalReports] WHERE [ReportID] = @original_ReportID " OldValuesParameterFormatString="original_{0}">
    <DeleteParameters>
        <asp:Parameter Name="original_ReportID" Type="Int32" />
    </DeleteParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="DonorID" QueryStringField="DonorID" />
    </SelectParameters>
</asp:SqlDataSource>

