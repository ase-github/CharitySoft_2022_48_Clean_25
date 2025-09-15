<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectPlan.ascx.vb"
    Inherits="DirectAid.UCProjectPlan" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>


<%  If (DesignMode) Then%>
<script src="ASPxScriptIntelliSense.js" type="text/javascript"></script>
<%  End If%>

<script type="text/javascript">

    function OpenProjectTemplate(templateID) {
        window.open("UIProjectTemplate.aspx?PROJECTTEMPLATEID=" + templateID, "", "toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=900,height=600");
    }

</script>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    KeyFieldName="id" Caption="خطط المشاريع" DataSourceID="SqlDataSource1" ClientInstanceName="ASPxGridView1">
    <clientsideevents endcallback="function(s, e) {
	StopReason.SetVisible(Stopped.GetChecked());
}" />
    <columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="15%">
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
            <CancelButton Visible="True">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </CancelButton>
            <UpdateButton Visible="True">
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
        <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="1" Caption="رقم الخطه"
            Width="5%">
            <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataSpinEditColumn FieldName="plan_year" VisibleIndex="2" Caption="السنه"
            Width="5%">
            <PropertiesSpinEdit DisplayFormatString="g" MaxValue="2100" MinValue="2012" NumberType="Integer">
                














<ValidationSettings ErrorText="" ErrorDisplayMode="ImageWithTooltip">
                    














<RequiredField ErrorText="" IsRequired="True" />
                














</ValidationSettings>
            














</PropertiesSpinEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataSpinEditColumn>
        <dx:GridViewDataComboBoxColumn FieldName="project_type_id" VisibleIndex="3" Caption="نوع المشروع"
            Width="20%">
            <PropertiesComboBox DataSourceID="SqlDataSource_ProjectType" TextField="donation_descrar"
                ValueField="donation_code" ValueType="System.Int32" callbackpagesize="5" dropdownrows="5" enablecallbackmode="True" incrementalfilteringmode="Contains">
                














<ValidationSettings ErrorText="" ErrorDisplayMode="ImageWithTooltip">
                    














<RequiredField ErrorText="" IsRequired="True" />
                














</ValidationSettings>
            














</PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataSpinEditColumn FieldName="priority" VisibleIndex="6" Caption="الاولويه"
            Width="5%">
            <PropertiesSpinEdit DisplayFormatString="g" NumberType="Integer" MaxValue="65000"
                MinValue="1">
                














<ValidationSettings ErrorText="" ErrorDisplayMode="ImageWithTooltip">
                    














<RequiredField ErrorText="" IsRequired="True" />
                














</ValidationSettings>
            














</PropertiesSpinEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataSpinEditColumn>
        <dx:GridViewDataComboBoxColumn FieldName="nat_code" VisibleIndex="4" Caption="الدوله"
            Width="10%">
            <PropertiesComboBox DataSourceID="SqlDataSource_Country" TextField="nat_descrar"
                ValueField="nat_code" ValueType="System.Int32" enablecallbackmode="True" incrementalfilteringmode="Contains">
                














<ValidationSettings ErrorText="" ErrorDisplayMode="ImageWithTooltip">
                    














<RequiredField ErrorText="" IsRequired="True" />
                














</ValidationSettings>
            














</PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn FieldName="project_template_id" VisibleIndex="6" Caption="نموذج المشروع"
            Width="25%" Visible="False">
            <PropertiesComboBox DataSourceID="SqlDataSource_ProjectTemplate" TextField="temp_name_ar"
                ValueField="temp_id">
                














<ClientSideEvents ButtonClick="function(s, e) {
    if(e.buttonIndex == 0)
    {
        s.SetValue(null);
    }
    else
    {
        OpenProjectTemplate(s.GetValue());
    }
}" />
                














<Buttons>
                    


<dx:EditButton>
                        














<Image Url="~/Images/Remove_16x16.png">
                        </Image>
                    














</dx:EditButton>
                














<dx:EditButton Text="..."></dx:EditButton>

</Buttons>
            














</PropertiesComboBox>
            <editformsettings visible="True" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
    <dx:GridViewDataTextColumn FieldName="cost" VisibleIndex="11" Caption="التكلفه بالعمله" Width="10%">
    <PropertiesTextEdit>
    



<MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
    







<ValidationSettings ErrorText="" ErrorDisplayMode="ImageWithTooltip">
    



<RequiredField ErrorText="" IsRequired="True" />
    



</ValidationSettings>
    



</PropertiesTextEdit>
        <editformsettings visible="False" />
    <HeaderStyle HorizontalAlign="Center" />
    <CellStyle HorizontalAlign="Center">
    </CellStyle>
    </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn FieldName="NetCostByDefaultCurrency" VisibleIndex="13" Caption="التكلفه النهائيه د.ك" Width="10%">
                                        <editformsettings visible="False" />
            <PropertiesTextEdit>
<MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
</PropertiesTextEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>


                <dx:GridViewDataTextColumn FieldName="TotalCost" VisibleIndex="13" Caption="الاجمالى د.ك" Width="10%">
                                        <editformsettings visible="False" />
            <PropertiesTextEdit>
<MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
</PropertiesTextEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>

        <dx:GridViewDataSpinEditColumn FieldName="plan_count" VisibleIndex="5" Caption="العدد"
            Width="5%">
            <PropertiesSpinEdit DisplayFormatString="g" NumberType="Integer" MaxValue="65000"
                MinValue="1">
                














<ValidationSettings ErrorText="" ErrorDisplayMode="ImageWithTooltip">
                    














<RequiredField ErrorText="" IsRequired="True" />
                














</ValidationSettings>
            














</PropertiesSpinEdit>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataSpinEditColumn>

                <dx:GridViewDataColumn FieldName="ApprovedCount" VisibleIndex="5" Caption="المحصل" Width="5%">
                    <editformsettings visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataColumn>

                        <dx:GridViewDataColumn FieldName="RemainCount" VisibleIndex="5" Caption="المطلوب" Width="5%" >
                            <editformsettings visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataColumn>


        <dx:GridViewDataTextColumn Caption="تكلفه التنمويه" FieldName="DevelopmentCost" Visible="False" VisibleIndex="7">
            <editformsettings visible="True" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="تكلفه البناء" FieldName="ConstructionCost" Visible="False" VisibleIndex="8">
            <editformsettings visible="True" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="تكلفه التاثيث" FieldName="FurnishCost" Visible="False" VisibleIndex="9">
            <editformsettings visible="True" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="العمله" FieldName="CostCurrency" Visible="False" VisibleIndex="10">
            <propertiescombobox datasourceid="SqlDataSource_Currency" enablecallbackmode="True" incrementalfilteringmode="Contains" textfield="currency_descrar" valuefield="currency_code" valuetype="System.Int16"></propertiescombobox>
            <editformsettings visible="True" />
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn Caption="النسبه الاداريه %" FieldName="AdministrativePercentage" Visible="True" VisibleIndex="12">
            <propertiestextedit displayformatstring="g">
<masksettings mask="&lt;0..999&gt;.&lt;000..999&gt;"></masksettings>
</propertiestextedit>
            <editformsettings visible="True" />
        </dx:GridViewDataTextColumn>


        <dx:GridViewDataCheckColumn Caption="متوقفه" FieldName="IsStopped" VisibleIndex="16">
            <propertiescheckedit clientinstancename="Stopped" enableclientsideapi="True">
<clientsideevents checkedchanged="function(s, e) {
	StopReason.SetVisible(Stopped.GetChecked());
}" valuechanged="function(s, e) {
	StopReason.SetVisible(Stopped.GetChecked());
}"></clientsideevents>
</propertiescheckedit>
            <editformsettings visible="True" />
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataComboBoxColumn FieldName="StopReason" VisibleIndex="17" Visible="False" FixedStyle="Left">
            <propertiescombobox datasourceid="SqlDataSource_ProjectPlanStopReason" textfield="NameAr" valuefield="ID" valuetype="System.Byte" clientinstancename="StopReason" enableclientsideapi="True">
<clientsideevents init="function(s, e) {

}"></clientsideevents>

<validationsettings errordisplaymode="None" errortext=""></validationsettings>
</propertiescombobox>
            <editformsettings visible="True" CaptionLocation="None" />
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataComboBoxColumn>


    </columns>
    <settingsbehavior confirmdelete="True" enablecustomizationwindow="True" />
    <settingspager pagesize="10" rendermode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </settingspager>
    <settings showfilterrow="True" showgrouppanel="True" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [project_plan] WHERE [id] = @original_id"
    InsertCommand="INSERT INTO [project_plan] ([plan_year], [project_type_id], [priority], [nat_code], [project_template_id], [cost], [plan_count], DevelopmentCost, ConstructionCost, 
                      FurnishCost, CostCurrency, AdministrativePercentage, IsStopped, StopReason, ExchangeRate) VALUES (@plan_year, @project_type_id, @priority, @nat_code, @project_template_id, (ISNULL(@DevelopmentCost , 0) +ISNULL(@ConstructionCost , 0)  + ISNULL(@FurnishCost , 0)), @plan_count, @DevelopmentCost, @ConstructionCost, 
                      @FurnishCost, @CostCurrency, @AdministrativePercentage, @IsStopped, @StopReason, (SELECT ISNULL(exch_rate, 1) FROM dbo.currency_tab WHERE (currency_code = @CostCurrency)))"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT CAST(( ( dbo.VIEW_Project_plan.cost * ISNULL(ExchangeRate, 1) ) * ISNULL(AdministrativePercentage, 0) / 100 ) + ( dbo.VIEW_Project_plan.cost * ISNULL(ExchangeRate, 1) ) AS DECIMAL(18, 3)) AS NetCostByDefaultCurrency ,*, (plan_count - ApprovedCount) AS RemainCount, ( (CAST(( ( dbo.VIEW_Project_plan.cost * ISNULL(ExchangeRate, 1) ) * ISNULL(AdministrativePercentage, 0) / 100 ) + ( dbo.VIEW_Project_plan.cost * ISNULL(ExchangeRate, 1) ) AS DECIMAL(18, 3))) * plan_count ) AS TotalCost  FROM VIEW_Project_plan INNER JOIN dbo.donations ON VIEW_Project_plan.project_type_id = donations.donation_code WHERE (donations.dimension5 IN (@dimension5_1, @dimension5_2))"
    UpdateCommand="UPDATE [project_plan] SET [plan_year] = @plan_year, [project_type_id] = @project_type_id, [priority] = @priority, [nat_code] = @nat_code, [project_template_id] = @project_template_id, [cost] = (ISNULL(DevelopmentCost , 0) +ISNULL(ConstructionCost , 0)  + ISNULL(FurnishCost , 0)), [plan_count] = @plan_count 
    ,DevelopmentCost = @DevelopmentCost, ConstructionCost = @ConstructionCost, FurnishCost = @FurnishCost, CostCurrency = @CostCurrency, AdministrativePercentage = @AdministrativePercentage, IsStopped = @IsStopped, StopReason = @StopReason , ExchangeRate = (SELECT ISNULL(exch_rate, 1) FROM dbo.currency_tab WHERE (currency_code = @CostCurrency))
    WHERE [id] = @original_id">
    <DeleteParameters>
        <asp:Parameter Name="original_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="plan_year" Type="Int32" />
        <asp:Parameter Name="project_type_id" Type="Int32" />
        <asp:Parameter Name="priority" Type="Int16" />
        <asp:Parameter Name="nat_code" Type="Int16" />
        <asp:Parameter Name="project_template_id" Type="Int32" />
        <asp:Parameter Name="cost" Type="Decimal" />
        <asp:Parameter Name="plan_count" Type="Int16" />
        <asp:Parameter Name="DevelopmentCost" Type="Decimal" />
        <asp:Parameter Name="ConstructionCost" Type="Decimal" />
        <asp:Parameter Name="FurnishCost" Type="Decimal" />
        <asp:Parameter Name="CostCurrency" Type="Int16" />
        <asp:Parameter Name="AdministrativePercentage" Type="Decimal" />
        <asp:Parameter Name="IsStopped" Type="Boolean" />
        <asp:Parameter Name="StopReason" Type="Byte" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="plan_year" Type="Int32" />
        <asp:Parameter Name="project_type_id" Type="Int32" />
        <asp:Parameter Name="priority" Type="Int16" />
        <asp:Parameter Name="nat_code" Type="Int16" />
        <asp:Parameter Name="project_template_id" Type="Int32" />
        <asp:Parameter Name="cost" Type="Decimal" />
        <asp:Parameter Name="plan_count" Type="Int16" />
        <asp:Parameter Name="original_id" Type="Int32" />
        <asp:Parameter Name="DevelopmentCost" Type="Decimal" />
        <asp:Parameter Name="ConstructionCost" Type="Decimal" />
        <asp:Parameter Name="FurnishCost" Type="Decimal" />
        <asp:Parameter Name="CostCurrency" Type="Int16" />
        <asp:Parameter Name="AdministrativePercentage" Type="Decimal" />
        <asp:Parameter Name="IsStopped" Type="Boolean" />
        <asp:Parameter Name="StopReason" Type="Byte" />
    </UpdateParameters>
        <SelectParameters>
        <asp:QueryStringParameter Name="dimension5_1" Type="String" DefaultValue="" QueryStringField="dimension5_1" />
        <asp:QueryStringParameter Name="dimension5_2" Type="String" DefaultValue="" QueryStringField="dimension5_2" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_Country" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT nat_code ,
        nat_descrar ,
        nat_desceng ,
        zone_code FROM [nat_tab]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_ProjectType" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [donations] WHERE ([dimension5] IN (4,5,6)) AND (donation_cat <> 0)"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_ProjectTemplate" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_template] "></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_Currency" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [currency_tab]"></asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource_ProjectPlanStopReason" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ProjectPlanStopReason]"></asp:SqlDataSource>

