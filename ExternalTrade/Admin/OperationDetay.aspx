<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OperationDetay.aspx.cs" Inherits="ExternalTrade.Admin.OperationDetay" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        /*.GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }*/
        .baslik {
            font-size: 7px;
        }
    </style>

     

   

   


      
         

    <div class="row" style:"width:100%;">
        <h1>OPERASYON DÖKÜMÜ ONAYI BEKLEYEN</h1>
        <div class="col-16" style="width:100%;"><br />
           
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                          <dx:ASPxGridView ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme="Moderno" KeyFieldName="Id">
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" HorizontalScrollBarMode="Visible" VerticalScrollBarMode="Visible" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto"  VerticalScrollableHeight="300" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" AllowDragDrop="false"/>
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                             <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" Visible="false" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="0" ReadOnly="True">
                                                    <EditFormSettings Visible="False" />

                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifTipi" Caption="Gönderim Şekli" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="1">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KonteynerBulkSecimi" Caption="Sevk Tipi" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="2">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="birdenfazlabeyanname" Visible="false" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="3">
                                                       <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="siparisTipi"  Visible="false" VisibleIndex="4">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="Vade" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="5">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TeklifNo" Caption="Teklif No" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="6" >
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="7" >
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TemsilciKullaniciAdi" Visible="false" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="8">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                       <dx:GridViewDataTextColumn FieldName="MusteriIsmi" Caption="Müşteri" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="9">
                                                            <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                
                                                 <dx:GridViewDataTextColumn FieldName="Kita" Caption="Kıta" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="10">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="Ulke" Caption="Ülke" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="11">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                         
                                                
                                                 <dx:GridViewDataTextColumn FieldName="KalkisLimani" Caption="Kalkış Limanı" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="12">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="EkipmanTuru" Caption="Ekipman" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="13">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="VarisLimani" Caption="Varış Limanı" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="14">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="Urun" Caption="Ürün" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="15">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="UrunAnaGrup" Caption="Ana Sınıf" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="16">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="UrunFiyat" Caption="Onay Öncesi<br/>Ürün Sade<br/>Fiyat" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="17">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="UrunFiyat2" Caption="Onay Sonrası<br/>Ürün Sade<br/>Fiyat" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" ReadOnly="True" VisibleIndex="18">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TorbaTipi" Caption="Torba Tipi" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="19">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TorbaAgirligi" Caption="Torba Ağırlığı" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="20">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="BBTipi" Caption="BB Tipi" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="21">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="BBAgirligi" Caption="BB Ağırlığı"  HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="22">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="Palet" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="23">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="birKonteynerTonaji" Caption="Bir Konteyner<br/>Tonajı" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="24">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="BuKaleminBuKonteynerdekiTonaji" Caption="Bu Ürünün Bu<br/>Ekipmandaki Tonajı" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="25">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="Ambalaj" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="26">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="buUrununSiparisTonaji" Caption="Tonaj" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="27">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="UrununKonteynerSayisi" Visible="false" VisibleIndex="28">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="SiparistekiKonteynerSayisi" Caption="Ekipman Sayısı" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="29">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="Inspection" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="30">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="GumruklemeTON" Caption="Gümrükleme" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="31">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="Komisyon" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="32">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="AraNakliyeTON" Caption="Ara Nakliye" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="33">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="DepolamaTON" Caption="Depolama"  HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="34">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ArmatorLokali" Caption="Armatör Lokali" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="35">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="LimanIcDolumBedeliTON" Caption="Liman Dolum" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="36">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="NavlunTON" Caption="Navlun" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="37">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TeklifTarihi" Caption="Tarih" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="38">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="FobMaliyet" Caption="Onay Öncesi<br/>Fob Maliyet" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="39">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ONAYSONRASIFOBMALIYET" Caption="Onay Sonrası<br/>Fob Maliyet" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" ReadOnly="True" VisibleIndex="40">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="FobSatisFiyati" Caption="Fob Satış<br/>Fiyatı" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="41">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ONAYONCESIFOBKAR" Caption="Onay Öncesi<br/>Fob Kar" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" ReadOnly="True" VisibleIndex="42">
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ONAYSONRASIFOBKAR" Caption="Onay Sonrası<br/>Fob Kar" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" ReadOnly="True" VisibleIndex="43">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ONAYONCESICFRMALIYET" Caption="Onay Öncesi<br/> Cfr Kar" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="44">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ONAYSONRASICFRMALIYET" Caption="Onay Sonrası<br/> Cfr Kar" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" ReadOnly="True" VisibleIndex="45">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="KalemSatisFiyati" Caption="Cfr Satış<br/>Fiyatı" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="46">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ONAYONCESICFRKAR" HeaderStyle-Font-Size="11px" Caption="Onay Öncesi<br/>Cfr Kar" CellStyle-Font-Size="11px" ReadOnly="True" VisibleIndex="47">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ONAYSONRASICFRKAR" Caption="Onay Sonrası<br/>Cfr Kar" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" ReadOnly="True" VisibleIndex="48">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="SigortaTON" Caption="Sigorta" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="49">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="GÖNDERİM ŞEKLİ" HeaderStyle-Font-Size="11px" CellStyle-Font-Size="11px" VisibleIndex="50">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                         
                                                
                                            </Columns>
                                

                                        </dx:ASPxGridView>
                           
                      </div>
                 

                    </div>
       
                 
                  <asp:Button ID="Button2" runat="server" Text="RAPOR AL" CssClass="btn btn-primary"  Height="40px" OnClick="Button2_Click"/>
                   
              
        
              <div>
         
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
                            </dx:ASPxGridViewExporter>
       </div>
            
  
      
    </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT o.[Id], [TeklifTipi], [KonteynerBulkSecimi], [birdenfazlabeyanname], [siparisTipi], [Vade], [TeklifNo], [Temsilci], [TemsilciKullaniciAdi], [MusteriIsmi], [Kita], [Ulke], [KalkisLimani], [EkipmanTuru], [VarisLimani], [Urun], [UrunAnaGrup], 

[UrunFiyat],

case  
when o.MusteriKodu='120.02.00003' then p.Price_Intercarb

when o.MusteriKodu='120.02.00004' then p.Price_Ozer

when o.MusteriKodu='120.02.00121' then p.Price_Roskim

else
p.Price
end as UrunFiyat2

, [TorbaTipi], [TorbaAgirligi], [BBTipi],
[BBAgirligi], [Palet], [birKonteynerTonaji],
[BuKaleminBuKonteynerdekiTonaji], [Ambalaj], [buUrununSiparisTonaji], [UrununKonteynerSayisi], [SiparistekiKonteynerSayisi], [Inspection],
[GumruklemeTON], [Komisyon], [AraNakliyeTON], [DepolamaTON], [ArmatorLokali], [LimanIcDolumBedeliTON], [NavlunTON], [TeklifTarihi],

[FobMaliyet],
case    
when o.MusteriKodu='120.02.00003' then FobMaliyet-UrunFiyat+p.Price_Intercarb

when o.MusteriKodu='120.02.00004' then FobMaliyet-UrunFiyat+p.Price_Ozer

when o.MusteriKodu='120.02.00121' then FobMaliyet-UrunFiyat+p.Price_Roskim

else
FobMaliyet-UrunFiyat+p.Price

end as ONAYSONRASIFOBMALIYET,
FobSatisFiyati,
(FobSatisFiyati-FobMaliyet)/FobMaliyet as ONAYONCESIFOBKAR
,
case    
when o.MusteriKodu='120.02.00003' then (FobSatisFiyati- FobMaliyet-UrunFiyat+p.Price_Intercarb)/ FobMaliyet-UrunFiyat+p.Price_Intercarb

when o.MusteriKodu='120.02.00004' then (FobSatisFiyati- FobMaliyet-UrunFiyat+p.Price_Ozer)/ FobMaliyet-UrunFiyat+p.Price_Ozer

when o.MusteriKodu='120.02.00121' then (FobSatisFiyati- FobMaliyet-UrunFiyat+p.Price_Roskim)/ FobMaliyet-UrunFiyat+p.Price_Roskim

else
(FobSatisFiyati- FobMaliyet-UrunFiyat+p.Price)/ FobMaliyet-UrunFiyat+p.Price

end as ONAYSONRASIFOBKAR,


[KalemMaliyeti] as ONAYONCESICFRMALIYET,


case  
when o.MusteriKodu='120.02.00003' then KalemMaliyeti-UrunFiyat+p.Price_Intercarb

when o.MusteriKodu='120.02.00004' then KalemMaliyeti-UrunFiyat+p.Price_Ozer

when o.MusteriKodu='120.02.00121' then KalemMaliyeti-UrunFiyat+p.Price_Roskim

else
KalemMaliyeti-UrunFiyat+p.Price
end as ONAYSONRASICFRMALIYET,


[KalemSatisFiyati],
(KalemSatisFiyati-KalemMaliyeti)/KalemMaliyeti as ONAYONCESICFRKAR
,
case    
when o.MusteriKodu='120.02.00003' then (KalemSatisFiyati- KalemMaliyeti-UrunFiyat+p.Price_Intercarb)/ KalemMaliyeti-UrunFiyat+p.Price_Intercarb

when o.MusteriKodu='120.02.00004' then (KalemSatisFiyati- KalemMaliyeti-UrunFiyat+p.Price_Ozer)/ KalemMaliyeti-UrunFiyat+p.Price_Ozer

when o.MusteriKodu='120.02.00121' then (KalemSatisFiyati- KalemMaliyeti-UrunFiyat+p.Price_Roskim)/ KalemMaliyeti-UrunFiyat+p.Price_Roskim

else
(KalemSatisFiyati- KalemMaliyeti-UrunFiyat+p.Price)/ KalemMaliyeti-UrunFiyat+p.Price

end as ONAYSONRASICFRKAR,

 [SigortaTON], 





[TeklifTipi] as [GÖNDERİM ŞEKLİ]
 FROM [Orders] o left outer join Product p on o.UrunKodu=p.Code



where  [TeklifNo]=@TeklifNo  and [SevkDurumu] IS NULL order by Id desc" OnSelecting="SqlDataSource1_Selecting" >
  <SelectParameters>
      <asp:Parameter Name="TeklifNo" />
  </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>

