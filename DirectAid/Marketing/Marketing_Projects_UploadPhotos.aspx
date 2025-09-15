<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Marketing_Projects_UploadPhotos.aspx.vb" Inherits="DirectAid.Marketing_Projects_UploadPhotos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-style: solid;
            border-width: 1px;
        }
        .auto-style5 {
            color: #669900;
        }
        .auto-style2 {
            width: 100%;
            border: 1px solid #808000;
        }
        .auto-style9 {
            width: 25%;
        }
        .auto-style10 {
            width: 100%;
        }
        .auto-style11 {
            height: 28px;
        }
        .auto-style12 {
            height: 421px;
        }
        .auto-style13 {
            width: 10%;
            height: 37px;
        }
        .auto-style14 {
            height: 37px;
        }
        .auto-style15 {
            height: 23px;
        }
        .auto-style16 {
            height: 31px;
        }
        .auto-style17 {
            width: 25%;
            height: 31px;
        }
        </style>
    <script type="text/javascript">
        function onFileUploadComplete(s, e) {
            if (e.callbackData) {
                var fileData = e.callbackData.split('|');
                var fileName = fileData[0],
                    fileUrl = fileData[1],
                    fileSize = fileData[2];
                DXUploadedFilesContainer.AddFile(fileName, fileUrl, fileSize);
            }
        }

     

        function AfterUploadFiles(s, e) {
          
            var xxx = e.callbackData
            document.getElementById('<%=txtError.ClientID%>').innerHTML = e.callbackData;
            if (xxx == 'صور المشاريع جاهزة للرفع الرجاء الضغط على زر الحفظ لإتمام عملية الحفظ')
            {
             ASPxButton2.SetEnabled(true);
        }
        else
            {
              ASPxButton2.SetEnabled(false);
        }

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" class="auto-style1">
                        <tr>
                <td class="auto-style13"></td>
                <td style="text-align: right" class="auto-style14">
                    &nbsp;<asp:Label ID="Label1" runat="server" Text="رفع صور خطط المشاريع التسويقية" Font-Bold="True" Font-Size="Medium" ForeColor="Black"></asp:Label>
                    <br />
                </td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style12">
                    <%--          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>
                    <table align="center" class="auto-style2" style="border: medium solid #FFFFFF; margin: auto; padding: inherit; text-align: center; color: #FFFFFF; font-weight: 700; " border="1">
                         <tr>
                           <td style="width: 25%">
                                &nbsp;</td>
                            <td style="width: 25%">&nbsp;</td>
                            <td class="auto-style9">
                                &nbsp;</td>
                            <td style="width: 25%">&nbsp;</td>
                        </tr>
                        <tr>
                           <td>
                              <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="تحميل الصور">
                                       <ClientSideEvents Click="function(s, e) {ASPxUploadControl1.Upload();}" />
                                </dx:ASPxButton>
                           </td>
                           <td colspan="2">
                                 <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" 
            ShowProgressPanel="True" 
            UploadMode="Advanced" AllowedFileExtensions=".jpg,.jpeg"
            onfilesuploadcomplete="ASPxUploadControl1_FilesUploadComplete" 
            Width="100%" ClientInstanceName="ASPxUploadControl1">
                                      <ClientSideEvents FilesUploadComplete="AfterUploadFiles" />
            
                                      <AdvancedModeSettings EnableMultiSelect="True" />
            
        </dx:ASPxUploadControl>
                           </td>
                            <td style="width: 25%">الصور</td>
                        </tr>
                         <tr>
                           <td style="width: 25%">
                             
                             </td>
                            <td style="width: 25%">
                                &nbsp;</td>
                            <td class="auto-style9">
                               
                                 &nbsp;</td>
                            <td style="width: 25%">&nbsp;</td>
                        </tr>                      
                        <tr>
                           <td colspan="4" class="auto-style11" style="text-align: right" dir="rtl">
                               <asp:TextBox ID="txtError" runat="server" Height="188px" ReadOnly="True" TextMode="MultiLine" Width="99%" Wrap="False"></asp:TextBox>
                            </td>
                        </tr>
                                   
                        <tr>
                           <td style="width: 25%">
                                &nbsp;</td>
                            <td style="width: 25%">&nbsp;</td>
                            <td class="auto-style9">
                                <asp:Label ID="lblErrorsCount" runat="server"></asp:Label>
                            </td>
                            <td style="width: 25%">&nbsp;</td>
                        </tr>
                                        
                        <tr>
                           <td colspan="3">
                                <table align="center" class="auto-style10">
                                    <tr>
                                        <td>
                                <asp:Button ID="btNew0" runat="server" Text="الشاشة الرئيسية" Width="99%" PostBackUrl="~/default.aspx" />
                                        </td>
                                        <td>
                                <dx:ASPxButton ID="ASPxButton2" runat="server" ClientInstanceName="ASPxButton2" Text="حـــفــــظ" Width="99%">
                                </dx:ASPxButton>
                                        </td>
                                        <td>
                                <asp:Button ID="btNew" runat="server" Text="جديد" Width="99%" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 25%">&nbsp;</td>
                        </tr>
                                                   
                        <tr>
                           <td colspan="3" class="auto-style16">
                                &nbsp;</td>
                            <td class="auto-style17"></td>
                        </tr>
                                                   
                        <tr>
                           <td colspan="4">
                   
                               &nbsp;</td>
                        </tr>
                                                   
                        </table>
                    <%-- </ContentTemplate>
                    </asp:UpdatePanel>--%>
                </td>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td class="auto-style15"></td>
                <td class="auto-style15">
                    </td>
                <td class="auto-style15"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                   

                    <br />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style5" dir="rtl" style="text-align: center">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
</asp:Content>
