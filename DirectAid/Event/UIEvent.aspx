<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="UIEvent.aspx.vb" Inherits="DirectAid.UIEvent" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>








<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <% If DesignMode Then%>
    <script src="Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
    <% End If%>
    <script type="text/javascript">

        var isLoaded = false;

        window.onload = function () {
            isLoaded = true;
        }

        function Open_Base(webFrom) {
            if (event_id.GetValue() != null) {
                window.open("" + webFrom + ".aspx?event_id=" + event_id.GetValue(), "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600");
            }
        }

        function Open_Accomodation() {
            Open_Base("UIEventAccomodationMasterFree");
        }

        function Open_Activities() {
            Open_Base("UIEventActivitiesMasterFree");
        }

        function Open_Committe() {
            Open_Base("UIEventCommitteMasterFree");
        }

        function Open_Fees() {
            Open_Base("UIEventFeesMasterFree");
        }

        function Open_Groups() {
            Open_Base("UIEventGroupsMasterFree");
        }

        function Open_Participants() {
            Open_Base("UIEventParticipantsMasterFree");
        }

        function Open_Purposes() {
            Open_Base("UIEventPurposesMasterFree");
        }

        function Open_Reasons() {
            Open_Base("UIEventReasonsMasterFree");
        }

        function Save_Begin() {
            if (isLoaded) {
                if (ASPxClientEdit.AreEditorsValid()) {
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
                event_id.SetValue(result);
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

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table align="center" width="100%" cellpadding="5px">
        <tbody>
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxButton ID="ASPxButton_New" runat="server" Text="جديد" Width="100%" UseSubmitBehavior="False"
                        ClientInstanceName="ASPxButton_New" EnableClientSideAPI="True" Font-Bold="True" CausesValidation="False">
                        <Image Url="~/Images/New_32x32.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxButton ID="ASPxButton_Save" runat="server" Text="حفظ" Width="100%" UseSubmitBehavior="False"
                        AutoPostBack="False" ClientInstanceName="ASPxButton_Save" EnableClientSideAPI="True"
                        Font-Bold="True" ValidateInvisibleEditors="True">
                        <ClientSideEvents Click="function(s, e) {
	Save_Begin();
}" />
                        <Image Url="~/Images/Save_32x32.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxCallback ID="ASPxCallback_Save" runat="server" ClientInstanceName="ASPxCallback_Save">
                        <ClientSideEvents CallbackComplete="function(s, e) {
	Save_End(e);
}"
                            CallbackError="function(s, e) {
	Save_Error(e);
}" />
                    </dx:ASPxCallback>
                </td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 4%;">
                    <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1"
                        Modal="True" Font-Bold="True">
                    </dx:ASPxLoadingPanel>
                </td>
            </tr>
        </tbody>
    </table>
    <table align="center" cellpadding="5px" width="100%">
        <tbody>
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser" runat="server" Font-Bold="True" Text="الرقم" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxTextBox ID="event_id" runat="server" ClientInstanceName="event_id" EnableClientSideAPI="True" ReadOnly="True" Width="100%">
                    </dx:ASPxTextBox>
                </td>
                <td align="center" style="width: 16%;">
                    <asp:Label ID="Label227" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="8pt" Text="النوع" Width="100%"></asp:Label>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxComboBox ID="event_type" runat="server" AutoPostBack="True" ClientInstanceName="event_type" DataSourceID="EntityDataSource_event_types_codes" EnableClientSideAPI="True" TextField="event_name_ar" ValueField="event_type_id" ValueType="System.Byte" Width="100%">
                    </dx:ASPxComboBox>
                </td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 4%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser1" runat="server" Font-Bold="True" Text="الاسم باللغه العربيه"
                        Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" colspan="5">
                    <dx:ASPxTextBox ID="event_name_ar" runat="server" Width="100%">
                        <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td align="center" style="width: 4%;">&nbsp;
                </td>
            </tr>
            <tr>
                <td align="center" class="auto-style1">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser2" runat="server" Font-Bold="True" Text="الاسم باللغه الانجليزيه" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" class="auto-style1" colspan="5">
                    <dx:ASPxTextBox ID="event_name_en" runat="server" Width="100%">
                    </dx:ASPxTextBox>
                </td>
                <td align="center" class="auto-style2"></td>
            </tr>
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser42" runat="server" Font-Bold="True" Text="عنوان الحدث" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" colspan="5">
                    <dx:ASPxTextBox ID="event_title" runat="server" Width="100%">
                    </dx:ASPxTextBox>
                </td>
                <td align="center" style="width: 4%;">&nbsp;</td>
            </tr>
            <%--            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser50" runat="server" Font-Bold="True" Text="مسئول الموقع" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    &nbsp;</td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser51" runat="server" Font-Bold="True" Text="القسم المشرف" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser52" runat="server" Font-Bold="True" Text="الشخص المشرف" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 4%;">&nbsp;</td>
            </tr>--%>
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser8" runat="server" Font-Bold="True" Text="تاريخ البدايه" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxDateEdit ID="event_frm_date" runat="server" EnableClientSideAPI="True" Width="100%">
                        <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser43" runat="server" Font-Bold="True" Text="تاريخ النهايه" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxDateEdit ID="event_to_date" runat="server" EnableClientSideAPI="True" Width="100%">
                        <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser44" runat="server" Font-Bold="True" Text="عدد المناوبات" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxTextBox ID="shifts_count" runat="server" Text="0" Width="100%">
                        <MaskSettings Mask="&lt;0..99&gt;" />
                        <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td align="center" style="width: 4%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser53" runat="server" Font-Bold="True" Text="وقت البدايه" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxDateEdit ID="event_start_time" runat="server" EnableClientSideAPI="True" Width="100%" EditFormat="Time">
                        <TimeSectionProperties ShowSecondHand="True" Visible="True">
                        </TimeSectionProperties>

                    </dx:ASPxDateEdit>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser54" runat="server" Font-Bold="True" Text="وقت النهايه" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxDateEdit ID="event_end_time" runat="server" EnableClientSideAPI="True" Width="100%" EditFormat="Time">
                        <TimeSectionProperties ShowSecondHand="True" Visible="True">
                        </TimeSectionProperties>

                    </dx:ASPxDateEdit>
                </td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 4%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" Text="الدوله"
                        Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <dx:ASPxComboBox ID="event_country" runat="server" AutoPostBack="True" CallbackPageSize="5"
                                DataSourceID="EntityDataSource_nat_tab" DropDownRows="5" EnableCallbackMode="True"
                                EnableClientSideAPI="True" EnableSynchronization="True" IncrementalFilteringMode="Contains"
                                TextField="nat_descrar" ValueField="nat_code" ValueType="System.Int16" Width="100%">
                            </dx:ASPxComboBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Bold="True" Text="المدينه"
                        Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <dx:ASPxComboBox ID="event_city" runat="server" CallbackPageSize="5" DataSourceID="EntityDataSource_city"
                                DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" EnableSynchronization="True"
                                IncrementalFilteringMode="Contains" ValueType="System.Int16" Width="100%" TextField="city_name_ar" ValueField="city_id">
                                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 4%;">&nbsp;
                </td>
            </tr>
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser45" runat="server" Font-Bold="True" Text="المكان" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" colspan="5">
                    <dx:ASPxTextBox ID="event_place" runat="server" Width="100%">
                    </dx:ASPxTextBox>
                </td>
                <td align="center" style="width: 4%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser46" runat="server" Font-Bold="True" Text="الحد الادنى للحضور" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxTextBox ID="minimum_participants" runat="server" Text="0" Width="100%">
                        <MaskSettings Mask="&lt;0..99&gt;" />
                        <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel45" runat="server" Font-Bold="True" Text="التكلفه" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxTextBox ID="event_cost" runat="server" Width="100%">
                        <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                        <ValidationSettings ErrorDisplayMode="None">
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 4%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser47" runat="server" Font-Bold="True" Text="تاريخ حفل الختام" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxDateEdit ID="close_ceremony_date" runat="server" EnableClientSideAPI="True" Width="100%">
                    </dx:ASPxDateEdit>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser48" runat="server" Font-Bold="True" Text="تاريخ النتائج" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxDateEdit ID="result_date" runat="server" EnableClientSideAPI="True" Width="100%">
                    </dx:ASPxDateEdit>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxLabel ID="ASPxLabel_app_ser49" runat="server" Font-Bold="True" Text="تاريخ الجوائز" Width="100%">
                    </dx:ASPxLabel>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxDateEdit ID="reward_date" runat="server" EnableClientSideAPI="True" Width="100%">
                    </dx:ASPxDateEdit>
                </td>
                <td align="center" style="width: 4%;">&nbsp;</td>
            </tr>
        </tbody>
    </table>

    <table align="center" width="100%" cellpadding="5px">
        <tbody>
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxButton ID="ASPxButton_Accomodation" runat="server" Text="التجهيزات"
                        Width="100%" UseSubmitBehavior="False"
                        AutoPostBack="False" ClientInstanceName="ASPxButton_Accomodation" EnableClientSideAPI="True"
                        Font-Bold="True">
                        <ClientSideEvents Click="function(s, e) {
	Open_Accomodation();
}" />
                        <Image Url="~/Images/Open_32x32.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxButton ID="ASPxButton_Activities" runat="server" Text="النشاطات"
                        Width="100%" UseSubmitBehavior="False"
                        AutoPostBack="False" ClientInstanceName="ASPxButton_Activities" EnableClientSideAPI="True"
                        Font-Bold="True">
                        <ClientSideEvents Click="function(s, e) {
	Open_Activities();
}" />
                        <Image Url="~/Images/Open_32x32.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxButton ID="ASPxButton_Committe" runat="server" Text="اللجنه"
                        Width="100%" UseSubmitBehavior="False"
                        AutoPostBack="False" ClientInstanceName="ASPxButton_Committe" EnableClientSideAPI="True"
                        Font-Bold="True">
                        <ClientSideEvents Click="function(s, e) {
	Open_Committe();
}" />
                        <Image Url="~/Images/Open_32x32.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxButton ID="ASPxButton_Fees" runat="server" Text="التكاليف"
                        Width="100%" UseSubmitBehavior="False"
                        AutoPostBack="False" ClientInstanceName="ASPxButton_Fees" EnableClientSideAPI="True"
                        Font-Bold="True">
                        <ClientSideEvents Click="function(s, e) {
	Open_Fees();
}" />
                        <Image Url="~/Images/Open_32x32.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxButton ID="ASPxButton_Groups" runat="server" Text="المجموعات"
                        Width="100%" UseSubmitBehavior="False"
                        AutoPostBack="False" ClientInstanceName="ASPxButton_Groups" EnableClientSideAPI="True"
                        Font-Bold="True">
                        <ClientSideEvents Click="function(s, e) {
	Open_Groups();
}" />
                        <Image Url="~/Images/Open_32x32.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxButton ID="ASPxButton_Participants" runat="server" Text="المشاركون"
                        Width="100%" UseSubmitBehavior="False"
                        AutoPostBack="False" ClientInstanceName="ASPxButton_Participants" EnableClientSideAPI="True"
                        Font-Bold="True">
                        <ClientSideEvents Click="function(s, e) {
	Open_Participants();
}" />
                        <Image Url="~/Images/Open_32x32.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td align="center" style="width: 4%;">&nbsp;</td>
            </tr>
            <tr>
                <td align="center" style="width: 16%;">
                    <dx:ASPxButton ID="ASPxButton_Purposes" runat="server" Text="الاغراض"
                        Width="100%" UseSubmitBehavior="False"
                        AutoPostBack="False" ClientInstanceName="ASPxButton_Purposes" EnableClientSideAPI="True"
                        Font-Bold="True">
                        <ClientSideEvents Click="function(s, e) {
	Open_Purposes();
}" />
                        <Image Url="~/Images/Open_32x32.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td align="center" style="width: 16%;">
                    <dx:ASPxButton ID="ASPxButton_Reasons" runat="server" Text="الاسباب"
                        Width="100%" UseSubmitBehavior="False"
                        AutoPostBack="False" ClientInstanceName="ASPxButton_Reasons" EnableClientSideAPI="True"
                        Font-Bold="True">
                        <ClientSideEvents Click="function(s, e) {
	Open_Reasons();
}" />
                        <Image Url="~/Images/Open_32x32.png">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td align="center" style="width: 16%;">
                    &nbsp;</td>
                <td align="center" style="width: 16%;">
                    &nbsp;</td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 16%;">&nbsp;</td>
                <td align="center" style="width: 4%;">&nbsp;</td>
            </tr>
        </tbody>
    </table>


    <asp:EntityDataSource ID="EntityDataSource_nat_tab" runat="server" ConnectionString="name=charitysoftEntities"
        DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="nat_tab"
        EntityTypeFilter="nat_tab">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="EntityDataSource_event_types_codes" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="event_types_codes">
    </asp:EntityDataSource>
    <asp:EntityDataSource runat="server" AutoGenerateWhereClause="True" DefaultContainerName="charitysoftEntities" ConnectionString="name=charitysoftEntities" EnableFlattening="False" EntitySetName="cities" EntityTypeFilter="city" Where="" ID="EntityDataSource_city" Select="">
        <WhereParameters>
            <asp:ControlParameter ControlID="event_country" PropertyName="Value" DefaultValue="0" Name="nat_city" Type="Int16"></asp:ControlParameter>
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
