<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCBeneficiaryYearlyDataV1.ascx.vb"
    Inherits="DirectAid.UCBeneficiaryYearlyDataV1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Xpo.v25.1, Version=25.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Xpo" TagPrefix="dx" %>




<% If DesignMode Then%>
<script src="../Scripts/ASPxScriptIntelliSense.js" type="text/javascript"></script>
<% End If%>

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" ClientInstanceName="ASPxGridView1" KeyFieldName="ID" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" ShowInCustomizationForm="True">
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
        <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1" ReadOnly="True" Visible="False" ShowInCustomizationForm="True">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="app_ser" VisibleIndex="2" Visible="False" ShowInCustomizationForm="True">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="TheYear" VisibleIndex="3" Caption="السنه" ShowInCustomizationForm="True">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="VillageVisitsCount" VisibleIndex="4" Caption="عدد الزيارات للقرى" ShowInCustomizationForm="True">
                        <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="LegitimateLessonsCount" VisibleIndex="5" Caption="عدد الدروس الشرعيه" ShowInCustomizationForm="True">
                        <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="NewMuslimsCount" VisibleIndex="6" Caption="اسلم على يديه" ShowInCustomizationForm="True">
                        <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataCheckColumn FieldName="Breakfasts" VisibleIndex="7" Visible="False" ShowInCustomizationForm="True" Caption="افطارات">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="Sacrifies" VisibleIndex="8" Visible="False" ShowInCustomizationForm="True" Caption="اضاحى">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="Pilgrimages" VisibleIndex="9" Visible="False" ShowInCustomizationForm="True" Caption="حج">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="PreachingConvoys" VisibleIndex="10" Visible="False" ShowInCustomizationForm="True" Caption="قوافل دعويه">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="LegitimateCourses" VisibleIndex="11" Visible="False" ShowInCustomizationForm="True" Caption="دورات شرعيه">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="EducationalCamps" VisibleIndex="12" Visible="False" ShowInCustomizationForm="True" Caption="مخيمات تربويه">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="QuranicContests" VisibleIndex="13" Visible="False" ShowInCustomizationForm="True" Caption="مسابقات قرانيه">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="GuidanceCourses" VisibleIndex="14" Visible="False" ShowInCustomizationForm="True" Caption="دورات مهتدين">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="RadioPrograms" VisibleIndex="15" Visible="False" ShowInCustomizationForm="True" Caption="برامج اذاعيه">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="StudentsActivities" VisibleIndex="16" Visible="False" ShowInCustomizationForm="True" Caption="انشطه طلابيه">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataCheckColumn FieldName="WomenForums" VisibleIndex="17" Visible="False" ShowInCustomizationForm="True" Caption="ملتقيات نسائيه">
            <EditFormSettings Visible="True" />
        </dx:GridViewDataCheckColumn>
        <dx:GridViewDataBinaryImageColumn Caption="صوره مشروع 1" FieldName="ProjectPhoto1" ShowInCustomizationForm="True" VisibleIndex="18">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataBinaryImageColumn>
        <dx:GridViewDataBinaryImageColumn Caption="صوره مشروع 2" FieldName="ProjectPhoto2" ShowInCustomizationForm="True" VisibleIndex="19">
            <HeaderStyle HorizontalAlign="Center" />
            <CellStyle HorizontalAlign="Center">
            </CellStyle>
        </dx:GridViewDataBinaryImageColumn>
    </Columns>
    <SettingsBehavior ConfirmDelete="True" />
    <SettingsPager AlwaysShowPager="True">
    </SettingsPager>
    <SettingsEditing EditFormColumnCount="4" />
    <Settings ShowFilterRow="True" />
    <SettingsText ConfirmDelete="هل تريد الحذف؟" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:charitysoft %>" 
    DeleteCommand="DELETE FROM [BeneficiaryYearlyData] WHERE ([ID] = @original_ID) " 
    InsertCommand="INSERT INTO [BeneficiaryYearlyData] ([app_ser], [TheYear], [VillageVisitsCount], [LegitimateLessonsCount], [NewMuslimsCount], [Breakfasts], [Sacrifies], [Pilgrimages], [PreachingConvoys], [LegitimateCourses], [EducationalCamps], [QuranicContests], [GuidanceCourses], [RadioPrograms], [StudentsActivities], [WomenForums]) VALUES (@app_ser, @TheYear, @VillageVisitsCount, @LegitimateLessonsCount, @NewMuslimsCount, @Breakfasts, @Sacrifies, @Pilgrimages, @PreachingConvoys, @LegitimateCourses, @EducationalCamps, @QuranicContests, @GuidanceCourses, @RadioPrograms, @StudentsActivities, @WomenForums)" 
    OldValuesParameterFormatString="original_{0}" 
    SelectCommand="SELECT * FROM [BeneficiaryYearlyData] WHERE ([app_ser] = @app_ser)" 
    UpdateCommand="UPDATE [BeneficiaryYearlyData] SET [VillageVisitsCount] = @VillageVisitsCount, [LegitimateLessonsCount] = @LegitimateLessonsCount, [NewMuslimsCount] = @NewMuslimsCount, [Breakfasts] = @Breakfasts, [Sacrifies] = @Sacrifies, [Pilgrimages] = @Pilgrimages, [PreachingConvoys] = @PreachingConvoys, [LegitimateCourses] = @LegitimateCourses, [EducationalCamps] = @EducationalCamps, [QuranicContests] = @QuranicContests, [GuidanceCourses] = @GuidanceCourses, [RadioPrograms] = @RadioPrograms, [StudentsActivities] = @StudentsActivities, [WomenForums] = @WomenForums WHERE [ID] = @original_ID ">
    <DeleteParameters>
        <asp:Parameter Name="original_ID" Type="Int64" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="app_ser" Type="Int32" />
        <asp:Parameter Name="TheYear" Type="Int32" />
        <asp:Parameter Name="VillageVisitsCount" Type="Int32" />
        <asp:Parameter Name="LegitimateLessonsCount" Type="Int32" />
        <asp:Parameter Name="NewMuslimsCount" Type="Int32" />
        <asp:Parameter Name="Breakfasts" Type="Boolean" />
        <asp:Parameter Name="Sacrifies" Type="Boolean" />
        <asp:Parameter Name="Pilgrimages" Type="Boolean" />
        <asp:Parameter Name="PreachingConvoys" Type="Boolean" />
        <asp:Parameter Name="LegitimateCourses" Type="Boolean" />
        <asp:Parameter Name="EducationalCamps" Type="Boolean" />
        <asp:Parameter Name="QuranicContests" Type="Boolean" />
        <asp:Parameter Name="GuidanceCourses" Type="Boolean" />
        <asp:Parameter Name="RadioPrograms" Type="Boolean" />
        <asp:Parameter Name="StudentsActivities" Type="Boolean" />
        <asp:Parameter Name="WomenForums" Type="Boolean" />
    </InsertParameters>
    <SelectParameters>
        <asp:QueryStringParameter Name="app_ser" QueryStringField="OrphanID" Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="VillageVisitsCount" Type="Int32" />
        <asp:Parameter Name="LegitimateLessonsCount" Type="Int32" />
        <asp:Parameter Name="NewMuslimsCount" Type="Int32" />
        <asp:Parameter Name="Breakfasts" Type="Boolean" />
        <asp:Parameter Name="Sacrifies" Type="Boolean" />
        <asp:Parameter Name="Pilgrimages" Type="Boolean" />
        <asp:Parameter Name="PreachingConvoys" Type="Boolean" />
        <asp:Parameter Name="LegitimateCourses" Type="Boolean" />
        <asp:Parameter Name="EducationalCamps" Type="Boolean" />
        <asp:Parameter Name="QuranicContests" Type="Boolean" />
        <asp:Parameter Name="GuidanceCourses" Type="Boolean" />
        <asp:Parameter Name="RadioPrograms" Type="Boolean" />
        <asp:Parameter Name="StudentsActivities" Type="Boolean" />
        <asp:Parameter Name="WomenForums" Type="Boolean" />
        <asp:Parameter Name="original_ID" Type="Int64" />
    </UpdateParameters>
</asp:SqlDataSource>







