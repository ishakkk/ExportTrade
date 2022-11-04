<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="TekliflerDetay.aspx.cs" Inherits="ExternalTrade.Admin.TekliflerDetay" %>
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
     
    <script type="text/javascript">
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Teklif Onaylandı", type: "success"
            }).then(function () {


                window.location = "TekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>";
            });

        }
</script>
     
    <script type="text/javascript">
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Teklif Onaylanamadı", type: "error"
            });
        }
    </script>
           <script type="text/javascript">
               function TeklifSil() {
                   swal({
                       title: "İŞLEM TAMAMLANDI", text: "Teklif Silindi", type: "success"
                   }).then(function () { window.location = "TekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>"; });
               }
    </script>
    <script type="text/javascript">
        function successAlert2() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Satışa Döndürüldü", type: "success"
            }).then(function () { window.location = "TekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>"; });
        }
</script>
    <script type="text/javascript">
        function errorAlert2() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Satışa Döndürülemedi", type: "error"
            });
        }
    </script>
      <script type="text/javascript">
          function successAlert3() {
              swal({
                  title: "İŞLEM TAMAMLANDI", text: "Teklif Reddedildi", type: "success"
              }).then(function () { window.location = "TekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>"; });
          }
</script>
    <script type="text/javascript">
        function errorAlert3() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Teklif Reddedilemedi", type: "error"
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

    <h1>ONAY BEKLEYEN TEKLİFLER DETAY</h1>
    <div class="row" style:"width:100%;">
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">     
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll;">
                          <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Theme="Moderno" CssClass="GridTemplate" DataSourceID="SqlDataSource1" KeyFieldName="Id" Width="100%">
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300"/>
                                            <SettingsBehavior AllowFocusedRow="false" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="false">
                                                  
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifTipi" VisibleIndex="49" Caption="TESLİM ŞEKLİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="56" Caption="ÜRÜN">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KonteynerBulkSecimi" VisibleIndex="16" Caption="SEVK<br/>TİPİ" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="birdenfazlabeyanname" VisibleIndex="3" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="siparisTipi" VisibleIndex="18" Caption="PARÇALI SİPARİŞ<br/>PARÇALI KONTEYNER" Width="140px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ReelKar" VisibleIndex="53" Caption="FARKLILIK">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ReelKarOrani" VisibleIndex="54" Caption="KAR<br/> ORANI" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Vade" VisibleIndex="55" Caption="VADE" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="Aciklama" VisibleIndex="64" Caption="AÇIKLAMA">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" VisibleIndex="9" Caption="TEKLİF NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" VisibleIndex="8" Caption="TEMSİLCİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TemsilciKullaniciAdi" VisibleIndex="10" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="11" Caption="MÜŞTERİ" Width="250px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Kita" VisibleIndex="13" Caption="KITA" Width="100px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ulke" VisibleIndex="12" Caption="ÜLKE" Width="100px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KalkisLimani" VisibleIndex="14" Caption="KALKIŞ<br/> LİMANI" Width="65px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="EkipmanTuru" VisibleIndex="17" Caption="EKİPMAN<br/>TÜRÜ" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="VarisLimani" VisibleIndex="15" Caption="VARIŞ<br/>LİMANI" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="22" Caption="ÜRÜN">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UrunAnaGrup" VisibleIndex="23" Caption="ÜRÜN ANA GRUP" Width="150px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UrunFiyat" VisibleIndex="32" Caption="ÜRÜN<br/>YALIN<br/>MALİYETİ" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TorbaTipi" VisibleIndex="24" Caption="TORBA<br/>TİPİ" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TorbaAgirligi" VisibleIndex="25" Caption="TORBA <br/>AĞIRLIĞI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="BBTipi" VisibleIndex="26" Caption="BB TİPİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="BBAgirligi" VisibleIndex="27" Caption="BB AĞIRLIĞI">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Palet" VisibleIndex="28" Caption="PALET" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="birKonteynerTonaji" VisibleIndex="19" Caption="BİR<br/>KONTEYNER<br/>TONAJI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="BuKaleminBuKonteynerdekiTonaji" VisibleIndex="21" Caption="BU ÜRÜNÜN<br/> KONTEYNERDEKİ<br/>TONAJI" Width="120px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ambalaj" VisibleIndex="33" Caption="AMBALAJ<br/>MALİYETİ" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="buUrununSiparisTonaji" VisibleIndex="29" Caption="BU ÜRÜNÜN<br/>SİPARİŞ<br/> TONAJI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UrununKonteynerSayisi" VisibleIndex="30" Caption="ÜRÜNÜN<br/>KONTEYNER<br/>SAYISI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SiparistekiKonteynerSayisi" VisibleIndex="31" Caption="SİPARİŞTEKİ<br/>KONTEYNER<br/>SAYISI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="GumruklemeTON" VisibleIndex="36" Caption="GÜMRÜKLEME" Width="120px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Inspection" VisibleIndex="39" Caption="INSPECTION">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Komisyon" VisibleIndex="41" Caption="KOMİSYON">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="AraNakliyeTON" VisibleIndex="34" Caption="ARA<br/>NAKLİYE" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="DepolamaTON" VisibleIndex="35" Caption="DEPOLAMA" Width="85px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ArmatorLokali" VisibleIndex="37" Caption="ARMATÖR<br/>LOKALİ" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="LimanIcDolumBedeliTON" VisibleIndex="38" Caption="LİMAN<br/>DOLUM<br/>BEDELİ" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="NavlunTON" VisibleIndex="47" Caption="NAVLUN">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MaliyetTON" VisibleIndex="40" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SatisFiyatiTON" VisibleIndex="42" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifTarihi" VisibleIndex="43" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KalemMaliyeti" VisibleIndex="50" Caption="T. ŞEKLİ<br/> MALİYET" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KalemSatisFiyati" VisibleIndex="51" Caption="T. ŞEKLİ<br/> SATIŞ" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SigortaTON" VisibleIndex="48" Caption="SİGORTA">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="fobKarOrani" VisibleIndex="46" Caption="FOB<br/>KAR<br/>ORANI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FobMaliyet" VisibleIndex="44" Caption="FOB MALİYET">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="teslimsekliKarOrani" VisibleIndex="52" Caption="T. ŞEKLİ <br/>KAR ORANI" Width="90px" Visible="false">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Durum" VisibleIndex="1" Caption="TEKLİF ONAYI" Width="110px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                             
                                                <dx:GridViewDataTextColumn FieldName="Parsiyel" VisibleIndex="20" Caption="PARSİYEL" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TTarih" VisibleIndex="7" Caption="TEKLİF TARİHİ" Width="110px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Gun" VisibleIndex="4" Caption="GÜN" Width="65px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ay" VisibleIndex="5" Caption="AY" Width="65px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Yil" VisibleIndex="6" Caption="YIL" Width="65px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FobSatisFiyati" VisibleIndex="45" Caption="FOB SATIŞ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="GÖNDERİM ŞEKLİ" VisibleIndex="56" Width="90px" Caption="TESLİM<br/>ŞEKLİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TON" VisibleIndex="57">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TOPLAM SATIŞ" VisibleIndex="58" Width="100px" Caption="TOPLAM<br/>SATIŞ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TOPLAM MALİYET" VisibleIndex="59"  Width="100px" Caption="TOPLAM<br/>MALİYET">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FARK" VisibleIndex="60"  Width="100px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                            
                                                <dx:GridViewDataTextColumn FieldName="KAR ORANI" VisibleIndex="61"  Width="100px">
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
                        <asp:Button ID="btnTekOnay" runat="server" Text="TEKLİFİ ONAYLA" CssClass="btn btn-success" OnClick="btnTekOnay_Click"  Height="40px"/>
             </div>
              <div class="btn-group">
       </div>
             <%-- <div class="btn-group">
                <asp:Button ID="btnSil" runat="server" CssClass="btn btn-bordered-secondary" Text="Reddet" OnClick="btnSil_Click"/>
            </div>--%>
             <%--<div class="btn-group">
                 <input type="button" class="btn btn-dark" value="TEKLİFİ REVİZE ET" id="btnrevize"/>
              
            </div>--%>
               <div class="btn-group">
           <asp:Button ID="btnRapor" runat="server" Text="RAPOR AL" CssClass="btn btn-danger" OnClick="btnRapor_Click" Height="40px"/>
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
                            </dx:ASPxGridViewExporter>
       </div><br /><br />
           
        </div>
        
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT [Id], [TeklifTipi], [KonteynerBulkSecimi], [birdenfazlabeyanname], [siparisTipi], [Vade], [TeklifNo], [Temsilci], [TemsilciKullaniciAdi], [MusteriIsmi], [Kita], [Ulke], [KalkisLimani], [EkipmanTuru], [VarisLimani], [Urun], [UrunAnaGrup], [UrunFiyat], [TorbaTipi], [TorbaAgirligi], [BBTipi], [BBAgirligi], [Palet], [birKonteynerTonaji], [BuKaleminBuKonteynerdekiTonaji], [Ambalaj], [buUrununSiparisTonaji], [UrununKonteynerSayisi], [SiparistekiKonteynerSayisi], [Inspection], [GumruklemeTON], [Komisyon], [AraNakliyeTON], [DepolamaTON], [ArmatorLokali], [LimanIcDolumBedeliTON], [NavlunTON], [MaliyetTON], [SatisFiyatiTON], [TeklifTarihi], [KalemMaliyeti], [KalemSatisFiyati], [SigortaTON], [fobKarOrani], [FobMaliyet], [teslimsekliKarOrani], [Durum], [Parsiyel], [TTarih], [Gun], [Ay], [Yil], [ReelKar], CAST((KalemSatisFiyati-KalemMaliyeti)/KalemMaliyeti as decimal(18,3)) as ReelKarOrani, [FobSatisFiyati],[TeklifTipi] as [GÖNDERİM ŞEKLİ],[buUrununSiparisTonaji] as [TON],CAST([KalemSatisFiyati]*[buUrununSiparisTonaji] as decimal(18,3)) as [TOPLAM SATIŞ],CAST([KalemMaliyeti]*[buUrununSiparisTonaji] as decimal(18,3)) as [TOPLAM MALİYET],CAST(([KalemSatisFiyati]*[buUrununSiparisTonaji]-[KalemMaliyeti]*[buUrununSiparisTonaji]) as decimal(18,3)) as [FARK], CAST(((KalemSatisFiyati*buUrununSiparisTonaji)-(KalemMaliyeti*buUrununSiparisTonaji))/(KalemMaliyeti*buUrununSiparisTonaji) as decimal(18,3)) as [KAR ORANI],[Aciklama] FROM [Orders] where [Durum]=@Durum and [TeklifNo]=@teklifno and [SevkDurumu] IS NULL order by Id desc" OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
           
            <asp:Parameter Name="Durum" />
            <asp:Parameter Name="teklifno" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
