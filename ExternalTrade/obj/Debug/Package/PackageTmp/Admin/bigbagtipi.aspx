<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="bigbagtipi.aspx.cs" Inherits="ExternalTrade.Admin.bigbagtipi" %>
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
     <div class="col-xl-3 col-md-6">
                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="621px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme="Moderno" CssClass="GridTemplate"  KeyFieldName="Id">
                               <SettingsBehavior AllowFocusedRow="false" AllowSelectByRowClick="True" AllowDragDrop="false" />
                                 <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="false">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="bbType" VisibleIndex="1" Caption="BigBag Tipi" Width="100px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Price" VisibleIndex="2" Caption="Fiyat($)" Width="100px">
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
             <div class="btn-group">
        <asp:Button ID="bntguncelle" runat="server"  Text="Seçileni Güncelle" CssClass="btn btn-success" OnClick="bntguncelle_Click" Height="40px"/>
    </div>
       <div class="btn-group">
        <asp:Button ID="Button1" runat="server"  Text="Rapor Al" CssClass="btn btn-primary" OnClick="Button1_Click" Height="40px"/>
    </div>
                            </div>

        
    </div>
    
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT * FROM [BBType]"></asp:SqlDataSource>
     <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
     </dx:ASPxGridViewExporter>
</asp:Content>
