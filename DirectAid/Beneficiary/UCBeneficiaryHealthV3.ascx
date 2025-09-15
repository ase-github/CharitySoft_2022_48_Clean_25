<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryHealthV3.ascx.vb"
    Inherits="DirectAid.UCBeneficiaryHealthV3" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Xpo.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Xpo" TagPrefix="dx" %>




<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource_Main" Width="100%" ClientInstanceName="ASPxGridView1" KeyFieldName="ser_no" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
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
        <dx:GridViewDataComboBoxColumn Caption="الحاله الصحيه" FieldName="health_status" VisibleIndex="3">
            <PropertiesComboBox DataSourceID="dts_health_status" TextField="health_descr_ar" ValueField="health_code" ValueType="System.Int16">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="حاله السمع" FieldName="hearing_status" VisibleIndex="4">
                        <PropertiesComboBox DataSourceID="dts_health_status" TextField="health_descr_ar" ValueField="health_code" ValueType="System.Int16">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="حاله النظر" FieldName="eye_status" VisibleIndex="4">
                        <PropertiesComboBox DataSourceID="dts_health_status" TextField="health_descr_ar" ValueField="health_code" ValueType="System.Int16">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="الحاله النفسيه" FieldName="psych_status" VisibleIndex="5">
            <PropertiesComboBox DataSourceID="dts_psych_state" TextField="psych_stat_namear" ValueField="psych_stat_code" ValueType="System.Int16">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="المظهر العام" FieldName="general_appearance" VisibleIndex="6">
            <PropertiesComboBox DataSourceID="dts_general_appearance" TextField="descr_ar" ValueField="status_code" ValueType="System.Int16">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="عمليات جراحيه" FieldName="surger_status" VisibleIndex="6">
            <PropertiesComboBox DataSourceID="dts_surgery" TextField="surgery_name_ar" ValueField="surgery_code" ValueType="System.Int16">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="المرض الحالى" FieldName="current_disease" VisibleIndex="7">
            <PropertiesComboBox DataSourceID="dts_disease" TextField="disease_descr_ar" ValueField="disease_code" ValueType="System.Int16">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="disease_descr" VisibleIndex="8" Caption="التاريخ المرضى">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn Caption="كارت تطعيم" FieldName="vacc_doc" VisibleIndex="9">
            <PropertiesCheckEdit ValueChecked="1" ValueType="System.Byte" ValueUnchecked="0">
            </PropertiesCheckEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataDateColumn FieldName="status_date" VisibleIndex="10" Caption="تاريخ الحاله">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="report_date" VisibleIndex="11" Caption="تاريخ التقرير">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataDateColumn>
         <dx:GridViewDataTextColumn Caption="التاريخ" FieldName="AddedDate" VisibleIndex="14">
            <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="المستخدم" FieldName="AddedBy" VisibleIndex="13">
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
<asp:EntityDataSource ID="EntityDataSource_Main" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="orphans_health_log" Where="" EntityTypeFilter="orphans_health_log">
    <WhereParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="app_ser" QueryStringField="OrphanID" Type="Int32"/>
    </WhereParameters>
</asp:EntityDataSource>





                        <asp:SqlDataSource ID="dts_general_appearance" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                            SelectCommand="SELECT * FROM [general_appearance_tab]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dts_disease" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                            SelectCommand="SELECT * FROM [disease_tab]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dts_surgery" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                            SelectCommand="SELECT * FROM [surgery_tab]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dts_psych_state" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                            SelectCommand="SELECT * FROM [psych_state_tab]"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="dts_health_status" runat="server" ConnectionString="<%$ ConnectionStrings:con %>"
                            SelectCommand="SELECT * FROM [health_status]"></asp:SqlDataSource>
                    





<asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT [collect_id], [collect_namear] FROM [collectors_tab]"></asp:SqlDataSource>






                    





