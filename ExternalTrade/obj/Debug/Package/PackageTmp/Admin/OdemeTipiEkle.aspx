<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="OdemeTipiEkle.aspx.cs" Inherits="ExternalTrade.Admin.OdemeTipiEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kaydınız Eklendi", type: "success"

            }).then(function () { window.location = "OdemeTipi.aspx"; });
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
            <label>Ödeme Tipi</label>
        </div>
        <asp:TextBox ID="txtOdemeTipi" runat="server" CssClass="form-control">

        </asp:TextBox>
    </div>
    <div class="btn-group">
        <asp:Button ID="btnEkle" CssClass="btn btn-success" runat="server" Text="Ekle" OnClick="btnEkle_Click"  Height="40px"/>
    </div>
</asp:Content>
