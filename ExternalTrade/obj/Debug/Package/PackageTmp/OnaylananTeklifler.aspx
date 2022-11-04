<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OnaylananTeklifler.aspx.cs" Inherits="ExternalTrade.OnaylananTeklifler" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <link href="StyleSheet.css" rel="stylesheet" />
   <script>
       $(function () {

           $('#sirket').change(function () {
               if ($('#sirket').val() == 'NİĞTAŞ ANONİM ŞİRKETİ' || $('#sirket').val() == 'MİKROKAL ANONİM ŞİRKETİ' || $('#sirket').val() == 'ASKAL LTD.ŞTİ.') {
                   $('#dil').show();
               }
               else {
                   $("#chkinfo").hide();
                   $("#chktds").hide();
                   $("#chkmsds").hide();
                   $("#parabirimi").hide();
                   $("#chkfobvisible").hide();
                   $('#dil').hide();
               }
           });

       });
    </script>
   
     <script>
         $(function () {

             $('#dilsecenegi').change(function () {
                 if ($('#dilsecenegi').val() == 'EN' || $('#dilsecenegi').val() == 'FR' || $('#dilsecenegi').val() == 'RU') {
                     $("#parabirimi").show();
                 } else {
                     $("#chkinfo").hide();
                     $("#chktds").hide();
                     $("#chkmsds").hide();
                     $("#parabirimi").hide();
                     $("#chkfobvisible").hide();
                 }
             });

         });
    </script>
    <script>
        $(function () {

            $('#pbirim').change(function () {
                if ($('#pbirim').val() == '$' || $('#pbirim').val() == '€' || $('#pbirim').val() == 'TL') {
                    $("#chkinfo").show();
                    $("#chktds").show();
                    $("#chkmsds").show();
                    $("#chkfobvisible").show();
                } else {
                    $("#chkinfo").hide();
                    $("#chktds").hide();
                    $("#chkmsds").hide();
                    $("#chkfobvisible").hide();
                }
            });

        });
    </script>
    <script>
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Teklifiniz Satış Onayına Gönderildi", type: "success"
            }).then(function () { window.location = "OnaylananTeklifler.aspx" });




        }
        function OK() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Teklif Revizeye Gönderildi", type: "success"
            }).then(function () { window.location = 'OnaylananTeklifler.aspx' });
        }
        function NO() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Teklif Revizeye Gönderilemedi", type: "error"
            });
        }
</script>
  
<script>
    function errorAlert() {
        swal({
            title: "İŞLEM TAMAMLANAMADI", text: "Teklifiniz Satış Onayına Gönderilemedi", type: "error"
        }).then(function () { window.location = "OnaylananTeklifler.aspx" });
    }
</script>
              <script>
                  function sec() {
                      swal({
                          title: "DİKKAT", text: "Herhangi Bir Kayıt Seçmediniz", type: "warning"
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

    <asp:ScriptManager ID="sm" runat="server" />
  
      <div class="row" style:"width:100%;">
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                          <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="TeklifNo" Width="100%" Theme="Moderno" CssClass="GridTemplate" >
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300" />
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
                                                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0">
                                                </dx:GridViewCommandColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" VisibleIndex="1" Width="50%" Caption="TEKLİF NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" VisibleIndex="2" Width="50%"  Caption="TEMSİLCİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="4" Width="100%" Caption="MÜŞTERİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ulke" VisibleIndex="3" Width="70%"  Caption="ÜLKE">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="TTarih" VisibleIndex="5" Width="50%" Caption="TAKLİF TARİHİ" >
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KAR ORANI" ReadOnly="True" Width="30%" VisibleIndex="7" >
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                               <dx:GridViewDataTextColumn FieldName="TOPLAMTONAJ" ReadOnly="True" Width="30%" VisibleIndex="6" >
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
           <asp:Button ID="Button1" runat="server" Text="SATIŞ ONAYI GÖNDER" CssClass="btn btn-success" OnClick="Button1_Click" Height="40px"/>
                    <asp:Button ID="Button6" runat="server" Text="REVİZEYE GÖNDER" CssClass="btn btn-secondary" OnClick="Button6_Click" Height="40px"/>
           <asp:Button ID="btn" runat="server" Text="RAPOR" CssClass="btn btn-primary" OnClick="btn_Click" Height="40px"/>
                 <asp:Button ID="btnTeklifFormuOlustur" runat="server" Text="TEKLİF FORMU OLUŞTUR" CssClass="btn btn-warning" OnClick="btnTeklifFormuOlustur_Click" Height="40px"/>
          <%--  <a href="#" data-toggle="modal" data-target="#exampleModalScrollable" class="btn btn-warning" style="height:40px">TEKLİF FORMU OLUŞTUR</a>--%>
                 
       </div>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"></dx:ASPxGridViewExporter>
            <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlHider" runat="server" CssClass="hider" Visible="false">
               
            </asp:Panel>
            <asp:Panel ID="pnlKayitEkle" runat="server" Visible="false" CssClass="popupbox" DefaultButton="btnEkle" Height="220px">
                  
                <div class="card" style="width: 100%; overflow-x: scroll; overflow-y: scroll;">
                                    <div class="card-body p-4">
                                     
                                          <div class="form-group mb-3">
                                              <div>
                                                  ŞİRKET
                                                  <select id="sirket" class="form-control" name="sirket">
                                                       <option>--------</option>
                                                      <%
                                                          string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
                                                          SqlConnection con = new SqlConnection(strcon);
                                                          con.Open();
                                                          SqlCommand sirketcek = new SqlCommand("select *from Companies",con);
                                                          SqlDataReader sirketoku = sirketcek.ExecuteReader();
                                                          while(sirketoku.Read())
                                                          {%>
                                                              <option value="<%=sirketoku["CompanyName"].ToString() %>"><%=sirketoku["CompanyName"].ToString() %></option>
                                                          <%}   
                                                      %>
                                                     
                                                  </select>
                                              </div>
                                              <div style="display:none" id="dil">
                                                   DİL SEÇENEĞİ
                                                 
                                                    <select id="dilsecenegi" class="form-control" name="dilsecenegi">
                                                <option>--------</option>
                                                  <option>EN</option>
                                                  <option>FR</option>
                                                  <option>RU</option>
                                              </select><br />
                                              </div>
                                           
                                              <div style="display:none" id="parabirimi"> Para Birimi <select  class="form-control" name="parabirimi" id="pbirim">
                                                 <option>--------</option>
                                                 <option value="$">$</option>
                                                 <option value="€">€</option>
                                                 <option value="TL">TL</option>
                                              </select><br /></div>
                                            
                                                <b id="chkinfo" style="color:black;display:none">
                                                    <asp:CheckBox ID="checkInfo" runat="server" Text="Info"/></b>
                                                     
                                                           <b id="chktds" style="color:black;display:none"><asp:CheckBox ID="checkTDS" runat="server" Text="TDS"/></b>  
                                                     
                                                           <b id="chkmsds" style="color:black;display:none"><asp:CheckBox ID="checkMSDS" runat="server" Text="MSDS"/></b>  

                                                      <b id="chkfobvisible" style="color:black;display:none"><asp:CheckBox ID="checkFobVisible" runat="server" Text="FOB PRICE"/></b>  
                                          </div>
                                          
                                      
                                        <div class="form-group mb-0 text-center">
                                            <asp:Button ID="btnEkle" runat="server" Text="DEVAM ET" CssClass="btn btn-primary btn-block" OnClick="btnEkle_Click"/>

                                        </div>
                                         <div class="form-group mb-0 text-center">
                                            <asp:Button ID="btnKapat" runat="server" Text="VAZGEÇ" CssClass="btn btn-danger btn-block" OnClick="lbModalPopupKapat_Click"/>

                                        </div>
                                    </div>
                              

                            <!-- end card-body -->
                        </div>
       
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
     <asp:UpdatePanel ID="up2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlHider2" runat="server" CssClass="hider" Visible="false">
            </asp:Panel>
            <asp:Panel ID="pnlKayitEkle2" runat="server" Visible="false" CssClass="popupbox" DefaultButton="btnEkle">
                   <div class="card" style="width: 100%; overflow-x: scroll; overflow-y: scroll;">
                                    <div class="card-body p-3">
                                          <div class="form-group mb-3">
                                           <asp:Label ID="lblcontactperson" runat="server" Text="CONTACT PERSON"></asp:Label>
                                          </div>
                                       <div class="form-group mb-3">
                                           <asp:TextBox ID="txtcontactperson" runat="server" CssClass="form-control"></asp:TextBox>
                                          </div>
                                        <div class="form-group mb-3">
                                           <asp:Label ID="lblcontactemail" runat="server" Text="CONTACT E-MAİL"></asp:Label>
                                          </div>
                                       <div class="form-group mb-3">
                                           <asp:TextBox ID="txtcontactemail" runat="server" CssClass="form-control"></asp:TextBox>
                                          </div>
                                          <div class="form-group mb-3">
                                           <asp:Label ID="lblphonenumber" runat="server" Text="PHONE NUMBER"></asp:Label>
                                          </div>
                                       <div class="form-group mb-3">
                                           <asp:TextBox ID="txtphonenumber" runat="server" CssClass="form-control"></asp:TextBox>
                                          </div>
                                        <div class="form-group mb-0 text-center">
                                            <asp:Button ID="Button2" runat="server" Text="DEVAM ET" CssClass="btn btn-primary btn-block" OnClick="btnEkle2_Click" Height="40px"/>

                                        </div>
                                         <div class="form-group mb-0 text-center">
                                            
                                            <asp:Button ID="Button3" runat="server" Text="GERİ" CssClass="btn btn-danger btn-block" OnClick="lbModalPopupKapat2_Click" Height="40px"/>

                                        </div>
                                    </div>
                              

                            <!-- end card-body -->
                        </div>
       
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>




    <asp:UpdatePanel ID="up3" runat="server">
        <ContentTemplate>
            <asp:Panel ID="pnlHider3" runat="server" CssClass="hider" Visible="false">
            </asp:Panel>
            <asp:Panel ID="pnlKayitEkle3" runat="server" Visible="false" CssClass="popupbox">
                   <div class="card" style="width: 100%; overflow-x: scroll; overflow-y: scroll;">
                                    <div class="card-body p-3" style="margin-top:30px;">
                                     
                                     <div>
                                         <asp:Label ID="lblCustomClerance" runat="server" Text="CUSTOM CLERANCE"></asp:Label>
                                     </div>
                                    <div>
                                         <asp:TextBox ID="txtCustomClerance" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                        <div>
                                         <asp:Label ID="ltlPayment" runat="server" Text="PAYMENT TERMS"></asp:Label>
                                     </div>
                                    <div>
                                        <asp:DropDownList ID="drpPayment" runat="server" CssClass="form-control select2">
                                           
                                        </asp:DropDownList>
                                      <%--  <asp:TextBox ID="txtPaymentTers" runat="server" CssClass="form-control"></asp:TextBox>--%>
                                    </div>
                                        
                                  
                                         <div>
                                              <asp:Label ID="Label1" runat="server" Text="EXPLANATION"></asp:Label>
                                         </div>
                                        <div>
                                            <asp:TextBox ID="txtaciklama" runat="server" CssClass="form-control" TextMode="MultiLine" Height="150px"></asp:TextBox>
                                        </div>
                                        <div class="form-group mb-0 text-center">
                                            <asp:Button ID="Button4" runat="server" Text="FORM OLUŞTUR" CssClass="btn btn-primary btn-block" OnClick="FormOlustur"/>

                                        </div>
                                         <div class="form-group mb-0 text-center">

                                            <asp:Button ID="Button5" runat="server" Text="GERİ" CssClass="btn btn-danger btn-block" OnClick="lbModalPopupKapat3_Click"/>

                                        </div>
                                    </div>
                              

                           
                        </div>
       
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
              
        </div>
       
    </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT DISTINCT  [TeklifNo],[Temsilci],[MusteriIsmi],[Ulke],CAST((SUM(KalemSatisFiyati)-SUM(KalemMaliyeti))/SUM(KalemMaliyeti) as decimal(18,3)) as [KAR ORANI],TTarih,SUM(buUrununSiparisTonaji) as TOPLAMTONAJ FROM [Orders] where [Durum]=@Durum and [TemsilciKullaniciAdi]=@temsilci and [SevkDurumu] IS NULL and [KILIT]=0 group by [TeklifNo],[Temsilci],[MusteriIsmi],[Ulke],TTarih order by TTarih desc" OnSelecting="SqlDataSource1_Selecting">
     <SelectParameters>
         <asp:Parameter Name="Durum" Type="String" />
         <asp:Parameter Name="temsilci" Type="String" />
         
         </SelectParameters>
        </asp:SqlDataSource>
  
</asp:Content>
