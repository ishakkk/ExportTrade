<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giris.aspx.cs" Inherits="ExternalTrade.Giris" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>NİĞTAŞ A.Ş.</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">
    <!-- Bootstrap Css -->
    <link href="assets/css/bootstrap.min.css" id="bootstrap-stylesheet" rel="stylesheet" type="text/css" />
    <!-- Icons Css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="assets/css/app.min.css" id="app-stylesheet" rel="stylesheet" type="text/css" />
    <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" />
    <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
    <link href="assets/libs/custombox/custombox.min.css" rel="stylesheet" />
    <script src="assets/libs/custombox/custombox.min.js"></script>

    <script type="text/javascript">
        function dangerAlert() {
            swal({
                title: "HATA", text: "Kullanıcı Adı veya Şifre Hatalı", type: "error"
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div data-toggle="modal" data-target=".bs-example-modal-lg">
            <video id="video" style="display: block; width: 100%; height: 100%" autoplay muted loop>
                <source src="Video/film.mp4" type="video/mp4" />
            </video>
        </div>
        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myLargeModalLabel">Giriş</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    </div>
                    <div class="modal-body">
                        <div class="card">

                            <div class="card-body p-4">
                                <div class="text-center mb-4">
                                    <h4 class="text">KULLANICI GİRİŞİ</h4>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="emailaddress">Kullanıcı Adı</label>
                                    <asp:TextBox ID="UserName" runat="server" CssClass="form-control" required="" placeholder="Kullanıcı Adını Giriniz" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                                <div class="form-group mb-3">
                                    <label for="password">Şifre</label>
                                    <asp:TextBox ID="Password" runat="server" CssClass="form-control" placeholder="Şifrenizi Giriniz" required="" TextMode="Password" AutoCompleteType="Disabled"></asp:TextBox>
                                </div>
                                <div class="form-group mb-0 text-center">
                                    <asp:Button ID="btnLogin" runat="server" Text="Giriş" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" Height="40px" />
                                </div>
                            </div>
                            <marquee width="100%" direction="left" height="100px" behavior="alternate">
                                         <h3 style="color:#3f48cc">Niğtaş Pazarlama Departmanı Tarafından Geliştirilmiştir</h3>
                        </marquee>

                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- end page -->
        <!-- Vendor js -->
        <script src="assets/js/vendor.min.js"></script>
        <!-- App js -->
        <script src="assets/js/app.min.js"></script>
    </form>
</body>
</html>
