<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="torbaagirligiguncelle.aspx.cs" Inherits="ExternalTrade.Admin.torbaagirligiguncelle" %>
<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kaydınız Güncellendi", type: "success"
            }).then(function () { window.location = "torbaagirligi.aspx"; });
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
            <label>Torba Ağırlığı</label>
        </div>
        <asp:TextBox ID="txttorbaagirligi" runat="server" CssClass="form-control">

        </asp:TextBox>
    </div>
    <div class="btn-group">
        <asp:Button ID="btnguncelle" CssClass="btn btn-success" runat="server" Text="Güncelle" OnClick="btnguncelle_Click" Height="40px"/>
    </div>

</asp:Content>

