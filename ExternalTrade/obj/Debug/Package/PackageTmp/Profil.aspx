<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Profil.aspx.cs" Inherits="ExternalTrade.Profil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
     <script type="text/javascript">
         function successAlert() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "Bilgileriniz Güncellendi", type: "success"
             }).then(function () { document.getElementById('Button1').click() });
         }
    </script>
    <script type="text/javascript">
        function errorAlert() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Bilgileriniz Güncellenemedi", type: "errro"
            });
        }
    </script>
    

    
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box d-flex align-items-center justify-content-between">
                            <h4 class="page-title">Profilim</h4>

                            <div class="page-title-right">
                               
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
                                     <asp:Button ID="BtnProfil" runat="server" CssClass="btn btn-success" Text="GÜNCELLE" OnClick="BtnProfil_Click" Height="40px"/>
                                  <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="GÜNCELLE" OnClick="Button1_Click" Visible="false" Height="40px"/>
                                    
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

<%--        </div>
        <!-- container-fluid -->

    </div>
 

    </div>--%>
</asp:Content>
