<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="SatisiOnaylananTeklifler.aspx.cs" Inherits="ExternalTrade.SatisiOnaylananTeklifler" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %><asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
        function LogoyaYazildi() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "KAYIT LOGOYA YAZDIRILMAK İÇİN SIRAYA ALINDI", type: "success"
            }).then(function () {
                window.location = 'SatisiOnaylananTeklifler.aspx';
            });
        }
        function LogoyaYazilamadi(data) {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: data, type: "error"
            });
        }
        function LogodaGuncellendi() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "KAYIT LOGODA GÜNCELLENMEK İÇİN SIRAYA ALINDI", type: "success"
            }).then(function () {
                window.location = 'SatisiOnaylananTeklifler.aspx';
            });
        }
        function LogodaGuncellenemedi(data) {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Kayıt Logoda Güncellenemedi", type: "error"
            });
        }
        function OK() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Teklif Revizeye Gönderildi", type: "success"
            }).then(function () { window.location = 'SatisiOnaylananTeklifler.aspx' });
        }
        function NO() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Teklif Revizeye Gönderilemedi", type: "error"
            });
        }
 </script>
      <script>
          function EksikMamulKodu() {
              swal({
                  title: "DİKKAT", text: "SİPARİŞ İÇERİSİNDE MAMUL KODU GİRİLMEMİŞ KAYIT BULUNMAKTADIR", type: "warning"
              });
          }
      </script>
      <script>
          function Yazilmis() {
              swal({
                  title: "DİKKAT", text: "BU SİPARİŞ LOGOYA ZATEN YAZILMIŞ", type: "warning"
              });
          }
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
                   window.location = 'SatisiOnaylananTeklifler.aspx';
               });
           }
    </script>
         <script>
             function musterikoduhata() {
                 swal({
                     title: "İŞLEM TAMAMLANAMADI", text: "Seçtiğiniz Cariye Kod Girilemedi", type: "error"
                 }).then(function () {
                     window.location = 'SatisiOnaylananTeklifler.aspx';
                 });
             }
    </script>
    <script>
        $(function () {
            $("#btnmusterikodu").click(function () {
                $("#muskodu").show();
            });
        });
    </script>
     <script>
         function sec() {
             swal({
                 title: "DİKKAT", text: "Herhangi Bir Kayıt Seçmediniz", type: "warning"
             });
         }
    </script>
    <script>
        function LogoInsertSuccess() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Seçtiğiniz Cariye Kod Girilemedi", type: "error"
            }).then(function () {
                window.location = 'SatisiOnaylananTeklifler.aspx';
            });
        }
    </script>
    
     <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel">&nbsp;</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                    <table class="table table-bordered">
                                                   <thead>
                                                            <tr>
                                                            <th style="text-align:center">İŞ YERİ</th>
                                                            <th>
                                                                <asp:DropDownList ID="drpIsyeri" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Value="0">000,Niğtaş</asp:ListItem>
                                                                     <asp:ListItem Value="1">001,Mikrokal</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <th style="text-align:center">BÖLÜM</th>
                                                            <th>
                                                                <asp:DropDownList ID="drpBolum" runat="server" CssClass="form-control">
                                                                    <asp:ListItem Value="0">000,Merkez</asp:ListItem>
                                                                     <asp:ListItem Value="11">011,Hammadde-Ocaklar</asp:ListItem>
                                                                    <asp:ListItem Value="12">012,Hammadde-Kaba Kırma Eleme</asp:ListItem>
                                                                     <asp:ListItem Value="101">101,Kırıkkale İşletme</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <th style="text-align:center">
                                                                FABRİKA
                                                            </th>
                                                            <th>
                                                                <asp:DropDownList ID="drpFabrika" runat="server" CssClass="form-control">
                                                                     <asp:ListItem Value="00.00">000,Merkez</asp:ListItem>
                                                                     <asp:ListItem Value="00.01">001,Kırıkkale</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </th>
                                                        </tr>
                                                          <tr>
                                                            <th style="text-align:center">
                                                                AMBAR
                                                            </th>
                                                            <th>
                                                                <asp:DropDownList ID="drpAmbar" runat="server" CssClass="form-control">
                                                                     <asp:ListItem Value="00.01">001,Merkez Mamul</asp:ListItem>
                                                                     <asp:ListItem Value="00.06">006,İskenduren Depo</asp:ListItem>
                                                                     <asp:ListItem Value="00.11">011,Kırıkkale Mamul</asp:ListItem>
                                                                     <asp:ListItem Value="00.23">023,Kırıkkale Kademe Depo</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </th>
                                                        </tr>
                                                   </thead>
                                                    </table>
                                                                    <asp:Button ID="btnLogo" runat="server" Text="LOGOYA YAZ" CssClass="btn btn-success" Height="40px" OnClick="btnLogo_Click" />
                                                    <asp:Button ID="btnLogoUp" runat="server" Text="LOGODA GÜNCELLE" CssClass="btn btn-primary" Height="40px" OnClick="btnLogoUp_Click" />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
             <div class="row" style:"width:100%;">
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                          <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" KeyFieldName="TeklifNo" Theme="Moderno" CssClass="GridTemplate" >
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                          <Columns>
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" Width="20%" VisibleIndex="0">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" Width="20%" VisibleIndex="1">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MusteriIsmi" Width="50%" VisibleIndex="2">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ulke" Width="20%" VisibleIndex="3">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="KAR ORANI" Width="20%" VisibleIndex="4" ReadOnly="True" >
                                                        <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn FieldName="TTarih" Width="20%" VisibleIndex="5">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn FieldName="LOGO" ReadOnly="True" VisibleIndex="6" Width="20%" Visible="false" >
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TOPLAMTONAJ" ReadOnly="True" VisibleIndex="7" Width="20%" >
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
                 <asp:Button ID="Button2" runat="server" Text="RAPOR" CssClass="btn btn-success" OnClick="Button2_Click" Height="40px"/>
                      <asp:Button ID="Button1" runat="server" Text="REVİZEYE GÖNDER" CssClass="btn btn-secondary"  OnClick="Button1_Click" Height="40px"/>
                 <input type="button" id="btnmusterikodu" value="MÜŞTERİ KODU GİR" class="btn btn-primary" style="height:40px;"/>
                <%-- <a href="#" class="btn btn-warning" data-toggle="modal" data-target=".bs-example-modal-center" style="height:40px;">LOGO</a>--%>
                 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"></dx:ASPxGridViewExporter>
                 <div id="muskodu" style="display:none">
                     <asp:TextBox ID="txtMusteriKodu" runat="server" CssClass="form-control"></asp:TextBox>
                     <asp:Button ID="btnKaydet" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="btnKaydet_Click" Height="40px"/>
                 </div>
       </div>
        
          
              
        </div>
       
    </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT  [TeklifNo],[Temsilci],[MusteriIsmi],[Ulke],CAST((SUM([KalemSatisFiyati])-SUM([KalemMaliyeti]))/SUM([KalemMaliyeti]) as decimal(18,3)) as [KAR ORANI],TTarih,case when InsertLogo=0 then 'Yazilmamis' when InsertLogo=1 then 'Yazilmis'  end As LOGO,SUM(buUrununSiparisTonaji) as TOPLAMTONAJ FROM [Orders] where [Durum]=@durum and [TemsilciKullaniciAdi]=@temsilci  and KILIT=0 group by [TeklifNo],[Temsilci],[MusteriIsmi],[Ulke],TTarih,InsertLogo order by TTarih desc" OnSelecting="SqlDataSource1_Selecting">
     <SelectParameters>
         <asp:Parameter Name="temsilci" Type="String" />
         <asp:Parameter Name="durum" Type="String" />
        
        </SelectParameters>
        </asp:SqlDataSource>
    
    
</asp:Content>
