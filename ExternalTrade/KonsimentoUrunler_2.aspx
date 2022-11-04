<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="KonsimentoUrunler_2.aspx.cs" Inherits="ExternalTrade.KonsimentoUrunler_2" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script>
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "KAYDINI EKLENDİ", type: "success"
            }).then(function () { window.location = 'KonsimentoUrunler_2.aspx?kod=<%=Request.QueryString["kod"]%>' });
       }
       function errorAlert() {
           swal({
               title: "İŞLEM TAMAMLANAMADI", text: "KAYDINI EKLENEMEDİ", type: "error"
           });
       }
       function totalErrorAlert() {
           swal({
               title: "İŞLEM TAMAMLANAMADI", text: "Girdiğiniz Ağırlık Toplam Ağırlıktan Fazla Olamaz", type: "error"
           });
       }
       function totalErrorAlert2() {
           swal({
               title: "İŞLEM TAMAMLANAMADI", text: "Girdiğiniz Toplam Ağırlık Siparişin Toplam Ağırlığından Fazla Olamaz", type: "error"
           });
       }
    </script>
        <script>
            $(function () {

                $("input[name='chk']").click(function () {

                    if ($("#chk").is(":checked")) {
                        $("#torba").show();
                        $("#paletsayisi").hide();
                    }
                    else {
                        $("#torba").hide();
                        $("#paletsayisi").show();
                    }


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

           <div class="row" style:"width:100%;">

        <div class="col-11" style="width:100%;"><br />
            <div class="col-11" style="width:100%;">
                <div><b style="font-size:16px;">FCL NO</b></div>
               <asp:TextBox ID="txtFCL" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <br />
             <div class="col-11" style="width:100%;">
                  <div><b style="font-size:16px;">ÜRÜN SEÇİNİZ</b></div>
                  <asp:DropDownList ID="drpUrun" runat="server" CssClass="form-control select2"></asp:DropDownList>
             </div><br />
           <div class="col-11" style="width:100%;">
                  <div><b style="font-size:16px;">PALET TİPİ</b></div>
                <asp:TextBox ID="txtPaletTipi" runat="server" CssClass="form-control"></asp:TextBox>
             </div>
            <br />
           <div class="col-11" style="width:100%;" id="paletsayisi">
                  <div><b style="font-size:16px;">PALET SAYISI</b></div>
                <asp:TextBox ID="txtPaletSayisi" runat="server" CssClass="form-control"></asp:TextBox>
             </div>
               <div class="col-11" style="width:100%;">
                
                <input type="checkbox"  name="chk" id="chk" value="1" />&nbsp;<b style="font-size:16px;">PALETSİZ GÖNDERİM</b>
             </div>
            <div class="col-11" style="width:100%;display:none;" id="torba">
                <div><b style="font-size:16px;">TORBA SAYISI</b></div>
                <asp:TextBox ID="txtTorbaSayisi" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="col-11" style="width:100%;" >
                <div><b style="font-size:16px;">SİPARİŞ NO</b></div>
                <asp:TextBox ID="txtSipNo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>

    </div>
    
    <div>
        <asp:Button ID="btnKaydet" runat="server" Text="KAYDET" CssClass="btn btn-success" Height="40px" OnClick="btnKaydet_Click"  />
         <a href="KonsimentoOperation_2.aspx?kod=<%=Request.QueryString["kod"] %>" style="height:40px;" class="btn btn-primary">BİTİR</a>
    </div>

       <div class="row" style:"width:100%;">
   
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"  KeyFieldName="Id" EnableTheming="True" CssClass="GridTemplate" Theme="Moderno">
                               <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                               <SettingsText  CommandDelete="Sil"  />
                             <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                               <Columns>
                                  <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0" ShowClearFilterButton="True">
                                  </dx:GridViewCommandColumn>
                                  <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="1" Visible="false">
                                      <SettingsHeaderFilter Mode="CheckedList">
                                      </SettingsHeaderFilter>
                                      <EditFormSettings Visible="False" />
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="NAME" VisibleIndex="2" Caption="ÜRÜN">
                                      <SettingsHeaderFilter Mode="CheckedList">
                                      </SettingsHeaderFilter>
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="SPECODE" VisibleIndex="3" Caption="ÖZEL KOD">
                                      <SettingsHeaderFilter Mode="CheckedList">
                                      </SettingsHeaderFilter>
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="KonteynerdakiTonaj" VisibleIndex="4" Caption="KONTEYNERDAKİ TONAJ">
                                      <SettingsHeaderFilter Mode="CheckedList">
                                      </SettingsHeaderFilter>
                                  </dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="PaletSayisi" VisibleIndex="5" Caption="PALET SAYISI">
                                      <SettingsHeaderFilter Mode="CheckedList">
                                      </SettingsHeaderFilter>
                                  </dx:GridViewDataTextColumn>
                                  <dx:GridViewDataTextColumn FieldName="FCLNO" VisibleIndex="6" Caption="FCL NO">
                                      <SettingsHeaderFilter Mode="CheckedList">
                                      </SettingsHeaderFilter>
                                  </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="SiparisNo" VisibleIndex="7" Caption="SİPARİŞ NO">
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
          
              
        </div>
 
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select  kp.Id,kp.SPECODE,kp.SiparisNo,kp.KonteynerdakiTonaj,kp.FCLNO,mamul.NAME,kp.PaletSayisi,kp.SiparisNo  from KonsimentoProduct kp left outer join DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] mamul on kp.MamulKodu=mamul.CODE where kp.SPECODE=@kod and SiparisTipi='Çoklu'" OnSelecting="SqlDataSource1_Selecting" DeleteCommand="KonsimentoProductDelete" DeleteCommandType="StoredProcedure" >
       <SelectParameters>
           <asp:Parameter Name="kod" />
       </SelectParameters>
       <DeleteParameters>
           <asp:Parameter Name="Id" />
       </DeleteParameters>
   </asp:SqlDataSource>
</asp:Content>

