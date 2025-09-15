<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCProjectLetter.ascx.vb"
    Inherits="DirectAid.UCProjectLetter" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="EntityDataSource_project_letters" KeyFieldName="letter_id" Caption="Letters"
    meta:resourcekey="ASPxGridView1Resource1">
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
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="letter_id" ReadOnly="True" VisibleIndex="1"
            Visible="False">
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataMemoColumn Caption="الوصف" FieldName="letter_desc" VisibleIndex="5" Width="60%">
            <EditFormSettings ColumnSpan="3" />
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataMemoColumn>
        <dx:GridViewDataComboBoxColumn Caption="صادر/وارد" FieldName="letter_in_out" VisibleIndex="2" Width="5%">
            <PropertiesComboBox ValueType="System.Byte" datasourceid="ObjectDataSource_LetterInOut" textfield="NameAr" valuefield="ID">
                <Items>
                    


<dx:ListEditItem Text="صادر" Value="0" />
                    


<dx:ListEditItem Text="وارد" Value="1" />
                


</Items>
            


</PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="الجھة المرسل إلیھا" FieldName="to_recipient"
            VisibleIndex="4" Width="10%">
            <PropertiesComboBox ValueType="System.Int16" datasourceid="ObjectDataSource_LetterRecipient" textfield="NameAr" valuefield="ID">
                <Items>
                    


<dx:ListEditItem Text="المتبرع" Value="1" />
                    


<dx:ListEditItem Text="القطاع" Value="2" />
                    


<dx:ListEditItem Text="المالیة" Value="3" />
                    


<dx:ListEditItem Text="أخرى" Value="4" />
                


</Items>
            


</PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="letter_date" VisibleIndex="3" Width="10%">
            <propertiesdateedit displayformatstring=""></propertiesdateedit>
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataDateColumn>
    </columns>
    <settingsbehavior confirmdelete="True" enablecustomizationwindow="True" />
    <settingspager pagesize="5" rendermode="Lightweight">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </settingspager>
    <settingsediting editformcolumncount="3" />
</dx:ASPxGridView>
<asp:EntityDataSource ID="EntityDataSource_project_letters" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="project_letters" EntityTypeFilter="project_letters" AutoGenerateWhereClause="True" Select="" Where="">
    <WhereParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="project_id" QueryStringField="project_id" Type="Int32"/>
    </WhereParameters>
</asp:EntityDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_LetterInOut" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Load" TypeName="DirectAid.LetterInOut"></asp:ObjectDataSource>
<asp:ObjectDataSource ID="ObjectDataSource_LetterRecipient" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="Load" TypeName="DirectAid.LetterRecipient"></asp:ObjectDataSource>

