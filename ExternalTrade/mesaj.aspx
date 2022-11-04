<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mesaj.aspx.cs" Inherits="ExternalTrade.mesaj" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" />
    <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
    <script>
        function success() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Mesaj Gönderildi", type: "success"
            }).then(function () { window.location = 'mesaj.aspx' });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="table table-bordered">
            <tr>
                <td>
                    TEL NO:
                </td>
                <td>
                     <asp:TextBox ID="txtTelNo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                     MESAJ:
                </td>
                <td>
                    <asp:TextBox ID="txtMesaj" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="GÖNDER" OnClick="Button1_Click" CssClass="btn btn-success" />
                </td>
            </tr>
        </table>
        
 
      
       
       
        
        
    </div>
    </form>
</body>
</html>
