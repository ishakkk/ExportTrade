<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="bbagirligiguncelle.aspx.cs" Inherits="ExternalTrade.Admin.bbagirligiguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
 <script type="text/javascript">
     function successAlert() {
         swal({
             title: "İŞLEM TAMAMLANDI", text: "Kaydınız Güncellendi", type: "success"

         }).then(function () { window.location = "bigbagagirligi.aspx"; });
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
         <div>
            <label>BigBag Ağırlığı</label>
        </div>
        <asp:TextBox ID="txtbbagirligi" runat="server" CssClass="form-control">

        </asp:TextBox>
    </div>
    <div class="btn-group">
        <asp:Button ID="btnguncelle" CssClass="btn btn-success" runat="server" Text="Güncelle" OnClick="btnguncelle_Click" Height="40px"/>
    </div>
</asp:Content>
