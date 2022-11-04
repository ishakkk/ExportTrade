<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Documents.aspx.cs" Inherits="ExternalTrade.Admin.Documents" %>


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

        .kaydiryirmi {
            margin-left: 20px;
        }

        .auto-style1 {
            height: 40px;
        }
        .auto-style3 {
            width: 200px;
            height: 15px;
        }
        .auto-style4 {
            width: 400px;
            height: 15px;
        }
    </style>
    <script type="text/javascript">
        function printDiv(divName) {
            var originalTitle = document.title;
            document.title = "";


            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.title = originalTitle;
            document.body.innerHTML = originalContents;
        }
    </script>
<script>

    function revizeAlertSuccess() {
        swal({
            title: "İŞLEM TAMAMLANDI", text: "DÖKÜMLER REVİZEYE GÖNDERİLDİ", type: "success"
        }).then(function () { window.location = 'Operation.aspx' });
    }
    function revizeAlertError() {
        swal({
            title: "İŞLEM TAMAMLANAMADI", text: "DÖKÜMLER REVİZEYE GÖNDERİLEMEDİ", type: "error"
        });
    }
</script>

</head>

<body>
    <form id="form1" runat="server">
   <div style="text-align: left;height:10px;">
        <input type="button" value="PDF" onclick="printDiv('pdf')" style="background-color: orange; color: white; margin-left:580px; height:40px;" class="btn btn-warning" />
        <a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="height:40px; background-color:green; color:white"></a>
   </div>
 <div class="modal fade bs-example-modal-center" tabindex="-1" role="dialog" aria-labelledby="myCenterModalLabel" aria-hidden="true" style="display: none;">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h4 class="modal-title" id="myCenterModalLabel">REVİZE EDİLECEK </h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                                </div>
                                                <div class="modal-body">
                                                    <div>
                                                        <asp:DropDownList ID="drpDokumler" runat="server" CssClass="form-control">
                                                            <asp:ListItem Value="1">TÜM DÖKÜMLER</asp:ListItem>
                                                            <asp:ListItem Value="2">PROFORMA</asp:ListItem>
                                                            <asp:ListItem Value="3">COMMERCIAL INVOICE</asp:ListItem>
                                                            <asp:ListItem Value="4">PACKING LIST</asp:ListItem>
                                                            <asp:ListItem Value="5">KONŞİMENTO TALİMATI</asp:ListItem>
                                                           
                                                        </asp:DropDownList>
                                                    </div><br />
                                                    <div>
                                                         <asp:Button ID="Button1" runat="server" Text="REVİZEYE GÖNDER" CssClass="btn btn-success" BackColor="Green" Height="40px" ForeColor="White" OnClick="btnrevize_Click" />
                                                    </div>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->
   
      <div id="pdf">
       
        <%
            if (Request.QueryString["teklifno"] == null)
                Response.Redirect("Home.aspx");
            string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            DateTime[] tarih = new DateTime[10];
            string[] firma = new string[10];
            string[] baslikdetay = new string[30];
            string[] baslik = new string[10];
            string[] banka = new string[10];
          
            int[] netagirlik = new int[2];
            int[] brutagirlik = new int[2];
            netagirlik[1] = 0;
            brutagirlik[1] = 0;
            int[] konteynersayisi = new int[1];
            SqlCommand konteynersayisicek = new SqlCommand("select  SUM(distinct SiparistekiKonteynerSayisi)  from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            konteynersayisi[0] = Convert.ToInt32(konteynersayisicek.ExecuteScalar());
            SqlCommand agirlikcek = new SqlCommand("select case when Palet <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000) as decimal(18,3)) when BBTipi ='YOK' then 0 end end as NetAgirlik,case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end as Brüt from Orders o where o.Durum='SATISA DONDU' and o.TeklifNo=@p1 group by o.BBTipi,o.BBAgirligi,o.Palet", con);
            agirlikcek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader agirlikoku = agirlikcek.ExecuteReader();
            while (agirlikoku.Read())
            {
                if (agirlikoku["NetAgirlik"].ToString() == null || agirlikoku["NetAgirlik"].ToString() == "")
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
            string[] paket = new string[10];
            string[] foot = new string[20];
            double[] paletagirlik = new double[1];
            double QTY = 0;
            string booking = "";
            string[] bookingnumber = new string[10]; 
            paletagirlik[0] = 0;
            string[] operation = new string[20];

            int kayitsayisi;
            SqlCommand kayit = new SqlCommand("select COUNT(Urun) from Orders where TeklifNo=@p1", con);
            kayit.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            kayitsayisi = Convert.ToInt32(kayit.ExecuteScalar());
            SqlCommand baslikcek = new SqlCommand("select ISNULL(USDKUR,0) as USDKUR,ISNULL(EUROKUR,0) as EUROKUR, Temsilci,MusteriIsmi,IletisimeGecilecekKisi,CurrencyUnit,Parite,Company from Orders where TeklifNo=@p1 group by Temsilci,MusteriIsmi,IletisimeGecilecekKisi,CurrencyUnit,Parite,Company, USDKUR, EUROKUR", con);
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
            }
            SqlCommand operationcek = new SqlCommand("select a.ProformaInvoiceNo,a.ProformaInvoiceDate,a.PO,a.FreeTime,a.MoneyText,a.HSCODE,case when o.TeklifTipi='EXW' or o.TeklifTipi='FCA' or o.TeklifTipi='FAS' or  o.TeklifTipi='FOB' or o.TeklifTipi='YOK' then 'COLLECT' when o.TeklifTipi='CFR' or o.TeklifTipi='CIF' or o.TeklifTipi='DAP' or  o.TeklifTipi='DAT' then 'PREPAID'  end as CLEANONBOARD,a.BOOKINGNUMBER,a.KonsimentoEdit,a.CommercialInvoiceSpecialNote ,a.PackingListSpecialNote,a.KonsimentoSpecialNote,a.OperationInvoice,a.OperationInvoiceDate from AllOperationDocuments a left outer join Orders o on a.TeklifNo=o.TeklifNo where a.TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            SqlDataReader operationoku = operationcek.ExecuteReader();
            while(operationoku.Read())
            {
                operation[0] = operationoku["ProformaInvoiceNo"].ToString();
                operation[1] = operationoku["ProformaInvoiceDate"].ToString().Substring(0,10);
                operation[2] = operationoku["PO"].ToString();
                operation[3] = operationoku["FreeTime"].ToString();
                operation[4] = operationoku["MoneyText"].ToString();
                operation[5] = operationoku["HSCODE"].ToString();
                operation[6] = operationoku["CLEANONBOARD"].ToString();
                operation[7] = operationoku["BOOKINGNUMBER"].ToString();
                operation[8] = operationoku["KonsimentoEdit"].ToString();
               
                operation[10] = operationoku["CommercialInvoiceSpecialNote"].ToString();
                operation[11] = operationoku["PackingListSpecialNote"].ToString();
                operation[12] = operationoku["KonsimentoSpecialNote"].ToString();
                operation[13] = operationoku["OperationInvoice"].ToString();
                operation[14] = operationoku["OperationInvoiceDate"].ToString().Substring(0,10);
            }
            baslikoku.Close();
            SqlCommand bankacek = new SqlCommand("select b.BankName,b.IBAN,b.Account,b.SwiftCode from AllOperationDocuments o left outer join Banks b on o.BankId=b.Id where o.TeklifNo=@p1", con);
            bankacek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader bankaoku = bankacek.ExecuteReader();
            while (bankaoku.Read())
            {
                banka[0] = bankaoku["BankName"].ToString();
                banka[1] = bankaoku["IBAN"].ToString();
                banka[3] = bankaoku["Account"].ToString();
                banka[4] = bankaoku["SwiftCode"].ToString();
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
            SqlCommand mamulsayisi = new SqlCommand("select COUNT(mamul.NAME) from Orders o left outer join DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] mamul on o.YediyuzluKod=mamul.CODE where o.Durum='SATISA DONDU' and mamul.NAME is not null and o.TeklifNo=@p1", con);
            mamulsayisi.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            sayac = Convert.ToInt32(mamulsayisi.ExecuteScalar());
            sayac = esikdeger - sayac;



            SqlCommand foott = new SqlCommand("select KonteynerBulkSecimi,PaymentTerms, REPLACE(REPLACE(o.Vade,'Peşin','CASH IN ADVANCE'),'Gün','DAYS AFTER B/L') as Vade,case when o.KalkisLimani='MIP' Then 'MIP (MERSIN INTERNATIONAL PORT)' when o.KalkisLimani='Limak' then 'ISKENDERUN LIMAK' when KalkisLimani='YOK' then '' end as KalkisLimani,UPPER(o.VarisLimani) as VarisLimani,REPLACE(o.TeklifTipi,'YOK','') as TeklifTipi,CAST(SUM(o.buUrununSiparisTonaji*1000) as decimal(18,0)) as MIKTAR,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int) as Konteyner,case when KalkisLimani='MIP' then 'MERSIN' when KalkisLimani='Limak' then 'ISKENDERUN'   end as Sehir,case  when EkipmanTuru='40 DV' then  CONVERT(nvarchar ,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int))+'X' +' 40 HC' when EkipmanTuru='20 DV' then CONVERT(nvarchar ,CAST(SUM(distinct SiparistekiKonteynerSayisi) as int))+'X' +' 20 DC'  end as Ekipman, case when EkipmanTuru='20 DV' then 20*30 when EkipmanTuru='40 DV' then 40*30 else 0 end as Gross,FobVisible,case when EkipmanTuru='20 DV' then 32 when EkipmanTuru='40 DV' then 67 end AS CMB  from Orders o  where TeklifNo='" + Request.QueryString["teklifno"] + "' group by o.Vade,o.KalkisLimani,o.VarisLimani,o.TeklifTipi,o.EkipmanTuru,FobVisible,KonteynerBulkSecimi,PaymentTerms", con);
            foott.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader footer = foott.ExecuteReader();
            while (footer.Read())
            {
                foot[0] = footer["Vade"].ToString();
                foot[1] = footer["KalkisLimani"].ToString();
                foot[2] = footer["VarisLimani"].ToString();
                foot[3] = footer["TeklifTipi"].ToString();
                foot[4] = footer["MIKTAR"].ToString();
                foot[5] = footer["Konteyner"].ToString();
                foot[6] = footer["Sehir"].ToString();
                foot[7] = footer["Ekipman"].ToString();
                foot[8] = Convert.ToString(Convert.ToDouble(footer["MIKTAR"])+Convert.ToDouble(footer["Gross"]));
                foot[10] = footer["FobVisible"].ToString();
                foot[13] = footer["PaymentTerms"].ToString();
                foot[14] = footer["KonteynerBulkSecimi"].ToString();
                foot[15] = footer["CMB"].ToString();
            }
            footer.Close();
            SqlCommand paletagirlikcek = new SqlCommand("select REPLACE(Palet,'YOK',0) as Palet from Orders where TeklifNo=@p1", con);
            paletagirlikcek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader paletagirlikoku = paletagirlikcek.ExecuteReader();
            while (paletagirlikoku.Read())
            {
                paletagirlik[0] = Convert.ToDouble(paletagirlikoku["Palet"].ToString()) + Convert.ToDouble(paletagirlik[0]);
            }
            paletagirlikoku.Close();
            SqlCommand baslikdetaycek = new SqlCommand("select c.Cari as CARİADI ,c.Adres1 as ADRES1,c.Adres2 as ADRES2,c.VergiNo as VERGINO,c.Telno1,c.IlgiliKisi,c.Fax as FAX,c.Mail as EMAIL,c.WebSite as WEBSITE  from CustomerAddress c inner join Orders o on c.CariKodu=o.MusteriKodu where o.TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
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
            int[] toplampaket = new int[1];
            toplampaket[0] = 0;
            SqlCommand toplampaketcek = new SqlCommand("select SUM(o.buUrununSiparisTonaji*1000) as MIKTAR,case when Palet <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int) as int) when Palet ='YOK' then case when BBTipi <> 'YOK' then  CAST(SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int) as int) when BBTipi='YOK' then 0 end end as ToplamPaket from Orders o  where o.TeklifNo=@p1 group by o.Palet,o.BBAgirligi,o.BBTipi", con);
            toplampaketcek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
            SqlDataReader toplampaketoku = toplampaketcek.ExecuteReader();
            while (toplampaketoku.Read())
            {
                toplampaket[0] = toplampaket[0] + Convert.ToInt32(toplampaketoku["ToplamPaket"]);
            }
            toplampaketoku.Close();
       
           
          
            string emailproforma, emailcommercial, emailpacking, emailkonsimento;
            SqlCommand emailproformacek = new SqlCommand("select  u.Email  from AllOperationDocuments o left outer join Users u on o.ProformaOlusturan=u.Id where o.TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            emailproforma = Convert.ToString(emailproformacek.ExecuteScalar());
            SqlCommand emailcommercialcek = new SqlCommand("select  u.Email  from AllOperationDocuments o left outer join Users u on o.CommercialInvoiceOlusturan=u.Id where o.TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            emailcommercial = Convert.ToString(emailcommercialcek.ExecuteScalar());
            SqlCommand emailpackingcek = new SqlCommand("select  u.Email  from AllOperationDocuments o left outer join Users u on o.PackingListOlusturan=u.Id where o.TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            emailpacking = Convert.ToString(emailpackingcek.ExecuteScalar());
            SqlCommand emailkonsimentocek = new SqlCommand("select  u.Email  from AllOperationDocuments o left outer join Users u on o.KonsimentoOlusturan=u.Id where o.TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            emailkonsimento = Convert.ToString(emailkonsimentocek.ExecuteScalar());
            SqlCommand vadecek = new SqlCommand("select Vade from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "' group by Vade", con);
            SqlCommand foott2 = new SqlCommand("select MoneyText from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
            SqlDataReader footer2 = foott2.ExecuteReader();
            while (footer2.Read())
            {
                foot[9] = Convert.ToString(footer2["MoneyText"]);
            }
            footer2.Close();
            string[] notifiy=new string[15];
            SqlCommand notifiycek = new SqlCommand("select NotifiyName,NotifiyAdres,NotifiyUlke,NotifiyRut,NotifiyTelNo,NotifiyContact,NotifyMailAdress,NotifyWebSite,NotifyResponsiblePerson,NotifiyRut_Text,NotifiyTelNo_Text,NotifiyContact_Text,NotifyMailAdress_Text,NotifyWebSite_Text,NotifyResponsiblePerson_Text,c.IlgiliKisi from AllOperationDocuments a inner join CustomerAddress c on a.TeklifNo=c.TeklifNo where a.TeklifNo='" + Request.QueryString["teklifno"] + "' group by NotifiyName,NotifiyAdres,NotifiyUlke,NotifiyRut,NotifiyTelNo,NotifiyContact,NotifyMailAdress,NotifyWebSite,NotifyResponsiblePerson,NotifiyRut_Text,NotifiyTelNo_Text,NotifiyContact_Text,NotifyMailAdress_Text,NotifyWebSite_Text,NotifyResponsiblePerson_Text,IlgiliKisi", con);
            SqlDataAdapter danotifiy = new SqlDataAdapter();
            danotifiy.SelectCommand = notifiycek;
            DataTable dtnot = new DataTable();
            danotifiy.Fill(dtnot);
            foreach (DataRow dxt in dtnot.Rows)
            {
                notifiy[0] = dxt["NotifiyName"].ToString();
                notifiy[1] = dxt["NotifiyAdres"].ToString();
                notifiy[2] = dxt["NotifiyUlke"].ToString();
                notifiy[3] = dxt["NotifiyRut"].ToString();
                notifiy[4] = dxt["NotifiyTelNo"].ToString();
                notifiy[5] = dxt["NotifiyContact"].ToString();
                notifiy[6] = dxt["NotifyMailAdress"].ToString();
                notifiy[7] = dxt["NotifyResponsiblePerson"].ToString();
                notifiy[8] = dxt["NotifiyRut_Text"].ToString();
                notifiy[9] = dxt["NotifiyTelNo_Text"].ToString();
                notifiy[10] = dxt["NotifiyContact_Text"].ToString();
                notifiy[11] = dxt["NotifyMailAdress_Text"].ToString();
                notifiy[12] = dxt["NotifyWebSite_Text"].ToString();
                notifiy[13] = dxt["NotifyResponsiblePerson_Text"].ToString();
                notifiy[14] = dxt["IlgiliKisi"].ToString();
            }
            SqlConnection.ClearPool(con);
             %>
        <%--PROFORMA--%>

        <table class=<%if (baslik[6] == "NİĞTAŞ")
                       {%> "arkaplannigtas" <%}
                       else if (baslik[6] == "MİKROKAL")
                       {%> "arkaplanmikrokal" <%} else if (baslik[6] == "ASKAL")
                       {%> "arkaplanaskal" <%}   %>>
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
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b>PROFORMA DATE</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b><%=operation[0] %></b></span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> PROFORMA NO:</b></span></td>
                   <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><span class="kaydiryirmi"><b><%=operation[1] %></b></span></td>
            </tr>
      
                <tr>
                <td colspan="4" class="cizgi orta" style="width:600px; height:25px;"><span><b> SEND BY</b></span></td>
                <td colspan="4" class="cizgi orta" style="width:600px;height:25px;"><b> SEND TO</b></td>
               
            </tr>

             <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %> ANONİM ŞİRKETİ</b> </span></td>
                <td class="cizgi yaziboyutu" colspan="4" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
               
            </tr>
                <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="4" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
              
            </tr>
                <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="4" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span></td>
               
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
               <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><b> <%=baslikdetay[4] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> TEL NO 2:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="width:400px;height:15px;"><b> <%=firma[4] %></b></td>
                 <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b>FAX:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><b><%=baslikdetay[6] %></b> </td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="width:400px; height:15px;"><b> <%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b>MAIL:</b> </span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="width:400px; height:15px;"><b> <%=baslikdetay[6] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="3"><b><%=emailproforma %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="3" style="width:400px; height:15px;"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="3"><b ><a href="https://www.nigtas.com/" style="color:black;"><%=firma[8] %></a> </b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span><b style="font-size:11px;">RESPONSIBLE PERSON:</b> </span></td>
                    <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="3"><b> <%=baslikdetay[5] %></b></td>
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
                    }
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
                        }
                     }
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
                  
                      
                          <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE</b> </span></td>
                           
                     
                 
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span ><b> $<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="7" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                }
                   else  if (baslik[4] == "₺")
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
                    }
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
                        }
                     }
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
                  
                      
                          <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE</b> </span></td>
                           
                     
                 
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
                    }
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
                        }
                     }
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
                  
                      
                          <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE</b> </span></td>
                           
                     
                 
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
      <td class="cizgi yaziboyutu" style="height:15px;" colspan="4">
                  <%
                      SqlCommand pakettipi = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+TorbaTipi end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when Palet='YOK' then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when Palet ='YOK' then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when BBAgirligi ='YOK' then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where TeklifNo=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                      pakettipi.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                      SqlDataAdapter da4 = new SqlDataAdapter();
                      da4.SelectCommand = pakettipi;
                      DataTable dt4 = new DataTable();
                      da4.Fill(dt4);
                     foreach(DataRow p in dt4.Rows)
                      {%>
                          <span><b><%=p["Torba"].ToString() %>&nbsp;&nbsp;<%=p["UniteAgirlik"].ToString() +"KGS"%>&nbsp;&nbsp;<%=p["BigBag"].ToString() %>&nbsp;<%=p["Palet"].ToString() %>&nbsp;<%=p["Strec"].ToString() %>&nbsp;(<%=p["PaketSayisi"].ToString() %> PCS)</b></span>  
                          <br />
                      <%}
                 %>
              </td>
                 <td class="cizgi orta yaziboyutu" style="height:15px;" colspan="2"><b><span>SPECIAL NOTES</span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu"><b><span class="kaydiryirmi">UNIT WEIGHT</span></b></td>
             <td class="cizgi yaziboyutu" style="height:15px;" colspan="4">
                  <%
                      SqlCommand unit = new SqlCommand("select  case when Palet <> 'YOK' then Palet  when Palet ='YOK' then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi  when BBAgirligi ='YOK' then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(Palet as int)+30 when Palet ='YOK' then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when BBAgirligi ='YOK' then '' end end as Brut from Orders where TeklifNo=@p1 group by Palet,BBTipi,BBAgirligi,Ulke", con);
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
                 <td class="cizgi yaziboyutu" colspan="2" rowspan="9" style="vertical-align:top;word-break:break-all;"><b><span ><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%;padding-top:50%"> <%=operation[2] %></textarea>  </span></b></td>
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">TOTAL WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[4] %>&nbsp;KGS NET WEIGTH</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <%
                    if(foot[14]=="KONTEYNER")
                    {%>
                         <span><b><%=Convert.ToInt32((konteynersayisi[0]*600)+Convert.ToInt32(foot[4])) %>&nbsp;KGS GROSS WEIGHT</b></span>
                    <%}
                      else if(foot[14]=="BULK")
                    {%>
                       <span><b><%=Convert.ToInt32(foot[4])+(Convert.ToInt32(foot[4])*10) %>&nbsp;KGS GROSS WEIGHT</b></span>
                    <%}
                %></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF PACKAGE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=konteynersayisi[0]*20 %>&nbsp;<%="PALLETS" %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF FCL</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span> <%=foot[7] %></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PAYMENT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[0] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ORIGIN</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span>TURKEY</span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span  class="kaydiryirmi">PORT OF LOADING</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[1] %>/TURKEY</span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">DELIVERY TERMS</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[3] %> <%=foot[6] %>/TURKEY</span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">HS CODE</span></b></td>
              <td class="kaydiryirmi cizgi yaziboyutu" colspan="4" style="height:15px;"><b><span><%=operation[5] %></span></b></td>
            </tr>
                   <tr>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="5"><b><span class="kaydiryirmi">BANK DETAILS</span></b></td>
                       <td class="cizgi yaziboyutu orta" colspan="2" rowspan="6"><b><span class="kaydiryirmi"><asp:Image ID="img_yeri" runat="server" /></span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">BENEFICARY</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"> <b><span><%=baslik[6] %> ANONİM ŞİRKETİ</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">OUR BANK</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span> <%= banka[0] %></span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ACCOUNT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span> <%= banka[1] %></span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">IBAN</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span> <%= banka[3] %></span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">SWIFT CODE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span> <%= banka[4] %></span> </b></td>
            </tr>
             <tr>
                 <td class="cizgi orta yaziboyutu" colspan="4" style="height:120px; vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
                   <td class="cizgi orta yaziboyutu" colspan="4" style="height:120px;vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
             </tr>
                </table>
      
         <table class=<%if (baslik[6] == "NİĞTAŞ")
                       {%> "arkaplannigtas" <%}
                       else if (baslik[6] == "MİKROKAL")
                       {%> "arkaplanmikrokal" <%} else if (baslik[6] == "ASKAL")
                       {%> "arkaplanaskal" <%}   %>>
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
                <td colspan="6" style="text-align: center; font-size: 40px;height:40px; " class="auto-style1"><span style="text-align: center;"><b>COMMERCIAL INVOCE</b></span></td>
            </tr>
              <tr>
               
                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b><%=operation[13] %></b></span></td>
                    <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu"  style="width:200px; height:15px;"><span class="kaydiryirmi"><b><%=operation[14] %></b></span></td>
                     <td class="cizgi yaziboyutu" style="height:15px;word-break:break-all;" colspan="2" ><span class="kaydiryirmi"><b> PO :<%=operation[2] %></b></span></td>
                   
            </tr>
      
                <tr>
                <td colspan="3" class="cizgi orta" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="3" class="cizgi orta" style="width:600px;height:25px;"><b>CUSTOMER</b></td>
               
            </tr>

             <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[0] %> ANONİM ŞİRKETİ</b> </span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
               
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
              
            </tr>
                <tr>
                <td colspan="3" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span></td>
               
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b>TEL NO:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b> <%=baslikdetay[4] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> TEL NO 2:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b> <%=firma[4] %></b></td>
                 <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b>FAX:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=baslikdetay[5] %></b> </td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b> FAX:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=firma[6] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b>MAIL:</b> </span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b><%=emailcommercial %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b>WEBSITE:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="2" style="width:400px; height:15px;"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b ><a href="https://www.nigtas.com/" style="color:black;text-decoration:none;"><%=firma[8] %></a> </b></td>
               <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span><b style="font-size:11px">RESPONSIBLE PERSON:</b> </span></td>
                    <td class="cizgi yaziboyutu" style="width:400px; height:15px;" colspan="2"><b> <%=baslikdetay[5] %></b></td>
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
                    SqlCommand cmd = new SqlCommand("Operation_Quot_USD", con);
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da6 = new SqlDataAdapter();
                    da6.SelectCommand = cmd;
                    DataTable dt6 = new DataTable();
                    da6.Fill(dt6);
                    foreach(DataRow dr in dt6.Rows)
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
                    int kayitsira = 1;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_USD", con);
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da6 = new SqlDataAdapter();
                    da6.SelectCommand = cmd;
                    DataTable dt6 = new DataTable();
                    da6.Fill(dt6);
                    foreach (DataRow dr in dt6.Rows)
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
                       
                        SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_USD", con);
                        fobhesabi.Parameters.AddWithValue("@teklifno", Request.QueryString["teklifno"]);
                        fobhesabi.Parameters.AddWithValue("@Vade",Convert.ToString(vadecek.ExecuteScalar()));
                        fobhesabi.CommandType = CommandType.StoredProcedure;
                        SqlDataAdapter da7 = new SqlDataAdapter();
                        da7.SelectCommand = fobhesabi;
                        DataTable dt7 = new DataTable();
                        da7.Fill(dt7);
                        foreach(DataRow fobhesabioku in dt7.Rows)
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
                    SqlDataAdapter da8 = new SqlDataAdapter();
                    da8.SelectCommand = cmd2;
                    DataTable dt8 = new DataTable();
                    da8.Fill(dt8);
                    foreach(DataRow dr2 in dt8.Rows)
                    {%>
            <tr>
                <td colspan="2" class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE <%=foot[3] %> <%=foot[1] %></b> </span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" colspan="3"><span style="text-align: center"><b><%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi baslik" style="text-align: center; height:20px;" ><span ><b> $<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="6" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
                   

            %>

            <%}
                 else  if (baslik[4] == "₺")
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
                    }
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
                        }
                     }
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
                  
                      
                          <td class="cizgi baslik" style="height:20px;"><span style="text-align: center; margin-left: 40px;"><b>TOTAL VALUE</b> </span></td>
                           
                     
                 
                <td class="cizgi baslik" style="text-align: center; height:20px;"><span ><b> ₺<%=dr2["TotalFiyat"].ToString() %></b></span></td>
            </tr>
           <tr>
                <td colspan="7" class="cizgi baslik orta" style="height:20px;"><span style="text-align: center; margin-left: 40px; height:20px;"><b><a href="#" style="color:black; text-decoration:none;"  data-toggle="modal" data-target="#staticBackdrop">SAY#<%=foot[9] %>ONLY#</a></b></span></td>
                
            </tr>
            <%}
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
                    SqlDataAdapter da6 = new SqlDataAdapter();
                    da6.SelectCommand = cmd;
                    DataTable dt6 = new DataTable();
                    da6.Fill(dt6);
                    foreach (DataRow dr in dt6.Rows)
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
                         int sira = 1;
                    SqlCommand cmd = new SqlCommand("Operation_Quot_EUR", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", Request.QueryString["teklifno"]);
                    cmd.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                    SqlDataAdapter da6 = new SqlDataAdapter();
                    da6.SelectCommand = cmd;
                    DataTable dt6 = new DataTable();
                    da6.Fill(dt6);
                    foreach (DataRow dr in dt6.Rows)
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
                  
                SqlCommand fobhesabi = new SqlCommand("Operation_Quot_FOB_EUR", con);
                fobhesabi.Parameters.AddWithValue("@teklifNo", Request.QueryString["teklifno"]);
                fobhesabi.Parameters.AddWithValue("@parite", Convert.ToDouble(baslik[5]));
                fobhesabi.Parameters.AddWithValue("@Vade", Convert.ToString(vadecek.ExecuteScalar()));
                fobhesabi.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da7 = new SqlDataAdapter();
                da7.SelectCommand = fobhesabi;
                DataTable dt7 = new DataTable();
                da7.Fill(dt7);
                foreach (DataRow fobhesabioku in dt7.Rows)
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
                SqlDataAdapter da8 = new SqlDataAdapter();
                da8.SelectCommand = cmd2;
                DataTable dt8 = new DataTable();
                da8.Fill(dt8);
                foreach(DataRow dr2 in dt8.Rows)
                {%>
            <tr>
                <td colspan="2" class="cizgi"><span style="text-align: center; margin-left: 40px; height:20px;"><b> TOTAL VALUE <%=foot[3] %> <%=foot[1] %></b></span></td>
                <td class="cizgi" style="text-align: center;" colspan="3"><span style="text-align: center"><b> <%=dr2["buUrununSiparisTonaji"].ToString() %> TONS</b></span></td>
                <td class="cizgi" style="text-align:center;"><span><b> <%=dr2["TotalFiyat"].ToString() %>€</b></span></td>
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
                        SqlCommand pakettipi2 = new SqlCommand("select Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+TorbaTipi end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when Palet='YOK' then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when Palet ='YOK' then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when BBAgirligi ='YOK' then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where TeklifNo=@p1 group by TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                        pakettipi2.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                        SqlDataAdapter da9 = new SqlDataAdapter();
                        da9.SelectCommand = pakettipi2;
                        DataTable dt9 = new DataTable();
                        da9.Fill(dt9);
                        foreach(DataRow p2 in dt9.Rows)
                        {%>
                          <span><b><%=p2["Torba"].ToString() %>&nbsp;<%=p2["UniteAgirlik"].ToString() %>&nbsp;KGS &nbsp;<%=p2["BigBag"].ToString() %>&nbsp;<%=p2["Palet"].ToString() %>&nbsp;<%=p2["Strec"].ToString() %>&nbsp;(<%=p2["PaketSayisi"].ToString() %> PCS)&nbsp;</b></span>  
                          <br />
                          
                      <%}
                          
                 %>
              </td>
                 <td class="cizgi orta yaziboyutu" style="height:15px;" colspan="2"><b><span>SPECIAL NOTES</span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">UNIT WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3">
                      <%
                          SqlCommand unit2 = new SqlCommand("select  case when Palet <> 'YOK' then Palet  when Palet ='YOK' then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi  when BBAgirligi ='YOK' then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(Palet as int)+30 when Palet ='YOK' then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when BBAgirligi ='YOK' then '' end end as Brut from Orders where TeklifNo=@p1 group by Palet,BBTipi,BBAgirligi,Ulke", con);
                      unit2.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                      SqlDataAdapter da10 = new SqlDataAdapter();
                      da10.SelectCommand = unit2;
                      DataTable dt10 = new DataTable();
                      da10.Fill(dt10);
                      foreach(DataRow un2 in dt10.Rows)
                      {%>
                          <span><b><%=un2["UniteAgirlik"].ToString() %>&nbsp;KGS NET WEIGTH</b></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><b><%=un2["Brut"].ToString() %>&nbsp; KGS GROSS WEIGTH</b></span>
                          <br />
                      <%}
                          
                          //con.Close();                                                            
                  %>
              </td>
                 <td class="cizgi yaziboyutu" colspan="2" rowspan="10" style="vertical-align:top;word-break:break-all;"><b><span ><textarea readonly="readonly" class="yaziboyutu orta" rows="10" cols="10" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%;padding-top:50%"><%=operation[10] %></textarea></span></b></td>
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">TOTAL WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[4] %>&nbsp; KGS NET WEIGTH</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <%
                    if(foot[14]=="KONTEYNER")
                    {%>
                         <span><b><%=Convert.ToInt32((konteynersayisi[0]*600)+Convert.ToInt32(foot[4])) %>&nbsp;KGS GROSS WEIGHT</b></span>
                    <%}
                      else if(foot[14]=="BULK")
                    {%>
                       <span><b><%=Convert.ToInt32(foot[4])+(Convert.ToInt32(foot[4])*10) %>&nbsp;KGS GROSS WEIGHT</b></span>
                    <%}
                %></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF PACKAGE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=konteynersayisi[0]*20 %>&nbsp;<%="PALLETS" %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF FCL</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[7] %></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PAYMENT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[0] %></span></b></td>
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
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span><%=foot[3] %> <%=foot[1] %>/TURKEY</span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">HS CODE</span></b></td>
              <td class="kaydiryirmi cizgi yaziboyutu" colspan="3" style="height:15px;"><b><span><%=operation[5] %></span></b></td>
            </tr>
                 <tr>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="4"><b><span class="kaydiryirmi">BANK DETAILS</span></b></td>
                       <td class="cizgi yaziboyutu orta" colspan="2" rowspan="6"><b><span class="kaydiryirmi"><asp:Image ID="img_yeri2" runat="server" /></span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">BENEFICARY</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"> <b><span><%=baslik[6] %> ANONİM ŞİRKETİ</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">OUR BANK</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[0] %></span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ACCOUNT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[1] %></span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">IBAN</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="3"><b><span> <%= banka[3] %></span> </b></td>
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
             <table class=<%if (baslik[6] == "NİĞTAŞ")
                       {%> "arkaplannigtas" <%}
                       else if (baslik[6] == "MİKROKAL")
                       {%> "arkaplanmikrokal" <%} else if (baslik[6] == "ASKAL")
                       {%> "arkaplanaskal" <%}   %>>
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
                <td colspan="8" style="text-align: center; font-size: 40px; height: 50px;"><span style="text-align: center;"><b> PACKING LIST</b></span></td>
            </tr>
              <tr>

                   <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-xl" style="color:black; text-decoration:none;"><b> INVOICE NO:</b></a></span></td>
                  <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b><%=operation[13] %></b></span></td>
                    <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> INVOICE DATE:</b></span></td>
                   <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> <%=operation[14] %></b></span></td>
                   <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><a href="#" data-toggle="modal" data-target=".bs-example-modal-center" style="text-decoration:none; color:black;"><b> P.O#</b></a></span></td>
                 <td class="cizgi yaziboyutu" colspan="3" style="height:15px;"><span class="kaydiryirmi"><b> <%=operation[2] %></b></span></td>
            </tr>
              <tr>
              
                   <td colspan="8" style="height:5px;">&nbsp;</td>
            </tr>
       
                <tr>
                <td colspan="4" class="cizgi orta baslik" style="width:600px; height:25px;"><span><b>SUPPLIER</b></span></td>
                <td colspan="4" class="cizgi orta baslik" style="width:600px; height:25px;"><b>CUSTOMER</b> </td>
               
            </tr>

             <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslik[6] %> ANONİM ŞİRKETİ</b></span></td>
                <td class="cizgi" colspan="4" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
               
            </tr>
                <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="4" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
              
            </tr>
                <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="4" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span></td>
               
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="4" style="height:15px;"><b> <%=baslikdetay[3] %></b></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3] %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TEL NO:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="4" style="height:15px;"><b> <%=baslikdetay[4] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TEL NO 2:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[4] %></b></td>
                 <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> FAX:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="4" style="height:15px;"><b> <%=baslikdetay[5] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi" > <b> FAX:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%= firma[6] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi" ><b> MAIL:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="4" style="width:400px;height:15px;"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px;height:15px;" colspan="2"><b><%=emailpacking %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="4" style="width:400px;height:15px;"><b><%=baslikdetay[8] %></b> </td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2"><b><a href="https://www.nigtas.com/" style="color:black;text-decoration:none;"><%=firma[5] %></a></b> </td>
               <td class="cizgi yaziboyutu"><span><b style="font-size:11px;">RESPONSIBLE PERSON:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="4"><b> <%=baslikdetay[8] %></b></td>
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
                    WEIHT (KGS)</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL NET WEIGHT (KGS)
                    </b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta"><b>TOTAL GROSS WEIGHT (KGS)
                    </b></td>
            </tr>
            <%
                int a = 1;
                SqlCommand mamulcek = new SqlCommand("select case when UrunAnaGrup='18.TALK' then 'TALC' when UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when UrunAnaGrup='15.HİDROFİL' or UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun,Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+TorbaTipi end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then CONVERT(varchar,BBAgirligi)+' '+BBTipi end as BigBag, case when Palet='YOK' then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when Palet ='YOK' then case when BBAgirligi <> 'YOK' then BBAgirligi when BBAgirligi ='YOK' then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(Palet as int)+30 when Palet ='YOK' then case when BBAgirligi <> 'YOK' then CAST(BBAgirligi as int)+10 when BBAgirligi ='YOK' then '' end end as BrutAgirlik,case when Palet <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int) as int) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int) as int) when BBTipi ='YOK' then 0 end end as PaketSayisi, case when Palet <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when Palet='YOK' then case when BBTipi <> 'YOK' then SUM(o.buUrununSiparisTonaji*1000) when BBTipi ='YOK' then 0 end end as NetAgirlik,case when Palet <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(Palet as int))*(CAST(Palet as int)+30) as decimal(18,3)) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST((SUM(o.buUrununSiparisTonaji*1000)/CAST(BBAgirligi as int))*(CAST(BBAgirligi as int)+10) as decimal(18,3)) when BBTipi ='YOK' then 0 end end as Brut from Orders o  where o.Durum='SATISA DONDU' and o.TeklifNo=@p1 group by o.Urun,o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,o.UrunAnaGrup", con);
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
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku["NetAgirlik"]).ToString() %></b></td>
                     <td style="height: 30px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=Convert.ToInt32(mamuloku["Brut"]).ToString() %></b></td>
               </tr>
                <%
                    a++;
                }
                
            %>
              <%
             
                  for (int i = 1; i <= sayac+4; i++)
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
                        SqlCommand pakettipi3 = new SqlCommand("select Urun,Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+TorbaTipi end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when Palet='YOK' then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when Palet ='YOK' then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when BBAgirligi ='YOK' then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where TeklifNo=@p1 group by Urun,TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                        pakettipi3.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                        SqlDataReader p3 = pakettipi3.ExecuteReader();
                        while (p3.Read())
                        {%>
                          <span><%=p3["Urun"].ToString() %>&nbsp;<%=p3["Torba"].ToString() %>&nbsp;<%=p3["UniteAgirlik"].ToString() %>&nbsp;KGS &nbsp;<%=p3["BigBag"].ToString() %>&nbsp;<%=p3["Palet"].ToString() %>&nbsp;<%=p3["Strec"].ToString() %>&nbsp;(<%=p3["PaketSayisi"].ToString() %> PCS)&nbsp;</span>  
                          <br />
                          
                      <%}
                 %>
             </span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">UNIT WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="7"><b><span >
                      <%
                          SqlCommand unit3 = new SqlCommand("select  case when Palet <> 'YOK' then Palet  when Palet ='YOK' then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi  when BBAgirligi ='YOK' then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(Palet as int)+30 when Palet ='YOK' then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then case  when Ulke ='Cezayir' then CAST(BBAgirligi as int)+10 when Ulke='Rusya' then CAST(BBAgirligi as int)+3 else CAST(BBAgirligi as int)+10 end when BBAgirligi ='YOK' then '' end end as Brut from Orders where TeklifNo=@p1 group by Palet,BBTipi,BBAgirligi,Ulke", con);
                      unit3.Parameters.AddWithValue("@p1",Request.QueryString["teklifno"]);
                      SqlDataReader un3 = unit3.ExecuteReader();
                      while(un3.Read())
                      {%>
                          <span>&nbsp;<%=un3["UniteAgirlik"].ToString() %>&nbsp;KGS NET WEIGTH</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><%=un3["Brut"].ToString() %> KGS GROSS WEIGTH</span> 
                          <br />
                      <%}                                                        
                                                                                  
                  %>
             </span></b></td>
                
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">TOTAL WEIGHT</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[4] %>&nbsp;KGS NET WEIGTH</span></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <%
                    if(foot[14]=="KONTEYNER")
                    {%>
                         <span><b><%=Convert.ToInt32((konteynersayisi[0]*600)+Convert.ToInt32(foot[4])) %>&nbsp;KGS GROSS WEIGHT</b></span>
                    <%}
                      else if(foot[14]=="BULK")
                    {%>
                       <span><b><%=Convert.ToInt32(foot[4])+(Convert.ToInt32(foot[4])*10) %>&nbsp;KGS GROSS WEIGHT</b></span>
                    <%}
                %></td>
              <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">SPECIAL NOTE</span></b></td>
               </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF <br /><span class="orta kaydiryirmi">PACKAGE</span> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=toplampaket[0].ToString() %>&nbsp;<%="PALLETS" %></span></b></td>
                 <td class="cizgi yaziboyutu" style="vertical-align:top;word-break:break-all;" colspan="3" rowspan="3"><b><span><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%;padding-top:50%"><%=operation[11] %></textarea></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF FCL</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[7] %></span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">CMB</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[15] %>"</span></b></td>
            </tr>
                  <tr>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="5"><b><span class="kaydiryirmi">&nbsp;</span></b></td>
                <td class="cizgi yaziboyutu orta" colspan="3" rowspan="6"><b><asp:Image ID="img_yeri3" runat="server"/></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="5"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="5"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="5"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="5"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span> </b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="5"><b><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;</span> </b></td>
            </tr>
             <tr>
                 <td class="cizgi orta yaziboyutu" colspan="4" style="height:120px; vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
                   <td class="cizgi orta yaziboyutu" colspan="4" style="height:120px;vertical-align:top"><b><span class="kaydiryirmi"> SIGNATURE AND STAMP</span></b></td>
             </tr>
     
             

        </table>
      <table class=<%if (baslik[6] == "NİĞTAŞ")
                       {%> "arkaplannigtas" <%}
                       else if (baslik[6] == "MİKROKAL")
                       {%> "arkaplanmikrokal" <%} else if (baslik[6] == "ASKAL")
                       {%> "arkaplanaskal" <%}   %>>
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
                <td colspan="8" style="text-align: center; font-size: 40px; height: 40px;"><span style="text-align: center;"><b> KONŞİMENTO TALİMATI</b></span></td>
            </tr>
              <tr>
                <td colspan="8" style="text-align: center; font-size: 20px; height:20px; "><b><a href="#" style="color:black; text-decoration:none" data-toggle="modal" data-target="#myModal"><%=operation[7] %></a></b></td>
              </tr>
       
            <%--  <tr>
               
                   <td colspan="8" style="height:5px;"><span class="kaydiryirmi">&nbsp;</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
            </tr>--%>
        <tr>
                <td style="height: 15px; width: 50px; text-align: center"><span><b>Date :</b> </span></td>
                <td style="height: 15px; width: 600px; text-align: left"><b> <%=DateTime.Now.ToShortDateString() %></b></td>
                <td style="height: 15px; " colspan="6">&nbsp;</td>
            </tr>
               <tr>
                <td colspan="4" class="cizgi orta baslik" style="width:600px; height:25px;"><span><b>SHIPPER </b></span></td>
                <td colspan="4" class="cizgi orta baslik" style="width:600px;height:25px;"><b> CUSTOMER</b></td>
               
            </tr>

             <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=baslik[6] %> ANONİM ŞİRKETİ</b> </span></td>
                <td class="cizgi yaziboyutu" colspan="4" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[0] %></b></span></td>
               
            </tr>
                <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[1] %></b> </span></td>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><span class="kaydiryirmi"><b> <%=baslikdetay[1] %></b></span></td>
              
            </tr>
                <tr>
                <td colspan="4" class="cizgi yaziboyutu" style="height:15px;"><span class="kaydiryirmi"><b><%=firma[2] %></b></span></td>
                <td class="cizgi yaziboyutu" colspan="4" style="height:15px;"><span class="kaydiryirmi"><b> <%=baslikdetay[2] %></b></span></td>
               
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[7] %></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TAX ID:</b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b> <%=baslikdetay[3] %></b></td>
                   
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TEL NO:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="height:15px;"><b><%=firma[3]%></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"> <b> TEL NO:</b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><%=baslikdetay[4] %></b> </td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> TEL NO 2:</b></span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[4] %></b></td>
                 <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi"><b>FAX:</b></span></td>
                    <td class="cizgi yaziboyutu" colspan="4" style="height:15px;"><b><%=baslikdetay[5] %></b> </td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px; height:15px;"><span class="kaydiryirmi" ><b>FAX:</b> </span></td>
                <td class="cizgi yaziboyutu" colspan="2" style="width:400px;height:15px;"><b><%=firma[6] %></b> </td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi" ><b> MAIL</b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b> <%=baslikdetay[7] %></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> MAIL:</b></span></td>
                <td class="cizgi yaziboyutu" style="width:400px;height:15px;" colspan="2"><b><%=emailkonsimento %></b></td>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b> <%=baslikdetay[8] %></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span class="kaydiryirmi"><b> WEBSITE:</b></span></td>

                <td class="cizgi yaziboyutu" style="width:400px;height:15px;" colspan="2"><b><a href="https://www.nigtas.com/" style="color:black;text-decoration:none;"><%=firma[8] %></a></b></td>
               <td class="cizgi yaziboyutu" style="width:200px;height:15px;"><span><b style="font-size:11px;">RESPONSIBLE PERSON:</b></span></td>
                    <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b> <%=baslikdetay[5] %></b></td>
            </tr>
          
      <tr>
                <td colspan="8" class="cizgi sol baslik" style="height:25px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#staticBackdrop2">NOTIFIY</a> </b></span></td>
            </tr>
             <tr>
                <td colspan="8" class="cizgi sol baslik" style="height:25px;"><span class="kaydiryirmi"><b><a href="#" style="color:black;text-decoration:none" data-toggle="modal" data-target="#staticBackdrop2">NOTIFIY</a> </b></span></td>
            </tr>
           
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi"><b><%=notifiy[0] %></b></span></td>
            </tr>
        
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi"><b><%=notifiy[1] %></b></span></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi"><b><%=notifiy[2] %></b></span></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi" ><b><%=notifiy[8] %>:&nbsp;<%=notifiy[3] %></b> </span></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi"><b><%=notifiy[9] %>:&nbsp;<%=notifiy[4] %></b></span></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi"><b><%=notifiy[10] %>:&nbsp;<%=notifiy[5] %></b></span></td>

            </tr>
        <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi"><b><%=notifiy[11] %>:&nbsp;<%=notifiy[6] %></b></span></td>

            </tr>
       <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi"><b><%=notifiy[12] %>:&nbsp;<%=notifiy[7] %></b></span></td>

            </tr>
       <tr>
                <td class="cizgi yaziboyutu" style="height:15px;" colspan="8"><span class="kaydiryirmi"><b><%=notifiy[13] %>:&nbsp;<%=notifiy[14] %></b></span></td>

            </tr>
       <tr>
         <td colspan="8" class="baslik cizgi orta" style="height:30px;"><b><%=operation[8] %>&nbsp;OLARAK DUZENLENECEKTIR</b></td>
        </tr>    <tr>
                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>NO</b></span></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b> PRODUCT</b></td>
                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta baslik"><b>PACKAGE</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>FCL NO</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>PCS</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>NET WEIHT (KGS)</b></td>
                <td style="height: 50px; width: 100px;" class="cizgi orta baslik"><b>GROSS WEIGHT (KGS)</b></td>
            </tr>
                 <%
                     
                     int kolonsayisi = 1;
                     SqlCommand fcl1 = new SqlCommand("select COUNT(FCLNO) as Sayi, FCLNO from KonsimentoProduct where TeklifNo='" + Request.QueryString["teklifno"] + "' group by FCLNO", con);
                     SqlDataReader fcloku1 = fcl1.ExecuteReader();
                     while (fcloku1.Read())
                     {
                         if (Convert.ToInt32(fcloku1["Sayi"]) == 0)
                         {

                         }
                         else if (Convert.ToInt32(fcloku1["Sayi"]) == 1)
                         {%>
                             
                             <tr>
                                <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=kolonsayisi %></b></td>
                                 <%
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  where o.TeklifNo='"+Request.QueryString["teklifno"]+"' and k.FCLNO='"+fcloku1["FCLNO"].ToString()+"' group by k.FCLNO,o.UrunAnaGrup,o.Urun", con);
                             SqlDataReader urunoku = uruncek.ExecuteReader();
                             while (urunoku.Read())
                             {%>
                                         <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu"><b><%=urunoku["Aciklama"].ToString() %>&nbsp;<%=urunoku["Urun"].ToString() %></b></td>
                                    <%}
                             SqlCommand paketcek2 = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+o.TorbaTipi end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  where o.TeklifNo='"+Request.QueryString["teklifno"]+"' and k.FCLNO='"+fcloku1["FCLNO"].ToString()+"'  group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu", con);
                             SqlDataReader paketoku2 = paketcek2.ExecuteReader();
                             while (paketoku2.Read())
                             {%>
                                         <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"> <b><span><%=paketoku2["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku2["Torba"].ToString() %></span>&nbsp;<span><%=paketoku2["BigBag"].ToString() %></span>&nbsp;<%=paketoku2["Palet"].ToString()%>&nbsp;<%=paketoku2["Strec"].ToString() %></b></td>
                                    <%}
                                    paketoku2.Close();
                              %>
                               
                               
                                <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku1["FCLNO"].ToString() %></b> </td>
                                <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CAST(SUM(kp.KonteynerdakiTonaj/CAST(REPLACE(o.Palet,'YOK',0) as int))as int) as PALET  from KonsimentoProduct kp left outer join Orders o on kp.TeklifNo=o.TeklifNo and kp.MamulKodu=o.YediyuzluKod where kp.TeklifNo='" + Request.QueryString["teklifno"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' group by kp.FCLNO", con);
                                    SqlDataReader palettoku = palettcek.ExecuteReader();
                                    while (palettoku.Read())
                                    {%>
                                          <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"> <b><%=palettoku["PALET"].ToString() %></b></td>
                                    <%}
                             palettoku.Close();
                                    
                                %>
                                 <%
                             SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu where o.TeklifNo='"+Request.QueryString["teklifno"]+"' and k.FCLNO='"+fcloku1["FCLNO"].ToString()+"'", con);
                                    SqlDataReader PCSOKU = PCSCEK.ExecuteReader();
                                    while (PCSOKU.Read())
                                    {%>
                                         <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=PCSOKU["PCS"].ToString() %></b></td>
                                    <%}
                             PCSOKU.Close();
                                  %>
                                 <%
                             SqlCommand netbrutcek = new SqlCommand("select CAST(SUM(KonteynerdakiTonaj) as decimal(18,0)) as NET,CAST(SUM(KonteynerdakiTonaj)+600 as decimal(18,0)) as BRUT from KonsimentoProduct where TeklifNo='"+Request.QueryString["teklifno"]+"' and FCLNO='"+fcloku1["FCLNO"].ToString()+"'", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {%>
                                         
                                    <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=netbrutoku["NET"].ToString() %></b></td>
                                        <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%=netbrutoku["BRUT"].ToString() %></b></td>
                                     <%}
                             netbrutoku.Close();
                             kolonsayisi++;
                                  %>  
                                </tr>
                         <%       
                         }
                         else
                         {

                             string[] paletbilgisi = new string[1];
                             %>
    
                                <tr>
                                    <td class="cizgi orta yaziboyutu"><b><%=kolonsayisi %></b></td>
                                    <td style="height: 50px; width: 50px; text-align: center" class="cizgi orta yaziboyutu">
                                        <%
                             SqlCommand uruncek = new SqlCommand("select case when o.UrunAnaGrup='18.TALK' then 'TALC' when o.UrunAnaGrup='19.BARİT' then 'BARIUM SULFAT' when o.UrunAnaGrup='15.HİDROFİL' or o.UrunAnaGrup='16.HİDROFİL KAPLI' then 'CALCIUM OXIDE' when o.UrunAnaGrup='23.TİCARİ ÜRÜNLER' then case when o.Urun='PUMICE STONES' then 'PUMICE STONES' end else 'CALCIUM CARBONATE' end as Aciklama,o.Urun from Orders o left outer join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  where o.TeklifNo='" + Request.QueryString["teklifno"] + "' and k.FCLNO='" + fcloku1["FCLNO"].ToString() + "' group by k.FCLNO,o.UrunAnaGrup,o.Urun", con);
                             SqlDataReader urunoku = uruncek.ExecuteReader();
                             while (urunoku.Read())
                             {%>
                                                      <b><%=urunoku["Aciklama"].ToString() %>&nbsp;<%=urunoku["Urun"].ToString() %></b><br />
                                                 <%}
                             urunoku.Close();
                                            
                                        %>
                                    </td>
                                    <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu">
                                        <%
                                            
                            
                             SqlCommand paketcek3 = new SqlCommand("select  Case  when o.TorbaTipi='YOK' then '' when o.TorbaTipi <> 'YOK' then Convert(varchar, o.TorbaAgirligi)+' '+o.TorbaTipi end as Torba,case  when o.BBTipi='YOK' then '' when o.BBTipi <> 'YOK' then CONVERT(varchar,o.BBAgirligi)+' '+o.BBTipi end as BigBag, case when o.Palet='YOK' then '' when o.Palet <> 'YOK' then 'Pallettized'  end as Palet,'Streched' as Strec,Case when Palet <> 'YOK' then CAST(Palet as int) when Palet ='YOK' then CAST(BBAgirligi as int)     end as NET from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  where o.TeklifNo='"+Request.QueryString["teklifno"]+"' and k.FCLNO='"+fcloku1["FCLNO"].ToString()+"'  group by o.TorbaTipi,o.TorbaAgirligi,o.BBTipi,o.BBAgirligi,o.Palet,k.MamulKodu", con);
                                                 SqlDataReader paketoku3 = paketcek3.ExecuteReader();
                                                 while (paketoku3.Read())
                                                 {%>
                                         <b><span><%=paketoku3["NET"].ToString()+" KGS" %>&nbsp;</span><span><%=paketoku3["Torba"].ToString() %></span>&nbsp;<span><%=paketoku3["BigBag"].ToString() %></span>&nbsp;<%=paketoku3["Palet"].ToString()%>&nbsp;<%=paketoku3["Strec"].ToString() %></b><br />
                                    <%}
                             paketoku3.Close();  
                                         %>
                                    </td>
                                    <td style="height: 50px; width: 300px; text-align: center"  class="cizgi orta yaziboyutu"><b><%=fcloku1["FCLNO"].ToString() %></b> </td>
                                    <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu">
                                        <%
                             SqlCommand palettcek = new SqlCommand("select  kp.FCLNO,CAST(SUM(kp.KonteynerdakiTonaj/CAST(REPLACE(o.Palet,'YOK',0) as int))as int) as PALET  from KonsimentoProduct kp left outer join Orders o on kp.TeklifNo=o.TeklifNo and kp.MamulKodu=o.YediyuzluKod where kp.TeklifNo='" + Request.QueryString["teklifno"] + "' and kp.FCLNO='" + fcloku1["FCLNO"].ToString() + "' group by kp.FCLNO", con);
                                    SqlDataReader palettoku = palettcek.ExecuteReader();
                                    while (palettoku.Read())
                                    {%>
                                        <b><%=palettoku["PALET"].ToString() %></b><br />
                                    <%}
                             palettoku.Close();     
                                         %>
                                    </td>
                                    <td style="height: 50px; width: 100px;" class="cizgi orta yaziboyutu">
                                        <%
                                    SqlCommand PCSCEK = new SqlCommand("select distinct case when o.Palet <> 'YOK' then 'PALLETS' else 'NO PALLETS'   end  as PCS from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu where o.TeklifNo='"+Request.QueryString["teklifno"]+"' and k.FCLNO='"+fcloku1["FCLNO"].ToString()+"'", con);
                                    SqlDataReader PCSOKU = PCSCEK.ExecuteReader();
                                    while (PCSOKU.Read())
                                    {%>
                                        <b><%=PCSOKU["PCS"].ToString() %></b>
                                    <%}
                             PCSOKU.Close();     
                                         %>

                                    </td>
                                         <%
                             double[] netvebrut = new double[2];
                             netvebrut[0] = 0;
                             netvebrut[1] = 0;
                             SqlCommand netbrutcek = new SqlCommand("select  SUM(k.KonteynerdakiTonaj) as NET,case when Palet <> 'YOK' then 'PALETLI' end as BRUT from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu  where o.TeklifNo='"+Request.QueryString["teklifno"]+"' and k.FCLNO='"+fcloku1["FCLNO"].ToString()+"' group by o.Palet", con);
                                    SqlDataReader netbrutoku = netbrutcek.ExecuteReader();
                                    while (netbrutoku.Read())
                                    {
                                        netvebrut[0] = Convert.ToDouble(netbrutoku["NET"]) + netvebrut[0];
                                        %>
                                        
                             
                                    <%
                                 if (netbrutoku["BRUT"].ToString() == "PALETLI")
                                 {
                                     paletbilgisi[0] = "PALETLİ";
                                     //double brut = Convert.ToDouble(netbrutoku["NET"].ToString()) + 600;
                                     //netvebrut[1] = netvebrut[1] + brut;
                                             %>
                                                
                                             
                                         <%}
                                        
                                        
                                    %>
                            
                                     <%}
                                       
                                  
                             netbrutoku.Close();
                             kolonsayisi++;
                             if(paletbilgisi[0]=="PALETLİ")
                                 netvebrut[1] = netvebrut[0] + 600;
                                  %>

                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%= Convert.ToInt32(netvebrut[0]) %></b></td>
                                     <td style="height: 15px; width: 100px;" class="cizgi orta yaziboyutu"><b><%= Convert.ToInt32(netvebrut[1]) %></b></td>
                                </tr>
                         <%}
                     }
                     
                 %>  
                     
                 
             <%
                 for (int i = 1; i <= sayac; i++)
                 {%>
                     <tr>
                <td style="height: 15px; width: 50px; text-align: center"><span>&nbsp;</span></td>
                <td style="height: 15px; width: 600px; text-align: left">&nbsp;</td>
                <td style="height: 15px; width: 100px;">&nbsp;</td>
                <td style="height: 15px; width: 100px;">&nbsp;</td>
                <td style="height: 15px; width: 100px;">&nbsp;</td>
                <td style="height: 15px; width: 100px;">&nbsp;</td>
                <td style="height: 15px; width: 100px;">&nbsp;</td>
                <td style="height: 15px; width: 100px;">&nbsp;</td>
            </tr>
                <%}    
              %>
           
                    <%
                        int[] pallets = new int[1];
                        pallets[0] = 0;
                        double[] totaldegerler = new double[4];
                        totaldegerler[0] = 0;
                        SqlCommand pcek = new SqlCommand("select COUNT(distinct k.FCLNO), case when o.Palet='YOK' then 0 when Palet <> 'YOK' then COUNT(distinct k.FCLNO)*20    end as Palet from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu where o.TeklifNo='"+Request.QueryString["teklifno"]+"' group by o.Palet", con);
                        pcek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                        SqlDataReader pp = pcek.ExecuteReader();
                        while (pp.Read())
                        {
                            totaldegerler[0] = totaldegerler[0] + Convert.ToInt32(pp["Palet"]);
                        }
                        pp.Close();

                        SqlCommand netttotal = new SqlCommand("select ISNULL(SUM(k.KonteynerdakiTonaj),0) as NET  from Orders o inner join KonsimentoProduct k on o.YediyuzluKod=k.MamulKodu where o.TeklifNo='"+Request.QueryString["teklifno"]+"'", con);
                        totaldegerler[1] = Convert.ToDouble(netttotal.ExecuteScalar());
                        SqlCommand fclfarklı = new SqlCommand("select COUNT(FCLNO) as Sayi from KonsimentoProduct where TeklifNo='"+Request.QueryString["teklifno"]+"' group by FCLNO having COUNT(FCLNO)=1", con);
                        totaldegerler[2] = totaldegerler[1] + 600 + (Convert.ToDouble(fclfarklı.ExecuteScalar()) * 600);
                        SqlCommand paletlericek = new SqlCommand("select  COUNT(distinct k.FCLNO) as Sayi,k.FCLNO from KonsimentoProduct k inner join (select  Urun,YediyuzluKod  from Orders group by Urun,YediyuzluKod) as Ana on k.MamulKodu=Ana.YediyuzluKod where k.TeklifNo='"+Request.QueryString["teklifno"]+"' group by k.FCLNO", con);
                        SqlDataReader paletlerioku = paletlericek.ExecuteReader();
                        while(paletlerioku.Read())
                        {
                            pallets[0] = pallets[0] + (Convert.ToInt32(paletlerioku["Sayi"])*20);
                        }
                        paletlerioku.Close();
                     %>
    <tr>
                <td style="height: 25px; width: 50px; text-align: center" class="cizgi orta baslik"><span><b>TOTAL</b></span></td>
                <td style="height: 25px; width: 600px; text-align: center" colspan="2" class="cizgi orta baslik"><b>&nbsp;</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b>&nbsp;</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b><%=pallets[0]%></b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b>PALLETS</b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b><%=Convert.ToDouble(totaldegerler[1]) %></b></td>
                <td style="height: 25px; width: 100px;" class="cizgi orta baslik"><b><%=Convert.ToDouble(totaldegerler[2]) %></b></td>
            </tr>





<tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PACKAGE</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="7"><b><span>
                    <%
                        SqlCommand pakettipi4 = new SqlCommand("select Urun,Case  when TorbaTipi='YOK' then '' when TorbaTipi <> 'YOK' then Convert(varchar, TorbaAgirligi)+' '+TorbaTipi end as Torba ,case  when BBTipi='YOK' then '' when BBTipi <> 'YOK' then BBTipi end as BigBag, case when Palet='YOK' then '' when Palet <> 'YOK' then 'Pallettized'      end as Palet,'Streched'   as Strec,case when Palet <> 'YOK' then Palet when Palet ='YOK' then case when REPLACE(BBAgirligi,'YOK',0) <> 0 then BBAgirligi when BBAgirligi ='YOK' then '' end end as UniteAgirlik,case when Palet <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(Palet as int) when Palet='YOK' then case when BBTipi <> 'YOK' then CAST(SUM(buUrununSiparisTonaji*1000) as int)/CAST(BBAgirligi as int) when BBTipi ='YOK' then 0 end end as PaketSayisi   from Orders where TeklifNo=@p1 group by Urun,TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet", con);
                        pakettipi4.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                        SqlDataReader p4 = pakettipi4.ExecuteReader();
                        while (p4.Read())
                        {%>
                          <span><%=p4["Urun"].ToString() %>&nbsp;<%=p4["Torba"].ToString() %>&nbsp;<%=p4["UniteAgirlik"].ToString() %>KGS &nbsp;<%=p4["BigBag"].ToString() %>&nbsp;<%=p4["Palet"].ToString() %>&nbsp;<%=p4["Strec"].ToString() %>&nbsp;(<%=p4["PaketSayisi"].ToString() %> PCS)</span>  
                          <br />
                          
                      <%}
                 %>
                 </span></b></td>
            </tr>
            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">NO OF FCL</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span ><%=foot[7] %></span></b></td>
                <td class="cizgi yaziboyutu orta" style="height:15px;" colspan="3"><b><span class="kaydiryirmi">SPECIAL NOTE</span></b></td>
                
            </tr>
               <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">FREE TIME</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=operation[3] %></span></b></td>
                   <td class="cizgi yaziboyutu" style="vertical-align:top;word-break:break-all;" colspan="3" rowspan="4"><b><span><textarea readonly="readonly" class="yaziboyutu orta" rows="9" cols="9" style="background-color:none; background: transparent;overflow: auto;  border-color:none; width:100%;height:100%;padding-top:50%"><%=operation[12] %></textarea></span></b></td>
            </tr>

            <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">ORIGIN OF<br /><span class="kaydiryirmi" >GOODS</span> </span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span>TURKEY</span></b></td>
            </tr>
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PORT OF <br /><span class="kaydiryirmi" > LOADING</span></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[3] %> &nbsp;<%=foot[1] %></span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">PORT OF <br /><span class="kaydiryirmi" > DELIVERY</span></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[2] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi"><a href="#" style="text-decoration:none;color:black;" data-toggle="modal" data-target="#staticBackdrop">HS CODE</a></span></b></td>                       
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=operation[5] %></span></b></td>
                 <td class="cizgi yaziboyutu orta" colspan="3" rowspan="4"><b><span><asp:Image ID="img_yeri4" runat="server" /></span></b></td>

            </tr>
          
              <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">CMB</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=foot[15] %>"</span></b></td>
            </tr>
                <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">CLEAN ON<br /><span class="kaydiryirmi" > BOARD</span></span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span>FREIGHT &nbsp; <%=operation[6] %></span></b></td>
            </tr>
             <tr>
                <td class="cizgi yaziboyutu" style="height:15px;"><b><span class="kaydiryirmi">P.O</span></b></td>
              <td class="cizgi yaziboyutu" style="height:15px;" colspan="4"><b><span><%=operation[2] %></span></b></td>
            </tr>
               <tr>
                <td style="height:30px;" colspan="8"><b><span>&nbsp;</span></b></td>
            </tr>
        </table>

    </div>
    </div>
         <div style="text-align: left;height:10px;">
        <input type="button" value="PDF" onclick="printDiv('pdf')" style="background-color: orange; color: white; margin-left:580px; height:40px;" class="btn btn-warning" />
        
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