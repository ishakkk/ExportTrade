<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Validity.aspx.cs" Inherits="ExternalTrade.Admin.Validity" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
        <div>
     <div class="row">
       
         <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>

                        <div class="col-xl-6 col-md-12">
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id" Width="100%" Theme="Moderno" CssClass="GridTemplate" >
                                <SettingsEditing Mode="Batch">
                                </SettingsEditing>
                                <Settings ShowHeaderFilterButton="True" />
                            <SettingsBehavior AllowFocusedRow="false" AllowSelectByRowClick="True" AllowDragDrop="false" />
                                    <Columns>
                                       
                                    <dx:GridViewDataTextColumn FieldName="Id" Visible="false" ReadOnly="True" VisibleIndex="1">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                        </SettingsHeaderFilter>
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TeklifTipi" Caption="Gönderim Şekli" VisibleIndex="2">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                        </SettingsHeaderFilter>
                                    </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ValidityText" Caption="Yazı" VisibleIndex="3">
                                            <SettingsHeaderFilter Mode="CheckedList">
                                            </SettingsHeaderFilter>
                                        </dx:GridViewDataTextColumn>
                                </Columns>
                                 
                    
                                                            <Styles>
                                <Header Font-Size="Small">
                                </Header>
                                <DetailRow Font-Size="Small" Wrap="True">
                                </DetailRow>
                                <DetailCell Font-Size="X-Small">
                                </DetailCell>
                                <FocusedRow BackColor="#FFCC99">
                                </FocusedRow>
                                <Cell Font-Size="Small">
                                </Cell>
                                <EditFormDisplayRow Font-Size="X-Small">
                                </EditFormDisplayRow>
                                <EditingErrorRow Font-Size="X-Small">
                                </EditingErrorRow>
                                <EditForm Font-Size="X-Small" Wrap="True">
                                </EditForm>
                                <EditFormCell Font-Size="X-Small">
                                </EditFormCell>
                                <EditFormTable Font-Size="X-Small">
                                </EditFormTable>
                                <EditFormColumnCaption Font-Size="X-Small">
                                </EditFormColumnCaption>
                            </Styles>

                            </dx:ASPxGridView>
                        </div>
         </div>
   
    <div class="btn-group">
        <asp:Button ID="export" runat="server" Text="Rapor Al" CssClass="btn btn-primary" OnClick="export_Click" Height="40px"/>
    </div></div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT * FROM Validity" UpdateCommand="update Validity set ValidityText=@ValidityText where Id=@Id">
        <UpdateParameters>
            <asp:Parameter Name="Id" />
            <asp:Parameter Name="ValidityText" />
        </UpdateParameters>
    </asp:SqlDataSource>
     <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
     </dx:ASPxGridViewExporter>
</asp:Content>
