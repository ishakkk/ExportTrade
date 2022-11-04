<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OnayBekleyenProformalar.aspx.cs" Inherits="ExternalTrade.OnayBekleyenProformalar" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   <script>
       function sec() {
           swal({
               title: "DİKKAT", text: "Herhangi bir Kayıt Seçmediniz", type: "warning"
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
     <div class="row" style:"width:100%;">
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                               <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="TeklifNo" Width="100%" Theme="Material" CssClass="GridTemplate" >
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

            <asp:Button ID="btnDetay" Text="DETAY" runat="server" CssClass="btn btn-danger" Height="40px" OnClick="btnDetay_Click" />  
                <asp:Button ID="btnProforma" runat="server" CssClass="btn btn-success" Height="40px" Text="PROFORMAYI GÖR" OnClick="btnProforma_Click" />
       </div>
     
   





      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="select o.TeklifNo,o.Temsilci,o.Ulke,o.MusteriIsmi,o.TTarih,CAST((SUM([KalemSatisFiyati])-SUM([KalemMaliyeti]))/SUM([KalemMaliyeti]) as decimal(18,3)) as [KAR ORANI],SUM(buUrununSiparisTonaji) as TOPLAMTONAJ  from Orders  o left outer join AllOperationDocuments a on o.TeklifNo=a.TeklifNo where (o.Durum='ONAYLANDI' or o.Durum='SATISA DONDU') and o.TemsilciKullaniciAdi=@temsilci and o.AllOperationDocuments=0 and a.ProformaOnayi=1 group by o.TeklifNo,o.Temsilci,o.MusteriIsmi,o.Ulke,o.TTarih order by TTarih desc" OnSelecting="SqlDataSource1_Selecting">
     <SelectParameters>
         <asp:Parameter Name="temsilci"  />
        </SelectParameters>
        </asp:SqlDataSource>
              
        </div>
       
    </div>
</asp:Content>
