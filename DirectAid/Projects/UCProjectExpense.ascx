<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectExpense.ascx.vb"
    Inherits="DirectAid.UCProjectExpense" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource_project_expect_expense" KeyFieldName="exp_id" Caption="Expenses"
    meta:resourcekey="ASPxGridView1Resource1">
    <Columns>
        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="100px" meta:resourcekey="GridViewCommandColumnResource1">
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
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="exp_id" ReadOnly="True" VisibleIndex="1" Visible="False"
            meta:resourcekey="GridViewDataTextColumnResource1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataMemoColumn Caption="Remark" FieldName="exp_desc" VisibleIndex="5"
            meta:resourcekey="GridViewDataMemoColumnResource1">
            <EditFormSettings ColumnSpan="3" />
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataDateColumn FieldName="exp_date" VisibleIndex="2" Caption="Date" meta:resourcekey="GridViewDataDateColumnResource1">
            <PropertiesDateEdit DisplayFormatString="yyyy-MM-dd" EditFormat="Custom" EditFormatString="yyyy-MM-dd">
            </PropertiesDateEdit>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn Caption="Amount" FieldName="amount" VisibleIndex="4" meta:resourcekey="GridViewDataTextColumnResource2">
            <PropertiesTextEdit>
                <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="العمله" FieldName="currency_code" VisibleIndex="9">
            <PropertiesComboBox ValueType="System.Int16" DataSourceID="SqlDataSource_Currency"
                ValueField="currency_code" TextField="currency_descrar">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
    <SettingsPager PageSize="5" RenderMode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="3" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource_project_expect_expense" runat="server" ConflictDetection="CompareAllValues"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [project_expect_expense] WHERE [exp_id] = @original_exp_id "
    InsertCommand="INSERT INTO [project_expect_expense] ([project_id],exp_id, [exp_date], [exp_desc], amount,currency_code) VALUES (@project_id,@exp_id, @exp_date, @exp_desc , @amount, @currency_code)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [project_expect_expense] WHERE ([project_id] = @project_id)"
    UpdateCommand="UPDATE [project_expect_expense] SET  [exp_date] = @exp_date, [exp_desc] = @exp_desc , amount = @amount, currency_code = @currency_code WHERE [exp_id] = @original_exp_id ">
    <DeleteParameters>
        <asp:Parameter Name="original_rev_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id"
            Type="Int32" />
        <asp:Parameter Name="exp_id" Type="int32" />
        <asp:Parameter Name="exp_date" Type="DateTime" />
        <asp:Parameter Name="exp_desc" Type="String" />
        <asp:Parameter Name="amount" Type="Decimal" />
        <asp:Parameter Name="currency_code" Type="Int16" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="exp_date" Type="DateTime" />
        <asp:Parameter Name="exp_desc" Type="String" />
        <asp:Parameter Name="amount" Type="Decimal" />
        <asp:Parameter Name="original_exp_id" Type="Int32" />
        <asp:Parameter Name="currency_code" Type="Int16" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_GetNextID" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT isnull(max(exp_id), 0) + 1 as id FROM project_expect_expense">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id" />
    </SelectParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_Currency" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [currency_tab]">
</asp:SqlDataSource>
