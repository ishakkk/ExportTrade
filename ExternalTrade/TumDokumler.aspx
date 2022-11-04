<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="TumDokumler.aspx.cs" Inherits="ExternalTrade.TumDokumler" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <script>
         function sec() {
             swal({
                 title: "DİKKAT", text: "Herhangi Bir Kayıt Seçmediniz", type: "warning"
             });


         }
         function belgeler() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "Belgeler Sisteme Yüklendi", type: "success"
             }).then(function () { window.location = 'TumDokumler.aspx' });
         }
         function hata() {
             swal({
                 title: "İŞLEM TAMAMLANAMADI", text: "Belgeler Sisteme Yüklenemedi", type: "error"
             });
         }
         function fatura() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "Fatura Bilgisi Güncellendi", type: "success"
             })
         }
         function faturaerror() {
             swal({
                 title: "İŞLEM TAMAMLANAMADI", text: "Fatura Bilgisi Güncellenemedi", type: "error"
             })
         }
    </script>
    <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>

            <!-- /.modal -->
    <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog"
                                        aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="exampleModalScrollableTitle">DÖKÜMAN YÜKLE</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="height:40px;">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <div>
                                                          <asp:FileUpload ID="fl" runat="server" CssClass="form-control" />
                                                    </div>
                                                  <%--  <div>
                                                       <b> PROFORMA</b>
                                                    </div>
                                                   <div>
                                                       <asp:FileUpload ID="flProforma" runat="server" CssClass="form-control" />
                                                   </div>
                                                    <br />
                                                     <div>
                                                      <b> COMMERCIAL INVOICE</b>
                                                    </div>
                                                   <div>
                                                       <asp:FileUpload ID="flCommercial" runat="server" CssClass="form-control" />
                                                   </div>
                                                     <br />
                                                     <div>
                                                      <b> PACKING LIST</b>
                                                    </div>
                                                   <div>
                                                       <asp:FileUpload ID="flPacking" runat="server" CssClass="form-control" />
                                                   </div>
                                                      <br />
                                                     <div>
                                                      <b>KONŞİMENTO</b>
                                                    </div>
                                                   <div>
                                                       <asp:FileUpload ID="flKonsimento" runat="server" CssClass="form-control" />
                                                   </div>
                                                       <br />
                                                     <div>
                                                      <b>SİGORTA DÖKÜMÜ</b>
                                                    </div>
                                                   <div>
                                                       <asp:FileUpload ID="flSigorta" runat="server" CssClass="form-control" />
                                                   </div>
                                                       <br />
                                                     <div>
                                                      <b>ÜLKE SERTİFİKASI</b>
                                                    </div>
                                                   <div>
                                                       <asp:FileUpload ID="flUlkeSertifikasi" runat="server" CssClass="form-control" />
                                                   </div>
                                                       <br />
                                                     <div>
                                                      <b>DOLAŞIM BELGESİ</b>
                                                    </div>
                                                   <div>
                                                       <asp:FileUpload ID="flDolasimBelgesi" runat="server" CssClass="form-control" />
                                                   </div>--%>

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal" style="height:40px;">KAPAT</button>
                                               
                                                    <asp:Button ID="btnKaydet" Text="KAYDET" runat="server" CssClass="btn btn-primary" Height="40px" OnClick="btnKaydet_Click"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>



  <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" id="mdl" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel">FATURA NO</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                    <div>
                                                        FATURA NO
                                                          <asp:TextBox ID="txtFaturaNo" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <br />
                                                 <div>
                                                     FATURA TARİHİ
                                                       <asp:TextBox ID="txtFaturaTarihi" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                                 </div>
                                                </div>
                                                <asp:Button ID="btnFaturaNo" runat="server" CssClass="btn btn-warning" Text="KAYDET" OnClick="btnFaturaNo_Click" />
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
        <div class="modal fade bs-example-modal-center" id="mdlbank" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel2">&nbsp;</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                  DÖKÜMANLAR
                                                    <div>
                                                    <asp:DropDownList ID="drp" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="1">PROFORMA</asp:ListItem>
                                                          <asp:ListItem Value="2">COMMERCIAL INVOICE</asp:ListItem>
                                                          <asp:ListItem Value="3">PACKING LIST</asp:ListItem>
                                                          <asp:ListItem Value="4">KONSİMENTO TALİMATI</asp:ListItem>
                                                    </asp:DropDownList>
                                                  
                                                    </div>
                                                    <div>
                                                        <asp:Button ID="Button9" runat="server" CssClass="btn btn-primary" Text="GİT" Height="40px" OnClick="Button9_Click"  />
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
         
      <div class="row" style:"width:100%;">
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                          <dx:ASPxGridView ID="ASPxGridView1" runat="server"  AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="TeklifNo" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" Theme="Moderno" CssClass="GridTemplate" Width="100%">
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="500" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="SiparisNo" Caption="Sipariş<br/>No" VisibleIndex="0" Width="100%" >
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="BOOKINGNUMBER" Caption="Booking" VisibleIndex="1" Width="100%">
                                                       <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataDateColumn FieldName="STUFFING DATE" Caption="Yükleme<br/>Tarihi" Width="100%" VisibleIndex="2">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataDateColumn>
                                                 <dx:GridViewDataTextColumn FieldName="MusteriIsmi" Caption="Müşteri" VisibleIndex="3" Width="100%">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataCheckColumn FieldName="SigortaDokumu" Caption="Sigorta<br/>Dökümü" VisibleIndex="4" Width="100%" >
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn FieldName="UlkeSertifikasi" Caption="Ülke<br/>Sertifikası" VisibleIndex="5" Width="100%" >
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn FieldName="DolasimBelgesi" Caption="Dolaşım<br/>Belgesi" VisibleIndex="6" Width="100%">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn FieldName="Proforma" VisibleIndex="7" Width="100%">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn FieldName="CommercialInvoice" Caption="Commercial<br/>Invoice" VisibleIndex="8" Width="100%">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn FieldName="PackingList" Caption="Packing List" VisibleIndex="9" Width="100%">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn FieldName="Konsimento" Caption="Konşimento<br/>Talimatı" VisibleIndex="10" Width="100%">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TeklifNo" Caption="Teklif No" VisibleIndex="11" Width="100%">
                                                      <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="FATURA NO" Caption="Fatura No" VisibleIndex="12" Width="100%">
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

<%--           <asp:Button ID="btnRapor" runat="server" Text="DETAYLAR" CssClass="btn btn-danger"  Height="40px"/>--%>
        
            
            <%--     <asp:Button ID="btn" runat="server" CssClass="btn btn-primary" Text="DÖKÜMLERİ GÖR"  Height="40px" OnClick="btn_Click"/>--%>
                 <a href="#"  data-toggle="modal" data-target="#mdl" class="btn btn-primary" style="height:40px;">FATURA NUMARASI GİR</a>
                 <a href="#" data-toggle="modal" data-target="#exampleModalScrollable" class="btn btn-success" style="height:40px;">DÖKÜMAN YÜKLE</a>
                   <a href="#" data-toggle="modal" data-target="#mdlbank" class="btn btn-warning" style="height:40px;">REVİZE ET</a>
                 
       </div>             
        </div>
       
    </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select distinct o.SiparisNo, a.BOOKINGNUMBER,xy.[STUFFING DATE],o.MusteriIsmi, a.SigortaDokumu,a.UlkeSertifikasi,a.DolasimBelgesi,a.Proforma,a.CommercialInvoice,a.PackingList,a.Konsimento,a.TeklifNo,a.OperationInvoice as [FATURA NO] from AllOperationDocuments a left outer join Orders o on a.TeklifNo=o.TeklifNo left outer join DTBSSRVR.TIGERDB.dbo.Z_YUKLEMEX xy on o.SiparisNo=xy.[ORDER NO] where o.AllOperationDocuments=1 and (a.DolasimBelgesi=0 or a.UlkeSertifikasi =0 or a.Proforma=0 or a.CommercialInvoice=0 or a.PackingList=0 or a.Konsimento=0)">
            </asp:SqlDataSource>
</asp:Content>
