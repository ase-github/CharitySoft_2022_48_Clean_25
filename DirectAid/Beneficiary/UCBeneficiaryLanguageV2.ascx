<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryLanguageV2.ascx.vb"
    Inherits="DirectAid.UCBeneficiaryLanguageV2" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:HiddenField ID="HiddenField_app_ser" runat="server" Value="0" />
<dx:ASPxGridView runat="server" KeyFieldName="app_ser;lang_code" AutoGenerateColumns="False" DataSourceID="dts_languages" Width="100%" ID="grd_language">
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
        <dx:GridViewDataTextColumn FieldName="app_ser" ReadOnly="True" Visible="False" VisibleIndex="1">
            <EditFormSettings Visible="False"></EditFormSettings>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn FieldName="lang_code" Caption="لغة يجيدها" VisibleIndex="2" Width="25%">
            <PropertiesComboBox EnableCallbackMode="True" DataSourceID="dts_language" TextField="lang_descrar" ValueField="lang_code" ValueType="System.Int16"></PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataCheckColumn FieldName="mother_tongue" Caption="اللغة الأم" VisibleIndex="3" Width="10%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataTextColumn Caption="التاريخ" FieldName="AddedDate" VisibleIndex="6" Width="25%">
            <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="المستخدم" FieldName="AddedBy" VisibleIndex="4" Width="25px">
            <PropertiesComboBox DataSourceID="SqlDataSourceUsers" TextField="collect_namear" ValueField="collect_id">
            </PropertiesComboBox>
         <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
    </Columns>

    <SettingsPager AlwaysShowPager="True"></SettingsPager>

    <SettingsText CommandEdit="تعديل" CommandNew="جديد" CommandDelete="إلغاء" CommandCancel="خروج" CommandUpdate="حفظ"></SettingsText>
</dx:ASPxGridView>

<asp:SqlDataSource ID="dts_languages" runat="server" ConnectionString="<%$ ConnectionStrings:Con %>"
    InsertCommand="language_speake_insert" InsertCommandType="StoredProcedure" SelectCommand="Getlanguage"
    SelectCommandType="StoredProcedure" UpdateCommand="language_speake_update" UpdateCommandType="StoredProcedure"
    DeleteCommand="lang_speakDelete" DeleteCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:ControlParameter ControlID="HiddenField_app_ser" Name="app_ser" PropertyName="Value"
            Type="Int32" />
        <asp:Parameter Name="lang_code" Type="Int16" />
    </DeleteParameters>
    <InsertParameters>
        <asp:ControlParameter ControlID="HiddenField_app_ser" Name="app_ser" PropertyName="Value"
            Type="Int32" />
        <asp:Parameter Name="lang_code" Type="Int16" />
        <asp:Parameter Name="mother_tongue" Type="Byte" />
        <asp:Parameter Name="AddedBy" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="HiddenField_app_ser" Name="app_ser" PropertyName="Value"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:ControlParameter ControlID="HiddenField_app_ser" Name="app_ser" PropertyName="Value"
            Type="Int32" />
        <asp:Parameter Name="mother_tongue" Type="Byte" />
        <asp:Parameter Name="lang_code" Type="Int16" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="dts_language" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
    SelectCommand="SELECT * FROM [languages_tab]"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT [collect_id], [collect_namear] FROM [collectors_tab]"></asp:SqlDataSource>




