<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Marketing_Projects_UploadExcel.aspx.vb" Inherits="DirectAid.Marketing_Projects_UploadExcel" %>
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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" class="auto-style1">
                        <tr>
                <td class="auto-style13"></td>
                <td style="text-align: right" class="auto-style14">
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="رفع بيانات خطط المشاريع " Font-Bold="True" Font-Size="Medium"></asp:Label>
                    
                    <br />
                    
                </td>
                <td class="auto-style13"></td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style12">
                    <%--          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>--%>
                    <table align="center" class="auto-style2" style="text-align: center; color: #000000; font-weight: 700; " border="0">
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
                                ملف الاكسل</td>
                           <td colspan="2">
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="99%" />
                             </td>
                            <td style="width: 25%">
                                <table align="center" class="dxflInternalEditorTable">
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                <asp:Button ID="btUploadExcel" runat="server" Text="تحميل الاكسل" Width="99%"  />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                         <tr>
                           <td style="width: 25%">
                                &nbsp;</td>
                            <td style="width: 25%">&nbsp;</td>
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
                                <br />
                                عدد البيانات الخاطئة<br />
                            </td>
                            <td style="width: 25%">
                                <asp:Label ID="lblErrorsCount" runat="server"></asp:Label>
                            </td>
                            <td class="auto-style9">
                                &nbsp;</td>
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
                                <asp:Button ID="btSave" runat="server" Text="حـــفــــظ" Width="99%" ValidationGroup="ReqDate"  />
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
                           <td colspan="3">
                                &nbsp;</td>
                            <td style="width: 25%">&nbsp;</td>
                        </tr>
                                                   
                        <tr>
                           <td colspan="4">
                   
                         <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="99%" AutoGenerateColumns="False" EnableTheming="True" RightToLeft="True" Theme="Default">
                             <Columns>
                                 <dx:GridViewDataTextColumn Caption="رقم المشروع" FieldName="ProjectNo" VisibleIndex="0">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="القطاع" FieldName="Sector" VisibleIndex="2" Visible="False">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="الجهة المنفذة" FieldName="ExecutingSides" VisibleIndex="3">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="المركز / المكتب" FieldName="Center" VisibleIndex="4">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="المدينة / القرية" FieldName="City" Visible="False" VisibleIndex="5">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="القسم" FieldName="Section" VisibleIndex="7">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="نوع المشروع" FieldName="ProjectType" VisibleIndex="8">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="التصنيف " FieldName="ProjectCategory" Visible="False" VisibleIndex="9">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="العدد المطلوب" FieldName="RequiredProjects" VisibleIndex="10">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="تكلفة الوحدة" FieldName="UnitCost" VisibleIndex="11">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="الاجمالي" FieldName="TotalUnitsCost" Visible="False" VisibleIndex="12">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="تاريخ التنفيذ" FieldName="StartMonth" Visible="False" VisibleIndex="13">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="مدة التنفيذ" FieldName="PeriodByMonths" Visible="False" VisibleIndex="14">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="عدد المستفيدين" FieldName="BeneficiariesCount" VisibleIndex="15">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="اشهر المواسم" FieldName="SeasonsMonths" Visible="False" VisibleIndex="17">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="ملاحظات" FieldName="Notes" VisibleIndex="18" Visible="False">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="فوائد المشروع" FieldName="BenefitDesc" VisibleIndex="19">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataTextColumn Caption="وصف / مكونات المشروع" FieldName="ProjectDesc" VisibleIndex="20">
                                 </dx:GridViewDataTextColumn>
                                 <dx:GridViewDataDateColumn Caption="الدولة" FieldName="Country" VisibleIndex="1">
                                     <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                     </PropertiesDateEdit>
                                 </dx:GridViewDataDateColumn>
                                 <dx:GridViewDataDateColumn Caption="ظروف المشروع" FieldName="ProjectConditions" VisibleIndex="16" Visible="False">
                                     <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                     </PropertiesDateEdit>
                                 </dx:GridViewDataDateColumn>
                                 <dx:GridViewDataTextColumn Caption="السنة" VisibleIndex="21" FieldName="Project_Year">
                                 </dx:GridViewDataTextColumn>
                             </Columns>
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                    </dx:ASPxGridView>


                            </td>
                        </tr>
                                                   
                        </table>
                    <%-- </ContentTemplate>
                    </asp:UpdatePanel>--%>
                </td>
                <td class="auto-style12"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
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
