<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SevkRaporu.aspx.cs" Inherits="ExternalTrade.Admin.SevkRaporu" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <script>
         function warningAlert() {
             swal({
                 title: "DİKKAT", text: "Herhangi Bir Kayıt Seçmediniz", type: "warning"
             });
         }
    </script>
        <script>
            function successAlert() {
                swal({
                    title: "İŞLEM TAMAMLANDI", text: "Rapor Oluşturuldu", type: "success"
                }).then(function () { window.location = 'SevkRaporu.aspx' });
            }
    </script>
    <style type="text/css">
        .GridTemplate * {
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif !important;
            font-size: 12px !important;
        }
    </style>

     <div class="row" style:"width:100%;">
         <h1>SEVK RAPORU</h1>
        <div class="col-11" style="width:100%;">
            <b>BAŞLANGIÇ TARİHİ</b>
            <asp:TextBox ID="txtTar1" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <b> BİTİŞ TARİHİ</b>
            <asp:TextBox ID="txtTar2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            <br />
              <div class="form-group row">
                
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                                 <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Theme="MaterialCompact" CssClass="GridTemplate"  DataSourceID="SqlDataSource1" KeyFieldName="Id" Width="100%">
                                            <SettingsPager PageSize="10">
                                            </SettingsPager>
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300"/>
                                            <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowHeaderFilterButton="True" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" AllowDragDrop="false" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                              <Columns>
                                                  <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="false">
                                                      <EditFormSettings Visible="False" />
                                                  </dx:GridViewDataTextColumn>
                                                  <dx:GridViewBandColumn Caption="MÜŞTERİ BİLGİSİ"  VisibleIndex="50">
                                                      <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                      <Columns>
                                                          <dx:GridViewDataTextColumn FieldName="MusteriIsmi" Caption="MÜŞTERİ" VisibleIndex="0">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="Kita" Caption="KITA" VisibleIndex="1">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="Ulke" Caption="ÜLKE" VisibleIndex="2">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="Vade" Caption="VADE" VisibleIndex="3">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                      </Columns>
                                                  </dx:GridViewBandColumn>
                                                  <dx:GridViewBandColumn Caption="ÜRÜN BİLGİSİ" VisibleIndex="53">
                                                      <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#8ea9db">
                                                      </ExportCellStyle>
                                                      <Columns>
                                                          <dx:GridViewDataTextColumn FieldName="Urun" Caption="ÜRÜN" VisibleIndex="0">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#8ea9db">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="UrunAnaGrup" Caption="ÜRÜN ANA SINIFI" VisibleIndex="1">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#8ea9db">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                      </Columns>
                                                  </dx:GridViewBandColumn>
                                                  <dx:GridViewBandColumn Caption="AMBALAJ BİLGİSİ" VisibleIndex="54">
                                                      <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#b4c6e7">
                                                      </ExportCellStyle>
                                                      <Columns>
                                                          <dx:GridViewDataTextColumn FieldName="TorbaTipi" Caption="TORBA <br/>TİPİ" VisibleIndex="0">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#b4c6e7">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          
                                                          <dx:GridViewDataTextColumn FieldName="TorbaAgirligi" Caption="TORBA <br/>AĞIRLIĞI" VisibleIndex="1">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#b4c6e7">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="BBTipi" Caption="BİGBAG<br/>TİPİ" VisibleIndex="2">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#b4c6e7">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="BBAgirligi" Caption="BİGBAG<br/>AĞIRLIĞI" VisibleIndex="3">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#b4c6e7">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="Palet" Caption="PALET" VisibleIndex="4">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#b4c6e7">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                      </Columns>
                                                  </dx:GridViewBandColumn>
                                                  <dx:GridViewBandColumn Caption="HESAPLAMA" VisibleIndex="55">
                                                       <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#fff2cc">
                                                      </ExportCellStyle>
                                                      <Columns>
                                                          <dx:GridViewDataTextColumn FieldName="UrunFiyat" Caption="ÜRÜN <br/>SADE<br/>FİYATI" VisibleIndex="0">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#fff2cc">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="Ambalaj" Caption="AMBALAJ" VisibleIndex="1">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#fff2cc">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="AraNakliyeTON" Caption="ARA<br/>NAKLİYE" VisibleIndex="2">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#fff2cc">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="DepolamaTON" Caption="DEPOLAMA" VisibleIndex="3">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#fff2cc">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="GumruklemeTON" Caption="GÜMRÜKLEME" VisibleIndex="4">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#fff2cc">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="ArmatorLokali" Caption="ARMATÖR<br/>LOKALİ" VisibleIndex="5">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#fff2cc">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="LimanIcDolumBedeliTON" Caption="LİMAN<br/>DOLUM<br/>BEDELİ" VisibleIndex="6">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#fff2cc">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="Inspection" Caption="INSPECTION" VisibleIndex="7">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#fff2cc">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="Komisyon" Caption="KOMİSYON" VisibleIndex="8">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#fff2cc">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                      </Columns>
                                                  </dx:GridViewBandColumn>
                                                  <dx:GridViewBandColumn Caption="EXW&amp;FCA&amp;FAS&amp;FOB" VisibleIndex="56">
                                                       <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                      <Columns>
                                                          <dx:GridViewDataTextColumn FieldName="ValorFobMaliyetEtkisi" Caption="FOB<br/>VALÖR<br/>ETKİSİ" ReadOnly="True" VisibleIndex="0">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="FobMaliyet" Caption="FOB<br/>AMLİYETİ" VisibleIndex="1">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="FobSatisFiyati" Caption="FOB<br/> SATIŞ <br/>FİYATI" VisibleIndex="2">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="FOBFARK" Caption="FARK" ReadOnly="True" VisibleIndex="3">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="FOBKARORANI" Caption="FOB<br/>KAR<br/>ORANI" ReadOnly="True" VisibleIndex="4">
                                                                 <SettingsHeaderFilter Mode="CheckedList">
                                                                 </SettingsHeaderFilter>
                                                                 <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="FOBSILO" Caption="SİLO" ReadOnly="True" VisibleIndex="5">
                                                                 <SettingsHeaderFilter Mode="CheckedList">
                                                                 </SettingsHeaderFilter>
                                                                 <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                      </Columns>
                                                  </dx:GridViewBandColumn>
                                                  <dx:GridViewBandColumn Caption="NAVLUN" VisibleIndex="57">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#f2f2f2">
                                                      </ExportCellStyle>
                                                      <Columns>
                                                          <dx:GridViewDataTextColumn FieldName="NavlunTON" Caption="NAVLUN" VisibleIndex="0">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#f2f2f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="SigortaTON" Caption="SİGORTA" VisibleIndex="1">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#f2f2f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                      </Columns>
                                                  </dx:GridViewBandColumn>
                                                  <dx:GridViewBandColumn Caption="TESLİM ŞEKLİ" VisibleIndex="58">
                                                       <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                      <Columns>
                                                          <dx:GridViewDataTextColumn FieldName="ValorMaliyetEtkisi" Caption="VALÖR<br/>T.ŞEKLİ MALİYET<br/>ETKİSİ" ReadOnly="True" VisibleIndex="0">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="KalemMaliyeti" Caption="TESLİM ŞEKLİ<br/>MALİYETİ" VisibleIndex="1">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="KalemSatisFiyati" Caption="TESLİM ŞEKLİ<br/>SATIŞ FİYATI" VisibleIndex="2">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="FARK" ReadOnly="True" Caption="FARK" VisibleIndex="3">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="KAR ORANI" Caption="KAR<br/>ORANI" ReadOnly="True" VisibleIndex="4">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="TESEKLISILO" Caption="SİLO" ReadOnly="True" VisibleIndex="5">
                                                                <SettingsHeaderFilter Mode="CheckedList">
                                                                </SettingsHeaderFilter>
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#e2efda">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                      </Columns>
                                                  </dx:GridViewBandColumn>
                                                  <dx:GridViewBandColumn Caption="ÖZET TABLO" VisibleIndex="59">
                                                       <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#d9e1f2">
                                                      </ExportCellStyle>
                                                      <Columns>
                                                          <dx:GridViewDataTextColumn FieldName="Urun1" Caption="ÜRÜN" VisibleIndex="0">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#d9e1f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="buUrununSiparisTonaji" Caption="BU ÜRÜNÜN<br/>SİPARİŞ TONAJI" VisibleIndex="1">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#d9e1f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="TeklifTipi1" Caption="GÖNDERİM<br/>ŞEKLİ" VisibleIndex="2">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#d9e1f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="SEVK EDİLEN TONAJ" Caption="SEVK<br/>EDİLEN<br/>TONAJ" ReadOnly="True" VisibleIndex="3">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#d9e1f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="TOPLAM SATIŞ" Caption="TOPLAM<br/>SATIŞ" ReadOnly="True" VisibleIndex="4">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#d9e1f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="TOPLAM MALİYET" Caption="TOPLAM<br/>MALİYET" ReadOnly="True" VisibleIndex="5">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#d9e1f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="FARK1" ReadOnly="True" Caption="FARK" VisibleIndex="6">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#d9e1f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="KARORANI1" Caption="KAR <br/>ORANI" ReadOnly="True" VisibleIndex="7">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#d9e1f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                      </Columns>
                                                  </dx:GridViewBandColumn>
                                                  <dx:GridViewBandColumn Caption="OPERASYON BİLGİSİ" VisibleIndex="52">
                                                     <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#f2f2f2">
                                                      </ExportCellStyle>
                                                      <Columns>
                                                          <dx:GridViewDataTextColumn FieldName="TeklifTipi" Caption="GÖNDERİM<br/>ŞEKLİ" VisibleIndex="0">
                                                                  <SettingsHeaderFilter Mode="CheckedList">
                                                                  </SettingsHeaderFilter>
                                                                  <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#f2f2f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="KonteynerBulkSecimi" Caption="SEVK<br/>TİPİ" VisibleIndex="1">
                                                                  <SettingsHeaderFilter Mode="CheckedList">
                                                                  </SettingsHeaderFilter>
                                                                  <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#f2f2f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="KalkisLimani" Caption="KALKIŞ<br/>LİMANI" VisibleIndex="2">
                                                                  <SettingsHeaderFilter Mode="CheckedList">
                                                                  </SettingsHeaderFilter>
                                                                  <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#f2f2f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="VarisLimani" Caption="VARIŞ<br/>LİMANI" VisibleIndex="3">
                                                                  <SettingsHeaderFilter Mode="CheckedList">
                                                                  </SettingsHeaderFilter>
                                                                  <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#f2f2f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="EkipmanTuru" Caption="EKİPMAN<br/>TÜRÜ" VisibleIndex="4">
                                                                  <SettingsHeaderFilter Mode="CheckedList">
                                                                  </SettingsHeaderFilter>
                                                                  <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#f2f2f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn FieldName="SiparistekiKonteynerSayisi" Caption="SİPARİŞTEKİ<br/>KONTEYNER<br/>SAYISI" VisibleIndex="5">
                                                                  <SettingsHeaderFilter Mode="CheckedList">
                                                                  </SettingsHeaderFilter>
                                                                  <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#f2f2f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                      </Columns>
                                                  </dx:GridViewBandColumn>
                                                  <dx:GridViewBandColumn ToolTip=" " VisibleIndex="0">
                                                        <ExportCellStyle BackColor="#DDEBF7" HorizontalAlign="Center">
                                                              </ExportCellStyle>
                                                      <Columns>
                                                             <dx:GridViewDataTextColumn Caption="SEVK TARİHİ"  FieldName="SEVK_TARIHI" ShowInCustomizationForm="True" VisibleIndex="0">
                                                              <SettingsHeaderFilter Mode="CheckedList">
                                                              </SettingsHeaderFilter>
                                                              <ExportCellStyle BackColor="#DDEBF7" HorizontalAlign="Center">
                                                              </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn Caption="SİPARİŞ NO"  FieldName="SiparisNo" ShowInCustomizationForm="True" VisibleIndex="0">
                                                              <SettingsHeaderFilter Mode="CheckedList">
                                                              </SettingsHeaderFilter>
                                                              <ExportCellStyle BackColor="#DDEBF7" HorizontalAlign="Center">
                                                              </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn Caption="TEKLİF NO"  FieldName="TeklifNo" ShowInCustomizationForm="True" VisibleIndex="1">
                                                              <SettingsHeaderFilter Mode="CheckedList">
                                                              </SettingsHeaderFilter>
                                                              <ExportCellStyle BackColor="#DDEBF7" HorizontalAlign="Center">
                                                              </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                          <dx:GridViewDataTextColumn Caption="TEMSİLCİ"  FieldName="Temsilci" ShowInCustomizationForm="True" VisibleIndex="2">
                                                              <SettingsHeaderFilter Mode="CheckedList">
                                                              </SettingsHeaderFilter>
                                                              <ExportCellStyle BackColor="#DDEBF7" HorizontalAlign="Center">
                                                              </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                      </Columns>
                                                  </dx:GridViewBandColumn>
                                            </Columns>
                                                                   <Styles>
                                <Header Font-Size="Small">
                                </Header>
                                <DetailRow Font-Size="Small" Wrap="True">
                                </DetailRow>
                                <DetailCell Font-Size="X-Small">
                                </DetailCell>
                                <FocusedRow BackColor="#FFCC99" ForeColor="Black">
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
                 <asp:Button ID="Button1" runat="server" Text="ÇEK" CssClass="btn btn-danger"  Height="50px" OnClick="Button1_Click"/>
          
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
                            </dx:ASPxGridViewExporter>
       </div>
        <div class="btn-group">
             <asp:Button ID="btnRapor" runat="server" Text="RAPOR AL" CssClass="btn btn-success" OnClick="btnRapor_Click" Height="50px"/>
        </div>
          
              
        </div>
       
    </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select CAST(LOGO.SEVK_TARIHI as date) as SEVK_TARIHI, o.MusteriIsmi, o.SiparisNo,o.TeklifNo,o.Temsilci,o.Kita,o.Ulke,o.Vade,o.TeklifTipi,o.KonteynerBulkSecimi,o.KalkisLimani,o.VarisLimani,o.EkipmanTuru,o.SiparistekiKonteynerSayisi,o.Urun as Urun,o.UrunAnaGrup,o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,
o.UrunFiyat,o.Ambalaj,o.AraNakliyeTON,o.DepolamaTON,o.GumruklemeTON,o.ArmatorLokali,o.LimanIcDolumBedeliTON,o.Inspection,o.Komisyon,o.FobMaliyet-(o.UrunFiyat+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.ArmatorLokali+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon) as ValorFobMaliyetEtkisi,
o.FobMaliyet,o.FobSatisFiyati,CAST((o.FobSatisFiyati-o.FobMaliyet) as decimal(18,2)) as FOBFARK,cast((FobSatisFiyati-FobMaliyet)/FobMaliyet as decimal(18,2)) as FOBKARORANI,(FobSatisFiyati-FobMaliyet+o.UrunFiyat) as FOBSILO,o.NavlunTON,o.SigortaTON,
o.KalemMaliyeti-(o.UrunFiyat+o.Ambalaj+o.AraNakliyeTON+o.DepolamaTON+o.GumruklemeTON+o.ArmatorLokali+o.LimanIcDolumBedeliTON+o.Inspection+o.Komisyon+o.NavlunTON+o.SigortaTON) as ValorMaliyetEtkisi,
o.KalemMaliyeti,o.KalemSatisFiyati,CAST((KalemSatisFiyati-KalemMaliyeti) as decimal(18,2)) as FARK,cast((KalemSatisFiyati-KalemMaliyeti)/KalemMaliyeti as decimal(18,2)) as [KAR ORANI],
(KalemSatisFiyati-KalemMaliyeti+UrunFiyat) as TESEKLISILO,o.Urun as Urun1,o.buUrununSiparisTonaji,o.TeklifTipi as TeklifTipi1,CAST(SUM(LOGO.MIKTAR) as decimal(18,3)) as [SEVK EDİLEN TONAJ],

CAST(SUM(KalemSatisFiyati*LOGO.MIKTAR) as decimal(18,3)) as [TOPLAM SATIŞ],CAST(SUM(KalemMaliyeti*LOGO.MIKTAR) as decimal(18,3)) as [TOPLAM MALİYET],CAST(SUM(KalemSatisFiyati*LOGO.MIKTAR)-SUM(KalemMaliyeti*LOGO.MIKTAR) as decimal(18,3))
as FARK1,CAST((SUM(KalemSatisFiyati*LOGO.MIKTAR)-SUM(KalemMaliyeti*LOGO.MIKTAR))/SUM(KalemMaliyeti*LOGO.MIKTAR) as decimal(18,3))    as KARORANI1

from Orders o left outer join (select  SUM(MIKTAR/1000) as MIKTAR,SIPARIS_NO,SEVK_TARIHI,MAMUL_KODU   from DTBSSRVR.TIGERDB.dbo.Z_219_SEVKVESIPARIS   group by SIPARIS_NO,SEVK_TARIHI,MAMUL_KODU ) as LOGO on o.SiparisNo=LOGO.SIPARIS_NO and o.YediyuzluKod=LOGO.MAMUL_KODU
where o.Durum='SATISA DONDU' and ISNULL(o.Kontrol,0)=0 and LOGO.SEVK_TARIHI between @p1 and @p2 and o.SiparisNo is not null and o.YediyuzluKod is not null and MusteriKodu not in (select MusteriKodu from DepartmentCustomers)
group by  o.SiparisNo,o.TeklifNo,o.Temsilci,o.Kita,o.Ulke,o.Vade,o.TeklifTipi,o.KonteynerBulkSecimi,o.KalkisLimani,o.VarisLimani,o.EkipmanTuru,o.SiparistekiKonteynerSayisi,o.Urun,o.UrunAnaGrup,o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,
o.UrunFiyat,o.Ambalaj,o.AraNakliyeTON,o.DepolamaTON,o.GumruklemeTON,o.ArmatorLokali,o.LimanIcDolumBedeliTON,o.Inspection,o.Komisyon,o.FobMaliyet,o.FobSatisFiyati,o.NavlunTON,o.SigortaTON,o.KalemMaliyeti,o.KalemSatisFiyati,o.buUrununSiparisTonaji,o.MusteriIsmi,LOGO.SEVK_TARIHI" OnSelecting="SqlDataSource1_Selecting">
        
       <SelectParameters>
                <asp:Parameter Name="p1" />
                <asp:Parameter Name="p2" />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>
