<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Reddedilen.aspx.cs" Inherits="ExternalTrade.Admin.Reddedilen" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
      <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;" id="sevinc">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel">Gönder</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                  <asp:DropDownList ID="drp" runat="server" CssClass="form-control">
                                                      <asp:ListItem Value="1">ONAY BEKLIYOR</asp:ListItem>
                                                       <asp:ListItem Value="2">ONAYLANDI</asp:ListItem>
                                                       <asp:ListItem Value="3">REVIZE ISTENILEN TEKLIF</asp:ListItem>
                                                       <asp:ListItem Value="4">SATISA DONDU</asp:ListItem>
                                                       <asp:ListItem Value="5">ONAY IPTALI</asp:ListItem>
                                                      
                                                  </asp:DropDownList>
                                                    <asp:Button ID="btn" runat="server" Text="GÖNDER" OnClick="btn_Click" CssClass="btn btn-success" />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
    <h1>REDDEDİLEN TEKLİFLER</h1>
     <div class="row" style:"width:100%;" id="mainDiv">
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>
                  <script>
                      function success() {
                          swal({
                              title: "İŞLEM TAMAMLANDI", text: "Kayıt Gönderildi", type: "success"
                          }).then(function () { window.location = 'Reddedilen.aspx' });
                      }
                      function error() {
                          swal({
                              title: "İŞLEM TAMAMLANAMADI", text: "Kayıt Gönderilemedi", type: "error"
                          }).then(function () { window.location = 'Reddedilen.aspx' });
                      }
                  </script>
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
                                                 <dx:GridViewDataTextColumn FieldName="Reddeden" Caption="REDDEDEN" ReadOnly="True" VisibleIndex="9" Width="60%">
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
                 <asp:Button ID="btnRapor" runat="server" Text="DETAYLAR" CssClass="btn btn-danger" OnClick="btnRapor_Click" Height="40px"/>
                 <asp:Button ID="Button1" runat="server" Text="RAPOR" CssClass="btn btn-success" OnClick="Button1_Click" Height="40px"/> 
                  <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#sevinc">GÖNDER</a>
             <div>
         
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
                            </dx:ASPxGridViewExporter>
       </div>
            <div>
                     
                 </div>
        <div>
           
        </div>
         
              
        </div>
      
    </div>

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT u.Name+' '+u.SurName as [Reddeden], o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke],CAST(SUM(o.[buUrununSiparisTonaji]) as decimal(18,3)) as [TOPLAM TONAJ],case when o.TeklifTipi='EXW' or o.TeklifTipi='FAS' or o.TeklifTipi='FCA' or o.TeklifTipi='FOB' Or o.TeklifTipi='YOK'  or  o.TeklifTipi='DAT' then CAST((SUM(o.[KalemSatisFiyati])-SUM(o.[KalemMaliyeti]))/SUM(o.[KalemMaliyeti]) as decimal(18,3)) when o.TeklifTipi='CFR' Or o.TeklifTipi='CIF' or  o.TeklifTipi='DAP' then CAST((SUM(o.[FobSatisFiyati])-SUM(o.[FobMaliyet]))/SUM(o.[FobMaliyet]) as decimal(18,3))  end AS [FOB KAR ORANI],case  when o.TeklifTipi='CFR' Or o.TeklifTipi='CIF' or  o.TeklifTipi='DAP'  then CAST((SUM(o.[KalemSatisFiyati])-SUM(o.[KalemMaliyeti]))/SUM(o.[KalemMaliyeti]) as decimal(18,3)) end AS [CFR KAR ORANI],o.TTarih,o.TeklifTipi FROM [Orders] o left outer join Users u on o.Reddeden=u.Id where o.[Durum]=@Durum group by o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke],u.Name+' '+u.SurName,o.TTarih,o.TeklifTipi order by TTarih desc" OnSelecting="SqlDataSource1_Selecting">
     <SelectParameters>
        
            <asp:Parameter Name="Durum" Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
