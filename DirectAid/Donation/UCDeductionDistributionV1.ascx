<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="UCDeductionDistributionV1.ascx.vb"
    Inherits="DirectAid.UCDeductionDistributionV1" %>
<%@ Register Assembly="DevExpress.Web.v25.1, Version=25.1.5.0" Namespace="DevExpress.Web"
    TagPrefix="dx" %>

<dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource1" KeyFieldName="ID" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True">
    <columns>
                <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="0" Width="10%">
            <EditButton Visible="True">
                <Image Url="~/Images/Edit_32x32.png">
                </Image>
            </EditButton>
            <NewButton>
                <Image Url="~/Images/New_32x32.png">
                </Image>
            </NewButton>
            <DeleteButton>
                <Image Url="~/Images/Delete_32x32.png">
                </Image>
            </DeleteButton>
            <CancelButton Visible="True">
                <Image Url="~/Images/Cancel_32x32.png">
                </Image>
            </CancelButton>
            <UpdateButton Visible="True">
                <Image Url="~/Images/Save_32x32.png">
                </Image>
            </UpdateButton>
                    <clearfilterbutton visible="True">
                        <image url="~/Images/Cancel_32x32.png">
                        </image>
                    </clearfilterbutton>
                    <HeaderStyle HorizontalAlign="Center" />
                    <cellstyle horizontalalign="Center">
                    </cellstyle>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="standing_inst_num" VisibleIndex="2" Visible="False" Caption="رقم الاستقطاع">
        </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="TheYear" VisibleIndex="3" Caption="السنه" Width="10%" SortIndex="0" SortOrder="Ascending">
    <settings allowheaderfilter="True" />
    <editformsettings visible="False" />
    <HeaderStyle HorizontalAlign="Center" />
    <cellstyle horizontalalign="Center">
    </cellstyle>
</dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="الشهر" FieldName="TheMonth" VisibleIndex="4" Width="10%" SortIndex="1" SortOrder="Ascending">
                    <propertiestextedit displayformatstring="d"></propertiestextedit>
                    <settings allowheaderfilter="True" />
                    <editformsettings visible="False" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <cellstyle horizontalalign="Center">
                    </cellstyle>
                </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="reciept_num" VisibleIndex="5" Caption="رقم سند القبض" Width="10%">
            <editformsettings columnspan="2" Visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="الدوله" FieldName="country_code" VisibleIndex="6" Width="10%">
                    <propertiescombobox callbackpagesize="7" datasourceid="SqlDataSource_nat_tab" enablecallbackmode="True" incrementalfilteringmode="Contains" textfield="nat_descrar" valuefield="nat_code" valuetype="System.Int16"></propertiescombobox>
                    <editformsettings visible="False" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <cellstyle horizontalalign="Center">
                    </cellstyle>
                </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="qty" VisibleIndex="8" Caption="الكميه" Width="10%">
            <propertiestextedit>
                    
                    




                    





<MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />

</propertiestextedit>
            <editformsettings visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="line_amount" VisibleIndex="9" Caption="الاجمالى" Width="10%">
                    <propertiestextedit>
                        
                    




                        





<MaskSettings Mask="&lt;0..9999999&gt;.&lt;000..999&gt;" />

</propertiestextedit>
                    <editformsettings visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
                    <footercellstyle horizontalalign="Center">
                    </footercellstyle>
        </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="غرض التبرع" FieldName="donation_code" VisibleIndex="6" Width="20%">
                    <propertiescombobox callbackpagesize="7" datasourceid="SqlDataSource_donations" enablecallbackmode="True" incrementalfilteringmode="Contains" textformatstring="{2}" valuefield="donation_code" valuetype="System.Int16"><Columns>
<dx:ListBoxColumn Caption="نوع التبرع" FieldName="donation_categories_descrar" Width="25%"></dx:ListBoxColumn>
<dx:ListBoxColumn Caption="كود التبرع" FieldName="donation_code" Width="10%"></dx:ListBoxColumn>
<dx:ListBoxColumn Caption="غرض التبرع" FieldName="donation_descrar" Width="65%"></dx:ListBoxColumn>
</Columns>
</propertiescombobox>
                    <HeaderStyle HorizontalAlign="Center" />
                    <cellstyle horizontalalign="Center">
                    </cellstyle>
                </dx:GridViewDataComboBoxColumn>
        <dx:GridViewDataTextColumn FieldName="donation_value" VisibleIndex="7" Caption="القيمه" Width="10%">
            <editformsettings visible="False" />
            <HeaderStyle HorizontalAlign="Center" />
            <cellstyle horizontalalign="Center">
            </cellstyle>
        </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="ID" FieldName="ID" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
    </columns>
    <settingsbehavior confirmdelete="True" enablecustomizationwindow="True" />
    <settingspager rendermode="Lightweight" pagesize="12">
        <PageSizeItemSettings Items="5, 10, 20, 50, 100, 200" ShowAllItem="True" Visible="True">
        </PageSizeItemSettings>
    </settingspager>
    <settingsediting editformcolumncount="1" />
    <settings showfooter="True" ShowFilterRow="True" />
    <settingstext confirmdelete="هل تريد الحذف" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server"
    ConnectionString="<%$ ConnectionStrings:CharitySystemConnectionString %>"
    OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [View_DeductionDistribution] WHERE ([standing_inst_num] = @standing_inst_num)"
    UpdateCommand="UPDATE  dbo.dont_dist
SET     donation_code = @donation_code
WHERE   (CAST(reciept_num AS VARCHAR(20)) + '-'+ CAST(country_code AS VARCHAR(10)) + '-'+ CAST(donation_code AS VARCHAR(10)) = @original_ID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="standing_inst_num" QueryStringField="RefNum"
            Type="Int32" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="donation_code" Type="Int16"/>
        <asp:Parameter Name="original_ID" Type="String"/>
    </UpdateParameters>
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSource_nat_tab" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT [nat_code], [nat_descrar], [nat_desceng] FROM [nat_tab]"></asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource_donations" runat="server" ConnectionString="<%$ ConnectionStrings:charitysoft %>" SelectCommand="SELECT donation_categories.donation_descrar AS donation_categories_descrar, donations.donation_code, donations.donation_descrar, donations.donation_descreng FROM donations INNER JOIN donation_categories ON donations.donation_cat = donation_categories.donation_cat ORDER BY donations.SortOrder"></asp:SqlDataSource>





