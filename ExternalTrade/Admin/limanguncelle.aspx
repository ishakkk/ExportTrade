<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="limanguncelle.aspx.cs" Inherits="ExternalTrade.Admin.limanguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript">
     function successAlert() {
         swal({
             title: "İŞLEM TAMAMLANDI", text: "Kaydınız Güncellendi", type: "success"
         }).then(function () { window.location = "limanlar.aspx"; });
     }
    </script>
    <script type="text/javascript">
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Kaydınız Güncellenemedi", type: "error"
            });
        }
    </script>
    <div>
        <div><label>Liman Adı</label></div>
    <asp:TextBox ID="txtliman" runat="server" CssClass="form-control">
    </asp:TextBox><br />
        <div><label>Fiyat</label></div>
        <asp:TextBox ID="txtfiyat" runat="server" CssClass="form-control">
    </asp:TextBox><br />
        <div><label>İç Nakliye Bedeli</label></div>
         <asp:TextBox ID="txtinside" runat="server" CssClass="form-control">
    </asp:TextBox><br />
</div>
    <div class="btn-group">
        <asp:Button runat="server" ID="btnguncelle" CssClass="btn btn-success" Text="Güncelle" OnClick="btnguncelle_Click" Height="40px"/>
I    </div>
</asp:Content>
