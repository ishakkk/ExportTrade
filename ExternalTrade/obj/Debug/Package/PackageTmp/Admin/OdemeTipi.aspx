<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OdemeTipi.aspx.cs" Inherits="ExternalTrade.Admin.OdemeTipi" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
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

     <div class="row">

                        <div class="col-xl-3 col-md-6">
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id" Theme="Moderno" CssClass="GridTemplate"  Width="100%">
                                 <SettingsBehavior AllowFocusedRow="false" AllowSelectByRowClick="True" AllowDragDrop="false" />
                                <Settings ShowFilterRow="True" ShowHeaderFilterButton="True" />
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" Visible="false" ReadOnly="True" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="PaymentTerms" Caption="ÖDEME ŞEKLİ" VisibleIndex="1">
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
   
        <asp:Button ID="btnguncelle" runat="server" Text="Seçileni Güncelle" OnClick="btnguncelle_Click" CssClass="btn btn-success"  Height="40px"/>
     
   <%-- <asp:Button ID="btnEkle" runat="server" Text="Ekle" CssClass="btn btn-warning" />--%>
   <a href="OdemeTipiEkle.aspx" class="btn btn-warning">Ekle</a>
        <asp:Button ID="Button1" runat="server" Text="Rapor Al" OnClick="Button1_Click" CssClass="btn btn-primary"  Height="40px"/>
   
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT * FROM [Payment]"></asp:SqlDataSource>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
    </dx:ASPxGridViewExporter>
    
</asp:Content>

