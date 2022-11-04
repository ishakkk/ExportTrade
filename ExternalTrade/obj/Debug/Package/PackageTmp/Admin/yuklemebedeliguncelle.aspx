<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="yuklemebedeliguncelle.aspx.cs" Inherits="ExternalTrade.Admin.yuklemebedeliguncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kaydınız Güncellendi", type: "success"
            }).then(function () { window.location = "yuklemebedeli.aspx"; });
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
        <label>Fiyat</label>
    </div>
    <div>
    <asp:TextBox ID="txtcakilifiyat" runat="server" CssClass="form-control">
    </asp:TextBox>
</div>
    <div>
        <label>Limak 20</label>
    </div>
    <div>
    <asp:TextBox ID="txtlimak20" runat="server" CssClass="form-control">
    </asp:TextBox>
</div>
    <div>
        <label>Limak 40</label>
    </div>
    <div>
    <asp:TextBox ID="txtlimak40" runat="server" CssClass="form-control">
    </asp:TextBox>
</div>
    <div>
        <label>MIP 20</label>
    </div>
    <div>
    <asp:TextBox ID="txtmip20" runat="server" CssClass="form-control">
    </asp:TextBox>
</div>
    <div>
        <label>MIP 40</label>
    </div>
    <div>
    <asp:TextBox ID="txtmip40" runat="server" CssClass="form-control">
    </asp:TextBox>
</div>
    <div class="btn-group">
        <asp:Button ID="btnguncelle" runat="server" Text="GÜNCELLE" CssClass="btn btn-success" OnClick="btnguncelle_Click" Height="40px" />
    </div></div>

</asp:Content>
