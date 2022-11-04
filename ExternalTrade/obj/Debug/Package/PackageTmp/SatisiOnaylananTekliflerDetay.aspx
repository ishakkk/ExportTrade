<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="SatisiOnaylananTekliflerDetay.aspx.cs" Inherits="ExternalTrade.SatisiOnaylananTekliflerDetay" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>

           <script>
               $(function () {
                   $("#btnkodgir").click(function () {
                       $("#kod").show();

                   });

               });
    </script>

    <script>
        function codeSuccess() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kod Eklendi", type: "success"
            }).then(function () { window.location = 'SatisiOnaylananTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
        }
    </script>
        <script>
            function explanationError() {
                swal({
                    title: "İŞLEM TAMAMLANAMADI", text: "Kod Eklenemedi", type: "error"
                }).then(function () { window.location = 'SatisiOnaylananTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
            }
    </script>
                <script>
                    $(function () {
                        $("#btnaciklamagir").click(function () {
                            $("#sipnodiv").hide();
                            $("#muskodudiv").hide();
                            $("#txt").show();
                        });
                    });
    </script>   
     <script>
         function explanationSuccess() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "Açıklamanız Eklendi", type: "success"
             }).then(function () { window.location = 'SatisiOnaylananTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
         }
    </script>
        <script>
            function explanationError() {
                swal({
                    title: "İŞLEM TAMAMLANAMADI", text: "Açıklamanız Eklenemedi", type: "error"
                }).then(function () { window.location = 'SatisiOnaylananTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
            }
    </script>
    
    <script>
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Seçtiğiniz Siparişe Sipariş Numarası Eklendi", type: "success"
            }).then(function () { window.location = "SatisiOnaylananTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>" });
        }
</script>
<script>
    function errorAlert() {
        swal({
            title: "İŞLEM TAMAMLANAMADI", text: "Seçtiğiniz Siparişe Sipariş Numarası Eklenemedi", type: "error"
        }).then(function () { window.location = "SatisiOnaylananTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>" });
    }
</script>
<script>
    function warningAlert() {
        swal({
            title: "İŞLEM TAMAMLANAMADI", text: "Seçtiğiniz Teklif Admin Tarafından Onaylanmadığı İçin Satış Onayı Gönderemezsiniz", type: "warning"
        }).then(function () { window.location = "OnaylananTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>" });
    }
</script>  
    <script>
        $(function () {
            $("#btnsipnogir").click(function () {
                $("#sipnodiv").show();
                $("#muskodudiv").hide();
                $("#txt").hide();
            });

        });
    </script> 
    <script>
        $(function () {
            $("#btnmusterikodugir").click(function () {
                $("#sipnodiv").hide();
                $("#muskodudiv").show();
                $("#txt").hide();
            });

        });
    </script>
    <script>
        function musterikodumevcut() {
            swal({
                title: "DİKKAT", text: "Seçtiğiniz Kayda Ait Müşteri Kodu Zaten Mevcuttur", type: "warning"
            });
        }
    </script>
       <script>
           function musterikodu() {
               swal({
                   title: "İŞLEM TAMAMLANDI", text: "Seçtiğiniz Cariye Kod Girildi", type: "success"
               }).then(function () {
                   window.location = 'SatisiOnaylananTeklifler.aspx?teklifno=<%=Request.QueryString["teklifno"]%>';
               });
           }
    </script>
         <script>
             function musterikoduhata() {
                 swal({
                     title: "İŞLEM TAMAMLANAMADI", text: "Seçtiğiniz Cariye Kod Girilemedi", type: "error"
                 }).then(function () {
                     window.location = 'SatisiOnaylananTeklifler.aspx?teklifno=<%=Request.QueryString["teklifno"]%>';
                 });
             }
    </script>
    <div class="row" style:"width:100%;">
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll;">
                              <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id" Width="100%" Theme="Moderno" CssClass="GridTemplate" >
                                          <%--  <SettingsEditing Mode="Batch">
                                            </SettingsEditing>--%>
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto"/>
                                            <ClientSideEvents BatchEditChangesSaving="function(s, e) {
	swal({
			title:&quot;İŞLEM TAMAMLANDI&quot;,text:&quot;KAYDINIZ GÜNCELLENDİ&quot;,type:&quot;success&quot;

});
}" />
                                    <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="false">
                                                  
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifTipi" VisibleIndex="50" Caption="TESLİM ŞEKLİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KonteynerBulkSecimi" VisibleIndex="17" Caption="GÖNDERİM<br/>ŞEKLİ" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="birdenfazlabeyanname" VisibleIndex="4" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="siparisTipi" VisibleIndex="19" Caption="PARÇALI SİPARİŞ<br/>PARÇALI KONTEYNER" Width="140px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ReelKar" VisibleIndex="54" Caption="FARKLILIK">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="ReelKarOrani" VisibleIndex="55" Caption="KAR<br/> ORANI" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Vade" VisibleIndex="56" Caption="VADE" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="Aciklama" VisibleIndex="64" Caption="AÇIKLAMA">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" VisibleIndex="10" Caption="TEKLİF NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" VisibleIndex="9" Caption="TEMSİLCİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TemsilciKullaniciAdi" VisibleIndex="11" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="12" Caption="MÜŞTERİ" Width="250px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Kita" VisibleIndex="14" Caption="KITA" Width="100px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ulke" VisibleIndex="13" Caption="ÜLKE" Width="100px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KalkisLimani" VisibleIndex="15" Caption="KALKIŞ<br/> LİMANI" Width="65px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="EkipmanTuru" VisibleIndex="18" Caption="EKİPMAN<br/>TÜRÜ" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="VarisLimani" VisibleIndex="16" Caption="VARIŞ<br/>LİMANI" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="23" Caption="ÜRÜN">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UrunAnaGrup" VisibleIndex="24" Caption="ÜRÜN ANA GRUP" Width="150px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UrunFiyat" VisibleIndex="33" Caption="ÜRÜN<br/>YALIN<br/>MALİYETİ" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TorbaTipi" VisibleIndex="25" Caption="TORBA<br/>TİPİ" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TorbaAgirligi" VisibleIndex="26" Caption="TORBA <br/>AĞIRLIĞI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="BBTipi" VisibleIndex="27" Caption="BB TİPİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="BBAgirligi" VisibleIndex="28" Caption="BB AĞIRLIĞI">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Palet" VisibleIndex="29" Caption="PALET" Width="70px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="birKonteynerTonaji" VisibleIndex="20" Caption="BİR<br/>KONTEYNER<br/>TONAJI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="BuKaleminBuKonteynerdekiTonaji" VisibleIndex="22" Caption="BU ÜRÜNÜN<br/> KONTEYNERDEKİ<br/>TONAJI" Width="120px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ambalaj" VisibleIndex="34" Caption="AMBALAJ<br/>MALİYETİ" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="buUrununSiparisTonaji" VisibleIndex="30" Caption="BU ÜRÜNÜN<br/>SİPARİŞ<br/> TONAJI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UrununKonteynerSayisi" VisibleIndex="31" Caption="ÜRÜNÜN<br/>KONTEYNER<br/>SAYISI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SiparistekiKonteynerSayisi" VisibleIndex="32" Caption="SİPARİŞTEKİ<br/>KONTEYNER<br/>SAYISI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="GumruklemeTON" VisibleIndex="37" Caption="GÜMRÜKLEME" Width="120px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Inspection" VisibleIndex="40" Caption="INSPECTION">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Komisyon" VisibleIndex="42" Caption="KOMİSYON">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="AraNakliyeTON" VisibleIndex="35" Caption="ARA<br/>NAKLİYE" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="DepolamaTON" VisibleIndex="36" Caption="DEPOLAMA" Width="85px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ArmatorLokali" VisibleIndex="38" Caption="ARMATÖR<br/>LOKALİ" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="LimanIcDolumBedeliTON" VisibleIndex="39" Caption="LİMAN<br/>DOLUM<br/>BEDELİ" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="NavlunTON" VisibleIndex="48" Caption="NAVLUN">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MaliyetTON" VisibleIndex="41" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SatisFiyatiTON" VisibleIndex="43" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifTarihi" VisibleIndex="44" Visible="false">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KalemMaliyeti" VisibleIndex="51" Caption="T. ŞEKLİ<br/> MALİYET" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KalemSatisFiyati" VisibleIndex="52" Caption="T. ŞEKLİ<br/> SATIŞ" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SigortaTON" VisibleIndex="49" Caption="SİGORTA">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="fobKarOrani" VisibleIndex="47" Caption="FOB<br/>KAR<br/>ORANI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FobMaliyet" VisibleIndex="45" Caption="FOB MALİYET">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="teslimsekliKarOrani" VisibleIndex="53" Caption="T. ŞEKLİ <br/>KAR ORANI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="SiparisNo" VisibleIndex="1" Caption="SİPARİŞ NO" Width="110px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="YediyuzluKod" VisibleIndex="2" Caption="MAMUL KODU" Width="110px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Durum" VisibleIndex="3" Caption="TEKLİF ONAYI" Width="110px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                             
                                                <dx:GridViewDataTextColumn FieldName="Parsiyel" VisibleIndex="21" Caption="PARSİYEL" Width="80px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TTarih" VisibleIndex="8" Caption="TEKLİF TARİHİ" Width="110px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Gun" VisibleIndex="5" Caption="GÜN" Width="65px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ay" VisibleIndex="6" Caption="AY" Width="65px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Yil" VisibleIndex="7" Caption="YIL" Width="65px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FobSatisFiyati" VisibleIndex="46" Caption="FOB SATIŞ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="57" Width="90px" Caption="ÜRÜN">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="GÖNDERİM ŞEKLİ" VisibleIndex="58" Width="90px" Caption="TESLİM<br/>ŞEKLİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TON" VisibleIndex="59">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TOPLAM SATIŞ" VisibleIndex="60" Width="100px" Caption="TOPLAM<br/>SATIŞ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TOPLAM MALİYET" VisibleIndex="61"  Width="100px" Caption="TOPLAM<br/>MALİYET">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FARK" VisibleIndex="62"  Width="100px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                
                                                <dx:GridViewDataTextColumn FieldName="KAR ORANI" VisibleIndex="63"  Width="100px">
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
                  <input type="button" id="btnsipnogir" class="btn btn-success" value="SİPARİŞ NUMARASI GİR" style="height:40px;" />
       </div>
          
               <div class="btn-group">
                  <input type="button" id="btnmusterikodugir" class="btn btn-primary" value="MÜŞTERİ KODU GİR" style="height:40px;"/>
       </div>
               <div class="btn-group">
                  <input type="button" id="btnkodgir" class="btn btn-success" value="ÜRÜN KODU GİR (ÖRNEĞİN 700176)" style="height:40px;"/>
       </div>
            <div class="btn-group">
                  <input type="button" id="btnaciklamagir" class="btn btn-warning" value="AÇIKLAMA GİR" style="height:40px;" />
            </div>
              <div class="btn-group">
           <asp:Button ID="btnRapor" runat="server" Text="RAPOR AL" CssClass="btn btn-danger" OnClick="btnRapor_Click" Height="40px"/>
                  <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"></dx:ASPxGridViewExporter>
       </div>
           
            <br />  <br />  <br />
            <div>
                  <div id="sipnodiv"  style="display:none">
                      <div>Sipariş No</div>
                    <div>
                        <asp:TextBox ID="txtsipno" runat="server" CssClass="form-control"></asp:TextBox>
                    </div><br />
                    <div>
                        <asp:Button ID="btnGir" Text="KAYDET" runat="server" CssClass="btn btn-success" OnClick="btnGir_Click" />
                    </div>
                </div>
                 <div id="kod" style="display:none">
             
              <div>
                  ÜRÜN KODU Giriniz
              </div>
              <div>
                  <asp:TextBox ID="txturunkodu" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <div>
                  <asp:Button ID="btnUrunKodu" runat="server" CssClass="btn btn-primary" Text="KAYDET" Height="40px" OnClick="btnUrunKodu_Click"/>
              </div>
          </div>
                      <div id="muskodudiv"  style="display:none">
                      <div>Müşteri Kodu</div>
                    <div>
                        <asp:TextBox ID="txtMusteriKodu" runat="server" CssClass="form-control"></asp:TextBox>
                    </div><br />
                    <div>
                        <asp:Button ID="btnMusteriKodu" Text="KAYDET" runat="server" CssClass="btn btn-primary" OnClick="btnMusteriKodu_Click"/>
                    </div>
                </div>
                 <div id="txt" style="display:none">
             
              <div>
                  Açıklama Giriniz
              </div>
              <div>
                  <asp:TextBox ID="txtAcikalam" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <div>
                  <asp:Button ID="btnAciklama" runat="server" CssClass="btn btn-primary" OnClick="btnAciklama_Click" Text="KAYDET" />
              </div>
          </div>
            </div>
             
        </div>
       
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT [Id],SiparisNo,YediyuzluKod, [TeklifTipi], [KonteynerBulkSecimi], [birdenfazlabeyanname], [siparisTipi], [Vade], [TeklifNo], [Temsilci], [TemsilciKullaniciAdi], [MusteriIsmi], [Kita], [Ulke], [KalkisLimani], [EkipmanTuru], [VarisLimani], [Urun], [UrunAnaGrup], [UrunFiyat], [TorbaTipi], [TorbaAgirligi], [BBTipi], [BBAgirligi], [Palet], [birKonteynerTonaji], [BuKaleminBuKonteynerdekiTonaji], [Ambalaj], [buUrununSiparisTonaji], [UrununKonteynerSayisi], [SiparistekiKonteynerSayisi], [Inspection], [GumruklemeTON], [Komisyon], [AraNakliyeTON], [DepolamaTON], [ArmatorLokali], [LimanIcDolumBedeliTON], [NavlunTON], [MaliyetTON], [SatisFiyatiTON], [TeklifTarihi], [KalemMaliyeti], [KalemSatisFiyati], [SigortaTON], [fobKarOrani], [FobMaliyet], [teslimsekliKarOrani], [Durum], [Parsiyel], [TTarih], [Gun], [Ay], [Yil], [ReelKar], CAST((KalemSatisFiyati-KalemMaliyeti)/KalemMaliyeti as decimal(18,3)) as [ReelKarOrani], [FobSatisFiyati],[TeklifTipi] as [GÖNDERİM ŞEKLİ],[buUrununSiparisTonaji] as [TON],CAST([KalemSatisFiyati]*[buUrununSiparisTonaji] as decimal(18,3)) as [TOPLAM SATIŞ],CAST([KalemMaliyeti]*[buUrununSiparisTonaji] as decimal(18,3)) as [TOPLAM MALİYET],CAST(([KalemSatisFiyati]*[buUrununSiparisTonaji]-[KalemMaliyeti]*[buUrununSiparisTonaji]) as decimal(18,3)) as [FARK],CAST([UrunFiyat]*[buUrununSiparisTonaji] as decimal(18,3)) as [ÜRÜN SADE MALİYETİ], CAST((KalemSatisFiyati-KalemMaliyeti)/KalemMaliyeti as decimal(18,3)) as [KAR ORANI],[Aciklama] FROM [Orders] where [Durum] = @Durum and [TeklifNo]=@teklifno  order by Id desc" UpdateCommand="update Orders set SiparisNo=@SiparisNo,YediyuzluKod=@YediyuzluKod where Id=@Id" OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
            <asp:Parameter Name="Durum" Type="String" />
            <asp:Parameter Name="teklifno" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SiparisNo" />
            <asp:Parameter Name="YediyuzluKod" />
        </UpdateParameters>
    </asp:SqlDataSource>
     

</asp:Content>
