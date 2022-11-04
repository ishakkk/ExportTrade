<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OnaylananProformalar.aspx.cs" Inherits="ExternalTrade.OnaylananProformalar" %>
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
              </script>
    <div class="row" style:"width:100%;">
        <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>
        <div class="modal fade" id="staticBackdrop2" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel">PROFORMA YÜKLE</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div>
                                                    <asp:FileUpload ID="fl1" runat="server" CssClass="form-control" />
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">KAPAT</button>
                                                <asp:Button ID="btnProforma" runat="server" CssClass="btn btn-success" Text="KAYDET" OnClick="btnProforma_Click" />
                                            </div>
                                        </div>
                                        </div>
                                    </div>
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                          <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme="Material" CssClass="GridTemplate"  KeyFieldName="TeklifNo" Width="100%">
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                            <Styles>  
             <Header HorizontalAlign="Center"></Header>  

<DetailRow Wrap="True" Font-Size="Small"></DetailRow>

<DetailCell Font-Size="X-Small"></DetailCell>

<FocusedRow BackColor="#009933"></FocusedRow>

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
                                                    <dx:GridViewDataTextColumn FieldName="TOPLAMTONAJ" Caption="TOPLAM TONAJ" ReadOnly="True" Width="30%" VisibleIndex="5" >
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
                 <asp:Button ID="btnDetay" runat="server" Text="DETAY" Height="40px" CssClass="btn btn-danger" OnClick="btnDetay_Click"/> 
                  <asp:Button ID="btnProformaGor" runat="server" CssClass="btn btn-success" Text="PROFORMAYI GÖR" Height="40px" OnClick="btnProformaGor_Click"/>
                <%-- <a href="#" class="btn btn-primary" style="height:40px;" data-toggle="modal" data-target="#staticBackdrop">PROFORMA YÜKLE</a>--%>
                   <a href="#" class="btn btn-primary" style="height:40px;" data-toggle="modal" data-target="#staticBackdrop2">PROFORMA YÜKLE</a>
                 <asp:Button ID="btnIndır" runat="server" Text="YÜKLENMİŞ PROFORMAYI İNDİR" CssClass="btn btn-warning" OnClick="btnIndır_Click" />
 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
                            </dx:ASPxGridViewExporter>
       </div>
        </div>
    </div>
    
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select o.TeklifNo,o.Temsilci,o.Ulke,o.MusteriIsmi,o.TTarih,CAST((SUM([KalemSatisFiyati])-SUM([KalemMaliyeti]))/SUM([KalemMaliyeti]) as decimal(18,3)) as [KAR ORANI],SUM(buUrununSiparisTonaji) as TOPLAMTONAJ  from Orders  o left outer join AllOperationDocuments a on o.TeklifNo=a.TeklifNo where  o.TemsilciKullaniciAdi=@temsilci and o.AllOperationDocuments=0 and a.ProformaOnayi=2 group by o.TeklifNo,o.Temsilci,o.MusteriIsmi,o.Ulke,o.TTarih order by TTarih desc" OnSelecting="SqlDataSource1_Selecting">
     <SelectParameters>
         <asp:Parameter Name="temsilci"  />
        </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
