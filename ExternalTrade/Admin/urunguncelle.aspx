<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="urunguncelle.aspx.cs" Inherits="ExternalTrade.Admin.urunguncelle" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kaydınız Güncellendi", type: "success"
            }).then(function () { window.location = "urunler.aspx"; });
        }
   </script>
    <script type="text/javascript">
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Kaydınız Güncellenemedi", type: "error"
            });
        }
    </script>
     <div class="form-group">
        <div><label>Ürün Ana Sınıfı</label></div>
      <asp:DropDownList ID="drpAnaSinif" runat="server" CssClass="form-control select2"></asp:DropDownList>
        <br />
        <div><label>Ürün Adı</label></div>
         <asp:TextBox ID="txtUrunAdi" runat="server" CssClass="form-control">

        </asp:TextBox>
        
        <br />
          <div><label>Ürün Üst Sınıf Kodu</label></div>
         <asp:TextBox ID="txtUstSinifKodu" runat="server" CssClass="form-control">

        </asp:TextBox>
        
        <br />
        <div><label>Ürün Fiyatı</label></div>
         <asp:TextBox ID="txtFiyat" runat="server" CssClass="form-control">

        </asp:TextBox>
        <br />
         <div><label>Ürün Fiyatı($)(Intercarb)</label></div>
         <asp:TextBox ID="txtIntercarb" runat="server" CssClass="form-control">

        </asp:TextBox>
         <br />
         <div><label>Ürün Fiyatı($)(Roskimtorg)</label></div>
         <asp:TextBox ID="txtRoskim" runat="server" CssClass="form-control">

        </asp:TextBox>
         <br />
         <div><label>Ürün Fiyatı($)(Özer)</label></div>
         <asp:TextBox ID="tztOzer" runat="server" CssClass="form-control">

        </asp:TextBox>
         <br />

    </div>
    <div class="btn-group">
        <asp:Button ID="btnguncelle" CssClass="btn btn-success" runat="server" Text="Güncelle" OnClick="btnguncelle_Click" Height="40px"/>
    </div>
</asp:Content>
