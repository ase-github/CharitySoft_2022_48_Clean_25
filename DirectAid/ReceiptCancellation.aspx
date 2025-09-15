<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master"
    CodeBehind="ReceiptCancellation.aspx.vb" Inherits="DirectAid.ReceiptCancellation" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>



<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx1" %>

<%--<!DOCTYPE html>--%>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

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

    <table align="center" width="100%" cellpadding="5px">
        <tr>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="ASPxLabel_MSG_Failure" runat="server" Font-Bold="True" Text="لم يتم الغاء السند" Width="100%" ForeColor="Red" Visible="False">
                </dx:ASPxLabel>
                <dx:ASPxLabel ID="ASPxLabel_MSG_Success" runat="server" Font-Bold="True" Text="تم الغاء هذا السند" Width="100%" ForeColor="#009933" Visible="False">
                </dx:ASPxLabel>
            </td>
            <td align="center" colspan="3">&nbsp;</td>

            <td align="center" width="16%">&nbsp;</td>
            <td align="center" width="4%">&nbsp;</td>
        </tr>

        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDOnationCod0" runat="server" Font-Bold="True" Text="رقم السند" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">

                <dx:ASPxTextBox ID="ASPxTextBox_reciept_num" runat="server" Width="100%" NullText="ادخل رقم السند ...">
                    <NullTextStyle ForeColor="#999999">
                    </NullTextStyle>
                    <ValidationSettings ErrorDisplayMode="None" ErrorText="">
                        <RequiredField IsRequired="True" />
                    </ValidationSettings>
                    <ReadOnlyStyle BackColor="#CCCCCC">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>

            </td>
            <td align="center" style="width: 15%;" width="16%">

                <dx:ASPxButton ID="ASPxButton_New" runat="server" Text="جديد" Width="100%" UseSubmitBehavior="False"
                    ClientInstanceName="ASPxButton_New" EnableClientSideAPI="True" Font-Bold="True" Visible="False" TabIndex="3">
                    <Image Url="~/Images/New_32x32.png">
                    </Image>
                </dx:ASPxButton>

                <dx:ASPxButton ID="Btn_Search" runat="server" Text="بحث" Width="100%" TabIndex="1">
                    <Image Url="~/Images/Find_32x32.png">
                    </Image>
                </dx:ASPxButton>
            </td>
            <td align="center" colspan="3">
                <dx:ASPxLabel ID="lblDOnationCod8" runat="server" Font-Bold="True" Text="سوف تظهر فقط سندات الفرع الحالى و التى تحمل تاريخ اليوم الحالى" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="4%">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" width="16%" >
                <dx:ASPxLabel ID="lblDOnationCod1" runat="server" Font-Bold="True" Text="الرقم اليدوى" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" width="16%" >

                <dx:ASPxTextBox ID="reciept_num_manual" runat="server" Width="100%" ReadOnly="True">
                    <ValidationSettings ErrorDisplayMode="None">
                    </ValidationSettings>
                    <ReadOnlyStyle BackColor="#CCCCCC">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>

            </td>
            <td align="center" width="16%" ></td>
            <td align="center" width="16%" ></td>
            <td align="center" width="16%" ></td>
            <td align="center" width="16%" ></td>
            <td align="center" width="4%" ></td>
        </tr>
        <tr>
            <td align="center" width="16%" >
                <dx:ASPxLabel ID="lblDOnationCod7" runat="server" Font-Bold="True" Text="التاريخ" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" width="16%" >

                <dx:ASPxTextBox ID="reciept_date" runat="server" Width="100%" ReadOnly="True">
                    <ValidationSettings ErrorDisplayMode="None">
                    </ValidationSettings>
                    <ReadOnlyStyle BackColor="#CCCCCC">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>

            </td>
            <td align="center" width="16%" >&nbsp;</td>
            <td align="center" width="16%" >&nbsp;</td>
            <td align="center" width="16%" >&nbsp;</td>
            <td align="center" width="16%" >&nbsp;</td>
            <td align="center" width="4%" >&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDOnationCod2" runat="server" Font-Bold="True" Text="المتبرع" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">

                <dx:ASPxTextBox ID="donor_id" runat="server" Width="100%" ReadOnly="True">
                    <ValidationSettings ErrorDisplayMode="None">
                    </ValidationSettings>
                    <ReadOnlyStyle BackColor="#CCCCCC">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>

            </td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="4%">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDOnationCod3" runat="server" Font-Bold="True" Text="القيمه" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">

                <dx:ASPxTextBox ID="total_amount" runat="server" Width="100%" ReadOnly="True">
<%--                    <MaskSettings Mask="&lt;0..999999&gt;.&lt;000..999&gt;" />--%>
                    <ValidationSettings ErrorDisplayMode="None">
                    </ValidationSettings>
                    <ReadOnlyStyle BackColor="#CCCCCC">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>

            </td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="4%">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDOnationCod4" runat="server" Font-Bold="True" Text="العمله" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">

                <dx:ASPxTextBox ID="currency_code" runat="server" Width="100%" ReadOnly="True">
                    <ValidationSettings ErrorDisplayMode="None">
                    </ValidationSettings>
                    <ReadOnlyStyle BackColor="#CCCCCC">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>

            </td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="4%">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" width="16%" class="auto-style1">
                <dx:ASPxLabel ID="lblDOnationCod5" runat="server" Font-Bold="True" Text="الفرع" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" width="16%" class="auto-style1">

                <dx:ASPxTextBox ID="branch" runat="server" Width="100%" ReadOnly="True">
                    <ValidationSettings ErrorDisplayMode="None">
                    </ValidationSettings>
                    <ReadOnlyStyle BackColor="#CCCCCC">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>

            </td>
            <td align="center" width="16%" class="auto-style1"></td>
            <td align="center" width="16%" class="auto-style1"></td>
            <td align="center" width="16%" class="auto-style1"></td>
            <td align="center" width="16%" class="auto-style1"></td>
            <td align="center" width="4%" class="auto-style1"></td>
        </tr>
        <tr>
            <td align="center" style="width: 15%;" width="16%">
                <dx:ASPxLabel ID="lblDOnationCod6" runat="server" Font-Bold="True" Text="المستخدم" Width="100%">
                </dx:ASPxLabel>
            </td>
            <td align="center" style="width: 15%;" width="16%">

                <dx:ASPxTextBox ID="user_id" runat="server" Width="100%" ReadOnly="True">
                    <ValidationSettings ErrorDisplayMode="None">
                    </ValidationSettings>
                    <ReadOnlyStyle BackColor="#CCCCCC">
                    </ReadOnlyStyle>
                </dx:ASPxTextBox>

            </td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="4%">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="4%">&nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">

                <dx:ASPxButton ID="ASPxButton_Save" runat="server" Text="الغاء" Width="100%" UseSubmitBehavior="False"
                    AutoPostBack="False" ClientInstanceName="ASPxButton_Save" EnableClientSideAPI="True"
                    Font-Bold="True" Style="height: 43px" Visible="False" TabIndex="2">
                    <ClientSideEvents Click="function(s, e) {
	e.processOnServer  = confirm('هل تريد الغاء هذا السند ؟');
}" />
                    <Image Url="~/Images/Delete_32x32.png">
                    </Image>
                </dx:ASPxButton>

            </td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="16%">&nbsp;</td>
            <td align="center" style="width: 15%;" width="4%">&nbsp;</td>
        </tr>
    </table>
</asp:Content>



<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .auto-style1 {
            width: 15%;
            height: 31px;
        }
    </style>
</asp:Content>

