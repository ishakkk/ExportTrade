<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AllOperation.aspx.cs" Inherits="ExternalTrade.Admin.AllOperation" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <script>
         function warningAlert() {
             swal({
                 title: "DİKKAT", text: "Herhangi Bir Kayıt Seçmediniz", type: "error"
             });



         }
         function errorAlert() {
             swal({
                 title: "İŞLEM TAMAMLANAMADI", text: "DÖKÜMLER REVİZEYE GÖNDERİLEMEDİ", type: "error"
             });
         }
         function successAlert() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "DÖKÜMLER REVİZEYE GÖNDERİLDİ", type: "success"
             }).then(function () { window.location = 'AllOperation.aspx' });
         }
    </script>
    <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>

    <div  style:"width:100%;">
         <h1>OPERASYON DÖKÜMLERİ</h1>
        <div class="col-11" style:"width:100%;"><br />
              <div class="form-group row">
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll;">
                              <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="TeklifNo" Theme="Moderno" CssClass="GridTemplate"  OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                            <SettingsSearchPanel Visible="True" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" VisibleIndex="0" Caption="TEKLİF NO">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                
                                                <dx:GridViewDataTextColumn FieldName="ProformaYukleyen" VisibleIndex="1" Caption="PROFORMA<br/>YÜKLEYEN" Width="130px">

                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="CommercialInvoiceYukleyen" VisibleIndex="2" Caption="COOMERCIAL INVOICE<br/>YUKLEYEN" Width="140px">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="PackingListYukleyen" VisibleIndex="3" Caption="PACKING LIST<br/>YUKLEYEN" Width="140px">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KonsimentoYukleyen" VisibleIndex="4" Caption="KONSIMENTO<br/>YUKLEYEN" Width="140px">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="SigortaDokumuYukleyen" VisibleIndex="5" Caption="SİGORTA DOKUMU<br/>YUKLEYEN" Width="140px">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UlkeSertifikasiYukleyen" VisibleIndex="6" Caption="ÜLKE SERTİFİKASI<br/>YÜKLEYEN" Width="140px">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="DolasimBelgesiYukleyen" VisibleIndex="7" Caption="DOLAŞIM BELGESİ<br/>YÜKLEYEN" Width="140px"> 
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
         <asp:Button ID="btnRapor" runat="server" Text="DETAYLAR" CssClass="btn btn-danger"  Height="40px"/>
        
            <asp:Button ID="btn" runat="server" CssClass="btn btn-primary" Text="DÖKÜMLERİ GÖR"  Height="40px" OnClick="btn_Click"/>
        <a href="#" class="btn btn-success">REVİZE ET</a>
        <%--<asp:Button ID="btnIptal" runat="server" Text="REVIZE ET" CssClass="btn btn-success" Height="40px" OnClick="btnIptal_Click" />--%>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>
       
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select  a.TeklifNo,a.ProformaYukleyen,a.CommercialInvoiceYukleyen,a.PackingListYukleyen,a.KonsimentoYukleyen,a.SigortaDokumuYukleyen,a.UlkeSertifikasiYukleyen,a.DolasimBelgesiYukleyen from AllOperationDocuments a left outer join Orders o on a.TeklifNo=o.TeklifNo where o.AllOperationDocuments=1 and a.DolasimBelgesi=1 and a.UlkeSertifikasi =1 and a.Proforma=1 and a.CommercialInvoice=1 and a.PackingList=1 and a.Konsimento=1 group by a.TeklifNo,a.ProformaYukleyen,a.CommercialInvoiceYukleyen,a.PackingListYukleyen,a.KonsimentoYukleyen,a.SigortaDokumuYukleyen,a.UlkeSertifikasiYukleyen,a.DolasimBelgesiYukleyen">
            </asp:SqlDataSource>
</asp:Content>