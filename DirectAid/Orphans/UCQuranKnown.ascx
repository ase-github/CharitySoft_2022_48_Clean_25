<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCQuranKnown.ascx.vb"
    Inherits="DirectAid.UCQuranKnown" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:HiddenField ID="HiddenField_app_ser" runat="server" Value="0" />
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource1"
    KeyFieldName="line_ser" Width="100%">
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
            <CancelButton>
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </CancelButton>
            <UpdateButton>
                <Image Url="~/Images/Save_32x32.png">
                </Image>
            </UpdateButton>
            <ClearFilterButton Visible="True">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </ClearFilterButton>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="line_ser" ReadOnly="True" VisibleIndex="1"
            Caption="م" SortIndex="0" SortOrder="Descending" Width="5%">
            <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="app_ser" VisibleIndex="4" Visible="False">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="يحفظ من القران" FieldName="verse_known_id"
            VisibleIndex="2" Width="20%">
            <PropertiesComboBox DataSourceID="EntityDataSource_quran_verse_known" TextField="name_ar"
                ValueField="id" ValueType="System.Int16">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataComboBoxColumn Caption="السوره الجديده التى حفظها" FieldName="new_chapter_known"
            VisibleIndex="3" Width="20%">
            <PropertiesComboBox DataSourceID="EntityDataSource2" TextField="name_ar" ValueField="id"
                ValueType="System.Byte">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
          <dx:GridViewDataTextColumn Caption="التاريخ" FieldName="AddedDate" VisibleIndex="6" Width="20%">
            <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="المستخدم" FieldName="AddedBy" VisibleIndex="4" Width="20%">
            <PropertiesComboBox DataSourceID="SqlDataSourceUsers" TextField="collect_namear" ValueField="collect_id">
            </PropertiesComboBox>
         <EditFormSettings Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
    </Columns>
    <Settings ShowFilterRow="True" />
</dx:ASPxGridView>
<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False"
    EnableInsert="True" EnableUpdate="True" EntitySetName="quran_known" EntityTypeFilter="quran_known"
    AutoGenerateWhereClause="True" Select="" Where="">
    <WhereParameters>
        <asp:ControlParameter ControlID="HiddenField_app_ser" DefaultValue="0" Name="app_ser"
            PropertyName="Value" Type="Int32" />
    </WhereParameters>
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="quran_chapter"
    EntityTypeFilter="quran_chapter">
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource_quran_verse_known" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="quran_verse_known"
    EntityTypeFilter="quran_verse_known">
</asp:EntityDataSource>

<asp:SqlDataSource ID="SqlDataSourceUsers" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT [collect_id], [collect_namear] FROM [collectors_tab]"></asp:SqlDataSource>





