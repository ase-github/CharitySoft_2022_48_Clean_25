<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBankDiskV3.ascx.vb"
    Inherits="DirectAid.UCBankDiskV3" %>


<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>



<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>

<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<script type="text/javascript">

    // <![CDATA[

    var startTime;
    var finishTime;
    var elapsedTime;

    function SetTiming_Start() {
        //.toLocaleString()
        startTime = new Date();
        finishTime = null;
        elapsedTime = null;
        ASPxClientLabel.Cast("ASPxLabel_StartTime").SetValue(startTime.toLocaleTimeString());
        ASPxClientLabel.Cast("ASPxLabel_FinishTime").SetValue(finishTime);
        ASPxClientLabel.Cast("ASPxLabel_Elapsed").SetValue(elapsedTime);
    }

    function SetTiming_Finish() {
        //.toLocaleString()
        finishTime = new Date();
        elapsedTime = (finishTime - startTime) / 1000;
        var unit = (elapsedTime > 59 ? " Minutes" : " Seconds");
        elapsedTime = (elapsedTime > 59 ? (elapsedTime / 60) : elapsedTime);
        ASPxClientLabel.Cast("ASPxLabel_StartTime").SetValue(startTime.toLocaleTimeString());
        ASPxClientLabel.Cast("ASPxLabel_FinishTime").SetValue(finishTime.toLocaleTimeString());
        ASPxClientLabel.Cast("ASPxLabel_Elapsed").SetValue(elapsedTime.toString() + unit);
    }

    function Upload_Begin(filePath) {
        ASPxLoadingPanel1.Show();
        SetTiming_Start();
        ASPxButton_Upload.SetEnabled(false);
        ASPxCallback_Upload.PerformCallback(filePath);
    }

    function Upload_End(e) {

        var result = e.result;

        ASPxButton_Upload.SetEnabled(true);
        ASPxClientGridView.Cast("ASPxGridView1").Refresh();
        SetTiming_Finish();
        ASPxLoadingPanel1.Hide();

        if (result == "OK") {
            alert("تم التحميل بنجاح");
        }
        else if (result == "NO") {
            alert("لم يتم التحميل - من فضلك قم بمراجعه البيانات");
        }
        else {
            alert(result);
        }
    }

    function Upload_Error(e) {
        alert(e.message);
        ASPxButton_Upload.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
        SetTiming_Finish();
    }

    function Uploader_OnUploadStart() {
        ASPxButton_Upload.SetEnabled(false);
    }

    function Uploader_OnFileUploadComplete(args) {
        if (args.isValid) {

            Upload_Begin(args.callbackData);
        }
        else {
            alert(args.callbackData);
        }
    }

    function UpdateUploadButton() {
        //ASPxButton_Upload.SetEnabled(ASPxUploadControl_Main.GetText(0) != "");
    }

    function Post() {
        if (ASPxClientEdit.AreEditorsValid()) {
            if (ASPxCheckBox_AsView.GetChecked()) {
                Upload_Begin(ASPxTextBox_Receipt.GetValue());
            }
            else {
                if (ASPxUploadControl_Main.GetText(0) != "") {
                    ASPxUploadControl_Main.Upload();
                }
            }
        }
    }

</script>

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
    Modal="True" Font-Bold="True">
</dx:ASPxLoadingPanel>
<dx:ASPxCallback ID="ASPxCallback_Upload" runat="server"
    ClientInstanceName="ASPxCallback_Upload">
    <ClientSideEvents CallbackComplete="function(s, e) {
	Upload_End(e);
}"
        CallbackError="function(s, e) {
	Upload_Error(e);
}" />
</dx:ASPxCallback>
<asp:EntityDataSource ID="EntityDataSource_Bank" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="banks_list">
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="BankDiskTemps" EntityTypeFilter="BankDiskTemp">
</asp:EntityDataSource>
<dx:ASPxLabel ID="lblAllowebMimeType" runat="server" Text="Allowed image types: xls, xlsx"
    Width="100%" Visible="False">
</dx:ASPxLabel>
<dx:ASPxLabel ID="lblMaxFileSize" runat="server" Text="Maximum file size: 4Mb" Width="100%" Visible="False">
</dx:ASPxLabel>

<table align="center" width="100%">
    <tbody>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel runat="server" Text="البنك" Width="100%" ID="lblAllowebMimeType0" Font-Bold="True"></dx:ASPxLabel>

            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxComboBox runat="server" CallbackPageSize="5" EnableCallbackMode="True" EnableSynchronization="True" IncrementalFilteringMode="Contains" DropDownRows="5" SelectedIndex="0" ValueType="System.Int16" DataSourceID="EntityDataSource_Bank" TextField="bank_eng_name" ValueField="bank_code" Width="100%" AutoPostBack="True" ClientInstanceName="ASPxComboBox_Bank" EnableClientSideAPI="True" ID="ASPxComboBox_Bank">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}"></ClientSideEvents>

                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" SetFocusOnError="True">
                        <RequiredField IsRequired="True" ErrorText=""></RequiredField>
                    </ValidationSettings>
                </dx:ASPxComboBox>

            </td>
            <td align="center" style="width: 16%;" valign="top">
                <dx:ASPxLabel ID="lblAllowebMimeType5" runat="server" Text="Start Time" Width="100%" Font-Bold="True" ForeColor="#CC0000">
                </dx:ASPxLabel>
            </td>
            <td align="center" rowspan="6" valign="top">

                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
                    KeyFieldName="ID" Width="100%" ClientInstanceName="ASPxGridView1" EnableCallbackAnimation="True" DataSourceID="EntityDataSource1" Caption="البيانات الغير صحيحه تظهر هنا ...">
                    <ClientSideEvents CustomButtonClick="function(s, e) {
	CustomButtonClick(e);
}" />
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="الاجمالى = {0:n0}" FieldName="app_ser"
                            ShowInColumn="الرقم" ShowInGroupFooterColumn="الرقم" SummaryType="Count"
                            ValueDisplayFormat="{0:n0}" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="رقم الاستقطاع" FieldName="ref_numb"
                            VisibleIndex="3" Width="20%">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            <FooterCellStyle HorizontalAlign="Center">
                            </FooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="قيمه الاستقطاع" FieldName="installment_value"
                            VisibleIndex="4" Width="20%">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="السبب" FieldName="reason"
                            VisibleIndex="5" Width="20%">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="التاريخ" FieldName="instruct_date" VisibleIndex="1" Width="20%">
                            <PropertiesTextEdit EnableClientSideAPI="True">
                            </PropertiesTextEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="رقم الحساب" VisibleIndex="2" Width="20%" FieldName="account_num">
                            <Settings AutoFilterCondition="Contains" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>

                    </Columns>
                    <SettingsBehavior AutoFilterRowInputDelay="10000" />
                    <Settings ShowFilterRow="True" ShowFooter="True" ShowTitlePanel="True" />
                </dx:ASPxGridView>
            </td>
            <td align="center" style="width: 4%;"></td>
        </tr>
        <tr>
            <td align="center" class="auto-style1">
                <dx:ASPxLabel ID="lblAllowebMimeType2" runat="server" Text="السنه"
                    Width="100%" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" class="auto-style1">
                <dx:ASPxTextBox runat="server" Width="100%" ID="ASPxTextBox_Year" ClientInstanceName="ASPxTextBox_Year" EnableClientSideAPI="True">
                    <MaskSettings Mask="&lt;1900..3000&gt;" />
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" SetFocusOnError="True">
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>

            </td>
            <td align="center" class="auto-style1" valign="top">
                <dx:ASPxLabel ID="ASPxLabel_StartTime" runat="server" ClientInstanceName="ASPxLabel_StartTime" EnableClientSideAPI="True" Width="100%" ForeColor="#CC0000">
                </dx:ASPxLabel>
            </td>
            <td align="center" class="auto-style2"></td>
        </tr>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel ID="lblAllowebMimeType3" runat="server" Text="الشهر"
                    Width="100%" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxComboBox ID="ASPxComboBox_Month" runat="server"
                    DropDownRows="5" EnableClientSideAPI="True" Width="100%" AutoPostBack="True" ClientInstanceName="ASPxComboBox_Month">
                    <ClientSideEvents ButtonClick="function(s, e) {
	s.SetValue(null);
}" />
                    <Items>
                        <dx:ListEditItem Text="01" Value="1" />
                        <dx:ListEditItem Text="02" Value="2" />
                        <dx:ListEditItem Text="03" Value="3" />
                        <dx:ListEditItem Text="04" Value="4" />
                        <dx:ListEditItem Text="05" Value="5" />
                        <dx:ListEditItem Text="06" Value="6" />
                        <dx:ListEditItem Text="07" Value="7" />
                        <dx:ListEditItem Text="08" Value="8" />
                        <dx:ListEditItem Text="09" Value="9" />
                        <dx:ListEditItem Text="10" Value="10" />
                        <dx:ListEditItem Text="11" Value="11" />
                        <dx:ListEditItem Text="12" Value="12" />
                    </Items>
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" SetFocusOnError="True">
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
            </td>
            <td align="center" style="width: 16%;" valign="top">
                <dx:ASPxLabel ID="lblAllowebMimeType6" runat="server" Text="Finish Time" Width="100%" Font-Bold="True" ForeColor="#006600">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 4%;"></td>
        </tr>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel ID="lblAllowebMimeType4" runat="server" Text="الإيصال"
                    Width="100%" Font-Bold="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxTextBox runat="server" Width="100%" ID="ASPxTextBox_Receipt" ClientInstanceName="ASPxTextBox_Receipt" EnableClientSideAPI="True">
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" SetFocusOnError="True">
                        <RequiredField ErrorText="" IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>

            </td>
            <td align="center" style="width: 16%;" valign="top">
                <dx:ASPxLabel ID="ASPxLabel_FinishTime" runat="server" ClientInstanceName="ASPxLabel_FinishTime" EnableClientSideAPI="True" Width="100%" ForeColor="#006600">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 4%;"></td>
        </tr>
        <tr>
            <td align="center" style="width: 16%;">
                <dx:ASPxLabel ID="lblAllowebMimeType1" runat="server" Text="الملف"
                    Width="100%" Font-Bold="True" ClientInstanceName="lblAllowebMimeType1" EnableClientSideAPI="True">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 16%;">
                <dx:ASPxUploadControl ID="ASPxUploadControl_Main" runat="server" ClientInstanceName="ASPxUploadControl_Main" ShowProgressPanel="True" OnFileUploadComplete="uplImage_FileUploadComplete" Width="100%">
                    <ClientSideEvents FileUploadComplete="function(s, e) { Uploader_OnFileUploadComplete(e); }"
                        FilesUploadComplete="function(s, e) {  }"
                        FileUploadStart="function(s, e) { Uploader_OnUploadStart(); }"
                        TextChanged="function(s, e) { UpdateUploadButton(); }"></ClientSideEvents>
                    <ValidationSettings MaxFileSize="4194304" AllowedFileExtensions=".xls,.xlsx">
                    </ValidationSettings>
                    <BrowseButton Text="...">
                    </BrowseButton>
                </dx:ASPxUploadControl>
            </td>
            <td align="center" style="width: 16%;" valign="top">
                <dx:ASPxLabel ID="ASPxLabel_Elapsedlabel" runat="server" Width="100%" Text="Time Elapsed" Font-Bold="True" ForeColor="Blue">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 4%;"></td>
        </tr>
        <tr>
            <td align="center" style="width: 16%;" valign="top">

                <dx:ASPxCheckBox ID="ASPxCheckBox_AsView" runat="server" CheckState="Unchecked" Text="من قاعده البيانات"
                    Width="100%" Font-Bold="True" ClientInstanceName="ASPxCheckBox_AsView" EnableClientSideAPI="True">
                    <ClientSideEvents CheckedChanged="function(s, e) {
	ASPxUploadControl_Main.SetVisible(!s.GetChecked());
	lblAllowebMimeType1.SetVisible(!s.GetChecked());
}" />
                </dx:ASPxCheckBox>
                            </td>
            <td align="center" style="width: 16%;" valign="top">
                <dx:ASPxButton ID="ASPxButton_Upload" runat="server" AutoPostBack="False" Text="تحميل" ClientInstanceName="ASPxButton_Upload"
                    Width="100%" Style="margin: 0 auto;" ValidateInvisibleEditors="True" EnableClientSideAPI="True" Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) { Post();  }" />
                    <Image Url="~/Images/Upload_16x16.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" style="width: 16%;" valign="top">
                <dx:ASPxLabel ID="ASPxLabel_Elapsed" runat="server" ClientInstanceName="ASPxLabel_Elapsed" EnableClientSideAPI="True" Width="100%" ForeColor="Blue">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 4%;"></td>
        </tr>
    </tbody>
</table>





