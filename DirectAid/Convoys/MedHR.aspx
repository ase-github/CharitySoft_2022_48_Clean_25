<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MedHR.aspx.vb" Inherits="DirectAid.MedHR" MasterPageFile="~/Site.Master" %>

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
    <div>

        <dx:ASPxGridView ID="grd_ConvoysList" runat="server" Width="100%"
            AutoGenerateColumns="False"
            KeyFieldName="emp_ID" ClientInstanceName="grid" RightToLeft="True" DataSourceID="DS_HR">
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <EditButton Visible="True">
                    </EditButton>
                    <NewButton Visible="True">
                    </NewButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataComboBoxColumn Caption="الوظيفة" VisibleIndex="2" FieldName="position">
                    <PropertiesComboBox DataSourceID="job_tab_DS" IncrementalFilteringMode="Contains" TextField="job_descr_ar" ValueField="job_code">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="الاسم - ع" VisibleIndex="3" FieldName="emp_name_ar" Width="150px">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn Caption="ملاحظات" VisibleIndex="32" FieldName="notes" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataMemoColumn>

                <dx:GridViewDataComboBoxColumn Caption="الجنسية" VisibleIndex="5" FieldName="nat_code">
                    <PropertiesComboBox DataSourceID="DS_Countries" IncrementalFilteringMode="Contains" TextField="nat_descrar" ValueField="nat_code">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataTextColumn Caption="الاسم - E" FieldName="emp_name_en" VisibleIndex="4" Width="150px">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>

                <dx:GridViewDataTextColumn Caption="الراتب" FieldName="Salary" VisibleIndex="6">
                    <PropertiesTextEdit NullText="0.000">
                    <ValidationSettings>
                        <RegularExpression ErrorText="برجاء ادخال ارقام" ValidationExpression="^(?=.*\d)\d*(?:\.\d{0,3})?$" />
                    </ValidationSettings>
                </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="تاريخ الالتحاق بالوظيفة" FieldName="joining_date" VisibleIndex="7">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="تاريخ التقاعد" FieldName="retirement_date" VisibleIndex="9">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="المرفقات" UnboundType="String" VisibleIndex="33">
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="hyperLink_attach" OnInit="hyperLink_attach_Init" runat="server" Text="المرفقات">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
                <Settings AllowAutoFilter="False" AllowSort="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
                 <dx:GridViewDataTextColumn Caption="الاجازات" UnboundType="String" VisibleIndex="35">
                <DataItemTemplate>
                    <dx:ASPxHyperLink ID="hyperLink_vacation" OnInit="hyperLink_vacation_Init" runat="server" Text="الاجازات">
                    </dx:ASPxHyperLink>
                </DataItemTemplate>
                <Settings AllowAutoFilter="False" AllowSort="False" ShowFilterRowMenu="False" ShowFilterRowMenuLikeItem="False" ShowInFilterControl="False" />
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="emp_ID" VisibleIndex="1" Caption="الكود">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsEditing EditFormColumnCount="3" />
            <Settings ShowFilterRow="True" />
            <SettingsText CommandCancel="الغاء" CommandDelete="ازالة" CommandEdit="تعديل"
                CommandNew="جديد" CommandUpdate="حفظ" />
        </dx:ASPxGridView>

        <asp:SqlDataSource ID="DS_HR" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" InsertCommand="Insert_health_employees" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [health_employees]" UpdateCommand="Update_health_employees" UpdateCommandType="StoredProcedure">
            <InsertParameters>
                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                <asp:Parameter Name="emp_name_ar" Type="String" />
                <asp:Parameter Name="emp_name_en" Type="String" />
                <asp:Parameter Name="position" Type="Int32" />
                <asp:Parameter Name="nat_code" Type="Int32" />
                <asp:Parameter Name="notes" Type="String" />
                <asp:Parameter Name="salary" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="joining_date" />
                <asp:Parameter DbType="Date" Name="retirement_date" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                <asp:Parameter Name="emp_ID" Type="Int32" />
                <asp:Parameter Name="emp_name_ar" Type="String" />
                <asp:Parameter Name="emp_name_en" Type="String" />
                <asp:Parameter Name="position" Type="Int32" />
                <asp:Parameter Name="nat_code" Type="Int32" />
                <asp:Parameter Name="notes" Type="String" />
                <asp:Parameter Name="salary" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="joining_date" />
                <asp:Parameter DbType="Date" Name="retirement_date" />
            </UpdateParameters>
        </asp:SqlDataSource>

    </div>

    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [job_codes]" ID="job_tab_DS"></asp:SqlDataSource>

    <asp:SqlDataSource ID="DS_Countries" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [nat_tab]"></asp:SqlDataSource>

</asp:Content>
