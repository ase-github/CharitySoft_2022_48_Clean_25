<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Marketing_Projects_Master_ADDNEW.aspx.vb" Inherits="DirectAid.Marketing_Projects_Master_ADDNEW" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 100%;
            border: 1px solid #000000;
        }
            </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
     <script type="text/javascript">

        function Save_Begin() {


            if (ASPxClientEdit.ValidateGroup("ChkB4Save")) {
                ASPxButton_Save.SetEnabled(false);
                ASPxLoadingPanel1.Show();
                ASPxCallback_Save.PerformCallback(null);
            }
        }

        function Save_End(e) {

            var result = e.result;
            //(!isNaN(result)) 
            if  (result == "Done") {
                alert("تم الحفظ");
               // document.getElementById('<%= ASPxButton_New.ClientID%>').click();
                ASPxButton_New.DoClick();
               // app_ser.SetValue(result);
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

        function OpenRecord(recordID) {
            document.location.href = '../Marketing/Marketing_Projects_Master_ADDNEW.aspx?ProjectID=' + recordID;
            document.URL
        }

        function FindByKey_Begin() {
            if (ASPxButton_FindByKey.GetValue() != null) {
                ASPxButton_FindByKey.SetEnabled(false);
                ASPxLoadingPanel1.Show();
                //ASPxCallback_Print.PerformCallback(null);
                OpenRecord(ASPxButton_FindByKey.GetValue());
            }
        }

        function ButtonEditClickByEnter(s, e) {
            if (e.htmlEvent.keyCode == 13) {
                ASPxClientUtils.PreventEventAndBubble(e.htmlEvent);
                s.GetButton(0).click();
            }
        }


        function OnSectionChanged(cmbSection) {
            cmbProjectType.PerformCallback(cmbSection.GetSelectedItem().value.toString());
        }

        function OnSectorChanged(cmbSector) {
            cmbCountry.PerformCallback(cmbSector.GetSelectedItem().value.toString());
        }

        function OnCountryChanged(cmbCountry) {
            cmbCenter.PerformCallback(cmbCountry.GetSelectedItem().value.toString());
        }

</script>

    <table align="center" class="auto-style1">
        <tr>
            <td style="width: 5px"></td>
            <td>
                <dx:ASPxCallback ID="CallBCKGenerateProjectNo" runat="server" ClientInstanceName="CallBCKGenerateProjectNo">
                    <ClientSideEvents EndCallback="function(s, e) {
	  if (s.cpNewProjectNo) {
         txtProjectNo.SetText(s.cpNewProjectNo);
       }
}" />
                </dx:ASPxCallback>
            </td>
            <td style="width: 5px"></td>
        </tr>
        <tr>
            <td style="width: 5px"></td>
            <td>
                <table align="center" class="auto-style1">
                                <tr>
                                    <td style="width: 20%">

<dx:ASPxLoadingPanel runat="server" Modal="True" ClientInstanceName="ASPxLoadingPanel1" Font-Bold="True" ID="ASPxLoadingPanel1"></dx:ASPxLoadingPanel>

                                    </td>
                                    <td style="width: 20%">
                            <dx:ASPxButton ID="ASPxButton_New" runat="server" Text="جديد" Width="100%" UseSubmitBehavior="False"
                                ClientInstanceName="ASPxButton_New" EnableClientSideAPI="True" Font-Bold="True">
                                <Image Url="~/Images/New_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                                    </td>
                                    <td style="width: 20%">
                            <dx:ASPxButton ID="ASPxButton_Save" runat="server" Text="حفظ" Width="100%" UseSubmitBehavior="False"
                                AutoPostBack="False" ClientInstanceName="ASPxButton_Save" EnableClientSideAPI="True"
                                Font-Bold="True" ValidateInvisibleEditors="True"
                                ValidationGroup="ChkB4Save">
                                <ClientSideEvents Click="function(s, e) {
	Save_Begin();
}" />
                                <Image Url="~/Images/Save_32x32.png">
                                </Image>
                            </dx:ASPxButton>
                                    </td>
                                    <td style="width: 20%">
                            <dx:ASPxButtonEdit ID="ASPxButton_FindByKey" runat="server" Width="100%" UseSubmitBehavior="False" ClientInstanceName="ASPxButton_FindByKey" EnableClientSideAPI="True"
                                Font-Bold="True" Visible="False">
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
                                    <td style="width: 20%">
<dx:ASPxCallback runat="server" ClientInstanceName="ASPxCallback_Save" ID="ASPxCallback_Save">
    <ClientSideEvents CallbackComplete="function(s, e) {
	Save_End(e);
}"
        CallbackError="function(s, e) {
	Save_Error(e);
}"></ClientSideEvents>
</dx:ASPxCallback>
                                    </td>
                                </tr>
                            </table>

            </td>
            <td style="width: 5px"></td>
        </tr>
    </table>

    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="100%" HeaderText="بيانات المشروع / الخطة">


        <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <table align="center" class="auto-style1" style="padding: 1px; margin: 1px; border: thin groove #C0C0C0; line-height: normal; text-align: center;">
      
        <tr>
            <td style="width 12%"></td>
            <td style="width 20%">
                <asp:HiddenField ID="hdnProject_ID" runat="server" />
            </td>
            <td style="width 12%">&nbsp;</td>
            <td style="width 20%">&nbsp;</td>
            <td style="width 12%">&nbsp;</td>
            <td style="width 20%"></td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 11%">
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="رقم المشروع / الخطة" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtProjectNo" runat="server" Width="100%" BackColor="#CCCCCC" ClientInstanceName="txtProjectNo" ForeColor="Black">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width 11%">
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="اسم المشروع" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtProject_Name" runat="server" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width 11%">
                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="السنة *" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtProject_Year" runat="server" Width="100%" ClientInstanceName="txtProject_Year">
                    <ClientSideEvents LostFocus="function(s, e) { 

		var ProjectNo = txtProjectNo.GetText();     
		var Project_Year = txtProject_Year.GetText();
		var Country = cmbCountry.GetText(); 		
		var Section = cmbSection.GetText(); 
  		
    if(ProjectNo ==&quot;&quot; &amp;&amp; Project_Year != &quot;&quot; &amp;&amp; Country != &quot;&quot; &amp;&amp; Section != &quot;&quot; ){
       CallBCKGenerateProjectNo.PerformCallback(txtProject_Year.GetText() + &quot;|&quot; + cmbSection.GetSelectedItem().value.toString() + &quot;|&quot; + cmbCountry.GetSelectedItem().value.toString());
   }
                } " />

                    <MaskSettings Mask="0000" />
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save" SetFocusOnError="True">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 20%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 11%">القسم *</td>
            <td style="width 20%">
                <dx:ASPxComboBox ID="cmbSection" runat="server" ClientInstanceName="cmbSection" DataSourceID="SqlDataSourceSections" IncrementalFilteringMode="Contains" TextField="Section_Desc" ValueField="Section_ID" Width="100%">
                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnSectionChanged(s); }" LostFocus="function(s, e) { 

		var ProjectNo = txtProjectNo.GetText();     
		var Project_Year = txtProject_Year.GetText();
		var Country = cmbCountry.GetText(); 		
		var Section = cmbSection.GetText(); 
  		
    if(ProjectNo ==&quot;&quot; &amp;&amp; Project_Year != &quot;&quot; &amp;&amp; Country != &quot;&quot; &amp;&amp; Section != &quot;&quot; ){
       CallBCKGenerateProjectNo.PerformCallback(txtProject_Year.GetText() + &quot;|&quot; + cmbSection.GetSelectedItem().value.toString() + &quot;|&quot; + cmbCountry.GetSelectedItem().value.toString());
   }
                } " />
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [Marketing_Sections]"></asp:SqlDataSource>
            </td>
            <td style="width 11%">نوع المشروع *</td>
            <td style="width 20%">
                <dx:ASPxComboBox ID="cmbProjectType" runat="server" ClientInstanceName="cmbProjectType" DataSourceID="SqlDataSourceProjectsTypes" OnCallback="CmbProjectType_Callback" TextField="ProjectType_Desc" ValueField="ProjectType_ID" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceProjectsTypes" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT PT.ProjectType_ID, PT.ProjectType_Desc FROM [Marketing_ProjectsTypes] PT, [Marketing_Sections] MS WHERE (PT.Section_ID = MS.Section_ID) AND (MS.Section_ID = @Section_ID) order by PT.ProjectType_Desc">
                    <SelectParameters>
                        <asp:Parameter Name="Section_ID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width 11%">تصنيف المشروع</td>
            <td style="width 20%">
                <dx:ASPxComboBox ID="cmbCategory" runat="server" DataSourceID="SqlDataSourceCategory" IncrementalFilteringMode="Contains" TextField="Category_Desc" ValueField="Category_ID" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceCategory" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [Marketing_Category]"></asp:SqlDataSource>
            </td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 11%">القطاع *</td>
            <td style="width 20%">
                <dx:ASPxComboBox ID="cmbSector" runat="server" ClientInstanceName="cmbSector" DataSourceID="SqlDataSourceSectors" IncrementalFilteringMode="Contains" TextField="Sector_Desc" ValueField="Sector_ID" Width="100%">
                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnSectorChanged(s); }" />
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceSectors" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [Marketing_Sectors]"></asp:SqlDataSource>
            </td>
            <td style="width 11%">الدولة *</td>
            <td style="width 20%">
                <dx:ASPxComboBox ID="cmbCountry" runat="server" ClientInstanceName="cmbCountry" DataSourceID="SqlDataSourceCountry" IncrementalFilteringMode="Contains" TextField="Country_Desc" ValueField="Country_ID" Width="100%">
                    <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCountryChanged(s); }" LostFocus="function(s, e) { 

		var ProjectNo = txtProjectNo.GetText();     
		var Project_Year = txtProject_Year.GetText();
		var Country = cmbCountry.GetText(); 		
		var Section = cmbSection.GetText(); 
  		
    if(ProjectNo ==&quot;&quot; &amp;&amp; Project_Year != &quot;&quot; &amp;&amp; Country != &quot;&quot; &amp;&amp; Section != &quot;&quot; ){
       CallBCKGenerateProjectNo.PerformCallback(txtProject_Year.GetText() + &quot;|&quot; + cmbSection.GetSelectedItem().value.toString() + &quot;|&quot; + cmbCountry.GetSelectedItem().value.toString());
   }
                } " />
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT CR.Country_ID, CR.Country_Desc FROM [Marketing_Countries] CR, [Marketing_Sectors] SC WHERE (CR.Sector_ID = SC.Sector_ID) AND (SC.Sector_ID = @Sector_ID) order by CR.Country_Desc">
                    <SelectParameters>
                        <asp:Parameter Name="Sector_ID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width 11%">المركز *</td>
            <td style="width 20%">
                <dx:ASPxComboBox ID="cmbCenter" runat="server" ClientInstanceName="cmbCenter" DataSourceID="SqlDataSourceCenter" IncrementalFilteringMode="Contains" TextField="Center_Desc" ValueField="Center_ID" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceCenter" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT CT.Center_ID, CT.Center_Desc FROM [Marketing_Centers] CT, [Marketing_Countries] CR WHERE (CT.Country_ID = CR.Country_ID) AND (CR.Country_ID = @Country_ID) order by CT.Center_Desc">
                    <SelectParameters>
                        <asp:Parameter Name="Country_ID" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%">&nbsp;</td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 11%">المدينة</td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtCity" runat="server" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width 11%">جهة التنفيذ *</td>
            <td style="width 20%">
                <dx:ASPxComboBox ID="cmbExecutingSide" runat="server" DataSourceID="SqlDataSourceExecutingSides" IncrementalFilteringMode="Contains" TextField="ExecutindSide_Desc" ValueField="ExecutingSide_ID" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceExecutingSides" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [Marketing_ExecutingSides]"></asp:SqlDataSource>
            </td>
            <td style="width 11%">&nbsp;</td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtReservedCount" runat="server" BackColor="#CCCCCC" ReadOnly="True" Width="100%" Visible="False">
                    <ValidationSettings Display="Dynamic">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%">&nbsp;</td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 11%">العدد المطلوب</td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtRequiredCount" runat="server" Width="100%" Text="1" BackColor="#CCCCCC" ReadOnly="True">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width 11%">تكلفة الوحدة بالعملة *</td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtUnitCost" runat="server" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width 11%">العملة *</td>
            <td style="width 20%">
                <dx:ASPxComboBox ID="cmbCurrency" runat="server" DataSourceID="SqlDataSourceCurrency" IncrementalFilteringMode="Contains" TextField="currency_descrar" ValueField="currency_code" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceCurrency" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT [currency_code], [currency_descrar] FROM [currency_tab]"></asp:SqlDataSource>
            </td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%">&nbsp;</td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 11%">تكلفة الوحدة دك</td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtUnitCostKD" runat="server" Width="100%" BackColor="#CCCCCC" ReadOnly="True">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width 11%">شهر التنفيذ</td>
            <td style="width 20%">
                <dx:ASPxComboBox ID="cmbStartMonth" runat="server" DataSourceID="SqlDataSourceStartMonth" IncrementalFilteringMode="Contains" TextField="Month_Desc" ValueField="Month_ID" Width="100%">
                    <ValidationSettings Display="Dynamic">
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceStartMonth" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [Marketing_Months]"></asp:SqlDataSource>
            </td>
            <td style="width 11%">المدة المطلوبة للتنفيذ بالشهور</td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtPeriodByMonths" runat="server" Width="100%">
                    <ValidationSettings Display="Dynamic">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width 20%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%">&nbsp;</td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 11%">عدد المستفيدين *</td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtBeneficiariesCount" runat="server" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width 11%">ظروف المشروع</td>
            <td style="width 20%">
                <dx:ASPxComboBox ID="cmbProjectConditions" runat="server" DataSourceID="SqlDataSourceProjectConditions" IncrementalFilteringMode="Contains" TextField="ProjectCondition_Desc" ValueField="ProjectCondition_ID" Width="100%">
                    <ValidationSettings Display="Dynamic">
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceProjectConditions" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [Marketing_ProjectConditions]"></asp:SqlDataSource>
            </td>
            <td style="width 11%">أشهر المواسم</td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtSeasonsMonths" runat="server" Width="100%">
                    <ValidationSettings Display="Dynamic">
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 20%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 11%">الاستفادة / الأهمية *</td>
            <td style="width 20%">
                <asp:TextBox ID="txtBenefit_Desc" runat="server" Height="100px" TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
            <td style="width 11%">المواصفات *</td>
            <td style="width 20%">
                <asp:TextBox ID="txtProject_Desc" runat="server" Height="100px" TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
            <td style="width 11%">ملاحظات</td>
            <td style="width 20%">
                <asp:TextBox ID="txtNotes" runat="server" Height="100px" TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 12%">خارج الخطة</td>
            <td style="width 20%">
                <dx:ASPxCheckBox ID="ChkIsOutofPlan" runat="server" CheckState="Unchecked" Wrap="False">
                </dx:ASPxCheckBox>
            </td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%">قناة التسويق *</td>
            <td style="width 20%">
                <dx:ASPxComboBox ID="cmbMarketingChannel" runat="server" DataSourceID="SqlDataSourceMarketingChannel" IncrementalFilteringMode="Contains" TextField="Channel_Desc" ValueField="Channel_ID" Width="100%">
                    <ValidationSettings ErrorDisplayMode="None" ValidationGroup="ChkB4Save">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceMarketingChannel" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [Marketing_Channel] WHERE ([Channel_ID] &lt;&gt; @Channel_ID)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="3" Name="Channel_ID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 11%">عرض في شاشة التسويق</td>
            <td "background-color: #C0C0C0">
                <dx:ASPxCheckBox ID="ChkIsAvailable" runat="server" CheckState="Unchecked" Wrap="False">
                </dx:ASPxCheckBox>
            </td>
            <td style="width 11%">من تاريخ</td>
            <td style="width 20%">
                <dx:ASPxDateEdit ID="dtFromDate" runat="server" EditFormat="Custom" EditFormatString="dd/MM/yyyy" Width="100%">
                </dx:ASPxDateEdit>
            </td>
            <td style="width 11%">الى تاريخ</td>
            <td style="width 20%">
                <dx:ASPxDateEdit ID="dtToDate" runat="server" EditFormat="Custom" EditFormatString="dd/MM/yyyy" Width="100%">
                </dx:ASPxDateEdit>
            </td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 12%"></td>
            <td style="width 20%">&nbsp;</td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%">&nbsp;</td>
            <td style="width 20%"></td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 11%">أضيف بواسطة</td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtAddedBy" runat="server" BackColor="#CCCCCC" ReadOnly="True" Width="100%">
                </dx:ASPxTextBox>
            </td>
            <td style="width 11%">تاريخ الاضافة</td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtAddedDate" runat="server" BackColor="#CCCCCC" ReadOnly="True" Width="100%">
                </dx:ASPxTextBox>
            </td>
            <td style="width 12%"></td>
            <td style="width 20%">&nbsp;</td>
            <td style="width 20%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 11%">عدل بواسطة</td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtEditBy" runat="server" BackColor="#CCCCCC" ReadOnly="True" Width="100%">
                </dx:ASPxTextBox>
            </td>
            <td style="width 11%">تاريخ التعديل</td>
            <td style="width 20%">
                <dx:ASPxTextBox ID="txtEditDate" runat="server" BackColor="#CCCCCC" ReadOnly="True" Width="100%">
                </dx:ASPxTextBox>
            </td>
            <td style="width 12%"></td>
            <td style="width 20%">&nbsp;</td>
            <td style="width 20%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width 12%"></td>
            <td style="width 20%">&nbsp;</td>
            <td style="width 12%"></td>
            <td style="width 20%"></td>
            <td style="width: ;">&nbsp;</td>
        </tr>
        <tr>
            <td style="width 11%">صورة المشروع *</td>
            <td colspan="5" style="width 20%">
                <table align="center" class="auto-style1">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <table align="center" class="auto-style1">
                                        <tr>
                                            <td>
                                                <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                </asp:ScriptManager>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:FileUpload ID="FileUpload1" runat="server" Width="100%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnUpload" runat="server" OnClick="btnUpload_Click" Text="Upload" UseSubmitBehavior="False" Width="20%" ValidationGroup="ChkB4Save" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dx:ASPxImage ID="imgFile" runat="server" ClientInstanceName="imgFile" Height="200px" ImageAlign="Middle" Width="800px">
                                                </dx:ASPxImage>
                                            </td>
                                        </tr>
                                    </table>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="btnUpload" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: ;">&nbsp;</td>
        </tr>
    </table>
            </dx:PanelContent>
</PanelCollection>


    </dx:ASPxRoundPanel>

    
</asp:Content>
