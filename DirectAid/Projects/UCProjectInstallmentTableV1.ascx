<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectInstallmentTableV1.ascx.vb"
    Inherits="DirectAid.UCProjectInstallmentTableV1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource1" KeyFieldName="ID"
    meta:resourcekey="ASPxGridView1Resource1" Caption="جدول السداد">
    <totalsummary>
        <dx:ASPxSummaryItem DisplayFormat="{0:N3}" FieldName="Paid" ShowInColumn="المبلغ المسدد" SummaryType="Sum" ValueDisplayFormat="{0:N3}" />
    </totalsummary>
    <columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Width="20%">
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
                    <clearfilterbutton visible="True">
                        <image url="~/Images/Cancel_32x32.png">
                        </image>
                    </clearfilterbutton>
                    <HeaderStyle HorizontalAlign="Center" />
                    <cellstyle horizontalalign="Center">
                    </cellstyle>
                </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Visible="False">
            <editformsettings visible="False" />
        </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="project_id" VisibleIndex="2" Visible="False">
</dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="DateAndTime" VisibleIndex="4" Caption="التاريخ" Width="20%">
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="InstallmentValue" VisibleIndex="5" Caption="قيمه القسط" Width="20%">
            <propertiestextedit>
<masksettings mask="&lt;0..9999999&gt;.&lt;000..999&gt;"></masksettings>
</propertiestextedit>
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Paid" VisibleIndex="6" Caption="المبلغ المسدد" Width="20%">
            <propertiestextedit>
<masksettings mask="&lt;0..9999999&gt;.&lt;000..999&gt;"></masksettings>
</propertiestextedit>
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
            <footercellstyle horizontalalign="Center">
            </footercellstyle>
        </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="الاسره" FieldName="FamilyID" VisibleIndex="3" Width="20%">
                    <propertiescombobox datasourceid="SqlDataSource2" textfield="Name" valuefield="ID" valuetype="System.Int64"></propertiescombobox>
                </dx:GridViewDataComboBoxColumn>
    </columns>
    <settingsbehavior confirmdelete="True" enablecustomizationwindow="True" />
    <settingspager rendermode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </settingspager>
    <settingsediting editformcolumncount="3" />
    <settings showfooter="True" showfilterrow="True" />
    <settingstext confirmdelete="هل تريد الحذف" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [ProjectInstallmentTable] WHERE [ID] = @original_ID"
    InsertCommand="INSERT INTO [ProjectInstallmentTable] ([project_id], [DateAndTime], [InstallmentValue], [Paid], FamilyID) VALUES (@project_id, @DateAndTime, @InstallmentValue, @Paid, @FamilyID)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ProjectInstallmentTable] WHERE ([project_id] = @project_id)"
    UpdateCommand="UPDATE [ProjectInstallmentTable] SET [DateAndTime] = @DateAndTime, [InstallmentValue] = @InstallmentValue, [Paid] = @Paid , FamilyID = @FamilyID WHERE [ID] = @original_ID" ConflictDetection="CompareAllValues">
    <DeleteParameters>
        <asp:Parameter Name="original_ID" Type="Int64" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter Name="project_id" QueryStringField="project_id"
            Type="Int32" />
        <asp:Parameter Name="DateAndTime" Type="DateTime" />
        <asp:Parameter Name="InstallmentValue" Type="Decimal" />
        <asp:Parameter Name="Paid" Type="Decimal" />
        <asp:Parameter Name="FamilyID" Type="Int64" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="project_id" QueryStringField="project_id"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="DateAndTime" Type="DateTime" />
        <asp:Parameter Name="InstallmentValue" Type="Decimal" />
        <asp:Parameter Name="Paid" Type="Decimal" />
        <asp:Parameter Name="original_ID" Type="Int64" />
        <asp:Parameter Name="FamilyID" Type="Int64" />
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" SelectCommand="SELECT [ID], [Name] FROM [ProjectFamily] WHERE ([project_id] = @project_id)">
    <SelectParameters>
        <asp:QueryStringParameter Name="project_id" QueryStringField="project_id" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>


