<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectTemplate.ascx.vb"
    Inherits="DirectAid.UCProjectTemplate" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>


<%  If (DesignMode) Then%>
<script src="ASPxScriptIntelliSense.js" type="text/javascript"></script>
<%  End If%>
<dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" ShowProgressPanel="True"
    ShowUploadButton="True" UploadMode="Advanced" Width="100%" ClientInstanceName="ASPxUploadControl1"
    meta:resourcekey="ASPxUploadControl1Resource1">
    <clientsideevents filesuploadcomplete="function(s, e) {
	ASPxGridView_project_template.Refresh();
}"
        fileuploadcomplete="function(s, e) {
	ASPxGridView_project_template.Refresh();
}" />
    <advancedmodesettings enablemultiselect="True"
        temporaryfolder="~\ProjectTemplate\" />
</dx:ASPxUploadControl>
<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    KeyFieldName="temp_id" Caption="نماذج المشاريع" DataSourceID="SqlDataSource_project_template"
    ClientInstanceName="ASPxGridView_project_template">
    <columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="100px">
            <EditButton Visible="True">
                <Image Url="~/Images/Edit_32x32.png">
                </Image>
            </EditButton>
            <NewButton>
                <Image Url="~/Images/New_32x32.png">
                </Image>
            </NewButton>
            <DeleteButton Visible="True">
                <Image Url="~/Images/Delete_32x32.png">
                </Image>
            </DeleteButton>
            <CancelButton Visible="True">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </CancelButton>
            <UpdateButton Visible="True">
                <Image Url="~/Images/Save_32x32.png">
                </Image>
            </UpdateButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="temp_id" ReadOnly="True" VisibleIndex="1" Visible="False">
            <settings autofiltercondition="Equals" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataImageColumn Caption="الصوره" FieldName="template_photo" VisibleIndex="2"
            Width="100px">
            <PropertiesImage DisplayFormatString="{0}" EnableClientSideAPI="True" ImageHeight="100px"
                ImageWidth="100px">
            </PropertiesImage>
            <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataImageColumn>
        <dx:GridViewDataTextColumn Caption="الاسم بالعربيه" FieldName="temp_name_ar" VisibleIndex="4"
            Width="100%">
            <EditFormSettings ColumnSpan="2" />
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الاسم بالانجليزيه" FieldName="temp_name_en" VisibleIndex="4"
            Width="100%">
            <EditFormSettings ColumnSpan="2" />
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="الدولة" FieldName="country_id" VisibleIndex="9">
            <PropertiesComboBox ValueType="System.Int32" DataSourceID="SqlDataSource_Country"
                ValueField="nat_code" TextField="nat_descrar" enablecallbackmode="True" incrementalfilteringmode="Contains">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="النوع" FieldName="project_type" VisibleIndex="9">
            <PropertiesComboBox DataSourceID="SqlDataSource_ProjectType" TextField="donation_descrar"
                ValueField="donation_code" ValueType="System.Int32" callbackpagesize="5" dropdownrows="5" enablecallbackmode="True" incrementalfilteringmode="Contains">
            
<validationsettings errortext="*">
<requiredfield isrequired="True"></requiredfield>
</validationsettings>

</PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn Caption="الموقع" FieldName="temp_site" VisibleIndex="7">
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="الأهمية" FieldName="importance" VisibleIndex="8">
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn Caption="عدد المستفيدين" FieldName="BeneficiaryCount"
            VisibleIndex="4">
            <PropertiesTextEdit>
                






<MaskSettings Mask="&lt;0..9999999&gt;" />
            






</PropertiesTextEdit>
        </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn Caption="فوائد المشروع" FieldName="Benefits" VisibleIndex="8">
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn Caption="ملاحظات" FieldName="Remarks" VisibleIndex="8">
                    <editformsettings columnspan="3" />
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataTextColumn>

    </columns>
    <settingsbehavior confirmdelete="True" enablecustomizationwindow="True" />
    <settingspager pagesize="5" rendermode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </settingspager>
    <settingsediting editformcolumncount="3" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource_project_template" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [project_template] WHERE [temp_id] = @original_temp_id"
    InsertCommand="INSERT INTO [project_template] (temp_id, temp_name_ar, temp_name_en, country_id, project_type, template_photo,temp_site, importance, BeneficiaryCount , Benefits, Remarks) VALUES (@temp_id, @temp_name_ar, @temp_name_en, @country_id, @project_type,@template_photo, @temp_site, @importance, @BeneficiaryCount , @Benefits, @Remarks)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT project_template.* FROM project_template LEFT OUTER JOIN donations ON project_template.project_type = donations.donation_code WHERE (donations.dimension5 IN (@dimension5_1, @dimension5_2)) OR (project_type = 1) ORDER BY temp_id"
    UpdateCommand="UPDATE [project_template] SET 
    temp_name_ar = @temp_name_ar, temp_name_en = @temp_name_en, country_id = @country_id, project_type = @project_type,template_photo = @template_photo, temp_site = @temp_site, importance = @importance
    ,BeneficiaryCount = @BeneficiaryCount, Benefits = @Benefits , Remarks = @Remarks WHERE [temp_id] = @original_temp_id ">
    <DeleteParameters>
        <asp:Parameter Name="original_temp_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="temp_id" Type="Int32" />
        <asp:Parameter Name="temp_name_ar" Type="String" DefaultValue="" />
        <asp:Parameter Name="temp_name_en" Type="String" DefaultValue="" />
        <asp:Parameter Name="country_id" Type="Int32" DefaultValue="1" />
        <asp:Parameter Name="project_type" Type="Int32" DefaultValue="1" />
        <asp:Parameter Name="template_photo" Type="String" />
        <asp:Parameter Name="temp_site" Type="String" DefaultValue="" />
        <asp:Parameter Name="importance" Type="String" DefaultValue="" />
        <asp:Parameter Name="BeneficiaryCount" Type="Int32" DefaultValue="" />
        <asp:Parameter Name="Benefits" Type="String" DefaultValue="" />
        <asp:Parameter Name="Remarks" Type="String" DefaultValue="" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="temp_name_ar" Type="String" />
        <asp:Parameter Name="temp_name_en" Type="String" />
        <asp:Parameter Name="country_id" Type="Int32" />
        <asp:Parameter Name="project_type" Type="Int32" />
        <asp:Parameter Name="template_photo" Type="String" />
        <asp:Parameter Name="temp_site" Type="String" DefaultValue="" />
        <asp:Parameter Name="importance" Type="String" DefaultValue="" />
        <asp:Parameter Name="BeneficiaryCount" Type="Int32" DefaultValue="" />
        <asp:Parameter Name="Benefits" Type="String" DefaultValue="" />
        <asp:Parameter Name="Remarks" Type="String" DefaultValue="" />
        <asp:Parameter Name="original_temp_id" Type="Int32" />
    </UpdateParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="dimension5_1" Type="String" DefaultValue="" QueryStringField="dimension5_1" />
        <asp:QueryStringParameter Name="dimension5_2" Type="String" DefaultValue="" QueryStringField="dimension5_2" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_GetNextID" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT isnull(max(temp_id), 0) + 1 as id FROM project_template"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_Country" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT nat_code ,
        nat_descrar ,
        nat_desceng ,
        zone_code FROM [nat_tab]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_ProjectType" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [donations] WHERE ([dimension5] IN (4,5,6)) AND (donation_cat <> 0)"></asp:SqlDataSource>
