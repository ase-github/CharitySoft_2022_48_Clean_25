<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCEducationAttach.ascx.vb"
    Inherits="DirectAid.UCEducationAttach" %>
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
<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DS_Education_Attach"
    KeyFieldName="attach_ser" Width="100%" ClientInstanceName="ASPxGridView1">
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
        <dx:GridViewDataComboBoxColumn Caption="النوع" FieldName="attach_code" VisibleIndex="2"
            Width="15%">
            <PropertiesComboBox DataSourceID="EntityDataSource2" TextField="type_name" ValueField="type_id"
                ValueType="System.Byte">
                <ValidationSettings>
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
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
                <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl='<%# IIf(Not IsDBNull(Eval("attach_code")) And Eval("attach_code") = 1, Eval("attachment_image"), "~\Content\images\generic_file.png")%>' Width="100" Height="100">
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
        <dx:GridViewDataHyperLinkColumn Caption="تنزيل المرفق" FieldName="attachment_image" VisibleIndex="5">
            <PropertiesHyperLinkEdit Target="_blank" Text="تنزيل المرفق">
            </PropertiesHyperLinkEdit>
            <EditFormSettings Visible="False" />
        </dx:GridViewDataHyperLinkColumn>
    </Columns>
    <Settings ShowFilterRow="True" />
    <Settings ShowFilterRow="True"></Settings>
</dx:ASPxGridView>
<asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=charitysoftEntities"
    DefaultContainerName="charitysoftEntities" EnableFlattening="False" EntitySetName="application_attach_type">
</asp:EntityDataSource>
<asp:SqlDataSource ID="DS_Education_Attach" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" InsertCommand="Insert_education_attach" InsertCommandType="StoredProcedure" SelectCommand="SELECT * 
	FROM   [dbo].education_attach 
	
WHERE  sub_module_code = @sub_module_code
	
and app_ser = @app_ser
" UpdateCommand="Update_education_attach" UpdateCommandType="StoredProcedure" DeleteCommand="delete from education_attach where attach_ser=@attach_ser">
    <DeleteParameters>
        <asp:Parameter Name="attach_ser" />
    </DeleteParameters>
    <InsertParameters>
        <asp:QueryStringParameter Name="app_ser" QueryStringField="app_ser" Type="Int32" />
        <asp:Parameter Name="attach_code" Type="Byte" />
        <asp:QueryStringParameter Name="sub_module_code" QueryStringField="mod" Type="Byte" />
        <asp:Parameter Name="attachment_image" Type="String" />
        <asp:Parameter DbType="Date" Name="attach_date" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="sub_module_code" QueryStringField="mod" />
        <asp:QueryStringParameter Name="app_ser" QueryStringField="app_ser" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="attach_ser" Type="Int32" />
        <asp:Parameter Name="attach_code" Type="Byte" />
        <asp:Parameter Name="attachment_image" Type="String" />
        <asp:Parameter DbType="Date" Name="attach_date" />
    </UpdateParameters>
</asp:SqlDataSource>

