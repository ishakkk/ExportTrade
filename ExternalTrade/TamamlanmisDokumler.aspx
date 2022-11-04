<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="TamamlanmisDokumler.aspx.cs" Inherits="ExternalTrade.TamamlanmisDokumler" %>
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
    </script>
    <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>

            <!-- /.modal -->
    
      <div class="row" style:"width:100%;">
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                          <dx:ASPxGridView ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" Theme="Moderno" CssClass="GridTemplate"  DataSourceID="SqlDataSource1" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" KeyFieldName="TeklifNo">
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="400" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                            <Columns>
                                                 <dx:GridViewDataTextColumn FieldName="BOOKINGNUMBER" VisibleIndex="0" Caption="BOOKING NO" Width="100%">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                     <dx:GridViewDataTextColumn FieldName="SiparisNo" VisibleIndex="1" Caption="SİPARİŞ NO" Width="100%">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="2" Caption="MÜŞTERİ" Width="100%">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" VisibleIndex="3" Caption="TEKLİF NO" Width="100%">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                
                                                <dx:GridViewDataCheckColumn FieldName="SigortaDokumu" VisibleIndex="4" Caption="SİGORTA DÖKÜMÜ" Width="100%">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn FieldName="UlkeSertifikasi" VisibleIndex="5" Caption="ÜLKE SERTİFİKASI" Width="100%">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn FieldName="DolasimBelgesi" VisibleIndex="6" Width="100%" Caption="DOLAŞIM BELGESİ">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn FieldName="Proforma" VisibleIndex="7" Width="100%" Caption="PROFORMA">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn FieldName="CommercialInvoice" VisibleIndex="8" Width="100%" Caption="COMMERCIAL INVIOCE">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn FieldName="PackingList" VisibleIndex="9" Width="100%" Caption="PACKING LIST">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
                                                <dx:GridViewDataCheckColumn FieldName="Konsimento" VisibleIndex="10" Width="100%" Caption="KONŞİMENTO">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataCheckColumn>
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

           <%--<asp:Button ID="btnRapor" runat="server" Text="DETAYLAR" CssClass="btn btn-danger"  Height="40px"/>--%>
        
            
                 <asp:Button ID="btn" runat="server" CssClass="btn btn-primary" Text="DÖKÜMLERİ GÖR"  Height="40px" OnClick="btn_Click"/>
                 
                 
       </div>             
        </div>
       
    </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select a.BOOKINGNUMBER,o.SiparisNo,o.MusteriIsmi,  a.TeklifNo,a.SigortaDokumu,a.UlkeSertifikasi,a.DolasimBelgesi,a.Proforma,a.CommercialInvoice,a.PackingList,a.Konsimento from AllOperationDocuments a left outer join Orders o on a.TeklifNo=o.TeklifNo where o.AllOperationDocuments=1 and a.DolasimBelgesi=1 and a.UlkeSertifikasi =1 and a.Proforma=1 and a.CommercialInvoice=1 and a.PackingList=1 and a.Konsimento=1 group by a.TeklifNo,a.SigortaDokumu,a.UlkeSertifikasi,a.DolasimBelgesi,a.Proforma,a.CommercialInvoice,a.PackingList,a.Konsimento,a.BOOKINGNUMBER,o.SiparisNo,o.MusteriIsmi">
     <SelectParameters>
        
         
         </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
