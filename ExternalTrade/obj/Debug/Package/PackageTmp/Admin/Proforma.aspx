<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Proforma.aspx.cs" Inherits="ExternalTrade.Admin.Proforma" %>
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
    <link rel="shortcut icon" href="/assets/images/favicon.ico">
      <link href="/assets/css/bootstrap.min.css" id="bootstrap-stylesheet" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
      
    <%-- <link href="assets/css/bootstrap.min.css" rel="stylesheet" />--%>
     <link href="/assets/libs/custombox/custombox.min.css" rel="stylesheet">
    <!-- Icons Css -->
    <link href="/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
      <link href="/assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" />
    <script src="/assets/libs/sweetalert2/sweetalert2.min.js"></script>
    <script src="/assets/js/pages/sweet-alerts.init.js"></script>
    <script src="/jquery-3.6.0.min.js"></script>
    <!-- App Css-->
 
    <style>
        /*color-adjust: exact;
-webkit-print-color-adjust: exact;*/
             .imzakase{
            height:150px;
            width:325px;
             
        }
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

        @media (prefers-reduced-motion:reduce) {
            .btn {
                -webkit-transition: none;
                transition: none;
            }
        }

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


        .orta {
            text-align: center;
        }

        .sag {
            text-align: right;
        }

        .sol {
            text-align: left;
        }

        .yaziboyutu {
            font-size: 12px;
        }

        .baslik {
            font-size: 14px;
        }

        b {
            color: black;
        }

        .renk {
            color: black;
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
        .kaydiryirmi {
            margin-left: 20px;
        }
        .kaydiryirmisag{
             margin-right: 20px;
        }
        .auto-style1 {
            height: 40px;
        }
        .auto-style2 {
            height: 14px;
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
            $(document).on('keydown', function (e) {
                if ((e.ctrlKey || e.metaKey) && (e.key == "p" || e.charCode == 16 || e.charCode == 112 || e.keyCode == 80)) {
                    alert("CTRL düğmesi iptal edilmiştir");
                    e.cancelBubble = true;
                    e.preventDefault();

                    e.stopImmediatePropagation();
                }
            });
    </script>
 <script>
     function successAlert() {
         swal(
             {
                 title: "İŞLEM TAMAMLANDI", text: "KAYDINIZ GÜNCELLLENDİ", type: "success"
             }
             ).then(function () { window.location = 'Proforma.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
     }
 </script>
      <script>
          function errorAlert() {
              swal(
                  {
                      title: "İŞLEM TAMAMLANAMADI", text: "KAYDINIZ GÜNCELLLENEMEDİ", type: "error"
                  }
                  );
          }
 </script>
  
     <script>
         function InvoiceDate() {
             swal({
                 title: "DİKKAT", text: "PROFORMA DATE BİLGİSİNİ BOŞ GEÇEMEZSİNİZ", type: "warning"
             });
         }
   </script>
  <script>
      function InvoiceNo() {
          swal({
              title: "DİKKAT", text: "PROFORMA NO BİLGİSİNİ BOŞ GEÇEMEZSİNİZ", type: "warning"
          });
      }
   </script>
      <script>
          function warningAlert() {
              swal({
                  title: "DİKKAT", text: "Bu Sipariş İçin Daha Önceden Proforma Oluşturduğunuz İçin Düzenleme Yapamazsınız", type: "warning"
              }).then(function () { window.location = 'Proforma.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
          }
    </script>
    <script>
        function MoneyText() {
            swal({
                title: "DİKKAT", text: "Toplam Tutar Değerini Sayıyla Yazmadan İşlem Yapamazsınız", type: "warning"
            });
        }
    </script>
    <script>
        function successCari() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "CARİ BİLGİLERİ GÜNCELLENDİ", type: "success"
            }).then(function () { window.location = 'Proforma.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
        }
        function errorCari() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "CARİ BİLGİLERİ GÜNCELLENEMEDİ", type: "error"
            });
        }
    </script>
    <script>
        function UpdatePOSuccess() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "SPECIAL NOTE BİLGİLERİ GÜNCELLENDİ", type: "success"
            }).then(function () { window.location = 'Proforma.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
        }
        function UpdatePOError() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "SPECIAL NOTE BİLGİLERİ GÜNCELLENEMEDİ", type: "error"
            });
        }
    </script>
    <script>
        function OnayaGitti() {
            swal({
                title: "İŞLEM TAMAMLANDI", text: "Proforma Onaya Gönderildi", type: "success"
            }).then(function () { window.location = 'Proforma.aspx?teklifno=<%=Request.QueryString["teklifno"]%>&gelen=1' });
        }

        function OnayaGitmedi() {
            swal({
                title: "İŞLEM TAMAMLANAMADI", text: "Proforma Onaya Gönderilemedi", type: "error"
            });
        }
    </script>

</head>

<body>
    <form id="form1" runat="server">
         <asp:Panel ID="pnl1" runat="server">
       <div style="text-align: center;height:10px;">
           
     <asp:Button ID="btnProformaOnayi" runat="server" Text="ONAYALA" CssClass="btn btn-primary" Height="40px" BackColor="Blue" ForeColor="White" OnClick="Button1_Click" />
          <asp:Button ID="btnPrintDiv" runat="server" Text="PDF" CssClass="btn btn-warning" OnClick="btnPrintDiv_Click" BackColor="Orange" ForeColor="White" Height="40px"/>
           <a href="OnayBekleyenProformalar.aspx" class="btn btn-success" style="height:40px; background-color:green;color:white">ANA SAYFA</a>
    </div>
         </asp:Panel>
     
          <!-- /.modal -->
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
                                                <p><asp:TextBox ID="txtMoneyText" CssClass="form-control" runat="server"></asp:TextBox></p>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Kapat</button>
                                                <%--<button type="button" class="btn btn-primary">Save</button>--%>
                                                <asp:Button ID="btnMoneyText" runat="server" OnClick="btnMoneyText_Click" Text="GÜNCELLE" CssClass="btn btn-primary" />
                                            </div>
                                        </div>
                                        </div>
                                    </div>
         <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel">&nbsp;</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                    PROFORMA DATE
                                                    <div>
                                                        <asp:TextBox ID="txtProformaDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                                    </div><br />
                                                    PROFORMA NO
                                                    <div>
                                                     
                                                        <asp:TextBox ID="txtProformaNo" runat="server" CssClass="form-control"></asp:TextBox>
                                                   
                                                    </div>
                                                    <div>
                                                        <asp:Button ID="btnProformaDate_No" runat="server" CssClass="btn btn-primary" Text="KAYDET" Height="40px" OnClick="btnProformaDate_No_Click" />
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

       
      <div id="pdf">
       
        <%
            if (Request.QueryString["teklifno"] == null)
                Response.Redirect("Home.aspx");
            string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            DateTime tarih = new DateTime();
            string[] firma = new string[10];
            string[] baslikdetay = new string[30];
            string[] baslik = new string[20];
            string[] banka = new string[10];
            
            string[] paket = new string[10];
            string[] foot = new string[20];
           
            double[] paletagirlik = new double[1];
            double QTY = 0;
            int[] konteynersayisi = new int[1];
            paletagirlik[0] = 0;
            SqlCommand vadecek = new SqlCommand("select Vade from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "' group by Vade", con);

            int kayitsayisi;
            SqlCommand konteynersayisicek = new SqlCommand("select  SUM(distinct SiparistekiKonteynerSayisi)  from Orders where TeklifNo='"+Request.QueryString["teklifno"]+"'", con);
            konteynersayisi[0] = Convert.ToInt32(konteynersayisicek.ExecuteScalar());
            SqlCommand kayit = new SqlCommand("select COUNT(Urun) from Orders where TeklifNo=@p1", con);
            kayit.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            kayitsayisi = Convert.ToInt32(kayit.ExecuteScalar());
           
            SqlCommand baslikcek = new SqlCommand("select ISNULL(USDKUR,0) as USDKUR,ISNULL(EUROKUR,0) as EUROKUR, Temsilci,MusteriIsmi,IletisimeGecilecekKisi,CurrencyUnit,Parite,Company from Orders where TeklifNo=@p1 group by Temsilci,MusteriIsmi,IletisimeGecilecekKisi,CurrencyUnit,Parite,Company,EUROKUR,USDKUR", con);
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
                baslik[9] = baslikoku["USDKUR"].ToString();
                baslik[10] = baslikoku["EUROKUR"].ToString();
            }
            baslikoku.Close();
            SqlCommand baslikcek2 = new SqlCommand("select PO,ProformaInvoiceDate,ProformaInvoiceNo,HSCODE,ProformaSpecialNote from AllOperationDocuments where TeklifNo='"+Request.QueryString["teklifno"]+"'",con);
            SqlDataReader baslikoku2 = baslikcek2.ExecuteReader();
            while(baslikoku2.Read())
            {
                if (baslikoku2["ProformaInvoiceDate"].ToString() == "" && baslikoku2["ProformaInvoiceDate"].ToString() == null)
                {
                    baslik[7] = baslikoku2["ProformaInvoiceDate"].ToString();
                 }
                else
                {
                    tarih = Convert.ToDateTime(baslikoku2["ProformaInvoiceDate"]);
                }
                baslik[3] = baslikoku2["PO"].ToString();
                baslik[8] = baslikoku2["ProformaInvoiceNo"].ToString();
                baslik[11] = baslikoku2["HSCODE"].ToString();
                baslik[12] = baslikoku2["ProformaSpecialNote"].ToString();
                
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

    
            SqlCommand paketcek = new SqlCommand("select REPLACE(TorbaTipi,'YOK','') as TorbaTipi,REPLACE(TorbaAgirligi,0,'') as TorbaAgirligi,REPLACE(BBTipi,'YOK','') as BBTipi,REPLACE(BBAgirligi,0,'') as BBAgirligi from Orders where TeklifNo=@p1", con);
            paketcek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader paketoku = paketcek.ExecuteReader();
            while (paketoku.Read())
            {
                paket[0] = paketoku["TorbaTipi"].ToString();
                paket[1] = paketoku["TorbaAgirligi"].ToString();
                paket[2] = paketoku["BBTipi"].ToString();
                paket[3] = paketoku["BBAgirligi"].ToString();
            }
            paketoku.Close();
            int esikdeger = 8;
            int sayac = 0;
            double totalnetagirlik = 0;
            //SqlCommand mamulsayisi = new SqlCommand("select COUNT(mamul.NAME) from Orders o left outer join DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] mamul on o.YediyuzluKod=mamul.CODE where o.Durum='SATISA DONDU' and mamul.NAME is not null and o.TeklifNo=@p1", con);
            //mamulsayisi.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            //sayac = Convert.ToInt32(mamulsayisi.ExecuteScalar());
            //sayac = esikdeger - sayac;
            SqlCommand foott = new SqlCommand("select case when Palet<> 'YOK'  then 'PALETLİ' when BBTipi <> 'YOK' and Palet='YOK' then 'BBLİ' end PaletDegil, KonteynerBulkSecimi, REPLACE(REPLACE(o.Vade,'Peşin','CASH IN ADVANCE'),'Gün','DAYS AFTER B/L') as Vade,case when o.KalkisLimani='MIP' Then 'MIP (MERSIN INTERNATIONAL PORT)' when o.KalkisLimani='Limak' then 'ISKENDERUN LIMAK' when KalkisLimani='YOK' then '' else UPPER(KalkisLimani) end as KalkisLimani,o.VarisLimani,REPLACE(o.TeklifTipi,'YOK','') as TeklifTipi,CAST(SUM(o.buUrununSiparisTonaji*1000) as decimal(18,0)) as MIKTAR,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int) as Konteyner,case when KalkisLimani='MIP' then '' when KalkisLimani='Limak' then ''   end as Sehir,case  when EkipmanTuru='40 DV' then  CONVERT(nvarchar ,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int))+'X' +' 40 HC' when EkipmanTuru='20 DV' then CONVERT(nvarchar ,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int))+'X' +' 20 DC'  end as Ekipman, case when EkipmanTuru='20 DV' then 20*30 when EkipmanTuru='40 DV' then 40*30 else 0 end as Gross,FobVisible,PaymentTerms  from Orders o where TeklifNo=@p1 group by o.Vade,o.KalkisLimani,o.VarisLimani,o.TeklifTipi,o.EkipmanTuru,FobVisible,KonteynerBulkSecimi,PaymentTerms ,Palet,BBTipi", con);
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
                foot[8] = Convert.ToString(Convert.ToDouble(footer["MIKTAR"])+Convert.ToDouble(footer["Gross"]));
                foot[10] = footer["FobVisible"].ToString();
                foot[13] = footer["PaymentTerms"].ToString();
                foot[14] = footer["KonteynerBulkSecimi"].ToString();
                foot[15] = footer["PaletDegil"].ToString();
            }
            
            footer.Close();
            SqlCommand foott2 = new SqlCommand("select MoneyText from AllOperationDocuments where TeklifNo='"+Request.QueryString["teklifno"]+"'",con);
            SqlDataReader footer2 = foott2.ExecuteReader();
            while(footer2.Read())
            {
                foot[9] = Convert.ToString(footer2["MoneyText"]);
            }
            footer2.Close();
            SqlCommand paletagirlikcek = new SqlCommand("select REPLACE(Palet,'YOK',0) as Palet from Orders where TeklifNo=@p1", con);
            paletagirlikcek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader paletagirlikoku = paletagirlikcek.ExecuteReader();
            while (paletagirlikoku.Read())
            {
                paletagirlik[0] = Convert.ToDouble(paletagirlikoku["Palet"].ToString()) + Convert.ToDouble(paletagirlik[0]);
            }
            paletagirlikoku.Close();
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
            QTY = Convert.ToDouble(foot[4]) / Convert.ToDouble(paletagirlik[0]);
            int kalemsayisi = 0;
            SqlCommand kalemsayisicek = new SqlCommand("select  o.Urun from Orders o  where o.TeklifNo='"+Request.QueryString["teklifno"]+"' group by o.Urun,o.KalemSatisFiyati,o.UrunAnaGrup", con);
            SqlDataReader ks = kalemsayisicek.ExecuteReader();
            while (ks.Read())
            {
                kalemsayisi = kalemsayisi + 1;
            }
            ks.Close();
             string xxx = baslik[4];
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
             int paketsayisi=0;
             string pakettipi10="";
             SqlCommand paketvetipi = new SqlCommand("Operation_NoOfPackage", con);
             paketvetipi.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
             paketvetipi.CommandType = CommandType.StoredProcedure;
             SqlDataAdapter pt = new SqlDataAdapter();
             pt.SelectCommand = paketvetipi;
             DataTable pttipi = new DataTable();
             pt.Fill(pttipi);
             foreach(DataRow dr in pttipi.Rows){
                 //paketsayisi = paketsayisi + Convert.ToInt32(dr["PAKET"]);
                 pakettipi10 = dr["PAKETTIPI"].ToString();
             }
        %>
        <%--PROFORMA--%>
       <%--        <div id="myModal2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                    </div><!-- /.modal -->--%>
       <%--    <div id="myModal4" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                    </div><!-- /.modal -->--%>
     <%--      <div id="myModal6" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
        --%>
        
        
        
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
        <%
            if (kalemsayisi <= 8)
            {%>
                   <table  class=<%if (baslik[6] == "NİĞTAŞ")
                       {%> "arkaplannigtas" <%}
                       else if (baslik[6] == "MİKROKAL")
                       {%> "arkaplanmikrokal" <%}
                                                 else if (baslik[6] == "ASKAL")
                       {%> "arkaplanaskal" <%}   
             %>>
            <%
                if (baslik[6] == "NİĞTAŞ" || baslik[6] == "MİKROKAL")
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
                <td colspan="8" style="text-align: center; font-size: 40px;height:40px; " class="auto-style1"><span style="text-align: center;"><b> PROFORMA INVOICE</b></span></td>
            </tr>
              <tr>
                   <td class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target=".bs-example-modal-center">PROFORMA DATE:</a></b></span>&nbsp;</td>
                    <td class="cizgi yaziboyutu"  style="height:15px;"><span class="kaydiryirmi"><span><b><%=tarih.ToShortDateString() %></span></b></span></td>
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b>PROFORMA NO:</b></span></td>
                   <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"><b><%=baslik[8] %></b></a><b>&nbsp;</b></span></td>
             <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;"><span class="kaydiryirmi"><b><a href="#" data-toggle="modal" data-target="#exampleModalScrollable3" style="text-decoration:none; color:black;">P.O</a> </b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2"><span class="kaydiryirmi"><b><%=baslik[3] %></b></span></td>
                  
                   </tr>
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b> SEND BY</b></span></td>
                <td colspan="5" class="cizgi orta" style="width:600px;height:25px;"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal"> SEND TO</a></b></td>
            </tr>
             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %> ANONİM ŞİRKETİ</b> </span></td>
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
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;" ><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"> <%=baslikdetay[9] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><b> <%=baslikdetay[4] %></b></td>
            </tr>
          
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="width:400px; height:15px;"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"> <b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="width:400px; height:15px;"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none"><%=firma[8] %></a> </b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="3"><b > <%=baslikdetay[5] %></b></td>
            </tr>
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="8">&nbsp;</td>
            </tr>
                      
           <%
                if (baslik[4] == "$")
                {
                    if (foot[10] == "False")
                    {%>
                         
                        <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(USD)</b></td>
                        </tr>
                    <%
                        int kayitsira = 1;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_USD", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
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
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }

             
                    }
                    else if (foot[10] == "True")
                    {%>
                           <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>FOB UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(USD)</b></td>
                        </tr>

                     <%
                        int kayitsira = 1;
                        SqlCommand alt = new SqlCommand("Sales_Quotation_Fob_USD", con);
                        alt.Parameters.AddWithValue("@TeklifNo",Request.QueryString["teklifno"]);
                        alt.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter altbilgi = new SqlDataAdapter();
                        altbilgi.SelectCommand = alt;
                        DataTable bilgi = new DataTable();
                        altbilgi.Fill(bilgi);
                        foreach(DataRow dr in bilgi.Rows)
                        {%>
                            <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk"><b><%=kayitsira %></b></td>
                            <td style="text-align: left; width: 500px;height:25px;" class="cizgi renk baslik"><b><%=dr["Aciklama"].ToString() %>&nbsp;<%=dr["Urun"].ToString() %></b> </td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>TON</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["FobSatisFiyati"].ToString() %>$</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=dr["TotalFiyat"].ToString() %>$</b></td>
                        </tr>
                        <%
                            kayitsira++;
                            Session["ks"] = kayitsira;
                        }
                
                     }

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
                <td class="cizgi baslik" style="height:20px; text-align:center;"><span style="text-align: center;"><b>&nbsp;</b> </span></td>
                <td class="cizgi baslik" style="height:20px;text-align:center;" colspan="2"><span style="text-align: center;"><b>TOTAL TON </b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <%
                    if(foot[10]=="True")
                    {%>
                        <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>&nbsp; </b> </span></td>
                    <%}
                 %>
                  
                      
                          <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 10px"><b>TOTAL VALUE</b></span> </td>
                           
                     
                 
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span ><b> $<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="7" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                   
                }
                
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
                        int kayitsira = 1;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_TL", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolarkuru", Convert.ToDouble(baslik[9]));
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
                        Session["ks"] = kayitsira;
                    }
                  
                    }
                    else if (foot[10] == "True")
                    {%>
                           <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>FOB UNIT PRICE<br />(TL/TON)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(TL/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(TL)</b></td>
                        </tr>

                     <%
                        int kayitsira = 1;
                        SqlCommand alt = new SqlCommand("Sales_Quotation_Fob_TL", con);
                        alt.Parameters.AddWithValue("@TeklifNo",Request.QueryString["teklifno"]);
                        alt.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[9]));
                        alt.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter altbilgi = new SqlDataAdapter();
                        altbilgi.SelectCommand = alt;
                        DataTable bilgi = new DataTable();
                        altbilgi.Fill(bilgi);
                        foreach(DataRow dr in bilgi.Rows)
                        {%>
                            <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk"><b><%=kayitsira %></b></td>
                            <td style="text-align: left; width: 500px;height:25px;" class="cizgi renk baslik"><b><%=dr["Aciklama"].ToString() %>&nbsp;<%=dr["Urun"].ToString() %></b> </td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>TON</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["FobSatisFiyati"].ToString() %>₺</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=dr["TotalFiyat"].ToString() %>₺</b></td>
                        </tr>
                        <%
                            kayitsira++;
                            Session["ks"] = kayitsira;
                        }
                 
                     }
                  
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_TL", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[9]));
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                        foreach(DataRow dr2 in dt3.Rows)
                    {%>
            <tr>
                <td class="cizgi baslik" style="height:20px; text-align:center;"><span style="text-align: center;"><b>&nbsp;</b> </span></td>
                <td class="cizgi baslik" style="height:20px;text-align:center;" colspan="2"><span style="text-align: center;"><b>TOTAL TON </b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <%
                    if(foot[10]=="True")
                    {%>
                        <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>&nbsp; </b> </span></td>
                    <%}
                 %>
                  
                      
                          <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 10px"><b>TOTAL VALUE</b> </span></td>
                           
                     
                 
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span ><b> ₺<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="7" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                }
                else if (baslik[4] == "€")
                {
                    if (foot[10] == "False")
                    {%>
                       <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(EUR/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(EUR)</b></td>
                        </tr> 

                    <%
                        int kayitsira = 1;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_EUR", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
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
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
                 
                    
                    }
                    else if (foot[10] == "True")
                    {%>
                            <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>FOB UNIT PRICE<br />(EUR/TON)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(EUR/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(EUR)</b></td>
                        </tr>

                     <%
                        int kayitsira = 1;
                        SqlCommand alt = new SqlCommand("Sales_Quotation_Fob_EUR", con);
                        alt.Parameters.AddWithValue("@TeklifNo",Request.QueryString["teklifno"]);
                        alt.Parameters.AddWithValue("@parite",Convert.ToDouble(baslik[5]));
                        alt.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter altbilgi = new SqlDataAdapter();
                        altbilgi.SelectCommand = alt;
                        DataTable bilgi = new DataTable();
                        altbilgi.Fill(bilgi);
                        foreach(DataRow dr in bilgi.Rows)
                        {%>
                            <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk"><b><%=kayitsira %></b></td>
                            <td style="text-align: left; width: 500px;height:25px;" class="cizgi renk baslik"><b><%=dr["Aciklama"].ToString() %>&nbsp;<%=dr["Urun"].ToString() %></b> </td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>TON</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["FobSatisFiyati"].ToString() %>€</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=dr["TotalFiyat"].ToString() %>€</b></td>
                        </tr>
                        <%
                            kayitsira++;
                            Session["ks"] = kayitsira++;
                        }
                 
                     }
                  
                    
                      
                         SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_EUR", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.Parameters.AddWithValue("@parite",Convert.ToDouble(baslik[5]));
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                        foreach(DataRow dr2 in dt3.Rows)
                    {%>
               <tr>
                <td class="cizgi baslik" style="height:20px; text-align:center;"><span style="text-align: center;"><b>&nbsp;</b> </span></td>
                <td class="cizgi baslik" style="height:20px;text-align:center;" colspan="2"><span style="text-align: center;"><b>TOTAL TON </b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <%
                    if(foot[10]=="True")
                    {%>
                        <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>&nbsp; </b> </span></td>
                    <%}
                 %>
                  
                      
                          <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 10px;"><b>TOTAL VALUE</b> </span></td>
                           
                     
                 
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span ><b> €<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                      

                } 
                
                
                
                
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
                 <td class="cizgi orta yaziboyutu" style="height:15px;" colspan="3"><b><span><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#exampleModalScrollable">SPECIAL NOTES</a></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">UNIT WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3">
                  <%
                SqlCommand unit = new SqlCommand("select  case when Palet <> 'YOK' then Palet  when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi  when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end as Brut from Orders where TeklifNo=@p1 group by Palet,BBTipi,BBAgirligi,Ulke", con);
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
                 <td class="cizgi yaziboyutu" colspan="3" rowspan="10" style="vertical-align:top;word-break:break-all;"><b><span >
                       <textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="10" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%"><%=baslik[12] %></textarea>
                                                                                                                          </span></b></td>
                    
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">TOTAL WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[4] %>&nbsp;KGS NET WEIGHT</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <span><b><%=brutagirlik_1%>&nbsp;KGS GROSS WEIGHT</b></span>
              </td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF PACKAGE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=paketsayisi %>&nbsp;PCS</span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF FCL</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%=foot[7] %></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PAYMENT TERMS</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[13] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ORIGIN</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span>TURKEY</span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi">PORT OF LOADING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[1] %>/TURKEY</span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi">PORT OF DELIVERY</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[2] %></span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">DELIVERY TERMS</span></b></td>
              <td class="kaydiryirmi cizgi yaziboyutu" colspan="3" style="height:15px;"><b><span><%=foot[3] %> <%=foot[6] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#exampleModalScrollable2">HS CODE</a></span></b></td>
              <td class="kaydiryirmi cizgi yaziboyutu" colspan="3" style="height:15px;"><b><span><%=baslik[11] %></span></b></td>
            </tr>
                  <tr>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="4"><b><span class="kaydiryirmi">BANK DETAILS</span></b></td>
                <td class="cizgi yaziboyutu orta" colspan="3" rowspan="6"><b><asp:Image ID="img_yeri" runat="server" Height="100"/></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">BENEFICARY</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"> <b><span><%=baslik[6] %> ANONİM ŞİRKETİ</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">OUR BANK</span></b></td>
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
                 <td class="cizgi orta yaziboyutu" colspan="3" style="height:90px; width:600px; vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b><br />
                     <span style="padding-top:50%">
                         <asp:Image ID="Image1" runat="server" CssClass="imzakase" />
                     </span>
                 </td>
                   <td class="cizgi orta yaziboyutu" colspan="5" style="height:90px;vertical-align:top;width:600px;"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
             </tr>
              </table>  
            <%}
                   else if (kayitsayisi > 8 && kayitsayisi <= 32)
             {%>
                  <table class=<%if (baslik[6] == "NİĞTAŞ")
                       {%> "arkaplannigtas" <%}
                       else if (baslik[6] == "MİKROKAL")
                       {%> "arkaplanmikrokal" <%}else if (baslik[6] == "ASKAL")
                       {%> "arkaplanaskal" <%} %>>

                <%
                if (baslik[6] == "NİĞTAŞ" || baslik[6] == "MİKROKAL")
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
                <td colspan="8" style="text-align: center; font-size: 40px;height:40px; " class="auto-style1"><span style="text-align: center;"><b> PROFORMA INVOICE</b></span></td>
            </tr>
              <tr>
                   <td class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target=".bs-example-modal-center">PROFORMA DATE:</a></b></span>&nbsp;</td>
                    <td class="cizgi yaziboyutu"  style="height:15px;"><span class="kaydiryirmi"><span><b><%=tarih.ToShortDateString() %></span></b></span></td>
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b>PROFORMA NO:</b></span></td>
                   <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"><b><%=baslik[8] %></b></a><b>&nbsp;</b></span></td>
             <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;"><span class="kaydiryirmi"><b><a href="#" data-toggle="modal" data-target="#exampleModalScrollable3" style="text-decoration:none; color:black;">P.O</a> </b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2"><span class="kaydiryirmi"><b><%=baslik[3] %></b></span></td>
                  
                   </tr>
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b> SEND BY</b></span></td>
                <td colspan="5" class="cizgi orta" style="width:600px;height:25px;"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal"> SEND TO</a></b></td>
            </tr>
             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %> ANONİM ŞİRKETİ</b> </span></td>
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
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;" ><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal2"> <%=baslikdetay[9] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal3"><%=baslikdetay[10] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><b> <%=baslikdetay[4] %></b></td>
            </tr>
          
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=firma[5] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal4"><%=baslikdetay[12] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="width:400px; height:15px;"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b><%=ExternalTrade.Classes.UserData.Email %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"> <b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal5"><%=baslikdetay[13] %>:</a></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="width:400px; height:15px;"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b ><a href="https://www.nigtas.com/" style="color:black; text-decoration:none"><%=firma[8] %></a> </b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b style="font-size:11px"><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target="#myModal6"><%=baslikdetay[14] %>:</a></b> </span></td>
                    <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="3"><b > <%=baslikdetay[5] %></b></td>
            </tr>
            <tr>
                <td style="height:1px; vertical-align: top; width: 1200px;" colspan="6">&nbsp;</td>
            </tr>
          <%
                if (baslik[4] == "$")
                {
                    if (foot[10] == "False")
                    {%>
                        <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(USD)</b></td>
                        </tr>
                    <%
                        int kayitsira = 1;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_USD_1_16", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
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
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
               
                    }
                    else if (foot[10] == "True")
                    {%>
                           <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>FOB UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(USD)</b></td>
                        </tr>

                     <%
                        int kayitsira = 1;
                        SqlCommand alt = new SqlCommand("Sales_Quotation_Fob_USD_1_16", con);
                        alt.Parameters.AddWithValue("@TeklifNo",Request.QueryString["teklifno"]);
                        alt.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter altbilgi = new SqlDataAdapter();
                        altbilgi.SelectCommand = alt;
                        DataTable bilgi = new DataTable();
                        altbilgi.Fill(bilgi);
                        foreach(DataRow dr in bilgi.Rows)
                        {%>
                            <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk"><b><%=kayitsira %></b></td>
                            <td style="text-align: left; width: 500px;height:25px;" class="cizgi renk baslik"><b><%=dr["Aciklama"].ToString() %>&nbsp;<%=dr["Urun"].ToString() %></b> </td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>TON</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["FobSatisFiyati"].ToString() %>$</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=dr["TotalFiyat"].ToString() %>$</b></td>
                        </tr>
                        <%
                            kayitsira++;
                            Session["ks"] = kayitsira;
                        }
                        for (int i = Convert.ToInt32(kayitsira); i <= 16; i++)
                    {%>
                        <tr>

                <td style="text-align: center; width: 50px;height:5px;" class="cizgi"><b><%=i.ToString() %></b></td>
                <td style="text-align: center; width: 500px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 50px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 150px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 200px;height:5px;" class="cizgi">&nbsp;</td>
                <td style="text-align: center; width: 250px;height:5px;" class="cizgi">&nbsp;</td>
                            <td style="text-align: center; width: 250px;height:5px;"class="cizgi" >&nbsp;</td>
            </tr>
                <%}
                     }
                     
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_USD", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                        foreach(DataRow dr2 in dt3.Rows)
                    {%>
        <%--    <tr>
                <td class="cizgi baslik" style="height:20px; text-align:center;"><span style="text-align: center;"><b>&nbsp;</b> </span></td>
                <td class="cizgi baslik" style="height:20px;text-align:center;" colspan="2"><span style="text-align: center;"><b>TOTAL TON </b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <%
                    if(foot[10]=="True")
                    {%>
                        <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>&nbsp; </b> </span></td>
                    <%}
                 %>
                  
                      
                          <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE</b> </span></td>
                           
                     
                 
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span ><b> $<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>--%>
          <%-- <tr>
                <td colspan="7" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>--%>
            <%}
                }
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
                        int kayitsira = 1;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_TL_1_16", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[9]));
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
                        Session["ks"] = kayitsira;
                    }
                
                    }
                    else if (foot[10] == "True")
                    {%>
                           <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>FOB UNIT PRICE<br />(TL/TON)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(TL/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(TL)</b></td>
                        </tr>

                     <%
                        int kayitsira = 1;
                        SqlCommand alt = new SqlCommand("Sales_Quotation_Fob_TL_1_16", con);
                        alt.Parameters.AddWithValue("@TeklifNo",Request.QueryString["teklifno"]);
                        alt.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[9]));
                        alt.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter altbilgi = new SqlDataAdapter();
                        altbilgi.SelectCommand = alt;
                        DataTable bilgi = new DataTable();
                        altbilgi.Fill(bilgi);
                        foreach(DataRow dr in bilgi.Rows)
                        {%>
                            <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk"><b><%=kayitsira %></b></td>
                            <td style="text-align: left; width: 500px;height:25px;" class="cizgi renk baslik"><b><%=dr["Aciklama"].ToString() %>&nbsp;<%=dr["Urun"].ToString() %></b> </td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>TON</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["FobSatisFiyati"].ToString() %>₺</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=dr["TotalFiyat"].ToString() %>₺</b></td>
                        </tr>
                        <%
                            kayitsira++;
                            Session["ks"] = kayitsira;
                        }
               
                     }
             
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_TL", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[9]));
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                        foreach(DataRow dr2 in dt3.Rows)
                    {%>
           <%-- <tr>
                <td class="cizgi baslik" style="height:20px; text-align:center;"><span style="text-align: center;"><b>&nbsp;</b> </span></td>
                <td class="cizgi baslik" style="height:20px;text-align:center;" colspan="2"><span style="text-align: center;"><b>TOTAL TON </b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <%
                    if(foot[10]=="True")
                    {%>
                        <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>&nbsp; </b> </span></td>
                    <%}
                 %>
                  
                      
                          <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE</b> </span></td>
                           
                     
                 
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span ><b> ₺<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="7" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>--%>
            <%}
                }
                else if (baslik[4] == "€")
                {
                    if (foot[10] == "False")
                    {%>
                       <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(EUR/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(EUR)</b></td>
                        </tr> 

                    <%
                        int kayitsira = 1;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_EUR_1_16", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
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
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
             
                    
                    }
                    else if (foot[10] == "True")
                    {%>
                            <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>FOB UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(USD)</b></td>
                        </tr>

                     <%
                        int kayitsira = 1;
                        SqlCommand alt = new SqlCommand("Sales_Quotation_Fob_EUR_1_16", con);
                        alt.Parameters.AddWithValue("@TeklifNo",Request.QueryString["teklifno"]);
                        alt.Parameters.AddWithValue("@parite",Convert.ToDouble(baslik[5]));
                        alt.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter altbilgi = new SqlDataAdapter();
                        altbilgi.SelectCommand = alt;
                        DataTable bilgi = new DataTable();
                        altbilgi.Fill(bilgi);
                        foreach(DataRow dr in bilgi.Rows)
                        {%>
                            <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk"><b><%=kayitsira %></b></td>
                            <td style="text-align: left; width: 500px;height:25px;" class="cizgi renk baslik"><b><%=dr["Aciklama"].ToString() %>&nbsp;<%=dr["Urun"].ToString() %></b> </td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>TON</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["FobSatisFiyati"].ToString() %>€</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=dr["TotalFiyat"].ToString() %>€</b></td>
                        </tr>
                        <%
                            kayitsira++;
                            Session["ks"] = kayitsira; ;
                        }
                     
                     }
                    
                    
                      
                     
                      

                } 
                
                
                
                
            %>


         <tr>
                            <td style="text-align: center; width: 50px; height:125px;"></td>
                            <td style="text-align: left; width: 500px;height:125px;" > </td>
                          
                        </tr>
                   
                </table>
    

        <p style="page-break-before: always;">&nbsp;</p>


                           <table class=<%if (baslik[6] == "NİĞTAŞ")
                                          {%> "arkaplannigtas" <%}
                                          else if (baslik[6] == "MİKROKAL")
                                          {%> "arkaplanmikrokal" <%}
                                          else if (baslik[6] == "ASKAL")
                                          {%> "arkaplanaskal" <%} %>>

                <%
                if (baslik[6] == "NİĞTAŞ" || baslik[6] == "MİKROKAL")
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

        <%--  <tr>
                <td colspan="8" style="text-align: center; font-size: 40px;height:40px; " class="auto-style1"><span style="text-align: center;"><b> PROFORMA INVOICE</b></span></td>
            </tr>
              <tr>
                   <td  style="height:15px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none;" data-toggle="modal" data-target=".bs-example-modal-center">&nbsp;</a></b></span>&nbsp;</td>
                    <td   style="height:15px;"><span class="kaydiryirmi">&nbsp;</td>
                   <td  style="width:200px; height:15px;"><span class="kaydiryirmi"><b>&nbsp;</b></span></td>
                   <td  style="height:15px;word-break:break-all;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"><b>&nbsp;</b></a><b>&nbsp;</b></span></td>
             <td  style="height:15px;word-break:break-all;"><span class="kaydiryirmi"><b><a href="#" data-toggle="modal" data-target="#exampleModalScrollable3" style="text-decoration:none; color:black;">&nbsp;</a> </b></span></td>
                    <td  style="height:15px;word-break:break-all;" colspan="2"><span class="kaydiryirmi"></span></td>
                  
                   </tr>--%>
                  
          <%
                if (baslik[4] == "$")
                {
                    if (foot[10] == "False")
                    {%>
                        <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(USD)</b></td>
                        </tr>
                    <%
                        int kayitsira = 17;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_USD_17_32", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
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
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>$</b></td>
                       </tr>
                        <%
                        kayitsira++;
                        Session["ks"] = kayitsira;
                    }
             
                      
                    }
                    else if (foot[10] == "True")
                    {%>
                           <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>FOB UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(USD)</b></td>
                        </tr>

                     <%
                        int kayitsira = 17;
                        SqlCommand alt = new SqlCommand("Sales_Quotation_Fob_USD_17_32", con);
                        alt.Parameters.AddWithValue("@TeklifNo",Request.QueryString["teklifno"]);
                        alt.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter altbilgi = new SqlDataAdapter();
                        altbilgi.SelectCommand = alt;
                        DataTable bilgi = new DataTable();
                        altbilgi.Fill(bilgi);
                        foreach(DataRow dr in bilgi.Rows)
                        {%>
                            <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk"><b><%=kayitsira %></b></td>
                            <td style="text-align: left; width: 500px;height:25px;" class="cizgi renk baslik"><b><%=dr["Aciklama"].ToString() %>&nbsp;<%=dr["Urun"].ToString() %></b> </td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>TON</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["FobSatisFiyati"].ToString() %>$</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=dr["KalemSatisFiyati"].ToString() %>$</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=dr["TotalFiyat"].ToString() %>$</b></td>
                        </tr>
                        <%
                            kayitsira++;
                            Session["ks"] = kayitsira;
                        }
                     }
                
                    
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_USD", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                        foreach(DataRow dr2 in dt3.Rows)
                    {%>
            <tr>
                <td class="cizgi baslik" style="height:20px; text-align:center;"><span style="text-align: center;"><b>&nbsp;</b> </span></td>
                <td class="cizgi baslik" style="height:20px;text-align:center;" colspan="2"><span style="text-align: center;"><b>TOTAL TON </b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <%
                    if(foot[10]=="True")
                    {%>
                        <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>&nbsp; </b> </span></td>
                    <%}
                 %>
                  
                      
                          <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL<br /> <span style="text-align:center; margin-left: 40px;">VALUE</span> </b> </span></td>
                           
                     
                 
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span ><b> $<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="7" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                }
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

                        SqlCommand cmd = new SqlCommand("Operation_Quot_TL_17_32", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[9]));
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
                        Session["ks"] = kayitsira;
                    }
                        SqlCommand sws3 = new SqlCommand("with myReslt(sira,Aciklama,Urun,buUrununSiparisTonaji,KalemSatisFiyati,TotalFiyat)as(select ROW_NUMBER() OVER( order by UrunAnaGrup ) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama, o.Urun,CONVERT(varchar, FORMAT(CAST(SUM(buUrununSiparisTonaji) as decimal(18,3)),'###,###,###.00','de-de')) as buUrununSiparisTonaji,CONVERT(varchar,FORMAT(CAST(KalemSatisFiyati as decimal(18,3)),'###,###,###.00','de-de')) as KalemSatisFiyati, CONVERT(varchar,FORMAT(CAST(SUM(buUrununSiparisTonaji)*(KalemSatisFiyati) as decimal(18,3)),'###,###,###.00','de-de')) as TotalFiyat from Orders o  where o.TeklifNo='" + Request.QueryString["teklifno"] + "' group by o.Urun,o.KalemSatisFiyati,o.UrunAnaGrup)select COUNT(*) from myReslt where sira between 17 and 32", con);
                        for (int i = Convert.ToInt32(Session["ks"]); i <= 33 - Convert.ToInt32(sws3.ExecuteScalar()); i++)
                    {%>
                         <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk"><b><%=i %></b></td>
                            <td style="text-align: left; width: 500px;height:25px;" class="cizgi renk baslik"><b>&nbsp;</b> </td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>&nbsp;</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>&nbsp;</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>&nbsp;</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>&nbsp;</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>&nbsp;</b></td>
                          
                        </tr>
                    <%}
               
                    }
                    else if (foot[10] == "True")
                    {%>
                           <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>FOB UNIT PRICE<br />(TL/TON)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(TL/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(TL)</b></td>
                        </tr>

                     <%
                        int kayitsira = 17;
                        SqlCommand alt = new SqlCommand("Sales_Quotation_Fob_TL_17_32", con);
                        alt.Parameters.AddWithValue("@TeklifNo",Request.QueryString["teklifno"]);
                        alt.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[9]));
                        alt.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter altbilgi = new SqlDataAdapter();
                        altbilgi.SelectCommand = alt;
                        DataTable bilgi = new DataTable();
                        altbilgi.Fill(bilgi);
                        foreach(DataRow dr in bilgi.Rows)
                        {%>
                            <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk"><b><%=kayitsira %></b></td>
                            <td style="text-align: left; width: 500px;height:25px;" class="cizgi renk baslik"><b><%=dr["Aciklama"].ToString() %>&nbsp;<%=dr["Urun"].ToString() %></b> </td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>TON</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["FobSatisFiyati"].ToString() %>₺</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=dr["KalemSatisFiyati"].ToString() %>₺</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=dr["TotalFiyat"].ToString() %>₺</b></td>
                        </tr>
                        <%
                            kayitsira++;
                            Session["ks"] = kayitsira;
                        }
                     }
                    SqlCommand sws4 = new SqlCommand("with myReslt(sira,Aciklama,Urun,buUrununSiparisTonaji,KalemSatisFiyati,TotalFiyat)as(select ROW_NUMBER() OVER( order by UrunAnaGrup ) as sira, case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama, o.Urun,CONVERT(varchar, FORMAT(CAST(SUM(buUrununSiparisTonaji) as decimal(18,3)),'###,###,###.00','de-de')) as buUrununSiparisTonaji,CONVERT(varchar,FORMAT(CAST(KalemSatisFiyati as decimal(18,3)),'###,###,###.00','de-de')) as KalemSatisFiyati, CONVERT(varchar,FORMAT(CAST(SUM(buUrununSiparisTonaji)*(KalemSatisFiyati) as decimal(18,3)),'###,###,###.00','de-de')) as TotalFiyat from Orders o  where o.TeklifNo='" + Request.QueryString["teklifno"] + "' group by o.Urun,o.KalemSatisFiyati,o.UrunAnaGrup)select COUNT(*) from myReslt where sira between 17 and 32", con);
                    for (int i = Convert.ToInt32(Session["ks"]); i <= 33 - Convert.ToInt32(sws4.ExecuteScalar()); i++)
                    {%>
                         <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk"><b><%=i %></b></td>
                            <td style="text-align: left; width: 500px;height:25px;" class="cizgi renk baslik"><b>&nbsp;</b> </td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>&nbsp;</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>&nbsp;</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>&nbsp;</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>&nbsp;</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>&nbsp;</b></td>
                          
                        </tr>
                    <%}
                  
                    SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_TL", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.Parameters.AddWithValue("@dolar", Convert.ToDouble(baslik[9]));
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                        foreach(DataRow dr2 in dt3.Rows)
                    {%>
            <tr>
                <td class="cizgi baslik" style="height:20px; text-align:center;"><span style="text-align: center;"><b>&nbsp;</b> </span></td>
                <td class="cizgi baslik" style="height:20px;text-align:center;" colspan="2"><span style="text-align: center;"><b>TOTAL TON </b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <%
                    if(foot[10]=="True")
                    {%>
                        <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>&nbsp; </b> </span></td>
                    <%}
                 %>
                  
                      
                         <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL<br /> <span style="text-align:center; margin-left: 40px;">VALUE</span> </b> </span></td>
                           
                     
                 
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span ><b> ₺<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="7" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                }
                else if (baslik[4] == "€")
                {
                    if (foot[10] == "False")
                    {%>
                       <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(EUR/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(EUR)</b></td>
                        </tr> 

                    <%
                        int kayitsira = 17;

                        SqlCommand cmd = new SqlCommand("Operation_Quot_EUR_17_32", con);
                        cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                        cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
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
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 200px; height:15px;"><b> <%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                            <td class="cizgi yaziboyutu" style="text-align: center; width: 250px; height:15px;"><b> <%=dr["TotalFiyat"].ToString() %>€</b></td>
                       </tr>
                        <%
                        kayitsira++;
                       
                    }
                      
                
                    
                    }
                    else if (foot[10] == "True")
                    {%>
                            <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk baslik"><b>NO</b></td>
                            <td style="text-align: center; width: 500px;height:25px;" class="cizgi renk baslik"><b>DESCRIPTION</b></td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>UNIT</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>QTY(NET)</b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b>FOB UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;UNIT PRICE<br />(USD/TON)</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=foot[3] %>&nbsp;TOTAL PRICE<br />(USD)</b></td>
                        </tr>

                     <%
                        int kayitsira = 9;
                        SqlCommand alt = new SqlCommand("Sales_Quotation_Fob_EUR_17_32", con);
                        alt.Parameters.AddWithValue("@TeklifNo",Request.QueryString["teklifno"]);
                        alt.Parameters.AddWithValue("@parite",Convert.ToDouble(baslik[5]));
                        alt.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter altbilgi = new SqlDataAdapter();
                        altbilgi.SelectCommand = alt;
                        DataTable bilgi = new DataTable();
                        altbilgi.Fill(bilgi);
                        foreach(DataRow dr in bilgi.Rows)
                        {%>
                            <tr>
                            <td style="text-align: center; width: 50px; height:25px;" class="cizgi renk"><b><%=kayitsira %></b></td>
                            <td style="text-align: left; width: 500px;height:25px;" class="cizgi renk baslik"><b><%=dr["Aciklama"].ToString() %>&nbsp;<%=dr["Urun"].ToString() %></b> </td>
                            <td style="text-align: center; width: 50px;height:25px;" class="cizgi renk baslik"><b>TON</b></td>
                               <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["buUrununSiparisTonaji"].ToString() %></b></td>
                            <td style="text-align: center; width: 150px;height:25px;" class="cizgi renk baslik"><b><%=dr["FobSatisFiyati"].ToString() %>€</b></td>
                            <td style="text-align: center; width: 200px;height:25px;" class="cizgi renk baslik"><b><%=dr["KalemSatisFiyati"].ToString() %>€</b></td>
                            <td style="text-align: center; width: 250px;height:25px;" class="cizgi renk baslik"><b><%=dr["TotalFiyat"].ToString() %>€</b></td>
                        </tr>
                        <%
                            kayitsira++;
                            
                        }
                     }
                 
                    
                      
                         SqlCommand cmd2 = new SqlCommand("Operation_Quot_Total_EUR", con);
                    cmd2.Parameters.AddWithValue("@TeklifNo", Request.QueryString["TeklifNo"]);
                    cmd2.Parameters.AddWithValue("@parite",Convert.ToDouble(baslik[5]));
                    cmd2.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da3 = new SqlDataAdapter();
                    da3.SelectCommand = cmd2;
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                        foreach(DataRow dr2 in dt3.Rows)
                    {%>
               <tr>
                <td class="cizgi baslik" style="height:20px; text-align:center;"><span style="text-align: center;"><b>&nbsp;</b> </span></td>
                <td class="cizgi baslik" style="height:20px;text-align:center;" colspan="2"><span style="text-align: center;"><b>TOTAL TON </b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <%
                    if(foot[10]=="True")
                    {%>
                        <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>&nbsp; </b> </span></td>
                    <%}
                 %>
                  
                      
                          <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL<br /> <span style="text-align:center; margin-left: 40px;">VALUE</span> </b> </span></td>
                           
                     
                 
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span ><b> $<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="7" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                      

                } 
                
                
                
                
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
                      <%}
                 %>
              </td>
                 <td class="cizgi orta yaziboyutu" style="height:15px;" colspan="3"><b><span><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#exampleModalScrollable">SPECIAL NOTES</a></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">UNIT WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3">
                  <%
                SqlCommand unit2 = new SqlCommand("select  case when Palet <> 'YOK' then Palet  when REPLACE(Palet,'YOK',0) =0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi  when REPLACE(BBAgirligi ,'YOK',0)=0 then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(Palet as int)+30 when REPLACE(Palet ,'YOK',0)=0 then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when REPLACE(BBAgirligi,'YOK',0) =0 then '' end end as Brut from Orders where TeklifNo=@p1 group by Palet,BBTipi,BBAgirligi,Ulke", con);
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
                 <td class="cizgi yaziboyutu" colspan="3" rowspan="10" style="vertical-align:top;word-break:break-all;"><b><span >
                       <textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="10" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%"><%=baslik[12] %></textarea>
                                                                                                                          </span></b></td>
                    
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">TOTAL WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[4] %>&nbsp;KGS NET WEIGHT</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                  <span><b><%=brutagirlik_1%>&nbsp;KGS GROSS WEIGHT</b></span>
              </td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF PACKAGE</span></b></td>
             <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=paketsayisi %>&nbsp;PCS</span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF FCL</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%=foot[7] %></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PAYMENT TERMS</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[13] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ORIGIN</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span>TURKEY</span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi">PORT OF LOADING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[1] %>/TURKEY</span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi">PORT OF DELIVERY</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[2] %></span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">DELIVERY TERMS</span></b></td>
              <td class="kaydiryirmi cizgi yaziboyutu" colspan="3" style="height:15px;"><b><span><%=foot[3] %> <%=foot[6] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#exampleModalScrollable2">HS CODE</a></span></b></td>
              <td class="kaydiryirmi cizgi yaziboyutu" colspan="3" style="height:15px;"><b><span><%=baslik[11] %></span></b></td>
            </tr>
                  <tr>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="4"><b><span class="kaydiryirmi">BANK DETAILS</span></b></td>
                <td class="cizgi yaziboyutu orta" colspan="3" rowspan="6"><b><asp:Image ID="Image4" runat="server" Height="100"/></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">BENEFICARY</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"> <b><span><%=baslik[6] %> ANONİM ŞİRKETİ</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">OUR BANK</span></b></td>
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
                 <td class="cizgi orta yaziboyutu" colspan="4" style="height:90px; width:600px; vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b><br />
                     <span style="padding-top:50%">
                         <asp:Image ID="Image5" runat="server" CssClass="imzakase" />
                     </span>
                 </td>
                   <td class="cizgi orta yaziboyutu" colspan="4" style="height:90px;vertical-align:top;width:600px;"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
             </tr>

                                   <tr>
                 <td  colspan="4" style="height:90px; width:600px; vertical-align:top"><b><span class="kaydiryirmi"> &nbsp;</span></b><br />
                    
                 </td>
                   <td  colspan="4" style="height:90px;vertical-align:top;width:600px;"><b><span class="kaydiryirmi">  &nbsp;</span></b></td>
             </tr>



                </table>
      <% SqlConnection.ClearPool(con); %>






            <%}



         
                
     






       
            
              
              
         %>
         
   
      
</div>
  <asp:Panel ID="PANEL" runat="server">
   <div style="text-align:center;height:10px;">
     

       <asp:Button ID="Button2" runat="server" Text="ONAYA SUN" CssClass="btn btn-primary" Height="40px" BackColor="Blue" ForeColor="White" OnClick="Button1_Click" />
       <asp:Button ID="Button3" runat="server" Text="PDF" OnClick="btnPrintDiv_Click" CssClass="btn btn-warning" BackColor="Orange" ForeColor="White" Height="40px" />
    <a href="Home.aspx" class="btn btn-success" style="height:40px; background-color:green;color:white">ANA SAYFA</a>
        </div>
        </asp:Panel>
    <!-- end row -->

        </div>

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
    <script src="/assets/js/vendor.min.js"></script>

    <!-- App js -->
    <script src="/assets/js/app.min.js"></script>
    <%-- <%con.Close(); %>--%>
        </form>
</body>
</html>
