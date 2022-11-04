<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="KitaMusteriRaporlama.aspx.cs" Inherits="ExternalTrade.Admin.KitaMusteriRaporlama" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
        <div class="row" style="width:100%">
        <div class="col-12"  style="width:100%">
            <div class="card-box">
           <div class="form-group row">
               <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>
                <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
              <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" Theme="Moderno" CssClass="GridTemplate" >
                      <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" VerticalScrollableHeight="300"/>
                     <SettingsPager PageSize="20">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True"  ShowHeaderFilterButton="True" />
                                            <Settings ShowFilterRowMenu="true"  VerticalScrollableHeight="300"/>
                                            <SettingsBehavior AllowFocusedRow="false" AllowSelectByRowClick="True" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="MusteriKodu" VisibleIndex="0" Caption="MÜŞTERİ KODU" Width="100%" >
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="1" Caption="MÜŞTERİ" Width="100%" >
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Kita" VisibleIndex="3" Caption="KITA" Width="100%" >
                             <SettingsHeaderFilter Mode="CheckedList">
                             </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                           <dx:GridViewDataTextColumn FieldName="Ulke" VisibleIndex="4" Caption="ÜLKE" Width="100%" >
                             <SettingsHeaderFilter Mode="CheckedList">
                             </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TeklifTipi" VisibleIndex="12" Caption="GÖNDERİM ŞEKLİ" Width="100%" >
                             <SettingsHeaderFilter Mode="CheckedList">
                             </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ToplamTonaj" VisibleIndex="7" ReadOnly="True" Caption="TOPLAM TONAJ" Width="100%" >
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="6" Caption="ÜRÜN" Width="100%" >
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Ciro" VisibleIndex="8" ReadOnly="True" Caption="CİRO($)" Width="100%" >
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Maliyet" VisibleIndex="9" ReadOnly="True" Caption="MALİYET($)" Width="100%" >
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Fark" VisibleIndex="10" ReadOnly="True" Caption="FARK($)" Width="100%" >
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="KarOrani" ReadOnly="True" VisibleIndex="11" Caption="KAR(%)" Width="100%" >
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Temsilci" VisibleIndex="2" Caption="TEMSİLCİ" Width="100%" >
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="UrunAnaGrup" VisibleIndex="5" Caption="ÜRÜN ANA SINIF" Width="100%" >
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

                    <Settings ShowFooter="true" />
                    <TotalSummary>
                         <dx:ASPxSummaryItem FieldName="Fark" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="ToplamTonaj" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="Ciro" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="Maliyet" SummaryType="Sum"/>
                    </TotalSummary>
                </dx:ASPxGridView>

           </div>
                
               </div>
                

                <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"></dx:ASPxGridViewExporter>

            </div>
           
        </div>
            <asp:Button ID="btn" runat="server" Text="Excel Raporu Al" CssClass="btn btn-success" OnClick="btn_Click" Height="40px"/>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="CustomerContinentReport" OnSelecting="SqlDataSource1_Selecting" SelectCommandType="StoredProcedure">
        <SelectParameters>
          
            <asp:Parameter Name="baslangic" Type="String" />
            <asp:Parameter Name="bitis" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

