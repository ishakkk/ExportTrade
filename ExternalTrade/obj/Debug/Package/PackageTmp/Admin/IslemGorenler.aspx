<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="IslemGorenler.aspx.cs" Inherits="ExternalTrade.Admin.IslemGorenler" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
      <div class="row" style:"width:100%;">
       <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>

        <div class="col-11" style:"width:100%;"><br />
           <div>
                  <div>BAŞLANGIÇ TARİHİ<br />
                 <asp:TextBox ID="txttar1" runat="server" CssClass="form-control" TextMode="date"></asp:TextBox>
                      <br />
                      <div>BİTİŞ<br />
                 <asp:TextBox ID="txtTar2" runat="server" CssClass="form-control" TextMode="date"></asp:TextBox>
            </div>
        
            </div><br />
              <div class="form-group row">
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll;">
                                
                         <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Theme="MaterialCompact" CssClass="GridTemplate"  DataSourceID="SqlDataSource1" KeyFieldName="Sira" Width="100%">
                                            <SettingsPager PageSize="10">
                                            </SettingsPager>
                                  <SettingsEditing Mode="Batch">
                                            </SettingsEditing>
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300"/>
                                            <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowHeaderFilterButton="True" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" AllowDragDrop="false" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                              <Columns>
                                                  <dx:GridViewDataTextColumn FieldName="Sira" ReadOnly="True" VisibleIndex="1" Visible="false">
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
                                                          <dx:GridViewDataTextColumn FieldName="NAVLUN TEKLİF" Caption="NAVLUN TEKLİF" VisibleIndex="0">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#f2f2f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                              <dx:GridViewDataTextColumn FieldName="NavlunTON" Caption="NAVLUN GERCEKLESEN" VisibleIndex="0">
                                                               <SettingsHeaderFilter Mode="CheckedList">
                                                               </SettingsHeaderFilter>
                                                               <HeaderStyle HorizontalAlign="Center" />
                                                      <ExportCellStyle HorizontalAlign="Center" BackColor="#f2f2f2">
                                                      </ExportCellStyle>
                                                          </dx:GridViewDataTextColumn>
                                                           <dx:GridViewDataTextColumn FieldName="NAVLUNFARK" Caption="FARK" VisibleIndex="0">
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
                                                              <dx:GridViewDataTextColumn Caption="SEVK TARİHİ"  FieldName="SevkTarihi" ShowInCustomizationForm="True" VisibleIndex="0">
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
                    </div>
            <div class="btn-group">
       </div>
          
          <div>
            <div>
                    <asp:Button ID="Button2" runat="server" Text="FİLTRELE" CssClass="btn btn-primary" Height="40px" OnClick="Button2_Click1"/>
                 <asp:Button ID="Button1" runat="server" Text="RAPOR AL" CssClass="btn btn-success" Height="40px" OnClick="Button1_Click"/>
              </div>
            
             
             
             
            
          
       </div>
        </div>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select ROW_NUMBER() OVER(order by e.SiparisNo) as Sira,e.SevkTarihi,e.SiparisNo,e.TeklifNo,e.Temsilci,e.MusteriIsmi,e.Kita,e.Ulke,e.Vade,e.KalkisLimani,e.VarisLimani,e.TeklifTipi,e.KonteynerBulkSecimi,e.EkipmanTuru,e.SiparistekiKonteynerSayisi,e.Urun,e.UrunAnaGrup,
e.TorbaTipi,e.TorbaAgirligi,e.BBTipi,e.BBAgirligi,e.Palet,e.UrunFiyat,e.Ambalaj,e.AraNakliyeTON,e.DepolamaTON,e.GumruklemeTON,e.ArmatorLokali,e.LimanIcDolumBedeliTON,e.Inspection,e.Komisyon,case
when e.FobMaliyet=0 then 0
else
	case
		when e.Vade='Peşin' then 0
		else
		e.FobMaliyet-(e.UrunFiyat+e.Ambalaj+e.AraNakliyeTON+e.DepolamaTON+e.GumruklemeTON+e.ArmatorLokali+e.LimanIcDolumBedeliTON+e.Inspection+e.Komisyon)
	end
end as ValorFobMaliyetEtkisi,
e.FobMaliyet,e.FobSatisFiyati,CAST((e.FobSatisFiyati-e.FobMaliyet) as decimal(18,3)) as FOBFARK,cast((e.FobSatisFiyati-e.FobMaliyet)/e.FobMaliyet as decimal(18,3)) as FOBKARORANI,CAST((e.FobSatisFiyati-e.FobMaliyet)+e.UrunFiyat as decimal(18,3)) as FOBSILO
,o.NavlunTON as [NAVLUN TEKLİF],e.NavlunTON ,CAST(o.NavlunTON-e.NavlunTON as decimal(18,3)) as NAVLUNFARK,e.SigortaTON,
case
when e.KalemMaliyeti=0 then 0

else
	case
		when e.Vade='Peşin' then 0
		else
		e.KalemMaliyeti-(e.UrunFiyat+e.Ambalaj+e.AraNakliyeTON+e.DepolamaTON+e.GumruklemeTON+e.ArmatorLokali+e.LimanIcDolumBedeliTON+e.Inspection+e.Komisyon+e.NavlunTON+e.SigortaTON)
	end

end as ValorMaliyetEtkisi,e.KalemMaliyeti,
e.KalemSatisFiyati,CAST(((e.KalemSatisFiyati)-(e.KalemMaliyeti)) as decimal(18,3)) as FARK,CAST(((e.KalemSatisFiyati-e.KalemMaliyeti)/e.KalemMaliyeti) as decimal(18,3)) as [KAR ORANI],
CAST(((e.KalemSatisFiyati)-(e.KalemMaliyeti))+e.UrunFiyat as decimal(18,3)) as TESEKLISILO,
e.Urun,e.buUrununSiparisTonaji,e.TeklifTipi,CAST(SUM(e.SHIPPEDAMOUNT/1000) as decimal(18,3)) as [SEVK EDİLEN TONAJ],
cast(SUM(e.SHIPPEDAMOUNT/1000)*e.KalemSatisFiyati  as decimal(18,3)) as [TOPLAM SATIŞ],cast(SUM(e.SHIPPEDAMOUNT)/1000*e.KalemMaliyeti as decimal(18,3)) as [TOPLAM MALİYET],CAST((SUM(e.SHIPPEDAMOUNT/1000)*e.KalemSatisFiyati)-(SUM(e.SHIPPEDAMOUNT)/1000*e.KalemMaliyeti) as decimal(18,3)) as FARK1,
CAST(((SUM(e.SHIPPEDAMOUNT/1000)*e.KalemSatisFiyati)-(SUM(e.SHIPPEDAMOUNT)/1000*e.KalemMaliyeti))/(SUM(e.SHIPPEDAMOUNT)/1000*e.KalemMaliyeti) as decimal(18,3)) as KARORANI1

from EditOrdersEnd e left outer join Orders o on e.SiparisNo=o.SiparisNo and o.YediyuzluKod=e.YediyuzluKod and  o.TeklifNo=e.TeklifNo
          where   o.SiparisNo is not null and o.YediyuzluKod is not null and o.Durum='SATISA DONDU' and e.MusteriKodu not in(select MusteriKodu from DepartmentCustomers)
group by e.SiparisNo,e.TeklifNo,e.Temsilci,e.MusteriIsmi,e.Kita,e.Ulke,e.Vade,e.KalkisLimani,e.VarisLimani,e.TeklifTipi,e.KonteynerBulkSecimi,e.EkipmanTuru,e.SiparistekiKonteynerSayisi,e.Urun,e.UrunAnaGrup,o.NavlunTON,
e.TorbaTipi,e.TorbaAgirligi,e.BBTipi,e.BBAgirligi,e.Palet,e.UrunFiyat,e.Ambalaj,e.AraNakliyeTON,e.DepolamaTON,e.GumruklemeTON,e.ArmatorLokali,e.LimanIcDolumBedeliTON,e.Inspection,e.Komisyon,e.FobMaliyet,e.FobSatisFiyati,e.NavlunTON,e.SigortaTON,e.KalemMaliyeti,e.KalemSatisFiyati,e.buUrununSiparisTonaji,e.SevkTarihi" UpdateCommand="OperationRealiteRevize" UpdateCommandType="StoredProcedure" OnSelecting="SqlDataSource1_Selecting">
             <UpdateParameters>
             
          
                <asp:Parameter Name="Sira" />
                  
                     <asp:Parameter Name="NavlunTON" Type="Decimal" />
                     <asp:Parameter Name="TeklifNo" Type="String" />
                     <asp:Parameter Name="Vade" Type="String" />
               
                     <asp:Parameter Name="KonteynerBulkSecimi"   Type="String"/>
            </UpdateParameters>
        </asp:SqlDataSource>

 
      </div>
</asp:Content>

