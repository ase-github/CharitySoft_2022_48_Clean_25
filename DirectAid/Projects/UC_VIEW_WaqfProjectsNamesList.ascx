<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UC_VIEW_WaqfProjectsNamesList.ascx.vb"
    Inherits="DirectAid.UC_VIEW_WaqfProjectsNamesList" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<table width="100%">
    <tbody>
        <tr>
            <td align="center" colspan="7">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView1"
                    Width="100%" DataSourceID="SqlDataSource1" RightToLeft="True" KeyFieldName="name_ser">
                    <Columns>
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
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="name_ser" ReadOnly="false" VisibleIndex="1"
                            Caption="الرقم" Width="10%">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="الاسم" FieldName="name_ar" VisibleIndex="2" Width="55%">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Name" FieldName="name_eng" VisibleIndex="3" Width="75%"
                            Visible="False">
                            <EditFormSettings Visible="True" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataCheckColumn Caption="اعاده" FieldName="reuse_flag" VisibleIndex="4"
                            Width="10%">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataCheckColumn Caption="التالى" FieldName="next_name" VisibleIndex="5"
                            Width="10%">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dx:GridViewDataCheckColumn>
                    </Columns>
                    <SettingsBehavior ConfirmDelete="True" EnableCustomizationWindow="True" />
                    <SettingsPager>
                        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
                        </PageSizeItemSettings>
                    </SettingsPager>
                    <SettingsEditing EditFormColumnCount="1" Mode="EditForm" />
                    <Settings EnableFilterControlPopupMenuScrolling="True" ShowFilterRowMenu="True" ShowHeaderFilterButton="True"
                        ShowFilterRow="True" />
                </dx:ASPxGridView>
            </td>
        </tr>
    </tbody>
</table>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [VIEW_WaqfProjectsNamesList] WHERE ([waqf_no] = @waqf_no)"
    DeleteCommand="DELETE FROM waqf_projects_names_list WHERE (name_ser = @name_ser)"
    InsertCommand="INSERT INTO waqf_projects_names_list(waqf_no, name_ser, name_ar, name_eng, reuse_flag, next_name) VALUES (@waqf_no, @name_ser, @name_ar, @name_eng, @reuse_flag, @next_name)"
    UpdateCommand="update waqf_projects_names_list
set  name_ar  = @name_ar

,name_eng  = @name_eng
,reuse_flag  = @reuse_flag
,next_name  = @next_name
where name_ser = @name_ser">
    <DeleteParameters>
        <asp:Parameter Name="name_ser" />
    </DeleteParameters>
    <InsertParameters>
        <asp:SessionParameter DefaultValue="0" Name="waqf_no" SessionField="waqfNo" Type="Int32" />
        <asp:Parameter Name="name_ser" />
        <asp:Parameter Name="name_ar" />
        <asp:Parameter Name="name_eng" />
        <asp:Parameter Name="reuse_flag" />
        <asp:Parameter Name="next_name" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="0" Name="waqf_no" SessionField="waqfNo" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="name_ar" />
        <asp:Parameter Name="name_ser" />
        <asp:Parameter Name="name_eng" />
        <asp:Parameter Name="reuse_flag" />
        <asp:Parameter Name="next_name" />
    </UpdateParameters>
</asp:SqlDataSource>
