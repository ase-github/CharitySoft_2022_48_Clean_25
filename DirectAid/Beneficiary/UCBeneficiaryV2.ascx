<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryV2.ascx.vb"
    Inherits="DirectAid.UCBeneficiaryV2" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>
<link href="Content/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="../Scripts/jquery.min.js" type="text/javascript"></script>
<script src="../Scripts/jquery-ui-1.8.20.min.js" type="text/javascript"></script>
<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<script type="text/javascript">

    var isLoaded = false;

    window.onload = function () {

        var arg = "slow";

        isLoaded = true;

        SwitchType();

        InitializeButtons();

        $("#table_header").fadeIn(arg);

        $("#table_footer").fadeIn(arg);
    }

    function InitializeButtons() {
        var hasID = (app_ser.GetValue() != null);
        var hasDonor = (donor_id.GetValue() != null);
        var statusID = application_status_stud_orp.GetValue();

        ASPxButton_UnAssign.SetVisible(hasDonor);
        ASPxButton_Show_UnAssign.SetVisible(hasDonor);
        ASPxButton_DonorDonations.SetVisible(hasDonor);

        ASPxButton_Accept.SetVisible((statusID != 1) && hasID);
        ASPxButton_Reject.SetVisible((statusID != 2) && hasID);
        ASPxButton_Cancel.SetVisible((statusID != 3) && hasID);

        ASPxButton_Show_Reject.SetVisible((statusID != 2) && hasID);
        ASPxButton_Show_Cancel.SetVisible((statusID != 3) && hasID);

        ASPxButton_Print.SetVisible(hasID);
    }

    function SwitchType() {
        ASPxClientPageControl.Cast("ASPxPageControl1").GetTab(2).SetVisible((app_type.GetValue() == 0));
        ASPxClientPageControl.Cast("ASPxPageControl1").GetTab(4).SetVisible((app_type.GetValue() == 0));
        ASPxClientPageControl.Cast("ASPxPageControl1").GetTab(5).SetVisible((app_type.GetValue() == 2));
        ASPxClientPageControl.Cast("ASPxPageControl1").GetTab(6).SetVisible((app_type.GetValue() == 2));

        ASPxButton_QuranKnown.SetVisible((app_type.GetValue() != 2));
        ASPxButton_Education.SetVisible((app_type.GetValue() != 2));
        ASPxButton_Health.SetVisible((app_type.GetValue() != 2));
        ASPxButton_Language.SetVisible((app_type.GetValue() != 2));
        ASPxButton_Hobby.SetVisible((app_type.GetValue() != 2));

        ASPxButton_ScholarShip.SetVisible((app_type.GetValue() == 1));
        ASPxButton_PreviousSchools.SetVisible((app_type.GetValue() == 1));

        ASPxButton_YearlyData.SetVisible((app_type.GetValue() == 2));
        //ASPxButton_SchoolResults.SetVisible((app_type.GetValue() == 1));
        //ASPxButton_StudentFees.SetVisible(false);
    }

    function OpenRecord(recordID) {

        document.location.href = 'Beneficiary.aspx?app_ser=' + recordID;
        document.URL
    }

    function Open_Base(webFrom) {
        if (app_ser.GetValue() != null) {
            window.open("" + webFrom + ".aspx?OrphanID=" + app_ser.GetValue() + "&APP_TYPE=" + app_type.GetValue(), "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600");
        }
        else {
            alert("من فضلك قم بحفظ البيانات");
        }
    }

    function Open_QuranKnown() {
        Open_Base("QuranKnownMasterFree");
    }

    function Open_ApplicationAttach() {
        Open_Base("ApplicationAttachMasterFree");
    }

    function Open_EducationalData() {
        Open_Base("OrphanEducationMasterFree");
    }

    function Open_HealthData() {
        Open_Base("OrphanHealthMasterFree");
    }

    function Open_TransferData() {
        Open_Base("OrphanTransferMasterFree");
    }

    function Open_AllocationData() {
        Open_Base("OrphanAllocationMasterFree");
    }

    function Open_LanguageData() {
        Open_Base("OrphanLanguageMasterFree");
    }

    function Open_HobbyData() {
        Open_Base("OrphanHobbyMasterFree");
    }

    function Open_YearlyData() {
        Open_Base("BeneficiaryYearlyDataMasterFree");
    }

    function Open_DonorDonations() {
        if (app_ser.GetValue() != null) {
            if (donor_id.GetValue() != null) {
                window.open("DonorCollectionHistory.aspx?DonorID=" + donor_id.GetValue(), "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600");
            }
            else {
                alert("هذا اليتيم غير مخصص");
            }
        }
        else {
            alert("من فضلك قم بحفظ البيانات");
        }
    }

    function Open_ScholarShips() {
        Open_Base("Education/StudScholarshipsMaster");
    }

    function Open_PreviousSchools() {
        Open_Base("Education/DA_students_prev_sites");
    }

    function Open_SchoolResults() {
        Open_Base("Education/DA_Students_Results");
    }

    function Open_StudentFees() {
        Open_Base("Education/DA_students_fees");
    }
    
    function Open_PeriodicalReports() {
        Open_Base("ApplicationPeriodicalReports");
    }

    function Save_Begin() {
        if (isLoaded) {
            ASPxClientPageControl.Cast("ASPxPageControl1").SetActiveTabIndex(0);
            if (ASPxClientEdit.ValidateGroup("Save")) {
                ASPxButton_Save.SetEnabled(false);
                ASPxLoadingPanel1.Show();
                ASPxCallback_Save.PerformCallback(null);
            }
        }
        else {
            alert("Loading ...");
        }
    }

    function Save_End(e) {

        var result = e.result;

        if (!isNaN(result)) {
            alert("تم الحفظ");
            app_ser.SetValue(result);
        }
        else {
            alert(result);
        }

        ASPxButton_Save.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function Save_Error(e) {
        alert(e.message);
        ASPxButton_Save.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function Accept_Begin() {
        if (isLoaded) {
            if (app_ser.GetValue() != null) {
                if (confirm("هل تريد القبول؟")) {
                    ASPxButton_Accept.SetEnabled(false);
                    ASPxLoadingPanel1.Show();
                    ASPxCallback_Accept.PerformCallback(null);
                }
            }
        }
        else {
            alert("Loading ...");
        }
    }

    function Accept_End(e) {

        var result = e.result;

        if (!isNaN(result)) {
            alert("تم القبول");
            ASPxButton_Accept.SetVisible(false);
            //ASPxButton_Reject.SetVisible(true);
        }
        else {
            alert(result);
        }

        ASPxButton_Accept.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
        location.reload();
    }

    function Accept_Error(e) {
        alert(e.message);
        ASPxButton_Accept.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }
    //
    function Reject_Begin() {
        if (isLoaded) {
            if (app_ser.GetValue() != null) {
                if (ASPxClientEdit.ValidateGroup("CheckB4Submit")) {
                    if (confirm("هل تريد الرفض؟")) {
                        ASPxButton_Reject.SetEnabled(false);
                        ASPxLoadingPanel1.Show();
                        ASPxCallback_Reject.PerformCallback(null);
                    }
                }
            }
        }
        else {
            alert("Loading ...");
        }
    }

    function Reject_End(e) {

        var result = e.result;

        if (!isNaN(result)) {
            alert("تم الرفض");
            ASPxButton_Reject.SetVisible(false);
            //ASPxButton_Accept.SetVisible(true);
        }
        else {
            alert(result);
        }

        ASPxButton_Reject.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
        location.reload();
    }

    function Reject_Error(e) {
        alert(e.message);
        ASPxButton_Reject.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function Cancel_Begin() {
        if (isLoaded) {
            if (app_ser.GetValue() != null) {
                if (ASPxClientEdit.ValidateGroup("CheckB4Submit")) {
                    if (confirm("هل تريد الالغاء؟")) {
                        ASPxButton_Cancel.SetEnabled(false);
                        ASPxLoadingPanel1.Show();
                        ASPxCallback_Cancel.PerformCallback(null);
                    }
                }
            }
        }
        else {
            alert("Loading ...");
        }
    }

    function Cancel_End(e) {

        var result = e.result;

        if (!isNaN(result)) {
            alert("تم الالغاء");
            ASPxButton_Cancel.SetVisible(false);
        }
        else {
            alert(result);
        }

        ASPxButton_Cancel.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
        location.reload();
    }

    function Cancel_Error(e) {
        alert(e.message);
        ASPxButton_Cancel.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function UnAssign_Begin() {
        if (isLoaded) {
            if (app_ser.GetValue() != null) {
                if (ASPxClientEdit.ValidateGroup("CheckB4Submit")) {
                    if (confirm("هل تريد فصل الكفاله؟")) {
                        ASPxButton_UnAssign.SetEnabled(false);
                        ASPxLoadingPanel1.Show();
                        ASPxCallback_UnAssign.PerformCallback(null);
                    }
                }
            }
        }
        else {
            alert("Loading ...");
        }
    }

    function UnAssign_End(e) {

        var result = e.result;

        if (!isNaN(result)) {
            alert("تم فصل الكفاله");
            ASPxButton_UnAssign.SetVisible(false);
        }
        else {
            alert(result);
        }

        ASPxButton_UnAssign.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
        location.reload();
    }

    function UnAssign_Error(e) {
        alert(e.message);
        ASPxButton_UnAssign.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function Print_Begin() {
        ASPxButton_Print.SetEnabled(false);
        ASPxLoadingPanel1.Show();
        ASPxCallback_Print.PerformCallback(null);
    }

    function Print_End(e) {

        var result = e.result;

        if (result == "OK") {
            window.open("ReportViewer.aspx?popup=1", "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600");
        }
        else {
            alert(result);
        }

        ASPxButton_Print.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function Print_Error(e) {
        alert(e.message);
        ASPxButton_Print.SetEnabled(true);
        ASPxLoadingPanel1.Hide();
    }

    function FindByKey_Begin() {
        if (ASPxButton_FindByKey.GetValue() != null) {
            ASPxButton_FindByKey.SetEnabled(false);
            ASPxLoadingPanel1.Show();
            //ASPxCallback_Print.PerformCallback(null);
            OpenRecord(ASPxButton_FindByKey.GetValue());
        }
    }

    function FindByKey_End(e) {

        //var result = e.result;

        //if (result == "OK") {
        //    window.open("ReportViewer.aspx?popup=1", "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600");
        //}
        //else {
        //    alert(result);
        //}

        //ASPxButton_FindByKey.SetEnabled(true);
        //ASPxLoadingPanel1.Hide();
    }

    function FindByKey_Error(e) {
        //alert(e.message);
        //ASPxButton_FindByKey.SetEnabled(true);
        //ASPxLoadingPanel1.Hide();
    }

    function Show_Reject() {
        ASPxButton_Cancel.SetVisible(false);
        ASPxButton_UnAssign.SetVisible(false);
        ASPxPopupControl1.Show();
    }

    function Show_Cancel() {
        ASPxButton_Reject.SetVisible(false);
        ASPxButton_UnAssign.SetVisible(false);
        ASPxPopupControl1.Show();
    }

    function Show_UnAssign() {
        ASPxButton_Reject.SetVisible(false);
        ASPxButton_Cancel.SetVisible(false);
        ASPxPopupControl1.Show();
    }

    function ButtonEditClickByEnter(s, e) {
        if (e.htmlEvent.keyCode == 13) {
            ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
            s.GetButton(0).click();
        }
    }

</script>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

<dx:ASPxLoadingPanel runat="server" Modal="True" ClientInstanceName="ASPxLoadingPanel1" Font-Bold="True" ID="ASPxLoadingPanel1"></dx:ASPxLoadingPanel>

<table id="table_main" width="100%">
    <tr>
        <td style="width: 100%;">
            <table align="center" width="100%" cellpadding="5px" id="table_header" style="display: none;" >
                <%--<table align="center" width="100%" cellpadding="5px" id="table1" >--%>
                <tbody>
                    <tr>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_New" runat="server" Text="جديد" Width="100%" UseSubmitBehavior="False"
                                ClientInstanceName="ASPxButton_New" EnableClientSideAPI="True" Font-Bold="True">
                                <Image Url="~/Images/New_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_Save" runat="server" Text="حفظ" Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Save" EnableClientSideAPI="True"
                                Font-Bold="True" ValidateInvisibleEditors="True" ValidationContainerID="ASPxPageControl1"
                                ValidationGroup="Save">
                                <ClientSideEvents Click="function(s, e) {
	Save_Begin();
}" />
                                <Image Url="~/Images/Save_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButtonEdit ID="ASPxButton_FindByKey" runat="server" Width="100%" UseSubmitBehavior="False" ClientInstanceName="ASPxButton_FindByKey" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents ButtonClick="function(s, e) {
	FindByKey_Begin();
}"
                                    KeyPress="function(s, e) {
		ButtonEditClickByEnter(s, e);
}" />
                                <MaskSettings Mask="&lt;1..2147483647&gt;" />
                                <Buttons>
                                    <dx:EditButton Text="" Position="Left">
                                        <Image Url="~/Images/Find_32x32.png">
                                        </Image>
                                    </dx:EditButton>
                                </Buttons>
                                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                </ValidationSettings>
                            </dx:ASPxButtonEdit>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButtonEdit ID="ASPxButton_Print" runat="server" Width="100%" UseSubmitBehavior="False" ClientInstanceName="ASPxButton_Print" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents ButtonClick="function(s, e) {
	Print_Begin();
}"
                                    KeyPress="function(s, e) {
	ButtonEditClickByEnter(s, e);
}" />
                                <MaskSettings Mask="&lt;1900..3000&gt;" />
                                <Buttons>
                                    <dx:EditButton Text="" Position="Left">
                                        <Image Url="~/Images/Print_32x32.png">
                                        </Image>
                                    </dx:EditButton>
                                </Buttons>
                                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                </ValidationSettings>
                            </dx:ASPxButtonEdit>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_Accept" runat="server" Text="قبول" Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Accept" EnableClientSideAPI="True"
                                Font-Bold="True" ValidateInvisibleEditors="True" ValidationContainerID="ASPxPageControl1"
                                ValidationGroup="Save">
                                <ClientSideEvents Click="function(s, e) {
	Accept_Begin();
}" />
                                <Image Url="~/Images/ActiveRents_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_Show_Reject" runat="server" Text="رفض" Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Show_Reject" EnableClientSideAPI="True"
                                Font-Bold="True" ValidateInvisibleEditors="True" ValidationContainerID="ASPxPageControl1"
                                ValidationGroup="Save">
                                <ClientSideEvents Click="function(s, e) {
	Show_Reject();
}" />
                                <Image Url="~/Images/Action_Deny_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 4%;"></td>
                    </tr>
                </tbody>
            </table>
            <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" HeaderText="بيانات اساسيه"
                RightToLeft="True" ShowHeader="False">
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                        <table align="center" cellpadding="5px" width="100%">
                            <tbody>
                                <tr>
                                    <td align="center" style="width: 16%;">
                                        <asp:Label ID="Label227" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="نوع المستفيد" Width="100%"></asp:Label>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxComboBox ID="app_type" runat="server" AutoPostBack="True" DataSourceID="ObjectDataSource_app_type" ReadOnly="True" TextField="NameAr" ValueField="ID" ValueType="System.Byte" Width="100%" ClientInstanceName="app_type" EnableClientSideAPI="True" Font-Bold="True">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	SwitchType();
}"
                                                ValueChanged="function(s, e) {
	SwitchType();
}" />
                                            <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="Save">
                                                <RequiredField ErrorText="" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel_app_ser23" runat="server" Font-Bold="True" Text="الحاله" Width="100%">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxComboBox ID="application_status_stud_orp" ReadOnly="true" runat="server" ClientInstanceName="application_status_stud_orp" DataSourceID="ObjectDataSource_OrphanRequestStatus" EnableClientSideAPI="True" TextField="NameAr" ValueField="ID" ValueType="System.Byte" Width="100%">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel_app_ser44" runat="server" Font-Bold="True" Text="تاريخ الحاله" Width="100%">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxDateEdit ID="status_date" runat="server" ClientInstanceName="status_date" EnableClientSideAPI="True" ReadOnly="True" Width="100%">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td align="center" style="width: 4%;"></td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel_app_ser" runat="server" Font-Bold="True" Text="الرقم" Width="100%">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxTextBox ID="app_ser" runat="server" ClientInstanceName="app_ser" EnableClientSideAPI="True" ReadOnly="True" Width="100%">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel_app_ser0" runat="server" Font-Bold="True" Text="تاريخ التسجيل" Width="100%">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxDateEdit ID="app_date" runat="server" ClientInstanceName="app_date" EnableClientSideAPI="True" ReadOnly="True" Width="100%">
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel_app_ser8" runat="server" Font-Bold="True" Text="تاريخ الميلاد" Width="100%">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxDateEdit ID="applicant_dob" runat="server" ClientInstanceName="applicant_dob" EnableClientSideAPI="True" Width="100%">
                                            <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="Save">
                                                <RequiredField ErrorText="" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </td>
                                    <td align="center" style="width: 4%;"></td>
                                </tr>

                                <tr>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel runat="server" Text="الاسم باللغه العربيه" Width="100%" Font-Bold="True" ID="ASPxLabel_app_ser1"></dx:ASPxLabel>

                                    </td>
                                    <td align="center" colspan="3">
                                        <dx:ASPxTextBox ID="applicant_name_ar_1" runat="server" Width="100%" MaxLength="150">
                                            <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="Save">
                                                <RequiredField ErrorText="" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>

                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel_app_ser15" runat="server" Font-Bold="True" Text="بلد الاقامه" Width="100%">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxComboBox ID="app_country" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_nat_tab" DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains" TextField="nat_descrar" ValueField="nat_code" ValueType="System.Int16" Width="100%">
                                            <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="Save">
                                                <RequiredField ErrorText="" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td align="center" style="width: 4%;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel51" runat="server" Text="الاضافه بواسطه" Width="100%">
                                        </dx:ASPxLabel>
                                                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxTextBox ID="insert_userid" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                                            <ReadOnlyStyle BackColor="Silver">
                                            </ReadOnlyStyle>
                                        </dx:ASPxTextBox>
                                                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel52" runat="server" Text="وقت الاضافه" Width="100%">
                                        </dx:ASPxLabel>
                                                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxTextBox ID="insert_date" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                                            <ReadOnlyStyle BackColor="Silver">
                                            </ReadOnlyStyle>
                                        </dx:ASPxTextBox>
                                                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel_app_ser334" runat="server" Font-Bold="True" Text="يتيم سابق" Width="100%">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxCheckBox ID="chxIsPreviousOrphan" runat="server" CheckState="Unchecked" Enabled="False">
                                        </dx:ASPxCheckBox>
                                    </td>
                                    <td align="center" style="width: 4%;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel53" runat="server" Text="اخر تعديل بواسطه" Width="100%">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxTextBox ID="last_update_userid" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                                            <ReadOnlyStyle BackColor="Silver">
                                            </ReadOnlyStyle>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxLabel ID="ASPxLabel54" runat="server" Text="وقت التعديل" Width="100%">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td align="center" style="width: 16%;">
                                        <dx:ASPxTextBox ID="last_update_date" runat="server" MaxLength="50" ReadOnly="True" Width="100%">
                                            <ReadOnlyStyle BackColor="Silver">
                                            </ReadOnlyStyle>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td align="center" style="width: 16%;">&nbsp;</td>
                                    <td align="center" style="width: 16%;">&nbsp;</td>
                                    <td align="center" style="width: 4%;">&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxRoundPanel>
            <table align="center" width="100%" cellpadding="5px" id="table_body">
                <tbody>
                    <tr>
                        <td align="center" style="width: 100%;">

                            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1"
                                ClientInstanceName="ASPxPageControl1" EnableClientSideAPI="True"
                                Font-Bold="True" 
                                RightToLeft="True" Width="100%">
                                <TabPages>
                                    <dx:TabPage Text="بيانات شخصيه">
                                        <ContentCollection>
                                            <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">
                                                <table align="center" cellpadding="5px" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser3" runat="server" Font-Bold="True" Text="رقم النظام السابق"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxTextBox ID="legacy_num" runat="server" ReadOnly="True" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser2" runat="server" Font-Bold="True" Text="الاسم باللغه الانجليزيه" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" colspan="3">
                                                                <dx:ASPxTextBox ID="applicant_name_en_1" runat="server" Width="100%" MaxLength="150">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 4%;">&nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser333" runat="server" Font-Bold="True" Text="الجنس" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="applicant_gender" runat="server" DataSourceID="ObjectDataSource_Gender" TextField="NameAr" ValueField="ID" ValueType="System.Byte" Width="100%">
                                                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="Save">
                                                                        <RequiredField ErrorText="" IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser13" runat="server" Font-Bold="True" Text="الجنسيه" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="applicant_nat" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_nat_tab" DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains" TextField="nat_descrar" ValueField="nat_code" ValueType="System.Int16" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser45" runat="server" Font-Bold="True" Text="الحاله الاجتماعيه" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="marital_status_stud_daw" runat="server" DataSourceID="ObjectDataSource_MaritalStatus" TextField="NameAr" ValueField="ID" ValueType="System.Byte" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 4%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser41" runat="server" Font-Bold="True" Text="رقم الكافل الحالي" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxTextBox ID="donor_id" runat="server" ReadOnly="True" Width="100%" ClientInstanceName="donor_id" EnableClientSideAPI="True">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser11" runat="server" Font-Bold="True" Text="اسم الكافل الحالي" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxTextBox ID="donor_NAME" runat="server" ReadOnly="True" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser17" runat="server" Font-Bold="True" Text="تاريخ التخصيص للكافل" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxDateEdit ID="allocation_date" runat="server" ReadOnly="True" Width="100%">
                                                                </dx:ASPxDateEdit>
                                                            </td>
                                                            <td align="center" style="width: 4%;"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="العنوان">
                                        <ContentCollection>
                                            <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">
                                                <table align="center" cellpadding="5px" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser4" runat="server" Font-Bold="True" Text="الدوله"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <asp:UpdatePanel ID="UpdatePanel_Country" runat="server">
                                                                    <ContentTemplate>
                                                                        <dx:ASPxComboBox ID="ASPxComboBox_Country" runat="server" AutoPostBack="True" CallbackPageSize="5"
                                                                            DataSourceID="EntityDataSource_nat_tab" DropDownRows="5" EnableCallbackMode="True"
                                                                            EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains"
                                                                            TextField="nat_descrar" ValueField="nat_code" ValueType="System.Int16" Width="100%">
                                                                        </dx:ASPxComboBox>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser9" runat="server" Font-Bold="True" Text="المدينه"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <asp:UpdatePanel ID="UpdatePanel_City" runat="server">
                                                                    <ContentTemplate>
                                                                        <dx:ASPxComboBox ID="city_dob" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_city"
                                                                            DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                                                            IncrementalFilteringMode="Contains" ValueType="System.Int16" Width="100%" TextField="city_name_ar" ValueField="city_id">
                                                                        </dx:ASPxComboBox>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser14" runat="server" Font-Bold="True" Text="الديانه"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="benf_religion" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_religion_tab"
                                                                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                                                    IncrementalFilteringMode="Contains" TextField="religion_namear" ValueField="religion_code"
                                                                    ValueType="System.Byte" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 4%;">
                                                                <asp:EntityDataSource ID="EntityDataSource_center_tab" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="center_tab" EntityTypeFilter="center_tab" Select="it.[center_code], it.[center_namear], it.[center_nameen]" Where="">
                                                                    <WhereParameters>
                                                                        <asp:ControlParameter ControlID="ASPxComboBox_Country" Name="region_code" PropertyName="Value" DbType="Int32" />
                                                                    </WhereParameters>
                                                                </asp:EntityDataSource>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser5" runat="server" Font-Bold="True" Text="القريه"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxTextBox ID="village_dob" runat="server" Width="100%" MaxLength="50">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser10" runat="server" Font-Bold="True" Text="القبيله"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxTextBox ID="applicant_clan" runat="server" Width="100%" MaxLength="50">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">&nbsp;</td>
                                                            <td align="center" style="width: 16%;">&nbsp;</td>
                                                            <td align="center" style="width: 4%;">
                                                                <asp:EntityDataSource ID="EntityDataSource_orphanage_tab" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="orphanage_tab" EntityTypeFilter="orphanage_tab" Select="it.[orphanage_code], it.[orphanage_name], it.[Center_id]" Where="">
                                                                </asp:EntityDataSource>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser6" runat="server" Font-Bold="True" Text="الوضع الحالى"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="benf_type_orp_stud" runat="server" DataSourceID="ObjectDataSource_OrphanState"
                                                                    TextField="NameAr" ValueField="ID" ValueType="System.Byte" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser7" runat="server" Font-Bold="True" Text="المركز" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <asp:UpdatePanel ID="UpdatePanel_Center" runat="server">
                                                                    <ContentTemplate>
                                                                        <dx:ASPxComboBox ID="center_code" runat="server" CallbackPageSize="5"
                                                                            DataSourceID="EntityDataSource_center_tab" DropDownRows="5" EnableCallbackMode="True"
                                                                            EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains"
                                                                            TextField="center_namear" ValueField="center_code" ValueType="System.Int32" Width="100%">
                                                                        </dx:ASPxComboBox>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser12" runat="server" Font-Bold="True" Text="مكان الرعايه" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <asp:UpdatePanel ID="UpdatePanel_Orphanage" runat="server">
                                                                    <ContentTemplate>
                                                                        <dx:ASPxComboBox ID="orphanage_code" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_orphanage_tab"
                                                                            DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                                                            IncrementalFilteringMode="Contains" TextField="orphanage_name" ValueField="orphanage_code"
                                                                            ValueType="System.Int32" Width="100%">
                                                                        </dx:ASPxComboBox>
                                                                    </ContentTemplate>
                                                                </asp:UpdatePanel>
                                                            </td>
                                                            <td align="center" style="width: 4%;">
                                                                <asp:EntityDataSource ID="EntityDataSource_city" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="cities" EntityTypeFilter="city" Where="">
                                                                    <WhereParameters>
                                                                        <asp:ControlParameter ControlID="ASPxComboBox_Country" DefaultValue="0" Name="nat_city" PropertyName="Value" Type="Int16" />
                                                                    </WhereParameters>
                                                                </asp:EntityDataSource>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="بيانات الام">
                                        <ContentCollection>
                                            <dx:ContentControl ID="ContentControl3" runat="server" SupportsDisabledAttribute="True">
                                                <table align="center" cellpadding="5px" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser16" runat="server" Font-Bold="True" Text="اسم الأم"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" colspan="5">
                                                                <dx:ASPxTextBox ID="mother_name_ar_orp_stud_1" runat="server" Width="100%" MaxLength="150">
                                                                </dx:ASPxTextBox>

                                                            </td>
                                                            <td align="center" style="width: 4%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser19" runat="server" Font-Bold="True" Text="وظيفة الأم"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="mother_job_code" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_jobs_tab"
                                                                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                                                    IncrementalFilteringMode="Contains" TextField="job_descrar" ValueField="job_code"
                                                                    ValueType="System.Int16" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser20" runat="server" Font-Bold="True" Text="الدخل الشهري"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxTextBox ID="mother_salary" runat="server" Text="0" Width="100%">
                                                                    <MaskSettings Mask="&lt;0..999999&gt;.&lt;000..999&gt;" />
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser21" runat="server" Font-Bold="True" Text="العملة"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="mother_salary_curr" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_currency_tab"
                                                                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                                                    IncrementalFilteringMode="Contains" TextField="currency_descrar" ValueField="currency_code"
                                                                    ValueType="System.Int16" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 4%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser22" runat="server" Font-Bold="True" Text="ديانة الأم"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="mother_religion" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_religion_tab"
                                                                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                                                    IncrementalFilteringMode="Contains" TextField="religion_namear" ValueField="religion_code"
                                                                    ValueType="System.Byte" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;"></td>
                                                            <td align="center" style="width: 16%;"></td>
                                                            <td align="center" style="width: 16%;"></td>
                                                            <td align="center" style="width: 16%;"></td>
                                                            <td align="center" style="width: 4%;"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="الحاله">
                                        <ContentCollection>
                                            <dx:ContentControl ID="ContentControl4" runat="server" SupportsDisabledAttribute="True">
                                                <table align="center" cellpadding="5px" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser24" runat="server" Font-Bold="True" Text="المستخدم"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="status_by" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_view_user"
                                                                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                                                    IncrementalFilteringMode="Contains" TextField="namear" ValueField="user_id"
                                                                    ValueType="System.Int16" Width="100%" ReadOnly="True">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser25" runat="server" Font-Bold="True" Text="السبب"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="status_reason" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_reason_tab"
                                                                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                                                    IncrementalFilteringMode="Contains" TextField="reason_ar" ValueField="reason_code"
                                                                    ValueType="System.Int16" Width="100%" ReadOnly="True">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;"></td>
                                                            <td align="center" style="width: 16%;"></td>
                                                            <td align="center" style="width: 4%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser26" runat="server" Font-Bold="True" Text="ملاحظات عامة"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" colspan="5">
                                                                <dx:ASPxMemo ID="general_notes" runat="server" Rows="3" Width="100%" MaxLength="2000">
                                                                </dx:ASPxMemo>
                                                            </td>
                                                            <td align="center" style="width: 4%;"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="بيانات المعيل">
                                        <ContentCollection>
                                            <dx:ContentControl ID="ContentControl5" runat="server" SupportsDisabledAttribute="True">
                                                <table align="center" cellpadding="5px" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser27" runat="server" Font-Bold="True" Text="نوع اليتيم"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="benf_int_ext" runat="server" DataSourceID="ObjectDataSource_OrphanExistanceType"
                                                                    TextField="NameAr" ValueField="ID" ValueType="System.Byte" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser34" runat="server" Font-Bold="True" Text="مكان الاقامة"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="living_with_opr_stud" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_orphans_residence_place"
                                                                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains"
                                                                    TextField="place_descr_ar" ValueField="place_code" ValueType="System.Byte" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser35" runat="server" Font-Bold="True" Text="صلة القرابة"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="living_with_rel_type" runat="server" DataSourceID="ObjectDataSource_OrphanKinship"
                                                                    TextField="NameAr" ValueField="ID" ValueType="System.Byte" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 4%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser28" runat="server" Font-Bold="True" Text="اسم المعيل"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxTextBox ID="name_of_living_with" runat="server" Width="100%" MaxLength="100">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser33" runat="server" Font-Bold="True" Text="وظيفة المعيل"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="job_of_living_with" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_jobs_tab"
                                                                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                                                    IncrementalFilteringMode="Contains" TextField="job_descrar" ValueField="job_code"
                                                                    ValueType="System.Int16" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser36" runat="server" Font-Bold="True" Text="الديانة"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="living_with_religion" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_religion_tab"
                                                                    DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                                                    IncrementalFilteringMode="Contains" TextField="religion_namear" ValueField="religion_code"
                                                                    ValueType="System.Byte" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 4%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser29" runat="server" Font-Bold="True" Text="العنوان"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" colspan="3">
                                                                <dx:ASPxTextBox ID="living_with_address" runat="server" Width="100%" MaxLength="300">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser39" runat="server" Font-Bold="True" Text="عدد الاخوة المكفولين" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxTextBox ID="orp_brothers_guaranteed" runat="server" Text="0" Width="100%">
                                                                    <MaskSettings Mask="&lt;0..99&gt;" />
                                                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 4%;"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser30" runat="server" Font-Bold="True" Text="حالة الأبوين"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="parents_status_stud_orp" runat="server" DataSourceID="ObjectDataSource_OrphanParentsStatus"
                                                                    TextField="NameAr" ValueField="ID" ValueType="System.Byte" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser31" runat="server" Font-Bold="True" Text="تاريخ وفاة الأب"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxDateEdit ID="father_dod" runat="server" Width="100%">
                                                                </dx:ASPxDateEdit>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser38" runat="server" Font-Bold="True" Text="عدد الاخوة"
                                                                    Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxTextBox ID="orp_brothers_count" runat="server" Text="0" Width="100%">
                                                                    <MaskSettings Mask="&lt;0..99&gt;" />
                                                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 4%;"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <%--                            <dx:TabPage Text="بيانات حفظ القرآن">
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        <uc1:UCQuranKnown ID="UCQuranKnown1" runat="server" />
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="المرفقات">
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        <uc2:UCApplicationAttach ID="UCApplicationAttach1" runat="server" />
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>--%>
                                    <dx:TabPage Text="بيانات الترشيح">
                                        <ContentCollection>
                                            <dx:ContentControl ID="ContentControl6" runat="server" SupportsDisabledAttribute="True">
                                                <table align="center" cellpadding="5px" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel_app_ser32" runat="server" Font-Bold="True" Text="مرشح من قبل" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxComboBox ID="nominated_by" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_organization_tab" DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains" TextField="org_namear" ValueField="org_code" ValueType="System.Int16" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxLabel ID="ASPxLabel32" runat="server" Text="اسم جهه الترشيح عربى" Width="100%" Font-Bold="True">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">

                                                                <dx:ASPxTextBox ID="nomination_entity_ar" runat="server" Width="100%" MaxLength="150">
                                                                </dx:ASPxTextBox>

                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel35" runat="server" Text="اسم جهه الترشيح انجليزى" Width="100%" Font-Bold="True">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxTextBox ID="nomination_entity_en" runat="server" MaxLength="150" Width="100%">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 4%;" align="center"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxLabel ID="ASPxLabel34" runat="server" Text="عنوان جهه الترشيح" Width="100%" Font-Bold="True">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" colspan="5" style="width: 80%;">
                                                                <dx:ASPxMemo ID="entity_address" runat="server" Width="100%" ClientInstanceName="entity_address"
                                                                    EnableClientSideAPI="True" MaxLength="150">
                                                                </dx:ASPxMemo>
                                                            </td>
                                                            <td style="width: 4%;" align="center"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                    <dx:TabPage Text="بيانات العمل">
                                        <ContentCollection>
                                            <dx:ContentControl ID="ContentControl7" runat="server" SupportsDisabledAttribute="True">
                                                <table align="center" cellpadding="5px" width="100%">
                                                    <tbody>
                                                        <tr>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxLabel ID="ASPxLabel41" runat="server" Text="البنك" Width="100%" Font-Bold="True">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxComboBox ID="bank_code" runat="server" Width="100%" CallbackPageSize="10"
                                                                    EnableCallbackMode="True" DataSourceID="SqlDataSource_bank_code" TextField="bank_ar_name"
                                                                    ValueField="bank_code" ValueType="System.Int16">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxLabel ID="ASPxLabel42" runat="server" Text="فرع البنك" Width="100%" Font-Bold="True">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxTextBox ID="branch_of_the_bank" runat="server" Width="100%" MaxLength="70">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxLabel ID="ASPxLabel43" runat="server" Text="رقم الحساب" Width="100%" Font-Bold="True">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxTextBox ID="account_num" runat="server" Width="100%" MaxLength="40">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 4%;" align="center"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxLabel ID="ASPxLabel44" runat="server" Text="الراتب" Width="100%" Font-Bold="True">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td style="width: 16%;" align="left">
                                                                <dx:ASPxTextBox ID="dayaa_sal" runat="server" Width="100%">
                                                                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                                                    <ValidationSettings ErrorDisplayMode="None">
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxLabel ID="ASPxLabel45" runat="server" Font-Bold="True" Text="العملة" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxComboBox ID="sal_curr" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_currency_tab" DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains" TextField="currency_descrar" ValueField="currency_code" ValueType="System.Int16" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxLabel ID="ASPxLabel46" runat="server" Font-Bold="True" Text="تاريخ التعيين" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td style="width: 16%;" align="center">
                                                                <dx:ASPxDateEdit ID="school_reg_date" runat="server" ClientInstanceName="school_reg_date" EnableClientSideAPI="True" Width="100%">
                                                                </dx:ASPxDateEdit>
                                                            </td>
                                                            <td style="width: 4%;" align="center"></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel47" runat="server" Font-Bold="True" Text="مكان العمل" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="left" colspan="3">
                                                                <dx:ASPxTextBox ID="section_opinion" runat="server" MaxLength="100" Width="100%" ClientInstanceName="section_opinion">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxLabel ID="ASPxLabel48" runat="server" Font-Bold="True" Text="المؤهل الدراسي" Width="100%">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td align="center" style="width: 16%;">
                                                                <dx:ASPxComboBox ID="stud_qualif_type" runat="server" CallbackPageSize="5" ClientInstanceName="stud_qualif_type" DataSourceID="EntityDataSource_stud_qualif_type_codes" DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains" TextField="stud_qual_name_ar" ValueField="stud_qual_type_code" ValueType="System.Int16" Width="100%">
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td align="center" style="width: 4%;"></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>
                                </TabPages>
                            </dx:ASPxPageControl>
                        </td>
                    </tr>
                </tbody>
            </table>
            <%--                            <dx:TabPage Text="بيانات حفظ القرآن">
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        <uc1:UCQuranKnown ID="UCQuranKnown1" runat="server" />
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="المرفقات">
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        <uc2:UCApplicationAttach ID="UCApplicationAttach1" runat="server" />
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>--%>
            <table align="center" width="100%" cellpadding="5px" id="table_footer" style="display: none;">
                <tbody>
                    <tr>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_Allocation" runat="server" Text="بيانات التخصيص"
                                Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Allocation" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents Click="function(s, e) {
	Open_AllocationData();
}" />
                                <Image Url="~/Images/Open_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_ApplicationAttach" runat="server" Text="المرفقات"
                                Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_ApplicationAttach" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents Click="function(s, e) {
	Open_ApplicationAttach();
}" />
                                <Image Url="~/Images/Open_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_Transfer" runat="server" Text="بيانات النقل"
                                Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Transfer" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents Click="function(s, e) {
	Open_TransferData();
}" />
                                <Image Url="~/Images/Open_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_DonorDonations" runat="server" Text="تبرعات الكافل"
                                Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_DonorDonations" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents Click="function(s, e) {
	Open_DonorDonations();
}" />
                                <Image Url="~/Images/Open_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_Show_UnAssign" runat="server" Text="فصل الكفاله" Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Show_UnAssign" EnableClientSideAPI="True"
                                Font-Bold="True" ValidateInvisibleEditors="True" ValidationContainerID="ASPxPageControl1"
                                ValidationGroup="Save">
                                <ClientSideEvents Click="function(s, e) {
	Show_UnAssign();
}" />
                                <Image Url="~/Images/Action_LinkUnlink_Unlink_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_Show_Cancel" runat="server" Text="إلغاء" Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Show_Cancel" EnableClientSideAPI="True"
                                Font-Bold="True" ValidateInvisibleEditors="True" ValidationContainerID="ASPxPageControl1"
                                ValidationGroup="Save">
                                <ClientSideEvents Click="function(s, e) {
	Show_Cancel();
}" />
                                <Image Url="~/Images/Action_Delete_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 4%;">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_QuranKnown" runat="server" Text="يحفظ من القران"
                                Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_QuranKnown" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents Click="function(s, e) {
	Open_QuranKnown();
}" />
                                <Image Url="~/Images/Open_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_Education" runat="server" Text="البيانات التعليميه"
                                Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Education" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents Click="function(s, e) {
	Open_EducationalData();
}" />
                                <Image Url="~/Images/Open_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_Health" runat="server" Text="البيانات الصحيه"
                                Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Health" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents Click="function(s, e) {
	Open_HealthData();
}" />
                                <Image Url="~/Images/Open_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_Language" runat="server" Text="اللغات التى يتقنها"
                                Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Language" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents Click="function(s, e) {
	Open_LanguageData();
}" />
                                <Image Url="~/Images/Open_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_Hobby" runat="server" Text="هوايات وانشطه"
                                Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Hobby" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents Click="function(s, e) {
	Open_HobbyData();
}" />
                                <Image Url="~/Images/Open_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_ScholarShip" runat="server" Text="المنح الدراسية"
                                Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_ScholarShip" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents Click="function(s, e) {
	Open_ScholarShips();
}" />
                                <Image Url="~/Images/Open_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 4%;"></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 16%;">
                            <dx:ASPxButton ID="ASPxButton_YearlyData" runat="server" Text="البيانات السنويه"
                                Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_YearlyData" EnableClientSideAPI="True"
                                Font-Bold="True">
                                <ClientSideEvents Click="function(s, e) {
	Open_YearlyData();
}" />
                                <Image Url="~/Images/Open_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                                            <dx:ASPxButton ID="ASPxButton_PreviousSchools" runat="server" Text="المؤسسات التعليمية السابقة"
                    Width="100%" UseSubmitBehavior="False"
                    AutoPostBack="False" ClientInstanceName="ASPxButton_PreviousSchools" EnableClientSideAPI="True"
                    Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	Open_PreviousSchools();
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <%--                            <dx:TabPage Text="بيانات حفظ القرآن">
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        <uc1:UCQuranKnown ID="UCQuranKnown1" runat="server" />
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="المرفقات">
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                        <uc2:UCApplicationAttach ID="UCApplicationAttach1" runat="server" />
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>--%>
                                            <dx:ASPxButton ID="ASPxButton_PeriodicalReports" runat="server" Text="التقارير الدورية"
                    Width="100%" UseSubmitBehavior="False"
                    AutoPostBack="False" ClientInstanceName="ASPxButton_PeriodicalReports" EnableClientSideAPI="True"
                    Font-Bold="True">
                    <ClientSideEvents Click="function(s, e) {
	Open_PeriodicalReports();
}" />
                    <Image Url="~/Images/Open_32x32.png">
                    </Image>
                </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 16%;">
                            <%--style="display: none;"--%>
                        </td>
                        <td align="center" style="width: 16%;">&nbsp;</td>
                        <td align="center" style="width: 16%;">&nbsp;</td>
                        <td align="center" style="width: 4%;">&nbsp;</td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>
</table>


<dx:ASPxCallback runat="server" ClientInstanceName="ASPxCallback_Reject" ID="ASPxCallback_Reject">
    <ClientSideEvents CallbackComplete="function(s, e) {
	Reject_End(e);
}"
        CallbackError="function(s, e) {
	Reject_Error(e);
}"></ClientSideEvents>
</dx:ASPxCallback>
<dx:ASPxCallback runat="server" ClientInstanceName="ASPxCallback_UnAssign" ID="ASPxCallback_UnAssign">
    <ClientSideEvents CallbackComplete="function(s, e) {
	UnAssign_End(e);
}"
        CallbackError="function(s, e) {
	UnAssign_Error(e);
}"></ClientSideEvents>
</dx:ASPxCallback>
<dx:ASPxCallback runat="server" ClientInstanceName="ASPxCallback_Save" ID="ASPxCallback_Save">
    <ClientSideEvents CallbackComplete="function(s, e) {
	Save_End(e);
}"
        CallbackError="function(s, e) {
	Save_Error(e);
}"></ClientSideEvents>
</dx:ASPxCallback>
<dx:ASPxCallback runat="server" ClientInstanceName="ASPxCallback_Accept" ID="ASPxCallback_Accept">
    <ClientSideEvents CallbackComplete="function(s, e) {
	Accept_End(e);
}"
        CallbackError="function(s, e) {
	Accept_Error(e);
}"></ClientSideEvents>
</dx:ASPxCallback>
<dx:ASPxCallback runat="server" ClientInstanceName="ASPxCallback_Cancel" ID="ASPxCallback_Cancel">
    <ClientSideEvents CallbackComplete="function(s, e) {
	Cancel_End(e);
}"
        CallbackError="function(s, e) {
	Cancel_Error(e);
}"></ClientSideEvents>
</dx:ASPxCallback>

<dx:ASPxCallback runat="server" ClientInstanceName="ASPxCallback_Print" ID="ASPxCallback_Print">
    <ClientSideEvents CallbackComplete="function(s, e) {
	Print_End(e);
}"
        CallbackError="function(s, e) {
	Print_Error(e);
}"></ClientSideEvents>
</dx:ASPxCallback>


<dx:ASPxPopupControl runat="server" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AutoUpdatePosition="True" Modal="True" AllowDragging="True" AllowResize="True" ClientInstanceName="ASPxPopupControl1" EnableClientSideAPI="True" HeaderText="" RightToLeft="True" ID="ASPxPopupControl1" FooterText="" ShowFooter="True" Width="350px">
    <ClientSideEvents Closing="function(s, e) {
	InitializeButtons();
}" />
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
            <table width="100%">
                <tbody>
                    <tr>
                        <td align="center" style="width: 25%;"></td>
                        <td align="center" style="width: 75%;"></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 25%;">
                            <dx:ASPxLabel ID="ASPxLabel_app_ser43" runat="server" Font-Bold="True" Text="السبب" Width="100%">
                            </dx:ASPxLabel>
                        </td>
                        <td align="center" style="width: 75%;">
                            <dx:ASPxComboBox ID="reasons" runat="server" DataSourceID="EntityDataSource_reasons" TextField="reason_ar" ValueField="reason_code" ValueType="System.Int16" Width="100%">
                                <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="CheckB4Submit">
                                    <RequiredField ErrorText="" IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 25%;"></td>
                        <td align="center" style="width: 75%;"></td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 25%;">
                            <dx:ASPxLabel ID="ASPxLabel_app_ser42" runat="server" Font-Bold="True" Text="ملاحظات" Width="100%">
                            </dx:ASPxLabel>
                        </td>
                        <td align="center" style="width: 75%;">
                            <dx:ASPxMemo ID="notes" runat="server" Width="100%" Rows="5">
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="width: 25%;"></td>
                        <td align="center" style="width: 75%;"></td>
                    </tr>
                </tbody>
            </table>
            <table width="100%">
                <tbody>
                    <tr>
                        <td align="center" style="width: 25%;"></td>
                        <td align="center" style="width: 25%;">
                            <dx:ASPxButton ID="ASPxButton_Reject" runat="server" AutoPostBack="False" ClientInstanceName="ASPxButton_Reject" EnableClientSideAPI="True" Font-Bold="True" Text="رفض" UseSubmitBehavior="False" ValidateInvisibleEditors="True" ValidationContainerID="ASPxPageControl1" ValidationGroup="CheckB4Submit" Width="100%">
                                <ClientSideEvents Click="function(s, e) {
	Reject_Begin();
}" />
                                <Image Url="~/Images/Action_Deny_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 25%;">
                            <dx:ASPxButton ID="ASPxButton_Cancel" runat="server" AutoPostBack="False" ClientInstanceName="ASPxButton_Cancel" EnableClientSideAPI="True" Font-Bold="True" Text="إلغاء" UseSubmitBehavior="False" ValidateInvisibleEditors="True" ValidationContainerID="ASPxPageControl1" ValidationGroup="CheckB4Submit" Width="100%">
                                <ClientSideEvents Click="function(s, e) {
	Cancel_Begin();
}" />
                                <Image Url="~/Images/Action_Delete_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                        <td align="center" style="width: 25%;">
                            <dx:ASPxButton ID="ASPxButton_UnAssign" runat="server" AutoPostBack="False" ClientInstanceName="ASPxButton_UnAssign" EnableClientSideAPI="True" Font-Bold="True" Text="فصل الكفاله" UseSubmitBehavior="False" ValidateInvisibleEditors="True" ValidationContainerID="ASPxPageControl1" ValidationGroup="CheckB4Submit" Width="100%">
                                <ClientSideEvents Click="function(s, e) {
	UnAssign_Begin();
}" />
                                <Image Url="~/Images/Action_LinkUnlink_Unlink_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </tbody>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>



<asp:EntityDataSource ID="EntityDataSource_view_user" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="view_user" Select="it.[user_id], it.[namear]">
</asp:EntityDataSource>



<asp:EntityDataSource ID="EntityDataSource_reasons" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="reason_tab" Where="" AutoGenerateWhereClause="True">
    <WhereParameters>
        <asp:Parameter DefaultValue="0" Name="reason_cat" Type="Byte" />
    </WhereParameters>
</asp:EntityDataSource>

<asp:ObjectDataSource ID="ObjectDataSource_app_type" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Load" TypeName="DirectAid.BeneficiaryType"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_Gender" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="Load" TypeName="DirectAid.Gender"></asp:ObjectDataSource>
<asp:EntityDataSource ID="EntityDataSource_nat_tab" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="nat_tab"
    EntityTypeFilter="nat_tab">
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource_religion_tab" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="religion_tab"
    EntityTypeFilter="religion_tab">
</asp:EntityDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_OrphanKinship" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="Load" TypeName="DirectAid.OrphanKinship"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_OrphanState" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="Load" TypeName="DirectAid.OrphanState"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_OrphanParentsStatus" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="Load" TypeName="DirectAid.OrphanParentsStatus"></asp:ObjectDataSource>
<asp:EntityDataSource ID="EntityDataSource_orphans_residence_place" runat="server"
    ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities"
    EnableFlattening="False" EntitySetName="orphans_residence_place" EntityTypeFilter="orphans_residence_place"
    Where="it.place_code > 1">
</asp:EntityDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_OrphanExistanceType" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="Load" TypeName="DirectAid.OrphanExistanceType"></asp:ObjectDataSource>
<asp:EntityDataSource ID="EntityDataSource_jobs_tab" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="jobs_tab"
    EntityTypeFilter="jobs_tab">
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource_reason_tab" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="reason_tab"
    EntityTypeFilter="reason_tab">
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource_organization_tab" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="organization_tab"
    EntityTypeFilter="organization_tab">
</asp:EntityDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_OrphanRequestStatus" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="Load" TypeName="DirectAid.OrphanRequestStatus"></asp:ObjectDataSource>
<asp:SqlDataSource ID="SqlDataSource_bank_code" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [banks_list]"></asp:SqlDataSource>
<asp:EntityDataSource ID="EntityDataSource_currency_tab" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="currency_tab"
    EntityTypeFilter="currency_tab">
</asp:EntityDataSource>

<asp:ObjectDataSource ID="ObjectDataSource_AcademicStatus" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="Load" TypeName="DirectAid.AcademicStatus"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="ObjectDataSource_JobStatus" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="Load" TypeName="DirectAid.JobStatus"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="ObjectDataSource_FinancialStatus" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="Load" TypeName="DirectAid.FinancialStatus"></asp:ObjectDataSource>

<asp:ObjectDataSource ID="ObjectDataSource_MaritalStatus" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="Load" TypeName="DirectAid.MaritalStatus"></asp:ObjectDataSource>
<asp:EntityDataSource ID="EntityDataSource_stud_qualif_type_codes" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="stud_qualif_type_codes">
</asp:EntityDataSource>

