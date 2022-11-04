<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UrunEkle.aspx.cs" Inherits="ExternalTrade.Admin.UrunEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         function successAlert() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "Kaydınız Eklendi", type: "success"

             }).then(function () { window.location = "urunler.aspx"; });
         }
    </script>
    <script type="text/javascript">
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Kaydınız Eklenemedi", type: "error"
            });
        }
    </script>
    <div class="form-group">
         <div>
            <label>ANA SINIF</label>
        </div>

       <asp:DropDownList ID="drpAnaSinif" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>
       <div class="form-group">
         <div>
            <label>ÜRÜN ÜST SINIF KODU</label>
        </div>

        <asp:TextBox ID="txtUstSinifKodu" required="Bu Alan Boş Geçilemez" placeholder="Örneğin NAN01.02" runat="server"  CssClass="form-control">

        </asp:TextBox>
    </div>
       <div class="form-group">
         <div>
            <label>ÜRÜN ÜST SINIF</label>
        </div>

        <asp:TextBox ID="txtUrun" required="Bu Alan Boş Geçilemez" placeholder="Örneğin NİĞTAŞ 95" runat="server"  CssClass="form-control">

        </asp:TextBox>
    </div>
       <div class="form-group">
         <div>
            <label>FİYAT($)(DİĞER MÜŞTERİLER)</label>
        </div>

        <asp:TextBox ID="txtFiyat" required="Bu Alan Boş Geçilemez" placeholder="Örneğin 12,5" runat="server" CssClass="form-control">

        </asp:TextBox>
    </div>
       <div class="form-group">
         <div>
            <label>FİYAT($)(INTERCARB)</label>
        </div>

        <asp:TextBox ID="txtintercarb" required="Bu Alan Boş Geçilemez" placeholder="Örneğin 12,5" runat="server" CssClass="form-control">

        </asp:TextBox>
    </div>
      <div class="form-group">
         <div>
            <label>FİYAT($)(ROSKIMTORG)</label>
        </div>

        <asp:TextBox ID="txtRoskimtorg" required="Bu Alan Boş Geçilemez" placeholder="Örneğin 12,5" runat="server" CssClass="form-control">

        </asp:TextBox>
    </div>
      <div class="form-group">
         <div>
            <label>FİYAT($)(ÖZER)</label>
        </div>

        <asp:TextBox ID="txtOzer" required="Bu Alan Boş Geçilemez" placeholder="Örneğin 12,5" runat="server" CssClass="form-control">

        </asp:TextBox>
    </div>
    <div class="btn-group">
        <asp:Button ID="btnEkle" OnClick="btnEkle_Click" CssClass="btn btn-success" runat="server" Text="Ekle"   Height="40px"/>
    </div>
</asp:Content>

