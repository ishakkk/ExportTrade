<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="GonderimCesitKarlilik.aspx.cs" Inherits="ExternalTrade.Admin.GonderimCesitKarlilik" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
   
    <script>
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Rapor Oluşturuldu", type: "success"
            }).then(function () { window.location = 'GonderimCesitKarlilik.aspx' });
        }
    </script>
    <script>
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Rapor Oluşturulamadı", type: "error"
            }).then(function () { window.location = 'GonderimCesitKarlilik.aspx' });
        }
    </script>
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
                <div>
                    BAŞLANGIÇ TARİHİ
                </div>
                <div>
                    <asp:TextBox ID="txttar1" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                </div>
                <div>
                    BİTİŞ TARİHİ
                </div>
                <div>
                    <asp:TextBox ID="txttar2" runat="server" CssClass="form-control" type="date"></asp:TextBox>
                </div>
                <br />
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Theme="Moderno" CssClass="GridTemplate"  OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
                    <Settings ShowFilterRow="True" ShowHeaderFilterButton="True"/>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="GonderimSekli" VisibleIndex="1" Caption="TESLİM ŞEKLİ">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Ton" VisibleIndex="2" Caption="TON">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TonDagilimi" VisibleIndex="3" Caption="TON DAĞILIMI">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Satis" VisibleIndex="4" Caption="CİRO($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Maliyet" VisibleIndex="5" Caption="MALİYET($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Fark" VisibleIndex="6" Caption="FARK($)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Kar" VisibleIndex="7" Caption="KAR(%)">
                            <SettingsHeaderFilter Mode="CheckedList">
                            </SettingsHeaderFilter>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFooter="true" />
                   <TotalSummary>
                        <dx:ASPxSummaryItem FieldName="Ton" SummaryType="Sum" />
                       <dx:ASPxSummaryItem FieldName="TonDagilimi" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="Satis" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="Maliyet" SummaryType="Sum"/>
                       <dx:ASPxSummaryItem FieldName="Fark" SummaryType="Sum" />
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
               
                 <div class="btn-group">
                <asp:Button ID="btnCek" runat="server" Text="Raporla" CssClass="btn btn-success" OnClick="btnCek_Click" Height="40px"/>
            </div>
            <div style="float:right">
                <asp:Button ID="btnExcel" runat="server" Text="Excel Raporu Al" CssClass="btn btn-primary" OnClick="btnExcel_Click" Height="40px"/>
            </div>
            </div>
           
        </div>
    </div>
    
    <!-- end row -->


    <div class="row">
        
        <!-- end col-->

        
        <!-- end col-->

         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT * FROM [SendTypeProfit] order by [Kar] desc"></asp:SqlDataSource>

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>

    </div>
    <!-- end row -->

    
    

    <!-- Init js -->
    

    <!-- App js -->
    <script src="/assets/js/app.min.js"></script>

    </asp:Content>
