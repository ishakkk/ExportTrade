<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BankInformation.aspx.cs" Inherits="ExternalTrade.Admin.BankInformation" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <script>
         function sec() {
             swal({
                 title: "DİKKAT", text: "Herhangi Bir Kayıt Seçmediniz", type: "warning"
             });
         }
    </script>
    <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>

       <div class="row " style="width:100%">

                        <div class="col-12">
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme="Moderno" CssClass="GridTemplate"  KeyFieldName="Id" Width="100%">
                                <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                               <SettingsBehavior AllowFocusedRow="false" AllowSelectByRowClick="True" AllowDragDrop="false" />
                                 <Columns>
                                   
                                    <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="false">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="BankName" VisibleIndex="1" Caption="BANKA" Width="150px">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                        </SettingsHeaderFilter>
                                    </dx:GridViewDataTextColumn> 
                                    <dx:GridViewDataTextColumn FieldName="IBAN" VisibleIndex="2" Caption="IBAN NO" Width="250px">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                        </SettingsHeaderFilter>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Account" VisibleIndex="3" Caption="HESAP">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                        </SettingsHeaderFilter>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="SwiftCode" VisibleIndex="4" Caption="SWIFT CODE">
                                         <SettingsHeaderFilter Mode="CheckedList">
                                         </SettingsHeaderFilter>
                                     </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="CİNSİ" VisibleIndex="5" Caption="DÖVİZ TÜRÜ">
                                         <SettingsHeaderFilter Mode="CheckedList">
                                         </SettingsHeaderFilter>
                                     </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="CompanyName" VisibleIndex="6" Caption="ŞİRKET">
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
        <asp:Button ID="Button1" runat="server" Text="Seçileni Güncelle" CssClass="btn btn-success"  Height="40px" OnClick="Button1_Click"/>
    </div>
    <div class="btn-group">
        <asp:Button ID="export" runat="server" Text="Rapor Al" CssClass="btn btn-primary" Height="40px" OnClick="export_Click"/>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select b.Id,b.BankName,b.IBAN,b.Account,b.SwiftCode,b.CİNSİ,c.CompanyName   from Banks b inner join Companies c on b.sirket=c.Id"></asp:SqlDataSource>
</asp:Content>
