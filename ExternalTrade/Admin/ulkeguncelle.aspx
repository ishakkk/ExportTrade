<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="ulkeguncelle.aspx.cs" Inherits="ExternalTrade.Admin.ulkeguncelle" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kaydınız Güncellendi", type: "success"
            }).then(function () { window.location = "ulkeler.aspx"; });
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
    <label>Ülke Adı</label>
    <div>
        <asp:TextBox ID="txtÜlke" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
    <div>
    <label>Ülkenin Bulunduğu Bölge</label>
    <div>
        <asp:DropDownList ID="drpBolge" runat="server" CssClass="form-control"></asp:DropDownList>
    </div>
</div>
    <div>
        <asp:Button ID="btnguncelle" runat="server" Text="GÜNCELLE" CssClass="btn btn-success" OnClick="btnguncelle_Click" Height="40px"/>
       
    </div>
</asp:Content>
