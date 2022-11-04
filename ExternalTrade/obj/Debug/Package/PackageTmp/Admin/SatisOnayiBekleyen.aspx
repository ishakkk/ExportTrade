<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="SatisOnayiBekleyen.aspx.cs" Inherits="ExternalTrade.Admin.SatisOnayiBekleyen" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script>
        function successAlertRevize() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kaydınız Revizeye Gönderildi", type: "success"
            }).then(function () { window.location = 'SatisOnayiBekleyen.aspx' });
        }

    </script>
    <script>
        function errorAlertRevize() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Kaydınız Revizeye Gönderilemedi", type: "error"
            }).then(function () { window.location = 'SatisOnayiBekleyen.aspx' });
        }
    </script>
 <script>
     $(function () {
         $("#btnaciklama").click(function () {
             $("#aciklamadiv").show();

         });

     });
    </script>
    <script>
        function SepetSil() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kayıt Sistemden Silindi", type: "success"
            }).then(function () { window.location = 'SatisOnayiBekleyen.aspx'; });
        }
        </script>
       <script>
           function SepetSilHata() {
               swal({
                   title: "İŞLEM TAMAMLANAMADI", text: "Kayıt Sistemden Silinemedi", type: "error"
               }).then(function () { window.location = 'SatisOnayiBekleyen.aspx'; });
           }
        </script>
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
                 title: "İŞLEM TAMAMLANDI", text: "Satışa Döndürüldü", type: "success"
             }).then(function () { window.location = "SatisOnayiBekleyen.aspx"; });
         }
</script>
    <script type="text/javascript">
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Satışa Döndürülemedi", type: "error"
            });
        }

    </script>


          <script type="text/javascript">
              function successAlert2() {
                  swal({
                      title: "İŞLEM TAMAMLANDI", text: "Satış Onayı Reddedildi", type: "success"
                  }).then(function () { window.location = "SatisOnayiBekleyen.aspx"; });
              }
</script>
    <script type="text/javascript">
        function errorAlert2() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Satış Onayı Reddedilemedi", type: "error"
            });
        }

    </script>
    <script>
        function warningAlert() {
            swal({
                title: "DİKKAT", text: "Herhangi Bir Kayıt Seçmediniz", type: "warning"
            });
        }
    </script>
     <script>
         $(document).ready(function () {
             $("#myInput").on("keyup", function () {
                 var value = $(this).val().toLocaleLowerCase();
                 $("#tbl tr").filter(function () {
                     $(this).toggle($(this).text().toLocaleLowerCase().indexOf(value) > -1);

                 });
             });

         });
    </script>
    <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>

      <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog"
                                        aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="exampleModalScrollableTitle">REVİZE KALEMLERİ</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div>
                                                        <input type="text" placeholder="ARANACAK KELİMEYİ GİRİNİZ" id="myInput" class="form-control"/>
                                                    </div><br />
                                                    <table class="table table-bordered" id="tbl">
                           <thead>
                               <tr>
                                   <th>KALEM</th>
                                   <th>REVİZE ONAYI</th>
                               </tr>
                           </thead>
                           <tbody>
                                <tr>
                                  <td>Tüm Bilgiler</td>
                                  <td>
                                      <asp:CheckBox ID="chkTum" runat="server"/>
                                   
                                  </td>
                              </tr>
                               <tr>
                                   <td>Bölge</td>
                                   <td><asp:CheckBox ID="chkBolge" runat="server"/></td>
                               </tr>
                               <tr>
                                   <td>Ülke</td>
                                    <td><asp:CheckBox ID="chkUlke" runat="server"/></td>
                               </tr>
                               <tr>
                                   <td>Müşteri</td>
                                    <td><asp:CheckBox ID="chkMusteri" runat="server"/></td>
                               </tr>
                               <tr>
                                   <td>Varış Limanı</td>
                                   <td><asp:CheckBox ID="chkVarisLimani" runat="server"/></td>
                               </tr>
                               <tr>
                                   <td>Vade</td>
                                  <td><asp:CheckBox ID="chkVade" runat="server"/></td>
                               </tr>
                               <tr>
                                    <td>Konteyner-Bulk</td>
                                  <td><asp:CheckBox ID="chkKonteynerBulk" runat="server"/></td>
                               </tr>
                               <tr>
                                    <td>Gönderim Şekli</td>
                                  <td><asp:CheckBox ID="chkGonderimSekli" runat="server"/></td>
                               </tr>
                               <tr>
                                    <td>Parçalı Sipariş/Parçalı Konteyner</td>
                                  <td><asp:CheckBox ID="chkParcali" runat="server"/></td>
                               </tr>
                               <tr>
                                   <td>Ürün</td>
                                  <td><asp:CheckBox ID="chkUrun" runat="server"/></td>
                               </tr>
                                  <tr>
                                   <td>Torba Tipi</td>
                                  <td><asp:CheckBox ID="chkTorbaTipi" runat="server"/></td>
                               </tr>
                                 <tr>
                                   <td>Torba Ağırlığı</td>
                                  <td><asp:CheckBox ID="chkTorbaAgirligi" runat="server"/></td>
                               </tr>
                                <tr>
                                   <td>BB Tipi</td>
                                  <td><asp:CheckBox ID="chkBBTipi" runat="server"/></td>
                               </tr>
                                 <tr>
                                   <td>BB Ağırlığı</td>
                                  <td><asp:CheckBox ID="chkBBAgirligi" runat="server"/></td>
                               </tr>
                                 <tr>
                                   <td>Palet</td>
                                  <td><asp:CheckBox ID="chkPalet" runat="server"/></td>
                               </tr>
                                 <tr>
                                   <td>Inspection</td>
                                  <td><asp:CheckBox ID="chkInspection" runat="server"/></td>
                               </tr>
                                 <tr>
                                   <td>Komisyon</td>
                                  <td><asp:CheckBox ID="chkKomisyon" runat="server"/></td>
                               </tr>
                                 <tr>
                                   <td>Konteyner Tipi</td>
                                  <td><asp:CheckBox ID="chkKonteynerTİpi" runat="server"/></td>
                               </tr>
                                 <tr>
                                   <td>Kalkış Limanı</td>
                                  <td><asp:CheckBox ID="chkKalkisLimani" runat="server"/></td>
                               </tr>
                                 <tr>
                                   <td>Bir Ekipman Tonajı</td>
                                  <td><asp:CheckBox ID="chkBirEkipmanTonaji" runat="server"/></td>
                               </tr>
                                 <tr>
                                   <td>Bu Ürünün Bu Ekipmandaki Tonajı</td>
                                  <td><asp:CheckBox ID="chkbuurununBuEkipmandakiTonaji" runat="server"/></td>
                               </tr>
                                 <tr>
                                   <td>Bu Ürünün Toplam Tonajı</td>
                                  <td><asp:CheckBox ID="chkbuUrununToplamTonaji" runat="server"/></td>
                               </tr>
                                
                               <tr>
                                   <td>Sipariş Ekipman Sayısı</td>
                                   <td><asp:CheckBox ID="chkSiparisEkipmanSayisi" runat="server"/></td>
                               </tr>
                                 <tr>
                                   <td>Armatör Lokali</td>
                                  <td><asp:CheckBox ID="chkArmatorLokali" runat="server"/></td>
                               </tr>
                                 <tr>
                                   <td>Navlun</td>
                                  <td><asp:CheckBox ID="chkNavlun" runat="server"/></td>
                               </tr>
                              
                           </tbody>
                       </table>
                            <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>
                    </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">KAPAT</button>
                                                   <%-- <button type="button" class="btn btn-primary">Save changes</button>--%>
                                                    <asp:Button ID="btnRevizeEt" runat="server" Text="GÖNDER" OnClick="btnRevizeEt_Click" CssClass="btn btn-success" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
         
                 <div class="row" style:"width:100%;">
                      <h1>SATIŞ ONAYI BEKLEYEN TEKLİFLER</h1>
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                          <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="TeklifNo" Theme="Moderno" CssClass="GridTemplate"  OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" AllowDragDrop="false" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                            <Columns>
                                                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0">
                                                 </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" VisibleIndex="1" Caption="TEKLİF NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" VisibleIndex="2" Width="50%" Caption="TEMSİLCİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                     
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="4" Width="100%" Caption="MÜŞTERİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ulke" VisibleIndex="3" Width="50%" Caption="ÜLKE">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TOPLAM TONAJ" VisibleIndex="5" Width="50%">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="FOB KAR ORANI" ReadOnly="True" Caption="FOB VE ÖNCESİ<br/> KAR ORANI" VisibleIndex="7" Width="50%">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="CFR KAR ORANI" ReadOnly="True" VisibleIndex="8" Width="50%">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TTarih" Caption="TEKLİF TARİHİ" ReadOnly="True" VisibleIndex="9" Width="50%">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                       <dx:GridViewDataTextColumn FieldName="TeklifTipi" Caption="GÖNDERİM ŞEKLİ" ReadOnly="True" VisibleIndex="6" Width="60%">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TeklifiOnaylayan" Caption="TEKLİFİ ONAYLAYAN" ReadOnly="True" VisibleIndex="9" Width="60%">
                                               <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                      </dx:GridViewDataTextColumn>
                                                
                                                 <dx:GridViewDataTextColumn FieldName="TarihFarki"  ReadOnly="True" VisibleIndex="10" Width="50%" Visible="false" >
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
                  <asp:Button ID="Button1" runat="server" Text="REDDET" CssClass="btn btn-dark" OnClick="Button1_Click" Height="40px"/>
                       
                  <asp:Button ID="Button2" runat="server" Text="RAPOR AL" CssClass="btn btn-primary" OnClick="Button2_Click" Height="40px"/>
                <asp:Button ID="Button3" runat="server" Text="ONAYLA" CssClass="btn btn-success" OnClick="Button3_Click" Height="40px"/>
                       <%-- <input type="button" style="height:40px" data-toggle="modal"  data-target="#exampleModalScrollable" class="btn btn-warning" value="REVİZE ET"/>--%>
                  <input type="button" value="REVİZE ET" id="btnaciklama" class="btn btn-warning" style="height:40px;" />
                 <div id="aciklamadiv" style="display:none">
            <asp:TextBox ID="txtAciklama" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
            <asp:Button ID="btn" runat="server" Text="KAYDET" CssClass="btn btn-success" OnClick="btn_Click" Height="40px"/>
        </div>
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
                            </dx:ASPxGridViewExporter>
            
       </div>
       
          
             
        </div>
        
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT u.Name+' '+u.SurName as [TeklifiOnaylayan], o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke],CAST(SUM(o.[buUrununSiparisTonaji]) as decimal(18,3)) as [TOPLAM TONAJ], CAST(SUM(o.[buUrununSiparisTonaji]) as decimal(18,3)) as [TOPLAM TONAJ],case when o.TeklifTipi='EXW' or o.TeklifTipi='FAS' or o.TeklifTipi='FCA' or o.TeklifTipi='FOB' Or o.TeklifTipi='YOK'  or  o.TeklifTipi='DAT' then CAST((SUM(o.[KalemSatisFiyati])-SUM(o.[KalemMaliyeti]))/SUM(o.[KalemMaliyeti]) as decimal(18,3)) when o.TeklifTipi='CFR' Or o.TeklifTipi='CIF' or  o.TeklifTipi='DAP' then CAST((SUM(o.[FobSatisFiyati])-SUM(o.[FobMaliyet]))/SUM(o.[FobMaliyet]) as decimal(18,3))  end AS [FOB KAR ORANI],case  when o.TeklifTipi='CFR' Or o.TeklifTipi='CIF' or  o.TeklifTipi='DAP'  then CAST((SUM(o.[KalemSatisFiyati])-SUM(o.[KalemMaliyeti]))/SUM(o.[KalemMaliyeti]) as decimal(18,3)) end AS [CFR KAR ORANI],o.TTarih,o.TeklifTipi,DATEDIFF(day,TTarih,ISNULL(SatisOnayiGondermeTarihi,TTarih)) as TarihFarki FROM [Orders] o left outer join Users u on o.TeklifiOnaylayan=u.Id where o.[Durum]=@Durum and o.[SevkDurumu] IS NULL group by o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke],u.Name+' '+u.SurName,o.TTarih,o.TeklifTipi,SatisOnayiGondermeTarihi order by TTarih desc" OnSelecting="SqlDataSource1_Selecting">
        <SelectParameters>
       
            <asp:Parameter Name="Durum" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

