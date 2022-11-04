<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="DepartmanMusterileri.aspx.cs" Inherits="ExternalTrade.Admin.DepartmanMusterileri" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
  
    <script>
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Rapor Oluşturuldu", type: "success"
            }).then(function () { window.location = 'DepartmanMusterileri.aspx' });
        }
    </script>
    <script>
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Rapor Oluşturulamadı", type: "error"
            }).then(function () { window.location = 'DepartmanMusterileri.aspx' });
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
                   <div class="btn-group">
                <asp:Button ID="btnCek" runat="server" Text="Raporla" CssClass="btn btn-success" OnClick="btnCek_Click" Height="40px"/>
            </div>
             <div style="float:right">
                <asp:Button ID="Button1" runat="server" Text="Excel Raporu Al" CssClass="btn btn-primary" OnClick="Button1_Click" Height="40px"/>
                 <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
                 </dx:ASPxGridViewExporter>
            </div>
                <dx:ASPxGridView ID="ASPxGridView1" Width="100%" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" KeyFieldName="Id" Theme="Moderno" CssClass="GridTemplate"  OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared">
                    <Settings ShowFilterRow="True" ShowHeaderFilterButton="True"/>
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
                        <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MusteriKodu" Width="50%" VisibleIndex="1" Caption="MÜŞTERİ KODU">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MusteriAdi" Width="100%" VisibleIndex="2" Caption="MÜŞTERİ ADI">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Temsilci" Width="50%" VisibleIndex="3" Caption="TEMSİLCİ">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Kita" Width="50%" VisibleIndex="4" Caption="KITA">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Ulke" Width="50%" VisibleIndex="5" Caption="ÜLKE">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Ton" Width="50%" VisibleIndex="6" Caption="TON">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Ciro" Width="50%" VisibleIndex="7" Caption="CİRO">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Maliyet" Width="50%" VisibleIndex="8" Caption="MALİYET">
                        </dx:GridViewDataTextColumn>
                        
                        <dx:GridViewDataTextColumn FieldName="Fark" Width="50%" VisibleIndex="9" Caption="FARK">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Kar" Width="50%" VisibleIndex="10" Caption="KAR">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="GonderimSekli" Width="50%" VisibleIndex="11" Caption="GÖNDERİM ŞEKLİ">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowFooter="true" />
                    <TotalSummary>
                         <dx:ASPxSummaryItem FieldName="Maliyet" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="Ciro" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="Fark" SummaryType="Sum" />
                         <dx:ASPxSummaryItem FieldName="Ton" SummaryType="Sum" />
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

    <!-- end row -->


    <div class="row">
      
        <!-- end col-->

        
      
        <!-- end col-->

         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT * FROM [Department_Report] order by Kar desc"></asp:SqlDataSource>

    </div>
    <!-- end row -->
    <!-- App js -->
    <script src="/assets/js/app.min.js"></script>

    </asp:Content>


