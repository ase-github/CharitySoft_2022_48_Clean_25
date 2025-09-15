<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCOrphanHobby.ascx.vb"
    Inherits="DirectAid.UCOrphanHobby" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:HiddenField ID="HiddenField_app_ser" runat="server" Value="0" />

    <script type="text/javascript">

        function OnCountryChanged(hobby_type) {

            ASPxClientComboBox.Cast("hobby_code").PerformCallback(hobby_type.GetValue().toString());
        }

    </script>

<dx:ASPxGridView runat="server" KeyFieldName="app_ser;hobby_code" AutoGenerateColumns="False" DataSourceID="dts_hobby" Theme="Aqua" Width="600px" ID="grd_hobby" ClientInstanceName="grd_hobby">
    <Columns>
        <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
            <EditButton Visible="True"></EditButton>

            <NewButton Visible="True"></NewButton>

            <DeleteButton Visible="True"></DeleteButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="ser_no" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="app_ser" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn FieldName="hobby_code" ShowInCustomizationForm="True" Caption="الوصـــف" VisibleIndex="4">
            <PropertiesComboBox EnableSynchronization="False" IncrementalFilteringMode="StartsWith" TextField="hobby_descar" ValueField="hobby_code" ValueType="System.Int16">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn FieldName="hobby_type" ShowInCustomizationForm="True" Caption="النـــوع" VisibleIndex="3">
            <PropertiesComboBox IncrementalFilteringMode="StartsWith" EnableSynchronization="False" DataSourceID="dts_hobby_type" TextField="type_descr_ar" ValueField="hobby_type_code" ValueType="System.Int16">
                <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }"></ClientSideEvents>
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
    </Columns>

    <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>

    <SettingsPager AlwaysShowPager="True"></SettingsPager>

    <SettingsEditing Mode="Inline"></SettingsEditing>

    <SettingsText CommandEdit="تعديل" CommandNew="جديد" CommandDelete="حذف" CommandCancel="إلغاء" CommandUpdate="حفظ" ConfirmDelete="هل تريد الحفظ"></SettingsText>
</dx:ASPxGridView>

<asp:SqlDataSource ID="dts_hobby" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
    SelectCommand="SELECT * FROM [hobbies_view] WHERE ([app_ser] = @app_ser)" DeleteCommand="usp_orphans_hobbyDelete"
    DeleteCommandType="StoredProcedure" InsertCommand="usp_orphans_hobbyInsert" InsertCommandType="StoredProcedure"
    UpdateCommand="usp_orphans_hobbyUpdate" UpdateCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:ControlParameter ControlID="HiddenField_app_ser" Name="app_ser" PropertyName="Value"
            Type="Int32" />
        <asp:Parameter Name="hobby_code" Type="Int16" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="HiddenField_app_ser" Name="app_ser" PropertyName="Value"
            Type="Int32" />
        <asp:Parameter Name="hobby_code" Type="Int16" />
        <asp:Parameter Name="hobby_type" Type="Int16" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField_app_ser" Name="app_ser" PropertyName="Value"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="HiddenField_app_ser" Name="app_ser" PropertyName="Value"
            Type="Int32" />
        <asp:Parameter Name="hobby_code" Type="Int16" />
        <asp:Parameter Name="ser_no" Type="Int16" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="dts_hobby_type" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
    SelectCommand="SELECT * FROM [hobby_type]"></asp:SqlDataSource>
<asp:SqlDataSource ID="dst_hobby_combo_main" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
    SelectCommand="SELECT * FROM [hobby_tab]"></asp:SqlDataSource>
<asp:SqlDataSource ID="dts_hobby_combo" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
    SelectCommand="GetHobyyCombo" SelectCommandType="StoredProcedure">
    <SelectParameters>
        <asp:Parameter Name="hobby_type" Type="Byte" />
    </SelectParameters>
</asp:SqlDataSource>


