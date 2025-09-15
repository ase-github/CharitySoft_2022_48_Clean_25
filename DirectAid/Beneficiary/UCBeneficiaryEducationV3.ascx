<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryEducationV3.ascx.vb"
    Inherits="DirectAid.UCBeneficiaryEducationV3" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Xpo.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Xpo" TagPrefix="dx" %>




<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>

<script type="text/javascript">

    function Save_Begin() {
        //if (isLoaded) {
        if (ASPxClientEdit.AreEditorsValid()) {
            ASPxButton_Save.SetEnabled(false);
            ASPxLoadingPanel1.Show();
            ASPxCallback_Save.PerformCallback(null);
        }
        //}
        //else {
        //    alert("Loading ...");
        //}
    }

    function Save_End(e) {

        var result = e.result;

        if (!isNaN(result)) {
            alert("تم الحفظ");
            ASPxGridView1.Refresh();
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

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource_BnefMasterEducationLog" Width="100%" ClientInstanceName="ASPxGridView1" KeyFieldName="ser_no" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Width="15%">
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
        <dx:GridViewDataDateColumn Caption="تاريخ التسجيل" FieldName="school_reg_date" VisibleIndex="1" Width="10%">
            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    <RequiredField IsRequired="True" ErrorText=""></RequiredField>
                </ValidationSettings>
            </PropertiesDateEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataComboBoxColumn Caption="اسم المؤسسة التعليمية" FieldName="school_code" VisibleIndex="2" Width="20%">
            <PropertiesComboBox DataSourceID="EntityDataSource_school_code" ValueType="System.Int32" TextField="school_name_ar" ValueField="school_code" Width="100%" CallbackPageSize="5" DropDownRows="5" EnableCallbackMode="True" EnableClientSideAPI="True" IncrementalFilteringMode="Contains">
                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    <RequiredField IsRequired="True" ErrorText=""></RequiredField>
                </ValidationSettings>
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="السنة الدراسية" FieldName="academic_year" VisibleIndex="3" Width="10%">
            <PropertiesComboBox ValueType="System.Int16" EnableClientSideAPI="True" DataSourceID="EntityDataSource_academic_year" TextField="acad_year_name" ValueField="acad_year_code">
                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    <RequiredField IsRequired="True" ErrorText=""></RequiredField>
                </ValidationSettings>
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="مرحلة التعليم" FieldName="grade" VisibleIndex="4" Width="10%">
            <PropertiesComboBox ValueType="System.Int16" DataSourceID="EntityDataSource_grade" TextField="grade_name_ar" ValueField="grade_code" Width="100%">
                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    <RequiredField IsRequired="True" ErrorText=""></RequiredField>
                </ValidationSettings>
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="الفصل" FieldName="class" VisibleIndex="4" Width="10%">
            <PropertiesComboBox ValueType="System.Int16" DataSourceID="EntityDataSource_class" TextField="class_name_ar" ValueField="class_code" Width="100%">
                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    <RequiredField IsRequired="True" ErrorText=""></RequiredField>
                </ValidationSettings>
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="التقدير العام" FieldName="general_assesment" VisibleIndex="5" Width="10%">
            <PropertiesComboBox ValueType="System.Int16" EnableClientSideAPI="True" DataSourceID="EntityDataSource_general_assesment" TextField="assesment_namear" ValueField="assesment_code">
                <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                    <RequiredField IsRequired="True" ErrorText=""></RequiredField>
                </ValidationSettings>
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
         <dx:GridViewDataTextColumn Caption="التاريخ" FieldName="AddedDate" VisibleIndex="6" Width="20%">
            <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="المستخدم" FieldName="AddedBy" VisibleIndex="6" Width="20%">
            <PropertiesComboBox DataSourceID="SqlDataSourceUsers" TextField="collect_namear" ValueField="collect_id">
            </PropertiesComboBox>
         <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <SettingsPager AlwaysShowPager="True">
    </SettingsPager>
    <Settings ShowFilterRow="True" />
    <SettingsText ConfirmDelete="هل تريد الحذف؟" />
</dx:ASPxGridView>
<asp:EntityDataSource ID="EntityDataSource_BnefMasterEducationLog" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="BnefMasterEducationLogs" Where="">
    <WhereParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="app_ser" QueryStringField="OrphanID" Type="Int32"/>
    </WhereParameters>
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource_school_code" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="school_master" EntityTypeFilter="school_master" Select="it.[school_code], it.[school_name_ar], it.[school_name_en]">
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource_grade" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="grades_codes" EntityTypeFilter="grades_codes">
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource_class" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="classes_tab" Select="it.[class_code], it.[class_name_ar], it.[class_name_eng]">
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource_general_assesment" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="general_assesment_tab">
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource_academic_year" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="academic_year_codes" EntityTypeFilter="academic_year_codes" Select="it.[acad_year_code], it.[acad_year_name]">
</asp:EntityDataSource>




<asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT [collect_id], [collect_namear] FROM [collectors_tab]"></asp:SqlDataSource>










