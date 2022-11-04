<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="RevizeIstenenTekliflerDetay.aspx.cs" Inherits="ExternalTrade.RevizeIstenenTekliflerDetay" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style type="text/css">
        .GridTemplate * {
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif !important;
            font-size: 12px !important;
        }
    </style>

     <script>
         function sec() {
             swal({
                 title: "DİKKAT", text: "Herhangi Bir Kayıt Seçmediniz", type: "warning"
             });
         }
    </script>
             <link href="StyleSheet.css" rel="stylesheet" />
   
    <script>
        $(function () {
            $("#btnaciklamagir").click(function () {
                $("#txt").show();
            });
        });
    </script>
    <script>
        function sayfayukle() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kaydınız Revize Edildi", type: "success"
            }).then(function () { window.location = 'RevizeIstenenTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
        }
        function eklendi() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kaydınız Eklendi", type: "success"
            }).then(function () { window.location = 'RevizeIstenenTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
        }
        function eklenemedi() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Kaydınız Eklenemedi", type: "error"
            });
        }
    </script>
    <script>
        function explanationSuccess() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Açıklamanız Eklendi", type: "success"
            }).then(function () { window.location = 'OnayBekleyenTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
        }
    </script>
        <script>
            function explanationError() {
                swal({
                    title: "İŞLEM TAMAMLANAMADI", text: "Açıklamanız Eklenemedi", type: "error"
                }).then(function () { window.location = 'OnayBekleyenTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
            }
            function revizesuccess() {
                swal({
                    title: "İŞLEM TAMAMLANDI", text: "Kaydınız Revize Edildi", type: "success"
                }).then(function () { window.location = 'RevizeIstenenTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
            }
            function revizeerror() {
                swal({
                    title: "İŞLEM TAMAMLANDI", text: "Kaydınız Revize Edilemedi", type: "error"
                }).then(function () { window.location = 'RevizeIstenenTekliflerDetay.aspx?teklifno=<%=Request.QueryString["teklifno"]%>' });
            }
    </script>
  <script>
      $(document).ready(function () {
          $("input[name='onaltidort']").click(function () {
              $("#palet").hide();
              $("#onaltidorturundetay").show();
              $("#urun1375").show();
              $("#urun1250").show();
              $("#ürün2").show();
          });
          var urunanasinifDLL = $("#urunust");
          var urundetayDDL = $("#urun");
          var urundetayDDLiki = $("#urun2");
          $.ajax({
              //url: "http://trade.nigtas.com/AJAX.asmx/GetContinents",
              url: "AJAX.asmx/GetProduct",
              method: "post",
              dataType: "json",
              success: function (data) {
                  $("#urunust").append($('<option/>', { value: -1, text: 'ÜRÜN ÜST SINIF' }));
                  $("#urun").append($('<option/>', { value: -1, text: 'ÜRÜN' }));
                  $("#urun2").append($('<option/>', { value: -1, text: 'ÜRÜN' }));
                  $(data).each(function (index, item) {
                      $("#urunust").append($('<option/>', { value: item.Code, text: item.ProductName }));
                  });
              },
              error: function (err) {
                  console.log(err);
              }
          });
          $("#urunust").change(function () {
              if ($(this).val() == "-1") {
                  $("#urunust").empty();
                  $("#urun").append("<option/>", { value: -1, text: 'ÜRÜN SEÇİNİZ' });
                  $("#urun2").append("<option/>", { value: -1, text: 'ÜRÜN SEÇİNİZ' });
              }
              else {
                  $.ajax({
                      url: "AJAX.asmx/GetProductDetailt",
                      data: { NAME: $(this).val() },
                      method: "post",
                      dataType: "json",
                      success: function (data) {
                          $("#urun").empty();

                          $("#urun").append($('<option/>', { value: -1, text: 'ÜRÜN SEÇİNİZ' }));

                          $("#urun2").empty();

                          $("#urun2").append($('<option/>', { value: -1, text: 'ÜRÜN SEÇİNİZ' }));

                          $(data).each(function (index, item) {
                              $("#urun").append($('<option/>', { value: item.CODE, text: item.NAME }));
                              $("#urun2").append($('<option/>', { value: item.CODE, text: item.NAME }));
                          });
                      }
                  });
              }
          });
      });
  </script>
         <div class="modal fade bs-example-modal-xl" id="mdlRevize" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myExtraLargeModalLabel">KAYIT DÜZENLE</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                    <table class="table table-bordered">
                                                        <tr>
                                                            <td>$:<dx:ASPxLabel ID="lblDolar" runat="server"></dx:ASPxLabel></td>
                                                            <td>€:<dx:ASPxLabel ID="lblEuro" runat="server"></dx:ASPxLabel></td>
                                                            <td>Parite:<dx:ASPxLabel ID="lblParite" runat="server"></dx:ASPxLabel></td>
                                                        </tr>
                                                    </table>
                                                 <table class="table table-bordered"> 

                                                     <tr>
                                                         <td>
                                                             ÜRÜN SINIFI
                                                         </td>
                                                         <td>
                                                             <asp:Label ID="lblUrun" runat="server"></asp:Label>
                                                         </td>
                                                     </tr>
                                                        <tr>
                                                         <td>
                                                             ÜRÜN
                                                         </td>
                                                         <td>
                                                            <asp:DropDownList ID="drpUrunLogo" runat="server" CssClass="form-control select2"></asp:DropDownList>
                                                         </td>
                                                     </tr>
                                                       <tr>
                                                         <td>
                                                            Torba Tipi
                                                         </td>
                                                         <td>
                                                            <asp:DropDownList ID="drpTorbaTipi" runat="server" CssClass="form-control select2"></asp:DropDownList>
                                                         </td>
                                                     </tr>
                                                      <tr>
                                                         <td>
                                                            Torba Ağırlığı
                                                         </td>
                                                         <td>
                                                            <asp:DropDownList ID="drpTorbaAgirligi" runat="server" CssClass="form-control select2"></asp:DropDownList>
                                                         </td>
                                                     </tr>
                                                      <tr>
                                                         <td>
                                                            BigBag Tipi
                                                         </td>
                                                         <td>
                                                            <asp:DropDownList ID="drpBigBagTipi" runat="server" CssClass="form-control select2"></asp:DropDownList>
                                                         </td>
                                                     </tr>
                                                      <tr>
                                                         <td>
                                                            BigBag Ağırlığı
                                                         </td>
                                                         <td>
                                                            <asp:DropDownList ID="drpBigBagAgirligi" runat="server" CssClass="form-control select2"></asp:DropDownList>
                                                         </td>
                                                     </tr>
                                                      <tr>
                                                         <td>
                                                            Palet Tipi
                                                         </td>
                                                         <td>
                                                            <asp:DropDownList ID="drpPaletTipi" runat="server" CssClass="form-control select2"></asp:DropDownList>
                                                         </td>
                                                     </tr>
                                                      <tr>
                                                         <td>
                                                           Palet Ağırlığı
                                                         </td>
                                                         <td>
                                                            <asp:DropDownList ID="drpPaletAgirligi" runat="server" CssClass="form-control select2"></asp:DropDownList>
                                                         </td>
                                                     </tr>
                                                      <tr>
                                                          <td>KALKIŞ LİMANI</td>
                                                          <td>
                                                              <asp:DropDownList ID="drpKalkisLimani" runat="server" CssClass="form-control"></asp:DropDownList>
                                                          </td>
                                                      </tr>
                                                     
                                                     <asp:Panel ID="PNLbirekipmantonji" runat="server">
                                                           <tr >
                                                          <td>1 EKİPMAN TONAJI</td>
                                                          <td>
                                                              <asp:TextBox ID="txtbirEkipmanTonaji" runat="server" CssClass="form-control"></asp:TextBox>
                                                          </td>
                                                      </tr>
                                                     </asp:Panel>
                                                   <asp:Panel ID="Panel1" runat="server">
                                                        <tr>
                                                          <td>BU ÜRÜNÜN BU EKİPMANDAKİ TONAJI</td>
                                                          <td>
                                                              <asp:TextBox ID="txtbuUrununBuEkipmandakiTonaji" runat="server" CssClass="form-control"></asp:TextBox>
                                                          </td>
                                                      </tr>
                                                     </asp:Panel>
                                                        <tr>
                                                          <td>BU ÜRÜNÜN TOPLAM TONAJI</td>
                                                          <td>
                                                              <asp:TextBox ID="txtbuUrununToplamTonaji" runat="server" CssClass="form-control"></asp:TextBox>
                                                          </td>
                                                      </tr>
                                                       <tr>
                                                          <td>TOPLAM SİPARİŞ TONAJI</td>
                                                          <td>
                                                              <asp:TextBox ID="txtToplamSiparisTonajı" runat="server" CssClass="form-control"></asp:TextBox>
                                                          </td>
                                                      </tr>
                                                     <asp:Panel ID="pnlEkipmanSayisi" runat="server">
                                                      <tr>
                                                          <td>SİPARİŞ EKİPMAN SAYISI</td>
                                                          <td>
                                                              <asp:TextBox ID="txtSiparisEkipmanSayisi" runat="server" CssClass="form-control"></asp:TextBox>
                                                          </td>
                                                      </tr>
                                                  
                                                     </asp:Panel>
                                                     <tr>
                                                         <td>Inspection</td>
                                                         <td>
                                                              <asp:TextBox ID="txtInspection" runat="server" CssClass="form-control"></asp:TextBox>
                                                         </td>
                                                        
                                                     </tr>
                                                      <tr>
                                                          <td>Komisyon</td>
                                                         <td>
                                                              <asp:TextBox ID="txtKomiston" runat="server" CssClass="form-control"></asp:TextBox>
                                                         </td>
                                                        
                                                     </tr>
                                                    <asp:Panel ID="pnlArmator" runat="server">
                                                          <tr>
                                                          <td>ARMATÖR LOKALİ</td>
                                                          <td>
                                                              <asp:TextBox ID="txtArmatorLokaliRevize" runat="server" CssClass="form-control"></asp:TextBox>
                                                          </td>
                                                      </tr>
                                                    </asp:Panel>
                                                         <asp:Panel ID="pnlNavlun" runat="server">
                                                        <tr>
                                                          <td>NAVLUN</td>
                                                          <td>
                                                              <asp:TextBox ID="txtNavlunRevize" runat="server" CssClass="form-control"></asp:TextBox>
                                                          </td>
                                                      </tr>
                                                     </asp:Panel>
                                                 
                                                   
                                                 </table>
                                                </div>
                                                <asp:Button ID="btnRevizeEt2" runat="server" CssClass="btn btn-primary" Text="GÜNCELLE" OnClick="btnRevizeEt2_Click" />
                                            </div>
                                        </div>
                                    </div>

 
    <script>
        function openModal() {
            $('#mdlRevize').modal('show');
        }
        function birekipmantonajigizle() {
            $("#birekipmantonaji").hide();
        }
        function birekipmantonajigizle() {
            $("#birekipmantonaji").show();
        }
      
    </script>
 
    <div class="row" style:"width:100%;">
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll;">
                         
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server"  AutoGenerateColumns="False" Width="100%" DataSourceID="SqlDataSource1" KeyFieldName="Id" Theme="Moderno" CssClass="GridTemplate" >
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" VerticalScrollableHeight="500" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto"/>
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                            <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
                                             <Columns>
                                         
                                                 <dx:GridViewCommandColumn VisibleIndex="0" ShowDeleteButton="True">
                                                 </dx:GridViewCommandColumn>
                                         
                                                <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="false">
                                                  
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifTipi" VisibleIndex="49" Caption="TESLİM ŞEKLİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KonteynerBulkSecimi" VisibleIndex="16" Caption="GÖNDERİM<br/>ŞEKLİ" Width="90px">
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
                                                <dx:GridViewDataTextColumn FieldName="teslimsekliKarOrani" VisibleIndex="52" Caption="T. ŞEKLİ <br/>KAR ORANI" Width="90px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Durum" VisibleIndex="2" Caption="TEKLİF ONAYI" Width="110px">
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
                                                  <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="56" Width="90px" Caption="ÜRÜN">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="GÖNDERİM ŞEKLİ" VisibleIndex="57" Width="90px" Caption="TESLİM<br/>ŞEKLİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TON" VisibleIndex="58">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TOPLAM SATIŞ" VisibleIndex="59" Width="100px" Caption="TOPLAM<br/>SATIŞ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TOPLAM MALİYET" VisibleIndex="60"  Width="100px" Caption="TOPLAM<br/>MALİYET">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="FARK" VisibleIndex="61"  Width="100px">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                
                                                <dx:GridViewDataTextColumn FieldName="KAR ORANI" VisibleIndex="62"  Width="100px">
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
            </div>
        </div>
        <asp:UpdatePanel ID="up" runat="server">
                    
        <ContentTemplate>
            <asp:Panel ID="pnlHider" runat="server" CssClass="hider" Visible="false">
            </asp:Panel>
            <asp:Panel ID="pnlKayitEkle" runat="server" Visible="false" CssClass="popupbox" >
                   <div class="card" >
                                    <div class="card-body p-4">
                                   <div>
                                                    UDS KUR($):<asp:Label ID="lbldolar2" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    EURO KUR(€):<asp:Label ID="lbleuro2" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    PARİTE(€/$):<asp:Label ID="lblparite2" runat="server"></asp:Label>
                                                </div>

                                        <div class="form-group mb-3">
                                           Eski Satış Fiyatı:<asp:Label ID="lblKalemMaliyet" runat="server"></asp:Label><br />
                                            <label for="emailaddress">Satış Fiyatı</label>
                                            <asp:TextBox ID="txtTeslimSekliSatisFİyati" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
                                        <div class="form-group mb-3">
                                             Eski FOB Satış Fiyatı :<asp:Label ID="lblfobmaliyet" runat="server"></asp:Label><br />
                                            <label for="password">FOB Satış Fiyatı</label>
                                            <asp:TextBox ID="txtFobSatisFiyati" runat="server" CssClass="form-control"></asp:TextBox>

                                        </div>
         
                                        <div class="form-group mb-0 text-center">
                                            <asp:Button ID="btnekle2" runat="server" Text="KAYDET" CssClass="btn btn-primary btn-block" OnClick="btnEkle2_Click" Height="40px"/>

                                        </div>
                                          <div class="form-group mb-0 text-center">
                                            <asp:Button ID="Button2" runat="server" Text="KUR HESAPLA" CssClass="btn btn-warning btn-block" OnClick="Button2_Click" Height="40px"/>

                                        </div>
                                         <div class="form-group mb-0 text-center">
                                            <asp:Button ID="btnKapat" runat="server" Text="VAZGEÇ" CssClass="btn btn-danger btn-block" OnClick="lbModalPopupKapat_Click" Height="40px"/>

                                        </div>
                                           <div class="form-group mb-0 text-center">
                                           
                                                 <table class="table table-bordered">
                                                           
                                                               <tr>
                                                               
                                                                   <td>Euro Fob Satış</td>
                                                                   <td>
                                                                       <asp:Label ID="lbleurofob" runat="server"></asp:Label>
                                                                   </td>
                                                                   <td>TL Fob Satış</td>
                                                                   <td>
                                                                       <asp:Label ID="lbltlfob" runat="server"></asp:Label>
                                                                   </td>
                                                               </tr>
                                                             <tr>
                                                               
                                                                   <td>Euro  Satış</td>
                                                                   <td>
                                                                       <asp:Label ID="lbleurocfr" runat="server"></asp:Label>
                                                                   </td>
                                                                   <td>TL  Satış</td>
                                                                   <td>
                                                                       <asp:Label ID="lbltlcfr" runat="server"></asp:Label>
                                                                   </td>
                                                               </tr>
                                                        </table>
                                        </div>
                                    </div>
                              

                            <!-- end card-body -->
                        </div>
     
            </asp:Panel>
                         </div>

              <div class="btn-group">
           

       </div>
             
               <div class="btn-group">
           <asp:Button ID="btnRapor" runat="server" Text="RAPOR AL" CssClass="btn btn-danger" OnClick="btnRapor_Click" Height="40px"/>
                   <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"></dx:ASPxGridViewExporter>
       </div>
            <input type="button" id="btnaciklamagir" class="btn btn-primary" value="AÇIKLAMA GİR" style="height:40px;" />
            
         
              
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-warning" Text="REVİZE ET" OnClick="Button1_Click"   Height="40px" />
           
                <asp:Button ID="btnRevizeEt" runat="server" CssClass="btn btn-success" Text="SATIŞ FİYATI GİR" OnClick="btnRevize_Click" Height="40px"/>
              
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
                  <asp:Button ID="btnAciklama" runat="server" CssClass="btn btn-primary" OnClick="btnAciklama_Click" Text="KAYDET" Height="40px"/>
              </div>
              
          </div>
            
     </ContentTemplate>
    </asp:UpdatePanel>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT [Id], [TeklifTipi], [KonteynerBulkSecimi], [birdenfazlabeyanname], [siparisTipi], [Vade], [TeklifNo], [Temsilci], [TemsilciKullaniciAdi], [MusteriIsmi], [Kita], [Ulke], [KalkisLimani], [EkipmanTuru], [VarisLimani], [Urun], [UrunAnaGrup], [UrunFiyat], [TorbaTipi], [TorbaAgirligi], [BBTipi], [BBAgirligi], [Palet], [birKonteynerTonaji], [BuKaleminBuKonteynerdekiTonaji], [Ambalaj], [buUrununSiparisTonaji], [UrununKonteynerSayisi], [SiparistekiKonteynerSayisi], [Inspection], [GumruklemeTON], [Komisyon], [AraNakliyeTON], [DepolamaTON], [ArmatorLokali], [LimanIcDolumBedeliTON], [NavlunTON], [MaliyetTON], [SatisFiyatiTON], [TeklifTarihi], [KalemMaliyeti], [KalemSatisFiyati], [SigortaTON], [fobKarOrani], [FobMaliyet], [teslimsekliKarOrani], [Durum], [Parsiyel], [TTarih], [Gun], [Ay], [Yil], [ReelKar],CAST((KalemSatisFiyati-KalemMaliyeti)/KalemMaliyeti as decimal(18,3)) as [ReelKarOrani], [FobSatisFiyati],[TeklifTipi] as [GÖNDERİM ŞEKLİ],[buUrununSiparisTonaji] as [TON],CAST([KalemSatisFiyati]*[buUrununSiparisTonaji] as decimal(18,3)) as [TOPLAM SATIŞ],CAST([KalemMaliyeti]*[buUrununSiparisTonaji] as decimal(18,3)) as [TOPLAM MALİYET],CAST(([KalemSatisFiyati]*[buUrununSiparisTonaji]-[KalemMaliyeti]*[buUrununSiparisTonaji]) as decimal(18,3)) as [FARK],CAST([UrunFiyat]*[buUrununSiparisTonaji] as decimal(18,3)) as [ÜRÜN SADE MALİYETİ], CAST(([KalemSatisFiyati]-[KalemMaliyeti])/[KalemMaliyeti] as decimal(18,3)) as [KAR ORANI],[Aciklama] FROM [Orders] where  [Durum]=@Durum and [TeklifNo]=@teklifno and [SevkDurumu] IS NULL and [KILIT]=0  order by Id desc" DeleteCommand="delete from Orders where Id=@Id" OnSelecting="SqlDataSource1_Selecting">
  <SelectParameters>
      <asp:Parameter Name="Durum" />
        
        <asp:Parameter Name="teklifno" />

  </SelectParameters>
     <DeleteParameters>
         <asp:Parameter Name="Id" />
     </DeleteParameters>
        </asp:SqlDataSource>
      
   
</asp:Content>
