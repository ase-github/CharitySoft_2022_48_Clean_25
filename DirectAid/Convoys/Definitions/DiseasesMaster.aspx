<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DiseasesMaster.aspx.vb" Inherits="DirectAid.DiseasesMaster" %>
<%@ Register assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <dx:ASPxGridView runat="server" KeyFieldName="disease_id" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" ID="ASPxGridView3">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" Width="50px">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
                <HeaderStyle HorizontalAlign="Right"></HeaderStyle>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="disease_des_ar" Caption="اسم المرض - ع" VisibleIndex="2">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True">
                        </RequiredField>
                    </ValidationSettings>
                </PropertiesTextEdit>
                <HeaderStyle HorizontalAlign="Right"></HeaderStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="disease_id" Caption="الكود" VisibleIndex="1" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="اسم المرض - E" FieldName="disease_des_en" VisibleIndex="3">
                <PropertiesTextEdit>
                    <ValidationSettings>
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True">
        </Settings>
        <SettingsText EmptyDataRow="لا توجد بيانات" CommandEdit="تعديل" CommandNew="جديد" CommandDelete="ازالة" CommandCancel="الغاء" CommandUpdate="حفظ">
        </SettingsText>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" InsertCommand="Insert_convoy_Disease_master" InsertCommandType="StoredProcedure" SelectCommand="SELECT * FROM [convoy_disease_master]" UpdateCommand="Update_convoy_Disease_master" UpdateCommandType="StoredProcedure">
        <InsertParameters>
            <asp:Parameter Name="disease_des_ar" Type="String" />
            <asp:Parameter Name="disease_des_en" Type="String" />
            <asp:Parameter DbType="Date" Name="creation_date" />
            <asp:Parameter Name="user_name" Type="String" />
            <asp:Parameter Name="status" Type="Byte" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="disease_id" Type="Int32" />
            <asp:Parameter Name="disease_des_ar" Type="String" />
            <asp:Parameter Name="disease_des_en" Type="String" />
            <asp:Parameter DbType="Date" Name="creation_date" />
            <asp:Parameter Name="user_name" Type="String" />
            <asp:Parameter Name="status" Type="Byte" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
