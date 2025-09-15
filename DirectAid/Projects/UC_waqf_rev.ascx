<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UC_waqf_rev.ascx.vb"
    Inherits="DirectAid.UC_waqf_rev" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<table width="100%">
    <tbody>
        <tr>
            <td align="center" colspan="7">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView1"
                    Width="100%" DataSourceID="SqlDataSource1" RightToLeft="True" KeyFieldName="rev_id">
                    <Columns>
                        <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="25%">
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
                        <dx:GridViewDataTextColumn FieldName="waqf_no" ReadOnly="True" VisibleIndex="1" Visible="False">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="rev_id" VisibleIndex="2" ReadOnly="True" Caption="الرقم"
                            Width="25%">
                            <EditFormSettings Visible="False" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="rev_date" VisibleIndex="3" Caption="التاريخ"
                            Width="25%">
                            <EditFormSettings />
                            <PropertiesDateEdit>
                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="">
                                    <RequiredField ErrorText="" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesDateEdit>
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="revenue" VisibleIndex="5" Caption="القيمه"
                            Width="25%">
                            <EditFormSettings />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                            <PropertiesTextEdit>
                                <MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />
                                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" ErrorText="">
                                    <RequiredField ErrorText="" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True"></SettingsBehavior>
                    <SettingsPager>
                        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <SettingsEditing Mode="Inline" EditFormColumnCount="2" />
                    <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True"
                        ShowFilterRow="True" />
                </dx:ASPxGridView>
            </td>
        </tr>
    </tbody>
</table>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [waqf_rev] WHERE ([waqf_no] = @waqf_no)"
    ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [waqf_rev] WHERE [waqf_no] = @original_waqf_no AND [rev_id] = @original_rev_id"
    InsertCommand="INSERT INTO [waqf_rev] ([waqf_no], [rev_id], [rev_date], [project_flag], [revenue]) VALUES (@waqf_no, @rev_id, @rev_date, 0, @revenue)"
    UpdateCommand="UPDATE [waqf_rev] SET [rev_date] = @rev_date, [revenue] = @revenue WHERE [waqf_no] = @original_waqf_no AND [rev_id] = @original_rev_id">
    <DeleteParameters>
        <asp:Parameter Name="original_waqf_no" Type="Int32" />
        <asp:Parameter Name="original_rev_id" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:SessionParameter DefaultValue="0" Name="waqf_no" SessionField="waqf_no" Type="Int32" />
        <asp:Parameter Name="rev_id" Type="Int32" />
        <asp:Parameter Name="rev_date" Type="DateTime" />
        <asp:Parameter Name="revenue" Type="Decimal" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="waqf_no" SessionField="waqf_no" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="rev_date" Type="DateTime" />
        <asp:Parameter Name="revenue" Type="Decimal" />
        <asp:Parameter Name="original_waqf_no" Type="Int32" />
        <asp:Parameter Name="original_rev_id" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_GetNextID" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT isnull(max(rev_id), 0) + 1 as id FROM waqf_rev WHERE (waqf_no = @waqf_no)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="waqf_no" SessionField="waqf_no" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
