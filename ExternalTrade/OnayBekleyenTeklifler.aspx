<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OnayBekleyenTeklifler.aspx.cs" Inherits="ExternalTrade.OnayBekleyenTeklifler" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
              <script>
                  function sec() {
                      swal({
                          title: "DİKKKAT", text: "Herhangi Bir Kayıt Seçmediniz", type: "warning"
                      });
                  }
                  function OK() {
                      swal({
                          title: "İŞLEM TAMAMLANDI", text: "Teklif Revizeye Gönderildi", type: "success"
                      }).then(function () { window.location='OnayBekleyenTeklifler.aspx'});
                  }
                  function NO() {
                      swal({
                          title: "İŞLEM TAMAMLANAMADI", text: "Teklif Revizeye Gönderilemedi", type: "error"
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

           <div class="row" style:"width:100%;height:100%;">
        <div class="col-11" style="width:100%;height:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%;height:100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                          <dx:ASPxGridView ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="TeklifNo" Theme="Moderno" CssClass="GridTemplate" >
                              <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
                               <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300"  />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                              <Styles>  
             <Header HorizontalAlign="Center"></Header>  

<DetailRow Wrap="True" Font-Size="Small"></DetailRow>

<DetailCell Font-Size="X-Small"></DetailCell>

<FocusedRow BackColor="#FFCC99"></FocusedRow>

<Cell Font-Size="Small"></Cell>

<EditFormDisplayRow Font-Size="X-Small"></EditFormDisplayRow>

<EditingErrorRow Font-Size="X-Small"></EditingErrorRow>

<EditForm Wrap="True" Font-Size="X-Small"></EditForm>

<EditFormCell Font-Size="X-Small"></EditFormCell>

<EditFormTable Font-Size="X-Small"></EditFormTable>

<EditFormColumnCaption Font-Size="X-Small"></EditFormColumnCaption>
         </Styles> 
                                            <Columns>

                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" VisibleIndex="0" Width="50%" Caption="TEKLİF NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" VisibleIndex="1" Width="50%"  Caption="TEMSİLCİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="3" Width="100%" Caption="MÜŞTERİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ulke" VisibleIndex="2" Width="70%"  Caption="ÜLKE">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="TTarih" VisibleIndex="4" Width="50%" Caption="TAKLİF TARİHİ" >
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KAR ORANI" ReadOnly="True" Width="30%" VisibleIndex="6" >
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="TOPLAMTONAJ" ReadOnly="True" Caption="TOPLAM TONAJ" Width="30%" VisibleIndex="5" >
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                            </Columns><Styles>
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
           <asp:Button ID="btnRapor" runat="server" Text="DETAYLAR" CssClass="btn btn-danger" OnClick="btnRapor_Click" Height="50px"/>
                     <asp:Button ID="Button1" runat="server" Text="REVİZEYE GÖNDER" CssClass="btn btn-primary" OnClick="Button1_Click" Height="50px"/>
            <asp:Button ID="btn" runat="server" Text="RAPOR AL" CssClass="btn btn-success" OnClick="btn_Click" Height="50px"/>
                 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"></dx:ASPxGridViewExporter>
       </div>
         
       
              
        </div>
       
    </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT  [TeklifNo],[Temsilci],[MusteriIsmi],[Ulke],CAST((SUM(KalemSatisFiyati)-SUM(KalemMaliyeti))/SUM(KalemMaliyeti) as decimal(18,3)) as [KAR ORANI],TTarih,SUM(buUrununSiparisTonaji) as TOPLAMTONAJ FROM [Orders] where [Durum]=@Durum  and [TemsilciKullaniciAdi]=@temsilci and [SevkDurumu] IS NULL and [KILIT]=0 group by [TeklifNo],[Temsilci],[MusteriIsmi],[Ulke],TTarih order by TTarih desc" OnSelecting="SqlDataSource1_Selecting">
     <SelectParameters>
            <asp:Parameter Name="Durum" Type="String" />
         <asp:Parameter Name="temsilci" Type="String" />
        
        </SelectParameters>
        </asp:SqlDataSource>  
      
</asp:Content>
