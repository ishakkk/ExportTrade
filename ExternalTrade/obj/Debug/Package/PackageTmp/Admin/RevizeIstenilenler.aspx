<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="RevizeIstenilenler.aspx.cs" Inherits="ExternalTrade.Admin.RevizeIstenilenler" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script type="text/javascript">
            function reOnayAlert() {
                swal({
                    title: "İŞLEM TAMAMLANDI", text: "Teklif Onay Bekleyen Teklifler Menüsüne Gönderildi", type: "success"
                }).then(function () { window.location = "RevizeIstenilenler.aspx"; });

            }
</script>
        <script type="text/javascript">
            function reAlert() {
                swal({
                    title: "İŞLEM TAMAMLANAMADI", text: "İşlem Sırasında Hata İle Karşılaşıldı", type: "error"
                });

            }
</script>
     <script>
         function SepetSil() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "Kayıt Sistemden Silindi", type: "success"
             }).then(function () { window.location = 'RevizeIstenilenler.aspx'; });
         }
        </script>
       <script>
           function SepetSilHata() {
               swal({
                   title: "İŞLEM TAMAMLANAMADI", text: "Kayıt Sistemden Silinemedi", type: "error"
               }).then(function () { window.location = 'RevizeIstenilenler.aspx'; });
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
                 title: "İŞLEM TAMAMLANDI", text: "Teklif Onaylandı", type: "success"
             }).then(function () { window.location = "Teklifler.aspx"; });

         }
</script>
    <script type="text/javascript">
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Teklif Onaylanamadı", type: "error"
            });
        }

    </script>
           <script type="text/javascript">
               function confirmAlert() {

                   {
                       Swal.fire({
                           title: "DİKKAT",
                           text: "Bu Teklifi Silmek Üzeresiniz\nSilinsin Mi?",
                           type: "warning",
                           showCancelButton: !0,
                           confirmButtonText: "Evet,Teklifi Sil",
                           cancelButtonText: "Hayır,Teklifi Silme",
                           confirmButtonClass: "btn btn-success mt-2",
                           cancelButtonClass: "btn btn-danger ml-2 mt-2",
                           buttonsStyling: !1
                       }).then(function (t) {
                           t.value ? Swal.fire({
                               title: "İŞLEM ONAYLANDI",
                               text: "Teklif Silindi",
                               type: "success"
                           }).then(function () { window.location = 'Teklifler.aspx' }) : t.dismiss === Swal.DismissReason.cancel && Swal.fire({ title: "İŞLEM İPTAL EDİLDİ", text: "Teklif Sİlinmedi :)", type: "error" })
                       })
                   }
               }
    </script>


    <script type="text/javascript">
        function successAlert2() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Satışa Döndürüldü", type: "success"
            }).then(function () { window.location = "Teklifler.aspx"; });
        }
</script>
    <script type="text/javascript">
        function errorAlert2() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Satışa Döndürülemedi", type: "error"
            });
        }



    </script>





      <script type="text/javascript">
          function successAlert3() {
              swal({
                  title: "İŞLEM TAMAMLANDI", text: "Teklif Reddedildi", type: "success"
              }).then(function () { window.location = "Teklifler.aspx"; });
          }
</script>
    <script type="text/javascript">
        function errorAlert3() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Teklif Reddedilemedi", type: "error"
            });
        }
    </script>
        <script type="text/javascript">
            function warningAlert() {
                swal({
                    title: "DİKKAT", text: "Herhangi Bir Kayıt Seçmediniz", type: "warning"
                });
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <h1>REVİZE İSTENİLEN TEKLİFLER</h1>
    <div class="row" style:"width:100%;">
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll;">
                           <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="TeklifNo" Theme="Moderno" CssClass="GridTemplate"  OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="320" />
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
                                                       <dx:GridViewDataTextColumn FieldName="TeklifTipi" Caption="GÖNDERİM ŞEKLİ" ReadOnly="True" VisibleIndex="6" Width="50%">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="RevizeyeGonderen" Width="50%" Caption="REVİZEYE<br/> GÖNDEREN" ReadOnly="True" VisibleIndex="8">
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
                 <asp:Button ID="Button2" runat="server" Text="RAPOR AL" CssClass="btn btn-success" OnClick="Button2_Click" Height="40px"/>
                 <asp:Button ID="OnayaSun" runat="server"  Text="ONAYA SUN" CssClass="btn btn-pink" OnClick="OnayaSun_Click" Height="40px"/>
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
                            </dx:ASPxGridViewExporter>
       </div>
        </div>
       
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT u.Name+' '+u.SurName as [RevizeyeGonderen], o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke],CAST(SUM(o.[buUrununSiparisTonaji]) as decimal(18,3)) as [TOPLAM TONAJ],case when o.TeklifTipi='EXW' or o.TeklifTipi='FAS' or o.TeklifTipi='FCA' or o.TeklifTipi='FOB' Or o.TeklifTipi='YOK'  or  o.TeklifTipi='DAT' then CAST((SUM(o.[KalemSatisFiyati])-SUM(o.[KalemMaliyeti]))/SUM(o.[KalemMaliyeti]) as decimal(18,3)) when o.TeklifTipi='CFR' Or o.TeklifTipi='CIF' or  o.TeklifTipi='DAP' then CAST((SUM(o.[FobSatisFiyati])-SUM(o.[FobMaliyet]))/SUM(o.[FobMaliyet]) as decimal(18,3))  end AS [FOB KAR ORANI],case  when o.TeklifTipi='CFR' Or o.TeklifTipi='CIF' or  o.TeklifTipi='DAP'  then CAST((SUM(o.[KalemSatisFiyati])-SUM(o.[KalemMaliyeti]))/SUM(o.[KalemMaliyeti]) as decimal(18,3)) end AS [CFR KAR ORANI],o.TeklifTipi,o.TTarih,o.TeklifTipi FROM [Orders] o left outer join Users u on o.TeklifiRevizeyeGonderen=u.Id where o.[Durum]=@Durum and o.[SevkDurumu] IS NULL group by o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke],u.Name+' '+u.SurName ,[TTarih],o.TeklifTipi order by [TTarih] desc" OnSelecting="SqlDataSource1_Selecting">
   <SelectParameters>
       <asp:Parameter Name="Durum" />
      
   </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
