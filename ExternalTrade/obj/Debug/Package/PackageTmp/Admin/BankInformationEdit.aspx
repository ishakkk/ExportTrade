<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="BankInformationEdit.aspx.cs" Inherits="ExternalTrade.Admin.BankInformationEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Kaydınız Güncellendi", type: "success"
            }).then(function () { window.location = "BankInformation.aspx"; });
        }
    </script>
    <script type="text/javascript">
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Kaydınız Güncellenemedi", type: "error"

            });
        }
    </script>
    <div><label>Banka Adı</label></div>
    <div>
        <asp:TextBox ID="txtbankaadi" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
     <div><label>Iban</label></div>
    <div>
        <asp:TextBox ID="txtIban" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
     <div><label>Account</label></div>
    <div>
        <asp:TextBox ID="txtAccount" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
     <div><label>Swift Code</label></div>
    <div>
        <asp:TextBox ID="txtSwiftCode" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
     <div class="btn-group">
        <asp:Button ID="btnguncelle" CssClass="btn btn-success" runat="server" Text="Güncelle" Height="40px" OnClick="btnguncelle_Click"/>
    </div>
</asp:Content>
