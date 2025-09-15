<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Marketing_Projects_Search.aspx.vb" Inherits="DirectAid.Marketing_Projects_Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">

        var BillID = "";
        var ClientID = "";
        var BillNetTotal = "";
        var IsPaid = "";
        function EditProject(s, e) {
            var key = s.GetRowKey(e.visibleIndex);
            if (e.buttonID == "btEditProject") {
                window.location.replace('../Marketing/Marketing_Projects_Master_ADDNEW.aspx?ProjectID=' + key);
                //window.showModalDialog('DetailsBill.aspx?BillID=' + key, this, 'dialogHeight:800px;dialogWidth:800px;');
            }

          
            if (e.buttonID == "btPrint") {
                window.showModalDialog('PrintBill/PrintBill.aspx?BillID=' + key, this, 'dialogHeight:800px;dialogWidth:700px;');
            }
        }

         </script>

    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Caption="قائمة تسويق المشاريع / الخطط" ClientInstanceName="ASPxGridView1" DataSourceID="SqlDataSourceProjects" KeyFieldName="Project_ID" RightToLeft="True" Width="100%">
        <ClientSideEvents CustomButtonClick="EditProject
" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Project_ID" ReadOnly="True" Visible="False" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn Caption="رقم المشروع / الخطة" VisibleIndex="2" FieldName="Project_No" ReadOnly="True">
                <PropertiesHyperLinkEdit NavigateUrlFormatString="~/Marketing/Marketing_Proje000cts_Search.aspx?ProjectID={0}" Target="_blank" Text="Project_No" TextField="Project_No">
                </PropertiesHyperLinkEdit>
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" NavigateUrl='<%# String.Format("~/Marketing/Marketing_Projects_Master_ADDNEW.aspx?ProjectID={0}", Eval("Project_ID"))%>' Target="_blank" Text='<%# String.Format("{0}", Eval("Project_No")) %>' />
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
            <dx:GridViewDataTextColumn Caption="نوع المشروع" FieldName="ProjectType_Desc" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="السنة" FieldName="Project_Year" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="الدولة" FieldName="Country_ID" VisibleIndex="6">
                <PropertiesComboBox DataSourceID="SqlDataSourceCountries" TextField="Country_Desc" ValueField="Country_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="القسم" FieldName="Section_ID" VisibleIndex="13">
                <PropertiesComboBox DataSourceID="SqlDataSourceSections" TextField="Section_Desc" ValueField="Section_ID">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="تكلفة الوحدة دك" FieldName="UnitCostKD" VisibleIndex="17">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="عدد المستفيدين" FieldName="BeneficiariesCount" VisibleIndex="18">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="الاستفادة" FieldName="Benefit_Desc" VisibleIndex="19" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="الوصف" FieldName="Project_Desc" VisibleIndex="22" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="المحجوز" FieldName="ReservedCount" VisibleIndex="25">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn Caption="متاح للتسويق" FieldName="IsAvailableShow" VisibleIndex="31">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="10%">
                <DeleteButton Visible="True">
                    <Image Url="~/Images/Delete_32x32.png">
                    </Image>
                </DeleteButton>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btEditProject">
                        <Image Url="~/Images/Edit_32x32.png">
                        </Image>
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="المتبقي" FieldName="Required" VisibleIndex="29">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsBehavior ConfirmDelete="True" />
        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowFooter="True" />
        <SettingsText ConfirmDelete="هل أنت متأكد من عملية الحذف" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSourceSections" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [Marketing_Sections]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceCountries" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [Marketing_Countries]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceProjects" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:charitysoft %>" DeleteCommand="DELETE FROM [Marketing_Projects_Master] WHERE [Project_ID] = @original_Project_ID" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM VIW_Marketing_Projects_Master ">
        <DeleteParameters>
            <asp:Parameter Name="original_Project_ID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    
</asp:Content>
