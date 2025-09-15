<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="MedicalInstitution.aspx.vb" Inherits="DirectAid.MedicalInstitution" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function openTransfers(url, options) {
            var floatingWindow;
            floatingWindow = open("", "", options);
            floatingWindow.location.href = url;
            return false;
        }
       
    </script>
    <dx:ASPxGridView ID="grd_ConvoysList" runat="server" Width="100%"
        AutoGenerateColumns="False"
        KeyFieldName="inst_ID" ClientInstanceName="grid" DataSourceID="DS_medical_institutions">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="اسم المؤسسة - ع" VisibleIndex="2" FieldName="inst_name_ar">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="الكود" FieldName="manual_code"
                VisibleIndex="1">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="المركز" VisibleIndex="22" Visible="False" FieldName="center">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="المساحة الكلية" VisibleIndex="32" Visible="False" FieldName="total_area">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="المساحة المبنية" VisibleIndex="31" Visible="False" FieldName="constructed_area">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="رقم المشروع" VisibleIndex="29" FieldName="project_num">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn Caption="تاريخ التشغيل" VisibleIndex="30" Visible="False" FieldName="operating_date">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataMemoColumn Caption="ملاحظات" VisibleIndex="34" Visible="False" FieldName="main_notes">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataMemoColumn>
            
            <dx:GridViewDataComboBoxColumn Caption="الدولة" VisibleIndex="19" FieldName="country">
                <PropertiesComboBox DataSourceID="DS_Countries" IncrementalFilteringMode="Contains" TextField="nat_descrar" ValueField="nat_code" EnableCallbackMode="True">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="نوع المؤسسة" VisibleIndex="16" FieldName="inst_type">
                <PropertiesComboBox DataSourceID="DS_institution_types" IncrementalFilteringMode="Contains" TextField="inst_type_name_ar" ValueField="ID" EnableCallbackMode="True">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="القطاع" VisibleIndex="17" FieldName="sector">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="موقعه للمركز" VisibleIndex="20" Visible="False" FieldName="nearby">
                <PropertiesComboBox IncrementalFilteringMode="Contains" TextField="nearby_name_ar" ValueField="ID" DataSourceID="DS_institution_nearby">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="الحالة" VisibleIndex="24" FieldName="status">
                <PropertiesComboBox IncrementalFilteringMode="Contains" TextField="status_name_ar" ValueField="ID" DataSourceID="DS_institution_status" EnableCallbackMode="True">
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="الترخيص" VisibleIndex="25" Visible="False" FieldName="license">
                <PropertiesComboBox IncrementalFilteringMode="Contains" TextField="license_name_ar" ValueField="ID" DataSourceID="DS_institution_license" EnableCallbackMode="True">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="التيسير" VisibleIndex="28" Visible="False" FieldName="Facilitation">
                <PropertiesComboBox IncrementalFilteringMode="Contains" TextField="facilitation_name_ar" ValueField="ID" DataSourceID="DS_institution_facilitation" EnableCallbackMode="True">
                </PropertiesComboBox>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataComboBoxColumn>
            
            <dx:GridViewDataTextColumn Caption="البنية التحتية الاساسية" UnboundType="String" VisibleIndex="35">
                <Settings AllowAutoFilter="False" AllowSort="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="hyperLink_infrastructure" runat="server" OnInit="hyperLink_infrastructure_Init" Text="البنية التحتية الاساسية">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="الموارد البشرية" UnboundType="String" VisibleIndex="36">
                <Settings AllowAutoFilter="False" AllowSort="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="hyperLink_HR" runat="server" OnInit="hyperLink_HR_Init" Text="الموارد البشرية">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="المكونات و التجهيزات" UnboundType="String" VisibleIndex="39">
                <Settings AllowAutoFilter="False" AllowSort="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="hyperLink_components" runat="server" OnInit="hyperLink_components_Init" Text="المكونات و التجهيزات">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="المرفقات" UnboundType="String" VisibleIndex="40">
                <Settings AllowAutoFilter="False" AllowSort="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="hyperLink_attach" runat="server" OnInit="hyperLink_attach_Init" Text="المرفقات">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="inst_ID" Visible="False" VisibleIndex="38">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="اسم المؤسسة - E" FieldName="inst_name_en" VisibleIndex="15">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            
        </Columns>
        <SettingsEditing EditFormColumnCount="3" />
        <Settings ShowFilterRow="True" />
        <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل"
            CommandNew="جديد" CommandUpdate="حفظ" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="DS_medical_institutions" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" InsertCommand="Insert_health_medical_institutions" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [health_medical_institutions]" UpdateCommand="Update_health_medical_institutions" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:Parameter Name="manual_code" Type="String" />
            <asp:Parameter Name="inst_name_ar" Type="String" />
            <asp:Parameter Name="inst_name_en" Type="String" />
            <asp:Parameter Name="inst_type" Type="Int16" />
            <asp:Parameter Name="sector" Type="String" />
            <asp:Parameter Name="country" Type="Int32" />
            <asp:Parameter Name="nearby" Type="Int16" />
            <asp:Parameter Name="center" Type="String" />
            <asp:Parameter Name="status" Type="Int16" />
            <asp:Parameter Name="license" Type="Int16" />
            <asp:Parameter Name="Facilitation" Type="Int16" />
            <asp:Parameter Name="project_num" Type="String" />
            <asp:Parameter DbType="Date" Name="operating_date" />
            <asp:Parameter Name="total_area" Type="Decimal" />
            <asp:Parameter Name="constructed_area" Type="Decimal" />
            <asp:Parameter Name="main_notes" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:Parameter Name="inst_ID" Type="Int32" />
            <asp:Parameter Name="manual_code" Type="String" />
            <asp:Parameter Name="inst_name_ar" Type="String" />
            <asp:Parameter Name="inst_name_en" Type="String" />
            <asp:Parameter Name="inst_type" Type="Int16" />
            <asp:Parameter Name="sector" Type="String" />
            <asp:Parameter Name="country" Type="Int32" />
            <asp:Parameter Name="nearby" Type="Int16" />
            <asp:Parameter Name="center" Type="String" />
            <asp:Parameter Name="status" Type="Int16" />
            <asp:Parameter Name="license" Type="Int16" />
            <asp:Parameter Name="Facilitation" Type="Int16" />
            <asp:Parameter Name="project_num" Type="String" />
            <asp:Parameter DbType="Date" Name="operating_date" />
            <asp:Parameter Name="total_area" Type="Decimal" />
            <asp:Parameter Name="constructed_area" Type="Decimal" />
            <asp:Parameter Name="main_notes" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_institution_types" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [health_institution_types_master]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_institution_nearby" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [health_nearby_master]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_institution_status" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [health_institution_status_master]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_institution_license" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [health_license_master]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_institution_facilitation" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [health_facilitation_master]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DS_Countries" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>
    </asp:Content>
