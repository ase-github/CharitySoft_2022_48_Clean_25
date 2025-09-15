<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectOfficalsV1.ascx.vb"
    Inherits="DirectAid.UCProjectOfficalsV1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource1" KeyFieldName="ID"
    meta:resourcekey="ASPxGridView1Resource1">
    <totalsummary>
        <dx:ASPxSummaryItem DisplayFormat="{0:N3}" FieldName="Amount" ShowInColumn="المبلغ" SummaryType="Sum" ValueDisplayFormat="{0:N3}" />
    </totalsummary>
    <columns>
                <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="10%">
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
                    <HeaderStyle HorizontalAlign="Center" />
                    <cellstyle horizontalalign="Center">
                    </cellstyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="0" Visible="False">
            <editformsettings visible="False" />
        </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="project_id" VisibleIndex="1" Visible="False">
</dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="4" Caption="الاسم" Width="20%">
            <editformsettings columnspan="2" />
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Age" VisibleIndex="5" Caption="العمر" Width="10%">
            <propertiestextedit>
                    
                    

<MaskSettings Mask="&lt;0..9999999&gt;" />
                    


</propertiestextedit>
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="CurrentJob" VisibleIndex="7" Caption="العمل الحالى" Width="20%">
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="EducationalLevel" VisibleIndex="6" Caption="المستوى التعليمى" Width="20%">
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Speciality" VisibleIndex="6" Caption="التخصص" Width="20%">
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
    </columns>
    <settingsbehavior confirmdelete="True" enablecustomizationwindow="True" />
    <settingspager rendermode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </settingspager>
    <settingsediting editformcolumncount="3" />
    <settings showfooter="True" />
    <settingstext confirmdelete="هل تريد الحذف" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [ProjectOfficals] WHERE [ID] = @original_ID"
    InsertCommand="INSERT INTO [ProjectOfficals] ([project_id], [Name], [Age], [EducationalLevel], [Speciality], [CurrentJob]) VALUES (@project_id, @Name, @Age, @EducationalLevel, @Speciality, @CurrentJob)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ProjectOfficals] WHERE ([project_id] = @project_id)"
    UpdateCommand="UPDATE [ProjectOfficals] SET [Name] = @Name, [Age] = @Age, [EducationalLevel] = @EducationalLevel, [Speciality] = @Speciality, [CurrentJob] = @CurrentJob WHERE [ID] = @original_ID">
    <DeleteParameters>
        <asp:Parameter Name="original_ID" Type="Int64" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter Name="project_id" QueryStringField="project_id"
            Type="Int32" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Age" Type="Byte" />
        <asp:Parameter Name="EducationalLevel" Type="String" />
        <asp:Parameter Name="Speciality" Type="String" />
        <asp:Parameter Name="CurrentJob" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="project_id" QueryStringField="project_id"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="Age" Type="Byte" />
        <asp:Parameter Name="EducationalLevel" Type="String" />
        <asp:Parameter Name="Speciality" Type="String" />
        <asp:Parameter Name="CurrentJob" Type="String" />
        <asp:Parameter Name="original_ID" Type="Int64" />
    </UpdateParameters>
</asp:SqlDataSource>

