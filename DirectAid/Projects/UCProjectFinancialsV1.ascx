<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectFinancialsV1.ascx.vb"
    Inherits="DirectAid.UCProjectFinancialsV1" %>
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
        <dx:GridViewDataTextColumn FieldName="TheType" VisibleIndex="2" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="DateAndTime" VisibleIndex="3" Caption="التاريخ" Width="10%">
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="Desciption" VisibleIndex="4" Caption="الوصف" Width="30%">
            <editformsettings columnspan="2" />
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Quantity" VisibleIndex="6" Caption="العدد" Width="10%">
            <propertiestextedit>
                    
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    
</propertiestextedit>
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="7" Caption="السعر" Width="10%">
            <propertiestextedit>
                    
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                    
</propertiestextedit>
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Amount" VisibleIndex="8" Caption="المبلغ" Width="10%">
                    <propertiestextedit>
                        
                    <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                        
</propertiestextedit>
                    <editformsettings visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
                    <footercellstyle horizontalalign="Center">
                    </footercellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="LocalOrImported" VisibleIndex="5" Caption="محلى/مستورد" Width="10%">
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="UnitType" VisibleIndex="6" Caption="الوحده" Width="10%">
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
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [ProjectFinancials] WHERE [ID] = @original_ID"
    InsertCommand="INSERT INTO [ProjectFinancials] ([project_id], [TheType], [DateAndTime], [Desciption], [Quantity], [Price], [LocalOrImported], [UnitType]) VALUES (@project_id, @TheType, @DateAndTime, @Desciption, @Quantity, @Price, @LocalOrImported, @UnitType)"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT *, CAST((Quantity * Price) AS DECIMAL(18,3)) As Amount FROM [ProjectFinancials] WHERE (([project_id] = @project_id) AND ([TheType] = @TheType))"
    UpdateCommand="UPDATE [ProjectFinancials] SET [project_id] = @project_id, [TheType] = @TheType, [DateAndTime] = @DateAndTime, [Desciption] = @Desciption, [Quantity] = @Quantity, [Price] = @Price, [LocalOrImported] = @LocalOrImported, [UnitType] = @UnitType WHERE [ID] = @original_ID">
    <DeleteParameters>
        <asp:Parameter Name="original_ID" Type="Int64" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter Name="project_id" QueryStringField="project_id"
            Type="Int32" />
        <asp:QueryStringParameter Name="TheType" QueryStringField="TheType" Type="Byte" />
        <asp:Parameter Name="DateAndTime" Type="DateTime" />
        <asp:Parameter Name="Desciption" Type="String" />
        <asp:Parameter Name="Quantity" Type="Decimal" />
        <asp:Parameter Name="Price" Type="Decimal" />
        <asp:Parameter Name="LocalOrImported" Type="String" />
        <asp:Parameter Name="UnitType" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="project_id" QueryStringField="project_id"
            Type="Int32" />
        <asp:QueryStringParameter Name="TheType" QueryStringField="TheType" Type="Byte" />
    </SelectParameters>
    <UpdateParameters>
        <asp:QueryStringParameter Name="project_id" QueryStringField="project_id"
            Type="Int32" />
        <asp:QueryStringParameter Name="TheType" QueryStringField="TheType" Type="Byte" />
        <asp:Parameter Name="DateAndTime" Type="DateTime" />
        <asp:Parameter Name="Desciption" Type="String" />
        <asp:Parameter Name="Quantity" Type="Decimal" />
        <asp:Parameter Name="Price" Type="Decimal" />
        <asp:Parameter Name="LocalOrImported" Type="String" />
        <asp:Parameter Name="UnitType" Type="String" />
        <asp:Parameter Name="original_ID" Type="Int64" />
    </UpdateParameters>
</asp:SqlDataSource>

