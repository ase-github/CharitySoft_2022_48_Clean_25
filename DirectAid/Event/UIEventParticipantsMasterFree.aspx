<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UIEventParticipantsMasterFree.aspx.vb" Inherits="DirectAid.UIEventParticipantsMasterFree" %>

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
        <dx:GridViewDataTextColumn FieldName="int_ext_member" VisibleIndex="3" Caption="النوع">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="app_ser" VisibleIndex="4" Caption="المشارك">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="member_name" VisibleIndex="5" Caption="الاسم">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="register_date" VisibleIndex="6" Caption="تاريخ التسجيل">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="assessment_date" VisibleIndex="7" Caption="تاريخ التقييم">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="assessment_result" VisibleIndex="8" Caption="نتيجه التقييم">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="reward_descr" VisibleIndex="9" Caption="وصف المكافئه">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="financial_reward" VisibleIndex="10" Caption="مكافئه ماليه">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="reward_amount" VisibleIndex="11" Caption="قيمه المكافئه">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="certificate_reward" VisibleIndex="12" Caption="شهاده">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="event_activity" VisibleIndex="13" Caption="النشاط">
        </dx:GridViewDataTextColumn>
    </Columns>
    <Settings ShowFilterRow="True" />
</dx:ASPxGridView>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server"  AutoGenerateWhereClause="True" Where="" ConnectionString="name=charitysoftEntities" DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="event_participants">
                        <WhereParameters>
                <asp:QueryStringParameter DefaultValue="0" Name="event_id" QueryStringField="event_id" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
    </form>
</body>
</html>
