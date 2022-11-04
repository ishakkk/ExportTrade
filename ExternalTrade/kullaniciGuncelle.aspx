<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="kullaniciGuncelle.aspx.cs" Inherits="ExternalTrade.kullaniciGuncelle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<script type="text/javascript">
    function successAlert() {
        swal({
            title: "İŞLEM TAMAMLANDI", text: "Kullanıcı Güncellendi", type: "success"
        }).then(function () { window.location = "kullanicilar.aspx"; });
    }
    </script>
    <script type="text/javascript">
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Kullanıcı Güncellenemedi", type: "error"
            });
        }
    </script>
    <script type="text/javascript">
        function warningAlert() {
            swal({
                title: "HATA", text: "Bu Kullanıcı Değiştirilemez", type: "warning"
            }).then(function () { window.location = "kullanicilar.aspx"; });
        }
    </script>
     <%-- <div class="content-page">
        <div class="content">

            <!-- Start Content-->
            <div class="container-fluid">--%>

                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="page-title">Kullanıcı Güncelle</h4>

                            <div class="page-title-right">
                                <%--                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Forms</a></li>
                                            <li class="breadcrumb-item active">Form Elements</li>
                                        </ol>--%>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-12">
                        <div class="card-box">
                            <!-- <h4 class="header-title">Input Types</h4>
                                    <p class="sub-header">
                                        Most common form control, text-based input fields. Includes support for all HTML5 types: <code>text</code>, <code>password</code>, <code>datetime</code>, <code>datetime-local</code>, <code>date</code>, <code>month</code>, <code>time</code>, <code>week</code>, <code>number</code>, <code>email</code>, <code>url</code>, <code>search</code>, <code>tel</code>, and <code>color</code>.
                                    </p> -->

                            <div class="row">
                                <div class="col-12">
                                    <div class="p-2">
                                       
                                        <div class="form-group row">
                                            <label class="col-md-2 col-form-label" for="simpleinput">Kullanıcı Adı:</label>
                                            <div class="col-md-10">
                                                <asp:TextBox ID="txtKullaniciAdi" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-2 col-form-label" for="simpleinput">Şifre:</label>
                                            <div class="col-md-10">
                                                 <asp:TextBox ID="txtSifre" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                          <div class="form-group row">
                                            <label class="col-md-2 col-form-label" for="simpleinput">Adı:</label>
                                            <div class="col-md-10">
                                                 <asp:TextBox ID="txtAdi" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                          <div class="form-group row">
                                            <label class="col-md-2 col-form-label" for="simpleinput">Soyadı:</label>
                                            <div class="col-md-10">
                                                 <asp:TextBox ID="txtSoyadi" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                         <div class="form-group row">
                                            <label class="col-md-2 col-form-label" for="simpleinput">Yetki:</label>
                                            <div class="col-md-10">
                                                <asp:DropDownList ID="drpYetki" runat="server" CssClass="form-control">
                                                 
                                                </asp:DropDownList>
                                            </div>
                                              
                                        </div>
                                             <div class="form-group row">
                                            <label class="col-md-2 col-form-label" for="simpleinput">Mail:</label>
                                            <div class="col-md-10">
                                               <asp:TextBox ID="txtMail" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                              
                                        </div>
                                              <div class="form-group row">
                                            <label class="col-md-2 col-form-label" for="simpleinput">Aktiflik:</label>
                                            <div class="col-md-10">
                                                <asp:DropDownList ID="drpAktiflik" runat="server" CssClass="form-control">
                                                   <asp:ListItem Text="Aktif"></asp:ListItem>
                                                <asp:ListItem Text="Pasif"></asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                              
                                        </div>
                                     <asp:Button ID="BtnProfil" runat="server" CssClass="btn btn-success" Text="GÜNCELLE" OnClick="BtnProfil_Click" Height="40px" />
                                  
                                    
                                </div>
                            </div>

                        </div>
                        <!-- end row -->

                    </div>
                    <!-- end card-box -->
                </div>

                <!-- end col -->
             
            </div>
            <!-- end row -->



            <!-- end row -->


            <!-- Inline Form -->

            <!-- end row -->


            <!-- Form row -->

            <!-- end row -->

     <%--   </div>
        <!-- container-fluid -->

    </div>
 

    </div>--%>
</asp:Content>
