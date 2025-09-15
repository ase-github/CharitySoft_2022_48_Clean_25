<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCReportsData.ascx.vb"
    Inherits="DirectAid.UCReportsData" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<%@ Register Src="UCProjectDetail.ascx" TagName="UCProjectDetail" TagPrefix="uc1" %>

<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="cc1" %>
<style type="text/css">
    .auto-style1
    {
        width: 100%;
    }
    .auto-style2
    {
        height: 32px;
    }
</style>
<%  If (DesignMode) Then%>
<script src="ASPxScriptIntelliSense.js" type="text/javascript"></script>
<%  End If%>
<script type="text/javascript">

    function OpenProject(e) {

        //        window.open("UIProject.aspx?GUID=" + ASPxGridView1.GetRowKey(e.visibleIndex), "", "", "");

        // window.open("UIProject.aspx?GUID=" + ASPxGridView1.GetRowKey(e.visibleIndex), 'Popup', 'toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=900,height=600');

        window.location.href = "UIProjectConstruction.aspx?project_id=" + ASPxGridView1.GetRowKey(e.visibleIndex);
    }

</script>

<div id="ProjectType" dir="rtl"> 
    <table align="center" class="auto-style1">
        <tr>
            <td style="width: 5%">&nbsp;</td>
            <td style="width: 15%">نوع المشروع</td>
            <td dir="rtl" style="width: 75%; text-align: right;">
                <dx:ASPxComboBox ID="cmbProjectType" runat="server" Width="50%" AutoPostBack="True" DataSourceID="SqlDataSourceReports_Projects" TextField="Project_Desc" ValueField="Project_ID">
                    <validationsettings>
                        <requiredfield isrequired="True" />
                    </validationsettings>
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceReports_Projects" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT * FROM [Reports_Projects] ORDER BY [Project_Desc]"></asp:SqlDataSource>
            </td>
            <td style="width: 5%">&nbsp;</td>
        </tr>
    </table>
</div>
<div id="Building" runat="server" dir="rtl"> 
    <table align="center" class="auto-style1">
        <tr>
            <td style="width: 5%">&nbsp;</td>
            <td style="width: 15%">عدد الادوار</td>
            <td style="width: 30%; text-align: right;">
                <dx:ASPxComboBox ID="cmbProjectFloors" runat="server" Width="100%" DataSourceID="SqlDataSourceReports_Floors" TextField="Floor_Desc" ValueField="Floor_ID">
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceReports_Floors" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT Reports_Floors.Floor_ID, Reports_Floors.Floor_Desc FROM Reports_Floors INNER JOIN Reports_Project_Floor ON Reports_Floors.Floor_ID = Reports_Project_Floor.Floor_ID WHERE (Reports_Project_Floor.Project_ID = @Project_ID) ORDER BY Reports_Floors.Floor_ID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbProjectType" DefaultValue="0" Name="Project_ID" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width: 15%">&nbsp;&nbsp; نوع السقف</td>
            <td style="width: 30%">
                <dx:ASPxComboBox ID="cmbProjectRoofs" runat="server" Width="100%" DataSourceID="SqlDataSourceReports_Roofs" TextField="Roof_Desc" ValueField="Roof_ID">
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceReports_Roofs" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT Reports_Roofs.Roof_ID, Reports_Roofs.Roof_Desc FROM Reports_Roofs INNER JOIN Reports_Project_Roof ON Reports_Roofs.Roof_ID = Reports_Project_Roof.Roof_ID WHERE (Reports_Project_Roof.Project_ID = @Project_ID) ORDER BY Reports_Roofs.Roof_Desc">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbProjectType" DefaultValue="0" Name="Project_ID" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width: 5%">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>الأرضيات</td>
            <td>
                <dx:ASPxComboBox ID="cmbProjectTiles" runat="server" Width="100%" DataSourceID="SqlDataSourceReports_Tiles" TextField="Tiles_Desc" ValueField="Tiles_ID">
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceReports_Tiles" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT Reports_Tiles.Tiles_ID, Reports_Tiles.Tiles_Desc FROM Reports_Tiles INNER JOIN Reports_Project_Tile ON Reports_Tiles.Tiles_ID = Reports_Project_Tile.Tiles_ID WHERE (Reports_Project_Tile.Project_ID = @Project_ID) ORDER BY Reports_Tiles.Tiles_Desc">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbProjectType" DefaultValue="0" Name="Project_ID" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>الأثاث</td>
            <td colspan="3" rowspan="2">
                <dx:ASPxCheckBoxList ID="chklstFurniture" runat="server" DataSourceID="SqlDataSourceReports_Project_Furniture" RepeatColumns="5" RepeatDirection="Horizontal" TextField="Furniture_Desc" ValueField="Furniture_ID" Width="99%">
                </dx:ASPxCheckBoxList>
                <asp:SqlDataSource ID="SqlDataSourceReports_Project_Furniture" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT Reports_Furniture.Furniture_ID, Reports_Furniture.Furniture_Desc FROM Reports_Furniture INNER JOIN Reports_Project_Furniture ON Reports_Furniture.Furniture_ID = Reports_Project_Furniture.Furniture_ID WHERE (Reports_Project_Furniture.Project_ID = @Project_ID) ORDER BY Reports_Furniture.Furniture_Desc">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbProjectType" DefaultValue="0" Name="Project_ID" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        </table>
</div>
<div id="Outbuilding" runat="server" dir="rtl"> 
    <table align="center" class="auto-style1">
        <tr>
            <td style="width: 5%">&nbsp;</td>
            <td style="width: 15%">الملحقات</td>
            <td rowspan="2" style="width: 75%">
                <dx:ASPxCheckBoxList ID="chklstOutbuilding" runat="server" DataSourceID="SqlDataSourceReports_Project_Outbuilding" RepeatColumns="5" RepeatDirection="Horizontal" TextField="Outbuilding_Desc" ValueField="Outbuilding_ID" Width="99%">
                </dx:ASPxCheckBoxList>
                <asp:SqlDataSource ID="SqlDataSourceReports_Project_Outbuilding" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT Reports_Outbuildings.Outbuilding_ID, Reports_Outbuildings.Outbuilding_Desc FROM Reports_Outbuildings INNER JOIN Reports_Project_Outbuilding ON Reports_Outbuildings.Outbuilding_ID = Reports_Project_Outbuilding.Outbuilding_ID WHERE (Reports_Project_Outbuilding.Project_ID = @Project_ID) ORDER BY Reports_Outbuildings.Outbuilding_Desc">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbProjectType" DefaultValue="0" Name="Project_ID" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width: 5%">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        </table>
</div>
<div id="Water" runat="server" dir="rtl"> 
    <table align="center" class="auto-style1">
        <tr>
            <td style="width: 5%">&nbsp;</td>
            <td style="width: 15%">العمق</td>
            <td style="width: 30%">
                <dx:ASPxComboBox ID="cmbProjectDeeps" runat="server" Width="100%" DataSourceID="SqlDataSourceReports_Deeps" TextField="Deep_Desc" ValueField="Deep_ID">
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceReports_Deeps" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT Reports_Deeps.Deep_ID, Reports_Deeps.Deep_Desc FROM Reports_Deeps INNER JOIN Reports_Project_Deep ON Reports_Deeps.Deep_ID = Reports_Project_Deep.Deep_ID WHERE (Reports_Project_Deep.Project_ID = @Project_ID) ORDER BY Reports_Deeps.Deep_Desc">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbProjectType" DefaultValue="0" Name="Project_ID" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width: 15%">&nbsp;</td>
            <td style="width: 30%">
                &nbsp;</td>
            <td style="width: 5%">&nbsp;</td>
        </tr>
    </table>
</div>
<div id="OtherInfo" dir="rtl">

    <table align="center" class="auto-style1">
        <tr>
            <td style="width: 5%">&nbsp;</td>
            <td style="width: 15%">&nbsp;&nbsp; عدد المستفيدين</td>
            <td style="width: 75%">
                <dx:ASPxComboBox ID="cmbProjectBeneficiariesCount" runat="server" Width="100%" DataSourceID="SqlDataSourceReports_Project_BeneficiariesCount" TextField="Beneficiaries_Count_Desc" ValueField="Beneficiaries_Count_ID">
                </dx:ASPxComboBox>
                <asp:SqlDataSource ID="SqlDataSourceReports_Project_BeneficiariesCount" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT Reports_Beneficiaries_Count.Beneficiaries_Count_ID, Reports_Beneficiaries_Count.Beneficiaries_Count_Desc FROM Reports_Beneficiaries_Count INNER JOIN Reports_Project_BeneficiariesCount ON Reports_Beneficiaries_Count.Beneficiaries_Count_ID = Reports_Project_BeneficiariesCount.Beneficiaries_Count_ID WHERE (Reports_Project_BeneficiariesCount.Project_ID = @Project_ID) ORDER BY Reports_Beneficiaries_Count.Beneficiaries_Count_Desc">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cmbProjectType" DefaultValue="0" Name="Project_ID" PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td style="width: 5%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 5%">&nbsp;</td>
            <td style="width: 15%">الأهمية</td>
            <td rowspan="2" style="width: 75%">
                <asp:TextBox ID="txtPriority" runat="server" Height="55px" TextMode="MultiLine" Width="99%"></asp:TextBox>
            </td>
            <td style="width: 5%">&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>رابط المشروع على الموقع</td>
            <td rowspan="2">
                <asp:TextBox ID="txtNotes" runat="server" Height="55px" TextMode="MultiLine" Width="99%"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>الصورة الأولى</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="321px" ReadOnly="True"></asp:TextBox>
                <asp:FileUpload ID="FileUpload1" runat="server" Width="315px" />
               </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>الصورة الثانية</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="321px" ReadOnly="True"></asp:TextBox>
                <asp:FileUpload ID="FileUpload2" runat="server" Width="318px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>الصورة الثالثة</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Width="321px" ReadOnly="True"></asp:TextBox>
                <asp:FileUpload ID="FileUpload3" runat="server" Width="319px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>الصورة الرابعة</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server" Width="320px" ReadOnly="True"></asp:TextBox>
                <asp:FileUpload ID="FileUpload4" runat="server" Width="319px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>الصورة الخامسة</td>
            <td>
                <asp:TextBox ID="TextBox5" runat="server" Width="321px" ReadOnly="True"></asp:TextBox>
                <asp:FileUpload ID="FileUpload5" runat="server" Width="319px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>الصورة السادسة</td>
            <td>
                <asp:TextBox ID="TextBox6" runat="server" Width="319px" ReadOnly="True"></asp:TextBox>
                <asp:FileUpload ID="FileUpload6" runat="server" Width="320px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>الصورة السابعة</td>
            <td>
                <asp:TextBox ID="TextBox7" runat="server" Width="316px" ReadOnly="True"></asp:TextBox>
                <asp:FileUpload ID="FileUpload7" runat="server" Width="323px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <dx:ASPxButton ID="btSave" runat="server" Text="حــــــــــفــــــــظ">
                </dx:ASPxButton>
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>

</div>




