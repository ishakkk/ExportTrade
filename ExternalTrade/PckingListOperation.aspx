<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PckingListOperation.aspx.cs" Inherits="ExternalTrade.PckingListOperation" %>
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
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
      <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" />
    <script src="assets/libs/sweetalert2/sweetalert2.min.js"></script>
    <script src="assets/js/pages/sweet-alerts.init.js"></script>
    
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
        function successAlert() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "KAYDINIZ GÜNCELLENDİ", type: "success"
            }).then(function () { window.location = 'PckingListOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
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
            function UpdatePOSuccess() {
                swal({
                    title: "İŞLEM TAMAMLANDI", text: "SPECIAL NOTE BİLGİLERİ GÜNCELLENDİ", type: "success"
                }).then(function () { window.location = 'PckingListOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
            }
            function UpdatePOError() {
                swal({
                    title: "İŞLEM TAMAMLANAMADI", text: "SPECIAL NOTE BİLGİLERİ GÜNCELLENEMEDİ", type: "error"
                });
            }
            function UpdateEkipmanSuccess() {
                swal({
                    title: "İŞLEM TAMAMLANDI", text: "EKİPMAN GÜNCELLENDİ", type: "success"
                }).then(function () { window.location = 'PckingListOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
          }
          function UpdateEkipmanError() {
              swal({
                  title: "İŞLEM TAMAMLANAMADI", text: "EKİPMAN GÜNCELLENEMEDİ", type: "error"
              });
          }
    </script>
      <script>
          function successCari() {
              swal({
                  title: "İŞLEM TAMAMLANDI", text: "CARİ BİLGİLERİ GÜNCELLENDİ", type: "success"
              }).then(function () { window.location = 'PckingListOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
          }
          function errorCari() {
              swal({
                  title: "İŞLEM TAMAMLANAMADI", text: "CARİ BİLGİLERİ GÜNCELLENEMEDİ", type: "error"
              });
          }
          function Baslik() {
              swal({
                  title: "İŞLEM TAMAMLANDI", text: "BAŞLIKLAR GÜNCELLENDİ", type: "success"
              }).then(function () { window.location = 'PckingListOperation.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });

         }
         function BaslikError() {
             swal({
                 title: "İŞLEM TAMAMLANAMADI", text: "PO BİLGİSİ GÜNCELLENEMEDİ", type: "error"
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
      
                                               <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel">&nbsp;</h4>
                                                    <div>
                                                      
                                                    </div>
                                                   
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                      <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control">

                                                        </asp:TextBox>
                                                     <div>
                                                       <asp:Button ID="Button4" runat="server" CssClass="btn btn-success" Text="KAYDET" OnClick="btn1_Click"/>
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
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
          <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel">&nbsp;</h4>
                                                 
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                      <div>
                                                        <asp:TextBox ID="txtPO" runat="server" CssClass="form-control">

                                                        </asp:TextBox>
                                                    </div>
                                                    <div>
                                                       <asp:Button ID="btn1" runat="server" CssClass="btn btn-success" Text="KAYDET" OnClick="btn1_Click"/>
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
             <div class="modal fade" id="exampleModalScrollable" tabindex="-1" role="dialog"
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
                                                       <asp:TextBox ID="txtUpdateSpecialNote" runat="server" CssClass="form-control"></asp:TextBox>
                                                   </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">KAPAT</button>
                                                    <asp:Button ID="btnSpecialNoteUpdate" runat="server" Text="GÜNCELLE" CssClass="btn btn-primary" OnClick="btnSpecialNoteUpdate_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
          <!-- /.modal -->
         
           
     
            <!-- /.modal -->
            
      <asp:Panel ID="pnl1" runat="server">
             <div style="text-align:center;height:10px;">
        <asp:Button ID="Button1" runat="server" Text="PDF" CssClass="btn btn-warning" Height="40px" OnClick="btnPDF2_Click" BackColor="Orange" ForeColor="White" />
    <a href="OperationPackingList.aspx" class="btn btn-success" style="height:40px; background-color:green;color:white">ANA SAYFA</a>
      
                  </div>
        </asp:Panel>
    <div id="pdf">
       
        <%
            if (Request.QueryString["teklifno"] == null)
                Response.Redirect("Home.aspx");
            string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            string[] firma = new string[10];
            string[] baslik = new string[10];
            string[] banka = new string[10];
            string[] fatura = new string[10];
            DateTime fatura2 = new DateTime();
            string[] paket = new string[10];
            string[] baslikdetay = new string[30];
            string[] foot = new string[20];
           
            int kayitsayisi;
            int[] netagirlik = new int[2];
            int[] brutagirlik = new int[2];
            netagirlik[1] = 0;
            brutagirlik[1] = 0;
            int[] konteynersayisi = new int[1];
            SqlCommand konteynersayisicek = new SqlCommand("select  SUM(distinct SiparistekiKonteynerSayisi)  from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            konteynersayisi[0] = Convert.ToInt32(konteynersayisicek.ExecuteScalar());
            SqlCommand agirlikcek = new SqlCommand("select case when Palet <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when Palet='YOK' then case when BBTipi <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when BBTipi ='YOK' then 0 end end as NetAgirlik, case when KonteynerBulkSecimi <> 'RORO' then case when Palet <> 'YOK' then (SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) when Palet='YOK' then case when BBTipi <> 'YOK' then (SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) when BBTipi ='YOK' then 0 end end else case when Palet <> 'YOK' then (SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) when Palet='YOK' then case when BBTipi <> 'YOK' then (SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) when BBTipi ='YOK' then 0 end end end  as Brüt from Orders o  where o.Durum='SATISA DONDU' and o.TeklifNo=@p1 group by o.BBTipi,o.BBAgirligi,o.Palet,o.KonteynerBulkSecimi", con);
            agirlikcek.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
            SqlDataReader agirlikoku = agirlikcek.ExecuteReader();
            while(agirlikoku.Read())
            {
               if(agirlikoku["NetAgirlik"].ToString()==null ||agirlikoku["NetAgirlik"].ToString()=="")
               {
                   netagirlik[1] = 0;
                   brutagirlik[1] = 0;
               }
               else
               {
                   netagirlik[0] = netagirlik[0] + Convert.ToInt32(agirlikoku["NetAgirlik"]);
                   brutagirlik[0] = brutagirlik[0] + Convert.ToInt32(agirlikoku["Brüt"]);
               }
            }
            agirlikoku.Close();
            
                
                
                  
                    SqlCommand ck = new SqlCommand("select ISNULL(OperationInvoice ,' ') as Invoice ,ISNULL(OperationInvoiceDate,' ') as InvoiceDate from AllOperationDocuments  where TeklifNo=@p1", con);
                    ck.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                    SqlDataReader ckr = ck.ExecuteReader();
                    while (ckr.Read())
                    {
                        fatura[0] = ckr["Invoice"].ToString();
                        fatura2 = Convert.ToDateTime(ckr["InvoiceDate"]);
                    }
                    ckr.Close();
                   
                
               


            
            //faturaoku.Close();
            SqlCommand kayit = new SqlCommand("select COUNT(Urun) from Orders where TeklifNo=@p1", con);
            kayit.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            kayitsayisi = Convert.ToInt32(kayit.ExecuteScalar());
            SqlCommand baslikcek = new SqlCommand("select Temsilci,MusteriIsmi,IletisimeGecilecekKisi,CurrencyUnit,Parite,Company from Orders where TeklifNo=@p1 group by Temsilci,MusteriIsmi,IletisimeGecilecekKisi,CurrencyUnit,Parite,Company", con);
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


            }
            baslikoku.Close();
            SqlCommand baslikcek2 = new SqlCommand("select PO,PackingListSpecialNote,OperationInvoice,OperationInvoiceDate from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            SqlDataReader baslikoku2 = baslikcek2.ExecuteReader();
            while (baslikoku2.Read())
            {
                baslik[8] = baslikoku2["OperationInvoice"].ToString();
                baslik[9] = baslikoku2["OperationInvoiceDate"].ToString();
                baslik[7] = baslikoku2["PackingListSpecialNote"].ToString();

                baslik[3] = baslikoku2["PO"].ToString();
            }
            baslikoku2.Close();
         



    
            int esikdeger = 6;
            int sayac = 0;
           
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
            SqlCommand foott = new SqlCommand(" select  KonteynerBulkSecimi, REPLACE(REPLACE(o.Vade,'Peşin','CASH IN ADVANCE'),'Gün','DAYS') as Vade,case when o.KalkisLimani='MIP' Then 'MIP (MERSIN INTERNATIONAL PORT)' when o.KalkisLimani='Limak' then 'ISKENDERUN LIMAK' when KalkisLimani='YOK' then '' end as KalkisLimani,UPPER(o.VarisLimani) as VarisLimani,REPLACE(o.TeklifTipi,'YOK','') as TeklifTipi,CAST(SUM(o.buUrununSiparisTonaji*1000) as decimal(18,0)) as MIKTAR,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int) as Konteyner,case  when EkipmanTuru='40 DV' then  CONVERT(nvarchar ,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int))+'X' +' 40 HC' when EkipmanTuru='20 DV' then CONVERT(nvarchar ,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int))+'X' +' 20 DC'  end as Ekipman,case when EkipmanTuru='20 DV' then 20*30 when EkipmanTuru='40 DV' then 40*30 else 0 end as Gross,case when EkipmanTuru='20 DV' then 32 when EkipmanTuru='40 DV' then 67 end as CMB from Orders o where TeklifNo=@p1 group by o.Vade,o.KalkisLimani,o.VarisLimani,o.TeklifTipi,EkipmanTuru,KonteynerBulkSecimi", con);
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

                foot[7] = footer["Ekipman"].ToString();
                foot[8] = Convert.ToString(Convert.ToDouble(footer["MIKTAR"]) + Convert.ToDouble(footer["Gross"]));
                foot[14] = footer["KonteynerBulkSecimi"].ToString();
                foot[9] = footer["CMB"].ToString();
                //foot[15] = footer["PaletDegil"].ToString();

            }
            footer.Close();
            SqlCommand foott2 = new SqlCommand("select MoneyText from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            SqlDataReader footer2 = foott2.ExecuteReader();
            while (footer2.Read())
            {
                foot[6] = footer2["MoneyText"].ToString();
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
           
            int[] toplampaket = new int[1];
            
            toplampaket[0] = 0;
            string pakettipi10 = "";
            SqlCommand toplampaketcek = new SqlCommand("select SUM(o.buUrununSiparisTonaji*1000) as MIKTAR,case when Palet <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when Palet ='YOK' then case when BBTipi <> 'YOK' then  CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi='YOK' then 0 end end as ToplamPaket,case when REPLACE(Palet,'YOK',0) <> 0 then 'PALETTE'  when REPLACE(BBAgirligi,'YOK',0) <> 0 and REPLACE(Palet,'YOK',0) = 0 then BBTipi end  as  PAKETTIPI from Orders o  where o.TeklifNo=@p1 group by o.Palet,o.BBAgirligi,o.BBTipi", con);
            toplampaketcek.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
            SqlDataReader toplampaketoku = toplampaketcek.ExecuteReader();
            while(toplampaketoku.Read())
            {
                //toplampaket[0] = toplampaket[0] + Convert.ToInt32(toplampaketoku["ToplamPaket"]);
                pakettipi10 = toplampaketoku["PAKETTIPI"].ToString();
            }
            
            toplampaketoku.Close();
            SqlCommand paketsayisihesapla = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+TorbaTipi end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when Palet='YOK' then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when Palet ='YOK' then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when BBAgirligi ='YOK' then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where TeklifNo=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet",con);
            paketsayisihesapla.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
            SqlDataAdapter ddr=new SqlDataAdapter();
            ddr.SelectCommand = paketsayisihesapla;
            DataTable dttr = new DataTable();
            ddr.Fill(dttr);
            foreach (DataRow dr in dttr.Rows)
            {
                toplampaket[0] = toplampaket[0] + Convert.ToInt32(dr["PaketSayisi"]);
            }
            string email = "";
            SqlCommand emailcek = new SqlCommand("select  u.Email  from AllOperationDocuments o left outer join Users u on o.CommercialInvoiceOlusturan=u.Id where o.TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            email = Convert.ToString(emailcek.ExecuteScalar());
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
                                                   <asp:Button ID="Button3" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="btnCari_Click" />
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
                                                   <asp:Button ID="Button5" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button4_Click" />
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
                                                   <asp:Button ID="Button6" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button5_Click"/>
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
                                                   <asp:Button ID="Button7" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button6_Click" />
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
                                                   <asp:Button ID="Button8" runat="server" Text="KAYDET" CssClass="btn btn-primary" OnClick="Button7_Click" />
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
                                                   <asp:Button ID="Button9" runat="server" Text="KAYDET" CssClass="btn btn-primary"  OnClick="Button8_Click" />
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
             <%
                 if (kalemsayisi <= 8)
                 {%>
                     <table class=<%if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ")
                       {%> "arkaplannigtas" <%}
                                    else if (baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                       {%> "arkaplanmikrokal" <%}
                                    else if (baslik[6] == "ASKAL LTD.ŞTİ.")
                       {%> "arkaplanaskal" <%}    %>>
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
                <td colspan="8" style="text-align: center; font-size: 40px; height: 50px;"><span style="text-align: center;"><b> PACKING LIST</b></span></td>
            </tr>
                 <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <%=fatura[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" colspan="2" style="height:15px;" ><span class="kaydiryirmi"><b> <%=fatura2.ToShortDateString() %></b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></a></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b> PO :<%=baslik[3] %></b></span></td>
                   
                  
                   </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="5" class="cizgi orta" style="width:600px;height:25px;"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal">CUSTOMER</a></b></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %></b> </span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span> </td>      
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span>&nbsp;<b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><%=baslikdetay[9] %>:</a></b></span>&nbsp;<b><%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span>&nbsp;<b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span>&nbsp;<b><%=baslikdetay[4] %></b></td>
            </tr>
          
             <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span>&nbsp;<b><%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b><b>&nbsp;</b> </span><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span>&nbsp;<b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a> &nbsp;</b></span><b><%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none">&nbsp;<%=firma[8] %></a></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b></td>
            </tr>
                
              
              
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 25px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 25px; width: 600px; text-align: center" class="cizgi orta"><b>DESCRIPTION</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TYPE OF PACKAGE</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>NO OF<br />
                    PACKAGE</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>UNIT NET
                    
                    WEIGHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>UNIT GROSS
                    WEIGHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL NET WEIGHT (KGS)
                    </b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL GROSS WEIGHT (KGS)
                    </b></td>
            </tr>
            <%
                int a = 1;
                SqlCommand mamulcek = new SqlCommand("select case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun,Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft')  end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then CONVERT(varchar,BBAgirligi)+' '+BBTipi end as BigBag, case when Palet='YOK' then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end as UniteAgirlik, case  when KonteynerBulkSecimi <> 'RORO' then  case when REPLACE(Palet,'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+10 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end  else case when REPLACE(Palet,'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+10 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end end as BrutAgirlik,case when Palet <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi, case when Palet <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when Palet='YOK' then case when BBTipi <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when BBTipi ='YOK' then 0 end end as NetAgirlik, case when o.KonteynerBulkSecimi <> 'RORO' then case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end else case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end end as Brut  from Orders o where o.Durum='SATISA DONDU' and o.TeklifNo=@p1 group by o.Urun,o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,o.UrunAnaGrup,o.KonteynerBulkSecimi", con);
                mamulcek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                SqlDataReader mamuloku = mamulcek.ExecuteReader();
                while (mamuloku.Read())
                {%>
                <tr>
                     <td style="height: 30px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><span><b><%=a.ToString() %></b> </span></td>
                     <td style="height: 30px; width: 600px; text-align: left" class="cizgi yaziboyutu"><b><%=mamuloku["Aciklama"].ToString() %>&nbsp;<%=mamuloku["Urun"].ToString() %></b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><span><%=mamuloku["Torba"].ToString() %></span>&nbsp;<span><span><%=mamuloku["UniteAgirlik"].ToString()+" KGS" %></span>&nbsp;<%=mamuloku["BigBag"].ToString() %></span>&nbsp;<%=mamuloku["Palet"].ToString()%>&nbsp;<%=mamuloku["Strec"].ToString() %></b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku["PaketSayisi"] %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku["UniteAgirlik"].ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku["BrutAgirlik"].ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku["NetAgirlik"]) %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku["Brut"]) %></b></td>
               </tr>
                <%
                    a++;
                    Session["ks"] = a;
                }
                
            %>
              <%
             
                  for (int i =Convert.ToInt32(Session["ks"]); i <= 8; i++)
                  {%>
                      <tr>
                <td style="height: 15px; width: 50px; text-align: center" class="cizgi"><span><b><%=i.ToString() %></b></span></td>
                <td style="height: 15px; width: 600px; text-align: left" class="cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
            </tr>
                  <%}
             
             
                 %>

            <tr>
                <td colspan="3" style="height: 30px;" class="orta cizgi"><b> TOTAL VALUE</b></td>
                <td style="height: 30px;" class="cizgi orta"><b><%=toplampaket[0].ToString() %></b></td>
                <td style="height: 30px;" class="cizgi orta"><b>&nbsp;</b></td>
                <td style="height: 30px;" class="cizgi orta"><b>&nbsp;</b></td>
                <td style="height: 30px;" class="cizgi orta"><b> <%=netagirlik[0].ToString() %></b></td>
                <td style="height: 30px;" class="cizgi orta"><b><%=brutagirlik[0].ToString() %></b></td>
                <%--<td colspan="4" style="height: 30px;" class="cizgi orta"><b> &nbsp;</b></td>--%>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PACKING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="7"><b><span>
                    <%
                     SqlCommand pakettipi3 = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when REPLACE(Palet,'YOK',0)=0 then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when REPLACE(Palet,'YOK',0)=0 then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where TeklifNo=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                        pakettipi3.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                        SqlDataReader p3 = pakettipi3.ExecuteReader();
                        while (p3.Read())
                        {%>
                          <span><b><%=p3["Torba"].ToString() %>&nbsp;<%=p3["UniteAgirlik"].ToString() %>&nbsp;KGS &nbsp;<%=p3["BigBag"].ToString() %>&nbsp;<%=p3["Palet"].ToString() %>&nbsp;<%=p3["Strec"].ToString() %>&nbsp;(<%=p3["PaketSayisi"].ToString() %> PCS)</b></span>  
                          <br />
                          
                      <%
                            
                      }
                 %>
             </span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">UNIT WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="7"><b><span >
                      <%
                     SqlCommand unit3 = new SqlCommand("select  case when Palet <> 'YOK' then Palet  when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi  when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik, case when  KonteynerBulkSecimi <> 'RORO' then   case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end else  case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end end as Brut from Orders where TeklifNo=@p1 group by Palet,BBTipi,BBAgirligi,Ulke,KonteynerBulkSecimi", con);
                      unit3.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                      SqlDataReader un3 = unit3.ExecuteReader();
                      while(un3.Read())
                      {%>
                          <span><b>&nbsp;<%=un3["UniteAgirlik"].ToString() %>&nbsp;KGS NET WEIGHT</b></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><b><%=un3["Brut"].ToString() %> KGS GROSS WEIGHT</b></span> 
                          <br />
                      <%}                                                        
                                                                                  
                  %>
             </span></b></td>
                
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">TOTAL WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><span><%=foot[4] %> KGS NET WEIGHT</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                                                                                                                                                                          
                   <span><b><%=brutagirlik_1%>&nbsp;KGS GROSS WEIGHT</b></span>
                                                                                                                                                                                                                           </td>
             <td class="cizgi yaziboyutu orta" style="height:15px;text-decoration:none"  colspan="5"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#exampleModalScrollable">SPECIAL NOTES</a></span></b></td>
               </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF PACKAGE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><span><%=toplampaket[0].ToString() %>&nbsp;PCS</span></b></td>
                  <td class="cizgi yaziboyutu" style="vertical-align:top;word-break:break-all;" colspan="5" rowspan="3"><b><span><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%"><%=baslik[7]%></textarea></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#modal2">NO OF FCL</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><span><%=foot[7] %></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">CMB</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><span><%=foot[9] %>"</span></b></td>
            </tr>
                   <tr>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span></b></td>
                <td class="cizgi yaziboyutu orta" colspan="5" rowspan="6"><b><asp:Image ID="img_yeri" runat="server"/></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span> </b></td>
            </tr>
             <tr>
                 <td class="cizgi orta yaziboyutu" colspan="3" style="height:100px; vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
                   <td class="cizgi orta yaziboyutu" colspan="5" style="height:100px;vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
             </tr>
            
        </table>
                 <%}
                 else if (kalemsayisi >= 9 && kalemsayisi <= 16)
                 {%>
                    <table class=<%if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ")
                       {%> "arkaplannigtas" <%}
                                   else if (baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                       {%> "arkaplanmikrokal" <%}
                                   else if (baslik[6] == "ASKAL LTD.ŞTİ.")
                       {%> "arkaplanaskal" <%}    %>>
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
                <td colspan="8" style="text-align: center; font-size: 40px; height: 50px;"><span style="text-align: center;"><b> PACKING LIST</b></span></td>
            </tr>
                   <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <%=fatura[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" colspan="2" style="height:15px;" ><span class="kaydiryirmi"><b> <%=fatura2.ToShortDateString() %></b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></a></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b> PO :<%=baslik[3] %></b></span></td>
                   
                  
                   </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="5" class="cizgi orta" style="width:600px;height:25px;"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal">CUSTOMER</a></b></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %></b> </span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span> </td>      
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span>&nbsp;<b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><%=baslikdetay[9] %>:</a></b></span>&nbsp;<b><%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span>&nbsp;<b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span>&nbsp;<b><%=baslikdetay[4] %></b></td>
            </tr>
          
             <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span>&nbsp;<b><%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b><b>&nbsp;</b> </span><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span>&nbsp;<b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a> &nbsp;</b></span><b><%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none">&nbsp;<%=firma[8] %></a></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b></td>
            </tr>
                
              
              
              
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 25px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 25px; width: 600px; text-align: center" class="cizgi orta"><b>DESCRIPTION</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TYPE OF PACKAGE</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>NO OF<br />
                    PACKAGE</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>UNIT NET
                    
                    WEIGHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>UNIT GROSS
                    WEIGHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL NET WEIGHT (KGS)
                    </b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL GROSS WEIGHT (KGS)
                    </b></td>
            </tr>
            <%
                //int a = 1;
                     SqlCommand mamulcek = new SqlCommand("with myResult(sira,Aciklama,Urun,Torba,BigBag,Palet,Strec,UniteAgirlik,BrutAgirlik,PaketSayisi,NetAgirlik,Brut)as(select ROW_NUMBER() OVER(order by UrunAnaGrup) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun,Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft')  end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then CONVERT(varchar,BBAgirligi)+' '+BBTipi end as BigBag, case when Palet='YOK' then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end as UniteAgirlik, case when KonteynerBulkSecimi <> 'RORO' then case when REPLACE(Palet,'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+10 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end  else case when REPLACE(Palet,'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+10 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end  end as BrutAgirlik,case when Palet <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi, case when Palet <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when Palet='YOK' then case when BBTipi <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when BBTipi ='YOK' then 0 end end as NetAgirlik, case when KonteynerBulkSecimi <> 'RORO' then case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end  else case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end  end  as Brut  from Orders o where o.Durum='SATISA DONDU' and o.TeklifNo=@p1 group by o.Urun,o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,o.UrunAnaGrup,KonteynerBulkSecimi)select *from myResult where sira between 1 and 8", con); 
                     mamulcek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                SqlDataReader mamuloku = mamulcek.ExecuteReader();
                while (mamuloku.Read())
                {%>
                <tr>
                     <td style="height: 30px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><span><b><%=mamuloku["sira"].ToString() %></b> </span></td>
                     <td style="height: 30px; width: 600px; text-align: left" class="cizgi yaziboyutu"><b><%=mamuloku["Aciklama"].ToString() %>&nbsp;<%=mamuloku["Urun"].ToString() %></b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><span><%=mamuloku["Torba"].ToString() %></span>&nbsp;<span><span><%=mamuloku["UniteAgirlik"].ToString()+" KGS" %></span>&nbsp;<%=mamuloku["BigBag"].ToString() %></span>&nbsp;<%=mamuloku["Palet"].ToString()%>&nbsp;<%=mamuloku["Strec"].ToString() %></b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku["PaketSayisi"] %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku["UniteAgirlik"].ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku["BrutAgirlik"].ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku["NetAgirlik"]) %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku["Brut"]) %></b></td>
               </tr>
                <%
                    //a++;
                    Session["sira"] = mamuloku["sira"].ToString();
                   
                }

                     for (int i = Convert.ToInt32(Session["sira"]); i < 8; i++)
                         {%>
                      <tr>
                <td style="height: 15px; width: 50px; text-align: center" class="cizgi"><span><b><%=i.ToString() %></b></span></td>
                <td style="height: 15px; width: 600px; text-align: left" class="cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
            </tr>
                  <%}
            %>
            
              <%
             
                       
             
             
                 %>

          <%-- <tr>
                <td colspan="3" style="height: 30px;" class="orta cizgi"><b> TOTAL VALUE</b></td>
                <td style="height: 30px;" class="cizgi orta"><b><%=toplampaket[0].ToString() %></b></td>
                <td style="height: 30px;" class="cizgi orta"><b>&nbsp;</b></td>
                <td style="height: 30px;" class="cizgi orta"><b>&nbsp;</b></td>
                <td style="height: 30px;" class="cizgi orta"><b> <%=netagirlik[0].ToString() %></b></td>
                <td style="height: 30px;" class="cizgi orta"><b><%=brutagirlik[0].ToString() %></b></td>
               
            </tr>--%>
          <%
                     for (int i = 0; i <= 10; i++)
                     {%>
                          <tr>
                <td colspan="8"><span style="text-align: center;"></span></td>
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
                         {%> "arkaplanaskal" <%}    %>>
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
                <td colspan="8" style="text-align: center; font-size: 40px; height: 50px;"><span style="text-align: center;"><b> PACKING LIST</b></span></td>
            </tr>
                 <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <%=fatura[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" colspan="2" style="height:15px;" ><span class="kaydiryirmi"><b> <%=fatura2.ToShortDateString() %></b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></a></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b> PO :<%=baslik[3] %></b></span></td>
                   
                  
                   </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="5" class="cizgi orta" style="width:600px;height:25px;"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal">CUSTOMER</a></b></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %></b> </span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span> </td>      
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span>&nbsp;<b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><%=baslikdetay[9] %>:</a></b></span>&nbsp;<b><%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span>&nbsp;<b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span>&nbsp;<b><%=baslikdetay[4] %></b></td>
            </tr>
          
             <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span>&nbsp;<b><%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b><b>&nbsp;</b> </span><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span>&nbsp;<b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a> &nbsp;</b></span><b><%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none">&nbsp;<%=firma[8] %></a></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b></td>
            </tr>
                
              
              
              
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 25px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 25px; width: 600px; text-align: center" class="cizgi orta"><b>DESCRIPTION</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TYPE OF PACKAGE</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>NO OF<br />
                    PACKAGE</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>UNIT NET
                    
                    WEIGHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>UNIT GROSS
                    WEIGHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL NET WEIGHT (KGS)
                    </b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL GROSS WEIGHT (KGS)
                    </b></td>
            </tr>
            <%
                //int a2 = 1;
                     SqlCommand mamulcek2 = new SqlCommand("with myResult(sira,Aciklama,Urun,Torba,BigBag,Palet,Strec,UniteAgirlik,BrutAgirlik,PaketSayisi,NetAgirlik,Brut)as(select ROW_NUMBER() OVER(order by UrunAnaGrup) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun,Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft')  end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then CONVERT(varchar,BBAgirligi)+' '+BBTipi end as BigBag, case when Palet='YOK' then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end as UniteAgirlik, case when KonteynerBulkSecimi <> 'RORO' then case when REPLACE(Palet,'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+10 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end  else case when REPLACE(Palet,'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+10 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end  end as BrutAgirlik,case when Palet <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi, case when Palet <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when Palet='YOK' then case when BBTipi <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when BBTipi ='YOK' then 0 end end as NetAgirlik, case when KonteynerBulkSecimi <> 'RORO' then case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end  else case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end  end  as Brut  from Orders o where o.Durum='SATISA DONDU' and o.TeklifNo=@p1 group by o.Urun,o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,o.UrunAnaGrup,KonteynerBulkSecimi)select *from myResult where sira between 9 and 16", con);
                mamulcek2.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                SqlDataReader mamuloku2 = mamulcek2.ExecuteReader();
                while (mamuloku2.Read())
                {%>
                <tr>
                     <td style="height: 30px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><span><b><%=mamuloku2["sira"].ToString() %></b> </span></td>
                     <td style="height: 30px; width: 600px; text-align: left" class="cizgi yaziboyutu"><b><%=mamuloku2["Aciklama"].ToString() %>&nbsp;<%=mamuloku2["Urun"].ToString() %></b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><span><%=mamuloku2["Torba"].ToString() %></span>&nbsp;<span><span><%=mamuloku2["UniteAgirlik"].ToString()+" KGS" %></span>&nbsp;<%=mamuloku2["BigBag"].ToString() %></span>&nbsp;<%=mamuloku2["Palet"].ToString()%>&nbsp;<%=mamuloku2["Strec"].ToString() %></b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku2["PaketSayisi"] %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku2["UniteAgirlik"].ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku2["BrutAgirlik"].ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku2["NetAgirlik"]) %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku2["Brut"]) %></b></td>
               </tr>

                <%
                    Session["sira"] = mamuloku2["sira"].ToString();
                    //a2++;
                }
                   for (int i = Convert.ToInt32(Session["sira"])+1; i <=16; i++)
                     {%>
                             <tr>
                     <td style="height: 30px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><span><b><%=i.ToString() %></b> </span></td>
                     <td style="height: 30px; width: 600px; text-align: left" class="cizgi yaziboyutu"><b>&nbsp;</b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><span>&nbsp;</span></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
               </tr>
                     <%}
                
            %>
              <%
             
                  for (int i = 1; i <= sayac; i++)
                  {%>
                      <tr>
                <td style="height: 15px; width: 50px; text-align: center"><span><b>&nbsp;</b></span></td>
                <td style="height: 15px; width: 600px; text-align: left"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta"><b>&nbsp;</b></td>
            </tr>
                  <%}
             
             
                 %>

          
                   <tr>
                <td colspan="3" style="height: 30px;" class="orta cizgi"><b> TOTAL VALUE</b></td>
                <td style="height: 30px;" class="cizgi orta"><b><%=toplampaket[0].ToString() %></b></td>
                <td style="height: 30px;" class="cizgi orta"><b>&nbsp;</b></td>
                <td style="height: 30px;" class="cizgi orta"><b>&nbsp;</b></td>
                <td style="height: 30px;" class="cizgi orta"><b> <%=netagirlik[0].ToString() %></b></td>
                <td style="height: 30px;" class="cizgi orta"><b><%=brutagirlik[0].ToString() %></b></td>
                <%--<td colspan="4" style="height: 30px;" class="cizgi orta"><b> &nbsp;</b></td>--%>
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PACKING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="7"><b><span>
                    <%
                     SqlCommand pakettipi33 = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when REPLACE(Palet,'YOK',0)=0 then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when REPLACE(Palet,'YOK',0)=0 then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where TeklifNo=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                        pakettipi33.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                        SqlDataReader p33 = pakettipi33.ExecuteReader();
                        while (p33.Read())
                        {%>
                          <span><b><%=p33["Torba"].ToString() %>&nbsp;<%=p33["UniteAgirlik"].ToString() %>&nbsp;KGS &nbsp;<%=p33["BigBag"].ToString() %>&nbsp;<%=p33["Palet"].ToString() %>&nbsp;<%=p33["Strec"].ToString() %>&nbsp;(<%=p33["PaketSayisi"].ToString() %> PCS)</b></span>  
                          <br />
                          
                      <%}
                 %>
             </span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">UNIT WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="7"><b><span >
                      <%
                     SqlCommand unit33 = new SqlCommand("select  case when Palet <> 'YOK' then Palet  when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi  when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik, case when  KonteynerBulkSecimi <> 'RORO' then   case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end else  case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end end as Brut from Orders where TeklifNo=@p1 group by Palet,BBTipi,BBAgirligi,Ulke,KonteynerBulkSecimi", con);
                      unit33.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                      SqlDataReader un33 = unit33.ExecuteReader();
                      while(un33.Read())
                      {%>
                          <span><b>&nbsp;<%=un33["UniteAgirlik"].ToString() %>&nbsp;KGS NET WEIGHT</b></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><b><%=un33["Brut"].ToString() %> KGS GROSS WEIGHT</b></span> 
                          <br />
                      <%}                                                        
                                                                                  
                  %>
             </span></b></td>
                
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">TOTAL WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><span><%=foot[4] %> KGS NET WEIGHT</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <span><b><%=brutagirlik_1%>&nbsp;KGS GROSS WEIGHT</b></span>
              </td>
             <td class="cizgi yaziboyutu orta" style="height:15px;text-decoration:none"  colspan="5"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#exampleModalScrollable">SPECIAL NOTES</a></span></b></td>
               </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF PACKAGE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><span><%=toplampaket[0].ToString() %>&nbsp;PCS</span></b></td>
                  <td class="cizgi yaziboyutu" style="vertical-align:top;word-break:break-all;" colspan="5" rowspan="3"><b><span><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%"><%=baslik[7]%></textarea></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#modal2">NO OF FCL</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><span><%=foot[7] %></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">CMB</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><span><%=foot[9] %>"</span></b></td>
            </tr>
                   <tr>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span></b></td>
                <td class="cizgi yaziboyutu orta" colspan="5" rowspan="4"><b><asp:Image ID="Image2" runat="server" Height="100"/></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span> </b></td>
            </tr>
             
             <tr>
                 <td class="cizgi orta yaziboyutu" colspan="3" style="height:120px; vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
                   <td class="cizgi orta yaziboyutu" colspan="5" style="height:120px;vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
             </tr>
        </table>
                 <%}
                 else if (kalemsayisi > 16 && kalemsayisi <= 24)
                 {%>
                      <table class=<%if (baslik[6] == "NİĞTAŞ ANONİM ŞİRKETİ")
                       {%> "arkaplannigtas" <%}
                                     else if (baslik[6] == "MİKROKAL ANONİM ŞİRKETİ")
                       {%> "arkaplanmikrokal" <%}
                                     else if (baslik[6] == "ASKAL LTD.ŞTİ.")
                       {%> "arkaplanaskal" <%}    %>>
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
                <td colspan="8" style="text-align: center; font-size: 40px; height: 50px;"><span style="text-align: center;"><b> PACKING LIST</b></span></td>
            </tr>
                 <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <%=fatura[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" colspan="2" style="height:15px;" ><span class="kaydiryirmi"><b> <%=fatura2.ToShortDateString() %></b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></a></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b> PO :<%=baslik[3] %></b></span></td>
                   
                  
                   </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="5" class="cizgi orta" style="width:600px;height:25px;"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal">CUSTOMER</a></b></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %></b> </span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span> </td>      
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span>&nbsp;<b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><%=baslikdetay[9] %>:</a></b></span>&nbsp;<b><%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span>&nbsp;<b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span>&nbsp;<b><%=baslikdetay[4] %></b></td>
            </tr>
          
             <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span>&nbsp;<b><%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b><b>&nbsp;</b> </span><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span>&nbsp;<b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a> &nbsp;</b></span><b><%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none">&nbsp;<%=firma[8] %></a></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b></td>
            </tr>
                
              
              
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 25px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 25px; width: 600px; text-align: center" class="cizgi orta"><b>DESCRIPTION</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TYPE OF PACKAGE</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>NO OF<br />
                    PACKAGE</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>UNIT NET
                    
                    WEIGHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>UNIT GROSS
                    WEIGHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL NET WEIGHT (KGS)
                    </b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL GROSS WEIGHT (KGS)
                    </b></td>
            </tr>
            <%
                //int a = 1;
                     SqlCommand mamulcek = new SqlCommand("with myResult(sira,Aciklama,Urun,Torba,BigBag,Palet,Strec,UniteAgirlik,BrutAgirlik,PaketSayisi,NetAgirlik,Brut)as(select ROW_NUMBER() OVER(order by UrunAnaGrup) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun,Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft')  end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then CONVERT(varchar,BBAgirligi)+' '+BBTipi end as BigBag, case when Palet='YOK' then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end as UniteAgirlik, case when KonteynerBulkSecimi <> 'RORO' then case when REPLACE(Palet,'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+10 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end  else case when REPLACE(Palet,'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+10 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end  end as BrutAgirlik,case when Palet <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi, case when Palet <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when Palet='YOK' then case when BBTipi <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when BBTipi ='YOK' then 0 end end as NetAgirlik, case when KonteynerBulkSecimi <> 'RORO' then case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end  else case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end  end  as Brut  from Orders o where o.Durum='SATISA DONDU' and o.TeklifNo=@p1 group by o.Urun,o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,o.UrunAnaGrup,KonteynerBulkSecimi)select *from myResult where sira between 1 and 8", con);
                mamulcek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                SqlDataReader mamuloku = mamulcek.ExecuteReader();
                while (mamuloku.Read())
                {%>
                <tr>
                     <td style="height: 30px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><span><b><%=mamuloku["sira"].ToString() %></b> </span></td>
                     <td style="height: 30px; width: 600px; text-align: left" class="cizgi yaziboyutu"><b><%=mamuloku["Aciklama"].ToString() %>&nbsp;<%=mamuloku["Urun"].ToString() %></b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><span><%=mamuloku["Torba"].ToString() %></span>&nbsp;<span><span><%=mamuloku["UniteAgirlik"].ToString()+" KGS" %></span>&nbsp;<%=mamuloku["BigBag"].ToString() %></span>&nbsp;<%=mamuloku["Palet"].ToString()%>&nbsp;<%=mamuloku["Strec"].ToString() %></b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku["PaketSayisi"] %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku["UniteAgirlik"].ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku["BrutAgirlik"].ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku["NetAgirlik"]) %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku["Brut"]) %></b></td>
               </tr>
                <%
                    //a++;
                    Session["sira"] = mamuloku["sira"].ToString();
                   
                }

                     for (int i = Convert.ToInt32(Session["sira"]); i < 8; i++)
                         {%>
                      <tr>
                <td style="height: 15px; width: 50px; text-align: center" class="cizgi"><span><b><%=i.ToString() %></b></span></td>
                <td style="height: 15px; width: 600px; text-align: left" class="cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta cizgi"><b>&nbsp;</b></td>
            </tr>
                  <%}
            %>
            
              <%
             
                       
             
             
                 %>

          <%-- <tr>
                <td colspan="3" style="height: 30px;" class="orta cizgi"><b> TOTAL VALUE</b></td>
                <td style="height: 30px;" class="cizgi orta"><b><%=toplampaket[0].ToString() %></b></td>
                <td style="height: 30px;" class="cizgi orta"><b>&nbsp;</b></td>
                <td style="height: 30px;" class="cizgi orta"><b>&nbsp;</b></td>
                <td style="height: 30px;" class="cizgi orta"><b> <%=netagirlik[0].ToString() %></b></td>
                <td style="height: 30px;" class="cizgi orta"><b><%=brutagirlik[0].ToString() %></b></td>
               
            </tr>--%>
          <%
                     for (int i = 0; i <= 10; i++)
                     {%>
                          <tr>
                <td colspan="8"><span style="text-align: center;"></span></td>
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
                         {%> "arkaplanaskal" <%}    %>>
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
                <td colspan="8" style="text-align: center; font-size: 40px; height: 50px;"><span style="text-align: center;"><b> PACKING LIST</b></span></td>
            </tr>
                 <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <%=fatura[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" colspan="2" style="height:15px;" ><span class="kaydiryirmi"><b> <%=fatura2.ToShortDateString()%></b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></a></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b> PO :<%=baslik[3] %></b></span></td>
                   
                  
                   </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="5" class="cizgi orta" style="width:600px;height:25px;"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal">CUSTOMER</a></b></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %></b> </span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span> </td>      
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span>&nbsp;<b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><%=baslikdetay[9] %>:</a></b></span>&nbsp;<b><%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span>&nbsp;<b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span>&nbsp;<b><%=baslikdetay[4] %></b></td>
            </tr>
          
             <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span>&nbsp;<b><%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b><b>&nbsp;</b> </span><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span>&nbsp;<b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a> &nbsp;</b></span><b><%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none">&nbsp;<%=firma[8] %></a></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b></td>
            </tr>
                
              
              
              
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 25px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 25px; width: 600px; text-align: center" class="cizgi orta"><b>DESCRIPTION</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TYPE OF PACKAGE</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>NO OF<br />
                    PACKAGE</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>UNIT NET
                    
                    WEIGHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>UNIT GROSS
                    WEIGHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL NET WEIGHT (KGS)
                    </b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL GROSS WEIGHT (KGS)
                    </b></td>
            </tr>
            <%
                //int a2 = 1;
                     SqlCommand mamulcek2 = new SqlCommand("with myResult(sira,Aciklama,Urun,Torba,BigBag,Palet,Strec,UniteAgirlik,BrutAgirlik,PaketSayisi,NetAgirlik,Brut)as(select ROW_NUMBER() OVER(order by UrunAnaGrup) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun,Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft')  end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then CONVERT(varchar,BBAgirligi)+' '+BBTipi end as BigBag, case when Palet='YOK' then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end as UniteAgirlik, case when KonteynerBulkSecimi <> 'RORO' then case when REPLACE(Palet,'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+10 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end  else case when REPLACE(Palet,'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+10 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end  end as BrutAgirlik,case when Palet <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi, case when Palet <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when Palet='YOK' then case when BBTipi <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when BBTipi ='YOK' then 0 end end as NetAgirlik, case when KonteynerBulkSecimi <> 'RORO' then case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end  else case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end  end  as Brut  from Orders o where o.Durum='SATISA DONDU' and o.TeklifNo=@p1 group by o.Urun,o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,o.UrunAnaGrup,KonteynerBulkSecimi)select *from myResult where sira between 9 and 16", con);
                mamulcek2.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                SqlDataReader mamuloku2 = mamulcek2.ExecuteReader();
                while (mamuloku2.Read())
                {%>
                <tr>
                     <td style="height: 30px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><span><b><%=mamuloku2["sira"].ToString() %></b> </span></td>
                     <td style="height: 30px; width: 600px; text-align: left" class="cizgi yaziboyutu"><b><%=mamuloku2["Aciklama"].ToString() %>&nbsp;<%=mamuloku2["Urun"].ToString() %></b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><span><%=mamuloku2["Torba"].ToString() %></span>&nbsp;<span><span><%=mamuloku2["UniteAgirlik"].ToString()+" KGS" %></span>&nbsp;<%=mamuloku2["BigBag"].ToString() %></span>&nbsp;<%=mamuloku2["Palet"].ToString()%>&nbsp;<%=mamuloku2["Strec"].ToString() %></b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku2["PaketSayisi"] %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku2["UniteAgirlik"].ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku2["BrutAgirlik"].ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku2["NetAgirlik"]) %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku2["Brut"]) %></b></td>
               </tr>

                <%
                    Session["sira"] = mamuloku2["sira"].ToString();
                    //a2++;
                }
                   for (int i = Convert.ToInt32(Session["sira"])+1; i <=16; i++)
                     {%>
                             <tr>
                     <td style="height: 30px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><span><b><%=i.ToString() %></b> </span></td>
                     <td style="height: 30px; width: 600px; text-align: left" class="cizgi yaziboyutu"><b>&nbsp;</b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><span>&nbsp;</span></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
               </tr>
                     <%}
                
            %>
              <%
             
                  for (int i = 1; i <= sayac; i++)
                  {%>
                      <tr>
                <td style="height: 15px; width: 50px; text-align: center"><span><b>&nbsp;</b></span></td>
                <td style="height: 15px; width: 600px; text-align: left"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta"><b>&nbsp;</b></td>
                <td style="height: 15px; width: 100px;" class="orta"><b>&nbsp;</b></td>
            </tr>
                  <%}
             
             
                 %>

          
          <%
                     for (int i = 0; i <= 10; i++)
                     {%>
                         <tr>
                              <td colspan="8"><b>&nbsp;</b></td>
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
                         {%> "arkaplanaskal" <%}    %>>
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
                <td colspan="8" style="text-align: center; font-size: 40px; height: 50px;"><span style="text-align: center;"><b> PACKING LIST</b></span></td>
            </tr>
                 <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> <%=fatura[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" colspan="2" style="height:15px;" ><span class="kaydiryirmi"><b> <%=fatura2.ToShortDateString() %></b><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"></a></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b> PO :<%=baslik[3] %></b></span></td>
                   
                  
                   </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="5" class="cizgi orta" style="width:600px;height:25px;"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal">CUSTOMER</a></b></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %></b> </span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span> </td>      
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span>&nbsp;<b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"><%=baslikdetay[9] %>:</a></b></span>&nbsp;<b><%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span>&nbsp;<b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span>&nbsp;<b><%=baslikdetay[4] %></b></td>
            </tr>
          
             <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span>&nbsp;<b><%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b><b>&nbsp;</b> </span><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span>&nbsp;<b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a> &nbsp;</b></span><b><%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none">&nbsp;<%=firma[8] %></a></b></td>
               <td class="cizgi yaziboyutu" colspan="5" style="height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b></td>
            </tr>
                
              
              
              
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 25px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 25px; width: 600px; text-align: center" class="cizgi orta"><b>DESCRIPTION</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TYPE OF PACKAGE</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>NO OF<br />
                    PACKAGE</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>UNIT NET
                    
                    WEIGHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>UNIT GROSS
                    WEIGHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL NET WEIGHT (KGS)
                    </b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL GROSS WEIGHT (KGS)
                    </b></td>
            </tr>
            <%
                //int a2 = 1;
                     SqlCommand mamulcek3 = new SqlCommand("with myResult(sira,Aciklama,Urun,Torba,BigBag,Palet,Strec,UniteAgirlik,BrutAgirlik,PaketSayisi,NetAgirlik,Brut)as(select ROW_NUMBER() OVER(order by UrunAnaGrup) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun,Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft')  end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then CONVERT(varchar,BBAgirligi)+' '+BBTipi end as BigBag, case when Palet='YOK' then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end as UniteAgirlik, case when KonteynerBulkSecimi <> 'RORO' then case when REPLACE(Palet,'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+10 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end  else case when REPLACE(Palet,'YOK',0) <> 0 then CAST(Palet as int)+30 when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then CAST(BBAgirligi as int)+10 when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end  end as BrutAgirlik,case when Palet <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi, case when Palet <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when Palet='YOK' then case when BBTipi <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when BBTipi ='YOK' then 0 end end as NetAgirlik, case when KonteynerBulkSecimi <> 'RORO' then case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end  else case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end  end  as Brut  from Orders o where o.Durum='SATISA DONDU' and o.TeklifNo=@p1 group by o.Urun,o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,o.UrunAnaGrup,KonteynerBulkSecimi)select *from myResult where sira between 17 and 24", con);
                mamulcek3.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                SqlDataReader mamuloku3 = mamulcek3.ExecuteReader();
                while (mamuloku3.Read())
                {%>
                <tr>
                     <td style="height: 30px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><span><b><%=mamuloku3["sira"].ToString() %></b> </span></td>
                     <td style="height: 30px; width: 600px; text-align: left" class="cizgi yaziboyutu"><b><%=mamuloku3["Aciklama"].ToString() %>&nbsp;<%=mamuloku3["Urun"].ToString() %></b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><span><%=mamuloku3["Torba"].ToString() %></span>&nbsp;<span><span><%=mamuloku3["UniteAgirlik"].ToString()+" KGS" %></span>&nbsp;<%=mamuloku3["BigBag"].ToString() %></span>&nbsp;<%=mamuloku3["Palet"].ToString()%>&nbsp;<%=mamuloku3["Strec"].ToString() %></b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku3["PaketSayisi"] %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku3["UniteAgirlik"].ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=mamuloku3["BrutAgirlik"].ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku3["NetAgirlik"]) %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku3["Brut"]) %></b></td>
               </tr>

                <%
                    Session["sira"] = mamuloku3["sira"].ToString();
                    //a2++;
                }
                   for (int i = Convert.ToInt32(Session["sira"])+1; i <25; i++)
                     {%>
                             <tr>
                     <td style="height: 30px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><span><b><%=i.ToString() %></b> </span></td>
                     <td style="height: 30px; width: 600px; text-align: left" class="cizgi yaziboyutu"><b>&nbsp;</b> </td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><span>&nbsp;</span></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b>&nbsp;</b></td>
               </tr>
                     <%}
                
            %>
              <%
             
             
             
             
                 %>

          
                   <tr>
                <td colspan="3" style="height: 30px;" class="orta cizgi"><b> TOTAL VALUE</b></td>
                <td style="height: 30px;" class="cizgi orta"><b><%=toplampaket[0].ToString() %></b></td>
                <td style="height: 30px;" class="cizgi orta"><b>&nbsp;</b></td>
                <td style="height: 30px;" class="cizgi orta"><b>&nbsp;</b></td>
                <td style="height: 30px;" class="cizgi orta"><b> <%=netagirlik[0].ToString() %></b></td>
                <td style="height: 30px;" class="cizgi orta"><b><%=brutagirlik[0].ToString() %></b></td>
                <%--<td colspan="4" style="height: 30px;" class="cizgi orta"><b> &nbsp;</b></td>--%>
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PACKING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="7"><b><span>
                    <%
                     SqlCommand pakettipi33 = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+REPLACE(REPLACE(TorbaTipi,'PE li Kraft','KG PE Kraft'),'PE siz Kraft','KG Kraft') end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when REPLACE(Palet,'YOK',0)=0 then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when REPLACE(Palet,'YOK',0)=0 then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where TeklifNo=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                        pakettipi33.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                        SqlDataReader p33 = pakettipi33.ExecuteReader();
                        while (p33.Read())
                        {%>
                          <span><b><%=p33["Torba"].ToString() %>&nbsp;<%=p33["UniteAgirlik"].ToString() %>&nbsp;KGS &nbsp;<%=p33["BigBag"].ToString() %>&nbsp;<%=p33["Palet"].ToString() %>&nbsp;<%=p33["Strec"].ToString() %>&nbsp;(<%=p33["PaketSayisi"].ToString() %> PCS)</b></span>  
                          <br />
                          
                      <%}
                 %>
             </span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">UNIT WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="7"><b><span >
                      <%
                     SqlCommand unit33 = new SqlCommand("select  case when Palet <> 'YOK' then Palet  when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi  when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik, case when  KonteynerBulkSecimi <> 'RORO' then   case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end else  case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end end as Brut from Orders where TeklifNo=@p1 group by Palet,BBTipi,BBAgirligi,Ulke,KonteynerBulkSecimi", con);
                      unit33.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                      SqlDataReader un33 = unit33.ExecuteReader();
                      while(un33.Read())
                      {%>
                          <span><b>&nbsp;<%=un33["UniteAgirlik"].ToString() %>&nbsp;KGS NET WEIGHT</b></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><b><%=un33["Brut"].ToString() %> KGS GROSS WEIGHT</b></span> 
                          <br />
                      <%
                      
                         
                      }                                                        
                                                                                  
                  %>
             </span></b></td>
                
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">TOTAL WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><span><%=foot[4] %> KGS NET WEIGHT</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <span><b><%=brutagirlik_1%>&nbsp;KGS GROSS WEIGHT</b></span>
              </td>
             <td class="cizgi yaziboyutu orta" style="height:15px;text-decoration:none"  colspan="5"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#exampleModalScrollable">SPECIAL NOTES</a></span></b></td>
               </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF PACKAGE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><span><%=toplampaket[0].ToString() %>&nbsp;PCS</span></b></td>
                  <td class="cizgi yaziboyutu" style="vertical-align:top;word-break:break-all;" colspan="5" rowspan="3"><b><span><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%"><%=baslik[7]%></textarea></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#modal2">NO OF FCL</a></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><span><%=foot[7] %></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">CMB</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="2"><b><span><%=foot[9] %>"</span></b></td>
            </tr>
                   <tr>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span></b></td>
                <td class="cizgi yaziboyutu orta" colspan="5" rowspan="4"><b><asp:Image ID="Image1" runat="server" Height="100"/></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span> </b></td>
            </tr>
             
             <tr>
                 <td class="cizgi orta yaziboyutu" colspan="3" style="height:120px; vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
                   <td class="cizgi orta yaziboyutu" colspan="5" style="height:120px;vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
             </tr>
         
        </table>
        
                 <%}
                   
       
                   
                %>
     
             
        <%SqlConnection.ClearPool(con); %>
    </div>
        <asp:Panel ID="pnl2" runat="server">
             <div style="text-align:center;height:10px;">
        <asp:Button ID="btnPDF2" runat="server" Text="PDF" CssClass="btn btn-warning" Height="40px" BackColor="Orange" ForeColor="White" OnClick="btnPDF2_Click" />
     <a href="OperationPackingList.aspx" class="btn btn-success" style="height:40px; background-color:green;color:white">ANA SAYFA</a>
             </div>
        </asp:Panel>
  
    </form>
    <!-- end row -->



    <!-- end row -->


    <!-- end row -->


    <!--- end row -->





    <!-- Footer Start -->

    <!-- end Footer -->



    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->



    <!-- END wrapper -->

    <!-- Right Sidebar -->

    <!-- /Right-bar -->

    <!-- Right bar overlay-->


    <!-- Vendor js -->
    <script src="assets/js/vendor.min.js"></script>

    <!-- App js -->
    <script src="assets/js/app.min.js"></script>
     <script src="assets/libs/custombox/custombox.min.js"></script>
    <%-- <%con.Close(); %>--%>
</body>
</html>


