<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="sevkRaporu.aspx.cs" Inherits="ExternalTrade.sevkRaporu" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <script>
         function successAlert() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "RAPOR OLUŞTURULDU", type: "success"
             }).then(function () { window.location = 'sevkRaporu.aspx' });
         }
     </script>
      <script>
          function errorAlert() {
              swal({
                  title: "İŞLEM TAMAMLANAMADI", text: "RAPOR OLUŞTURULAMADI", type: "error"
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
                  BAŞLANGIÇ TARİHİ
                  <asp:TextBox ID="txtTar1" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                  <br />
                  BİTİŞ TARİHİ
                  <asp:TextBox ID="txtTar2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox><br />
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                                 <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id" Width="100%" Theme="Moderno" CssClass="GridTemplate" >
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300"/>
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                                  <Columns>
                                                      <dx:GridViewCommandColumn VisibleIndex="0">
                                                      </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="1" ReadOnly="True" Visible="false">
                                                  
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                  
                                                    <EditFormSettings Visible="False" />
                                                  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SiparisNo" VisibleIndex="2" Caption="SİPARİŞ NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Durum" VisibleIndex="3" Caption="DURUM">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Gun" VisibleIndex="4" Caption="GÜN" Width="50px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ay" VisibleIndex="5" Caption="AY" Width="50px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Yil" VisibleIndex="6" Caption="YIL" Width="50px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="TTarih" VisibleIndex="7" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" VisibleIndex="8" Caption="TEMSİLCİ" Width="100px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" VisibleIndex="9" Caption="TEKLİF NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="10" Caption="MÜŞTERİ" Width="300px">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                      </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ulke" VisibleIndex="11" Caption="ÜLKE">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Kita" VisibleIndex="12" Caption="KITA">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KalkisLimani" VisibleIndex="13" Caption="KALKIŞ<br/>LİMANI" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="VarisLimani" VisibleIndex="14" Caption="VARIŞ<br/>LİMANI" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KonteynerBulkSecimi" VisibleIndex="15" Caption="SEVK<br/>TİPİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="EkipmanTuru" VisibleIndex="16" Caption="EKİPMAN<br/>TÜRÜ" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="siparisTipi" VisibleIndex="17" Caption="PARÇALI SİPARİŞ<br/>PARÇALI KONTEYNER" Width="80px">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                     </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="birKonteynerTonaji" VisibleIndex="18" Caption="BİR<br/>EKİPMAN<br/>TONAJI" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Parsiyel" VisibleIndex="19" Caption="PARSİYEL" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="BuKaleminBuKonteynerdekiTonaji" VisibleIndex="20" Width="90px" Caption="BU KALEMİN<br/>BU EKİPMANDAKİ<br/>TONAJI">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="21" Caption="ÜRÜN">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UrunAnaGrup" VisibleIndex="22" Caption="ÜRÜN ANA GRUP">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TorbaTipi" VisibleIndex="23" Caption="TORBA<br/>TİPİ" Width="60px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TorbaAgirligi" VisibleIndex="24" Caption="TORBA<br/>AĞIRLIĞI" Width="60px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="BBTipi" VisibleIndex="25" Caption="BB<br/>TİPİ" Width="60px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="BBAgirligi" VisibleIndex="26" Caption="BB<br/>AĞIRLIĞI" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Palet" VisibleIndex="27" Caption="PALET" Width="60px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="buUrununSiparisTonaji" VisibleIndex="28" Caption="BU<br/>ÜRÜNÜN<br/>SİPARİŞ<br/>TONAJI" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UrununKonteynerSayisi" VisibleIndex="29" Caption="ÜRÜNÜN<br/>KONTEYNER<br/>SAYISI" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SiparistekiKonteynerSayisi" VisibleIndex="30" Caption="SİPARİŞTEKİ<br/>KONTEYNER<br/>SAYISI">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UrunFiyat" VisibleIndex="31" Caption="ÜRÜN<br/>SADE<br/>FİYATI" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ambalaj" VisibleIndex="32" Caption="AMBALAJ" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="AraNakliyeTON" VisibleIndex="33" Caption="ARA<br/>NAKLİYE" Width="80px">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                      </SettingsHeaderFilter>
                                                      </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="DepolamaTON" VisibleIndex="34" Caption="DEPOLAMA" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="GumruklemeTON" VisibleIndex="35" Caption="GÜMRÜKLEME" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ArmatorLokali" VisibleIndex="36" Caption="ARMATÖR<br/>LOKALİ" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="LimanIcDolumBedeliTON" VisibleIndex="37" Caption="LİMAN<br/>DOLUM<br/>BEDELİ" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Inspection" VisibleIndex="38" Caption="INSPECTION" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Komisyon" VisibleIndex="39" Caption="KOMİSYON" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FobMaliyet" VisibleIndex="40" Caption="FOB<br/>MALİYET" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                     <dx:GridViewDataTextColumn FieldName="ValorFobMaliyetEtkisi" VisibleIndex="39" Caption="VALÖR FOB<br/>MALİYET ETKİSİ" Width="110px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FobSatisFiyati" VisibleIndex="41" Caption="FOB<br/>SATIŞ<br>FİYATI" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="fobKarOrani" VisibleIndex="42" Caption="FOB<br/>KAR<br>ORANI" Width="80px" >
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="NavlunTON" VisibleIndex="43" Caption="NAVLUN" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SigortaTON" VisibleIndex="44" Caption="SİGORTA" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifTipi" VisibleIndex="45" Caption="GÖNDERİM<br/>ŞEKLİ" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="53" Caption="ÜRÜN" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KalemMaliyeti" VisibleIndex="46" Caption="TESLİM<br/>ŞEKLİ<br/>MALİYET" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="ValorMaliyetEtkisi" VisibleIndex="45" Caption="VARÖL TESLİM<br/>ŞEKLİ MALİYETE<br/>ETKİSİ" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KalemSatisFiyati" VisibleIndex="47" Caption="TESLİM<br/>ŞEKLİ<br/>SATIŞ<br/>FİYATI" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="teslimsekliKarOrani" VisibleIndex="48" Caption="TESLİM<br/>ŞEKLİ<br/>KAR<br/>ORANI" Width="80px" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FARK" VisibleIndex="49" Caption="FARK" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KAR ORANI" VisibleIndex="50" Caption="KAR<br/>ORANI" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Vade" VisibleIndex="51" Caption="VADE" Width="60px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TeklifTipi1" VisibleIndex="52"  Caption="GÖNDERİM<br/>ŞEKLİ" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="buUrununSiparisTonaji1" VisibleIndex="53" Caption="BU<br/>ÜRÜNÜN<br/>SİPARİŞ<br/>TONAJI">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="GÖNDERİM ŞEKLİ" VisibleIndex="54" Caption="GÖNDERİM<br/>ŞEKLİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TON" VisibleIndex="55" Width="50px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TOPLAM SATIŞ" ReadOnly="True" VisibleIndex="57" Caption="TOPLAM<br/>SATIŞ">

                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                     </SettingsHeaderFilter>

                                                     </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TOPLAM MALİYET" ReadOnly="True" VisibleIndex="58" Caption="TOPLAM<br/>MALİYET">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ÜRÜN KARLILIĞI" ReadOnly="True" VisibleIndex="59" Width="70px" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                           
                                                <dx:GridViewDataTextColumn FieldName="KARLILIK" VisibleIndex="60" ReadOnly="True" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="SHIPPEDAMOUNT" Caption="SEVK<br/>EDİLEN<br/>TONAJ" VisibleIndex="56" ReadOnly="True">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                      </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="Aciklama" VisibleIndex="61" Caption="AÇIKLAMA" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="FARK1" VisibleIndex="62" Caption="FARK">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                      </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="KAR ORANI1" VisibleIndex="63" Caption="KAR ORANI">
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
         <asp:Button ID="Button1" runat="server" Text="ÇEK" CssClass="btn btn-danger" Height="40px" OnClick="Button1_Click"/>
     </div>
             <div class="btn-group">
 
           <asp:Button ID="btnRapor" runat="server" Text="RAPOR AL" CssClass="btn btn-success" OnClick="btnRapor_Click" Height="40px"/>
                 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"></dx:ASPxGridViewExporter>
       </div>
        
          
              
        </div>
       
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select o.Id,o.SiparisNo,o.Durum,o.Gun,o.Ay,o.Yil,o.TTarih,o.Temsilci,o.TeklifNo, o.MusteriIsmi,
o.Ulke,o.Kita,o.KalkisLimani,o.VarisLimani,o.KonteynerBulkSecimi,o.EkipmanTuru,o.siparisTipi,o.birKonteynerTonaji,
o.Parsiyel,o.BuKaleminBuKonteynerdekiTonaji,o.Urun,o.UrunAnaGrup,o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,
o.Palet,o.buUrununSiparisTonaji,o.UrununKonteynerSayisi,o.SiparistekiKonteynerSayisi,
o.UrunFiyat,o.Ambalaj,o.AraNakliyeTON,o.DepolamaTON,o.GumruklemeTON,o.ArmatorLokali,o.LimanIcDolumBedeliTON,
o.Inspection,o.Komisyon,o.FobMaliyet,
case
when FobMaliyet=0 then 0
else
	case
		when Vade='Peşin' then 0
		else
		FobMaliyet-(UrunFiyat+Ambalaj+AraNakliyeTON+DepolamaTON+GumruklemeTON+ArmatorLokali+LimanIcDolumBedeliTON+Inspection+Komisyon)
	end

end as ValorFobMaliyetEtkisi,
o.FobSatisFiyati,o.fobKarOrani,o.NavlunTON,o.SigortaTON,o.TeklifTipi,o.KalemMaliyeti,

case
when KalemMaliyeti=0 then 0
else
	case 
		when Vade='Peşin' then 0
		else
		KalemMaliyeti-(UrunFiyat+Ambalaj+AraNakliyeTON+DepolamaTON+GumruklemeTON+ArmatorLokali+LimanIcDolumBedeliTON+Inspection+Komisyon+NavlunTON+SigortaTON)
	end

end as ValorMaliyetEtkisi,
o.KalemSatisFiyati,o.teslimsekliKarOrani,CAST(((o.KalemSatisFiyati)-(o.KalemMaliyeti)) as decimal(18,3)) as FARK,CAST(((o.KalemSatisFiyati-o.KalemMaliyeti)/o.KalemMaliyeti) as decimal(18,3)) as [KAR ORANI],o.Vade,o.TeklifTipi,o.buUrununSiparisTonaji,
o.TeklifTipi as [GÖNDERİM ŞEKLİ],o.buUrununSiparisTonaji as [TON],CAST(o.KalemSatisFiyati*(o.[SHIPPEDAMOUNT]/1000) as decimal(18,3)) as [TOPLAM SATIŞ],CAST(o.KalemMaliyeti*(o.SHIPPEDAMOUNT/1000) as decimal(18,3)) as [TOPLAM MALİYET],CAST((o.KalemSatisFiyati*(o.SHIPPEDAMOUNT/1000)-o.KalemMaliyeti*(o.SHIPPEDAMOUNT/1000)) as decimal(18,3)) as [FARK1],CAST(o.UrunFiyat*(o.SHIPPEDAMOUNT/1000) as decimal(18,3)) as [ÜRÜN SADE MALİYETİ],CAST((KalemSatisFiyati-KalemMaliyeti)/KalemMaliyeti as decimal(18,3)) as [ÜRÜN KARLILIĞI], CAST(((o.KalemSatisFiyati*SHIPPEDAMOUNT)-(o.KalemMaliyeti*SHIPPEDAMOUNT))/(o.KalemMaliyeti*SHIPPEDAMOUNT) as decimal(18,3)) as [KARLILIK],o.Aciklama,o.SHIPPEDAMOUNT,CAST(((o.KalemSatisFiyati*(o.SHIPPEDAMOUNT/1000))-(o.KalemMaliyeti*(o.SHIPPEDAMOUNT/1000)))/(o.KalemMaliyeti*(o.SHIPPEDAMOUNT/1000)) as decimal(18,3)) as [KAR ORANI1] from SevkEdilenlerUser o where o.SiparisNo is not null and o.YediyuzluKod is not null and o.Durum='SATISA DONDU' and TemsilciKullaniciAdi=@temsilci" OnSelecting="SqlDataSource1_Selecting">
       
        <SelectParameters>
            <asp:Parameter Name="temsilci" />
        </SelectParameters>
        
         </asp:SqlDataSource>
    
</asp:Content>
