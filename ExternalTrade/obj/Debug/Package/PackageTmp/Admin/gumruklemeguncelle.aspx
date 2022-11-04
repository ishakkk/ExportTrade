<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="gumruklemeguncelle.aspx.cs" Inherits="ExternalTrade.Admin.gumruklemeguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kaydınız Güncellendi", type: "success"

            }).then(function () {
                window.location = "gumrukleme.aspx";
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
      <div>
          <label>BULK Gümrükleme Bedeli($)</label>
      </div>
      <div>
          <asp:TextBox ID="txtbulkgumruk" runat="server" CssClass="form-control"></asp:TextBox>
      </div>
        <div>
          <label>KONTEYNER Gümrükleme Bedeli($)</label>
      </div>
      <div>
          <asp:TextBox ID="txtkonteynergumruk" runat="server" CssClass="form-control"></asp:TextBox>
      </div>
  </div>
      <div>
          <label>KONTEYNER Gümrükleme Bedeli($) (2-9 Konteyner)</label>
      </div>
      <div>
          <asp:TextBox ID="txtkonteynerikidokuz" runat="server" CssClass="form-control"></asp:TextBox>
      </div>
      <div>
          <label>KONTEYNER Gümrükleme Bedeli($) (10 Üzeri Konteyner)</label>
      </div>
      <div>
          <asp:TextBox ID="txtonuzeri" runat="server" CssClass="form-control"></asp:TextBox>
      </div>
       <div>
          <label>KARA YOLU Gümrükleme Bedeli($)</label>
      </div>
      <div>
          <asp:TextBox ID="txtkarayolu" runat="server" CssClass="form-control"></asp:TextBox>
      </div>
       <div>
          <label>KARA YOLU Gümrükleme Bedeli($) (2 Üzeri Konteyner)</label>
      </div>
      <div>
          <asp:TextBox ID="txtkarayoluikiüzeri" runat="server" CssClass="form-control"></asp:TextBox>
      </div>
       <div>
          <label>DEMİR YOLU Gümrükleme Bedeli($)</label>
      </div>
      <div>
          <asp:TextBox ID="txtdemiryolu" runat="server" CssClass="form-control"></asp:TextBox>
      </div>
       <div>
          <label>DEMİR YOLU Gümrükleme Bedeli($) (2 Üzeri Konteyner)</label>
      </div>
      <div>
          <asp:TextBox ID="txtdemiryoluikiüzeri" runat="server" CssClass="form-control"></asp:TextBox>
      </div>
    <div>
        <asp:Button runat="server" ID="btnguncelle" CssClass="btn btn-success" Text="Güncelle" OnClick="btnguncelle_Click" Height="40px"/>
    </div>
</asp:Content>

