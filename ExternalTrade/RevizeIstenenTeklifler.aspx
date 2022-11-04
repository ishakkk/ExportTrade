<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="RevizeIstenenTeklifler.aspx.cs" Inherits="ExternalTrade.RevizeIstenenTeklifler" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

     <script>
         function reOnayAlert() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "Teklifiniz Onaya Gönderildi", type: "success"
             }).then(function () { window.location = 'RevizeIstenenTeklifler.aspx'; });
         }
         function reAlert() {
             swal({

                 title: "İŞLEM TAMAMLANAMADI", text: "Teklifiniz Onaya Gönderilemedi", type: "error"
             }).then(function () { window.location = 'RevizeIstenenTeklifler.aspx'; });

         }
    </script>
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

            <div class="row" style:"width:100%;">
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                          <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="TeklifNo" Width="100%" Theme="Moderno" CssClass="GridTemplate" >
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                                    <Columns>
                                                     
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" VisibleIndex="1" Width="50%" Caption="TEKLİF NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" VisibleIndex="2" Width="50%"  Caption="TEMSİLCİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="4" Width="100%" Caption="MÜŞTERİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ulke" VisibleIndex="3" Width="70%"  Caption="ÜLKE">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="TTarih" VisibleIndex="5" Width="50%" Caption="TAKLİF TARİHİ" >
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KAR ORANI" ReadOnly="True" Width="30%" VisibleIndex="7" >
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="TOPLAMTONAJ" Caption="TOPLAM TONAJ" ReadOnly="True" Width="30%" VisibleIndex="6" >
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
     
             <div>
           <asp:Button ID="btnRapor" runat="server" Text="DETAYLAR" CssClass="btn btn-danger" OnClick="btnRapor_Click" Height="40px"/>
                  <asp:Button ID="Button1" runat="server" Text="RAPOR" CssClass="btn btn-success" OnClick="Button1_Click" Height="40px"/>
                  
                 <asp:Button ID="btnOnayaSun" runat="server" CssClass="btn btn-pink"  Text="ONAYA SUN" OnClick="OnayaSun_Click" Height="40px"/>
                 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"></dx:ASPxGridViewExporter>
       </div>
        
          
              
        </div>
       
    </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT [TeklifNo],[Temsilci],[MusteriIsmi],[Ulke],CAST((SUM([KalemSatisFiyati])-SUM([KalemMaliyeti]))/SUM([KalemMaliyeti]) as decimal(18,3)) as [KAR ORANI],TTarih,SUM(buUrununSiparisTonaji) as TOPLAMTONAJ FROM [Orders] where [Durum]=@Durum and [TemsilciKullaniciAdi]=@temsilci and [SevkDurumu] IS NULL and [KILIT]=0 group by [TeklifNo],[Temsilci],[MusteriIsmi],[Ulke],TTarih order by TTarih desc" OnSelecting="SqlDataSource1_Selecting">
     <SelectParameters>
            <asp:Parameter Name="Durum" Type="String" />
         <asp:Parameter Name="temsilci" Type="String" />
         
        </SelectParameters>
        </asp:SqlDataSource>
    
    
</asp:Content>
