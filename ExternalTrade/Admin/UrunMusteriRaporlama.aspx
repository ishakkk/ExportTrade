<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UrunMusteriRaporlama.aspx.cs" Inherits="ExternalTrade.Admin.UrunMusteriRaporlama" %>
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
            <div class="card-box" style="width:100%;overflow-x: scroll; overflow-y: scroll; text-align:center"">
          
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme="Moderno" CssClass="GridTemplate"  OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
                    <Settings ShowFilterRow="True" ShowHeaderFilterButton="True"/>
                  <Columns>
                        <dx:GridViewDataTextColumn FieldName="MusteriKodu" VisibleIndex="0" Caption="CARİ KODU">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MusteriIsmi" VisibleIndex="1" Caption="CARİ">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                         <dx:GridViewDataTextColumn FieldName="TeklifTipi" VisibleIndex="10" Caption="GÖNDERİM ŞEKLİ">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ToplamTonaj" VisibleIndex="5" ReadOnly="True" Caption="TONAJ">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UrunAnaGrup" VisibleIndex="3" Caption="ÜRÜN ANA SINIFI">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Urun" VisibleIndex="4" Caption="ÜRÜN">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Ciro" VisibleIndex="6" ReadOnly="True" Caption="CİRO($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Maliyet" VisibleIndex="7" ReadOnly="True" Caption="MALİYET($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Fark" VisibleIndex="8" ReadOnly="True" Caption="FARK($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="KarOrani" ReadOnly="True" VisibleIndex="9" Caption="KAR ORANI(%)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Temsilci" VisibleIndex="2" Caption="TEMSİLCİ">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFooter="true" />
                    <TotalSummary>
                        <dx:ASPxSummaryItem FieldName="ToplamTonaj" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="Fark" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="Maliyet" SummaryType="Sum" />
                        <dx:ASPxSummaryItem FieldName="Ciro" SummaryType="Sum" />
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
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"></dx:ASPxGridViewExporter>
            <asp:Button ID="btn" runat="server" Text="Excel Raporu Al" CssClass="btn btn-primary" OnClick="btn_Click" Height="40px"/>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="CustomerProductReporting" OnSelecting="SqlDataSource1_Selecting" SelectCommandType="StoredProcedure">
        <SelectParameters>
           
             <asp:Parameter Name="baslangic" Type="String" />
             <asp:Parameter Name="bitis" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
