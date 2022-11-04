<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="IslemBekleyenler.aspx.cs" Inherits="ExternalTrade.IslemBekleyenler" %>


<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <script>
         function successAlert() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "Kayıt Düzenlendi", type: "success"
             }).then(function () { window.location = 'IslemBekleyenler.aspx' });
         }
         function errorAlert() {
             swal({
                 title: "İŞLEM TAMAMLANAMADI", text: "Kayıt Düzenlenemedi", type: "error"
             }).then(function () { window.location = 'IslemBekleyenler.aspx' });
         }
         function successAlert() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "Kayıt Düzenlendi", type: "success"
             }).then(function () { window.location = 'IslemBekleyenler.aspx' });
         }
         function errorAlert() {
             swal({
                 title: "İŞLEM TAMAMLANAMADI", text: "Kayıt Düzenlenemedi", type: "error"
             }).then(function () { window.location = 'IslemBekleyenler.aspx' });
         }
   </script>
     <div class="row" style:"width:100%;">
        
        <div class="col-14" style="width:100%;"><br />
              <div class="form-group row">
                  BAŞLANGIÇ TARİHİ
                  <asp:TextBox ID="txtTar1" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                  <br />
                  BİTİŞ TARİHİ
                  <asp:TextBox ID="txtTar2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox><br />
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                             <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False" KeyFieldName="Id" DataSourceID="SqlDataSource1" Theme="iOS" CssClass="GridTemplate" >
                                            <SettingsPager PageSize="15">
                                            </SettingsPager>
                                            <SettingsEditing Mode="Batch">
                                            </SettingsEditing>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300"/>
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True"  AllowDragDrop="false"/>
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                          <Columns>
                                              
                                                       
                                              
                                                       
                                              
                                                 <dx:GridViewDataTextColumn FieldName="Id" VisibleIndex="1" ReadOnly="True" Visible="false">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                     </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SiparisNo" VisibleIndex="2" Caption="SİPARİŞ NO">
                                                 <SettingsHeaderFilter Mode="CheckedList">
                                                 </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                              
                                                       
                                              
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" VisibleIndex="3"  Caption="TEMSİLCİ">
                                                  
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo"  VisibleIndex="4"  Caption="TEKLİF NO">
                                                  
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                  
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="5"  Caption="MÜŞTERİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="KonteynerBulkSecimi"  VisibleIndex="6"  Caption="SEVK TİPİ">
                                                       <SettingsHeaderFilter Mode="CheckedList">
                                                       </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="TeklifTipi"  VisibleIndex="7"  Caption="GÖNDERİM ŞEKLİ">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                     </SettingsHeaderFilter>
                                                 </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ulke" VisibleIndex="8" Visible="true"  Caption="ÜLKE">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KalkisLimani" VisibleIndex="9"  Caption="KALIŞ LİMANI">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="VarisLimani" VisibleIndex="10"  Caption="VARIŞ LİMANI">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                     </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                      <dx:GridViewDataTextColumn FieldName="Urun"  Visible="true" VisibleIndex="11"  Caption="ÜRÜN">
                                                          <SettingsHeaderFilter Mode="CheckedList">
                                                          </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 
                                                 <dx:GridViewDataTextColumn FieldName="buUrununSiparisTonaji" VisibleIndex="12"  Caption="BU ÜRÜNÜN<br/>SİPARİŞ TONAJI">
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                     </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="Vade" VisibleIndex="13"  Caption="VADE"> 
                                                     <SettingsHeaderFilter Mode="CheckedList">
                                                     </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                  <dx:GridViewDataTextColumn FieldName="NavlunTON" VisibleIndex="14"  Caption="NAVLUN"> 
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
                                <FocusedRow BackColor="#0066ff">
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
     <div class="btn-group">
         <asp:Button ID="Button1" runat="server" Text="ÇEK" CssClass="btn btn-danger" Height="40px" OnClick="Button1_Click" />
     </div>
             <div class="btn-group">
 
           <asp:Button ID="btnRapor" runat="server" Text="GÖNDER" CssClass="btn btn-success"  Height="40px" OnClick="btnRapor_Click"/>


                  
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
                            </dx:ASPxGridViewExporter>
       </div>
        <div class="btn-group">
             <asp:Button ID="Button2" runat="server" Text="HEPSİNİ GÖNDER" CssClass="btn btn-warning"  Height="40px" OnClick="Button2_Click"/>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select Id,
     SiparisNo,Temsilci,TeklifNo,TeklifTipi,KonteynerBulkSecimi,MusteriIsmi,Kita,Ulke,KalkisLimani,VarisLimani,Urun,
	 buUrununSiparisTonaji,Vade,NavlunTON
   from EditOrders 
  
  where MusteriKodu not in (select MusteriKodu from DepartmentCustomers) and Active=0 and TemsilciKullaniciAdi=@temsilci
group by 

     
         SiparisNo,Temsilci,TeklifNo,MusteriIsmi,Kita,Ulke,KalkisLimani,VarisLimani,Urun,TeklifTipi,KonteynerBulkSecimi,
	 buUrununSiparisTonaji,NavlunTON,Vade,Id" UpdateCommand="OperationRealite" UpdateCommandType="StoredProcedure" OnSelecting="SqlDataSource1_Selecting1">
                 <SelectParameters>
                     <asp:Parameter Name="temsilci" />
                 </SelectParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="Id" />
                     <asp:Parameter Name="NavlunTON" />
                     <asp:Parameter Name="TeklifNo"  />
                     <asp:Parameter Name="Vade"  />
                     <asp:Parameter Name="KonteynerBulkSecimi"  />
                 </UpdateParameters>
             </asp:SqlDataSource>
        </div>
          
              
        </div>
       
    </div>

    
    
</asp:Content>
