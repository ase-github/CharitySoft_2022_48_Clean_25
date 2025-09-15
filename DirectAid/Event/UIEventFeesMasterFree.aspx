<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIEventFeesMasterFree.aspx.vb" Inherits="DirectAid.UIEventFeesMasterFree" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
    DataSourceID="EntityDataSource1" KeyFieldName="trx_ser"
    Width="100%" RightToLeft="True" ClientInstanceName="ASPxGridView1">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image">
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
        <dx:GridViewDataTextColumn FieldName="event_id"
            VisibleIndex="1" Visible="False">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="trx_ser" VisibleIndex="2" ReadOnly="True" Caption="م">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="النوع" FieldName="fee_type" VisibleIndex="3">
            <PropertiesComboBox DataSourceID="EntityDataSource_fees_codes" TextField="fee_name_ar" ValueField="fee_code" ValueType="System.Int16">
            </PropertiesComboBox>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="fee_amount" VisibleIndex="4" Caption="القيمه">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="fee_descr" VisibleIndex="5" Caption="الوصف">
        </dx:GridViewDataTextColumn>
    </Columns>
    <Settings ShowFilterRow="True" />
</dx:ASPxGridView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server"  AutoGenerateWhereClause="True" Where="" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="event_fees">
                        <WhereParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="event_id" QueryStringField="event_id" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSource_fees_codes" runat="server" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="fees_codes" EntityTypeFilter="fees_codes">
        </asp:EntityDataSource>
    </form>
</body>
</html>
