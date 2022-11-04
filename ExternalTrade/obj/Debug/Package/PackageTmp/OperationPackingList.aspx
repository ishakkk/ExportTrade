<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="OperationPackingList.aspx.cs" Inherits="ExternalTrade.OperationPackingList" %>
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

    <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;">
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
                                           <div>
                                                 <div>SPECIAL NOTE</div>
                                            <div>
                                                <asp:TextBox ID="txtSpecialNote" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                          
                                           
                                             
                                           </div>
                                          </div>

                                   
                                         <div class="form-group mb-0 text-center">
                                             <asp:Button ID="Button1" runat="server" Text="KAYDET" CssClass="btn btn-success"  Height="40px" OnClick="Button1_Click"/>
                                  

                                        </div>
                                    </div>
                              

                            <!-- end card-body -->
                        </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div>
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
                                                <dx:GridViewDataTextColumn FieldName="SiparisNo" Width="20%"  VisibleIndex="0" Caption="SİPARİŞ NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="booking" Width="20%"  VisibleIndex="0" Caption="BOOKING NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                 <dx:GridViewDataTextColumn FieldName="YÜKLEME TARİHİ" Width="20%"  VisibleIndex="0">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="TeklifNo" Width="20%"  VisibleIndex="2" Caption="TEKLİF NO">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Temsilci" Width="20%"  VisibleIndex="3"  Caption="TEMSİLCİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="4" Width="50%"  Caption="MÜŞTERİ">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Ulke" VisibleIndex="5" Width="20%"  Caption="ÜLKE">
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                   <dx:GridViewDataTextColumn FieldName="TTarih" VisibleIndex="6" Caption="TAKLİF TARİHİ" Width="20%" >
                                                    <SettingsHeaderFilter Mode="CheckedList">
                                                    </SettingsHeaderFilter>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="PO" ReadOnly="True" VisibleIndex="7" Width="20%" >
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
        <%--   <asp:Button ID="btnRapor" runat="server" Text="DETAYLAR" CssClass="btn btn-danger"  Height="40px" OnClick="btnRapor_Click"/>--%>
                  <asp:Button ID="Button2" runat="server" Text="PACKING LIST OLUSTUR" CssClass="btn btn-primary"  Height="40px" OnClick="Button1_Click"/>
                <%--  <a href="#" class="btn btn-primary" style="height:40px;" data-toggle="modal" data-target=".bs-example-modal-center">PACKING LIST OLUSTUR</a>--%>
                   
       </div>
        </div>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT  yx.[STUFFING DATE] as [YÜKLEME TARİHİ], yx.[BOOKING NO] as booking, o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke],CAST((SUM(o.KalemSatisFiyati)-SUM(o.KalemMaliyeti))/SUM(o.KalemMaliyeti) as decimal(18,3)) as [KAR ORANI],o.TTarih,o.SiparisNo,a.PO FROM [Orders] o left outer join AllOperationDocuments a on o.TeklifNo=a.TeklifNo left outer join DTBSSRVR.TIGERDB.dbo.LG_219_01_ORFICHE FC on o.SiparisNo=FC.FICHENO  left OUTER JOIN DTBSSRVR.TIGERDB.dbo.Z_YUKLEMEX yx on o.SiparisNo=yx.[ORDER NO]  where o.[Durum]='SATISA DONDU' and o.AllOperationDocuments=0 and  o.YediyuzluKod is not null and o.CurrencyUnit is not null and o.Company is not null and   a.CommercialInvoiceOlusturan is not null    group by o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke],o.SiparisNo,a.PO,o.TTarih,yx.[STUFFING DATE] , yx.[BOOKING NO] order by TTarih desc">
         <SelectParameters>
         </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>