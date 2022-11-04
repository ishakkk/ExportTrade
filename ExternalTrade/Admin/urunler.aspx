<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="urunler.aspx.cs" Inherits="ExternalTrade.Admin.urunler" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
       <div class="row">
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
       <div class="col-xl-12">
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id" Width="100%" Theme="Moderno" CssClass="GridTemplate" >
                                <SettingsEditing Mode="Batch">
                                </SettingsEditing>
                                <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" VerticalScrollBarMode="Auto"/>
                               <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" AllowDragDrop="false"/>
                                 <SettingsDataSecurity AllowEdit="True" />
                                 <Columns>
                                    
                                    
                                     <dx:GridViewCommandColumn ShowDeleteButton="True" Width="100%" VisibleIndex="0">
                                     </dx:GridViewCommandColumn>
                                    
                                    
                                    <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="false">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                        </SettingsHeaderFilter>
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="MainClass" Width="100%" VisibleIndex="2" Caption="Ürün Ana Sınıfı">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                        </SettingsHeaderFilter>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="ProductName" Width="100%" VisibleIndex="3" Caption="Ürün Adı">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                        </SettingsHeaderFilter>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Price" Width="100%" VisibleIndex="4" Caption="Ürün Fiyat($)">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                        </SettingsHeaderFilter>
                                    </dx:GridViewDataTextColumn>
                                       <dx:GridViewDataTextColumn FieldName="Price_Intercarb" Width="100%" VisibleIndex="5" Caption="Ürün Fiyat(Intercarb)($)">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                        </SettingsHeaderFilter>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="Price_Roskim" Width="100%" VisibleIndex="6" Caption="Ürün Fiyat(Roskimtorg)($)">
                                        <SettingsHeaderFilter Mode="CheckedList">
                                        </SettingsHeaderFilter>
                                    </dx:GridViewDataTextColumn>
                                     <dx:GridViewDataTextColumn FieldName="Price_Ozer" Width="100%" VisibleIndex="7" Caption="Ürün Fiyat(Özer)($)">
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
        <asp:Button ID="btnGuncelle" runat="server" Text="Seçileni Güncelle" CssClass="btn btn-success" OnClick="btnGuncelle_Click" Height="40px" />
    </div>
     <div class="btn-group">
       <a href="UrunEkle.aspx" class="btn btn-warning" style="height:40px">EKLE</a>
    </div>
        <div class="btn-group">
        <asp:Button ID="Button1" runat="server" Text="Rapor Al" CssClass="btn btn-primary" OnClick="Button1_Click" Height="40px"/>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT * FROM [Product] where Active=1" DeleteCommand="Update  Product set Active=0 where Id=@Id" UpdateCommand="update Product set Price=@Price where Id=@Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Id" />
            <asp:Parameter Name="Price" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
    </dx:ASPxGridViewExporter>
</asp:Content>

