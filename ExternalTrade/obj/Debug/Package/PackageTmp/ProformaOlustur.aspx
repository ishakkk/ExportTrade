<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ProformaOlustur.aspx.cs" Inherits="ExternalTrade.ProformaOlustur" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
         <script>
             function sec() {
                 swal({
                     title: "DİKKAT", text: "Herhangi Bir Kayıt Seçmediniz", type: "warning"
                 });
             }
             function successAlert() {
                 swal({
                     title: "İŞLEM TAMAMLANDI", text: "PROFORMA SİSTEME YÜKLENDİ", type: "success"
                 }).then(function () { window.location = 'ProformaOlutsur.aspx' });
             }
             function errorAlert() {
                 swal({
                     title: "İŞLEM TAMAMLANAMADI", text: "PROFORMA SİSTEME YÜKLENEMEDİ", type: "error"
                 }).then(function () { window.location = 'ProformaOlutsur.aspx' });
             }
    </script>
    <script>
        $(function () {
            $('#banka').change(function () {
                if ($('#banka').val() != '---') {
                    $('#company').show();
                }
                else {
                    $('#company').hide();
                }
            });

        });
    </script>
    <script>
        $(function () {
            $('#company').change(function () {
                if ($('#company').val() != '---') {
                    $('#parabirimi').show();
                }
                else {
                    $('#parabirimi').hide();
                }
            });

        });
    </script>
       <script>
           $(function () {
               $('#parabirimi').change(function () {
                   if ($('#parabirimi').val() != '---') {
                       $('#fobvisible').show();
                   }
                   else {
                       $('#fobvisible').hide();
                   }
               });

           });
    </script>
    <script>

    </script>
      <script>
          $(function () {
              $('#fobvisible').change(function () {
                  if ($('#fobvisible').val() != '---') {
                      $('#payment').show();
                  }
                  else {
                      $('#payment').hide();
                  }
              });

          });
    </script>
    <script>
        $(function () {
            $('#payment').change(function () {
                if ($('#payment').val() != '---') {
                    $('#po').show();
                }
                else {
                    $('#po').hide();
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

        <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel"  aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel">&nbsp;</h4>
                                                        
                                                    <div>
                                                    
                                                    </div>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                   <div class="card">
                                    <div class="card-body p-4">
                                     
                                          <div class="form-group mb-3">                                         
                                           <div id="special">
                                                 <div>BANK INFORMATION</div>
                                               <div>
                                                   <select class="form-control select2" name="bank" id="banka">
                                                       <option>---</option>
                                                       <%
                                                          
                                                           string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
                                                           SqlConnection con = new SqlConnection(strcon);
                                                           con.Open();
                                                           SqlCommand cmd = new SqlCommand("select b.Id,b.BankName,c.CompanyName,b.CİNSİ   from Banks b inner join Companies c on b.sirket=c.Id order by b.BankName desc", con);
                                                           SqlDataReader dr = cmd.ExecuteReader();
                                                           while (dr.Read())
                                                           {%>
                                                               <option value="<%=dr["Id"].ToString() %>" ><%=dr["BankName"].ToString() %>(<%=dr["CompanyName"].ToString()+"  "+dr["CİNSİ"].ToString() %>)</option>
                                                           <%}
                                                           dr.Close();
                                                           con.Close();
                                                           
                                                        %>
                                                   </select>
                                               </div>
                                               <div id="company" style="display:none">
                                                   <div>COMPANY</div>
                                                   <select class="form-control" name="sirket">
                                                       <option>---</option>
                                                       <%
                                                           using (SqlConnection con2 = new SqlConnection(strcon))
                                                           {
                                                               con.Open();
                                                               SqlCommand cmd2 = new SqlCommand("select Id,CompanyName from Companies", con2);
                                                               SqlDataAdapter da = new SqlDataAdapter();
                                                               da.SelectCommand = cmd2;
                                                               DataTable dt = new DataTable();
                                                               da.Fill(dt);
                                                               foreach (DataRow row in dt.Rows)
                                                               {%>
                                                                    <option value="<%=row["CompanyName"].ToString() %>"><%=row["CompanyName"].ToString() %></option>   
                                                               <%}
                                                               con.Close();
                                                           }
                                                       %>
                                                   </select>
                                               </div>
                                              
                                           <div id="parabirimi" style="display:none">
                                               <div>CURRENCY</div>
                                               <div>
                                                   <select class="form-control" name="para">
                                                       <option>---</option>
                                                       <option value="$">$</option>
                                                       <option value="€">€</option>
                                                       <option value="TL">TL</option>
                                                   </select>
                                               </div>
                                           </div>
                                               <div id="fobvisible" style="display:none">
                                                   <div>FOB VISIBLE</div>
                                                   <div>
                                                         <select class="form-control" name="fob">
                                                       <option>---</option>
                                                       <option value="true">TRUE</option>
                                                       <option value="false">FALSE</option>
                                                   </select>
                                                   </div>
                                               </div>
                                               <div>
                                                   <div id="payment" style="display:none">
                                                       PAYMENT
                                                   <asp:DropDownList ID="drpPayment" runat="server" CssClass="from-control select2"></asp:DropDownList>
                                          
                                               </div>
                                               </div>
                                               
                                                <div id="po" style="display:none">
                                                 <div>
                                                    P.O#
                                              </div>
                                             <div>
                                                 <asp:TextBox ID="txtPO" runat="server" Width="400px" TextMode="MultiLine"></asp:TextBox>
                                             </div>
                                                    CONTACT PERSON
                                                    <div>
                                                        <asp:TextBox ID="txtContactPerson" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                               </div>
                                           </div>
                                          </div>

                                        <div class="form-group mb-0 text-center" id="devamet" style="display:none">
                                            
                                           <%-- <asp:Button ID="Button1" runat="server" Text="DEVAM ET" CssClass="btn btn-primary btn-block" OnClick="btnEkle_Click"/>--%>
                                        </div>
                                         <div class="form-group mb-0 text-center">
                                             <asp:Button ID="btn1" runat="server"  CssClass="btn btn-success" Text="KAYDET" Height="40px" OnClick="btn1_Click"/>
                                           <%-- <asp:Button ID="Button2" runat="server" Text="VAZGEÇ" CssClass="btn btn-danger btn-block" OnClick="btnKapat_Click"/>--%>

                                        </div>
                                    </div>
                              

                            <!-- end card-body -->
                        </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
   
        
             <div class="row" style:"width:100%;">

        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                          <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="TeklifNo" Width="100%" Theme="Material" CssClass="GridTemplate" >
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" VerticalScrollableHeight="300" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
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
                                                   <dx:GridViewDataTextColumn FieldName="TTarih" VisibleIndex="4" Width="50%" Caption="TEKLİF TARİHİ" >
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KAR ORANI" ReadOnly="True" Width="30%" VisibleIndex="6" >
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TOPLAMTONAJ" ReadOnly="True" Width="30%" VisibleIndex="5" Caption="TOPLAM TONAJ" >
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
             <div>
           <asp:Button ID="btnRapor" runat="server" Text="DETAYLAR" CssClass="btn btn-danger"  Height="40px" OnClick="btnRapor_Click"/>
                 
                 <%--<asp:Button ID="btnProforma" runat="server" Height="40px" Text="PROFORMA OLUŞTUR" CssClass="btn btn-warning" OnClick="btnProforma_Click" />--%>
                 <a href="#" class="btn btn-warning" style="height:40px;" data-toggle="modal" data-target=".bs-example-modal-center">PROFORMA OLUŞTUR</a>
                 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"></dx:ASPxGridViewExporter>
 
                 <div id="muskodu" style="display:none">
                     <asp:TextBox ID="txtMusteriKodu" runat="server" CssClass="form-control"></asp:TextBox>
                     <asp:Button ID="btnKaydet" runat="server" Text="KAYDET" CssClass="btn btn-primary" Height="40px"/>
                 </div>
       </div>
        </div>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select o.TeklifNo,o.Temsilci,o.Ulke,o.MusteriIsmi,o.TTarih,CAST((SUM([KalemSatisFiyati])-SUM([KalemMaliyeti]))/SUM([KalemMaliyeti]) as decimal(18,3)) as [KAR ORANI],SUM(buUrununSiparisTonaji) as TOPLAMTONAJ  from Orders  o left outer join AllOperationDocuments a on o.TeklifNo=a.TeklifNo where (o.Durum='ONAYLANDI' or o.Durum='SATISA DONDU') and o.TemsilciKullaniciAdi=@temsilci and o.AllOperationDocuments=0 and a.ProformaOnayi=0 group by o.TeklifNo,o.Temsilci,o.MusteriIsmi,o.Ulke,o.TTarih order by TTarih desc" OnSelecting="SqlDataSource1_Selecting">
     <SelectParameters>
         <asp:Parameter Name="temsilci"  />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
