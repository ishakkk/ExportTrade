<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OperationProforma.aspx.cs" Inherits="ExternalTrade.OperationProforma" %>
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
          <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>
  <!-- /.modal -->
  
      <div class="row" style:"width:100%;">
        <div class="col-11" style="width:100%;"><br />
              <div class="form-group row">
                  
                      <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                          <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="TeklifNo" Theme="Moderno" CssClass="GridTemplate" >
                                            <SettingsPager PageSize="25">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true" HorizontalScrollBarMode="Auto" VerticalScrollBarMode="Auto" />
                                            <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" />
                                            <SettingsPopup>
                                                <HeaderFilter ShowHeader="True" />
                                            </SettingsPopup>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" Width="20%" VisibleIndex="0" Caption="TEKLİF NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="SiparisNo" Width="20%"  VisibleIndex="0" Caption="SİPARİŞ NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" Width="20%"  VisibleIndex="1"  Caption="TEMSİLCİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MusteriIsmi" Width="50%"  VisibleIndex="3"  Caption="MÜŞTERİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ulke" VisibleIndex="2" Width="20%"  Caption="ÜLKE">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="TTarih" VisibleIndex="4" Width="20%"  Caption="TEKLİF TARİHİ" >
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="PO" ReadOnly="True" VisibleIndex="5" Width="20%"  Caption="PO">
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

       <%--    <asp:Button ID="btnRapor" runat="server" Text="DETAYLAR" CssClass="btn btn-danger"  Height="40px" OnClick="btnRapor_Click"/>--%>
        
            <asp:Button ID="btn" runat="server" CssClass="btn btn-primary" Text="PROFORMAYI GÖR" OnClick="btn_Click" Height="40px" />
               <asp:Button ID="btnIndir" runat="server" Text="YÜKLENMİŞ PROFORMAYI İNDİR" CssClass="btn btn-success" Height="40px" OnClick="btnIndir_Click" />  
       </div>             
        </div>
       
    </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT o.[TeklifNo],o.SiparisNo,o.[Temsilci],o.[MusteriIsmi],o.[Ulke],o.TTarih,a.PO FROM [Orders] o left outer join AllOperationDocuments a on o.TeklifNo=a.TeklifNo where (o.[Durum]='ONAYLANDI' or o.[Durum]='SATISA DONDU') and o.AllOperationDocuments=0   and o.CurrencyUnit is not null and o.Company is not null and   a.ProformaOlusturan is not null    group by o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke],o.TTarih,a.PO,o.SiparisNo order by TTarih desc">
     <SelectParameters>
        
         
         </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>