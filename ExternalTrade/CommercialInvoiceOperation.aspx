<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommercialInvoiceOperation.aspx.cs" Inherits="ExternalTrade.CommercialInvoiceOperation" %>




<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>NİĞTAŞ A.Ş</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">
   
    <link href="assets/css/bootstrap.min.css" id="bootstrap-stylesheet" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
      <link href="assets/libs/custombox/custombox.min.css" rel="stylesheet">
    <%-- <link href="assets/css/bootstrap.min.css" rel="stylesheet" />--%>
     <link href="assets/libs/custombox/custombox.min.css" rel="stylesheet">
    <!-- Icons Css -->
    <link href="/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" />
    <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
    
    <script src="jquery-3.6.0.min.js"></script>
    <!-- Icons Css -->
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <!-- App Css-->
    <link href="assets/css/app.min.css" id="app-stylesheet" rel="stylesheet" type="text/css" />
    <style>
        /*color-adjust: exact;
-webkit-print-color-adjust: exact;*/
        .cizgi {
            border: groove;
        }

        .btn-warning {
            color: #343a40;
            background-color: #f9c851;
            border-color: #f9c851;
        }

            .btn-warning:hover {
                color: #343a40;
                background-color: #f8bc2c;
                border-color: #f7b820;
            }

            .btn-warning.focus, .btn-warning:focus {
                color: #343a40;
                background-color: #f8bc2c;
                border-color: #f7b820;
                -webkit-box-shadow: 0 0 0 .15rem rgba(219,179,78,.5);
                box-shadow: 0 0 0 .15rem rgba(219,179,78,.5);
            }

            .btn-warning.disabled, .btn-warning:disabled {
                color: #343a40;
                background-color: #f9c851;
                border-color: #f9c851;
            }

            .btn-warning:not(:disabled):not(.disabled).active, .btn-warning:not(:disabled):not(.disabled):active, .show > .btn-warning.dropdown-toggle {
                color: #343a40;
                background-color: #f7b820;
                border-color: #f7b513;
            }

                .btn-warning:not(:disabled):not(.disabled).active:focus, .btn-warning:not(:disabled):not(.disabled):active:focus, .show > .btn-warning.dropdown-toggle:focus {
                    -webkit-box-shadow: 0 0 0 .15rem rgba(219,179,78,.5);
                    box-shadow: 0 0 0 .15rem rgba(219,179,78,.5);
                }

        .btn {
            display: inline-block;
            font-weight: 400;
            color: #6c757d;
            text-align: center;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background-color: transparent;
            border: 1px solid transparent;
            padding: .45rem .9rem;
            font-size: .9rem;
            line-height: 1.5;
            border-radius: .15rem;
            -webkit-transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
            transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
            transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
            transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out,-webkit-box-shadow .15s ease-in-out;
        }

        /*@media (prefers-reduced-motion:reduce) {
            .btn {
                -webkit-transition: none;
                transition: none;
            }
        }*/

        .btn:hover {
            color: #6c757d;
            text-decoration: none;
        }

        .btn.focus, .btn:focus {
            outline: 0;
            -webkit-box-shadow: 0 0 0 .15rem rgba(113,182,249,.25);
            box-shadow: 0 0 0 .15rem rgba(113,182,249,.25);
        }

        .btn.disabled, .btn:disabled {
            opacity: .65;
        }

        .btn:not(:disabled):not(.disabled) {
            cursor: pointer;
        }

        a.btn.disabled, fieldset:disabled a.btn {
            pointer-events: none;
        }


        .auto-style2 {
            width: 136px;
            text-align: center;
        }

        .auto-style5 {
            width: 339px;
            text-align: center;
        }

        .auto-style6 {
            width: 133px;
            text-align: center;
        }

        .auto-style10 {
            width: 147px;
            text-align: center;
        }

        .auto-style11 {
            width: 148px;
            text-align: center;
        }

        .auto-style13 {
            width: 164px;
            text-align: center;
        }

        .sag {
            text-align: right;
        }

        .sol {
            text-align: left;
        }

        .orta {
            text-align: center;
        }

        .renk {
            color: black;
        }

        .kaydiryirmi {
            margin-left: 20px;
        }

        b {
            color: black;
        }

        .auto-style17 {
            width: 319px;
        }

        .yaziboyutu {
            font-size: 12px;
        }

        .baslik {
            font-size: 14px;
        }

        .auto-style18 {
            width: 120px;
        }

        .auto-style1 {
            height: 40px;
        }

        .arkaplannigtas {
            background-image: url(../assets/nigtascorpyeni.jpg);
            width: 1200px;
            height: 1200px;
            height: 1550px;
            width: 1100px;
            margin-left: 20px;
            background-repeat: no-repeat;
            background-size: 1100px 1550px;
            margin-top: 40px;
            background-color: transparent;
        }

        .arkaplanmikrokal {
            background-image: url(../assets/mikrokal.jpg);
            width: 1200px;
            height: 1200px;
            height: 1550px;
            width: 1100px;
            margin-left: 20px;
            background-repeat: no-repeat;
            background-size: 1100px 1550px;
            margin-top: 40px;
            background-color: transparent;
        }
             .arkaplanaskal {
            background-image: url(../assets/askalcorpsayfa.jpg);
            width: 1200px;
            height: 1200px;
            height: 1550px;
            width: 1100px;
            margin-left: 20px;
            background-repeat: no-repeat;
            background-size: 1100px 1550px;
            margin-top: 40px;
            background-color: transparent;
        }
             .pck{
                 height:40px;
                 background-color:blue;
                 color:white;
             }
    </style>
    <script type="text/javascript">
        function printDiv() {
            var originalTitle = document.title;
            document.title = "";


            var printContents = document.getElementById('pdf').innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.title = originalTitle;
            document.body.innerHTML = originalContents;
        }
    </script>
     <script>
         function varisSuccess() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "Varış Limanı Güncellendi", type: "success"
             }).then(function () { window.location = 'CommercialInvoiceOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
}
function varisError() {
    swal({
        title: "İŞLEM TAMAMLANAMADI", text: "Varış Limanı Güncellenemdi", type: "error"
    });
}

         function successTeklifTipi() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "Kaydınız Güncellendi", type: "success"
             }).then(function () { window.location = 'CommercialInvoiceOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
         }
         function errorTeklifTipi() {
             swal({
                 title: "İŞLEM TAMAMLANAMADI", text: "Kaydınız Güncellenemedi", type: "error"
             });
         }
         function successCari() {
             swal({
                 title: "İŞLEM TAMAMLANDI", text: "CARİ BİLGİLERİ GÜNCELLENDİ", type: "success"
             }).then(function () { window.location = 'CommercialInvoiceOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
         }
         function errorCari() {
             swal({
                 title: "İŞLEM TAMAMLANAMADI", text: "CARİ BİLGİLERİ GÜNCELLENEMEDİ", type: "error"
             });
         }
    </script>
    <script>
        function successAlert() {

            swal({
                title: "İŞLEM TAMAMLANDI", text: "KAYDINIZ GÜNCELLENDİ", type: "success"
            }).then(function () { window.location = 'CommercialInvoiceOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
        }
    </script>
     <script>
         function InvoiceNo() {
             swal({
                 title: "DİKKAT", text: "INVOICE BİLGİSİNİ BOŞ GEÇEMEZSİNİZ", type: "warning"
             });
         }
   </script>
     <script>
         function InvoiceDate() {
             swal({
                 title: "DİKKAT", text: "INVOICE DATE BİLGİSİNİ BOŞ GEÇEMEZSİNİZ", type: "warning"
             });
         }
   </script>
      <script>
          function PO() {
              swal({
                  title: "DİKKAT", text: "PO BİLGİSİNİ BOŞ GEÇEMEZSİNİZ", type: "warning"
              });
          }
   </script>
      <script>
          function MoneyText() {
              swal({
                  title: "DİKKAT", text: "Toplam Tutar Değerini Sayıyla Yazmadan İşlem Yapamazsınız", type: "warning"
              });
          }
          function paymentSuccess() {
              swal({
                  title: "İŞLEM TAMAMLANDI", text: "ÖDEME TİPİ GÜNCELLENDİ", type: "success"
              }).then(function () { window.location = 'CommercialInvoiceOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
        }
        function paymentError() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "ÖDEME TİPİ GÜNCELLENEMEDİ", type: "error"
            });
        }

    </script>
         <script>
             function UpdatePOSuccess() {
                 swal({
                     title: "İŞLEM TAMAMLANDI", text: "SPECIAL NOTE BİLGİLERİ GÜNCELLENDİ", type: "success"
                 }).then(function () { window.location = 'CommercialInvoiceOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
             }
             function UpdatePOError() {
                 swal({
                     title: "İŞLEM TAMAMLANAMADI", text: "SPECIAL NOTE BİLGİLERİ GÜNCELLENEMEDİ", type: "error"
                 });
             }
             function UpdateEkipmanSuccess() {
                 swal({
                     title: "İŞLEM TAMAMLANDI", text: "EKİPMAN GÜNCELLENDİ", type: "success"
                 }).then(function () { window.location = 'CommercialInvoiceOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
             }
             function UpdateEkipmanError() {
                 swal({
                     title: "İŞLEM TAMAMLANAMADI", text: "EKİPMAN GÜNCELLENEMEDİ", type: "error"
                 });
             }
             function UpdateHSSuccess() {
                 swal({
                     title: "İŞLEM TAMAMLANDI", text: "HC CODE BİLGİLERİ GÜNCELLENDİ", type: "success"
                 }).then(function () { window.location = 'CommercialInvoiceOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
             }
             function UpdateHSError() {
                 swal({
                     title: "İŞLEM TAMAMLANAMADI", text: "HC CODE  BİLGİLERİ GÜNCELLENEMEDİ", type: "error"
                 });
             }
             function Baslik() {
                 swal({
                     title: "İŞLEM TAMAMLANDI", text: "BAŞLIKLAR GÜNCELLENDİ", type: "success"
                 }).then(function () { window.location = 'CommercialInvoiceOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });

             }
             function BaslikError() {
                 swal({
                     title: "İŞLEM TAMAMLANAMADI", text: "PO BİLGİSİ GÜNCELLENEMEDİ", type: "error"
                 });

             }
             function Banka() {
                 swal({
                     title: "İŞLEM TAMAMLANDI", text: "BANKA GÜNCELLENDİ", type: "success"
                 }).then(function () { window.location = 'CommercialInvoiceOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });

             }
             function BankaError() {
                 swal({
                     title: "İŞLEM TAMAMLANAMADI", text: "BANKA GÜNCELLENEMEDİ", type: "error"
                 });
             }
    </script>
</head>

<body>
    <form id="form1" runat="server">
          <div class="modal fade bs-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-xl">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myExtraLargeModalLabel"></h4>
                                                   
                                                </div>
                                                <div class="modal-body">
                                                     INVOICE NO:
                                                    <div><asp:TextBox ID="txtFaturaNo" runat="server" CssClass="form-control"></asp:TextBox></div>
                                                      INVOICE DATE:
                                                    <div><asp:TextBox ID="txtFaturaTarihi" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></div>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                    <asp:Button ID="btn" runat="server" Text="GÜNCELLE" CssClass="btn btn-success" OnClick="btn_Click"/>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
        <div class="modal fade bs-example-modal-center" id="mdlkalkis" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel2">&nbsp;</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                   PORT OF DELIVERY
                                                    <div>
                                                     <asp:TextBox ID="txtVarisLimani" runat="server" CssClass="form-control"></asp:TextBox>
                                                  
                                                    </div>
                                                    <div>
                                                        <asp:Button ID="Button12" runat="server" CssClass="btn btn-primary" Text="KAYDET" Height="40px" OnClick="Button12_Click" />
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div>
         <div class="modal fade bs-example-modal-center" id="mdlbank" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel2">&nbsp;</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                   BANK INFORMATION
                                                    <div>
                                                     <%--  <asp:DropDownList ID="drpBank" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                                           <select class="form-control select2" name="bank" id="banka">
                                                       <option>---</option>
                                                       <%
                                                          
                                                           string strcon2 = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
                                                           SqlConnection con2 = new SqlConnection(strcon2);
                                                           con2.Open();
                                                           SqlCommand cmdb = new SqlCommand("select b.Id,b.BankName,c.CompanyName,b.CİNSİ   from Banks b inner join Companies c on b.sirket=c.Id order by b.BankName desc", con2);
                                                           SqlDataReader drb = cmdb.ExecuteReader();
                                                           while (drb.Read())
                                                           {%>
                                                               <option value="<%=drb["Id"].ToString() %>" ><%=drb["BankName"].ToString() %>(<%=drb["CompanyName"].ToString()+"  "+drb["CİNSİ"].ToString() %>)</option>
                                                           <%}
                                                           drb.Close();
                                                           con2.Close();
                                                           
                                                        %>
                                                   </select>
                                                    </div>
                                                    <div>
                                                        <asp:Button ID="Button9" runat="server" CssClass="btn btn-primary" Text="KAYDET" Height="40px"  OnClick="Button9_Click" />
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
         <div class="modal fade bs-example-modal-center" id="mdlpayment" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel2">&nbsp;</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                   PAYMENT TERMS
                                                    <div>
                                                     <%--  <asp:DropDownList ID="drpBank" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                                           <select class="form-control select2" name="odemetipi" id="payment">
                                                       <option>---</option>
                                                       <%
                                                          
                                                          SqlConnection con3 = new SqlConnection(strcon2);
                                                           con3.Open();
                                                           SqlCommand cmdpayment= new SqlCommand("select *from Payment", con3);
                                                           SqlDataReader drpayment = cmdpayment.ExecuteReader();
                                                           while (drpayment.Read())
                                                           {%>
                                                               <option value="<%=drpayment["PaymentTerms"].ToString() %>" ><%=drpayment["PaymentTerms"].ToString() %></option>
                                                           <%}
                                                               drpayment.Close();
                                                           con3.Close();
                                                           
                                                        %>
                                                   </select>
                                                    </div>
                                                    <div>
                                                        <asp:Button ID="Button11" runat="server" CssClass="btn btn-primary" Text="KAYDET" Height="40px" OnClick="Button11_Click" />
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div>
          <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" id="po" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel">&nbsp;</h4>
                                                    <div>
                                                      
                                                    </div>
                                                   
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                      <asp:TextBox ID="txtPO" runat="server" CssClass="form-control">

                                                        </asp:TextBox>
                                                     <div>
                                                       <asp:Button ID="btn1" runat="server" CssClass="btn btn-success" Text="KAYDET" OnClick="btn1_Click"/>
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
            <div class="modal fade" id="staticBackdrop" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="staticBackdropLabel">Money Text</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p><asp:TextBox ID="txtMoneyText" runat="server" CssClass="form-control"></asp:TextBox></p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                                                <%--<button type="button" class="btn btn-primary">Save</button>--%>
                                                <asp:Button ID="btnMoneyText" runat="server"  Text="GÜNCELLE" CssClass="btn btn-primary" OnClick="btnMoneyText_Click" />
                                            </div>
                                        </div>
                                        </div>
                                    </div>
          <!-- /.modal -->     <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog"
                                        aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="exampleModalScrollableTitle">SPECIAL NOTE</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                   <div>
                                                       SPECIAL NOTE
                                                       <asp:TextBox ID="txtUpdateSpecialNote" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                                   </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">KAPAT</button>
                                                    <asp:Button ID="btnSpecialNoteUpdate" runat="server" Text="GÜNCELLE" CssClass="btn btn-primary" OnClick="btnSpecialNoteUpdate_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
         
           <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" id="modal2" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel2">&nbsp;</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                   EKİPMAN TÜRÜ
                                                    <div>
                                                        <asp:DropDownList ID="drpEkipman" runat="server" CssClass="form-control">
                                                            <asp:ListItem>20 DV</asp:ListItem>
                                                            <asp:ListItem>40 DV</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>
                                                    <div>
                                                        <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="KAYDET" Height="40px" OnClick="Button2_Click" />
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
            <div class="modal fade" id="exampleModalScrollable2" tabindex="-1" role="dialog"
                                        aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="exampleModalScrollableTitle2">HS CODE</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                 <div>
                                                      HS CODE
                                                      
                                                       <asp:DropDownList ID="drpHSCode" runat="server" CssClass="form-control">
                                                         
                                                       </asp:DropDownList>
                                                   </div>
                                                       <div>
                                                      HS CODE 2
                                                      
                                                       <asp:DropDownList ID="drpHSCode2" runat="server" CssClass="form-control">
                                                         
                                                       </asp:DropDownList>
                                                   </div>
                                                     <div>
                                                      HS CODE 3
                                                      
                                                       <asp:DropDownList ID="drpHSCode3" runat="server" CssClass="form-control">
                                                         
                                                       </asp:DropDownList>
                                                   </div>
                                                     <div>
                                                      HS CODE 4
                                                      
                                                       <asp:DropDownList ID="drpHSCode4" runat="server" CssClass="form-control">
                                                         
                                                       </asp:DropDownList>
                                                   </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">KAPAT</button>
                                                    <asp:Button ID="Button3" runat="server" Text="GÜNCELLE" CssClass="btn btn-primary" OnClick="Button3_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
           <div class="modal fade" id="tekliftipiaciklama" tabindex="-1" role="dialog"
                                        aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-scrollable" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="exampleModalScrollableTitle2">AÇIKLAMA</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                 <div>
                                                      AÇIKLAMA
                                                      
                                                     <asp:TextBox ID="txtTeklifTipiAciklama" runat="server" CssClass="form-control"></asp:TextBox>
                                                   </div>
                                                    
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">KAPAT</button>
                                                    <asp:Button ID="Button10" runat="server" Text="GÜNCELLE" CssClass="btn btn-primary" OnClick="Button10_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
            <!-- /.modal -->
           
    
       <div style="text-align: center;height:10px;">
        <asp:Panel ID="pnl1" runat="server">
            <asp:Button ID="Button1" runat="server" Text="PDF" CssClass="btn btn-warning" OnClick="btnPDF2_Click" BackColor="Orange" ForeColor="White" Height="40px" />
        <a href="OperationCommercialInvoice.aspx" class="btn btn-success" style="height:40px; background-color:green;color:white">ANA SAYFA</a>
            <asp:Button ID="btnPacking" runat="server" Text="PACKING LIST" CssClass="btn btn-primary pck" OnClick="btnPacking_Click" />
          <%-- <a href="PckingListOperation.aspx?teklifno=<%=Request.QueryString["teklifno"] %>" class="btn btn-primary"  style="height:40px; background-color:blue;color:white">PACKING LIST</a>--%>
             </asp:Panel>
   
    </div>
    <div id="pdf">
       
        <%
            if (Request.QueryString["teklifno"] == null)
                Response.Redirect("Home.aspx");
            string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            string[] firma = new string[10];
            string[] baslik = new string[20];
            string[] banka = new string[10];
            string[] fatura = new string[10];
            DateTime fatura2 = new DateTime();
            string[] paket = new string[10];
            string[] baslikdetay = new string[20];
            string[] foot = new string[20];
           
            int kayitsayisi;
            int[] netagirlik = new int[2];
            int[] brutagirlik = new int[2];
            netagirlik[1] = 0;
            brutagirlik[1] = 0;
            int[] konteynersayisi = new int[1];
            SqlCommand konteynersayisicek = new SqlCommand("select  SUM(distinct SiparistekiKonteynerSayisi)  from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            konteynersayisi[0] = Convert.ToInt32(konteynersayisicek.ExecuteScalar());
            SqlCommand agirlikcek = new SqlCommand(" select case when REPLACE(Palet , 'YOK',0) <> 0 then Palet when REPLACE(Palet,'YOK',0) =0 then case when replace(BBAgirligi, 'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi,'YOK',0)=0 then '' end end as UniteAgirlik,case when replace(Palet , 'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when replace(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+30 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end as BrutAgirlik from Orders o  where TeklifNo=@p1", con);
            agirlikcek.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
            SqlDataReader agirlikoku = agirlikcek.ExecuteReader();//sorgu değişti fatihle check yaparken
            while(agirlikoku.Read())
            {
               if(agirlikoku["UniteAgirlik"].ToString()==null ||agirlikoku["UniteAgirlik"].ToString()=="")
               {
                   netagirlik[1] = 0;
                   brutagirlik[1] = 0;
               }
               else
               {
                   netagirlik[0] = netagirlik[0] + Convert.ToInt32(agirlikoku["UniteAgirlik"]);
                   brutagirlik[0] = brutagirlik[0] + Convert.ToInt32(agirlikoku["BrutAgirlik"]);
               }
            }
            
            agirlikoku.Close();
            SqlCommand faturacek = new SqlCommand("select ISNULL(OperationInvoice ,'') as Invoice ,ISNULL(OperationInvoiceDate,'') as InvoiceDate from AllOperationDocuments  where TeklifNo=@p1", con);
            faturacek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader faturaoku = faturacek.ExecuteReader();
            while (faturaoku.Read())
            {
                fatura[0] = faturaoku["Invoice"].ToString();
                fatura2 = Convert.ToDateTime(faturaoku["InvoiceDate"]);
              
                    //if(faturaoku["Invoice"].ToString()=="")
                    //{
                        //SqlCommand faturacek2 = new SqlCommand("SELECT DISTINCT ISNULL(FC.DATE_,'01.01.1900') as Tarih, ISNULL(INV.FICHENO,'') AS fisno FROM     DTBSSRVR.TIGERDB.dbo.LG_219_01_STLINE AS ST LEFT OUTER JOIN DTBSSRVR.TIGERDB.dbo.LG_219_01_INVOICE AS INV ON ST.INVOICEREF = INV.LOGICALREF RIGHT OUTER JOIN DTBSSRVR.TIGERDB.dbo.LG_219_01_ORFICHE AS FC ON ST.ORDFICHEREF = FC.LOGICALREF AND FC.TRCODE = 1 RIGHT OUTER JOIN dbo.Orders AS o ON FC.FICHENO = o.SiparisNo WHERE        (o.TeklifNo =@p1)", con);
                        //faturacek2.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                        //SqlDataReader faturaoku2 = faturacek2.ExecuteReader();
                        //while (faturaoku2.Read())
                        //{
                        //    fatura[0] = faturaoku2["fisno"].ToString();
                        //    fatura[1] = faturaoku2["Tarih"].ToString();
                        //}
                        //SqlCommand guncelle = new SqlCommand("Update AllOperationDocuments set OperationInvoice='" + fatura[0] + "' where TeklifNo='"+Request.QueryString["teklifno"]+"'",con);
                        //guncelle.ExecuteNonQuery();
                        //SqlCommand ck = new SqlCommand("select ISNULL(OperationInvoice ,' ') as Invoice ,ISNULL(OperationInvoiceDate,' ') as InvoiceDate from AllOperationDocuments  where TeklifNo=@p1",con);
                        //ck.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                        //SqlDataReader ckr = ck.ExecuteReader();
                        //while(ckr.Read())
                        //{
                        //    fatura[0] = ckr["Invoice"].ToString();
                        //    fatura[1] = ckr["InvoiceDate"].ToString().Substring(0,10);
                        //}
                        //ckr.Close();
                        //faturaoku2.Close();
                    //}
                    //else
                    //{
                    //    fatura[0] = faturaoku["Invoice"].ToString();
                    //    fatura[1] = faturaoku["InvoiceDate"].ToString().Substring(0,10);
                    //}
                  
               

            }
            faturaoku.Close();
           
            SqlCommand kayit = new SqlCommand("select COUNT(Urun) from Orders where TeklifNo=@p1", con);
            kayit.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            kayitsayisi = Convert.ToInt32(kayit.ExecuteScalar());
            SqlCommand baslikcek = new SqlCommand("select ISNULL(USDKUR,0) as USDKUR,ISNULL(EUROKUR,0) as EUROKUR, Temsilci,MusteriIsmi,IletisimeGecilecekKisi,CurrencyUnit,Parite,Company from Orders where TeklifNo=@p1 group by Temsilci,MusteriIsmi,IletisimeGecilecekKisi,CurrencyUnit,Parite,Company,USDKUR,EUROKUR", con);
            baslikcek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader baslikoku = baslikcek.ExecuteReader();
            while (baslikoku.Read())
            {
                baslik[0] = baslikoku["Temsilci"].ToString();
                baslik[1] = baslikoku["MusteriIsmi"].ToString();
                baslik[2] = baslikoku["IletisimeGecilecekKisi"].ToString();
               
                baslik[4] = baslikoku["CurrencyUnit"].ToString();
                baslik[5] = baslikoku["Parite"].ToString();
                baslik[6] = baslikoku["Company"].ToString();
                baslik[10] = baslikoku["USDKUR"].ToString();
               
            }
            baslikoku.Close();
            SqlCommand baslikcek2 = new SqlCommand("select PO,CommercialInvoiceSpecialNote,OperationInvoice,OperationInvoiceDate,TeklifTipiAciklama,HSCODE,ISNULL(HSCODE2,'') as HSCODE2,ISNULL(HSCODE3,'') as HSCODE3,ISNULL(HSCODE4,'') as HSCODE4 from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            SqlDataReader baslikoku2 = baslikcek2.ExecuteReader();
            while (baslikoku2.Read())
            {
                baslik[8] = baslikoku2["OperationInvoice"].ToString();
                baslik[9] = baslikoku2["OperationInvoiceDate"].ToString();
                baslik[7] = baslikoku2["CommercialInvoiceSpecialNote"].ToString();
                baslik[11] = baslikoku2["HSCODE"].ToString();
                baslik[13] = baslikoku2["HSCODE2"].ToString();
                baslik[14] = baslikoku2["HSCODE3"].ToString();
                baslik[15] = baslikoku2["HSCODE4"].ToString();
                baslik[16] = baslikoku2["TeklifTipiAciklama"].ToString();
                baslik[3] = baslikoku2["PO"].ToString();
            }
            baslikoku2.Close();
            SqlCommand bankacek = new SqlCommand("select b.BankName,b.IBAN,b.Account,b.SwiftCode,b.BranchCode from AllOperationDocuments o left outer join Banks b on o.BankId=b.Id where o.TeklifNo=@p1", con);
            bankacek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader bankaoku = bankacek.ExecuteReader();
            while (bankaoku.Read())
            {
                banka[0] = bankaoku["BankName"].ToString();
                banka[1] = bankaoku["IBAN"].ToString();
                banka[3] = bankaoku["Account"].ToString();
                banka[4] = bankaoku["SwiftCode"].ToString();
                banka[5] = bankaoku["BranchCode"].ToString();
            }
            bankaoku.Close();




    
            int esikdeger = 8;
            int sayac = 0;
            string booking = "";
            string[] bookingnumber = new string[10]; 
            SqlCommand mamulsayisi = new SqlCommand("select COUNT(mamul.NAME) from Orders o left outer join DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] mamul on o.YediyuzluKod=mamul.CODE where o.Durum='SATISA DONDU' and mamul.NAME is not null and o.TeklifNo=@p1", con);
            mamulsayisi.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            sayac = Convert.ToInt32(mamulsayisi.ExecuteScalar());
            sayac = esikdeger - sayac;
            SqlCommand baslikdetaycek = new SqlCommand("select c.Cari as CARİADI ,c.Adres1 as ADRES1,c.Adres2 as ADRES2,c.VergiNo as VERGINO,c.Telno1,c.IlgiliKisi,c.Fax as FAX,c.Mail as EMAIL,c.WebSite as WEBSITE,TaxId_Text,TelNo_Text,Fax_Text,Mail_Text,WebSite_Text,ResponsinblePerson_Text  from CustomerAddress c left outer join Orders o on c.CariKodu=o.MusteriKodu where c.TeklifNo=@p1 group by c.Cari, c.Cari ,c.Adres1,c.Adres2 ,c.VergiNo,c.Telno1,c.IlgiliKisi,c.Fax,c.Mail ,c.WebSite,c.TeklifNo,TaxId_Text,TelNo_Text,Fax_Text,Mail_Text,WebSite_Text,ResponsinblePerson_Text", con);
            baslikdetaycek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader baslikdetayoku = baslikdetaycek.ExecuteReader();
            while (baslikdetayoku.Read())
            {
                baslikdetay[0] = baslikdetayoku["CARİADI"].ToString();
                baslikdetay[1] = baslikdetayoku["ADRES1"].ToString();
                baslikdetay[2] = baslikdetayoku["ADRES2"].ToString();
                baslikdetay[3] = baslikdetayoku["VERGINO"].ToString();
                baslikdetay[4] = baslikdetayoku["TelNo1"].ToString();
                baslikdetay[5] = baslikdetayoku["IlgiliKisi"].ToString();
                baslikdetay[6] = baslikdetayoku["FAX"].ToString();
                baslikdetay[7] = baslikdetayoku["EMAIL"].ToString();
                baslikdetay[8] = baslikdetayoku["WEBSITE"].ToString();
                baslikdetay[9] = baslikdetayoku["TaxId_Text"].ToString();
                baslikdetay[10] = baslikdetayoku["TelNo_Text"].ToString();
                baslikdetay[11] = baslikdetayoku["Fax_Text"].ToString();
                baslikdetay[12] = baslikdetayoku["Mail_Text"].ToString();
                baslikdetay[13] = baslikdetayoku["WebSite_Text"].ToString();
                baslikdetay[14] = baslikdetayoku["ResponsinblePerson_Text"].ToString();
            }
            baslikdetayoku.Close();
            double totalnetagirlik = 0;
            SqlCommand foott = new SqlCommand("select case when Palet<> 'YOK'  then 'PALETLİ' when BBTipi <> 'YOK' and Palet='YOK' then 'BBLİ' end PaletDegil, KonteynerBulkSecimi, REPLACE(REPLACE(o.Vade,'Peşin','CASH IN ADVANCE'),'Gün','DAYS AFTER B/L') as Vade,case when o.KalkisLimani='MIP' Then 'MIP (MERSIN INTERNATIONAL PORT)' when o.KalkisLimani='Limak' then 'ISKENDERUN LIMAK' when KalkisLimani='YOK' then '' else UPPER(KalkisLimani) end as KalkisLimani,UPPER(REPLACE(o.VarisLimani,'YOK','')) as VarisLimani,REPLACE(o.TeklifTipi,'YOK','') as TeklifTipi,CAST(SUM(o.buUrununSiparisTonaji*1000) as decimal(18,0)) as MIKTAR,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int) as Konteyner,case when KalkisLimani='MIP' then '' when KalkisLimani='Limak' then ''   end as Sehir,case  when EkipmanTuru='40 DV' then  CONVERT(nvarchar ,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int))+'X' +' 40 HC' when EkipmanTuru='20 DV' then CONVERT(nvarchar ,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int))+'X' +' 20 DC'  end as Ekipman, case when EkipmanTuru='20 DV' then 20*30 when EkipmanTuru='40 DV' then 40*30 else 0 end as Gross,FobVisible,PaymentTerms  from Orders o where TeklifNo=@p1 group by o.Vade,o.KalkisLimani,o.VarisLimani,o.TeklifTipi,o.EkipmanTuru,FobVisible,KonteynerBulkSecimi,PaymentTerms ,Palet,BBTipi", con);
            foott.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader footer = foott.ExecuteReader();
            while (footer.Read())
            {
                foot[0] = footer["Vade"].ToString();
                foot[1] = footer["KalkisLimani"].ToString();
                foot[2] = footer["VarisLimani"].ToString();
                foot[3] = footer["TeklifTipi"].ToString();
                totalnetagirlik = totalnetagirlik + Convert.ToDouble(footer["MIKTAR"]);
                foot[4] = totalnetagirlik.ToString();
                foot[5] = footer["Konteyner"].ToString();
                foot[6] = footer["Sehir"].ToString();
                foot[7] = footer["Ekipman"].ToString();
                foot[8] = Convert.ToString(Convert.ToDouble(footer["MIKTAR"]) + Convert.ToDouble(footer["Gross"]));
                foot[10] = footer["FobVisible"].ToString();
                foot[13] = footer["PaymentTerms"].ToString();
                foot[14] = footer["KonteynerBulkSecimi"].ToString();
                foot[15] = footer["PaletDegil"].ToString();
            }

            footer.Close();
            SqlCommand foott2 = new SqlCommand("select MoneyText,CommercialInvoiceSpecialNote from AllOperationDocuments where TeklifNo='"+Request.QueryString["teklifno"]+"'",con);
            SqlDataReader footer2 = foott2.ExecuteReader();
            while(footer2.Read())
            {
                foot[9] = footer2["MoneyText"].ToString();
                foot[11] = footer2["CommercialInvoiceSpecialNote"].ToString();
            }
            footer2.Close();
            SqlCommand firmabilgisicek = new SqlCommand("select *from Companies where CompanyName='" + baslik[6] + "'", con);
            SqlDataReader firmabilgisioku = firmabilgisicek.ExecuteReader();
            while (firmabilgisioku.Read())
            {
                firma[0] = firmabilgisioku["CompanyName"].ToString();
                firma[1] = firmabilgisioku["Address1"].ToString();
                firma[2] = firmabilgisioku["Address2"].ToString();
                firma[3] = firmabilgisioku["TelNo1"].ToString();
                firma[4] = firmabilgisioku["TelNo2"].ToString();
                firma[5] = firmabilgisioku["Fax"].ToString();
                firma[6] = firmabilgisioku["Mail"].ToString();
                firma[7] = firmabilgisioku["VergiNo"].ToString();
                firma[8] = firmabilgisioku["WebAdress"].ToString();
            }
            firmabilgisioku.Close();
           
           
            string kontipi = "";
            SqlCommand kontipicek = new SqlCommand("select KonsimentoEdit from AllOperationDocuments where TeklifNo=@p1",con);
            kontipicek.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
            kontipi = Convert.ToString(kontipicek.ExecuteScalar());
            string email = "";
            SqlCommand emailcek = new SqlCommand("select  u.Email  from AllOperationDocuments o left outer join Users u on o.CommercialInvoiceOlusturan=u.Id where o.TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            email = Convert.ToString(emailcek.ExecuteScalar());
            SqlCommand vadecek = new SqlCommand("select Vade from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "' group by Vade", con);
            SqlCommand kalemsayisicek = new SqlCommand("select COUNT(distinct Urun) from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            int kalemsayisi = Convert.ToInt32(kalemsayisicek.ExecuteScalar());
            int brutagirlik_1 = 0;
            SqlCommand gonder = new SqlCommand("Operation_TotalWeight", con);
            gonder.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
            gonder.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter daa = new SqlDataAdapter();
            daa.SelectCommand = gonder;
            DataTable dtt = new DataTable();
            daa.Fill(dtt);
            foreach (DataRow dr in dtt.Rows)
            {
                brutagirlik_1 = brutagirlik_1 + Convert.ToInt32(dr["brut"]);
            }
            int paketsayisi = 0;
            string pakettipi10 = "";
            SqlCommand paketvetipi = new SqlCommand("Operation_NoOfPackage", con);
            paketvetipi.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
            paketvetipi.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter pt = new SqlDataAdapter();
            pt.SelectCommand = paketvetipi;
            DataTable pttipi = new DataTable();
            pt.Fill(pttipi);
            foreach (DataRow dr in pttipi.Rows)
            {
                //paketsayisi = paketsayisi + Convert.ToInt32(dr["PAKET"]);
                pakettipi10 = dr["PAKETTIPI"].ToString();
            }

            string navlun = "";
            SqlCommand navlunbuldolar = new SqlCommand("select convert(varchar,FORMAT(ROUND(SUM(cast((buUrununSiparisTonaji) as decimal(18,3))*(round(o.KalemSatisFiyati,3)))-SUM(cast((buUrununSiparisTonaji) as decimal(18,3))*(round(o.FobSatisFiyati,3))),2),'###,###,###.00','de-de')) as NAVLUN from Orders o where TeklifNo='"+Request.QueryString["teklifno"]+"'", con);
            navlun = Convert.ToString(navlunbuldolar.ExecuteScalar());


            string navluntl = "";
            SqlCommand navlunbultl = new SqlCommand("select convert(varchar,FORMAT(ROUND(SUM(cast((buUrununSiparisTonaji) as decimal(18,3))*(round(o.KalemSatisFiyati*@p1,3)))-SUM(cast((buUrununSiparisTonaji) as decimal(18,3))*(round(o.FobSatisFiyati*@p1,3))),2),'###,###,###.00','de-de')) as NAVLUN from Orders o where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            navlunbultl.Parameters.AddWithValue("@p1", Convert.ToDouble(baslik[10]));
            navluntl = Convert.ToString(navlunbultl.ExecuteScalar());

            string navluneuro = "";
            SqlCommand navluncekeuro = new SqlCommand("select convert(varchar,FORMAT(((SUM(buUrununSiparisTonaji*KalemSatisFiyati)-SUM(buUrununSiparisTonaji*FobSatisFiyati))/@p1),'###,###,###.00','de-de')) from Orders o where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            navluncekeuro.Parameters.AddWithValue("@p1", Math.Round(Convert.ToDouble(baslik[5]),3));
            navluneuro = Convert.ToString(navluncekeuro.ExecuteScalar());
            SqlConnection.ClearPool(con);
            double totalfiyat = 0;
              %>

        <%
            if(kalemsayisi<=8)
            {%>
                 <table  class=<%if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ")
                       {%> "arkaplannigtas" <%}
                                 else if (baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                       {%> "arkaplanmikrokal" <%}
                                 else if (baslik[6] == "ASKAL LTD.ŞTİ.")
                       {%> "arkaplanaskal" <%}   
             %>>
               <%
                if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ" || baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                {%>
                        <tr style="height: 180px;">
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
                else
                {%>
                        <tr style="height: 100px;">
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
            %>
                      <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myModalLabel">CARİ BİLGİLERİ</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                   <div>
                                                      ADRES 1:
                                                       <asp:TextBox ID="txtAdres1" runat="server" CssClass="form-control"></asp:TextBox>
                                                   </div>
                                                     <div>
                                                      ADRES 2:
                                                       <asp:TextBox ID="txtAdres2" runat="server" CssClass="form-control"></asp:TextBox>
                                                   </div>
                                                    <div>
                                                        <%= baslikdetay[9] %>
                                                        <asp:TextBox ID="txtVergiNo" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                   
                                                    <div>
                                                        <%=baslikdetay[10] %> :
                                                        <asp:TextBox ID="txtTelNo1" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                    <div>
                                                        <%= baslikdetay[14] %>:
                                                        <asp:TextBox ID="txtResponsiblePerson" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                            
                                                      <div>
                                                        <%=baslikdetay[12] %> :
                                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>
                                                      <div>
                                                        <%=baslikdetay[13] %>:
                                                        <asp:TextBox ID="txtWebSite" runat="server" CssClass="form-control"></asp:TextBox>
                                                    </div>

                                                   
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-light waves-effect" data-dismiss="modal">KAPAT</button>
                                                   <asp:Button ID="btnCari" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="btnCari_Click" />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div>
                       <div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" >BAŞLIK DEĞİŞTİR</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                    <div>
                                                        <%=baslikdetay[9] %> REPLACE
                                                        <asp:DropDownList ID="drp1" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                
                                                   
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-light waves-effect" data-dismiss="modal">KAPAT</button>
                                                   <asp:Button ID="Button4" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button4_Click" />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
                     
           <div id="myModal3" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" >BAŞLIK DEĞİŞTİR</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                
                                                      <div>
                                                        <%=baslikdetay[10] %> REPLACE
                                                        <asp:DropDownList ID="drp2" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                  
                                                   
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-light waves-effect" data-dismiss="modal">KAPAT</button>
                                                   <asp:Button ID="Button5" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button5_Click"/>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
           <div id="myModal4" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" >BAŞLIK DEĞİŞTİR</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                  
                                                     <div>
                                                         <%=baslikdetay[12] %> REPLACE
                                                        <asp:DropDownList ID="drp3" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                     
                                                   
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-light waves-effect" data-dismiss="modal">KAPAT</button>
                                                   <asp:Button ID="Button6" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button6_Click" />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
           <div id="myModal5" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" >BAŞLIK DEĞİŞTİR</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                
                                                       <div>
                                                         <%=baslikdetay[13] %> REPLACE
                                                        <asp:DropDownList ID="drp4" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                    
                                                   
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-light waves-effect" data-dismiss="modal">KAPAT</button>
                                                   <asp:Button ID="Button7" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button7_Click" />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
           <div id="myModal6" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title">BAŞLIK DEĞİŞTİR</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                                                                
                                                    
                                                    
                                                      <div>
                                                         <%=baslikdetay[14] %> REPLACE:
                                                        <asp:DropDownList ID="drp5" runat="server" CssClass="form-control"></asp:DropDownList>
                                                    </div>
                                                   
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-light waves-effect" data-dismiss="modal">KAPAT</button>
                                                   <asp:Button ID="Button8" runat="server" Text="KAYDET" CssClass="btn btn-primary"  OnClick="Button8_Click" />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
        
            <tr>
                <td colspan="6" style="text-align: center; font-size: 40px;height:40px; " class="auto-style1"><span style="text-align: center;"><b>COMMERCIAL INVOICE</b></span></td>
            </tr>
              <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <%=fatura[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" style="height:15px;" ><span class="kaydiryirmi"><b> <%=fatura2.ToShortDateString() %></b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></a></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#po"> PO :<%=baslik[3] %></a></b></span></td>
                   
                  
                   </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="3" class="cizgi orta" style="width:600px;height:25px;"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal"><b>CUSTOMER</b><a></a></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %></b> </span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span> </td>      
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> <a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><%=baslikdetay[9] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[4] %></b></td>
            </tr>
            
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none"><%=firma[8] %></a> </b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b > <%=baslikdetay[5] %></b></td>
            </tr>
                
              
              
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
              
             <%
                if (baslik[4] == "$")
                {
                    
                    %>
            <tr>

                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (USD/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (USD)</b></td>
            </tr>

            <%

                    if(foot[10]=="False")
                    {
                        int kayitsira = 1;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_USD", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);


                        foreach (DataRow dr in dt.Rows)
                    {%>
                    
                       <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }


                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" class="cizgi" ><b><%=i.ToString() %></b></td>
                <td style="text-align: center; width: 500px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" class="cizgi">&nbsp;</td>
            </tr>
                <%}
                    }
                    else if(foot[10]=="True")
                    {
                       
                        int kayitsira = 1;
                        SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_UDS_Header", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> &nbsp;</td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;"><b> <%=i.ToString() %></b></td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                          SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_USD", con);
                          fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                          fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                          fobhesabi.CommandType = CommandType.StoredProcedure;

                          SqlDataAdapter da2 = new SqlDataAdapter();
                          da2.SelectCommand = fobhesabi;
                          DataTable dt2 = new DataTable();
                          da2.Fill(dt2);
                          foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                        <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>$</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> TOTAL FREIGHT</b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> &nbsp;</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=navlun %>$</b></td>
                       </tr>    
                        <%}
                        

                    }
                
             %>
            <%
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_USD", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                    foreach (DataRow dr2 in dt3.Rows)
                    {%>
            <tr>
                <td colspan="2" class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE &nbsp;</b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" colspan="3"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" ><span ><b> $<%=String.Format("{0:0,0}",dr2["TotalFiyat"]) %></b></span></td>
            </tr>
           <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                   

            %>

            <%}
                 else  if (baslik[4] == "TL")
                {%>
                  
            <tr>

                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (TL/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (TL)</b></td>
            </tr>

            <%

                    if(foot[10]=="False")
                    {
                        int kayitsira = 1;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_TL", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                        //cmd.Parameters.AddWithValue("")
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);


                        foreach (DataRow dr in dt.Rows)
                    {%>
                    
                       <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>₺</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira; totalfiyat = totalfiyat + Convert.ToDouble(dr["Total2"]);
                    }


                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" class="cizgi" ><b><%=i.ToString() %></b></td>
                <td style="text-align: center; width: 500px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" class="cizgi">&nbsp;</td>
            </tr>
                <%}
                    }
                    else if(foot[10]=="True")
                    {
                        
                        int kayitsira = 1;
                        SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_TL_Header", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>₺</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;"><b> <%=i.ToString() %></b></td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                          SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_TL", con);
                          fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                          fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                          fobhesabi.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                          fobhesabi.CommandType = CommandType.StoredProcedure;

                          SqlDataAdapter da2 = new SqlDataAdapter();
                          da2.SelectCommand = fobhesabi;
                          DataTable dt2 = new DataTable();
                          da2.Fill(dt2);
                          foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                        <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>₺</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> TOTAL FREIGHT</b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> &nbsp;</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=navluntl %>₺</b></td>
                       </tr>    
                        <%}
                        
                    
                    }
                
             %>
            <%
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_TL", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[10]));
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                    foreach (DataRow dr2 in dt3.Rows)
                    {%>
            <tr>
                <td colspan="2" class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE &nbsp;</b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" colspan="3"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" ><span ><b> ₺<%=totalfiyat.ToString("n2") %></b></span></td>
            </tr>
           <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                   

            %>

            <%
                }
                else if (baslik[4] == "€")
                {%>
            <tr>
                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (EUR/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (EUR)</b></td>
            </tr>
            <%
                if(foot[10]=="False")
                {
                    int sira = 1;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_EUR", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>

                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=sira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>

                        </tr>
                        <%
                        sira++; Session["ks"] = sira;
                    }
                   
                                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
   <tr>

                <td  style="text-align: center; width: 50px;height:15px;" class="cizgi"><b><%=i.ToString() %></b> </td>
                <td  style="text-align: center; width: 500px;height:15px;" class="cizgi">&nbsp;</td>
                <td  style="text-align: center; width: 50px;height:15px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:15px;" class="cizgi">&nbsp;</td>
                <td  style="text-align: center; width: 200px;height:15px;" class="cizgi">&nbsp;</td>
                <td  style="text-align: center; width: 250px;height:15px;" class="cizgi">&nbsp;</td>
            </tr>
                <%}

                }
                
                  else if(foot[10]=="True")
                {
                    int sira = 1;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_EUR_Header", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {
                        double a = Convert.ToDouble(dr["KalemSatisFiyati"]);
                        
                        %>
                        <tr>

                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=sira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                        
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>

                        </tr>
                        <%
                        sira++;
                        Session["ks"] = sira;
                    }
                     for (int i = Convert.ToInt32(Session["ks"]); i <= 8;i++ )
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;" ><b><%=i.ToString() %></b></td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}
                    double[] total = new double[2];
                    SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_EUR", con);
                    fobhesabi.Parameters.AddWithValue("@teklifNo", Request.QueryString["teklifno"]);
                    fobhesabi.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                    fobhesabi.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da2 = new SqlDataAdapter();
                    da2.SelectCommand = fobhesabi;
                    DataTable dt2 = new DataTable();
                    da2.Fill(dt2);
                   
                    
                    foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                       <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>€</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b>TOTAL FREIGHT</b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> &nbsp;</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=navluneuro %>€</b></td>
                       </tr>    
                        <%
                            total[0] = Convert.ToDouble(fobhesabioku["FobFiyatTotal"]);
                            total[1] = Convert.ToDouble(navluneuro);
                        }
                        
                 
                } 
            %>
            <%
                SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_EUR", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                SqlDataAdapter da3 = new SqlDataAdapter();
                da3.SelectCommand = cmd2;
                DataTable dt3 = new DataTable();
                da3.Fill(dt3);
                foreach (DataRow dr2 in dt3.Rows)
                {%>
            <tr>
                <td colspan="2" class="cizgi" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b> TOTAL VALUE&nbsp;</b></span></td>
                <td class="cizgi" style="text-align: center;height:20px;" colspan="3"><span style="text-align: center"><b> <%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi" style="text-align:center;height:20px;"><span><b> <%=dr2["TotalFiyat"].ToString() %>€</b></span></td>
            </tr>
          <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;" data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            
          
            <%}
            %>

            <%}
            
         
            
                
                        
             
                     
            %>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PACKING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3">
                  <%
                SqlCommand pakettipi = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when REPLACE(Palet,'YOK',0)=0 then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when REPLACE(Palet,'YOK',0)=0 then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where TeklifNo=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                      pakettipi.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                      SqlDataAdapter da4 = new SqlDataAdapter();
                      da4.SelectCommand = pakettipi;
                      DataTable dt4 = new DataTable();
                      da4.Fill(dt4);
                     foreach(DataRow p in dt4.Rows)
                      {%>
                          <span><b><%=p["Torba"].ToString() %>&nbsp;&nbsp;<%=p["UniteAgirlik"].ToString() +"KGS"%>&nbsp;&nbsp;<%=p["BigBag"].ToString() %>&nbsp;<%=p["Palet"].ToString() %>&nbsp;<%=p["Strec"].ToString() %>&nbsp;(<%=p["PaketSayisi"].ToString() %> PCS)</b></span>  
                          <br />
                     
                   <%
                          paketsayisi = paketsayisi + Convert.ToInt32(p["PaketSayisi"]);
                   }
                 %>
              </td>
                 <td class="cizgi orta yaziboyutu" style="height:15px;" colspan="2"><b><span><a href="#" style="color:black;" data-toggle="modal" data-target="#exampleModalScrollable">SPECIAL NOTES</a></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">UNIT WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3">
                  <%
                SqlCommand unit = new SqlCommand("select  case when Palet <> 'YOK' then Palet  when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi  when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik, case when  KonteynerBulkSecimi <> 'RORO' then   case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end else  case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end end as Brut from Orders where TeklifNo=@p1 group by Palet,BBTipi,BBAgirligi,Ulke,KonteynerBulkSecimi", con);
                      unit.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                      SqlDataAdapter da5 = new SqlDataAdapter();
                      da5.SelectCommand = unit;
                      DataTable dt5 = new DataTable();
                      da5.Fill(dt5);
                      
                      foreach(DataRow un in dt5.Rows)
                      {%>
                          <span><b>&nbsp;<%=un["UniteAgirlik"].ToString()%>&nbsp;KGS NET WEIGHT</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><b><%=un["Brut"].ToString() %> KGS GROSS WEIGHT</b></span>
                          <br />
                      <%}                                                        
                                                                                  
                  %></td>
                 <td class="cizgi yaziboyutu" colspan="2" rowspan="10" style="vertical-align:top;word-break:break-all;"><b><span ><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%"><%=foot[11]%></textarea></span></b></td>
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">TOTAL WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[4] %> KGS NET WEIGHT</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;       
                    
             
            
                   <span><b><%=brutagirlik_1%>&nbsp;KGS GROSS WEIGHT</b></span>


              </td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF PACKAGE</span></b></td>
            <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=paketsayisi %>&nbsp;PCS</span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#modal2">NO OF FCL</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[7] %></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">
<a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#mdlpayment">PAYMENT TERMS</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[13] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ORIGIN</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span>TÜRKİYE</span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#mdlkalkis">PORT OF DELIVERY</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[1] %>/TÜRKİYE</span></b></td>
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi">PORT OF DELIVERY</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[2] %></span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#tekliftipiaciklama">DELIVERY TERMS</a> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[3] %>/<%=baslik[16] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#exampleModalScrollable2">HS CODE</a></span></b></td>
              <td class="kaydiryirmi cizgi yaziboyutu" colspan="3" style="height:15px;"><b><span><%=baslik[11] %>
                       <%
                if (baslik[13] != "")
                {%>
                    &nbsp;/<%=baslik[13] %>
                <%}
                   if (baslik[14] != "")
                {%>
                    &nbsp;/<%=baslik[14] %>
                <%}
                    if (baslik[15] != "")
                {%>
                    &nbsp;/<%=baslik[15] %>
                <%}
                      
                  %>
                                                                                           </span></b></td>
            </tr>
                  <tr>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="4"><b><span class="kaydiryirmi">BANK DETAILS</span></b></td>
                       <td class="cizgi yaziboyutu orta" colspan="2" rowspan="6"><b><span class="kaydiryirmi"><asp:Image ID="img_yeri" runat="server" /></span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">BENEFICARY</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"> <b><span><%=baslik[6] %></span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#mdlbank">OUR BANK</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=banka[0] %>&nbsp;NIGDE BRANCH CODE (<%=banka[5] %>)</span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ACCOUNT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[3] %></span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">IBAN</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[1] %></span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">SWIFT CODE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[4] %></span> </b></td>
            </tr>
             <tr>
                 <td class="cizgi orta yaziboyutu" colspan="2" style="height:120px; vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
                   <td class="cizgi orta yaziboyutu" colspan="4" style="height:120px;vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
             </tr>
        </table>
            <%}
            else if (kalemsayisi > 8 && kalemsayisi <= 16)
            {%>
                <table class=<%if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ")
                       {%> "arkaplannigtas" <%}
                               else if (baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                       {%> "arkaplanmikrokal" <%}
                               else if (baslik[6] == "ASKAL LTD.ŞTİ.")
                       {%> "arkaplanaskal" <%}                     
                            %>>
               <%
                if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ" || baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                {%>
                        <tr style="height: 180px;">
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
                else
                {%>
                        <tr style="height: 100px;">
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
            %>
            <tr>
                <td colspan="6" style="text-align: center; font-size: 40px;height:40px; " class="auto-style1"><span style="text-align: center;"><b>COMMERCIAL INVOICE</b></span></td>
            </tr>
               <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <%=fatura[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" style="height:15px;" ><span class="kaydiryirmi"><b> <%=fatura2.ToShortDateString() %></b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></a></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#po"> PO :<%=baslik[3] %></a></b></span></td>
                   
                  
                   </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="3" class="cizgi orta" style="width:600px;height:25px;"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal"><b>CUSTOMER</b><a></a></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %></b> </span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span> </td>      
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> <a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><%=baslikdetay[9] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[4] %></b></td>
            </tr>
            
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none"><%=firma[8] %></a> </b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b > <%=baslikdetay[5] %></b></td>
            </tr>
                
                
              
              
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
              
             <%
                if (baslik[4] == "$")
                {%>
            <tr>

                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (USD/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (USD)</b></td>
            </tr>

            <%

                    if(foot[10]=="False")
                    {
                        int kayitsira = 1;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_USD_1_8", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);


                        foreach (DataRow dr in dt.Rows)
                    {%>
                    
                       <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>

                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }


                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" class="cizgi" ><%=i.ToString() %></td>
                <td style="text-align: center; width: 500px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" class="cizgi">&nbsp;</td>
            </tr>
                <%}
                    }
                    else if(foot[10]=="True")
                    {
                        int kayitsira = 1;
                        SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_UDS_Header_1_8", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                    }
                          for (int i = 1; i <= 2;i++ )
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                          SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_USD_1_8", con);
                          fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                          fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                          fobhesabi.CommandType = CommandType.StoredProcedure;

                          SqlDataAdapter da2 = new SqlDataAdapter();
                          da2.SelectCommand = fobhesabi;
                          DataTable dt2 = new DataTable();
                          da2.Fill(dt2);
                          foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                     <%--   <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>$</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["VarisLimani"].ToString() %></b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Navlun"].ToString() %>$</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["CFRMALIYET"].ToString() %>$</b></td>
                       </tr>    --%>
                        <%}
                        
                        for (int i = 1; i <= sayac-3; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                
             %>
            <%
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_USD", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                    foreach (DataRow dr2 in dt3.Rows)
                    {%>
           <%-- <tr>
                <td colspan="2" class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE <%=foot[3] %> <%=foot[1] %></b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" colspan="3"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" ><span ><b> $<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>--%>
            <%}
                   

            %>

            <%}
                 else  if (baslik[4] == "TL")
                {
                     %>
                  
            <tr>

                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (TL/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (TL)</b></td>
            </tr>

            <%

                    if(foot[10]=="False")
                    {
                        int kayitsira = 1;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_TL_1_8", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                        //cmd.Parameters.AddWithValue("")
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);


                        foreach (DataRow dr in dt.Rows)
                    {%>
                    
                       <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>₺</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira; totalfiyat = totalfiyat + Convert.ToDouble(dr["Total2"]);
                    }


                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" class="cizgi" ><b><%=i.ToString() %></b></td>
                <td style="text-align: center; width: 500px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" class="cizgi">&nbsp;</td>
            </tr>
                <%}
                    }
                    else if(foot[10]=="True")
                    {
                        int kayitsira = 1;
                        SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_TL_Header_1_8", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>₺</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira; totalfiyat = totalfiyat + Convert.ToDouble(dr["Total2"]);
                    }
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;"><b> <%=i.ToString() %></b></td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                          SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_TL_1_8", con);
                          fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                          fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                          fobhesabi.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                          fobhesabi.CommandType = CommandType.StoredProcedure;

                          SqlDataAdapter da2 = new SqlDataAdapter();
                          da2.SelectCommand = fobhesabi;
                          DataTable dt2 = new DataTable();
                          da2.Fill(dt2);
                          foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                       <%-- <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>₺</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["VarisLimani"].ToString() %></b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Navlun"].ToString() %>₺</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["CFRMALIYET"].ToString() %>₺</b></td>
                       </tr>    --%>
                        <%}
                        
                        for (int i = 1; i <= sayac-3; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                
             %>
            <%
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_TL", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[10]));
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                    foreach (DataRow dr2 in dt3.Rows)
                    {%>
         <%--   <tr>
                <td colspan="2" class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE <%=foot[3] %> <%=foot[1] %></b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" colspan="3"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" ><span ><b> ₺<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>--%>
            <%}
                   

            %>

            <%
                }
                
                
                
                
                
                
                else if (baslik[4] == "€")
                {%>
            <tr>
                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (EUR/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (EUR)</b></td>
            </tr>
            <%
                if(foot[10]=="False")
                {
                    int sira = 1;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_EUR_1_8", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>

                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=sira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>

                        </tr>
                        <%
                        sira++;
                        Session["ks"] = sira;
                    }
                   
                                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
   <tr>

                <td  style="text-align: center; width: 50px;" class="cizgi"><b> <%=i.ToString() %></b></td>
                <td  style="text-align: center; width: 500px;" class="cizgi">&nbsp;</td>
                <td  style="text-align: center; width: 50px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 150px;" class="cizgi">&nbsp;</td>
                <td  style="text-align: center; width: 200px;" class="cizgi">&nbsp;</td>
                <td  style="text-align: center; width: 250px;" class="cizgi">&nbsp;</td>
            </tr>
                <%}

                }
                
                  else if(foot[10]=="True")
                {
                    int sira = 1;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_EUR_Header_1_8", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>

                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=sira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>

                        </tr>
                        <%
                        sira++;

                    }
                                              for (int i = 1; i <= 2;i++ )
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                    SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_EUR_1_8", con);
                    fobhesabi.Parameters.AddWithValue("@teklifNo", Request.QueryString["teklifno"]);
                    fobhesabi.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                    fobhesabi.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da2 = new SqlDataAdapter();
                    da2.SelectCommand = fobhesabi;
                    DataTable dt2 = new DataTable();
                    da2.Fill(dt2);

                    foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                      <%-- <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>€</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["VarisLimani"].ToString() %></b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Navlun"].ToString() %>€</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["CFRMALIYET"].ToString() %>€</b></td>
                       </tr>    --%>
                        <%}
                        
                        for (int i = 1; i <= sayac; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                } 
            %>
            <%
                SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_EUR", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                SqlDataAdapter da3 = new SqlDataAdapter();
                da3.SelectCommand = cmd2;
                DataTable dt3 = new DataTable();
                da3.Fill(dt3);
                foreach (DataRow dr2 in dt3.Rows)
                {%>
            <%--<tr>
                <td colspan="2" class="cizgi"><span style="text-align: center; margin-left: 40px; height:20px;"><b> TOTAL VALUE <%=foot[3] %> <%=foot[1] %></b></span></td>
                <td class="cizgi" style="text-align: center; height:20px;" colspan="3"><span style="text-align: center"><b> <%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi" style="text-align:center;height:20px;"><span><b> <%=dr2["TotalFiyat"].ToString() %>€</b></span></td>
            </tr>
          <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;" data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>--%>
            
          
            <%}
            %>

            <%}
            
         
            
                
                        
             
                     
            %>
       <%
                for (int i = 0; i <= 20; i++)
                {%>
                    <tr>
                          <td colspan="8">&nbsp;</td>
                    </tr>
                <%}
           
       %>
        </table>


        <p style="page-break-before: always;">&nbsp;</p>

        <table class=<%if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ")
                       {%> "arkaplannigtas" <%}
                       else if (baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                       {%> "arkaplanmikrokal" <%}
                       else if (baslik[6] == "ASKAL LTD.ŞTİ.")
                       {%> "arkaplanaskal" <%}                     
                            %>>
               <%
                if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ" || baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                {%>
                        <tr style="height: 180px;">
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
                else
                {%>
                        <tr style="height: 100px;">
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
            %>
            <tr>
                <td colspan="6" style="text-align: center; font-size: 40px;height:40px; " class="auto-style1"><span style="text-align: center;"><b>COMMERCIAL INVOICE</b></span></td>
            </tr>
              <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <%=fatura[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" style="height:15px;" ><span class="kaydiryirmi"><b> <%=fatura2.ToShortDateString() %></b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></a></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#po"> PO :<%=baslik[3] %></a></b></span></td>
                   
                  
                   </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="3" class="cizgi orta" style="width:600px;height:25px;"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal"><b>CUSTOMER</b><a></a></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %></b> </span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span> </td>      
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> <a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><%=baslikdetay[9] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[4] %></b></td>
            </tr>
            
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none"><%=firma[8] %></a> </b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b > <%=baslikdetay[5] %></b></td>
            </tr>
                
              
              
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
              
             <%
                if (baslik[4] == "$")
                {%>
            <tr>

                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (USD/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (USD)</b></td>
            </tr>

            <%

                    if(foot[10]=="False")
                    {
                        int kayitsira = 9;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_USD_9_16", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);


                        foreach (DataRow dr in dt.Rows)
                    {%>
                    
                       <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
                        SqlCommand sws = new SqlCommand("with myReslt(sira)as(select ROW_NUMBER() OVER( order by UrunAnaGrup ) as sira from Orders o  where o.TeklifNo='"+Request.QueryString["teklifno"]+"' group by o.Urun,o.KalemSatisFiyati,o.UrunAnaGrup)select COUNT(*) from myReslt where sira between 9 and 17", con);
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 18-Convert.ToInt32(sws.ExecuteScalar()); i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                          
                            for (int i = 1; i <= sayac; i++)
                            {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                    else if(foot[10]=="True")
                    {
                        int kayitsira = 9;
                        SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_UDS_Header_9_16", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
                        SqlCommand sws2 = new SqlCommand("with myReslt(sira,Aciklama,Urun,buUrununSiparisTonaji,KalemSatisFiyati,TotalFiyat)as(select ROW_NUMBER() OVER( order by UrunAnaGrup ) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama, o.Urun,CONVERT(varchar, FORMAT(CAST(SUM(buUrununSiparisTonaji) as decimal(18,3)),'###,###,###.00','de-de')) as buUrununSiparisTonaji,CONVERT(varchar,FORMAT(CAST(KalemSatisFiyati as decimal(18,3)),'###,###,###.00','de-de')) as KalemSatisFiyati, CONVERT(varchar,FORMAT(CAST(SUM(buUrununSiparisTonaji)*(KalemSatisFiyati) as decimal(18,3)),'###,###,###.00','de-de')) as TotalFiyat from Orders o  where o.TeklifNo='" + Request.QueryString["teklifno"] + "' group by o.Urun,o.KalemSatisFiyati,o.UrunAnaGrup)select COUNT(*) from myReslt where sira between 9 and 17", con);
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 18 - Convert.ToInt32(sws2.ExecuteScalar()); i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                   
                          for (int i = 1; i <= 2;i++ )
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                        SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_USD_9_16", con);
                          fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                          fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                          fobhesabi.CommandType = CommandType.StoredProcedure;

                          SqlDataAdapter da2 = new SqlDataAdapter();
                          da2.SelectCommand = fobhesabi;
                          DataTable dt2 = new DataTable();
                          da2.Fill(dt2);
                          foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                        <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>$</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> TOTAL FREIGHT</b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b>&nbsp;</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=navlun %>$</b></td>
                       </tr>    
                        <%}
                        
                        for (int i = 1; i <= sayac-3; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                
             %>
            <%
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_USD", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                    foreach (DataRow dr2 in dt3.Rows)
                    {%>
            <tr>
                <td colspan="2" class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE &nbsp;</b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" colspan="3"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" ><span ><b> $<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                   

            %>

            <%}
                 else  if (baslik[4] == "TL")
                {
                    if (foot[10] == "False")
                    {%>
                        <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(TL/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(TL)</b></td>
                        </tr>
                    <%
                        int kayitsira = 9;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_TL_9_16", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                       foreach(DataRow dr in dt.Rows)
                        {%>
                        <tr>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>₺</b></td>
                       </tr>
                        <%
                            kayitsira++;
                            Session["ks"] = kayitsira; totalfiyat = totalfiyat + Convert.ToDouble(dr["Total2"]);
                        }
                       //SqlCommand sws3 = new SqlCommand("with myReslt(sira,Aciklama,Urun,buUrununSiparisTonaji,KalemSatisFiyati,TotalFiyat)as(select ROW_NUMBER() OVER( order by UrunAnaGrup ) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama, o.Urun,CONVERT(varchar, FORMAT(CAST(SUM(buUrununSiparisTonaji) as decimal(18,3)),'###,###,###.00','de-de')) as buUrununSiparisTonaji,CONVERT(varchar,FORMAT(CAST(KalemSatisFiyati as decimal(18,3)),'###,###,###.00','de-de')) as KalemSatisFiyati, CONVERT(varchar,FORMAT(CAST(SUM(buUrununSiparisTonaji)*(KalemSatisFiyati) as decimal(18,3)),'###,###,###.00','de-de')) as TotalFiyat from Orders o  where o.TeklifNo='" + Request.QueryString["teklifno"] + "' group by o.Urun,o.KalemSatisFiyati,o.UrunAnaGrup)select COUNT(*) from myReslt where sira between 9 and 17", con);
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 16 ; i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                         for (int i = 1; i <= sayac-2; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                     else if(foot[10]=="True")
                    {
                        int kayitsira = 9;
                        SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_TL_Header_9_16", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>₺</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira; totalfiyat = totalfiyat + Convert.ToDouble(dr["Total2"]);
                    }
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 16; i++)
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;"><b> <%=i.ToString() %></b></td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                          SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_TL_9_16", con);
                          fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                          fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                          fobhesabi.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                          fobhesabi.CommandType = CommandType.StoredProcedure;

                          SqlDataAdapter da2 = new SqlDataAdapter();
                          da2.SelectCommand = fobhesabi;
                          DataTable dt2 = new DataTable();
                          da2.Fill(dt2);
                          foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                        <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>₺</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["VarisLimani"].ToString() %></b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b>&nbsp;</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=navluntl %>₺</b></td>
                       </tr>    
                        <%}
                        
                        for (int i = 1; i <= sayac-3; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                  
                  
                  
                    }
                    
              
                }
                else if (baslik[4] == "€")
                {%>
            <tr>
                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (EUR/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (EUR)</b></td>
            </tr>
            <%
                if(foot[10]=="False")
                {
                    int sira = 9;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_EUR_9_16", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>

                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=sira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>

                        </tr>
                        <%
                        sira++;
                    }
                      for (int i = 8; i <= 16; i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                                        for (int i = 1; i <= sayac; i++)
                    {%>
   <tr>

                <td  style="text-align: center; width: 50px;">&nbsp;</td>
                <td  style="text-align: center; width: 500px;">&nbsp;</td>
                <td  style="text-align: center; width: 50px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;">&nbsp;</td>
                <td  style="text-align: center; width: 200px;">&nbsp;</td>
                <td  style="text-align: center; width: 250px;">&nbsp;</td>
            </tr>
                <%}

                }
                
                  else if(foot[10]=="True")
                {
                    int sira = 9;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_EUR_Header_9_16", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>

                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=sira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>

                        </tr>
                        <%
                        sira++;

                    }
                       for (int i = 8; i <= 16; i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                                              for (int i = 1; i <= 2;i++ )
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                    SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_EUR_9_16", con);
                    fobhesabi.Parameters.AddWithValue("@teklifNo", Request.QueryString["teklifno"]);
                    fobhesabi.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                    fobhesabi.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da2 = new SqlDataAdapter();
                    da2.SelectCommand = fobhesabi;
                    DataTable dt2 = new DataTable();
                    da2.Fill(dt2);

                    foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                       <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>€</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> TOTAL FREIGHT</b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> &nbsp;</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=navluneuro%>€</b></td>
                       </tr>    
                        <%}
                         
                        for (int i = 1; i <= sayac; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                } 
            %>
            <%
                SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_EUR", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                SqlDataAdapter da3 = new SqlDataAdapter();
                da3.SelectCommand = cmd2;
                DataTable dt3 = new DataTable();
                da3.Fill(dt3);
                foreach (DataRow dr2 in dt3.Rows)
                {%>
            <tr>
                <td colspan="2" class="cizgi" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b> TOTAL VALUE &nbsp;</b></span></td>
                <td class="cizgi" style="text-align: center;height:20px;" colspan="3"><span style="text-align: center"><b> <%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi" style="text-align:center;height:20px;"><span><b> <%=dr2["TotalFiyat"].ToString() %>€</b></span></td>
            </tr>
          <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;" data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            
          
            <%}
            %>

            <%}
            
         
            
                
                        
             
                     
            %>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PACKING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3">
                  <%
                SqlCommand pakettipi2 = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when REPLACE(Palet,'YOK',0)=0 then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when REPLACE(Palet,'YOK',0)=0 then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where TeklifNo=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                      pakettipi2.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                      SqlDataAdapter da44 = new SqlDataAdapter();
                      da44.SelectCommand = pakettipi2;
                      DataTable dt44 = new DataTable();
                      da44.Fill(dt44);
                     foreach(DataRow p in dt44.Rows)
                      {%>
                          <span><b><%=p["Torba"].ToString() %>&nbsp;&nbsp;<%=p["UniteAgirlik"].ToString() +"KGS"%>&nbsp;&nbsp;<%=p["BigBag"].ToString() %>&nbsp;<%=p["Palet"].ToString() %>&nbsp;<%=p["Strec"].ToString() %>&nbsp;(<%=p["PaketSayisi"].ToString() %> PCS)</b></span>  
                          <br />
                      <%
                          paketsayisi = paketsayisi + Convert.ToInt32(p["PaketSayisi"]);
                      }
                 %>
              </td>
                 <td class="cizgi orta yaziboyutu" style="height:15px;" colspan="2"><b><span><a href="#" style="color:black;" data-toggle="modal" data-target="#exampleModalScrollable">SPECIAL NOTES</a></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">UNIT WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3">
                  <%
                SqlCommand unit2 = new SqlCommand("select  case when Palet <> 'YOK' then Palet  when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi  when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik, case when  KonteynerBulkSecimi <> 'RORO' then   case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end else  case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end end as Brut from Orders where TeklifNo=@p1 group by Palet,BBTipi,BBAgirligi,Ulke,KonteynerBulkSecimi", con);
                      unit2.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                      SqlDataAdapter da55 = new SqlDataAdapter();
                      da55.SelectCommand = unit2;
                      DataTable dt55 = new DataTable();
                      da55.Fill(dt55);
                      
                      foreach(DataRow un in dt55.Rows)
                      {%>
                          <span><b>&nbsp;<%=un["UniteAgirlik"].ToString()%>&nbsp;KGS NET WEIGHT</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><b><%=un["Brut"].ToString() %> KGS GROSS WEIGHT</b></span>
                          <br />
                      <%}                                                        
                                                                                  
                  %></td>
                 <td class="cizgi yaziboyutu" colspan="2" rowspan="10" style="vertical-align:top;word-break:break-all;"><b><span ><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%"><%=foot[11]%></textarea></span></b></td>
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">TOTAL WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[4] %> KGS NET WEIGHT</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
                   
                   <span><b><%=brutagirlik_1%>&nbsp;KGS GROSS WEIGHT</b></span>
              </td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF PACKAGE</span></b></td>
             <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=paketsayisi %>&nbsp;PCS</span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#modal2">NO OF FCL</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[7] %></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#mdlpayment">PAYMENT TERMS</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[13] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ORIGIN</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span>TÜRKİYE</span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi">PORT OF LOADING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[1] %>/TÜRKİYE</span></b></td>
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#mdlkalkis">PORT OF DELIVERY</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[2] %></span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#tekliftipiaciklama">DELIVERY TERMS</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[3] %>/<%=baslik[16]%></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#exampleModalScrollable2">HS CODE</a></span></b></td>
              <td class="kaydiryirmi cizgi yaziboyutu" colspan="3" style="height:15px;"><b><span><%=baslik[11] %>
                       <%
                if (baslik[13] != "")
                {%>
                    &nbsp;/<%=baslik[13] %>
                <%}
                   if (baslik[14] != "")
                {%>
                    &nbsp;/<%=baslik[14] %>
                <%}
                    if (baslik[15] != "")
                {%>
                    &nbsp;/<%=baslik[15] %>
                <%}
                      
                  %>
                                                                                           </span></b></td>
            </tr>
                  <tr>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="4"><b><span class="kaydiryirmi">BANK DETAILS</span></b></td>
                       <td class="cizgi yaziboyutu orta" colspan="2" rowspan="6"><b><span class="kaydiryirmi"><asp:Image ID="Image2" runat="server" Height="150px" /></span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">BENEFICARY</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"> <b><span><%=baslik[6] %></span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#mdlbank">OUR BANK</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[0] %> &nbsp;NIGDE BRANCH CODE (<%=banka[5] %>)</span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ACCOUNT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[3] %></span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">IBAN</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[1] %></span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">SWIFT CODE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[4] %></span> </b></td>
            </tr>
             <tr>
                 <td class="cizgi orta yaziboyutu" colspan="2" style="height:120px; vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
                   <td class="cizgi orta yaziboyutu" colspan="4" style="height:120px;vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
             </tr>
        </table>
            <%}
            else if (kayitsayisi > 16 && kayitsayisi <= 24)
            {%>
                    <table class=<%if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ")
                       {%> "arkaplannigtas" <%}
                                   else if (baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                       {%> "arkaplanmikrokal" <%}
                                   else if (baslik[6] == "ASKAL LTD.ŞTİ.")
                       {%> "arkaplanaskal" <%}                     
                            %>>
               <%
                if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ" || baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                {%>
                        <tr style="height: 180px;">
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
                else
                {%>
                        <tr style="height: 100px;">
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
            %>
            <tr>
                <td colspan="6" style="text-align: center; font-size: 40px;height:40px; " class="auto-style1"><span style="text-align: center;"><b>COMMERCIAL INVOICE</b></span></td>
            </tr>
                 <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <%=fatura[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" style="height:15px;" ><span class="kaydiryirmi"><b> <%=fatura2.ToShortDateString() %></b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></a></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b> <a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#po"> PO :<%=baslik[3] %></a></b></span></td>
                   
                  
                   </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="3" class="cizgi orta" style="width:600px;height:25px;"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal"><b>CUSTOMER</b><a></a></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %></b> </span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span> </td>      
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> <a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><%=baslikdetay[9] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[4] %></b></td>
            </tr>
            
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none"><%=firma[8] %></a> </b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b > <%=baslikdetay[5] %></b></td>
            </tr>
                
              
              
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
              
             <%
                if (baslik[4] == "$")
                {%>
            <tr>

                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (USD/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (USD)</b></td>
            </tr>

            <%

                    if(foot[10]=="False")
                    {
                        int kayitsira = 1;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_USD_1_8", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);


                        foreach (DataRow dr in dt.Rows)
                    {%>
                    
                       <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>

                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }


                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" class="cizgi" ><%=i.ToString() %></td>
                <td style="text-align: center; width: 500px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" class="cizgi">&nbsp;</td>
            </tr>
                <%}
                    }
                    else if(foot[10]=="True")
                    {
                        int kayitsira = 1;
                        SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_UDS_Header_1_8", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                    }
                          for (int i = 1; i <= 2;i++ )
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                          SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_USD_1_8", con);
                          fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                          fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                          fobhesabi.CommandType = CommandType.StoredProcedure;

                          SqlDataAdapter da2 = new SqlDataAdapter();
                          da2.SelectCommand = fobhesabi;
                          DataTable dt2 = new DataTable();
                          da2.Fill(dt2);
                          foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                     <%--   <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>$</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["VarisLimani"].ToString() %></b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Navlun"].ToString() %>$</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["CFRMALIYET"].ToString() %>$</b></td>
                       </tr>    --%>
                        <%}
                        
                        for (int i = 1; i <= sayac-3; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                
             %>
            <%
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_USD", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                    foreach (DataRow dr2 in dt3.Rows)
                    {%>
           <%-- <tr>
                <td colspan="2" class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE <%=foot[3] %> <%=foot[1] %></b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" colspan="3"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" ><span ><b> $<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>--%>
            <%}
                   

            %>

            <%}
                 else  if (baslik[4] == "TL")
                {
                     %>
                  
            <tr>

                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (TL/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (TL)</b></td>
            </tr>

            <%

                    if(foot[10]=="False")
                    {
                        int kayitsira = 1;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_TL_1_8", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                        //cmd.Parameters.AddWithValue("")
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);


                        foreach (DataRow dr in dt.Rows)
                    {%>
                    
                       <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>₺</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira; totalfiyat = totalfiyat + Convert.ToDouble(dr["Total2"]);
                    }


                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" class="cizgi" ><b><%=i.ToString() %></b></td>
                <td style="text-align: center; width: 500px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" class="cizgi">&nbsp;</td>
            </tr>
                <%}
                    }
                    else if(foot[10]=="True")
                    {
                        int kayitsira = 1;
                        SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_TL_Header_1_8", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>₺</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira; totalfiyat = totalfiyat + Convert.ToDouble(dr["Total2"]);
                    }
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;"><b> <%=i.ToString() %></b></td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                          SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_TL_1_8", con);
                          fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                          fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                          fobhesabi.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                          fobhesabi.CommandType = CommandType.StoredProcedure;

                          SqlDataAdapter da2 = new SqlDataAdapter();
                          da2.SelectCommand = fobhesabi;
                          DataTable dt2 = new DataTable();
                          da2.Fill(dt2);
                          foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                       <%-- <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>₺</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["VarisLimani"].ToString() %></b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Navlun"].ToString() %>₺</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["CFRMALIYET"].ToString() %>₺</b></td>
                       </tr>    --%>
                        <%}
                        
                        for (int i = 1; i <= sayac-3; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                
             %>
            <%
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_TL", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[10]));
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                    foreach (DataRow dr2 in dt3.Rows)
                    {%>
         <%--   <tr>
                <td colspan="2" class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE <%=foot[3] %> <%=foot[1] %></b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" colspan="3"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" ><span ><b> ₺<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>--%>
            <%}
                   

            %>

            <%
                }
                
                
                
                
                
                
                else if (baslik[4] == "€")
                {%>
            <tr>
                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (EUR/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (EUR)</b></td>
            </tr>
            <%
                if(foot[10]=="False")
                {
                    int sira = 1;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_EUR_1_8", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>

                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=sira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>

                        </tr>
                        <%
                        sira++;
                        Session["ks"] = sira;
                    }
                   
                                        for (int i = Convert.ToInt32(Session["ks"]); i <= 8; i++)
                    {%>
   <tr>

                <td  style="text-align: center; width: 50px;" class="cizgi"><b> <%=i.ToString() %></b></td>
                <td  style="text-align: center; width: 500px;" class="cizgi">&nbsp;</td>
                <td  style="text-align: center; width: 50px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 150px;" class="cizgi">&nbsp;</td>
                <td  style="text-align: center; width: 200px;" class="cizgi">&nbsp;</td>
                <td  style="text-align: center; width: 250px;" class="cizgi">&nbsp;</td>
            </tr>
                <%}

                }
                
                  else if(foot[10]=="True")
                {
                    int sira = 1;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_EUR_Header_1_8", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>

                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=sira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>

                        </tr>
                        <%
                        sira++;

                    }
                                              for (int i = 1; i <= 2;i++ )
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                    SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_EUR_1_8", con);
                    fobhesabi.Parameters.AddWithValue("@teklifNo", Request.QueryString["teklifno"]);
                    fobhesabi.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                    fobhesabi.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da2 = new SqlDataAdapter();
                    da2.SelectCommand = fobhesabi;
                    DataTable dt2 = new DataTable();
                    da2.Fill(dt2);

                    foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                      <%-- <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>€</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["VarisLimani"].ToString() %></b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Navlun"].ToString() %>€</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["CFRMALIYET"].ToString() %>€</b></td>
                       </tr>    --%>
                        <%}
                        
                        for (int i = 1; i <= sayac; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                } 
            %>
            <%
                SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_EUR", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                SqlDataAdapter da3 = new SqlDataAdapter();
                da3.SelectCommand = cmd2;
                DataTable dt3 = new DataTable();
                da3.Fill(dt3);
                foreach (DataRow dr2 in dt3.Rows)
                {%>
            <%--<tr>
                <td colspan="2" class="cizgi"><span style="text-align: center; margin-left: 40px; height:20px;"><b> TOTAL VALUE <%=foot[3] %> <%=foot[1] %></b></span></td>
                <td class="cizgi" style="text-align: center; height:20px;" colspan="3"><span style="text-align: center"><b> <%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi" style="text-align:center;height:20px;"><span><b> <%=dr2["TotalFiyat"].ToString() %>€</b></span></td>
            </tr>
          <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;" data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>--%>
            
          
            <%}
            %>

            <%}
            
         
            
                
                        
             
                     
            %>
           <%
                for (int i = 0; i <= 20; i++)
                {%>
                    <tr>
                        <td colspan="8">&nbsp;</td>
                    </tr>
                <%}
               
            %>
        </table>


        <p style="page-break-before: always;">&nbsp;</p>
<table class=<%if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ")
                       {%> "arkaplannigtas" <%}
               else if (baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                       {%> "arkaplanmikrokal" <%}
               else if (baslik[6] == "ASKAL LTD.ŞTİ.")
                       {%> "arkaplanaskal" <%}                     
                            %>>
               <%
                if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ" || baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                {%>
                        <tr style="height: 180px;">
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
                else
                {%>
                        <tr style="height: 100px;">
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
            %>
            <tr>
                <td colspan="6" style="text-align: center; font-size: 40px;height:40px; " class="auto-style1"><span style="text-align: center;"><b>COMMERCIAL INVOICE</b></span></td>
            </tr>
             <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <%=fatura[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" style="height:15px;" ><span class="kaydiryirmi"><b> <%=fatura2.ToShortDateString() %></b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></a></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b> <a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#po"> PO :<%=baslik[3] %></a></b></span></td>
                   
                  
                   </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="3" class="cizgi orta" style="width:600px;height:25px;"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal"><b>CUSTOMER</b><a></a></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %></b> </span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span> </td>      
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> <a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><%=baslikdetay[9] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[4] %></b></td>
            </tr>
            
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none"><%=firma[8] %></a> </b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b > <%=baslikdetay[5] %></b></td>
            </tr>
              
              
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
              
             <%
                if (baslik[4] == "$")
                {%>
            <tr>

                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (USD/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (USD)</b></td>
            </tr>

            <%

                    if(foot[10]=="False")
                    {
                        int kayitsira = 9;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_USD_9_16", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);


                        foreach (DataRow dr in dt.Rows)
                    {%>
                    
                       <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
                        SqlCommand sws = new SqlCommand("with myReslt(sira)as(select ROW_NUMBER() OVER( order by UrunAnaGrup ) as sira from Orders o  where o.TeklifNo='"+Request.QueryString["teklifno"]+"' group by o.Urun,o.KalemSatisFiyati,o.UrunAnaGrup)select COUNT(*) from myReslt where sira between 9 and 17", con);
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 18-Convert.ToInt32(sws.ExecuteScalar()); i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                          
                            for (int i = 1; i <= sayac; i++)
                            {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                    else if(foot[10]=="True")
                    {
                        int kayitsira = 9;
                        SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_UDS_Header_9_16", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
                        SqlCommand sws2 = new SqlCommand("with myReslt(sira,Aciklama,Urun,buUrununSiparisTonaji,KalemSatisFiyati,TotalFiyat)as(select ROW_NUMBER() OVER( order by UrunAnaGrup ) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama, o.Urun,CONVERT(varchar, FORMAT(CAST(SUM(buUrununSiparisTonaji) as decimal(18,3)),'###,###,###.00','de-de')) as buUrununSiparisTonaji,CONVERT(varchar,FORMAT(CAST(KalemSatisFiyati as decimal(18,3)),'###,###,###.00','de-de')) as KalemSatisFiyati, CONVERT(varchar,FORMAT(CAST(SUM(buUrununSiparisTonaji)*(KalemSatisFiyati) as decimal(18,3)),'###,###,###.00','de-de')) as TotalFiyat from Orders o  where o.TeklifNo='" + Request.QueryString["teklifno"] + "' group by o.Urun,o.KalemSatisFiyati,o.UrunAnaGrup)select COUNT(*) from myReslt where sira between 9 and 17", con);
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 18 - Convert.ToInt32(sws2.ExecuteScalar()); i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                   
                          for (int i = 1; i <= 2;i++ )
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                        SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_USD_9_16", con);
                          fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                          fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                          fobhesabi.CommandType = CommandType.StoredProcedure;

                          SqlDataAdapter da2 = new SqlDataAdapter();
                          da2.SelectCommand = fobhesabi;
                          DataTable dt2 = new DataTable();
                          da2.Fill(dt2);
                          foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                        <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>$</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> TOTAL FREIGHT</b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> &nbsp;</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=navlun %>$</b></td>
                       </tr>    
                        <%}
                        
                        for (int i = 1; i <= sayac-3; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                
             %>
            <%
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_USD", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                    foreach (DataRow dr2 in dt3.Rows)
                    {%>
            <tr>
                <td colspan="2" class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE &nbsp;</b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" colspan="3"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" ><span ><b> $<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                   

            %>

            <%}
                 else  if (baslik[4] == "TL")
                {
                    if (foot[10] == "False")
                    {%>
                        <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(TL/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(TL)</b></td>
                        </tr>
                    <%
                        int kayitsira = 9;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_TL_9_16", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                       foreach(DataRow dr in dt.Rows)
                        {%>
                        <tr>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>₺</b></td>
                       </tr>
                        <%
                            kayitsira++;
                            Session["ks"] = kayitsira; totalfiyat = totalfiyat + Convert.ToDouble(dr["Total2"]);
                        }
                       //SqlCommand sws3 = new SqlCommand("with myReslt(sira,Aciklama,Urun,buUrununSiparisTonaji,KalemSatisFiyati,TotalFiyat)as(select ROW_NUMBER() OVER( order by UrunAnaGrup ) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama, o.Urun,CONVERT(varchar, FORMAT(CAST(SUM(buUrununSiparisTonaji) as decimal(18,3)),'###,###,###.00','de-de')) as buUrununSiparisTonaji,CONVERT(varchar,FORMAT(CAST(KalemSatisFiyati as decimal(18,3)),'###,###,###.00','de-de')) as KalemSatisFiyati, CONVERT(varchar,FORMAT(CAST(SUM(buUrununSiparisTonaji)*(KalemSatisFiyati) as decimal(18,3)),'###,###,###.00','de-de')) as TotalFiyat from Orders o  where o.TeklifNo='" + Request.QueryString["teklifno"] + "' group by o.Urun,o.KalemSatisFiyati,o.UrunAnaGrup)select COUNT(*) from myReslt where sira between 9 and 17", con);
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 16 ; i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                         for (int i = 1; i <= sayac-2; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                     else if(foot[10]=="True")
                    {
                        int kayitsira = 9;
                        SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_TL_Header_9_16", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>₺</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira; totalfiyat = totalfiyat + Convert.ToDouble(dr["Total2"]);
                    }
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 16; i++)
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;"><b> <%=i.ToString() %></b></td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                          SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_TL_9_16", con);
                          fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                          fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                          fobhesabi.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                          fobhesabi.CommandType = CommandType.StoredProcedure;

                          SqlDataAdapter da2 = new SqlDataAdapter();
                          da2.SelectCommand = fobhesabi;
                          DataTable dt2 = new DataTable();
                          da2.Fill(dt2);
                          foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                        <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>₺</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["VarisLimani"].ToString() %></b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b>&nbsp;</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=navluntl %>₺</b></td>
                       </tr>    
                        <%}
                        
                        for (int i = 1; i <= sayac-3; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
              
                }
                else if (baslik[4] == "€")
                {%>
            <tr>
                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (EUR/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (EUR)</b></td>
            </tr>
            <%
                if(foot[10]=="False")
                {
                    int sira = 9;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_EUR_9_16", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>

                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=sira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>

                        </tr>
                        <%
                        sira++;
                    }
                      for (int i = 8; i <= 16; i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                                        for (int i = 1; i <= sayac; i++)
                    {%>
   <tr>

                <td  style="text-align: center; width: 50px;">&nbsp;</td>
                <td  style="text-align: center; width: 500px;">&nbsp;</td>
                <td  style="text-align: center; width: 50px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;">&nbsp;</td>
                <td  style="text-align: center; width: 200px;">&nbsp;</td>
                <td  style="text-align: center; width: 250px;">&nbsp;</td>
            </tr>
                <%}

                }
                
                  else if(foot[10]=="True")
                {
                    int sira = 9;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_EUR_Header_9_16", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>

                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=sira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>

                        </tr>
                        <%
                        sira++;

                    }
                       for (int i = 8; i <= 16; i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                                              for (int i = 1; i <= 2;i++ )
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                    SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_EUR_9_16", con);
                    fobhesabi.Parameters.AddWithValue("@teklifNo", Request.QueryString["teklifno"]);
                    fobhesabi.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                    fobhesabi.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da2 = new SqlDataAdapter();
                    da2.SelectCommand = fobhesabi;
                    DataTable dt2 = new DataTable();
                    da2.Fill(dt2);

                    foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                       <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>€</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["VarisLimani"].ToString() %></b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> &nbsp;</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=navluneuro %>€</b></td>
                       </tr>    
                        <%}
                         
                        for (int i = 1; i <= sayac; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                } 
            %>


            <%}
            
        
            
                
                        
             
                     
            %>
    <%
        
                for (int i = 0; i <= 20; i++)
                {%>
                      <tr >
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
        
        
         %>
         
        </table>
     
          <p style="page-break-before: always;">&nbsp;</p>,
                <table class=<%if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ")
                               {%> "arkaplannigtas" <%}
                               else if (baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                               {%> "arkaplanmikrokal" <%}
                               else if (baslik[6] == "ASKAL LTD.ŞTİ.")
                               {%> "arkaplanaskal" <%}                     
                            %>>
               <%
                if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ" || baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                {%>
                        <tr style="height: 180px;">
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
                else
                {%>
                        <tr style="height: 100px;">
                <td colspan="8">&nbsp;</td>
            </tr>
                <%}
            %>
            <tr>
                <td colspan="6" style="text-align: center; font-size: 40px;height:40px; " class="auto-style1"><span style="text-align: center;"><b>COMMERCIAL INVOICE</b></span></td>
            </tr>
             <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <%=fatura[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" style="height:15px;" ><span class="kaydiryirmi"><b> <%=fatura2.ToShortDateString() %></b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></a></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b> <a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#po"> PO :<%=baslik[3] %></a></b></span></td>
                   
                  
                   </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="3" class="cizgi orta" style="width:600px;height:25px;"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal"><b>CUSTOMER</b><a></a></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %></b> </span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span> </td>      
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> <a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><%=baslikdetay[9] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[4] %></b></td>
            </tr>
            
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none"><%=firma[8] %></a> </b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b > <%=baslikdetay[5] %></b></td>
            </tr>
              
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
              
             <%
                if (baslik[4] == "$")
                {%>
            <tr>

                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (USD/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (USD)</b></td>
            </tr>

            <%

                    if(foot[10]=="False")
                    {
                        int kayitsira = 17;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_USD_17_25", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);


                        foreach (DataRow dr in dt.Rows)
                    {%>
                    
                       <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
                        SqlCommand sws = new SqlCommand("with myReslt(sira)as(select ROW_NUMBER() OVER( order by UrunAnaGrup ) as sira from Orders o  where o.TeklifNo='"+Request.QueryString["teklifno"]+"' group by o.Urun,o.KalemSatisFiyati,o.UrunAnaGrup)select COUNT(*) from myReslt where sira between 18 and 25", con);
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 26-Convert.ToInt32(sws.ExecuteScalar()); i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                          
                            for (int i = 1; i <= sayac; i++)
                            {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                    else if(foot[10]=="True")
                    {
                        int kayitsira = 17;
                        SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_UDS_Header_17_25", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
                        SqlCommand sws2 = new SqlCommand("with myReslt(sira,Aciklama,Urun,buUrununSiparisTonaji,KalemSatisFiyati,TotalFiyat)as(select ROW_NUMBER() OVER( order by UrunAnaGrup ) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama, o.Urun,CONVERT(varchar, FORMAT(CAST(SUM(buUrununSiparisTonaji) as decimal(18,3)),'###,###,###.00','de-de')) as buUrununSiparisTonaji,CONVERT(varchar,FORMAT(CAST(KalemSatisFiyati as decimal(18,3)),'###,###,###.00','de-de')) as KalemSatisFiyati, CONVERT(varchar,FORMAT(CAST(SUM(buUrununSiparisTonaji)*(KalemSatisFiyati) as decimal(18,3)),'###,###,###.00','de-de')) as TotalFiyat from Orders o  where o.TeklifNo='" + Request.QueryString["teklifno"] + "' group by o.Urun,o.KalemSatisFiyati,o.UrunAnaGrup)select COUNT(*) from myReslt where sira between 17 and 25", con);
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 26 - Convert.ToInt32(sws2.ExecuteScalar()); i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                   
                          for (int i = 1; i <= 2;i++ )
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                        SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_USD_17_25", con);
                          fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                          fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                          fobhesabi.CommandType = CommandType.StoredProcedure;

                          SqlDataAdapter da2 = new SqlDataAdapter();
                          da2.SelectCommand = fobhesabi;
                          DataTable dt2 = new DataTable();
                          da2.Fill(dt2);
                          foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                        <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>€</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> TOTAL FREIGHT</b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Navlun"].ToString() %>$</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["CFRMALIYET"].ToString() %>$</b></td>
                       </tr>    
                        <%}
                        
                        for (int i = 1; i <= sayac-3; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                
             %>
            <%
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_USD", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                    foreach (DataRow dr2 in dt3.Rows)
                    {%>
            <tr>
                <td colspan="2" class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE &nbsp;</b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" colspan="3"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" ><span ><b> $<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                   

            %>

            <%}
                 else  if (baslik[4] == "TL")
                {
                    if (foot[10] == "False")
                    {%>
                        <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(TL/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(TL)</b></td>
                        </tr>
                    <%
                        int kayitsira = 17;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_TL_17_25", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                       foreach(DataRow dr in dt.Rows)
                        {%>
                        <tr>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>₺</b></td>
                       </tr>
                        <%
                            kayitsira++;
                            Session["ks"] = kayitsira; totalfiyat = totalfiyat + Convert.ToDouble(dr["Total2"]);
                        }
                       //SqlCommand sws3 = new SqlCommand("with myReslt(sira,Aciklama,Urun,buUrununSiparisTonaji,KalemSatisFiyati,TotalFiyat)as(select ROW_NUMBER() OVER( order by UrunAnaGrup ) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama, o.Urun,CONVERT(varchar, FORMAT(CAST(SUM(buUrununSiparisTonaji) as decimal(18,3)),'###,###,###.00','de-de')) as buUrununSiparisTonaji,CONVERT(varchar,FORMAT(CAST(KalemSatisFiyati as decimal(18,3)),'###,###,###.00','de-de')) as KalemSatisFiyati, CONVERT(varchar,FORMAT(CAST(SUM(buUrununSiparisTonaji)*(KalemSatisFiyati) as decimal(18,3)),'###,###,###.00','de-de')) as TotalFiyat from Orders o  where o.TeklifNo='" + Request.QueryString["teklifno"] + "' group by o.Urun,o.KalemSatisFiyati,o.UrunAnaGrup)select COUNT(*) from myReslt where sira between 9 and 17", con);
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 26 ; i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                         for (int i = 1; i <= sayac-2; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
                     else if(foot[10]=="True")
                    {
                        int kayitsira = 17;
                        SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_TL_Header_17_25", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                        cmd.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = cmd;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=kayitsira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>₺</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 26; i++)
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;"><b> <%=i.ToString() %></b></td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                          SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_TL_17_25", con);
                          fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                          fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                          fobhesabi.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[10]));
                          fobhesabi.CommandType = CommandType.StoredProcedure;

                          SqlDataAdapter da2 = new SqlDataAdapter();
                          da2.SelectCommand = fobhesabi;
                          DataTable dt2 = new DataTable();
                          da2.Fill(dt2);
                          foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                        <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>₺</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["VarisLimani"].ToString() %></b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Navlun"].ToString() %>₺</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["CFRMALIYET"].ToString() %>₺</b></td>
                       </tr>    
                        <%}
                        
                        for (int i = 1; i <= sayac-3; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                    }
              
                }
                else if (baslik[4] == "€")
                {%>
            <tr>
                <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b>UNIT PRICE<br />
                    (EUR/TON)</b></td>
                <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b>TOTAL PRICE<br />
                    (EUR)</b></td>
            </tr>
            <%
                if(foot[10]=="False")
                {
                    int sira = 17;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_EUR_17_25", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>

                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=sira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>

                        </tr>
                        <%
                        sira++;
                    }
                      for (int i = 8; i <= 26; i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                                        for (int i = 1; i <= sayac; i++)
                    {%>
   <tr>

                <td  style="text-align: center; width: 50px;">&nbsp;</td>
                <td  style="text-align: center; width: 500px;">&nbsp;</td>
                <td  style="text-align: center; width: 50px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;">&nbsp;</td>
                <td  style="text-align: center; width: 200px;">&nbsp;</td>
                <td  style="text-align: center; width: 250px;">&nbsp;</td>
            </tr>
                <%}

                }
                
                  else if(foot[10]=="True")
                {
                    int sira = 17;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_FOB_EUR_Header_17_25", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    foreach (DataRow dr in dt.Rows)
                    {%>
                        <tr>

                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=sira.ToString() %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b><%=dr["Aciklama"].ToString() %> &nbsp;<%=dr["Urun"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>TON</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> <%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>

                        </tr>
                        <%
                        sira++;

                    }
                       for (int i = 8; i <= 26; i++)
                        {%>
                                <tr>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b> <%=i %></b></td>
                             <td class="cizgi yaziboyutu" style="text-align: left; width: 500px; height:15px;"><b>&nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 50px; height:15px;"><b>&nbsp;</b> </td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 150px; height:15px;"><b> &nbsp;</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> &nbsp;</b></td>
                             <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b>&nbsp;</b></td>
                       </tr>
                        <%}
                                              for (int i = 1; i <= 2;i++ )
                    {%>
            <tr>
                         <td class="cizgi" style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td class="cizgi" style="text-align: center; width: 250px;height:5px;" >&nbsp;</td></tr>
                    <%}

                    SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_EUR_17_25", con);
                    fobhesabi.Parameters.AddWithValue("@teklifNo", Request.QueryString["teklifno"]);
                    fobhesabi.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                    fobhesabi.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da2 = new SqlDataAdapter();
                    da2.SelectCommand = fobhesabi;
                    DataTable dt2 = new DataTable();
                    da2.Fill(dt2);

                    foreach (DataRow fobhesabioku in dt2.Rows)
                        {%>
                       <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                             <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FOB"].ToString() %></b> </td>
                             <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b>TON</b> </td>
                            <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["Tonaj"].ToString() %></b> </td>
                            <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b><%=fobhesabioku["FobFiyatTotal"].ToString() %>€</b> </td>
                        </tr>
                         <tr> <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu" >&nbsp;</td>
                              <td style="text-align: left; width: 500px;height:5px;" class="cizgi yaziboyutu"><b> TOTAL FREIGHT</b></td>
                              <td style="text-align: center; width: 50px;height:5px;" class="cizgi yaziboyutu"><b> TON</b></td>
                             <td style="text-align: center; width: 150px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Tonaj"].ToString() %></b></td>
                             <td style="text-align: center; width: 200px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["Navlun"].ToString() %>€</b></td>
                             <td style="text-align: center; width: 250px;height:5px;" class="cizgi yaziboyutu"><b> <%=fobhesabioku["CFRMALIYET"].ToString() %>€</b></td>
                       </tr>    
                        <%}
                         
                        for (int i = 1; i <= sayac; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 500px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" >&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" >&nbsp;</td>
            </tr>
                <%}
                } 
            %>
            <%
                SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_EUR", con);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                SqlDataAdapter da3 = new SqlDataAdapter();
                da3.SelectCommand = cmd2;
                DataTable dt3 = new DataTable();
                da3.Fill(dt3);
                foreach (DataRow dr2 in dt3.Rows)
                {%>
            <tr>
                <td colspan="2" class="cizgi" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b> TOTAL VALUE &nbsp;</b></span></td>
                <td class="cizgi" style="text-align: center;height:20px;" colspan="3"><span style="text-align: center"><b> <%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi" style="text-align:center;height:20px;"><span><b> <%=dr2["TotalFiyat"].ToString() %>€</b></span></td>
            </tr>
          <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;" data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            
          
            <%}
            %>

            <%}
            
         
            
                
                        
             
                     
            %>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PACKING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3">
                  <%
                SqlCommand pakettipi2 = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when REPLACE(Palet,'YOK',0)=0 then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when REPLACE(Palet,'YOK',0)=0 then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where TeklifNo=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                      pakettipi2.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                      SqlDataAdapter da44 = new SqlDataAdapter();
                      da44.SelectCommand = pakettipi2;
                      DataTable dt44 = new DataTable();
                      da44.Fill(dt44);
                     foreach(DataRow p in dt44.Rows)
                      {%>
                          <span><b><%=p["Torba"].ToString() %>&nbsp;&nbsp;<%=p["UniteAgirlik"].ToString() +"KGS"%>&nbsp;&nbsp;<%=p["BigBag"].ToString() %>&nbsp;<%=p["Palet"].ToString() %>&nbsp;<%=p["Strec"].ToString() %>&nbsp;(<%=p["PaketSayisi"].ToString() %> PCS)</b></span>  
                          <br />
                      <%
                          paketsayisi = paketsayisi + Convert.ToInt32(p["PaketSayisi"]);
                      }
                 %>
              </td>
                 <td class="cizgi orta yaziboyutu" style="height:15px;" colspan="2"><b><span><a href="#" style="color:black;" data-toggle="modal" data-target="#exampleModalScrollable">SPECIAL NOTES</a></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">UNIT WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3">
                  <%
                SqlCommand unit2 = new SqlCommand("select  case when Palet <> 'YOK' then Palet  when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi  when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik, case when  KonteynerBulkSecimi <> 'RORO' then   case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end else  case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end end as Brut from Orders where TeklifNo=@p1 group by Palet,BBTipi,BBAgirligi,Ulke,KonteynerBulkSecimi", con);
                      unit2.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                      SqlDataAdapter da55 = new SqlDataAdapter();
                      da55.SelectCommand = unit2;
                      DataTable dt55 = new DataTable();
                      da55.Fill(dt55);
                      
                      foreach(DataRow un in dt55.Rows)
                      {%>
                          <span><b>&nbsp;<%=un["UniteAgirlik"].ToString()%>&nbsp;KGS NET WEIGHT</b></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><b><%=un["Brut"].ToString() %> KGS GROSS WEIGHT</b></span>
                          <br />
                      <%}                                                        
                                                                                  
                  %></td>
                 <td class="cizgi yaziboyutu" colspan="2" rowspan="10" style="vertical-align:top;word-break:break-all;"><b><span ><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%"><%=foot[11]%></textarea></span></b></td>
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">TOTAL WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[4] %> KGS NET WEIGHT</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
                   
                   <span><b><%=brutagirlik_1%>&nbsp;KGS GROSS WEIGHT</b></span>
              </td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF PACKAGE</span></b></td>
             <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=paketsayisi %>&nbsp;PCS</span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#modal2">NO OF FCL</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[7] %></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#mdlpayment">PAYMENT TERMS</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[13] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ORIGIN</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span>TÜRKİYE</span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi">PORT OF LOADING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[1] %>/TÜRKİYE</span></b></td>
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#mdlkalkis">PORT OF DELIVERY</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[2] %></span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#tekliftipiaciklama">DELIVERY TERMS</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[3] %>/<%=baslik[16]%></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#exampleModalScrollable2">HS CODE</a></span></b></td>
              <td class="kaydiryirmi cizgi yaziboyutu" colspan="3" style="height:15px;"><b><span><%=baslik[11] %>
                       <%
                if (baslik[13] != "")
                {%>
                    &nbsp;/<%=baslik[13] %>
                <%}
                   if (baslik[14] != "")
                {%>
                    &nbsp;/<%=baslik[14] %>
                <%}
                    if (baslik[15] != "")
                {%>
                    &nbsp;/<%=baslik[15] %>
                <%}
                      
                  %>
                                                                                           </span></b></td>
            </tr>
                  <tr>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="4"><b><span class="kaydiryirmi">BANK DETAILS</span></b></td>
                       <td class="cizgi yaziboyutu orta" colspan="2" rowspan="6"><b><span class="kaydiryirmi"><asp:Image ID="Image5" runat="server" Height="150px" /></span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">BENEFICARY</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"> <b><span><%=baslik[6] %></span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#mdlbank">OUR BANK</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[0] %>&nbsp;NIGDE BRANCH CODE (<%=banka[5] %>)</span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ACCOUNT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[3] %></span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">IBAN</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[1] %></span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">SWIFT CODE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[4] %></span> </b></td>
            </tr>
             <tr>
                 <td class="cizgi orta yaziboyutu" colspan="2" style="height:120px; vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
                   <td class="cizgi orta yaziboyutu" colspan="4" style="height:120px;vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
             </tr>
        </table>
            <%}
            
            
        %>

             
    </div>
      
   <div style="text-align: center;height:10px;">
        <asp:Panel ID="pnl2" runat="server">
            <asp:Button ID="btnPDF2" runat="server" Text="PDF" CssClass="btn btn-warning" OnClick="btnPDF2_Click" BackColor="Orange" ForeColor="White" Height="40px" />
        <a href="OperationCommercialInvoice.aspx" class="btn btn-success" style="height:40px; background-color:green;color:white">ANA SAYFA</a>
             </asp:Panel>
    </div>
    </form>
    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.min.js"></script>
     <script src="assets/libs/custombox/custombox.min.js"></script>

</body>
</html>

