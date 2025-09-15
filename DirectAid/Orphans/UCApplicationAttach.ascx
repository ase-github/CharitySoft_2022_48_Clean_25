<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCApplicationAttach.ascx.vb"
    Inherits="DirectAid.UCApplicationAttach" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>


<script type="text/javascript">
    function OnUpdateClick() {
        uploader.UploadFile();
    }
</script>
<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>
<asp:HiddenField ID="HiddenField_app_ser" runat="server" Value="0" 
    ViewStateMode="Enabled" />
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="EntityDataSource1"
    KeyFieldName="attach_ser" Width="100%" ClientInstanceName="ASPxGridView1" EnableCallbackAnimation="True">
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
        <dx:GridViewDataTextColumn FieldName="attach_ser" ReadOnly="True" VisibleIndex="1"
            Caption="م" Width="5%">
            <EditFormSettings Visible="False" />
            <EditFormSettings Visible="False"></EditFormSettings>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="app_ser" VisibleIndex="5" Visible="False">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataComboBoxColumn Caption="النوع" FieldName="attach_code" VisibleIndex="2"
            Width="15%">
            <PropertiesComboBox DataSourceID="EntityDataSource2" TextField="type_name" ValueField="type_id"
                ValueType="System.Byte">
            </PropertiesComboBox>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="attachment_image" VisibleIndex="4" Caption="المرفق"
            Width="50%">
            <EditItemTemplate>
                <dx:ASPxUploadControl runat="server" ClientInstanceName="uploader" Size="35" ID="ASPxUploadControl1"
                    OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" Width="100%" 
                    ShowProgressPanel="True" ShowUploadButton="True">
                    <ValidationSettings MaxFileSize="4000000">
                    </ValidationSettings>
                    <ClientSideEvents FileUploadComplete="function(s, e) { if (e.isValid) { ASPxGridView1.UpdateEdit(); }}" />
                    <UploadButton Text="تحميل المرفق ثم الحفظ">
                        <Image Url="~/Images/Upload_32x32.png">
                        </Image>
                    </UploadButton>
                </dx:ASPxUploadControl>
            </EditItemTemplate>
            <EditFormSettings ColumnSpan="2" />
            <DataItemTemplate>
                <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl='<%#Eval("attachment_image")%>' Width="100" Height="100">
                </dx:ASPxImage>
            </DataItemTemplate>
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="attach_date" VisibleIndex="3" Caption="التاريخ"
            Width="15%">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataDateColumn>
    </Columns>
    <Settings ShowFilterRow="True" />
    <Settings ShowFilterRow="True"></Settings>
</dx:ASPxGridView>
<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableDelete="True" EnableFlattening="False"
    EnableInsert="True" EnableUpdate="True" EntitySetName="application_attach" AutoGenerateWhereClause="True"
    Where="">
    <WhereParameters>
        <asp:ControlParameter ControlID="HiddenField_app_ser" DefaultValue="0" Name="app_ser"
            PropertyName="Value" Type="Int32" />
    </WhereParameters>
</asp:EntityDataSource>
<asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="application_attach_type">
</asp:EntityDataSource>
