<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="gumrukleme.aspx.cs" Inherits="ExternalTrade.Admin.gumrukleme" %>
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
                            
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource1" Width="609px" AutoGenerateColumns="False" KeyFieldName="Id" Theme="Moderno" CssClass="GridTemplate" >
                                 <SettingsBehavior AllowFocusedRow="false" AllowSelectByRowClick="True" AllowDragDrop="false" />
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="false">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="GumruklemeBULK" VisibleIndex="1" Caption="BULK <br/>GÜMRÜK(TL)">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="GumruklemeKONTEYNER" VisibleIndex="2" Caption="KONTEYNER<br/> GUMRUK(TL)">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="GumruklemeKONTEYNERikidokuz" VisibleIndex="3" Caption="KONTEYNER<br/>(2-9)(TL)">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="GumruklemeKONTEYNERonuzeri" VisibleIndex="4" Caption="KONTEYNER<br/>>10(TL)">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="GumruklemeKonteynerKaraYolu" VisibleIndex="5" Caption="KARA<br/>YOLU(TL)">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="GumruklemeKonteynerKaraYoluikiuzeri" VisibleIndex="6" Caption="KARA<br>YOLU<br/>>(2)(TL)">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="GumruklemeKonteynerDemirYolu" VisibleIndex="7" Caption="DEMİR<br/> YOLU(TL)">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="GumruklemeKonteynerDemirYoluikiuzeri" VisibleIndex="8" Caption="DEMİR<br/>YOLU<br/>>(2)(TL)">
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
    <div class="btn-group">
        <asp:Button ID="Button1" runat="server" Text="Seçileni Güncelle" CssClass="btn btn-success" OnClick="Button1_Click" Height="40px"/>
        
    </div>
    <div class="btn-group">
        <asp:Button ID="export" runat="server" Text="Rapor Al" CssClass="btn btn-primary" OnClick="export_Click" Height="40px"/>
    </div>
    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT * FROM [Clearance]"></asp:SqlDataSource>
</asp:Content>

