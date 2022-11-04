<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ekipmantipleri.aspx.cs" Inherits="ExternalTrade.Admin.ekipmantipleri" %>
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

                            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Id" Width="641px" Theme="Moderno" CssClass="GridTemplate" >
                               <SettingsBehavior AllowFocusedRow="false" AllowSelectByRowClick="True" AllowDragDrop="true" />
                                 <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="false">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="EkipmanTürü" VisibleIndex="1" Caption="Ekipman Türü">
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
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ExternalTradeDBConnectionString %>" SelectCommand="SELECT * FROM [EquipmentType]" OnSelecting="SqlDataSource1_Selecting"></asp:SqlDataSource>
</asp:Content>
