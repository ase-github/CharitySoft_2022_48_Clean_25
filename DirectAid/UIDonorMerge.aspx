<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="UIDonorMerge.aspx.vb" Inherits="DirectAid.UIDonorMerge" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>



<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <% If DesignMode Then%>
    <script src="Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
    <% End If%>
    <script type="text/javascript">

        function OpenRecord(recordID) {

            document.location.href = 'Orphan.aspx?OrphanID=' + recordID;
        }

        function CustomButtonClick(e) {

            var gridName = "ASPxGridView1";
            var index = e.visibleIndex;
            var key = ASPxClientGridView.Cast("ASPxGridView1").GetRowKey(index);
            OpenRecord(key);

        }

        function Add_Begin() {
            ASPxButton_Add.SetEnabled(false);
            ASPxLoadingPanel1.Show();
            ASPxCallback_Add.PerformCallback(null);
        }

        function Add_End(e) {

            var result = e.result;

            if (result == "OK") {
                ASPxGridView_Source.Refresh();
                ASPxGridView_Target.Refresh();
            }
            else {
                alert(result);
            }

            ASPxButton_Add.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

        function Add_Error(e) {
            alert(e.message);
            ASPxButton_Add.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

        function Remove_Begin() {
            ASPxButton_Remove.SetEnabled(false);
            ASPxLoadingPanel1.Show();
            ASPxCallback_Remove.PerformCallback(null);
        }

        function Remove_End(e) {

            var result = e.result;

            if (result == "OK") {
                ASPxGridView_Source.Refresh();
                ASPxGridView_Target.Refresh();
            }
            else {
                alert(result);
            }

            ASPxButton_Remove.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

        function Remove_Error(e) {
            alert(e.message);
            ASPxButton_Remove.SetEnabled(true);
            ASPxLoadingPanel1.Hide();
        }

    </script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" width="100%">
        <tbody>
            <tr>
                <td align="center" style="width: 40%; vertical-align: top;">

                                <dx:ASPxLabel ID="lblDOnationCod8" runat="server" Font-Bold="True" Text="بيانات المتبرع المراد الاحتفاظ بها" Width="100%" ForeColor="#009933">
                                </dx:ASPxLabel>

                </td>
                <td align="center" style="width: 20%; vertical-align: top;">
                    &nbsp;</td>
                <td align="center" style="width: 40%; vertical-align: top;">

                                <dx:ASPxLabel ID="lblDOnationCod9" runat="server" Font-Bold="True" Text="بيانات المتبرع المراد الغائها" Width="100%" ForeColor="Red">
                                </dx:ASPxLabel>

                            </td>
            </tr>
            <tr>
                <td align="center" style="width: 40%; vertical-align: top;">

                    <table align="center" width="100%" cellpadding="5px">
                        <tr>
                            <td align="center" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod0" runat="server" Font-Bold="True" Text="رقم المتبرع" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_ID_ToKeep" runat="server" Width="100%" NullText="ادخل رقم المتبرع ...">
                                    <NullTextStyle ForeColor="#999999">
                                    </NullTextStyle>
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="ToKeep">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" width="16%">

                <dx:ASPxCheckBox ID="ASPxCheckBox_SearchByLegacyID_ToKeep" runat="server" CheckState="Unchecked" Text="بحث بالرقم السابق"
                    Width="100%" AutoPostBack="True" Font-Bold="True">
                </dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" width="16%">

                                &nbsp;</td>
                            <td align="center" width="16%">

                                <dx:ASPxButton ID="ASPxButton_New_ToKeep" runat="server" Text="جديد" Width="100%" UseSubmitBehavior="False"
                                    ClientInstanceName="ASPxButton_New" EnableClientSideAPI="True" Font-Bold="True" Visible="False" TabIndex="3">
                                    <Image Url="~/Images/New_32x32.png">
                                    </Image>
                                </dx:ASPxButton>

                                <dx:ASPxButton ID="ASPxButton_Search_ToKeep" runat="server" Text="بحث" Width="100%" TabIndex="1" UseSubmitBehavior="False" ValidationGroup="ToKeep">
                                    <Image Url="~/Images/Find_32x32.png">
                                    </Image>
                                </dx:ASPxButton>

                            </td>
                            <td align="center" width="16%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod17" runat="server" Font-Bold="True" Text="الرقم السابق" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_LegacyID_ToKeep" runat="server" Width="100%" ReadOnly="True">
                                    <NullTextStyle ForeColor="#999999">
                                    </NullTextStyle>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" width="16%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod1" runat="server" Font-Bold="True" Text="الاسم" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_Name_ToKeep" runat="server" Width="100%" ReadOnly="True">
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" width="16%"></td>
                        </tr>
                        <tr>
                            <td align="center" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod2" runat="server" Font-Bold="True" Text="اجمالى التبرعات" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_Total_ToKeep" runat="server" Width="100%" ReadOnly="True">
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" width="16%"></td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 15%;" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod3" runat="server" Font-Bold="True" Text="الايتام" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" style="width: 15%;" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_Orphans_ToKeep" runat="server" Width="100%" ReadOnly="True">
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" style="width: 15%;" width="16%"></td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 15%;" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod4" runat="server" Font-Bold="True" Text="الطلبه" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" style="width: 15%;" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_Student_ToKeep" runat="server" Width="100%" ReadOnly="True">
                                    <%--                    <MaskSettings Mask="&lt;0..999999&gt;.&lt;000..999&gt;" />--%>
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" style="width: 15%;" width="16%"></td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 15%;" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod5" runat="server" Font-Bold="True" Text="الدعاه" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" style="width: 15%;" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_Daaya_ToKeep" runat="server" Width="100%" ReadOnly="True">
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" style="width: 15%;" width="16%"></td>
                        </tr>
                        <tr>
                            <td align="center" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod6" runat="server" Font-Bold="True" Text="المشاريع" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_Project_ToKeep" runat="server" Width="100%" ReadOnly="True">
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" width="16%"></td>
                        </tr>
                    </table>
                </td>
                <td align="center" style="width: 20%; vertical-align: top;">
                    <table align="center" width="100%">
                        <tr>
                            <td align="center" style="width: 100%;">

                                <dx:ASPxButton ID="ASPxButton_Save" runat="server" Text="دمج" Width="100%" UseSubmitBehavior="False"
                                    AutoPostBack="False" ClientInstanceName="ASPxButton_Save" EnableClientSideAPI="True"
                                    Font-Bold="True" Style="height: 43px" Visible="False" TabIndex="2">
                                    <ClientSideEvents Click="function(s, e) {
	e.processOnServer  = confirm('هل تريد الدمج ؟');
}" />
                                    <Image Url="~/Images/Action_CloneMerge_Clone_Object_32x32.png">
                                    </Image>
                                </dx:ASPxButton>

                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 100%;">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 100%;">

                                <dx:ASPxLabel ID="ASPxLabel_MSG_Success" runat="server" Font-Bold="True" Text="تمت عمليه الدمج" Width="100%" ForeColor="#009933" Visible="False">
                                </dx:ASPxLabel>

                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 100%;">

                                <dx:ASPxLabel ID="ASPxLabel_MSG_Failure" runat="server" Font-Bold="True" Text="لم تتم عمليه الدمج" Width="100%" ForeColor="Red" Visible="False">
                                </dx:ASPxLabel>

                            </td>
                        </tr>
                    </table>
                </td>
                <td align="center" style="width: 40%; vertical-align: top;">

                    <table align="center" width="100%" cellpadding="5px">
                        <tr>
                            <td align="center" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod10" runat="server" Font-Bold="True" Text="رقم المتبرع" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_ID_ToCancel" runat="server" Width="100%" NullText="ادخل رقم المتبرع ...">
                                    <NullTextStyle ForeColor="#999999">
                                    </NullTextStyle>
                                    <ValidationSettings ErrorDisplayMode="None" ErrorText="" ValidationGroup="ToCancel">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" width="16%">

                <dx:ASPxCheckBox ID="ASPxCheckBox_SearchByLegacyID_ToCancel" runat="server" CheckState="Unchecked" Text="بحث بالرقم السابق"
                    Width="100%" AutoPostBack="True" Font-Bold="True">
                </dx:ASPxCheckBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" width="16%">

                                &nbsp;</td>
                            <td align="center" width="16%">

                                <dx:ASPxButton ID="ASPxButton_New_ToCancel" runat="server" Text="جديد" Width="100%" UseSubmitBehavior="False"
                                    ClientInstanceName="ASPxButton_New" EnableClientSideAPI="True" Font-Bold="True" Visible="False" TabIndex="3">
                                    <Image Url="~/Images/New_32x32.png">
                                    </Image>
                                </dx:ASPxButton>

                                <dx:ASPxButton ID="ASPxButton_Search_ToCancel" runat="server" Text="بحث" Width="100%" TabIndex="1" UseSubmitBehavior="False" ValidationGroup="ToCancel">
                                    <Image Url="~/Images/Find_32x32.png">
                                    </Image>
                                </dx:ASPxButton>

                            </td>
                            <td align="center" width="16%">

                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod18" runat="server" Font-Bold="True" Text="الرقم السابق" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_LegacyID_ToCancel" runat="server" Width="100%" ReadOnly="True">
                                    <NullTextStyle ForeColor="#999999">
                                    </NullTextStyle>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" width="16%">&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod11" runat="server" Font-Bold="True" Text="الاسم" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_Name_ToCancel" runat="server" Width="100%" ReadOnly="True">
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" width="16%"></td>
                        </tr>
                        <tr>
                            <td align="center" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod12" runat="server" Font-Bold="True" Text="اجمالى التبرعات" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_Total_ToCancel" runat="server" Width="100%" ReadOnly="True">
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" width="16%"></td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 15%;" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod13" runat="server" Font-Bold="True" Text="الايتام" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" style="width: 15%;" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_Orphans_ToCancel" runat="server" Width="100%" ReadOnly="True">
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" style="width: 15%;" width="16%"></td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 15%;" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod14" runat="server" Font-Bold="True" Text="الطلبه" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" style="width: 15%;" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_Student_ToCancel" runat="server" Width="100%" ReadOnly="True">
                                    <%--                    <MaskSettings Mask="&lt;0..999999&gt;.&lt;000..999&gt;" />--%>
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" style="width: 15%;" width="16%"></td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 15%;" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod15" runat="server" Font-Bold="True" Text="الدعاه" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" style="width: 15%;" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_Daaya_ToCancel" runat="server" Width="100%" ReadOnly="True">
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" style="width: 15%;" width="16%"></td>
                        </tr>
                        <tr>
                            <td align="center" width="16%">

                                <dx:ASPxLabel ID="lblDOnationCod16" runat="server" Font-Bold="True" Text="المشاريع" Width="100%">
                                </dx:ASPxLabel>

                            </td>
                            <td align="center" width="16%">

                                <dx:ASPxTextBox ID="ASPxTextBox_Project_ToCancel" runat="server" Width="100%" ReadOnly="True">
                                    <ValidationSettings ErrorDisplayMode="None">
                                    </ValidationSettings>
                                    <ReadOnlyStyle BackColor="#CCCCCC">
                                    </ReadOnlyStyle>
                                </dx:ASPxTextBox>

                            </td>
                            <td align="center" width="16%"></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </tbody>
    </table>
</asp:Content>
