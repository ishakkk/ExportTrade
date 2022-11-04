<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="GonderimMusteriRapor.aspx.cs" Inherits="ExternalTrade.Admin.GonderimMusteriRapor" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
         .GridTemplate *
                {
                    font-family:"Helvetica Neue",Helvetica,Arial,sans-serif !important;
                    font-size: 12px !important;
                }
    </style>

        <div class="row">
        <div class="col-xl-12">
            <div class="card-box">
          <div style="width: 100%; overflow-x: scroll; overflow-y: scroll; text-align:center">
                <dx:ASPxGridView ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme="Moderno" CssClass="GridTemplate"  OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
                    <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" VerticalScrollableHeight="300"/>
                <Columns>
                        <dx:GridViewDataTextColumn FieldName="MusteriKodu" VisibleIndex="0" Visible="false">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="1" Caption="MÜŞTERİ">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="Temsilci" VisibleIndex="2" Caption="TEMSİLCİ">
                             <SettingsHeaderFilter Mode="CheckedList">
                             </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                             <dx:GridViewDataTextColumn FieldName="UrunAnaGrup" VisibleIndex="3" Caption="ÜRÜN ANA<br/> SINIFI">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="4" Caption="ÜRÜN">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TorbaTipi" VisibleIndex="5" Caption="TORBA<br/> TİPİ">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TorbaAgirligi" VisibleIndex="6" Caption="TORBA<br/> AĞIRLIĞI">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="BBTipi" VisibleIndex="7" Caption="BB<br/> TİPİ">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="BBAgirligi" VisibleIndex="8" Caption="BB<br/> AGĞIRLIĞI">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TONAJ" VisibleIndex="9" ReadOnly="True" Caption="TONAJ">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TeklifTipi" VisibleIndex="10" Caption="TESLİM<br/> ŞEKLİ">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SATISFIYATI" VisibleIndex="22" ReadOnly="True" Caption="SATIŞ<br/>FİYATI($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="URUNFIYAT" ReadOnly="True" VisibleIndex="11" Caption="ÜRÜN<br/>SADE<br/>MALİYETİ($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="AMBALAJ" ReadOnly="True" VisibleIndex="12" Caption="AMBALAJ($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="GUMRUKLEME" ReadOnly="True" VisibleIndex="13" Caption="GÜMRÜKLEME($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ARANAKLIYE" ReadOnly="True" VisibleIndex="14" Caption="ARA<br/>NAKLİYE($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ARMATORLOKALI" ReadOnly="True" VisibleIndex="15" Caption="ARMATÖR<br/>LOKALİ($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="INSPECTION" ReadOnly="True" VisibleIndex="16" Caption="INSPECTION($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="KOMISYON" ReadOnly="True" VisibleIndex="17" Caption="KOMİSYON($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DEPOLAMA" ReadOnly="True" VisibleIndex="18" Caption="DEPOLAMA($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="LIMANDOLUM" ReadOnly="True" VisibleIndex="19" Caption="LİMAN<br/>DOLUM<br/>BEDELİ($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NAVLUN" ReadOnly="True" VisibleIndex="20" Caption="NAVLUN($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="SIGORTA" ReadOnly="True" VisibleIndex="21" Caption="SIGORTA($)">
                             <SettingsHeaderFilter Mode="CheckedList">
                             </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MALIYET" ReadOnly="True" VisibleIndex="23" Caption="MALiYET($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Fark" ReadOnly="True" VisibleIndex="24" Caption="FARK($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="KarOrani" ReadOnly="True" VisibleIndex="25" Caption="KAR<br/>ORANI(%)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                    </Columns> 
                    <TotalSummary>
                         <dx:ASPxSummaryItem FieldName="Fark" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="ToplamTonaj" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="Ciro" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="Maliyet" SummaryType="Sum"/>
                    </TotalSummary>
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
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"></dx:ASPxGridViewExporter>
            <asp:Button ID="btn" runat="server" Text="Excel Raporu Al" CssClass="btn btn-primary" OnClick="btn_Click" Height="40px"/>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="CustomerSendTypeReport" OnSelecting="SqlDataSource1_Selecting" SelectCommandType="StoredProcedure">
        <SelectParameters>
            
            <asp:Parameter Name="baslangic" Type="String" />
            <asp:Parameter Name="bitis" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

