<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OnayBekleyenProformalar.aspx.cs" Inherits="ExternalTrade.Admin.OnayBekleyenProformalar" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script>

        function warningAlert() {
            swal({
                title: "DİKKAT", text: "Herhangi Bir Kaydı Seçmediniz", type: "warning"

            });
        }

</script>
    <script>
        function SuccessAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Proforma Onaylandı", type: "success"

            }).then(function () { window.location = "OnayBekleyenProformalar.aspx"; });
        }
</script>
   <script>
       function ErrorAlert() {
           swal({
               title: "İŞLEM TAMAMLANAMADI", text: "Proforma Onaylanamadı", type: "error"

           });
       }
</script>
       <script>
           function ErrorAlertRed() {
               swal({
                   title: "İŞLEM TAMAMLANAMADI", text: "Proforma Reddedilemedi", type: "error"

               });
           }
</script>
        <script>
            function SuccessAlertRed() {
                swal({
                    title: "İŞLEM TAMAMLANDI", text: "Proforma Reddedildi", type: "success"

                }).then(function () { window.location = "OnayBekleyenProformalar.aspx"; });
            }
</script>




      <script>
          function ErrorAlertRevize() {
              swal({
                  title: "İŞLEM TAMAMLANAMADI", text: "Proforma Revizeye Gönderilemedi", type: "error"

              });
          }
</script>
        <script>
            function SuccessAlertRevize() {
                swal({
                    title: "İŞLEM TAMAMLANDI", text: "Proforma Revizeye Gönderildi", type: "success"

                }).then(function () { window.location = "OnayBekleyenProformalar.aspx"; });
            }
</script>
        <script>
            function success() {
                swal({
                    title: "İŞLEM TAMAMLANDI", text: "Kayıt Gönderildi", type: "success"
                }).then(function () { window.location = 'OnayBekleyenProformalar.aspx' });
            }
            function error() {
                swal({
                    title: "İŞLEM TAMAMLANAMADI", text: "Kayıt Gönderilemedi", type: "error"
                }).then(function () { window.location = 'OnayBekleyenProformalar.aspx' });
            }
                  </script>
    <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>
           <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;" id="sevinc">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel">Gönder</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                  <asp:DropDownList ID="drp" runat="server" CssClass="form-control">
                                                      <asp:ListItem Value="1">ONAY BEKLEYEN PROFORMALAR</asp:ListItem>
                                                       <asp:ListItem Value="3">REVİZE İSTENİLEN PROFORMALAR</asp:ListItem>
                                                       <asp:ListItem Value="2">ONAYLANAN PROFORMALAR</asp:ListItem>
                                                      
                                                      
                                                  </asp:DropDownList>
                                                    <asp:Button ID="btn" runat="server" Text="GÖNDER"  CssClass="btn btn-success" OnClick="btn_Click" />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
     <div class="row" style:"width:100%;">
        <h1>ONAY BEKLEYEN PROFORMALAR</h1>
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row"  style="width:100%;">
                  
                      <div style="width:100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" Width="100%" DataSourceID="SqlDataSource1" KeyFieldName="TeklifNo" Theme="Material" CssClass="GridTemplate">
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
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
                                                       <dx:GridViewDataTextColumn FieldName="TeklifTipi" Caption="GÖNDERİM ŞEKLİ" ReadOnly="True" VisibleIndex="6" Width="50%">
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
                                <FocusedRow BackColor="#009933">
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
            <asp:Button ID="btnDetay" runat="server" Text="DETAY" Height="40px" CssClass="btn btn-danger" OnClick="btnDetay_Click"/>
               <asp:Button ID="btnProformaGor" runat="server" Text="PROFORMAYI GÖR" CssClass="btn btn-primary" Height="40px" OnClick="btnProformaGor_Click" />
                 <asp:Button ID="btnTeklifOnay" runat="server" Text="ONAYLA" CssClass="btn btn-success" OnClick="btnTeklifOnay_Click"  Height="40px"/>
                 <asp:Button ID="Button1" runat="server" Text="REDDET" CssClass="btn btn-dark" OnClick="Button1_Click" Height="40px"/>
         <asp:Button ID="Button2" runat="server" Text="REVİZEYE GÖNDER" CssClass="btn btn-warning" Height="40px" OnClick="Button2_Click" />
                 <%
                        if (ExternalTrade.Classes.UserData.Authority == "SuperAdmın")
                        {%>
                              <a href="#" class="btn btn-pink" data-toggle="modal" data-target="#sevinc">GÖNDER</a>
                        <%}    
                        
                     %>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select o.TeklifNo,o.Temsilci,o.Ulke,o.MusteriIsmi,o.TTarih,o.TeklifTipi,CAST((SUM(FobSatisFiyati)-SUM(FobMaliyet))/SUM(FobMaliyet) as decimal(18,3)) as [FOB KAR ORANI],CAST((SUM(KalemSatisFiyati)-SUM(KalemMaliyeti))/SUM(KalemMaliyeti) as decimal(18,3)) as [CFR KAR ORANI],SUM(buUrununSiparisTonaji) as [TOPLAM TONAJ] from Orders  o left outer join AllOperationDocuments a on o.TeklifNo=a.TeklifNo where (o.Durum='ONAYLANDI' or o.Durum='SATISA DONDU') and  o.AllOperationDocuments=0 and a.ProformaOnayi=1 group by o.TeklifNo,o.Temsilci,o.MusteriIsmi,o.Ulke,o.TTarih,o.TeklifTipi order by TTarih desc" >
     <SelectParameters>
        </SelectParameters>
        </asp:SqlDataSource>
     </div>
         </div>
</asp:Content>

