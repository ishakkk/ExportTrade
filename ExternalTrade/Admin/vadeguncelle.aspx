<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="vadeguncelle.aspx.cs" Inherits="ExternalTrade.Admin.vadeguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
    function successAlert() {
        swal({
            title: "İŞLEM TAMAMLANDI", text: "Kaydınız Güncellendi", type: "success"
        }).then(function () { window.location = "vade.aspx"; });
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
      <div>
        <label>Vade Gün Sayısı</label>
    </div>
      <div class="form-group">
        <asp:TextBox ID="txtvade" runat="server" CssClass="form-control">

        </asp:TextBox>
      </div>
     <div>
        <label>Vade Farkı($)</label>
    </div>
      <div class="form-group">
        <asp:TextBox ID="txtvadefarkı" runat="server" CssClass="form-control">

        </asp:TextBox>
      </div>
    <div class="btn-group">
        <asp:Button ID="btnguncelle" CssClass="btn btn-success" runat="server" Text="Güncelle" OnClick="btnguncelle_Click" Height="40px"/>
    </div></div>
</asp:Content>
