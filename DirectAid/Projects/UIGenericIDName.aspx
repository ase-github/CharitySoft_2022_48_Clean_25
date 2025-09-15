<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MainData.master"
    CodeBehind="UIGenericIDName.aspx.vb" Inherits="DirectAid.UIGenericIDName" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:aspxgridview id="ASPxGridView1" runat="server" width="100%" autogeneratecolumns="False"
        datasourceid="SqlDataSource_GenericIDName" keyfieldname="ID" 
        meta:resourcekey="ASPxGridView1Resource1">
        <Columns>
            <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="10%" 
                meta:resourcekey="GridViewCommandColumnResource1">
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
                            <ClearFilterButton Visible="True">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </ClearFilterButton>
                <UpdateButton Visible="True">
                    <Image Url="~/Images/Save_32x32.png">
                    </Image>
                </UpdateButton>
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" 
                Width="10%" Caption="الرقم" 
                meta:resourcekey="GridViewDataTextColumnResource6">
                <EditFormSettings Visible="False" />
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NameAR" VisibleIndex="2" Width="40%" 

                Caption="البيان باللغه العربيه" 
                meta:resourcekey="GridViewDataTextColumnResource4">
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NameEN" VisibleIndex="3" Width="40%" 

                Caption="البيان باللغه الانجليزيه" 
                meta:resourcekey="GridViewDataTextColumnResource5">
                <HeaderStyle HorizontalAlign="Center" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <settingsbehavior confirmdelete="True" />
        <Settings ShowFilterRow="True" />
        <settingstext confirmdelete="هل تريد الحذف ؟" />
    </dx:aspxgridview>
    <asp:SqlDataSource ID="SqlDataSource_GenericIDName" runat="server" 
        ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>" DeleteCommand="DELETE FROM [TableName] WHERE [ID] = @original_ID"
        InsertCommand="INSERT INTO [TableName] ([ID], [NameAR], [NameEN]) VALUES (@ID, @NameAR, @NameEN)"
        OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [TableName]"
        UpdateCommand="UPDATE [TableName] SET [NameAR] = @NameAR, [NameEN] = @NameEN WHERE [ID] = @original_ID">
        <deleteparameters>
            <asp:Parameter Name="original_ID" Type="Int64" />
        </deleteparameters>
        <insertparameters>
            <asp:Parameter Name="NameAR" Type="String" />
            <asp:Parameter Name="NameEN" Type="String" />
        </insertparameters>
        <updateparameters>
            <asp:Parameter Name="NameAR" Type="String" />
            <asp:Parameter Name="NameEN" Type="String" />
            <asp:Parameter Name="original_ID" Type="Int64" />
        </updateparameters>
    </asp:SqlDataSource>
</asp:Content>
