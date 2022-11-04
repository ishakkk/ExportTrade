<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ekipmanguncelle.aspx.cs" Inherits="ExternalTrade.Admin.ekipmanguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
 <script type="text/javascript">
     function successAlert() {
         swal({
             title: "İŞLEM TAMAMLANDI", text: "Kaydınız Güncellendi", type: "success"
         }).then(function () {
             window.location = "ekipmantipleri.aspx";

         });
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
        <label>Ekipman Adı</label>
    </div>
<div>
    <asp:TextBox ID="txtekipman" runat="server" CssClass="form-control">

    </asp:TextBox>
</div>
    <div class="btn-group">
        <asp:Button runat="server" ID="btnguncelle" CssClass="btn btn-success" Text="Güncelle" OnClick="btnguncelle_Click" Height="40px"/>
I    </div>

</asp:Content>
